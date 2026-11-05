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
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    texture2d<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _288 = false;
    bool _286 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _632 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_632, float2(0.0), isnan(_632)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _649 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_649, float2(0.0), isnan(_649))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_649, float2(0.0), isnan(_649))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_42.x;
    float _76 = in.m_44.y;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _88 = -_66;
    float _90 = fma(_88, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _92 = -_68;
    float _94 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _96 = 1.0 / _86;
    float _98 = 1.0 / _90;
    float _100 = 1.0 / _94;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _104 = _96 * _102;
    float _106 = _72 * _104;
    float _108 = _74 * _104;
    float _110 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _112 = _98 * _110;
    float _114 = -_106;
    float _116 = fma(_112, _76, _114);
    float _118 = -_108;
    float _120 = fma(_112, _80, _118);
    float _122 = -_104;
    float _124 = _122 + _112;
    float _126 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _128 = _100 * _126;
    float _130 = _116 * _116;
    float _132 = -_70;
    float _134 = fma(_132, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _136 = -_106;
    float _138 = fma(_128, _78, _136);
    float _140 = -_108;
    float _142 = fma(_128, _82, _140);
    float _144 = fma(_120, _120, _130);
    float _146 = -_104;
    float _148 = _146 + _128;
    float _150 = _138 * _138;
    float _152 = 1.0 / _134;
    float _154 = fma(_124, _124, _144);
    float _156 = fma(_142, _142, _150);
    float _158 = fma(_148, _148, _156);
    float _160 = rsqrt(_154);
    float _162 = rsqrt(_158);
    float _164 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _166 = _152 * _164;
    float _168 = _166 * _74;
    float _170 = -_166;
    bool _174 = _170 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _176 = _166 * _72;
    float _178 = _120 * _160;
    float _180 = _124 * _160;
    float _182 = _116 * _160;
    float _184 = -_166;
    bool _186 = _184 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _188 = _148 * _162;
    float _190 = _142 * _162;
    float _192 = _138 * _162;
    bool _194 = !_174;
    uint _197 = uint(_194 ? 0 : 1);
    float _199 = _178 * _188;
    uint _201 = 2u;
    if (!_174)
    {
        _201 = 1u;
    }
    uint _203 = _201;
    float _205 = _180 * _192;
    float _207 = -_199;
    float _209 = fma(_180, _190, _207);
    float _211 = _182 * _190;
    float _213 = -_205;
    float _215 = fma(_182, _188, _213);
    uint _217 = _203;
    if (!_186)
    {
        _217 = _197;
    }
    uint _219 = _217;
    float _221 = _209 * _209;
    float _223 = -_211;
    float _225 = fma(_178, _192, _223);
    uint _227 = min(_219, 2u);
    float _229 = fma(_215, _215, _221);
    int _232 = int(_227) << 2;
    float _234 = fma(_225, _225, _229);
    float _236 = rsqrt(_234);
    float _238 = _209 * _236;
    float _240 = _215 * _236;
    float _242 = _225 * _236;
    float _244 = _238 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _246 = uint(int(uint(_232) >> uint(2)));
    uint _248 = uint(int(uint(int(_246)) >> uint(2)));
    int _250 = int(_246) & 3;
    float _252 = (*spvDescriptorSet0.fp_c1)._m0[int(_248)][_250];
    float _254 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[35].x, _244);
    float _256 = fma(_242, (*spvDescriptorSet0.fp_c3)._m0[35].z, _254);
    float _258 = abs(_256);
    float _260 = -_258;
    float _262 = _260 + 1.0;
    float _264 = precise::clamp(_262, 0.0, 1.0);
    float _266 = abs(_264);
    float _268 = log2(_266);
    float _270 = _268 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _272 = exp2(_270);
    float _274 = _272 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _276 = fma(_240, _274, _168);
    float _278 = fma(_238, _274, _176);
    float _280 = fma(_242, _274, _166);
    bool _282 = as_type<int>(_252) == 1344;
    if (!_282)
    {
        bool _284 = as_type<int>(_252) == 1616;
        _286 = _284;
        if (!_286)
        {
            _288 = true;
        }
    }
    float _322;
    float _324;
    float _326;
    float _328;
    if (!_286)
    {
        if (!_288)
        {
            float _290 = _278 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _292 = _278 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _294 = _278 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _296 = _278 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _298 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[0].x, _290);
            float _300 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[1].x, _292);
            float _302 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[2].x, _294);
            float _304 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[3].x, _296);
            float _306 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[0].z, _298);
            float _308 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[1].z, _300);
            float _310 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[2].z, _302);
            float _312 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[3].z, _304);
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _320 = _312 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _322 = _320;
            _324 = _318;
            _326 = _314;
            _328 = _316;
        }
    }
    if ((false || _288) || _286)
    {
        if ((!_288) || _286)
        {
            _286 = false;
            float _330 = _278 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _332 = _278 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _334 = _278 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _336 = _278 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _338 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].x, _330);
            float _340 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[5].x, _332);
            float _342 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[6].x, _334);
            float _344 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[7].x, _336);
            float _346 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[4].z, _338);
            float _348 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[5].z, _340);
            float _350 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[6].z, _342);
            float _352 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[7].z, _344);
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _360 = _352 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _322 = _360;
            _324 = _358;
            _326 = _354;
            _328 = _356;
        }
        if (false || _288)
        {
            _288 = false;
            float _362 = _278 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _364 = _278 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _366 = _278 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _368 = _278 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _370 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[8].x, _362);
            float _372 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[9].x, _364);
            float _374 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[10].x, _366);
            float _376 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[11].x, _368);
            float _378 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[8].z, _370);
            float _380 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[9].z, _372);
            float _382 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[10].z, _374);
            float _384 = fma(_280, (*spvDescriptorSet0.fp_c3)._m0[11].z, _376);
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _392 = _384 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _322 = _392;
            _324 = _390;
            _326 = _386;
            _328 = _388;
        }
    }
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float _400 = _328;
    float _402 = 1.0 / _394;
    float _404 = float(int(_219));
    float _406 = rint(_404);
    float _408 = precise::max(_406, 0.0);
    uint _410 = uint(_408);
    uint _412 = clamp(_410, 0u, 65535u);
    float _414 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _416 = _402 * _396;
    float _418 = precise::clamp(_416, 0.0, 1.0);
    float _420 = _402 * _398;
    float _422 = _402 * _400;
    float _424 = _418 * _414;
    float _426 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _428 = _418 * _426;
    float _430 = fma(_424, 0.5, _420);
    float _432 = fma(_428, 1.5, _422);
    float _434 = fma(_424, -0.5, _420);
    float _436 = fma(_424, -1.5, _420);
    float _438 = fma(_424, 1.5, _420);
    float3 _1321 = float3(_430, _432, float(int(_412)));
    float3 _1325 = select(_1321, float3(0.0), isnan(_1321));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1325.xy, uint(rint(_1325.z)), _418);
    float3 _1334 = float3(_434, _432, float(int(_412)));
    float3 _1336 = select(_1334, float3(0.0), isnan(_1334));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1336.xy, uint(rint(_1336.z)), _418);
    float3 _1345 = float3(_436, _432, float(int(_412)));
    float3 _1347 = select(_1345, float3(0.0), isnan(_1345));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1347.xy, uint(rint(_1347.z)), _418);
    float3 _1356 = float3(_438, _432, float(int(_412)));
    float3 _1358 = select(_1356, float3(0.0), isnan(_1356));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1358.xy, uint(rint(_1358.z)), _418);
    float _448 = fma(_428, 0.5, _422);
    float3 _1370 = float3(_438, _448, float(int(_412)));
    float3 _1372 = select(_1370, float3(0.0), isnan(_1370));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1372.xy, uint(rint(_1372.z)), _418);
    float3 _1381 = float3(_430, _448, float(int(_412)));
    float3 _1383 = select(_1381, float3(0.0), isnan(_1381));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1383.xy, uint(rint(_1383.z)), _418);
    float3 _1392 = float3(_434, _448, float(int(_412)));
    float3 _1394 = select(_1392, float3(0.0), isnan(_1392));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1394.xy, uint(rint(_1394.z)), _418);
    float3 _1403 = float3(_436, _448, float(int(_412)));
    float3 _1405 = select(_1403, float3(0.0), isnan(_1403));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1405.xy, uint(rint(_1405.z)), _418);
    float2 _1411 = float2(_56, _58);
    float2 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1411, float2(0.0), isnan(_1411))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1411, float2(0.0), isnan(_1411))).xy;
    float _462 = _460.x;
    float _464 = _460.y;
    float _466 = fma(_428, -1.5, _422);
    float _468 = _446 + _440;
    float _470 = _468 + _442;
    float _472 = _470 + _444;
    float _474 = _472 + _450;
    float _476 = fma(_428, -0.5, _422);
    float _478 = _474 + _452;
    float3 _1447 = float3(_438, _476, float(int(_412)));
    float3 _1449 = select(_1447, float3(0.0), isnan(_1447));
    float _480 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1449.xy, uint(rint(_1449.z)), _418);
    float3 _1458 = float3(_430, _476, float(int(_412)));
    float3 _1460 = select(_1458, float3(0.0), isnan(_1458));
    float _482 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1460.xy, uint(rint(_1460.z)), _418);
    float3 _1469 = float3(_434, _476, float(int(_412)));
    float3 _1471 = select(_1469, float3(0.0), isnan(_1469));
    float _484 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1471.xy, uint(rint(_1471.z)), _418);
    float3 _1480 = float3(_436, _476, float(int(_412)));
    float3 _1482 = select(_1480, float3(0.0), isnan(_1480));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1482.xy, uint(rint(_1482.z)), _418);
    float _488 = _176 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _490 = _176 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _492 = _478 + _454;
    float _494 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[15].x, _488);
    float _496 = _176 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _498 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[15].z, _494);
    float _500 = _498 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _502 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[12].x, _496);
    float _504 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[13].x, _490);
    float _506 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[12].z, _502);
    float _508 = 1.0 / _500;
    float _510 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[13].z, _504);
    float _512 = _506 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _514 = _510 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _516 = fma(_462, 2.0, -1.0);
    float _518 = fma(_464, 2.0, -1.0);
    float _520 = _512 * _508;
    float _522 = _514 * _508;
    float _524 = _492 + _456;
    float _526 = _516 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _528 = _518 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float2 _1574 = float2(_520, _522);
    float2 _530 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1574, float2(0.0), isnan(_1574))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1574, float2(0.0), isnan(_1574))).xy;
    float _532 = _530.x;
    float _534 = _530.y;
    float _536 = fma(_526, 2.0, _56);
    float _538 = fma(_528, 2.0, _58);
    float3 _1595 = float3(_438, _466, float(int(_412)));
    float3 _1597 = select(_1595, float3(0.0), isnan(_1595));
    float _540 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1597.xy, uint(rint(_1597.z)), _418);
    float3 _1606 = float3(_430, _466, float(int(_412)));
    float3 _1608 = select(_1606, float3(0.0), isnan(_1606));
    float _542 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1608.xy, uint(rint(_1608.z)), _418);
    float3 _1617 = float3(_434, _466, float(int(_412)));
    float3 _1619 = select(_1617, float3(0.0), isnan(_1617));
    float _544 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1619.xy, uint(rint(_1619.z)), _418);
    float3 _1628 = float3(_436, _466, float(int(_412)));
    float3 _1630 = select(_1628, float3(0.0), isnan(_1628));
    float _546 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1630.xy, uint(rint(_1630.z)), _418);
    float2 _1636 = float2(_536, _538);
    float _548 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1636, float2(0.0), isnan(_1636))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1636, float2(0.0), isnan(_1636))).x;
    float _550 = _176 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _552 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[14].x, _550);
    float _554 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[14].z, _552);
    float _556 = _554 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _558 = precise::min(_556, 1.0);
    float _560 = -_166;
    float _562 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _564 = _560 + _562;
    float _566 = _564 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _568 = precise::clamp(_566, 0.0, 1.0);
    float _570 = _524 + _480;
    float _572 = _570 + _482;
    float _574 = _572 + _484;
    float _576 = _574 + _486;
    float _578 = -_532;
    float _580 = fma(_578, _532, _534);
    float _582 = -_532;
    float _584 = _558 + _582;
    float _586 = fma(_584, _584, _580);
    bool _588 = _584 <= 0.001000000047497451305389404296875;
    float _590 = float(_588);
    float _592 = _576 + _540;
    float _594 = 1.0 / _586;
    float _596 = _592 + _542;
    float _598 = _596 + _544;
    float _600 = -_166;
    float _602 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _604 = _600 + _602;
    float _606 = _580 * _594;
    float _608 = _598 + _546;
    float _610 = _604 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = precise::max(_606, _590);
    float _616 = fma(_608, 0.0625, _568);
    float _618 = precise::min(_614, 1.0);
    float _620 = _618 + _612;
    out.m_49.x = _548;
    out.m_49.y = _616;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _620;
    return out;
}

