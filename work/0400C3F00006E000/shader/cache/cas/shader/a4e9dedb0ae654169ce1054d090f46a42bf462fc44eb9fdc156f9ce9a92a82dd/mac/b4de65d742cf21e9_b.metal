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
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_12 [[id(10)]];
    sampler fp_t_tcb_12Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_42 [[user(locn1), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _126 = false;
    bool _124 = false;
    float _54 = in.m_42.x;
    float _56 = in.m_42.y;
    float2 _806 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_806, float2(0.0), isnan(_806))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_806, float2(0.0), isnan(_806))).x;
    float _60 = in.m_44.x;
    float _62 = in.m_44.y;
    float _64 = -_58;
    float _66 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _68 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[46].z, _66);
    float _70 = _68 * _60;
    float _72 = -_68;
    bool _76 = _72 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _78 = _68 * _62;
    float _80 = -_68;
    bool _82 = _80 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _84 = -_68;
    bool _86 = _84 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _88 = !_76;
    int _91 = _88 ? 0 : 1;
    int _93 = 2;
    if (!_76)
    {
        _93 = 1;
    }
    int _95 = _93;
    int _97 = _95;
    if (!_82)
    {
        _97 = _91;
    }
    int _99 = _97;
    int _101 = _99 + 1;
    uint _104 = uint(_101);
    if (!_86)
    {
        _104 = uint(_99);
    }
    uint _106 = _104;
    uint _108 = min(_106, 2u);
    int _110 = int(_108) << 2;
    uint _112 = uint(int(uint(_110) >> uint(2)));
    uint _114 = uint(int(uint(int(_112)) >> uint(2)));
    int _116 = int(_112) & 3;
    float _118 = (*spvDescriptorSet0.fp_c1)._m0[int(_114)][_116];
    bool _120 = as_type<int>(_118) == 384;
    if (!_120)
    {
        bool _122 = as_type<int>(_118) == 656;
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
            float _128 = _78 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _130 = _78 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _132 = _78 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _134 = _78 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _136 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].x, _128);
            float _138 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].x, _130);
            float _140 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].x, _132);
            float _142 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].x, _134);
            float _144 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[0].z, _136);
            float _146 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[1].z, _138);
            float _148 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[2].z, _140);
            float _150 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[3].z, _142);
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
            float _168 = _78 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _170 = _78 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _172 = _78 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _174 = _78 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _176 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].x, _168);
            float _178 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].x, _170);
            float _180 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].x, _172);
            float _182 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].x, _174);
            float _184 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, _176);
            float _186 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[5].z, _178);
            float _188 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].z, _180);
            float _190 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[7].z, _182);
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
            float _200 = _78 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _202 = _78 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _204 = _78 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _206 = _78 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _208 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].x, _200);
            float _210 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].x, _202);
            float _212 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].x, _204);
            float _214 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].x, _206);
            float _216 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[8].z, _208);
            float _218 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[9].z, _210);
            float _220 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[10].z, _212);
            float _222 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[11].z, _214);
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
    float _240 = float(int(_106));
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
    float3 _1250 = float3(_262, _264, float(int(_254)));
    float3 _1254 = select(_1250, float3(0.0), isnan(_1250));
    float _272 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1254.xy, uint(rint(_1254.z)), _260);
    float3 _1263 = float3(_266, _264, float(int(_254)));
    float3 _1265 = select(_1263, float3(0.0), isnan(_1263));
    float _274 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1265.xy, uint(rint(_1265.z)), _260);
    float3 _1274 = float3(_270, _264, float(int(_254)));
    float3 _1276 = select(_1274, float3(0.0), isnan(_1274));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1276.xy, uint(rint(_1276.z)), _260);
    float3 _1285 = float3(_266, _256, float(int(_254)));
    float3 _1287 = select(_1285, float3(0.0), isnan(_1285));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1287.xy, uint(rint(_1287.z)), _260);
    float _280 = -_244;
    float _282 = fma(_260, _280, _256);
    float3 _1302 = float3(_262, _256, float(int(_254)));
    float3 _1304 = select(_1302, float3(0.0), isnan(_1302));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1304.xy, uint(rint(_1304.z)), _260);
    float3 _1313 = float3(_270, _256, float(int(_254)));
    float3 _1315 = select(_1313, float3(0.0), isnan(_1313));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1315.xy, uint(rint(_1315.z)), _260);
    float3 _1324 = float3(_266, _282, float(int(_254)));
    float3 _1326 = select(_1324, float3(0.0), isnan(_1324));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1326.xy, uint(rint(_1326.z)), _260);
    float3 _1335 = float3(_262, _282, float(int(_254)));
    float3 _1337 = select(_1335, float3(0.0), isnan(_1335));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1337.xy, uint(rint(_1337.z)), _260);
    float3 _1346 = float3(_270, _282, float(int(_254)));
    float3 _1348 = select(_1346, float3(0.0), isnan(_1346));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1348.xy, uint(rint(_1348.z)), _260);
    float _294 = -_78;
    float _296 = _294 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _298 = -_70;
    float _300 = _298 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _302 = _296 * _296;
    float _304 = fma(_300, _300, _302);
    float _306 = -_68;
    float _308 = _306 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _310 = fma(_308, _308, _304);
    float _312 = sqrt(_310);
    float _314 = _78 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _316 = _78 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _318 = _78 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _320 = _78 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _322 = _78 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _324 = _78 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _326 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].x, _314);
    float _328 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].x, _316);
    float _330 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].x, _318);
    float _332 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].x, _320);
    float _334 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].x, _322);
    float _336 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].x, _324);
    float _338 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[21].z, _326);
    float _340 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[19].z, _328);
    bool _342 = _312 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _344 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[20].z, _330);
    bool _346 = _312 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _348 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[22].z, _332);
    bool _350 = !_342;
    int _352 = _350 ? 0 : 1;
    float _354 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[23].z, _334);
    float _356 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[24].z, _336);
    float _358 = _344 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _360 = _78 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _362 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _364 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].x, _360);
    int _366 = 2;
    float _368 = _358;
    if (!_342)
    {
        _366 = 1;
    }
    int _370 = _366;
    int _372 = _370;
    if (!_346)
    {
        _372 = _352;
    }
    int _374 = _372;
    float _376 = _338 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _378 = _340 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _380 = _78 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _382 = float(_374);
    float _384 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[17].z, _364);
    float _386 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].x, _380);
    float _388 = precise::min(_382, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _390 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[16].z, _386);
    bool _392 = _388 != 1.0;
    bool _394 = isnan(_388);
    bool _396 = _392 || _394;
    bool _398 = isnan(1.0);
    bool _400 = _396 || _398;
    float _402 = _376;
    float _404 = _378;
    if (_400)
    {
        float _406 = _356 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _402 = _406;
    }
    float _408 = _402;
    float _410 = _408;
    if (_400)
    {
        float _412 = _348 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _404 = _412;
    }
    float _414 = _404;
    float _416 = _414;
    if (_400)
    {
        float _418 = _354 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _368 = _418;
    }
    float _420 = _368;
    bool _422 = _388 != 0.0;
    bool _424 = isnan(_388);
    bool _426 = _422 || _424;
    bool _428 = isnan(0.0);
    bool _430 = _426 || _428;
    float _432 = _78 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _434 = rint(_388);
    float _436 = precise::max(_434, 0.0);
    uint _438 = uint(_436);
    uint _440 = clamp(_438, 0u, 65535u);
    float _442 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _444 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].x, _432);
    float _446 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[18].z, _444);
    float _448 = _420;
    if (!_430)
    {
        float _450 = _446 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _410 = _450;
    }
    float _452 = _410;
    if (!_430)
    {
        float _454 = _390 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _416 = _454;
    }
    float _456 = _416;
    if (!_430)
    {
        float _458 = _384 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _448 = _458;
    }
    float _460 = _448;
    float _462 = 0.0 + _452;
    float _464 = precise::clamp(_462, 0.0, 1.0);
    float _466 = fma(_464, _442, _460);
    float _468 = fma(_464, _362, _456);
    float _470 = -_362;
    float _472 = fma(_464, _470, _456);
    float _474 = _274 + _272;
    float _476 = _474 + _276;
    float _478 = _476 + _278;
    float3 _1698 = float3(_456, _466, float(int(_440)));
    float3 _1700 = select(_1698, float3(0.0), isnan(_1698));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1700.xy, uint(rint(_1700.z)), _464);
    float3 _1709 = float3(_468, _466, float(int(_440)));
    float3 _1711 = select(_1709, float3(0.0), isnan(_1709));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1711.xy, uint(rint(_1711.z)), _464);
    float3 _1720 = float3(_472, _466, float(int(_440)));
    float3 _1722 = select(_1720, float3(0.0), isnan(_1720));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1722.xy, uint(rint(_1722.z)), _464);
    float3 _1731 = float3(_468, _460, float(int(_440)));
    float3 _1733 = select(_1731, float3(0.0), isnan(_1731));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1733.xy, uint(rint(_1733.z)), _464);
    float _488 = _478 + _284;
    float3 _1745 = float3(_456, _460, float(int(_440)));
    float3 _1747 = select(_1745, float3(0.0), isnan(_1745));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1747.xy, uint(rint(_1747.z)), _464);
    float _492 = _488 + _286;
    float _494 = _492 + _288;
    float _496 = -_442;
    float _498 = fma(_464, _496, _460);
    float3 _1768 = float3(_472, _460, float(int(_440)));
    float3 _1770 = select(_1768, float3(0.0), isnan(_1768));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1770.xy, uint(rint(_1770.z)), _464);
    float _502 = _494 + _290;
    float3 _1782 = float3(_468, _498, float(int(_440)));
    float3 _1784 = select(_1782, float3(0.0), isnan(_1782));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1784.xy, uint(rint(_1784.z)), _464);
    float2 _1790 = float2(_54, _56);
    float2 _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1790, float2(0.0), isnan(_1790))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1790, float2(0.0), isnan(_1790))).xy;
    float _510 = _508.x;
    float _512 = _508.y;
    float3 _1805 = float3(_456, _498, float(int(_440)));
    float3 _1807 = select(_1805, float3(0.0), isnan(_1805));
    float _514 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1807.xy, uint(rint(_1807.z)), _464);
    float _516 = _78 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _518 = _78 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _520 = _78 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _522 = _78 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _524 = _78 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _526 = _78 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _528 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].x, _518);
    float _530 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].x, _520);
    float _532 = _78 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _534 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].x, _526);
    float _536 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[27].z, _528);
    float _538 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[28].z, _530);
    float _540 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].x, _532);
    float _542 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[32].z, _534);
    float _544 = -_70;
    float _546 = _544 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _548 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].x, _516);
    float _550 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].x, _522);
    float _552 = _502 + _292;
    float _554 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[26].z, _548);
    float _556 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[31].z, _550);
    float _558 = _482 + _480;
    float _560 = _558 + _484;
    float _562 = _78 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _564 = _78 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _566 = -_78;
    float _568 = _566 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _570 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].x, _562);
    float _572 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].x, _524);
    float _574 = _568 * _568;
    float _576 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].x, _564);
    float _578 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[29].z, _572);
    float _580 = fma(_546, _546, _574);
    float _582 = -_68;
    float _584 = _582 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _586 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[30].z, _576);
    float _588 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[25].z, _570);
    float _590 = fma(_584, _584, _580);
    float _592 = _586 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _594 = sqrt(_590);
    bool _596 = _594 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _598 = _594 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _600 = !_596;
    int _602 = _600 ? 0 : 1;
    int _604 = 2;
    float _606 = _592;
    if (!_596)
    {
        _604 = 1;
    }
    int _608 = _604;
    int _610 = _608;
    if (!_598)
    {
        _610 = _602;
    }
    int _612 = _610;
    float _614 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[33].z, _540);
    float _616 = _538 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _618 = float(_612);
    float _620 = precise::min(_618, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _622 = _578 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _624 = _560 + _486;
    bool _626 = _620 != 1.0;
    bool _628 = isnan(_620);
    bool _630 = _626 || _628;
    bool _632 = isnan(1.0);
    bool _634 = _630 || _632;
    float _636 = _616;
    float _638 = _622;
    if (_634)
    {
        float _640 = _556 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _636 = _640;
    }
    float _642 = _636;
    float _644 = _642;
    if (_634)
    {
        float _646 = _542 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _638 = _646;
    }
    float _648 = _638;
    float _650 = _648;
    if (_634)
    {
        float _652 = _614 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _606 = _652;
    }
    float _654 = _606;
    bool _656 = _620 != 0.0;
    bool _658 = isnan(_620);
    bool _660 = _656 || _658;
    bool _662 = isnan(0.0);
    bool _664 = _660 || _662;
    float _666 = rint(_620);
    float _668 = precise::max(_666, 0.0);
    uint _670 = uint(_668);
    uint _672 = clamp(_670, 0u, 65535u);
    float _674 = _654;
    if (!_664)
    {
        float _676 = _536 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _674 = _676;
    }
    float _678 = _674;
    if (!_664)
    {
        float _680 = _588 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _644 = _680;
    }
    float _682 = _644;
    if (!_664)
    {
        float _684 = _554 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _650 = _684;
    }
    float _686 = _650;
    float _688 = 0.0 + _678;
    float _690 = precise::clamp(_688, 0.0, 1.0);
    float _692 = fma(_442, _690, _686);
    float _694 = fma(_362, _690, _682);
    float _696 = -_362;
    float _698 = fma(_696, _690, _682);
    float3 _2148 = float3(_472, _498, float(int(_440)));
    float3 _2150 = select(_2148, float3(0.0), isnan(_2148));
    float _700 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2150.xy, uint(rint(_2150.z)), _464);
    float3 _2159 = float3(_682, _692, float(int(_672)));
    float3 _2161 = select(_2159, float3(0.0), isnan(_2159));
    float _702 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2161.xy, uint(rint(_2161.z)), _690);
    float3 _2170 = float3(_694, _692, float(int(_672)));
    float3 _2172 = select(_2170, float3(0.0), isnan(_2170));
    float _704 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2172.xy, uint(rint(_2172.z)), _690);
    float3 _2181 = float3(_698, _692, float(int(_672)));
    float3 _2183 = select(_2181, float3(0.0), isnan(_2181));
    float _706 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2183.xy, uint(rint(_2183.z)), _690);
    float3 _2192 = float3(_694, _686, float(int(_672)));
    float3 _2194 = select(_2192, float3(0.0), isnan(_2192));
    float _708 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2194.xy, uint(rint(_2194.z)), _690);
    float _710 = _624 + _490;
    float _712 = fma(_512, 2.0, -1.0);
    float _714 = _710 + _500;
    float _716 = fma(_510, 2.0, -1.0);
    float _718 = _714 + _504;
    float _720 = _712 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _722 = -_442;
    float _724 = fma(_722, _690, _686);
    float _726 = fma(_720, 2.0, _56);
    float _728 = _716 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _2236 = float3(_682, _686, float(int(_672)));
    float3 _2238 = select(_2236, float3(0.0), isnan(_2236));
    float _730 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2238.xy, uint(rint(_2238.z)), _690);
    float3 _2247 = float3(_698, _686, float(int(_672)));
    float3 _2249 = select(_2247, float3(0.0), isnan(_2247));
    float _732 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2249.xy, uint(rint(_2249.z)), _690);
    float3 _2258 = float3(_694, _724, float(int(_672)));
    float3 _2260 = select(_2258, float3(0.0), isnan(_2258));
    float _734 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2260.xy, uint(rint(_2260.z)), _690);
    float _736 = fma(_728, 2.0, _54);
    float3 _2272 = float3(_682, _724, float(int(_672)));
    float3 _2274 = select(_2272, float3(0.0), isnan(_2272));
    float _738 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2274.xy, uint(rint(_2274.z)), _690);
    float3 _2283 = float3(_698, _724, float(int(_672)));
    float3 _2285 = select(_2283, float3(0.0), isnan(_2283));
    float _740 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2285.xy, uint(rint(_2285.z)), _690);
    float2 _2291 = float2(_736, _726);
    float _742 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2291, float2(0.0), isnan(_2291))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2291, float2(0.0), isnan(_2291))).x;
    float _744 = _718 + _514;
    float _746 = _744 + _700;
    float _748 = _704 + _702;
    float _750 = _748 + _706;
    float _752 = _750 + _708;
    float _754 = _752 + _730;
    float _756 = _754 + _732;
    float _758 = _756 + _734;
    float _760 = _746 * 0.111111111938953399658203125;
    float _762 = _758 + _738;
    float _764 = -_68;
    float _766 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _768 = _764 + _766;
    float _770 = -_68;
    float _772 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _774 = _770 + _772;
    float _776 = _762 + _740;
    float _778 = _768 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _780 = precise::clamp(_778, 0.0, 1.0);
    float _782 = _776 * 0.111111111938953399658203125;
    float _784 = fma(_552, 0.111111111938953399658203125, _780);
    float _786 = _782 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _788 = fma(_760, (*spvDescriptorSet0.fp_c3)._m0[49].z, _786);
    float _790 = _774 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _792 = precise::clamp(_790, 0.0, 1.0);
    float _794 = _788 + _792;
    out.m_47.x = _742;
    out.m_47.y = _784;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _794;
    return out;
}

