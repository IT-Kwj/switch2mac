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
    bool _114 = false;
    bool _112 = false;
    float _52 = in.m_40.x;
    float _54 = in.m_40.y;
    float2 _775 = float2(_52, _54);
    float _56 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_775, float2(0.0), isnan(_775))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_775, float2(0.0), isnan(_775))).x;
    float _58 = in.m_42.y;
    float _60 = -_56;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _58;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = -_64;
    bool _76 = _74 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _78 = !_72;
    uint _81 = uint(_78 ? 0 : 1);
    uint _83 = 2u;
    if (!_72)
    {
        _83 = 1u;
    }
    uint _85 = _83;
    uint _87 = _85;
    if (!_76)
    {
        _87 = _81;
    }
    uint _89 = _87;
    uint _91 = min(_89, 2u);
    int _94 = int(_91) << 2;
    float _96 = in.m_42.x;
    uint _98 = uint(int(uint(_94) >> uint(2)));
    uint _100 = uint(int(uint(int(_98)) >> uint(2)));
    int _102 = int(_98) & 3;
    float _104 = (*spvDescriptorSet0.fp_c1)._m0[int(_100)][_102];
    float _106 = _64 * _96;
    bool _108 = as_type<int>(_104) == 336;
    if (!_108)
    {
        bool _110 = as_type<int>(_104) == 608;
        _112 = _110;
        if (!_112)
        {
            _114 = true;
        }
    }
    float _148;
    float _150;
    float _152;
    float _154;
    if (!_112)
    {
        if (!_114)
        {
            float _116 = _66 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _118 = _66 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _120 = _66 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _122 = _66 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _124 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[0].x, _116);
            float _126 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[1].x, _118);
            float _128 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[2].x, _120);
            float _130 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[3].x, _122);
            float _132 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _124);
            float _134 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _126);
            float _136 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _128);
            float _138 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _130);
            float _140 = _132 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _142 = _134 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _144 = _136 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _146 = _138 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _148 = _146;
            _150 = _144;
            _152 = _142;
            _154 = _140;
        }
    }
    if ((false || _114) || _112)
    {
        if ((!_114) || _112)
        {
            _112 = false;
            float _156 = _66 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _158 = _66 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _160 = _66 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _162 = _66 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _164 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[4].x, _156);
            float _166 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[5].x, _158);
            float _168 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[6].x, _160);
            float _170 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[7].x, _162);
            float _172 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _164);
            float _174 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _166);
            float _176 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _168);
            float _178 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _170);
            float _180 = _172 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _182 = _174 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _184 = _176 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _186 = _178 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _148 = _186;
            _150 = _184;
            _152 = _182;
            _154 = _180;
        }
        if (false || _114)
        {
            _114 = false;
            float _188 = _66 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _190 = _66 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _192 = _66 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _194 = _66 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _196 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[8].x, _188);
            float _198 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[9].x, _190);
            float _200 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[10].x, _192);
            float _202 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[11].x, _194);
            float _204 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _196);
            float _206 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _198);
            float _208 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _200);
            float _210 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _202);
            float _212 = _204 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _214 = _206 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _216 = _208 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _218 = _210 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _148 = _218;
            _150 = _216;
            _152 = _214;
            _154 = _212;
        }
    }
    float _220 = _148;
    float _222 = _150;
    float _224 = _152;
    float _226 = _154;
    float _228 = float(int(_89));
    float _230 = 1.0 / _220;
    float _232 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _234 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _236 = rint(_228);
    float _238 = precise::max(_236, 0.0);
    uint _240 = uint(_238);
    uint _242 = clamp(_240, 0u, 65535u);
    float _244 = _230 * _222;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _230 * _224;
    float _250 = _230 * _226;
    float _252 = fma(_246, _232, _248);
    float _254 = fma(_246, _234, _250);
    float _256 = -_234;
    float _258 = fma(_246, _256, _250);
    float3 _1203 = float3(_250, _252, float(int(_242)));
    float3 _1207 = select(_1203, float3(0.0), isnan(_1203));
    float _260 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1207.xy, uint(rint(_1207.z)), _246);
    float3 _1216 = float3(_254, _252, float(int(_242)));
    float3 _1218 = select(_1216, float3(0.0), isnan(_1216));
    float _262 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1218.xy, uint(rint(_1218.z)), _246);
    float3 _1227 = float3(_258, _252, float(int(_242)));
    float3 _1229 = select(_1227, float3(0.0), isnan(_1227));
    float _264 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1229.xy, uint(rint(_1229.z)), _246);
    float3 _1238 = float3(_254, _248, float(int(_242)));
    float3 _1240 = select(_1238, float3(0.0), isnan(_1238));
    float _266 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1240.xy, uint(rint(_1240.z)), _246);
    float3 _1249 = float3(_250, _248, float(int(_242)));
    float3 _1251 = select(_1249, float3(0.0), isnan(_1249));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1251.xy, uint(rint(_1251.z)), _246);
    float3 _1260 = float3(_258, _248, float(int(_242)));
    float3 _1262 = select(_1260, float3(0.0), isnan(_1260));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1262.xy, uint(rint(_1262.z)), _246);
    float _272 = -_66;
    float _274 = _272 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _276 = -_106;
    float _278 = _276 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _280 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _282 = -_232;
    float _284 = fma(_246, _282, _248);
    float _286 = _274 * _274;
    float _288 = _66 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _290 = _66 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _292 = fma(_278, _278, _286);
    float _294 = -_64;
    float _296 = _294 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _298 = _66 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _300 = _66 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _302 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[24].x, _288);
    float _304 = fma(_296, _296, _292);
    float _306 = _66 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _308 = _66 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _310 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[22].x, _298);
    float _312 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[23].x, _300);
    float _314 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[19].x, _306);
    float _316 = sqrt(_304);
    float _318 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[20].x, _308);
    float _320 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _310);
    float _322 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _314);
    float _324 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _312);
    float _326 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _318);
    float _328 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[18].x, _290);
    float _330 = _322 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _332 = _66 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _334 = _326 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _336 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _302);
    float _338 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _328);
    float _340 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    bool _342 = _316 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _344 = _316 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _346 = !_342;
    int _348 = _346 ? 0 : 1;
    int _350 = 2;
    float _352 = _330;
    float _354 = _334;
    if (!_342)
    {
        _350 = 1;
    }
    int _356 = _350;
    int _358 = _356;
    if (!_344)
    {
        _358 = _348;
    }
    int _360 = _358;
    float _362 = float(_360);
    float _364 = precise::min(_362, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _366 = _364 != 1.0;
    bool _368 = isnan(_364);
    bool _370 = _366 || _368;
    bool _372 = isnan(1.0);
    bool _374 = _370 || _372;
    bool _376 = _364 != 0.0;
    bool _378 = isnan(_364);
    bool _380 = _376 || _378;
    bool _382 = isnan(0.0);
    bool _384 = _380 || _382;
    float _386 = rint(_364);
    float _388 = precise::max(_386, 0.0);
    uint _390 = uint(_388);
    uint _392 = clamp(_390, 0u, 65535u);
    if (_374)
    {
        float _394 = _320 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _352 = _394;
    }
    float _396 = _352;
    float _398 = _66 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _400 = _396;
    if (_374)
    {
        float _402 = _324 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _354 = _402;
    }
    float _404 = _354;
    float _406 = _66 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _408 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[21].x, _398);
    float _410 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[17].x, _406);
    float _412 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _408);
    float _414 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[16].x, _332);
    float _416 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _410);
    float _418 = _412 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _420 = _418;
    float _422 = _404;
    if (_374)
    {
        float _424 = _336 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _420 = _424;
    }
    float _426 = _420;
    float _428 = _426;
    if (!_384)
    {
        float _430 = _338 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _428 = _430;
    }
    float _432 = _428;
    float _434 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _414);
    if (!_384)
    {
        float _436 = _416 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _422 = _436;
    }
    float _438 = _422;
    float _440 = 0.0 + _432;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    if (!_384)
    {
        float _444 = _434 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _400 = _444;
    }
    float _446 = _400;
    float3 _1595 = float3(_254, _284, float(int(_242)));
    float3 _1597 = select(_1595, float3(0.0), isnan(_1595));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1597.xy, uint(rint(_1597.z)), _246);
    float _450 = fma(_442, _340, _438);
    float _452 = _262 + _260;
    float _454 = _452 + _264;
    float3 _1616 = float3(_250, _284, float(int(_242)));
    float3 _1618 = select(_1616, float3(0.0), isnan(_1616));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1618.xy, uint(rint(_1618.z)), _246);
    float3 _1627 = float3(_258, _284, float(int(_242)));
    float3 _1629 = select(_1627, float3(0.0), isnan(_1627));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1629.xy, uint(rint(_1629.z)), _246);
    float3 _1638 = float3(_446, _450, float(int(_392)));
    float3 _1640 = select(_1638, float3(0.0), isnan(_1638));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1640.xy, uint(rint(_1640.z)), _442);
    float _462 = _454 + _266;
    float _464 = -_280;
    float _466 = fma(_442, _464, _446);
    float3 _1658 = float3(_466, _450, float(int(_392)));
    float3 _1660 = select(_1658, float3(0.0), isnan(_1658));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1660.xy, uint(rint(_1660.z)), _442);
    float3 _1669 = float3(_446, _438, float(int(_392)));
    float3 _1671 = select(_1669, float3(0.0), isnan(_1669));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1671.xy, uint(rint(_1671.z)), _442);
    float _472 = _462 + _268;
    float _474 = -_340;
    float _476 = fma(_442, _474, _438);
    float _478 = _472 + _270;
    float _480 = fma(_442, _280, _446);
    float3 _1696 = float3(_480, _438, float(int(_392)));
    float3 _1698 = select(_1696, float3(0.0), isnan(_1696));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1698.xy, uint(rint(_1698.z)), _442);
    float3 _1707 = float3(_480, _450, float(int(_392)));
    float3 _1709 = select(_1707, float3(0.0), isnan(_1707));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1709.xy, uint(rint(_1709.z)), _442);
    float3 _1718 = float3(_466, _438, float(int(_392)));
    float3 _1720 = select(_1718, float3(0.0), isnan(_1718));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1720.xy, uint(rint(_1720.z)), _442);
    float3 _1729 = float3(_480, _476, float(int(_392)));
    float3 _1731 = select(_1729, float3(0.0), isnan(_1729));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1731.xy, uint(rint(_1731.z)), _442);
    float3 _1740 = float3(_446, _476, float(int(_392)));
    float3 _1742 = select(_1740, float3(0.0), isnan(_1740));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1742.xy, uint(rint(_1742.z)), _442);
    float3 _1751 = float3(_466, _476, float(int(_392)));
    float3 _1753 = select(_1751, float3(0.0), isnan(_1751));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1753.xy, uint(rint(_1753.z)), _442);
    float _494 = _66 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _496 = _66 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _498 = _66 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _500 = _66 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _502 = _66 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _504 = _66 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _506 = _66 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _508 = _66 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _510 = -_106;
    float _512 = _510 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _514 = _66 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _516 = -_66;
    float _518 = _516 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _520 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[27].x, _500);
    float _522 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[28].x, _498);
    float _524 = _518 * _518;
    float _526 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[29].x, _514);
    float _528 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[30].x, _494);
    float _530 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[31].x, _504);
    float _532 = fma(_512, _512, _524);
    float _534 = -_64;
    float _536 = _534 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _538 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[32].x, _506);
    float _540 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[33].x, _508);
    float _542 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _522);
    float _544 = fma(_536, _536, _532);
    float _546 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _526);
    float _548 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _528);
    float _550 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _530);
    float _552 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _538);
    float _554 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _540);
    float _556 = sqrt(_544);
    float _558 = _542 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _560 = _548 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _562 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[26].x, _502);
    float _564 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _520);
    float _566 = fma(_106, (*spvDescriptorSet0.fp_c3)._m0[25].x, _496);
    float _568 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _562);
    float _570 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _566);
    bool _572 = _556 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _574 = _556 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _576 = !_572;
    int _578 = _576 ? 0 : 1;
    int _580 = 2;
    float _582 = _558;
    float _584 = _560;
    if (!_572)
    {
        _580 = 1;
    }
    int _586 = _580;
    int _588 = _586;
    if (!_574)
    {
        _588 = _578;
    }
    int _590 = _588;
    float _592 = float(_590);
    float _594 = _546 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _596 = precise::min(_592, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _598 = _596 != 1.0;
    bool _600 = isnan(_596);
    bool _602 = _598 || _600;
    bool _604 = isnan(1.0);
    bool _606 = _602 || _604;
    float _608 = _594;
    if (_606)
    {
        float _610 = _550 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _582 = _610;
    }
    float _612 = _582;
    float _614 = _612;
    if (_606)
    {
        float _616 = _552 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _608 = _616;
    }
    float _618 = _608;
    float _620 = _618;
    if (_606)
    {
        float _622 = _554 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _584 = _622;
    }
    float _624 = _584;
    bool _626 = _596 != 0.0;
    bool _628 = isnan(_596);
    bool _630 = _626 || _628;
    bool _632 = isnan(0.0);
    bool _634 = _630 || _632;
    float _636 = rint(_596);
    float _638 = precise::max(_636, 0.0);
    uint _640 = uint(_638);
    uint _642 = clamp(_640, 0u, 65535u);
    float _644 = _624;
    if (!_634)
    {
        float _646 = _564 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _644 = _646;
    }
    float _648 = _644;
    if (!_634)
    {
        float _650 = _568 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _620 = _650;
    }
    float _652 = _620;
    if (!_634)
    {
        float _654 = _570 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _614 = _654;
    }
    float _656 = _614;
    float _658 = 0.0 + _648;
    float _660 = precise::clamp(_658, 0.0, 1.0);
    float _662 = fma(_340, _660, _652);
    float _664 = -_280;
    float _666 = fma(_664, _660, _656);
    float _668 = fma(_280, _660, _656);
    float3 _2082 = float3(_656, _662, float(int(_642)));
    float3 _2084 = select(_2082, float3(0.0), isnan(_2082));
    float _670 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2084.xy, uint(rint(_2084.z)), _660);
    float3 _2093 = float3(_666, _662, float(int(_642)));
    float3 _2095 = select(_2093, float3(0.0), isnan(_2093));
    float _672 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2095.xy, uint(rint(_2095.z)), _660);
    float3 _2104 = float3(_668, _662, float(int(_642)));
    float3 _2106 = select(_2104, float3(0.0), isnan(_2104));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2106.xy, uint(rint(_2106.z)), _660);
    float3 _2115 = float3(_668, _652, float(int(_642)));
    float3 _2117 = select(_2115, float3(0.0), isnan(_2115));
    float _676 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2117.xy, uint(rint(_2117.z)), _660);
    float3 _2126 = float3(_656, _652, float(int(_642)));
    float3 _2128 = select(_2126, float3(0.0), isnan(_2126));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2128.xy, uint(rint(_2128.z)), _660);
    float _680 = -_340;
    float _682 = fma(_680, _660, _652);
    float3 _2143 = float3(_666, _652, float(int(_642)));
    float3 _2145 = select(_2143, float3(0.0), isnan(_2143));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2145.xy, uint(rint(_2145.z)), _660);
    float3 _2154 = float3(_668, _682, float(int(_642)));
    float3 _2156 = select(_2154, float3(0.0), isnan(_2154));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2156.xy, uint(rint(_2156.z)), _660);
    float3 _2165 = float3(_656, _682, float(int(_642)));
    float3 _2167 = select(_2165, float3(0.0), isnan(_2165));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2167.xy, uint(rint(_2167.z)), _660);
    float3 _2176 = float3(_666, _682, float(int(_642)));
    float3 _2178 = select(_2176, float3(0.0), isnan(_2176));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2178.xy, uint(rint(_2178.z)), _660);
    float2 _2184 = float2(_52, _54);
    float _692 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2184, float2(0.0), isnan(_2184))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2184, float2(0.0), isnan(_2184))).x;
    float _694 = _478 + _448;
    float _696 = -_64;
    float _698 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _700 = _696 + _698;
    float _702 = -_64;
    float _704 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _706 = _702 + _704;
    float _708 = _700 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _710 = precise::clamp(_708, 0.0, 1.0);
    float _712 = _694 + _456;
    float _714 = _712 + _458;
    float _716 = _484 + _460;
    float _718 = _716 + _468;
    float _720 = _718 + _482;
    float _722 = _720 + _470;
    float _724 = _722 + _486;
    float _726 = _724 + _488;
    float _728 = _726 + _490;
    float _730 = fma(_714, 0.111111111938953399658203125, _710);
    float _732 = _728 + _492;
    float _734 = _732 * 0.111111111938953399658203125;
    float _736 = _674 + _670;
    float _738 = _736 + _672;
    float _740 = _738 + _676;
    float _742 = _740 + _678;
    float _744 = _742 + _684;
    float _746 = _744 + _686;
    float _748 = _746 + _688;
    float _750 = _748 + _690;
    float _752 = _750 * 0.111111111938953399658203125;
    float _754 = _752 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _756 = fma(_734, (*spvDescriptorSet0.fp_c3)._m0[49].z, _754);
    float _758 = _706 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _760 = precise::clamp(_758, 0.0, 1.0);
    float _762 = _756 + _760;
    out.m_45.x = _692;
    out.m_45.y = _730;
    out.m_45.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_45.w = _762;
    return out;
}

