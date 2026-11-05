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
    bool _126 = false;
    bool _124 = false;
    float _50 = in.m_38.x;
    float _52 = in.m_38.y;
    float2 _785 = float2(_50, _52);
    float _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_785, float2(0.0), isnan(_785))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_785, float2(0.0), isnan(_785))).x;
    float _56 = in.m_40.x;
    float _58 = -_54;
    float _60 = fma(_58, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _62 = 1.0 / _60;
    float _64 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _66 = _62 * _64;
    float _68 = _66 * _56;
    float _70 = -_66;
    bool _74 = _70 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _76 = -_66;
    bool _78 = _76 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _80 = -_66;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _84 = !_74;
    int _87 = _84 ? 0 : 1;
    int _89 = 2;
    if (!_74)
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
    float _104 = in.m_40.y;
    uint _106 = min(_102, 2u);
    int _108 = int(_106) << 2;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    uint _112 = uint(int(uint(int(_110)) >> uint(2)));
    int _114 = int(_110) & 3;
    float _116 = (*spvDescriptorSet0.fp_c1)._m0[int(_112)][_114];
    float _118 = _66 * _104;
    bool _120 = as_type<int>(_116) == 416;
    if (!_120)
    {
        bool _122 = as_type<int>(_116) == 688;
        _124 = _122;
        if (!_124)
        {
            _126 = true;
        }
    }
    float _160;
    float _162;
    float _164;
    float _166;
    if (!_124)
    {
        if (!_126)
        {
            float _128 = _118 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _130 = _118 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _132 = _118 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _134 = _118 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _136 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].x, _128);
            float _138 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].x, _130);
            float _140 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].x, _132);
            float _142 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].x, _134);
            float _144 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, _136);
            float _146 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[1].z, _138);
            float _148 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[2].z, _140);
            float _150 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[3].z, _142);
            float _152 = _144 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _154 = _146 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _160 = _158;
            _162 = _154;
            _164 = _156;
            _166 = _152;
        }
    }
    if ((false || _126) || _124)
    {
        if ((!_126) || _124)
        {
            _124 = false;
            float _168 = _118 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _170 = _118 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _172 = _118 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _174 = _118 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _176 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, _168);
            float _178 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].x, _170);
            float _180 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].x, _172);
            float _182 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].x, _174);
            float _184 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, _176);
            float _186 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[5].z, _178);
            float _188 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[6].z, _180);
            float _190 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[7].z, _182);
            float _192 = _184 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _194 = _186 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _160 = _198;
            _162 = _194;
            _164 = _196;
            _166 = _192;
        }
        if (false || _126)
        {
            _126 = false;
            float _200 = _118 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _202 = _118 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _204 = _118 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _206 = _118 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _208 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].x, _200);
            float _210 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].x, _202);
            float _212 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].x, _204);
            float _214 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].x, _206);
            float _216 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[8].z, _208);
            float _218 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[9].z, _210);
            float _220 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[10].z, _212);
            float _222 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[11].z, _214);
            float _224 = _216 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _226 = _218 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _160 = _230;
            _162 = _226;
            _164 = _228;
            _166 = _224;
        }
    }
    float _232 = _160;
    float _234 = _162;
    float _236 = _164;
    float _238 = _166;
    float _240 = float(int(_102));
    float _242 = 1.0 / _232;
    float _244 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _246 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _248 = rint(_240);
    float _250 = precise::max(_248, 0.0);
    uint _252 = uint(_250);
    uint _254 = clamp(_252, 0u, 65535u);
    float _256 = _242 * _234;
    float _258 = _242 * _236;
    float _260 = precise::clamp(_258, 0.0, 1.0);
    float _262 = _242 * _238;
    float _264 = fma(_260, _244, _256);
    float _266 = fma(_260, _246, _262);
    float _268 = -_246;
    float _270 = fma(_260, _268, _262);
    float3 _1233 = float3(_262, _264, float(int(_254)));
    float3 _1237 = select(_1233, float3(0.0), isnan(_1233));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1237.xy, uint(rint(_1237.z)), _260);
    float3 _1246 = float3(_266, _264, float(int(_254)));
    float3 _1248 = select(_1246, float3(0.0), isnan(_1246));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1248.xy, uint(rint(_1248.z)), _260);
    float3 _1257 = float3(_270, _264, float(int(_254)));
    float3 _1259 = select(_1257, float3(0.0), isnan(_1257));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1259.xy, uint(rint(_1259.z)), _260);
    float _278 = -_244;
    float _280 = fma(_260, _278, _256);
    float3 _1274 = float3(_266, _256, float(int(_254)));
    float3 _1276 = select(_1274, float3(0.0), isnan(_1274));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1276.xy, uint(rint(_1276.z)), _260);
    float3 _1285 = float3(_262, _256, float(int(_254)));
    float3 _1287 = select(_1285, float3(0.0), isnan(_1285));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1287.xy, uint(rint(_1287.z)), _260);
    float3 _1296 = float3(_270, _256, float(int(_254)));
    float3 _1298 = select(_1296, float3(0.0), isnan(_1296));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1298.xy, uint(rint(_1298.z)), _260);
    float3 _1307 = float3(_266, _280, float(int(_254)));
    float3 _1309 = select(_1307, float3(0.0), isnan(_1307));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1309.xy, uint(rint(_1309.z)), _260);
    float _290 = -_118;
    float _292 = _290 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _294 = -_68;
    float _296 = _294 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _298 = _118 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _300 = _292 * _292;
    float _302 = fma(_296, _296, _300);
    float _304 = -_66;
    float _306 = _304 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _308 = fma(_306, _306, _302);
    float _310 = sqrt(_308);
    float _312 = _118 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    bool _314 = _310 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _316 = _310 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _318 = !_314;
    int _320 = _318 ? 0 : 1;
    int _322 = 2;
    if (!_314)
    {
        _322 = 1;
    }
    int _324 = _322;
    int _326 = _324;
    if (!_316)
    {
        _326 = _320;
    }
    int _328 = _326;
    float _330 = _118 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _332 = _118 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _334 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].x, _298);
    float _336 = float(_328);
    float _338 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].x, _330);
    float _340 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].x, _332);
    float _342 = _118 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _344 = precise::min(_336, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _346 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[21].z, _338);
    float _348 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].x, _312);
    float _350 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[19].z, _340);
    bool _352 = _344 != 1.0;
    bool _354 = isnan(_344);
    bool _356 = _352 || _354;
    bool _358 = isnan(1.0);
    bool _360 = _356 || _358;
    float _362 = _118 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _364 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[22].z, _334);
    float _366 = _346 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _368 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].x, _342);
    float _370 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[24].z, _348);
    float _372 = _350 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    bool _374 = _344 != 0.0;
    bool _376 = isnan(_344);
    bool _378 = _374 || _376;
    bool _380 = isnan(0.0);
    bool _382 = _378 || _380;
    float _384 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].x, _362);
    float _386 = _118 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _388 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[20].z, _368);
    float _390 = _118 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _392 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[23].z, _384);
    float _394 = _366;
    float _396 = _372;
    if (_360)
    {
        float _398 = _370 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _394 = _398;
    }
    float _400 = _394;
    float _402 = _400;
    if (_360)
    {
        float _404 = _364 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _396 = _404;
    }
    float _406 = _396;
    float _408 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].x, _386);
    float _410 = rint(_344);
    float _412 = precise::max(_410, 0.0);
    uint _414 = uint(_412);
    uint _416 = clamp(_414, 0u, 65535u);
    float _418 = _118 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _420 = _388 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _422 = _420;
    float _424 = _406;
    if (_360)
    {
        float _426 = _392 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _422 = _426;
    }
    float _428 = _422;
    float _430 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].x, _390);
    float _432 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[18].z, _408);
    float _434 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].x, _418);
    float _436 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _438 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[17].z, _430);
    float _440 = _428;
    if (!_382)
    {
        float _442 = _432 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _402 = _442;
    }
    float _444 = _402;
    float _446 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[16].z, _434);
    float _448 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    if (!_382)
    {
        float _450 = _438 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _440 = _450;
    }
    float _452 = _440;
    float _454 = 0.0 + _444;
    float _456 = precise::clamp(_454, 0.0, 1.0);
    if (!_382)
    {
        float _458 = _446 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _424 = _458;
    }
    float _460 = _424;
    float _462 = fma(_456, _448, _452);
    float _464 = -_436;
    float _466 = fma(_456, _464, _460);
    float _468 = fma(_456, _436, _460);
    float _470 = _274 + _272;
    float3 _1653 = float3(_262, _280, float(int(_254)));
    float3 _1655 = select(_1653, float3(0.0), isnan(_1653));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1655.xy, uint(rint(_1655.z)), _260);
    float3 _1664 = float3(_270, _280, float(int(_254)));
    float3 _1666 = select(_1664, float3(0.0), isnan(_1664));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1666.xy, uint(rint(_1666.z)), _260);
    float3 _1675 = float3(_460, _462, float(int(_416)));
    float3 _1677 = select(_1675, float3(0.0), isnan(_1675));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1677.xy, uint(rint(_1677.z)), _456);
    float _478 = _470 + _276;
    float3 _1689 = float3(_466, _462, float(int(_416)));
    float3 _1691 = select(_1689, float3(0.0), isnan(_1689));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1691.xy, uint(rint(_1691.z)), _456);
    float3 _1700 = float3(_468, _452, float(int(_416)));
    float3 _1702 = select(_1700, float3(0.0), isnan(_1700));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1702.xy, uint(rint(_1702.z)), _456);
    float3 _1711 = float3(_468, _462, float(int(_416)));
    float3 _1713 = select(_1711, float3(0.0), isnan(_1711));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1713.xy, uint(rint(_1713.z)), _456);
    float _486 = _478 + _282;
    float _488 = -_448;
    float _490 = fma(_456, _488, _452);
    float _492 = _486 + _284;
    float _494 = _492 + _286;
    float _496 = _494 + _288;
    float3 _1740 = float3(_460, _452, float(int(_416)));
    float3 _1742 = select(_1740, float3(0.0), isnan(_1740));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1742.xy, uint(rint(_1742.z)), _456);
    float3 _1751 = float3(_466, _452, float(int(_416)));
    float3 _1753 = select(_1751, float3(0.0), isnan(_1751));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1753.xy, uint(rint(_1753.z)), _456);
    float3 _1762 = float3(_468, _490, float(int(_416)));
    float3 _1764 = select(_1762, float3(0.0), isnan(_1762));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1764.xy, uint(rint(_1764.z)), _456);
    float3 _1773 = float3(_460, _490, float(int(_416)));
    float3 _1775 = select(_1773, float3(0.0), isnan(_1773));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1775.xy, uint(rint(_1775.z)), _456);
    float _506 = _118 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _508 = _118 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _510 = _118 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _512 = _118 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _514 = _118 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _516 = _118 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _518 = _118 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _520 = _118 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _522 = _118 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _524 = -_118;
    float _526 = _524 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _528 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].x, _510);
    float _530 = -_68;
    float _532 = _530 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _534 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].x, _506);
    float _536 = _526 * _526;
    float _538 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].x, _508);
    float _540 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].x, _522);
    float _542 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].x, _516);
    float _544 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].x, _514);
    float _546 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].x, _518);
    float _548 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].x, _520);
    float _550 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].x, _512);
    float _552 = fma(_532, _532, _536);
    float _554 = -_66;
    float _556 = _554 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _558 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[28].z, _540);
    float _560 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[29].z, _542);
    float _562 = fma(_556, _556, _552);
    float _564 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[30].z, _544);
    float _566 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[31].z, _546);
    float _568 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[32].z, _548);
    float _570 = _560 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _572 = _564 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _574 = sqrt(_562);
    float _576 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[27].z, _528);
    float _578 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[26].z, _538);
    float _580 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[25].z, _534);
    bool _582 = _574 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _584 = _574 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _586 = !_582;
    int _588 = _586 ? 0 : 1;
    int _590 = 2;
    float _592 = _570;
    float _594 = _572;
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
    float _604 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[33].z, _550);
    float _606 = _558 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _608 = precise::min(_602, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _610 = _608 != 1.0;
    bool _612 = isnan(_608);
    bool _614 = _610 || _612;
    bool _616 = isnan(1.0);
    bool _618 = _614 || _616;
    float _620 = _606;
    if (_618)
    {
        float _622 = _566 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _620 = _622;
    }
    float _624 = _620;
    float _626 = _624;
    if (_618)
    {
        float _628 = _568 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _592 = _628;
    }
    float _630 = _592;
    float _632 = _630;
    if (_618)
    {
        float _634 = _604 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _594 = _634;
    }
    float _636 = _594;
    bool _638 = _608 != 0.0;
    bool _640 = isnan(_608);
    bool _642 = _638 || _640;
    bool _644 = isnan(0.0);
    bool _646 = _642 || _644;
    float _648 = rint(_608);
    float _650 = precise::max(_648, 0.0);
    uint _652 = uint(_650);
    uint _654 = clamp(_652, 0u, 65535u);
    float _656 = _636;
    if (!_646)
    {
        float _658 = _576 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _656 = _658;
    }
    float _660 = _656;
    if (!_646)
    {
        float _662 = _578 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _632 = _662;
    }
    float _664 = _632;
    if (!_646)
    {
        float _666 = _580 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _626 = _666;
    }
    float _668 = _626;
    float _670 = 0.0 + _660;
    float _672 = precise::clamp(_670, 0.0, 1.0);
    float _674 = fma(_448, _672, _664);
    float _676 = fma(_436, _672, _668);
    float3 _2098 = float3(_466, _490, float(int(_416)));
    float3 _2100 = select(_2098, float3(0.0), isnan(_2098));
    float _678 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _2100.xy, uint(rint(_2100.z)), _456);
    float _680 = -_436;
    float _682 = fma(_680, _672, _668);
    float3 _2115 = float3(_668, _674, float(int(_654)));
    float3 _2117 = select(_2115, float3(0.0), isnan(_2115));
    float _684 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2117.xy, uint(rint(_2117.z)), _672);
    float3 _2126 = float3(_676, _674, float(int(_654)));
    float3 _2128 = select(_2126, float3(0.0), isnan(_2126));
    float _686 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2128.xy, uint(rint(_2128.z)), _672);
    float3 _2137 = float3(_682, _674, float(int(_654)));
    float3 _2139 = select(_2137, float3(0.0), isnan(_2137));
    float _688 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2139.xy, uint(rint(_2139.z)), _672);
    float3 _2148 = float3(_676, _664, float(int(_654)));
    float3 _2150 = select(_2148, float3(0.0), isnan(_2148));
    float _690 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2150.xy, uint(rint(_2150.z)), _672);
    float _692 = -_448;
    float _694 = fma(_692, _672, _664);
    float3 _2165 = float3(_668, _664, float(int(_654)));
    float3 _2167 = select(_2165, float3(0.0), isnan(_2165));
    float _696 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2167.xy, uint(rint(_2167.z)), _672);
    float3 _2176 = float3(_682, _664, float(int(_654)));
    float3 _2178 = select(_2176, float3(0.0), isnan(_2176));
    float _698 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2178.xy, uint(rint(_2178.z)), _672);
    float3 _2187 = float3(_676, _694, float(int(_654)));
    float3 _2189 = select(_2187, float3(0.0), isnan(_2187));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2189.xy, uint(rint(_2189.z)), _672);
    float3 _2198 = float3(_668, _694, float(int(_654)));
    float3 _2200 = select(_2198, float3(0.0), isnan(_2198));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2200.xy, uint(rint(_2200.z)), _672);
    float3 _2209 = float3(_682, _694, float(int(_654)));
    float3 _2211 = select(_2209, float3(0.0), isnan(_2209));
    float _704 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2211.xy, uint(rint(_2211.z)), _672);
    float _706 = _496 + _472;
    float _708 = _706 + _474;
    float _710 = -_66;
    float _712 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _714 = _710 + _712;
    float _716 = _484 + _476;
    float _718 = _714 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _720 = precise::clamp(_718, 0.0, 1.0);
    float _722 = _716 + _480;
    float _724 = fma(_708, 0.111111111938953399658203125, _720);
    float _726 = -_66;
    float _728 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _730 = _726 + _728;
    float _732 = _722 + _482;
    float _734 = _730 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _736 = precise::clamp(_734, 0.0, 1.0);
    float _738 = _732 + _498;
    float _740 = _738 + _500;
    float _742 = _740 + _502;
    float _744 = _742 + _504;
    float _746 = _744 + _678;
    float _748 = _686 + _684;
    float _750 = _746 * 0.111111111938953399658203125;
    float _752 = _748 + _688;
    float _754 = _752 + _690;
    float _756 = _754 + _696;
    float _758 = _756 + _698;
    float _760 = _758 + _700;
    float _762 = _760 + _702;
    float _764 = _762 + _704;
    float _766 = _764 * 0.111111111938953399658203125;
    float _768 = _766 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _770 = fma(_750, (*spvDescriptorSet0.fp_c3)._m0[49].z, _768);
    float _772 = _770 + _736;
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _724;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _772;
    return out;
}

