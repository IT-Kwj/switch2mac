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
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0), center_no_perspective]];
    float4 m_40 [[user(locn1), center_no_perspective]];
    float4 m_38 [[user(locn2), center_no_perspective]];
    float4 m_34 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _292 = false;
    bool _290 = false;
    float _50 = in.m_34.x;
    float _52 = in.m_34.y;
    float2 _547 = float2(_50, _52);
    float3 _56 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_547, float2(0.0), isnan(_547)), int2(0), component::x).xyw;
    float _58 = _56.x;
    float _60 = _56.y;
    float _62 = _56.z;
    float2 _564 = float2(_50, _52);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_564, float2(0.0), isnan(_564))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_564, float2(0.0), isnan(_564))).x;
    float _66 = in.m_36.y;
    float _68 = in.m_38.y;
    float _70 = in.m_36.x;
    float _72 = in.m_40.y;
    float _74 = in.m_38.x;
    float _76 = in.m_40.x;
    float _78 = -_58;
    float _80 = fma(_78, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _82 = -_60;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_62;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = 1.0 / _80;
    float _92 = 1.0 / _84;
    float _94 = -_64;
    float _96 = fma(_94, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _98 = 1.0 / _88;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _90 * _100;
    float _104 = _66 * _102;
    float _106 = _70 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _92 * _108;
    float _112 = 1.0 / _96;
    float _114 = -_104;
    float _116 = fma(_110, _68, _114);
    float _118 = -_106;
    float _120 = fma(_110, _74, _118);
    float _122 = -_102;
    float _124 = _122 + _110;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _128 = _98 * _126;
    float _130 = _116 * _116;
    float _132 = -_104;
    float _134 = fma(_128, _72, _132);
    float _136 = -_106;
    float _138 = fma(_128, _76, _136);
    float _140 = fma(_120, _120, _130);
    float _142 = -_102;
    float _144 = _142 + _128;
    float _146 = _134 * _134;
    float _148 = fma(_124, _124, _140);
    float _150 = fma(_138, _138, _146);
    float _152 = fma(_144, _144, _150);
    float _154 = rsqrt(_148);
    float _156 = rsqrt(_152);
    float _158 = _120 * _154;
    float _160 = _124 * _154;
    float _162 = _116 * _154;
    float _164 = _144 * _156;
    float _166 = _134 * _156;
    float _168 = _138 * _156;
    float _170 = _158 * _164;
    float _172 = _160 * _166;
    float _174 = -_170;
    float _176 = fma(_160, _168, _174);
    float _178 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _180 = _112 * _178;
    float _182 = -_172;
    float _184 = fma(_162, _164, _182);
    float _186 = _162 * _168;
    float _188 = _176 * _176;
    float _190 = -_180;
    bool _194 = _190 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _196 = -_186;
    float _198 = fma(_158, _166, _196);
    float _200 = fma(_184, _184, _188);
    float _202 = -_180;
    bool _204 = _202 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _206 = -_180;
    bool _208 = _206 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _210 = fma(_198, _198, _200);
    bool _212 = !_194;
    int _215 = _212 ? 0 : 1;
    float _217 = rsqrt(_210);
    int _219 = 2;
    if (!_194)
    {
        _219 = 1;
    }
    int _221 = _219;
    int _223 = _221;
    if (!_204)
    {
        _223 = _215;
    }
    int _225 = _223;
    int _227 = _225 + 1;
    uint _230 = uint(_227);
    if (!_208)
    {
        _230 = uint(_225);
    }
    uint _232 = _230;
    float _234 = _176 * _217;
    float _236 = _184 * _217;
    uint _238 = min(_232, 2u);
    float _240 = _198 * _217;
    float _242 = _234 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _244 = int(_238) << 2;
    float _246 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[35].x, _242);
    uint _248 = uint(int(uint(_244) >> uint(2)));
    uint _250 = uint(int(uint(int(_248)) >> uint(2)));
    int _252 = int(_248) & 3;
    float _254 = (*spvDescriptorSet0.fp_c1)._m0[int(_250)][_252];
    float _256 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[35].z, _246);
    float _258 = abs(_256);
    float _260 = -_258;
    float _262 = _260 + 1.0;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = abs(_264);
    float _268 = log2(_266);
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _272 = exp2(_270);
    float _274 = _272 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _276 = _236 * _274;
    float _278 = _234 * _274;
    float _280 = fma(_240, _274, _180);
    float _282 = fma(_180, _70, _276);
    float _284 = fma(_180, _66, _278);
    bool _286 = as_type<int>(_254) == 1392;
    if (!_286)
    {
        bool _288 = as_type<int>(_254) == 1664;
        _290 = _288;
        if (!_290)
        {
            _292 = true;
        }
    }
    float _326;
    float _328;
    float _330;
    float _332;
    if (!_290)
    {
        if (!_292)
        {
            float _294 = _284 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _296 = _284 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _298 = _284 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _300 = _284 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _302 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[0].x, _294);
            float _304 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[1].x, _296);
            float _306 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[2].x, _298);
            float _308 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[3].x, _300);
            float _310 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[0].z, _302);
            float _312 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[1].z, _304);
            float _314 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[2].z, _306);
            float _316 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[3].z, _308);
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _320 = _312 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _322 = _314 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _324 = _316 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _326 = _324;
            _328 = _322;
            _330 = _318;
            _332 = _320;
        }
    }
    if ((false || _292) || _290)
    {
        if ((!_292) || _290)
        {
            _290 = false;
            float _334 = _284 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _336 = _284 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _338 = _284 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _340 = _284 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _342 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[4].x, _334);
            float _344 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[5].x, _336);
            float _346 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[6].x, _338);
            float _348 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[7].x, _340);
            float _350 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[4].z, _342);
            float _352 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[5].z, _344);
            float _354 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[6].z, _346);
            float _356 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[7].z, _348);
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _360 = _352 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _362 = _354 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _326 = _364;
            _328 = _362;
            _330 = _358;
            _332 = _360;
        }
        if (false || _292)
        {
            _292 = false;
            float _366 = _284 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _368 = _284 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _370 = _284 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _372 = _284 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _374 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[8].x, _366);
            float _376 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[9].x, _368);
            float _378 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[10].x, _370);
            float _380 = fma(_282, (*spvDescriptorSet0.fp_c3)._m0[11].x, _372);
            float _382 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[8].z, _374);
            float _384 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[9].z, _376);
            float _386 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[10].z, _378);
            float _388 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[11].z, _380);
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _392 = _384 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _394 = _386 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _396 = _388 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _326 = _396;
            _328 = _394;
            _330 = _390;
            _332 = _392;
        }
    }
    float _398 = _326;
    float _400 = _328;
    float _402 = _330;
    float _404 = _332;
    float _406 = 1.0 / _398;
    float _408 = float(int(_232));
    float _410 = rint(_408);
    float _412 = precise::max(_410, 0.0);
    uint _414 = uint(_412);
    uint _416 = clamp(_414, 0u, 65535u);
    float _418 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _420 = _406 * _400;
    float _422 = precise::clamp(_420, 0.0, 1.0);
    float _424 = _406 * _402;
    float _426 = _406 * _404;
    float _428 = _422 * _418;
    float _430 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _432 = fma(_428, 0.5, _424);
    float _434 = _422 * _430;
    float _436 = fma(_428, 1.5, _424);
    float _438 = fma(_428, -0.5, _424);
    float _440 = fma(_434, 1.5, _426);
    float _442 = fma(_428, -1.5, _424);
    float3 _1252 = float3(_432, _440, float(int(_416)));
    float3 _1256 = select(_1252, float3(0.0), isnan(_1252));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1256.xy, uint(rint(_1256.z)), _422);
    float3 _1265 = float3(_436, _440, float(int(_416)));
    float3 _1267 = select(_1265, float3(0.0), isnan(_1265));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1267.xy, uint(rint(_1267.z)), _422);
    float3 _1276 = float3(_438, _440, float(int(_416)));
    float3 _1278 = select(_1276, float3(0.0), isnan(_1276));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1278.xy, uint(rint(_1278.z)), _422);
    float3 _1287 = float3(_442, _440, float(int(_416)));
    float3 _1289 = select(_1287, float3(0.0), isnan(_1287));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1289.xy, uint(rint(_1289.z)), _422);
    float _452 = fma(_434, 0.5, _426);
    float3 _1301 = float3(_436, _452, float(int(_416)));
    float3 _1303 = select(_1301, float3(0.0), isnan(_1301));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1303.xy, uint(rint(_1303.z)), _422);
    float3 _1312 = float3(_432, _452, float(int(_416)));
    float3 _1314 = select(_1312, float3(0.0), isnan(_1312));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1314.xy, uint(rint(_1314.z)), _422);
    float3 _1323 = float3(_438, _452, float(int(_416)));
    float3 _1325 = select(_1323, float3(0.0), isnan(_1323));
    float _458 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1325.xy, uint(rint(_1325.z)), _422);
    float _460 = fma(_434, -0.5, _426);
    float3 _1337 = float3(_442, _452, float(int(_416)));
    float3 _1339 = select(_1337, float3(0.0), isnan(_1337));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1339.xy, uint(rint(_1339.z)), _422);
    float3 _1348 = float3(_436, _460, float(int(_416)));
    float3 _1350 = select(_1348, float3(0.0), isnan(_1348));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1350.xy, uint(rint(_1350.z)), _422);
    float3 _1359 = float3(_432, _460, float(int(_416)));
    float3 _1361 = select(_1359, float3(0.0), isnan(_1359));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1361.xy, uint(rint(_1361.z)), _422);
    float3 _1370 = float3(_438, _460, float(int(_416)));
    float3 _1372 = select(_1370, float3(0.0), isnan(_1370));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1372.xy, uint(rint(_1372.z)), _422);
    float _470 = fma(_434, -1.5, _426);
    float3 _1384 = float3(_442, _460, float(int(_416)));
    float3 _1386 = select(_1384, float3(0.0), isnan(_1384));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1386.xy, uint(rint(_1386.z)), _422);
    float3 _1395 = float3(_436, _470, float(int(_416)));
    float3 _1397 = select(_1395, float3(0.0), isnan(_1395));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1397.xy, uint(rint(_1397.z)), _422);
    float3 _1406 = float3(_432, _470, float(int(_416)));
    float3 _1408 = select(_1406, float3(0.0), isnan(_1406));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1408.xy, uint(rint(_1408.z)), _422);
    float3 _1417 = float3(_438, _470, float(int(_416)));
    float3 _1419 = select(_1417, float3(0.0), isnan(_1417));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1419.xy, uint(rint(_1419.z)), _422);
    float3 _1428 = float3(_442, _470, float(int(_416)));
    float3 _1430 = select(_1428, float3(0.0), isnan(_1428));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_A).sample_compare(spvDescriptorSet0.fp_t_tcb_ASmplr, _1430.xy, uint(rint(_1430.z)), _422);
    float _482 = _446 + _444;
    float _484 = -_180;
    float _486 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _488 = _484 + _486;
    float _490 = _482 + _448;
    float _492 = _488 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _494 = precise::clamp(_492, 0.0, 1.0);
    float _496 = _490 + _450;
    float _498 = -_180;
    float _500 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _502 = _498 + _500;
    float _504 = _496 + _454;
    float _506 = _502 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _508 = precise::clamp(_506, 0.0, 1.0);
    float _510 = _504 + _456;
    float _512 = fma(_272, (*spvDescriptorSet0.fp_c3)._m0[48].w, _508);
    float _514 = _510 + _458;
    float _516 = _514 + _462;
    float _518 = _516 + _464;
    float _520 = _518 + _466;
    float _522 = _520 + _468;
    float _524 = _522 + _472;
    float _526 = _524 + _474;
    float _528 = _526 + _476;
    float _530 = _528 + _478;
    float _532 = _530 + _480;
    float _534 = fma(_532, 0.0625, _494);
    out.m_43.x = (*spvDescriptorSet0.fp_c3)._m0[34].x;
    out.m_43.y = _534;
    out.m_43.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_43.w = _512;
    return out;
}

