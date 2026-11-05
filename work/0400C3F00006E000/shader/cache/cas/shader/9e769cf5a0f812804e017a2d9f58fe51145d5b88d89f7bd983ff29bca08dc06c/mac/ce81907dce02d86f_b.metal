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
    texture2d_array<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_38 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _122 = false;
    bool _120 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _781 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_781, float2(0.0), isnan(_781))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_781, float2(0.0), isnan(_781))).x;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float _60 = -_54;
    float _62 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _64 = fma(_60, (*spvDescriptorSet0.fp_c3)._m0[46].z, _62);
    float _66 = _64 * _56;
    float _68 = -_64;
    bool _72 = _68 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _74 = _64 * _58;
    float _76 = -_64;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _80 = -_64;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _84 = !_72;
    int _87 = _84 ? 0 : 1;
    int _89 = 2;
    if (!_72)
    {
        _89 = 1;
    }
    int _91 = _89;
    int _93 = _91;
    if (!_78)
    {
        _93 = _87;
    }
    int _95 = _93;
    int _97 = _95 + 1;
    uint _100 = uint(_97);
    if (!_82)
    {
        _100 = uint(_95);
    }
    uint _102 = _100;
    uint _104 = min(_102, 2u);
    int _106 = int(_104) << 2;
    uint _108 = uint(int(uint(_106) >> uint(2)));
    uint _110 = uint(int(uint(int(_108)) >> uint(2)));
    int _112 = int(_108) & 3;
    float _114 = (*spvDescriptorSet0.fp_c1)._m0[int(_110)][_112];
    bool _116 = as_type<int>(_114) == 384;
    if (!_116)
    {
        bool _118 = as_type<int>(_114) == 656;
        _120 = _118;
        if (!_120)
        {
            _122 = true;
        }
    }
    float _156;
    float _158;
    float _160;
    float _162;
    if (!_120)
    {
        if (!_122)
        {
            float _124 = _74 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _126 = _74 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _128 = _74 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _130 = _74 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _132 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].x, _124);
            float _134 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].x, _126);
            float _136 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].x, _128);
            float _138 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].x, _130);
            float _140 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[0].z, _132);
            float _142 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[1].z, _134);
            float _144 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[2].z, _136);
            float _146 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[3].z, _138);
            float _148 = _140 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _150 = _142 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _156 = _154;
            _158 = _150;
            _160 = _152;
            _162 = _148;
        }
    }
    if ((false || _122) || _120)
    {
        if ((!_122) || _120)
        {
            _120 = false;
            float _164 = _74 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _166 = _74 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _168 = _74 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _170 = _74 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _172 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, _164);
            float _174 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].x, _166);
            float _176 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].x, _168);
            float _178 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].x, _170);
            float _180 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[4].z, _172);
            float _182 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[5].z, _174);
            float _184 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[6].z, _176);
            float _186 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[7].z, _178);
            float _188 = _180 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _190 = _182 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _156 = _194;
            _158 = _190;
            _160 = _192;
            _162 = _188;
        }
        if (false || _122)
        {
            _122 = false;
            float _196 = _74 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _198 = _74 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _200 = _74 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _202 = _74 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _204 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].x, _196);
            float _206 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].x, _198);
            float _208 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].x, _200);
            float _210 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].x, _202);
            float _212 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[8].z, _204);
            float _214 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[9].z, _206);
            float _216 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].z, _208);
            float _218 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[11].z, _210);
            float _220 = _212 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _222 = _214 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _156 = _226;
            _158 = _222;
            _160 = _224;
            _162 = _220;
        }
    }
    float _228 = _156;
    float _230 = _158;
    float _232 = _160;
    float _234 = _162;
    float _236 = float(int(_102));
    float _238 = 1.0 / _228;
    float _240 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _242 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _244 = rint(_236);
    float _246 = precise::max(_244, 0.0);
    uint _248 = uint(_246);
    uint _250 = clamp(_248, 0u, 65535u);
    float _252 = _238 * _230;
    float _254 = _238 * _232;
    float _256 = precise::clamp(_254, 0.0, 1.0);
    float _258 = _238 * _234;
    float _260 = fma(_256, _240, _252);
    float _262 = fma(_256, _242, _258);
    float _264 = -_242;
    float _266 = fma(_256, _264, _258);
    float3 _1225 = float3(_258, _260, float(int(_250)));
    float3 _1229 = select(_1225, float3(0.0), isnan(_1225));
    float _268 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1229.xy, uint(rint(_1229.z)), _256);
    float3 _1238 = float3(_262, _260, float(int(_250)));
    float3 _1240 = select(_1238, float3(0.0), isnan(_1238));
    float _270 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1240.xy, uint(rint(_1240.z)), _256);
    float3 _1249 = float3(_266, _260, float(int(_250)));
    float3 _1251 = select(_1249, float3(0.0), isnan(_1249));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1251.xy, uint(rint(_1251.z)), _256);
    float _274 = -_240;
    float _276 = fma(_256, _274, _252);
    float3 _1266 = float3(_262, _252, float(int(_250)));
    float3 _1268 = select(_1266, float3(0.0), isnan(_1266));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1268.xy, uint(rint(_1268.z)), _256);
    float3 _1277 = float3(_258, _252, float(int(_250)));
    float3 _1279 = select(_1277, float3(0.0), isnan(_1277));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1279.xy, uint(rint(_1279.z)), _256);
    float3 _1288 = float3(_266, _252, float(int(_250)));
    float3 _1290 = select(_1288, float3(0.0), isnan(_1288));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1290.xy, uint(rint(_1290.z)), _256);
    float3 _1299 = float3(_262, _276, float(int(_250)));
    float3 _1301 = select(_1299, float3(0.0), isnan(_1299));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1301.xy, uint(rint(_1301.z)), _256);
    float _286 = -_74;
    float _288 = _286 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _290 = -_66;
    float _292 = _290 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _294 = _74 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _296 = _288 * _288;
    float _298 = fma(_292, _292, _296);
    float _300 = -_64;
    float _302 = _300 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _304 = fma(_302, _302, _298);
    float _306 = sqrt(_304);
    float _308 = _74 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _310 = _306 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _312 = _306 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _314 = !_310;
    int _316 = _314 ? 0 : 1;
    int _318 = 2;
    if (!_310)
    {
        _318 = 1;
    }
    int _320 = _318;
    int _322 = _320;
    if (!_312)
    {
        _322 = _316;
    }
    int _324 = _322;
    float _326 = _74 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _328 = _74 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _330 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].x, _294);
    float _332 = float(_324);
    float _334 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].x, _326);
    float _336 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].x, _328);
    float _338 = _74 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _340 = precise::min(_332, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _342 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[21].z, _334);
    float _344 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].x, _308);
    float _346 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[19].z, _336);
    bool _348 = _340 != 1.0;
    bool _350 = isnan(_340);
    bool _352 = _348 || _350;
    bool _354 = isnan(1.0);
    bool _356 = _352 || _354;
    float _358 = _74 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _360 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[22].z, _330);
    float _362 = _342 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _364 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].x, _338);
    float _366 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[24].z, _344);
    float _368 = _346 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _370 = _340 != 0.0;
    bool _372 = isnan(_340);
    bool _374 = _370 || _372;
    bool _376 = isnan(0.0);
    bool _378 = _374 || _376;
    float _380 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].x, _358);
    float _382 = _74 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _384 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[20].z, _364);
    float _386 = _74 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _388 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[23].z, _380);
    float _390 = _362;
    float _392 = _368;
    if (_356)
    {
        float _394 = _366 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _390 = _394;
    }
    float _396 = _390;
    float _398 = _396;
    if (_356)
    {
        float _400 = _360 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _392 = _400;
    }
    float _402 = _392;
    float _404 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].x, _382);
    float _406 = rint(_340);
    float _408 = precise::max(_406, 0.0);
    uint _410 = uint(_408);
    uint _412 = clamp(_410, 0u, 65535u);
    float _414 = _74 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _416 = _384 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _418 = _416;
    float _420 = _402;
    if (_356)
    {
        float _422 = _388 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _418 = _422;
    }
    float _424 = _418;
    float _426 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].x, _386);
    float _428 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[18].z, _404);
    float _430 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].x, _414);
    float _432 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _434 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[17].z, _426);
    float _436 = _424;
    if (!_378)
    {
        float _438 = _428 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _398 = _438;
    }
    float _440 = _398;
    float _442 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[16].z, _430);
    float _444 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    if (!_378)
    {
        float _446 = _434 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _436 = _446;
    }
    float _448 = _436;
    float _450 = 0.0 + _440;
    float _452 = precise::clamp(_450, 0.0, 1.0);
    if (!_378)
    {
        float _454 = _442 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _420 = _454;
    }
    float _456 = _420;
    float _458 = fma(_452, _444, _448);
    float _460 = -_432;
    float _462 = fma(_452, _460, _456);
    float _464 = fma(_452, _432, _456);
    float _466 = _270 + _268;
    float3 _1645 = float3(_258, _276, float(int(_250)));
    float3 _1647 = select(_1645, float3(0.0), isnan(_1645));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1647.xy, uint(rint(_1647.z)), _256);
    float3 _1656 = float3(_266, _276, float(int(_250)));
    float3 _1658 = select(_1656, float3(0.0), isnan(_1656));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1658.xy, uint(rint(_1658.z)), _256);
    float3 _1667 = float3(_456, _458, float(int(_412)));
    float3 _1669 = select(_1667, float3(0.0), isnan(_1667));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1669.xy, uint(rint(_1669.z)), _452);
    float _474 = _466 + _272;
    float3 _1681 = float3(_462, _458, float(int(_412)));
    float3 _1683 = select(_1681, float3(0.0), isnan(_1681));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1683.xy, uint(rint(_1683.z)), _452);
    float3 _1692 = float3(_464, _448, float(int(_412)));
    float3 _1694 = select(_1692, float3(0.0), isnan(_1692));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1694.xy, uint(rint(_1694.z)), _452);
    float3 _1703 = float3(_464, _458, float(int(_412)));
    float3 _1705 = select(_1703, float3(0.0), isnan(_1703));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1705.xy, uint(rint(_1705.z)), _452);
    float _482 = _474 + _278;
    float _484 = -_444;
    float _486 = fma(_452, _484, _448);
    float _488 = _482 + _280;
    float _490 = _488 + _282;
    float _492 = _490 + _284;
    float3 _1732 = float3(_456, _448, float(int(_412)));
    float3 _1734 = select(_1732, float3(0.0), isnan(_1732));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1734.xy, uint(rint(_1734.z)), _452);
    float3 _1743 = float3(_462, _448, float(int(_412)));
    float3 _1745 = select(_1743, float3(0.0), isnan(_1743));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1745.xy, uint(rint(_1745.z)), _452);
    float3 _1754 = float3(_464, _486, float(int(_412)));
    float3 _1756 = select(_1754, float3(0.0), isnan(_1754));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1756.xy, uint(rint(_1756.z)), _452);
    float3 _1765 = float3(_456, _486, float(int(_412)));
    float3 _1767 = select(_1765, float3(0.0), isnan(_1765));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1767.xy, uint(rint(_1767.z)), _452);
    float _502 = _74 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _504 = _74 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _506 = _74 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _508 = _74 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _510 = _74 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _512 = _74 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _514 = _74 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _516 = _74 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _518 = _74 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _520 = -_74;
    float _522 = _520 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _524 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].x, _506);
    float _526 = -_66;
    float _528 = _526 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _530 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].x, _502);
    float _532 = _522 * _522;
    float _534 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].x, _504);
    float _536 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].x, _518);
    float _538 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].x, _512);
    float _540 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].x, _510);
    float _542 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].x, _514);
    float _544 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].x, _516);
    float _546 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].x, _508);
    float _548 = fma(_528, _528, _532);
    float _550 = -_64;
    float _552 = _550 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _554 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[28].z, _536);
    float _556 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[29].z, _538);
    float _558 = fma(_552, _552, _548);
    float _560 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[30].z, _540);
    float _562 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[31].z, _542);
    float _564 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[32].z, _544);
    float _566 = _556 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _568 = _560 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _570 = sqrt(_558);
    float _572 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[27].z, _524);
    float _574 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[26].z, _534);
    float _576 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[25].z, _530);
    bool _578 = _570 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _580 = _570 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _582 = !_578;
    int _584 = _582 ? 0 : 1;
    int _586 = 2;
    float _588 = _566;
    float _590 = _568;
    if (!_578)
    {
        _586 = 1;
    }
    int _592 = _586;
    int _594 = _592;
    if (!_580)
    {
        _594 = _584;
    }
    int _596 = _594;
    float _598 = float(_596);
    float _600 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[33].z, _546);
    float _602 = _554 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _604 = precise::min(_598, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _606 = _604 != 1.0;
    bool _608 = isnan(_604);
    bool _610 = _606 || _608;
    bool _612 = isnan(1.0);
    bool _614 = _610 || _612;
    float _616 = _602;
    if (_614)
    {
        float _618 = _562 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _616 = _618;
    }
    float _620 = _616;
    float _622 = _620;
    if (_614)
    {
        float _624 = _564 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _588 = _624;
    }
    float _626 = _588;
    float _628 = _626;
    if (_614)
    {
        float _630 = _600 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _590 = _630;
    }
    float _632 = _590;
    bool _634 = _604 != 0.0;
    bool _636 = isnan(_604);
    bool _638 = _634 || _636;
    bool _640 = isnan(0.0);
    bool _642 = _638 || _640;
    float _644 = rint(_604);
    float _646 = precise::max(_644, 0.0);
    uint _648 = uint(_646);
    uint _650 = clamp(_648, 0u, 65535u);
    float _652 = _632;
    if (!_642)
    {
        float _654 = _572 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _652 = _654;
    }
    float _656 = _652;
    if (!_642)
    {
        float _658 = _574 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _628 = _658;
    }
    float _660 = _628;
    if (!_642)
    {
        float _662 = _576 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _622 = _662;
    }
    float _664 = _622;
    float _666 = 0.0 + _656;
    float _668 = precise::clamp(_666, 0.0, 1.0);
    float _670 = fma(_444, _668, _660);
    float _672 = fma(_432, _668, _664);
    float3 _2090 = float3(_462, _486, float(int(_412)));
    float3 _2092 = select(_2090, float3(0.0), isnan(_2090));
    float _674 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2092.xy, uint(rint(_2092.z)), _452);
    float _676 = -_432;
    float _678 = fma(_676, _668, _664);
    float3 _2107 = float3(_664, _670, float(int(_650)));
    float3 _2109 = select(_2107, float3(0.0), isnan(_2107));
    float _680 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2109.xy, uint(rint(_2109.z)), _668);
    float3 _2118 = float3(_672, _670, float(int(_650)));
    float3 _2120 = select(_2118, float3(0.0), isnan(_2118));
    float _682 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2120.xy, uint(rint(_2120.z)), _668);
    float3 _2129 = float3(_678, _670, float(int(_650)));
    float3 _2131 = select(_2129, float3(0.0), isnan(_2129));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2131.xy, uint(rint(_2131.z)), _668);
    float3 _2140 = float3(_672, _660, float(int(_650)));
    float3 _2142 = select(_2140, float3(0.0), isnan(_2140));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2142.xy, uint(rint(_2142.z)), _668);
    float _688 = -_444;
    float _690 = fma(_688, _668, _660);
    float3 _2157 = float3(_664, _660, float(int(_650)));
    float3 _2159 = select(_2157, float3(0.0), isnan(_2157));
    float _692 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2159.xy, uint(rint(_2159.z)), _668);
    float3 _2168 = float3(_678, _660, float(int(_650)));
    float3 _2170 = select(_2168, float3(0.0), isnan(_2168));
    float _694 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2170.xy, uint(rint(_2170.z)), _668);
    float3 _2179 = float3(_672, _690, float(int(_650)));
    float3 _2181 = select(_2179, float3(0.0), isnan(_2179));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2181.xy, uint(rint(_2181.z)), _668);
    float3 _2190 = float3(_664, _690, float(int(_650)));
    float3 _2192 = select(_2190, float3(0.0), isnan(_2190));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2192.xy, uint(rint(_2192.z)), _668);
    float3 _2201 = float3(_678, _690, float(int(_650)));
    float3 _2203 = select(_2201, float3(0.0), isnan(_2201));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2203.xy, uint(rint(_2203.z)), _668);
    float _702 = _492 + _468;
    float _704 = _702 + _470;
    float _706 = -_64;
    float _708 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _710 = _706 + _708;
    float _712 = _480 + _472;
    float _714 = _710 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _716 = precise::clamp(_714, 0.0, 1.0);
    float _718 = _712 + _476;
    float _720 = fma(_704, 0.111111111938953399658203125, _716);
    float _722 = -_64;
    float _724 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _726 = _722 + _724;
    float _728 = _718 + _478;
    float _730 = _726 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _732 = precise::clamp(_730, 0.0, 1.0);
    float _734 = _728 + _494;
    float _736 = _734 + _496;
    float _738 = _736 + _498;
    float _740 = _738 + _500;
    float _742 = _740 + _674;
    float _744 = _682 + _680;
    float _746 = _742 * 0.111111111938953399658203125;
    float _748 = _744 + _684;
    float _750 = _748 + _686;
    float _752 = _750 + _692;
    float _754 = _752 + _694;
    float _756 = _754 + _696;
    float _758 = _756 + _698;
    float _760 = _758 + _700;
    float _762 = _760 * 0.111111111938953399658203125;
    float _764 = _762 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _766 = fma(_746, (*spvDescriptorSet0.fp_c3)._m0[49].z, _764);
    float _768 = _766 + _732;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _720;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _768;
    return out;
}

