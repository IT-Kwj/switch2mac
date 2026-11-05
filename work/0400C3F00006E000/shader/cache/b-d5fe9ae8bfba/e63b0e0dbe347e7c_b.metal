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
    texture2d_array<float> fp_t_tcb_12 [[id(8)]];
    sampler fp_t_tcb_12Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_C [[id(10)]];
    sampler fp_t_tcb_CSmplr [[id(11)]];
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
    bool _130 = false;
    bool _128 = false;
    float _54 = in.m_42.x;
    float _56 = in.m_42.y;
    float2 _918 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_918, float2(0.0), isnan(_918))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_918, float2(0.0), isnan(_918))).x;
    float _60 = in.m_44.y;
    float _62 = -_58;
    float _64 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _66 = 1.0 / _64;
    float _68 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _70 = _66 * _68;
    float _72 = -_70;
    bool _76 = _72 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _78 = -_70;
    bool _80 = _78 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _82 = -_70;
    bool _84 = _82 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _86 = !_76;
    int _89 = _86 ? 0 : 1;
    int _91 = 2;
    if (!_76)
    {
        _91 = 1;
    }
    int _93 = _91;
    int _95 = _93;
    if (!_80)
    {
        _95 = _89;
    }
    int _97 = _95;
    float _99 = in.m_44.x;
    int _101 = _97 + 1;
    uint _104 = uint(_101);
    if (!_84)
    {
        _104 = uint(_97);
    }
    uint _106 = _104;
    uint _108 = min(_106, 2u);
    int _110 = int(_108) << 2;
    float _112 = _70 * _60;
    uint _114 = uint(int(uint(_110) >> uint(2)));
    uint _116 = uint(int(uint(int(_114)) >> uint(2)));
    int _118 = int(_114) & 3;
    float _120 = (*spvDescriptorSet0.fp_c1)._m0[int(_116)][_118];
    float _122 = _70 * _99;
    bool _124 = as_type<int>(_120) == 416;
    if (!_124)
    {
        bool _126 = as_type<int>(_120) == 688;
        _128 = _126;
        if (!_128)
        {
            _130 = true;
        }
    }
    float _164;
    float _166;
    float _168;
    float _170;
    if (!_128)
    {
        if (!_130)
        {
            float _132 = _112 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _134 = _112 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _136 = _112 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _138 = _112 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _140 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[0].x, _132);
            float _142 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[1].x, _134);
            float _144 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[2].x, _136);
            float _146 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[3].x, _138);
            float _148 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[0].z, _140);
            float _150 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[1].z, _142);
            float _152 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[2].z, _144);
            float _154 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[3].z, _146);
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _160 = _152 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _162 = _154 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _164 = _162;
            _166 = _160;
            _168 = _156;
            _170 = _158;
        }
    }
    if ((false || _130) || _128)
    {
        if ((!_130) || _128)
        {
            _128 = false;
            float _172 = _112 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _174 = _112 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _176 = _112 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _178 = _112 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _180 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[4].x, _172);
            float _182 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[5].x, _174);
            float _184 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[6].x, _176);
            float _186 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[7].x, _178);
            float _188 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[4].z, _180);
            float _190 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[5].z, _182);
            float _192 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].z, _184);
            float _194 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[7].z, _186);
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _200 = _192 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _202 = _194 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _164 = _202;
            _166 = _200;
            _168 = _196;
            _170 = _198;
        }
        if (false || _130)
        {
            _130 = false;
            float _204 = _112 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _206 = _112 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _208 = _112 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _210 = _112 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _212 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[8].x, _204);
            float _214 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[9].x, _206);
            float _216 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[10].x, _208);
            float _218 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[11].x, _210);
            float _220 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[8].z, _212);
            float _222 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[9].z, _214);
            float _224 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[10].z, _216);
            float _226 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[11].z, _218);
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _232 = _224 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _234 = _226 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _164 = _234;
            _166 = _232;
            _168 = _228;
            _170 = _230;
        }
    }
    float _236 = _164;
    float _238 = _166;
    float _240 = _168;
    float _242 = _170;
    float _244 = 1.0 / _236;
    float _246 = float(int(_106));
    float _248 = rint(_246);
    float _250 = precise::max(_248, 0.0);
    uint _252 = uint(_250);
    uint _254 = clamp(_252, 0u, 65535u);
    float _256 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _258 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _260 = _244 * _238;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = _244 * _240;
    float _266 = _244 * _242;
    float _268 = _262 * _256;
    float _270 = _262 * _258;
    float _272 = fma(_268, 0.5, _264);
    float _274 = fma(_270, 1.5, _266);
    float _276 = fma(_268, 1.5, _264);
    float _278 = fma(_268, -0.5, _264);
    float _280 = fma(_268, -1.5, _264);
    float3 _1377 = float3(_272, _274, float(int(_254)));
    float3 _1381 = select(_1377, float3(0.0), isnan(_1377));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1381.xy, uint(rint(_1381.z)), _262);
    float3 _1390 = float3(_276, _274, float(int(_254)));
    float3 _1392 = select(_1390, float3(0.0), isnan(_1390));
    float _284 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1392.xy, uint(rint(_1392.z)), _262);
    float3 _1401 = float3(_278, _274, float(int(_254)));
    float3 _1403 = select(_1401, float3(0.0), isnan(_1401));
    float _286 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1403.xy, uint(rint(_1403.z)), _262);
    float _288 = fma(_270, 0.5, _266);
    float3 _1415 = float3(_280, _274, float(int(_254)));
    float3 _1417 = select(_1415, float3(0.0), isnan(_1415));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1417.xy, uint(rint(_1417.z)), _262);
    float3 _1426 = float3(_276, _288, float(int(_254)));
    float3 _1428 = select(_1426, float3(0.0), isnan(_1426));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1428.xy, uint(rint(_1428.z)), _262);
    float3 _1437 = float3(_272, _288, float(int(_254)));
    float3 _1439 = select(_1437, float3(0.0), isnan(_1437));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1439.xy, uint(rint(_1439.z)), _262);
    float _296 = _284 + _282;
    float _298 = _296 + _286;
    float _300 = _298 + _290;
    float _302 = _300 + _292;
    float _304 = _302 + _294;
    float _306 = fma(_270, -0.5, _266);
    float3 _1466 = float3(_278, _288, float(int(_254)));
    float3 _1468 = select(_1466, float3(0.0), isnan(_1466));
    float _308 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1468.xy, uint(rint(_1468.z)), _262);
    float3 _1477 = float3(_280, _288, float(int(_254)));
    float3 _1479 = select(_1477, float3(0.0), isnan(_1477));
    float _310 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1479.xy, uint(rint(_1479.z)), _262);
    float3 _1488 = float3(_276, _306, float(int(_254)));
    float3 _1490 = select(_1488, float3(0.0), isnan(_1488));
    float _312 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1490.xy, uint(rint(_1490.z)), _262);
    float3 _1499 = float3(_272, _306, float(int(_254)));
    float3 _1501 = select(_1499, float3(0.0), isnan(_1499));
    float _314 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1501.xy, uint(rint(_1501.z)), _262);
    float3 _1510 = float3(_278, _306, float(int(_254)));
    float3 _1512 = select(_1510, float3(0.0), isnan(_1510));
    float _316 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1512.xy, uint(rint(_1512.z)), _262);
    float3 _1521 = float3(_280, _306, float(int(_254)));
    float3 _1523 = select(_1521, float3(0.0), isnan(_1521));
    float _318 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1523.xy, uint(rint(_1523.z)), _262);
    float _320 = -_112;
    float _322 = _320 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _324 = fma(_270, -1.5, _266);
    float _326 = -_122;
    float _328 = _326 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _330 = _322 * _322;
    float _332 = -_70;
    float _334 = _332 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _336 = fma(_328, _328, _330);
    float _338 = fma(_334, _334, _336);
    float _340 = sqrt(_338);
    bool _342 = _340 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _344 = _340 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _346 = !_342;
    int _348 = _346 ? 0 : 1;
    float _350 = _112 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _352 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[22].x, _350);
    float _354 = _112 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    int _356 = 2;
    if (!_342)
    {
        _356 = 1;
    }
    int _358 = _356;
    float _360 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[22].z, _352);
    int _362 = _358;
    if (!_344)
    {
        _362 = _348;
    }
    int _364 = _362;
    float _366 = float(_364);
    float _368 = _112 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _370 = precise::min(_366, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _372 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[19].x, _368);
    float _374 = _112 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    bool _376 = _370 != 1.0;
    bool _378 = isnan(_370);
    bool _380 = _376 || _378;
    bool _382 = isnan(1.0);
    bool _384 = _380 || _382;
    float _386 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[19].z, _372);
    float _388 = _386 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _390 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[20].x, _374);
    float3 _1659 = float3(_276, _324, float(int(_254)));
    float3 _1661 = select(_1659, float3(0.0), isnan(_1659));
    float _392 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1661.xy, uint(rint(_1661.z)), _262);
    float _394 = _112 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _396 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[20].z, _390);
    float _398 = _388;
    if (_384)
    {
        float _400 = _360 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _398 = _400;
    }
    float _402 = _398;
    float _404 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[23].x, _354);
    float _406 = _112 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _408 = _396 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _410 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[21].x, _394);
    float _412 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[23].z, _404);
    float _414 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[21].z, _410);
    float _416 = _408;
    float _418 = _402;
    if (_384)
    {
        float _420 = _412 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _416 = _420;
    }
    float _422 = _416;
    float _424 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[24].x, _406);
    float _426 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[24].z, _424);
    float3 _1740 = float3(_272, _324, float(int(_254)));
    float3 _1742 = select(_1740, float3(0.0), isnan(_1740));
    float _428 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1742.xy, uint(rint(_1742.z)), _262);
    float3 _1751 = float3(_278, _324, float(int(_254)));
    float3 _1753 = select(_1751, float3(0.0), isnan(_1751));
    float _430 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1753.xy, uint(rint(_1753.z)), _262);
    float _432 = _414 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _434 = _432;
    float _436 = _422;
    if (_384)
    {
        float _438 = _426 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _434 = _438;
    }
    float _440 = _434;
    bool _442 = _370 != 0.0;
    bool _444 = isnan(_370);
    bool _446 = _442 || _444;
    bool _448 = isnan(0.0);
    bool _450 = _446 || _448;
    float _452 = _112 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _454 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[16].x, _452);
    float _456 = _112 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _458 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[16].z, _454);
    float _460 = _440;
    if (!_450)
    {
        float _462 = _458 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _418 = _462;
    }
    float _464 = _418;
    float _466 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[17].x, _456);
    float _468 = _112 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _470 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[17].z, _466);
    if (!_450)
    {
        float _472 = _470 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _436 = _472;
    }
    float _474 = _436;
    float _476 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[18].x, _468);
    float _478 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _480 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[18].z, _476);
    if (!_450)
    {
        float _482 = _480 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _460 = _482;
    }
    float _484 = _460;
    float _486 = 0.0 + _484;
    float _488 = precise::clamp(_486, 0.0, 1.0);
    float _490 = _304 + _308;
    float _492 = _490 + _310;
    float _494 = rint(_370);
    float _496 = precise::max(_494, 0.0);
    uint _498 = uint(_496);
    uint _500 = clamp(_498, 0u, 65535u);
    float _502 = _492 + _312;
    float _504 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _506 = _488 * _478;
    float _508 = _502 + _314;
    float _510 = fma(_506, 1.5, _474);
    float _512 = _508 + _316;
    float _514 = _488 * _504;
    float _516 = fma(_514, 0.5, _464);
    float _518 = fma(_514, -0.5, _464);
    float3 _1916 = float3(_280, _324, float(int(_254)));
    float3 _1918 = select(_1916, float3(0.0), isnan(_1916));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1918.xy, uint(rint(_1918.z)), _262);
    float3 _1927 = float3(_516, _510, float(int(_500)));
    float3 _1929 = select(_1927, float3(0.0), isnan(_1927));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1929.xy, uint(rint(_1929.z)), _488);
    float3 _1938 = float3(_518, _510, float(int(_500)));
    float3 _1940 = select(_1938, float3(0.0), isnan(_1938));
    float _524 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1940.xy, uint(rint(_1940.z)), _488);
    float _526 = _512 + _318;
    float _528 = fma(_514, 1.5, _464);
    float _530 = fma(_514, -1.5, _464);
    float _532 = fma(_506, 0.5, _474);
    float _534 = _526 + _392;
    float _536 = _534 + _428;
    float _538 = _536 + _430;
    float3 _1970 = float3(_530, _510, float(int(_500)));
    float3 _1972 = select(_1970, float3(0.0), isnan(_1970));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1972.xy, uint(rint(_1972.z)), _488);
    float3 _1981 = float3(_528, _510, float(int(_500)));
    float3 _1983 = select(_1981, float3(0.0), isnan(_1981));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1983.xy, uint(rint(_1983.z)), _488);
    float3 _1992 = float3(_528, _532, float(int(_500)));
    float3 _1994 = select(_1992, float3(0.0), isnan(_1992));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1994.xy, uint(rint(_1994.z)), _488);
    float3 _2003 = float3(_516, _532, float(int(_500)));
    float3 _2005 = select(_2003, float3(0.0), isnan(_2003));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2005.xy, uint(rint(_2005.z)), _488);
    float3 _2014 = float3(_518, _532, float(int(_500)));
    float3 _2016 = select(_2014, float3(0.0), isnan(_2014));
    float _548 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2016.xy, uint(rint(_2016.z)), _488);
    float3 _2025 = float3(_530, _532, float(int(_500)));
    float3 _2027 = select(_2025, float3(0.0), isnan(_2025));
    float _550 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2027.xy, uint(rint(_2027.z)), _488);
    float _552 = fma(_506, -1.5, _474);
    float _554 = _538 + _520;
    float _556 = _542 + _522;
    float _558 = _556 + _524;
    float _560 = _558 + _540;
    float _562 = fma(_506, -0.5, _474);
    float _564 = _560 + _544;
    float3 _2057 = float3(_528, _562, float(int(_500)));
    float3 _2059 = select(_2057, float3(0.0), isnan(_2057));
    float _566 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2059.xy, uint(rint(_2059.z)), _488);
    float _568 = _564 + _546;
    float3 _2071 = float3(_516, _562, float(int(_500)));
    float3 _2073 = select(_2071, float3(0.0), isnan(_2071));
    float _570 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2073.xy, uint(rint(_2073.z)), _488);
    float _572 = _568 + _548;
    float3 _2085 = float3(_518, _562, float(int(_500)));
    float3 _2087 = select(_2085, float3(0.0), isnan(_2085));
    float _574 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2087.xy, uint(rint(_2087.z)), _488);
    float3 _2096 = float3(_530, _562, float(int(_500)));
    float3 _2098 = select(_2096, float3(0.0), isnan(_2096));
    float _576 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2098.xy, uint(rint(_2098.z)), _488);
    float3 _2107 = float3(_528, _552, float(int(_500)));
    float3 _2109 = select(_2107, float3(0.0), isnan(_2107));
    float _578 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2109.xy, uint(rint(_2109.z)), _488);
    float3 _2118 = float3(_516, _552, float(int(_500)));
    float3 _2120 = select(_2118, float3(0.0), isnan(_2118));
    float _580 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2120.xy, uint(rint(_2120.z)), _488);
    float3 _2129 = float3(_518, _552, float(int(_500)));
    float3 _2131 = select(_2129, float3(0.0), isnan(_2129));
    float _582 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2131.xy, uint(rint(_2131.z)), _488);
    float _584 = _112 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _586 = _112 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _588 = _112 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _590 = _112 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _592 = _112 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _594 = _112 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _596 = _112 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _598 = _112 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _600 = _112 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _602 = _572 + _550;
    float _604 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[25].x, _586);
    float _606 = -_112;
    float _608 = _606 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _610 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[29].x, _584);
    float _612 = -_122;
    float _614 = _612 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _616 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[27].x, _590);
    float _618 = _608 * _608;
    float _620 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[28].x, _592);
    float _622 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[26].x, _588);
    float _624 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[30].x, _594);
    float _626 = fma(_614, _614, _618);
    float _628 = -_70;
    float _630 = _628 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _632 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[31].x, _596);
    float _634 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[32].x, _598);
    float _636 = fma(_122, (*spvDescriptorSet0.fp_c3)._m0[33].x, _600);
    float _638 = fma(_630, _630, _626);
    float _640 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[28].z, _620);
    float _642 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[29].z, _610);
    float _644 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[30].z, _624);
    float _646 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[31].z, _632);
    float _648 = sqrt(_638);
    float _650 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[32].z, _634);
    float _652 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[33].z, _636);
    float _654 = _640 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _656 = _642 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _658 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[27].z, _616);
    float _660 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[25].z, _604);
    float _662 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[26].z, _622);
    bool _664 = _648 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _666 = _648 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _668 = !_664;
    int _670 = _668 ? 0 : 1;
    int _672 = 2;
    float _674 = _654;
    float _676 = _656;
    if (!_664)
    {
        _672 = 1;
    }
    int _678 = _672;
    int _680 = _678;
    if (!_666)
    {
        _680 = _670;
    }
    int _682 = _680;
    float _684 = _644 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _686 = float(_682);
    float _688 = precise::min(_686, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    bool _690 = _688 != 1.0;
    bool _692 = isnan(_688);
    bool _694 = _690 || _692;
    bool _696 = isnan(1.0);
    bool _698 = _694 || _696;
    float _700 = _684;
    if (_698)
    {
        float _702 = _646 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _674 = _702;
    }
    float _704 = _674;
    float _706 = _704;
    if (_698)
    {
        float _708 = _650 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _676 = _708;
    }
    float _710 = _676;
    float _712 = _710;
    if (_698)
    {
        float _714 = _652 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _700 = _714;
    }
    float _716 = _700;
    bool _718 = _688 != 0.0;
    bool _720 = isnan(_688);
    bool _722 = _718 || _720;
    bool _724 = isnan(0.0);
    bool _726 = _722 || _724;
    float _728 = rint(_688);
    float _730 = precise::max(_728, 0.0);
    uint _732 = uint(_730);
    uint _734 = clamp(_732, 0u, 65535u);
    float _736 = _716;
    if (!_726)
    {
        float _738 = _658 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _736 = _738;
    }
    float _740 = _736;
    if (!_726)
    {
        float _742 = _660 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _706 = _742;
    }
    float _744 = _706;
    if (!_726)
    {
        float _746 = _662 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _712 = _746;
    }
    float _748 = _712;
    float _750 = 0.0 + _740;
    float _752 = precise::clamp(_750, 0.0, 1.0);
    float _754 = _602 + _566;
    float _756 = _504 * _752;
    float _758 = _754 + _570;
    float _760 = fma(_756, 0.5, _744);
    float _762 = fma(_756, -0.5, _744);
    float _764 = fma(_756, -1.5, _744);
    float _766 = _758 + _574;
    float _768 = _478 * _752;
    float3 _2473 = float3(_530, _552, float(int(_500)));
    float3 _2475 = select(_2473, float3(0.0), isnan(_2473));
    float _770 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2475.xy, uint(rint(_2475.z)), _488);
    float _772 = fma(_768, 1.5, _748);
    float3 _2487 = float3(_760, _772, float(int(_734)));
    float3 _2489 = select(_2487, float3(0.0), isnan(_2487));
    float _774 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2489.xy, uint(rint(_2489.z)), _752);
    float3 _2498 = float3(_762, _772, float(int(_734)));
    float3 _2500 = select(_2498, float3(0.0), isnan(_2498));
    float _776 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2500.xy, uint(rint(_2500.z)), _752);
    float3 _2509 = float3(_764, _772, float(int(_734)));
    float3 _2511 = select(_2509, float3(0.0), isnan(_2509));
    float _778 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2511.xy, uint(rint(_2511.z)), _752);
    float _780 = fma(_756, 1.5, _744);
    float _782 = fma(_768, 0.5, _748);
    float3 _2526 = float3(_780, _772, float(int(_734)));
    float3 _2528 = select(_2526, float3(0.0), isnan(_2526));
    float _784 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2528.xy, uint(rint(_2528.z)), _752);
    float3 _2537 = float3(_780, _782, float(int(_734)));
    float3 _2539 = select(_2537, float3(0.0), isnan(_2537));
    float _786 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2539.xy, uint(rint(_2539.z)), _752);
    float3 _2548 = float3(_760, _782, float(int(_734)));
    float3 _2550 = select(_2548, float3(0.0), isnan(_2548));
    float _788 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2550.xy, uint(rint(_2550.z)), _752);
    float3 _2559 = float3(_762, _782, float(int(_734)));
    float3 _2561 = select(_2559, float3(0.0), isnan(_2559));
    float _790 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2561.xy, uint(rint(_2561.z)), _752);
    float2 _2567 = float2(_54, _56);
    float2 _794 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2567, float2(0.0), isnan(_2567))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2567, float2(0.0), isnan(_2567))).xy;
    float _796 = _794.x;
    float _798 = _794.y;
    float _800 = _766 + _576;
    float _802 = _800 + _578;
    float _804 = _802 + _580;
    float _806 = _804 + _582;
    float _808 = fma(_768, -0.5, _748);
    float _810 = _806 + _770;
    float _812 = _784 + _774;
    float _814 = _812 + _776;
    float _816 = _814 + _778;
    float _818 = _816 + _786;
    float3 _2612 = float3(_764, _782, float(int(_734)));
    float3 _2614 = select(_2612, float3(0.0), isnan(_2612));
    float _820 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2614.xy, uint(rint(_2614.z)), _752);
    float3 _2623 = float3(_780, _808, float(int(_734)));
    float3 _2625 = select(_2623, float3(0.0), isnan(_2623));
    float _822 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2625.xy, uint(rint(_2625.z)), _752);
    float3 _2634 = float3(_760, _808, float(int(_734)));
    float3 _2636 = select(_2634, float3(0.0), isnan(_2634));
    float _824 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2636.xy, uint(rint(_2636.z)), _752);
    float3 _2645 = float3(_762, _808, float(int(_734)));
    float3 _2647 = select(_2645, float3(0.0), isnan(_2645));
    float _826 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2647.xy, uint(rint(_2647.z)), _752);
    float _828 = _818 + _788;
    float _830 = fma(_768, -1.5, _748);
    float _832 = _828 + _790;
    float _834 = fma(_796, 2.0, -1.0);
    float _836 = fma(_798, 2.0, -1.0);
    float _838 = _834 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _840 = _836 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _842 = fma(_838, 2.0, _54);
    float _844 = fma(_840, 2.0, _56);
    float3 _2686 = float3(_764, _808, float(int(_734)));
    float3 _2688 = select(_2686, float3(0.0), isnan(_2686));
    float _846 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2688.xy, uint(rint(_2688.z)), _752);
    float3 _2697 = float3(_780, _830, float(int(_734)));
    float3 _2699 = select(_2697, float3(0.0), isnan(_2697));
    float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2699.xy, uint(rint(_2699.z)), _752);
    float3 _2708 = float3(_760, _830, float(int(_734)));
    float3 _2710 = select(_2708, float3(0.0), isnan(_2708));
    float _850 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2710.xy, uint(rint(_2710.z)), _752);
    float3 _2719 = float3(_762, _830, float(int(_734)));
    float3 _2721 = select(_2719, float3(0.0), isnan(_2719));
    float _852 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2721.xy, uint(rint(_2721.z)), _752);
    float3 _2730 = float3(_764, _830, float(int(_734)));
    float3 _2732 = select(_2730, float3(0.0), isnan(_2730));
    float _854 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2732.xy, uint(rint(_2732.z)), _752);
    float2 _2738 = float2(_842, _844);
    float _856 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2738, float2(0.0), isnan(_2738))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2738, float2(0.0), isnan(_2738))).x;
    float _858 = _810 * 0.0625;
    float _860 = _832 + _820;
    float _862 = _860 + _822;
    float _864 = _862 + _824;
    float _866 = _864 + _826;
    float _868 = _866 + _846;
    float _870 = _868 + _848;
    float _872 = _870 + _850;
    float _874 = -_70;
    float _876 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _878 = _874 + _876;
    float _880 = -_70;
    float _882 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _884 = _880 + _882;
    float _886 = _872 + _852;
    float _888 = _878 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _890 = precise::clamp(_888, 0.0, 1.0);
    float _892 = _884 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _894 = precise::clamp(_892, 0.0, 1.0);
    float _896 = _886 + _854;
    float _898 = fma(_554, 0.0625, _890);
    float _900 = _896 * 0.0625;
    float _902 = _900 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _904 = fma(_858, (*spvDescriptorSet0.fp_c3)._m0[49].z, _902);
    float _906 = _904 + _894;
    out.m_47.x = _856;
    out.m_47.y = _898;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _906;
    return out;
}

