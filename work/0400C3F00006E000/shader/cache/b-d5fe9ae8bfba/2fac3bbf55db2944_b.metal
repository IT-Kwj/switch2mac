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
    bool _130 = false;
    bool _128 = false;
    float _54 = in.m_42.x;
    float _56 = in.m_42.y;
    float2 _810 = float2(_54, _56);
    float _58 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_810, float2(0.0), isnan(_810))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_810, float2(0.0), isnan(_810))).x;
    float _60 = in.m_44.x;
    float _62 = in.m_44.y;
    float _64 = -_58;
    float _66 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _68 = 1.0 / _66;
    float _70 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _72 = _68 * _70;
    float _74 = _72 * _60;
    float _76 = -_72;
    bool _80 = _76 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _82 = _72 * _62;
    float _84 = -_72;
    bool _86 = _84 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _88 = -_72;
    bool _90 = _88 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _92 = !_80;
    int _95 = _92 ? 0 : 1;
    int _97 = 2;
    if (!_80)
    {
        _97 = 1;
    }
    int _99 = _97;
    int _101 = _99;
    if (!_86)
    {
        _101 = _95;
    }
    int _103 = _101;
    int _105 = _103 + 1;
    uint _108 = uint(_105);
    if (!_90)
    {
        _108 = uint(_103);
    }
    uint _110 = _108;
    uint _112 = min(_110, 2u);
    int _114 = int(_112) << 2;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    uint _118 = uint(int(uint(int(_116)) >> uint(2)));
    int _120 = int(_116) & 3;
    float _122 = (*spvDescriptorSet0.fp_c1)._m0[int(_118)][_120];
    bool _124 = as_type<int>(_122) == 416;
    if (!_124)
    {
        bool _126 = as_type<int>(_122) == 688;
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
            float _132 = _82 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _134 = _82 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _136 = _82 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _138 = _82 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _140 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[0].x, _132);
            float _142 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[1].x, _134);
            float _144 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[2].x, _136);
            float _146 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[3].x, _138);
            float _148 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[0].z, _140);
            float _150 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[1].z, _142);
            float _152 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[2].z, _144);
            float _154 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[3].z, _146);
            float _156 = _148 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _158 = _150 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _160 = _152 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _162 = _154 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _164 = _162;
            _166 = _158;
            _168 = _160;
            _170 = _156;
        }
    }
    if ((false || _130) || _128)
    {
        if ((!_130) || _128)
        {
            _128 = false;
            float _172 = _82 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _174 = _82 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _176 = _82 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _178 = _82 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _180 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].x, _172);
            float _182 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[5].x, _174);
            float _184 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[6].x, _176);
            float _186 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[7].x, _178);
            float _188 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].z, _180);
            float _190 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[5].z, _182);
            float _192 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[6].z, _184);
            float _194 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[7].z, _186);
            float _196 = _188 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _198 = _190 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _200 = _192 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _202 = _194 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _164 = _202;
            _166 = _198;
            _168 = _200;
            _170 = _196;
        }
        if (false || _130)
        {
            _130 = false;
            float _204 = _82 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _206 = _82 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _208 = _82 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _210 = _82 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _212 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[8].x, _204);
            float _214 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[9].x, _206);
            float _216 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[10].x, _208);
            float _218 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[11].x, _210);
            float _220 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[8].z, _212);
            float _222 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[9].z, _214);
            float _224 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[10].z, _216);
            float _226 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[11].z, _218);
            float _228 = _220 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _230 = _222 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _232 = _224 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _234 = _226 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _164 = _234;
            _166 = _230;
            _168 = _232;
            _170 = _228;
        }
    }
    float _236 = _164;
    float _238 = _166;
    float _240 = _168;
    float _242 = _170;
    float _244 = float(int(_110));
    float _246 = 1.0 / _236;
    float _248 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _250 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _252 = rint(_244);
    float _254 = precise::max(_252, 0.0);
    uint _256 = uint(_254);
    uint _258 = clamp(_256, 0u, 65535u);
    float _260 = _246 * _238;
    float _262 = _246 * _240;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = _246 * _242;
    float _268 = fma(_264, _248, _260);
    float _270 = fma(_264, _250, _266);
    float _272 = -_250;
    float _274 = fma(_264, _272, _266);
    float3 _1258 = float3(_266, _268, float(int(_258)));
    float3 _1262 = select(_1258, float3(0.0), isnan(_1258));
    float _276 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1262.xy, uint(rint(_1262.z)), _264);
    float3 _1271 = float3(_270, _268, float(int(_258)));
    float3 _1273 = select(_1271, float3(0.0), isnan(_1271));
    float _278 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1273.xy, uint(rint(_1273.z)), _264);
    float3 _1282 = float3(_274, _268, float(int(_258)));
    float3 _1284 = select(_1282, float3(0.0), isnan(_1282));
    float _280 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1284.xy, uint(rint(_1284.z)), _264);
    float3 _1293 = float3(_270, _260, float(int(_258)));
    float3 _1295 = select(_1293, float3(0.0), isnan(_1293));
    float _282 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1295.xy, uint(rint(_1295.z)), _264);
    float _284 = -_248;
    float _286 = fma(_264, _284, _260);
    float3 _1310 = float3(_266, _260, float(int(_258)));
    float3 _1312 = select(_1310, float3(0.0), isnan(_1310));
    float _288 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1312.xy, uint(rint(_1312.z)), _264);
    float3 _1321 = float3(_274, _260, float(int(_258)));
    float3 _1323 = select(_1321, float3(0.0), isnan(_1321));
    float _290 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1323.xy, uint(rint(_1323.z)), _264);
    float3 _1332 = float3(_270, _286, float(int(_258)));
    float3 _1334 = select(_1332, float3(0.0), isnan(_1332));
    float _292 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1334.xy, uint(rint(_1334.z)), _264);
    float3 _1343 = float3(_266, _286, float(int(_258)));
    float3 _1345 = select(_1343, float3(0.0), isnan(_1343));
    float _294 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1345.xy, uint(rint(_1345.z)), _264);
    float3 _1354 = float3(_274, _286, float(int(_258)));
    float3 _1356 = select(_1354, float3(0.0), isnan(_1354));
    float _296 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1356.xy, uint(rint(_1356.z)), _264);
    float _298 = -_82;
    float _300 = _298 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _302 = -_74;
    float _304 = _302 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _306 = _300 * _300;
    float _308 = fma(_304, _304, _306);
    float _310 = -_72;
    float _312 = _310 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _314 = fma(_312, _312, _308);
    float _316 = sqrt(_314);
    float _318 = _82 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _320 = _82 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _322 = _82 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _324 = _82 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _326 = _82 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _328 = _82 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _330 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[21].x, _318);
    float _332 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[19].x, _320);
    float _334 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[20].x, _322);
    float _336 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[22].x, _324);
    float _338 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[23].x, _326);
    float _340 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[24].x, _328);
    float _342 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[21].z, _330);
    float _344 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[19].z, _332);
    bool _346 = _316 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _348 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[20].z, _334);
    bool _350 = _316 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _352 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[22].z, _336);
    bool _354 = !_346;
    int _356 = _354 ? 0 : 1;
    float _358 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[23].z, _338);
    float _360 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[24].z, _340);
    float _362 = _348 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _364 = _82 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _366 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _368 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[17].x, _364);
    int _370 = 2;
    float _372 = _362;
    if (!_346)
    {
        _370 = 1;
    }
    int _374 = _370;
    int _376 = _374;
    if (!_350)
    {
        _376 = _356;
    }
    int _378 = _376;
    float _380 = _342 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _382 = _344 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _384 = _82 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _386 = float(_378);
    float _388 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[17].z, _368);
    float _390 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[16].x, _384);
    float _392 = precise::min(_386, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _394 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[16].z, _390);
    bool _396 = _392 != 1.0;
    bool _398 = isnan(_392);
    bool _400 = _396 || _398;
    bool _402 = isnan(1.0);
    bool _404 = _400 || _402;
    float _406 = _380;
    float _408 = _382;
    if (_404)
    {
        float _410 = _360 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _406 = _410;
    }
    float _412 = _406;
    float _414 = _412;
    if (_404)
    {
        float _416 = _352 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _408 = _416;
    }
    float _418 = _408;
    float _420 = _418;
    if (_404)
    {
        float _422 = _358 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _372 = _422;
    }
    float _424 = _372;
    bool _426 = _392 != 0.0;
    bool _428 = isnan(_392);
    bool _430 = _426 || _428;
    bool _432 = isnan(0.0);
    bool _434 = _430 || _432;
    float _436 = _82 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _438 = rint(_392);
    float _440 = precise::max(_438, 0.0);
    uint _442 = uint(_440);
    uint _444 = clamp(_442, 0u, 65535u);
    float _446 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _448 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[18].x, _436);
    float _450 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[18].z, _448);
    float _452 = _424;
    if (!_434)
    {
        float _454 = _450 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _414 = _454;
    }
    float _456 = _414;
    if (!_434)
    {
        float _458 = _394 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _420 = _458;
    }
    float _460 = _420;
    if (!_434)
    {
        float _462 = _388 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _452 = _462;
    }
    float _464 = _452;
    float _466 = 0.0 + _456;
    float _468 = precise::clamp(_466, 0.0, 1.0);
    float _470 = fma(_468, _446, _464);
    float _472 = fma(_468, _366, _460);
    float _474 = -_366;
    float _476 = fma(_468, _474, _460);
    float _478 = _278 + _276;
    float _480 = _478 + _280;
    float _482 = _480 + _282;
    float3 _1706 = float3(_460, _470, float(int(_444)));
    float3 _1708 = select(_1706, float3(0.0), isnan(_1706));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1708.xy, uint(rint(_1708.z)), _468);
    float3 _1717 = float3(_472, _470, float(int(_444)));
    float3 _1719 = select(_1717, float3(0.0), isnan(_1717));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1719.xy, uint(rint(_1719.z)), _468);
    float3 _1728 = float3(_476, _470, float(int(_444)));
    float3 _1730 = select(_1728, float3(0.0), isnan(_1728));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1730.xy, uint(rint(_1730.z)), _468);
    float3 _1739 = float3(_472, _464, float(int(_444)));
    float3 _1741 = select(_1739, float3(0.0), isnan(_1739));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1741.xy, uint(rint(_1741.z)), _468);
    float _492 = _482 + _288;
    float3 _1753 = float3(_460, _464, float(int(_444)));
    float3 _1755 = select(_1753, float3(0.0), isnan(_1753));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1755.xy, uint(rint(_1755.z)), _468);
    float _496 = _492 + _290;
    float _498 = _496 + _292;
    float _500 = -_446;
    float _502 = fma(_468, _500, _464);
    float3 _1776 = float3(_476, _464, float(int(_444)));
    float3 _1778 = select(_1776, float3(0.0), isnan(_1776));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1778.xy, uint(rint(_1778.z)), _468);
    float _506 = _498 + _294;
    float3 _1790 = float3(_472, _502, float(int(_444)));
    float3 _1792 = select(_1790, float3(0.0), isnan(_1790));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1792.xy, uint(rint(_1792.z)), _468);
    float2 _1798 = float2(_54, _56);
    float2 _512 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1798, float2(0.0), isnan(_1798))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1798, float2(0.0), isnan(_1798))).xy;
    float _514 = _512.x;
    float _516 = _512.y;
    float3 _1813 = float3(_460, _502, float(int(_444)));
    float3 _1815 = select(_1813, float3(0.0), isnan(_1813));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _1815.xy, uint(rint(_1815.z)), _468);
    float _520 = _82 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _522 = _82 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _524 = _82 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _526 = _82 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _528 = _82 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _530 = _82 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _532 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[27].x, _522);
    float _534 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[28].x, _524);
    float _536 = _82 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _538 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[32].x, _530);
    float _540 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[27].z, _532);
    float _542 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[28].z, _534);
    float _544 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[33].x, _536);
    float _546 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[32].z, _538);
    float _548 = -_74;
    float _550 = _548 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _552 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[26].x, _520);
    float _554 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[31].x, _526);
    float _556 = _506 + _296;
    float _558 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[26].z, _552);
    float _560 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[31].z, _554);
    float _562 = _486 + _484;
    float _564 = _562 + _488;
    float _566 = _82 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _568 = _82 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _570 = -_82;
    float _572 = _570 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _574 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[25].x, _566);
    float _576 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[29].x, _528);
    float _578 = _572 * _572;
    float _580 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[30].x, _568);
    float _582 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[29].z, _576);
    float _584 = fma(_550, _550, _578);
    float _586 = -_72;
    float _588 = _586 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _590 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[30].z, _580);
    float _592 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[25].z, _574);
    float _594 = fma(_588, _588, _584);
    float _596 = _590 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _598 = sqrt(_594);
    bool _600 = _598 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _602 = _598 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _604 = !_600;
    int _606 = _604 ? 0 : 1;
    int _608 = 2;
    float _610 = _596;
    if (!_600)
    {
        _608 = 1;
    }
    int _612 = _608;
    int _614 = _612;
    if (!_602)
    {
        _614 = _606;
    }
    int _616 = _614;
    float _618 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[33].z, _544);
    float _620 = _542 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _622 = float(_616);
    float _624 = precise::min(_622, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _626 = _582 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _628 = _564 + _490;
    bool _630 = _624 != 1.0;
    bool _632 = isnan(_624);
    bool _634 = _630 || _632;
    bool _636 = isnan(1.0);
    bool _638 = _634 || _636;
    float _640 = _620;
    float _642 = _626;
    if (_638)
    {
        float _644 = _560 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _640 = _644;
    }
    float _646 = _640;
    float _648 = _646;
    if (_638)
    {
        float _650 = _546 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _642 = _650;
    }
    float _652 = _642;
    float _654 = _652;
    if (_638)
    {
        float _656 = _618 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _610 = _656;
    }
    float _658 = _610;
    bool _660 = _624 != 0.0;
    bool _662 = isnan(_624);
    bool _664 = _660 || _662;
    bool _666 = isnan(0.0);
    bool _668 = _664 || _666;
    float _670 = rint(_624);
    float _672 = precise::max(_670, 0.0);
    uint _674 = uint(_672);
    uint _676 = clamp(_674, 0u, 65535u);
    float _678 = _658;
    if (!_668)
    {
        float _680 = _540 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _678 = _680;
    }
    float _682 = _678;
    if (!_668)
    {
        float _684 = _592 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _648 = _684;
    }
    float _686 = _648;
    if (!_668)
    {
        float _688 = _558 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _654 = _688;
    }
    float _690 = _654;
    float _692 = 0.0 + _682;
    float _694 = precise::clamp(_692, 0.0, 1.0);
    float _696 = fma(_446, _694, _690);
    float _698 = fma(_366, _694, _686);
    float _700 = -_366;
    float _702 = fma(_700, _694, _686);
    float3 _2156 = float3(_476, _502, float(int(_444)));
    float3 _2158 = select(_2156, float3(0.0), isnan(_2156));
    float _704 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2158.xy, uint(rint(_2158.z)), _468);
    float3 _2167 = float3(_686, _696, float(int(_676)));
    float3 _2169 = select(_2167, float3(0.0), isnan(_2167));
    float _706 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2169.xy, uint(rint(_2169.z)), _694);
    float3 _2178 = float3(_698, _696, float(int(_676)));
    float3 _2180 = select(_2178, float3(0.0), isnan(_2178));
    float _708 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2180.xy, uint(rint(_2180.z)), _694);
    float3 _2189 = float3(_702, _696, float(int(_676)));
    float3 _2191 = select(_2189, float3(0.0), isnan(_2189));
    float _710 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2191.xy, uint(rint(_2191.z)), _694);
    float3 _2200 = float3(_698, _690, float(int(_676)));
    float3 _2202 = select(_2200, float3(0.0), isnan(_2200));
    float _712 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2202.xy, uint(rint(_2202.z)), _694);
    float _714 = _628 + _494;
    float _716 = fma(_516, 2.0, -1.0);
    float _718 = _714 + _504;
    float _720 = fma(_514, 2.0, -1.0);
    float _722 = _718 + _508;
    float _724 = _716 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _726 = -_446;
    float _728 = fma(_726, _694, _690);
    float _730 = fma(_724, 2.0, _56);
    float _732 = _720 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _2244 = float3(_686, _690, float(int(_676)));
    float3 _2246 = select(_2244, float3(0.0), isnan(_2244));
    float _734 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2246.xy, uint(rint(_2246.z)), _694);
    float3 _2255 = float3(_702, _690, float(int(_676)));
    float3 _2257 = select(_2255, float3(0.0), isnan(_2255));
    float _736 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2257.xy, uint(rint(_2257.z)), _694);
    float3 _2266 = float3(_698, _728, float(int(_676)));
    float3 _2268 = select(_2266, float3(0.0), isnan(_2266));
    float _738 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2268.xy, uint(rint(_2268.z)), _694);
    float _740 = fma(_732, 2.0, _54);
    float3 _2280 = float3(_686, _728, float(int(_676)));
    float3 _2282 = select(_2280, float3(0.0), isnan(_2280));
    float _742 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2282.xy, uint(rint(_2282.z)), _694);
    float3 _2291 = float3(_702, _728, float(int(_676)));
    float3 _2293 = select(_2291, float3(0.0), isnan(_2291));
    float _744 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2293.xy, uint(rint(_2293.z)), _694);
    float2 _2299 = float2(_740, _730);
    float _746 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2299, float2(0.0), isnan(_2299))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2299, float2(0.0), isnan(_2299))).x;
    float _748 = _722 + _518;
    float _750 = _748 + _704;
    float _752 = _708 + _706;
    float _754 = _752 + _710;
    float _756 = _754 + _712;
    float _758 = _756 + _734;
    float _760 = _758 + _736;
    float _762 = _760 + _738;
    float _764 = _750 * 0.111111111938953399658203125;
    float _766 = _762 + _742;
    float _768 = -_72;
    float _770 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _772 = _768 + _770;
    float _774 = -_72;
    float _776 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _778 = _774 + _776;
    float _780 = _766 + _744;
    float _782 = _772 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _784 = precise::clamp(_782, 0.0, 1.0);
    float _786 = _780 * 0.111111111938953399658203125;
    float _788 = fma(_556, 0.111111111938953399658203125, _784);
    float _790 = _786 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _792 = fma(_764, (*spvDescriptorSet0.fp_c3)._m0[49].z, _790);
    float _794 = _778 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _796 = precise::clamp(_794, 0.0, 1.0);
    float _798 = _792 + _796;
    out.m_47.x = _746;
    out.m_47.y = _788;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _798;
    return out;
}

