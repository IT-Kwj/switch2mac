#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
}

struct _10
{
    uint _m0;
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d_array<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_ASmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_45 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _124 = false;
    bool _122 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _785 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_785, float2(0.0), isnan(_785))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_785, float2(0.0), isnan(_785))).x;
    float _58 = in.m_42.y;
    float _60 = -_56;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _58;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = -_64;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _78 = -_64;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _82 = !_72;
    int _85 = _82 ? 0 : 1;
    int _87 = 2;
    if (!_72)
    {
        _87 = 1;
    }
    int _89 = _87;
    int _91 = _89;
    if (!_76)
    {
        _91 = _85;
    }
    int _93 = _91;
    int _95 = _93 + 1;
    uint _98 = uint(_95);
    if (!_80)
    {
        _98 = uint(_93);
    }
    uint _100 = _98;
    uint _102 = min(_100, 2u);
    int _104 = int(_102) << 2;
    float _106 = in.m_42.x;
    uint _108 = uint(int(uint(_104) >> uint(2)));
    uint _110 = uint(int(uint(int(_108)) >> uint(2)));
    int _112 = int(_108) & 3;
    float _114 = (*spvDescriptorSet0.fp_c1)._m0[int(_110)][_112];
    float _116 = _64 * _106;
    bool _118 = as_type<int>(_114) == 384;
    if (!_118)
    {
        bool _120 = as_type<int>(_114) == 656;
        _122 = _120;
        if (!_122)
        {
            _124 = true;
        }
    }
    float _158;
    float _160;
    float _162;
    float _164;
    if (!_122)
    {
        if (!_124)
        {
            float _126 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _128 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _130 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _132 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _134 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[0].x, _126);
            float _136 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[1].x, _128);
            float _138 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[2].x, _130);
            float _140 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[3].x, _132);
            float _142 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _134);
            float _144 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _136);
            float _146 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _138);
            float _148 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _140);
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _158 = _156;
            _160 = _154;
            _162 = _152;
            _164 = _150;
        }
    }
    if ((false || _124) || _122)
    {
        if ((!_124) || _122)
        {
            _122 = false;
            float _166 = _66 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _168 = _66 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _170 = _66 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _172 = _66 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _174 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[4].x, _166);
            float _176 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[5].x, _168);
            float _178 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[6].x, _170);
            float _180 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[7].x, _172);
            float _182 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _174);
            float _184 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _176);
            float _186 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _178);
            float _188 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _180);
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _158 = _196;
            _160 = _194;
            _162 = _192;
            _164 = _190;
        }
        if (false || _124)
        {
            _124 = false;
            float _198 = _66 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _200 = _66 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _202 = _66 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _204 = _66 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _206 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[8].x, _198);
            float _208 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[9].x, _200);
            float _210 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[10].x, _202);
            float _212 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[11].x, _204);
            float _214 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _206);
            float _216 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _208);
            float _218 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _210);
            float _220 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _212);
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _158 = _228;
            _160 = _226;
            _162 = _224;
            _164 = _222;
        }
    }
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = float(int(_100));
    float _240 = 1.0 / _230;
    float _242 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _244 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _246 = rint(_238);
    float _248 = precise::max(_246, 0.0);
    uint _250 = uint(_248);
    uint _252 = clamp(_250, 0u, 65535u);
    float _254 = _240 * _232;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _240 * _234;
    float _260 = _240 * _236;
    float _262 = fma(_256, _242, _258);
    float _264 = fma(_256, _244, _260);
    float _266 = -_244;
    float _268 = fma(_256, _266, _260);
    float3 _1229 = float3(_260, _262, float(int(_252)));
    float3 _1233 = select(_1229, float3(0.0), isnan(_1229));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1233.xy, uint(rint(_1233.z)), _256);
    float3 _1242 = float3(_264, _262, float(int(_252)));
    float3 _1244 = select(_1242, float3(0.0), isnan(_1242));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1244.xy, uint(rint(_1244.z)), _256);
    float3 _1253 = float3(_268, _262, float(int(_252)));
    float3 _1255 = select(_1253, float3(0.0), isnan(_1253));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1255.xy, uint(rint(_1255.z)), _256);
    float3 _1264 = float3(_264, _258, float(int(_252)));
    float3 _1266 = select(_1264, float3(0.0), isnan(_1264));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1266.xy, uint(rint(_1266.z)), _256);
    float3 _1275 = float3(_260, _258, float(int(_252)));
    float3 _1277 = select(_1275, float3(0.0), isnan(_1275));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1277.xy, uint(rint(_1277.z)), _256);
    float3 _1286 = float3(_268, _258, float(int(_252)));
    float3 _1288 = select(_1286, float3(0.0), isnan(_1286));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1288.xy, uint(rint(_1288.z)), _256);
    float _282 = -_66;
    float _284 = _282 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _286 = -_116;
    float _288 = _286 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _290 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _292 = -_242;
    float _294 = fma(_256, _292, _258);
    float _296 = _284 * _284;
    float _298 = _66 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _300 = _66 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _302 = fma(_288, _288, _296);
    float _304 = -_64;
    float _306 = _304 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _308 = _66 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _310 = _66 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _312 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[24].x, _298);
    float _314 = fma(_306, _306, _302);
    float _316 = _66 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _318 = _66 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _320 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[22].x, _308);
    float _322 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[23].x, _310);
    float _324 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[19].x, _316);
    float _326 = sqrt(_314);
    float _328 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[20].x, _318);
    float _330 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _320);
    float _332 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _324);
    float _334 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _322);
    float _336 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _328);
    float _338 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[18].x, _300);
    float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _342 = _66 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _346 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _312);
    float _348 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _338);
    float _350 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _352 = _326 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _354 = _326 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _356 = !_352;
    int _358 = _356 ? 0 : 1;
    int _360 = 2;
    float _362 = _340;
    float _364 = _344;
    if (!_352)
    {
        _360 = 1;
    }
    int _366 = _360;
    int _368 = _366;
    if (!_354)
    {
        _368 = _358;
    }
    int _370 = _368;
    float _372 = float(_370);
    float _374 = precise::min(_372, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _376 = _374 != 1.0;
    bool _378 = isnan(_374);
    bool _380 = _376 || _378;
    bool _382 = isnan(1.0);
    bool _384 = _380 || _382;
    bool _386 = _374 != 0.0;
    bool _388 = isnan(_374);
    bool _390 = _386 || _388;
    bool _392 = isnan(0.0);
    bool _394 = _390 || _392;
    float _396 = rint(_374);
    float _398 = precise::max(_396, 0.0);
    uint _400 = uint(_398);
    uint _402 = clamp(_400, 0u, 65535u);
    if (_384)
    {
        float _404 = _330 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _362 = _404;
    }
    float _406 = _362;
    float _408 = _66 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _410 = _406;
    if (_384)
    {
        float _412 = _334 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _364 = _412;
    }
    float _414 = _364;
    float _416 = _66 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _418 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[21].x, _408);
    float _420 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[17].x, _416);
    float _422 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _418);
    float _424 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[16].x, _342);
    float _426 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _420);
    float _428 = _422 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _430 = _428;
    float _432 = _414;
    if (_384)
    {
        float _434 = _346 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _430 = _434;
    }
    float _436 = _430;
    float _438 = _436;
    if (!_394)
    {
        float _440 = _348 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _438 = _440;
    }
    float _442 = _438;
    float _444 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _424);
    if (!_394)
    {
        float _446 = _426 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _432 = _446;
    }
    float _448 = _432;
    float _450 = 0.0 + _442;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    if (!_394)
    {
        float _454 = _444 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _410 = _454;
    }
    float _456 = _410;
    float3 _1621 = float3(_264, _294, float(int(_252)));
    float3 _1623 = select(_1621, float3(0.0), isnan(_1621));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1623.xy, uint(rint(_1623.z)), _256);
    float _460 = fma(_452, _350, _448);
    float _462 = _272 + _270;
    float _464 = _462 + _274;
    float3 _1642 = float3(_260, _294, float(int(_252)));
    float3 _1644 = select(_1642, float3(0.0), isnan(_1642));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1644.xy, uint(rint(_1644.z)), _256);
    float3 _1653 = float3(_268, _294, float(int(_252)));
    float3 _1655 = select(_1653, float3(0.0), isnan(_1653));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1655.xy, uint(rint(_1655.z)), _256);
    float3 _1664 = float3(_456, _460, float(int(_402)));
    float3 _1666 = select(_1664, float3(0.0), isnan(_1664));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1666.xy, uint(rint(_1666.z)), _452);
    float _472 = _464 + _276;
    float _474 = -_290;
    float _476 = fma(_452, _474, _456);
    float3 _1684 = float3(_476, _460, float(int(_402)));
    float3 _1686 = select(_1684, float3(0.0), isnan(_1684));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1686.xy, uint(rint(_1686.z)), _452);
    float3 _1695 = float3(_456, _448, float(int(_402)));
    float3 _1697 = select(_1695, float3(0.0), isnan(_1695));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1697.xy, uint(rint(_1697.z)), _452);
    float _482 = _472 + _278;
    float _484 = -_350;
    float _486 = fma(_452, _484, _448);
    float _488 = _482 + _280;
    float _490 = fma(_452, _290, _456);
    float3 _1722 = float3(_490, _448, float(int(_402)));
    float3 _1724 = select(_1722, float3(0.0), isnan(_1722));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1724.xy, uint(rint(_1724.z)), _452);
    float3 _1733 = float3(_490, _460, float(int(_402)));
    float3 _1735 = select(_1733, float3(0.0), isnan(_1733));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1735.xy, uint(rint(_1735.z)), _452);
    float3 _1744 = float3(_476, _448, float(int(_402)));
    float3 _1746 = select(_1744, float3(0.0), isnan(_1744));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1746.xy, uint(rint(_1746.z)), _452);
    float3 _1755 = float3(_490, _486, float(int(_402)));
    float3 _1757 = select(_1755, float3(0.0), isnan(_1755));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1757.xy, uint(rint(_1757.z)), _452);
    float3 _1766 = float3(_456, _486, float(int(_402)));
    float3 _1768 = select(_1766, float3(0.0), isnan(_1766));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1768.xy, uint(rint(_1768.z)), _452);
    float3 _1777 = float3(_476, _486, float(int(_402)));
    float3 _1779 = select(_1777, float3(0.0), isnan(_1777));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1779.xy, uint(rint(_1779.z)), _452);
    float _504 = _66 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _506 = _66 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _508 = _66 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _510 = _66 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _512 = _66 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _514 = _66 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _516 = _66 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _518 = _66 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _520 = -_116;
    float _522 = _520 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _524 = _66 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _526 = -_66;
    float _528 = _526 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _530 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[27].x, _510);
    float _532 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[28].x, _508);
    float _534 = _528 * _528;
    float _536 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[29].x, _524);
    float _538 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[30].x, _504);
    float _540 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[31].x, _514);
    float _542 = fma(_522, _522, _534);
    float _544 = -_64;
    float _546 = _544 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _548 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[32].x, _516);
    float _550 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[33].x, _518);
    float _552 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _532);
    float _554 = fma(_546, _546, _542);
    float _556 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _536);
    float _558 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _538);
    float _560 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _540);
    float _562 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _548);
    float _564 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _550);
    float _566 = sqrt(_554);
    float _568 = _552 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _570 = _558 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _572 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[26].x, _512);
    float _574 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _530);
    float _576 = fma(_116, (*spvDescriptorSet0.fp_c3)._m0[25].x, _506);
    float _578 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _572);
    float _580 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _576);
    bool _582 = _566 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _584 = _566 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _586 = !_582;
    int _588 = _586 ? 0 : 1;
    int _590 = 2;
    float _592 = _568;
    float _594 = _570;
    if (!_582)
    {
        _590 = 1;
    }
    int _596 = _590;
    int _598 = _596;
    if (!_584)
    {
        _598 = _588;
    }
    int _600 = _598;
    float _602 = float(_600);
    float _604 = _556 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _606 = precise::min(_602, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _608 = _606 != 1.0;
    bool _610 = isnan(_606);
    bool _612 = _608 || _610;
    bool _614 = isnan(1.0);
    bool _616 = _612 || _614;
    float _618 = _604;
    if (_616)
    {
        float _620 = _560 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _592 = _620;
    }
    float _622 = _592;
    float _624 = _622;
    if (_616)
    {
        float _626 = _562 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _618 = _626;
    }
    float _628 = _618;
    float _630 = _628;
    if (_616)
    {
        float _632 = _564 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _594 = _632;
    }
    float _634 = _594;
    bool _636 = _606 != 0.0;
    bool _638 = isnan(_606);
    bool _640 = _636 || _638;
    bool _642 = isnan(0.0);
    bool _644 = _640 || _642;
    float _646 = rint(_606);
    float _648 = precise::max(_646, 0.0);
    uint _650 = uint(_648);
    uint _652 = clamp(_650, 0u, 65535u);
    float _654 = _634;
    if (!_644)
    {
        float _656 = _574 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _654 = _656;
    }
    float _658 = _654;
    if (!_644)
    {
        float _660 = _578 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _630 = _660;
    }
    float _662 = _630;
    if (!_644)
    {
        float _664 = _580 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _624 = _664;
    }
    float _666 = _624;
    float _668 = 0.0 + _658;
    float _670 = precise::clamp(_668, 0.0, 1.0);
    float _672 = fma(_350, _670, _662);
    float _674 = -_290;
    float _676 = fma(_674, _670, _666);
    float _678 = fma(_290, _670, _666);
    float3 _2108 = float3(_666, _672, float(int(_652)));
    float3 _2110 = select(_2108, float3(0.0), isnan(_2108));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2110.xy, uint(rint(_2110.z)), _670);
    float3 _2119 = float3(_676, _672, float(int(_652)));
    float3 _2121 = select(_2119, float3(0.0), isnan(_2119));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2121.xy, uint(rint(_2121.z)), _670);
    float3 _2130 = float3(_678, _672, float(int(_652)));
    float3 _2132 = select(_2130, float3(0.0), isnan(_2130));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2132.xy, uint(rint(_2132.z)), _670);
    float3 _2141 = float3(_678, _662, float(int(_652)));
    float3 _2143 = select(_2141, float3(0.0), isnan(_2141));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2143.xy, uint(rint(_2143.z)), _670);
    float3 _2152 = float3(_666, _662, float(int(_652)));
    float3 _2154 = select(_2152, float3(0.0), isnan(_2152));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2154.xy, uint(rint(_2154.z)), _670);
    float _690 = -_350;
    float _692 = fma(_690, _670, _662);
    float3 _2169 = float3(_676, _662, float(int(_652)));
    float3 _2171 = select(_2169, float3(0.0), isnan(_2169));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2171.xy, uint(rint(_2171.z)), _670);
    float3 _2180 = float3(_678, _692, float(int(_652)));
    float3 _2182 = select(_2180, float3(0.0), isnan(_2180));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2182.xy, uint(rint(_2182.z)), _670);
    float3 _2191 = float3(_666, _692, float(int(_652)));
    float3 _2193 = select(_2191, float3(0.0), isnan(_2191));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2193.xy, uint(rint(_2193.z)), _670);
    float3 _2202 = float3(_676, _692, float(int(_652)));
    float3 _2204 = select(_2202, float3(0.0), isnan(_2202));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2204.xy, uint(rint(_2204.z)), _670);
    float2 _2210 = float2(_52, _54);
    float _702 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2210, float2(0.0), isnan(_2210))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2210, float2(0.0), isnan(_2210))).x;
    float _704 = _488 + _458;
    float _706 = -_64;
    float _708 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _710 = _706 + _708;
    float _712 = -_64;
    float _714 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _716 = _712 + _714;
    float _718 = _710 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = _704 + _466;
    float _724 = _722 + _468;
    float _726 = _494 + _470;
    float _728 = _726 + _478;
    float _730 = _728 + _492;
    float _732 = _730 + _480;
    float _734 = _732 + _496;
    float _736 = _734 + _498;
    float _738 = _736 + _500;
    float _740 = fma(_724, 0.111111111938953399658203125, _720);
    float _742 = _738 + _502;
    float _744 = _742 * 0.111111111938953399658203125;
    float _746 = _684 + _680;
    float _748 = _746 + _682;
    float _750 = _748 + _686;
    float _752 = _750 + _688;
    float _754 = _752 + _694;
    float _756 = _754 + _696;
    float _758 = _756 + _698;
    float _760 = _758 + _700;
    float _762 = _760 * 0.111111111938953399658203125;
    float _764 = _762 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _766 = fma(_744, (*spvDescriptorSet0.fp_c3)._m0[49].z, _764);
    float _768 = _716 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _770 = precise::clamp(_768, 0.0, 1.0);
    float _772 = _766 + _770;
    out.m_45.x = _702;
    out.m_45.y = _740;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _772;
    return out;
}

