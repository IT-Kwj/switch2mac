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
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
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
    float2 _596 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_596, float2(0.0), isnan(_596)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _613 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_613, float2(0.0), isnan(_613))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_613, float2(0.0), isnan(_613))).x;
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
            _324 = _314;
            _326 = _316;
            _328 = _318;
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
            _324 = _354;
            _326 = _356;
            _328 = _358;
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
            _324 = _386;
            _326 = _388;
            _328 = _390;
        }
    }
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float _400 = _328;
    float2 _1219 = float2(_56, _58);
    float2 _404 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1219, float2(0.0), isnan(_1219))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1219, float2(0.0), isnan(_1219))).xy;
    float _406 = _404.x;
    float _408 = _404.y;
    float _410 = _176 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _412 = 1.0 / _394;
    float _414 = _176 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _416 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[15].x, _410);
    float _418 = _176 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _420 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[13].x, _414);
    float _422 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[15].z, _416);
    float _424 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[13].z, _420);
    float _426 = _422 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _428 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[12].x, _418);
    float _430 = _424 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _432 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[12].z, _428);
    float _434 = 1.0 / _426;
    float _436 = _412 * _396;
    float _438 = _412 * _398;
    float _440 = _432 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _442 = _412 * _400;
    float _444 = precise::clamp(_442, 0.0, 1.0);
    float _446 = _440 * _434;
    float _448 = float(int(_219));
    float _450 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _452 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _454 = _430 * _434;
    float _456 = rint(_448);
    float _458 = precise::max(_456, 0.0);
    uint _460 = uint(_458);
    uint _462 = clamp(_460, 0u, 65535u);
    float _464 = -_452;
    float _466 = fma(_444, _464, _438);
    float _468 = fma(_408, 2.0, -1.0);
    float _470 = fma(_406, 2.0, -1.0);
    float _472 = fma(_444, _450, _436);
    float _474 = _468 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _476 = _470 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _478 = fma(_474, 2.0, _58);
    float _480 = fma(_476, 2.0, _56);
    float _482 = -_450;
    float _484 = fma(_444, _482, _436);
    float _486 = fma(_444, _452, _438);
    float3 _1378 = float3(_436, _486, float(int(_462)));
    float3 _1382 = select(_1378, float3(0.0), isnan(_1378));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1382.xy, uint(rint(_1382.z)), _444);
    float3 _1391 = float3(_472, _486, float(int(_462)));
    float3 _1393 = select(_1391, float3(0.0), isnan(_1391));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1393.xy, uint(rint(_1393.z)), _444);
    float3 _1402 = float3(_484, _486, float(int(_462)));
    float3 _1404 = select(_1402, float3(0.0), isnan(_1402));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1404.xy, uint(rint(_1404.z)), _444);
    float3 _1413 = float3(_472, _438, float(int(_462)));
    float3 _1415 = select(_1413, float3(0.0), isnan(_1413));
    float _494 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1415.xy, uint(rint(_1415.z)), _444);
    float3 _1424 = float3(_436, _438, float(int(_462)));
    float3 _1426 = select(_1424, float3(0.0), isnan(_1424));
    float _496 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1426.xy, uint(rint(_1426.z)), _444);
    float2 _1432 = float2(_446, _454);
    float2 _498 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1432, float2(0.0), isnan(_1432))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1432, float2(0.0), isnan(_1432))).xy;
    float _500 = _498.x;
    float _502 = _498.y;
    float3 _1447 = float3(_484, _438, float(int(_462)));
    float3 _1449 = select(_1447, float3(0.0), isnan(_1447));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1449.xy, uint(rint(_1449.z)), _444);
    float3 _1458 = float3(_472, _466, float(int(_462)));
    float3 _1460 = select(_1458, float3(0.0), isnan(_1458));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1460.xy, uint(rint(_1460.z)), _444);
    float3 _1469 = float3(_436, _466, float(int(_462)));
    float3 _1471 = select(_1469, float3(0.0), isnan(_1469));
    float _508 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1471.xy, uint(rint(_1471.z)), _444);
    float3 _1480 = float3(_484, _466, float(int(_462)));
    float3 _1482 = select(_1480, float3(0.0), isnan(_1480));
    float _510 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1482.xy, uint(rint(_1482.z)), _444);
    float2 _1488 = float2(_480, _478);
    float _512 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1488, float2(0.0), isnan(_1488))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1488, float2(0.0), isnan(_1488))).x;
    float _514 = _176 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _516 = fma(_168, (*spvDescriptorSet0.fp_c3)._m0[14].x, _514);
    float _518 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[14].z, _516);
    float _520 = _518 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _522 = precise::min(_520, 1.0);
    float _524 = -_166;
    float _526 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _528 = _524 + _526;
    float _530 = _528 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _532 = precise::clamp(_530, 0.0, 1.0);
    float _534 = _490 + _488;
    float _536 = _534 + _492;
    float _538 = -_500;
    float _540 = fma(_538, _500, _502);
    float _542 = -_500;
    float _544 = _522 + _542;
    float _546 = _536 + _494;
    float _548 = fma(_544, _544, _540);
    float _550 = _546 + _496;
    bool _552 = _544 <= 0.001000000047497451305389404296875;
    float _554 = float(_552);
    float _556 = 1.0 / _548;
    float _558 = _550 + _504;
    float _560 = _558 + _506;
    float _562 = _560 + _508;
    float _564 = _562 + _510;
    float _566 = _540 * _556;
    float _568 = -_166;
    float _570 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _572 = _568 + _570;
    float _574 = precise::max(_566, _554);
    float _576 = _572 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _578 = precise::clamp(_576, 0.0, 1.0);
    float _580 = precise::min(_574, 1.0);
    float _582 = fma(_564, 0.111111111938953399658203125, _578);
    float _584 = _580 + _532;
    out.m_49.x = _512;
    out.m_49.y = _582;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _584;
    return out;
}

