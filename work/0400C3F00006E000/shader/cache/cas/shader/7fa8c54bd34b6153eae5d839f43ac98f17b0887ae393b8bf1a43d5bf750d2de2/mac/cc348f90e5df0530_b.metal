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
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_47 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0), center_no_perspective]];
    float4 m_44 [[user(locn1), center_no_perspective]];
    float4 m_42 [[user(locn2), center_no_perspective]];
    float4 m_38 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _286 = false;
    bool _284 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _562 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_562, float2(0.0), isnan(_562)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _579 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_579, float2(0.0), isnan(_579))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_579, float2(0.0), isnan(_579))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_42.y;
    float _74 = in.m_40.x;
    float _76 = in.m_44.y;
    float _78 = in.m_42.x;
    float _80 = in.m_44.x;
    float _82 = -_62;
    float _84 = fma(_82, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _86 = -_64;
    float _88 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _90 = -_66;
    float _92 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _94 = 1.0 / _84;
    float _96 = 1.0 / _88;
    float _98 = 1.0 / _92;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = _94 * _100;
    float _104 = _70 * _102;
    float _106 = _74 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _96 * _108;
    float _112 = -_104;
    float _114 = fma(_110, _72, _112);
    float _116 = -_106;
    float _118 = fma(_110, _78, _116);
    float _120 = -_102;
    float _122 = _120 + _110;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _126 = _98 * _124;
    float _128 = _114 * _114;
    float _130 = -_104;
    float _132 = fma(_126, _76, _130);
    float _134 = -_106;
    float _136 = fma(_126, _80, _134);
    float _138 = fma(_118, _118, _128);
    float _140 = -_102;
    float _142 = _140 + _126;
    float _144 = _132 * _132;
    float _146 = fma(_122, _122, _138);
    float _148 = fma(_136, _136, _144);
    float _150 = fma(_142, _142, _148);
    float _152 = rsqrt(_146);
    float _154 = rsqrt(_150);
    float _156 = -_68;
    float _158 = fma(_156, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _160 = _118 * _152;
    float _162 = _122 * _152;
    float _164 = _114 * _152;
    float _166 = 1.0 / _158;
    float _168 = _142 * _154;
    float _170 = _132 * _154;
    float _172 = _136 * _154;
    float _174 = _160 * _168;
    float _176 = _162 * _170;
    float _178 = -_174;
    float _180 = fma(_162, _172, _178);
    float _182 = -_176;
    float _184 = fma(_164, _168, _182);
    float _186 = _164 * _172;
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _190 = _166 * _188;
    float _192 = _180 * _180;
    float _194 = -_186;
    float _196 = fma(_160, _170, _194);
    float _198 = fma(_184, _184, _192);
    float _200 = -_190;
    bool _204 = _200 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _206 = -_190;
    bool _208 = _206 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _210 = fma(_196, _196, _198);
    bool _212 = !_204;
    uint _215 = uint(_212 ? 0 : 1);
    float _217 = rsqrt(_210);
    uint _219 = 2u;
    if (!_204)
    {
        _219 = 1u;
    }
    uint _221 = _219;
    uint _223 = _221;
    if (!_208)
    {
        _223 = _215;
    }
    uint _225 = _223;
    uint _227 = min(_225, 2u);
    float _229 = _180 * _217;
    float _231 = _184 * _217;
    float _233 = _196 * _217;
    int _236 = int(_227) << 2;
    float _238 = _229 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    float _240 = fma(_231, (*spvDescriptorSet0.fp_c3)._m0[35].x, _238);
    float _242 = fma(_233, (*spvDescriptorSet0.fp_c3)._m0[35].z, _240);
    uint _244 = uint(int(uint(_236) >> uint(2)));
    uint _246 = uint(int(uint(int(_244)) >> uint(2)));
    int _248 = int(_244) & 3;
    float _250 = (*spvDescriptorSet0.fp_c1)._m0[int(_246)][_248];
    float _252 = abs(_242);
    float _254 = -_252;
    float _256 = _254 + 1.0;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = abs(_258);
    float _262 = log2(_260);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _266 = exp2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _270 = _231 * _268;
    float _272 = _229 * _268;
    float _274 = fma(_233, _268, _190);
    float _276 = fma(_190, _74, _270);
    float _278 = fma(_190, _70, _272);
    bool _280 = as_type<int>(_250) == 1344;
    if (!_280)
    {
        bool _282 = as_type<int>(_250) == 1616;
        _284 = _282;
        if (!_284)
        {
            _286 = true;
        }
    }
    float _320;
    float _322;
    float _324;
    float _326;
    if (!_284)
    {
        if (!_286)
        {
            float _288 = _278 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _290 = _278 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _292 = _278 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _294 = _278 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _296 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[0].x, _288);
            float _298 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[1].x, _290);
            float _300 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[2].x, _292);
            float _302 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[3].x, _294);
            float _304 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].z, _296);
            float _306 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[1].z, _298);
            float _308 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[2].z, _300);
            float _310 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[3].z, _302);
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _320 = _318;
            _322 = _316;
            _324 = _312;
            _326 = _314;
        }
    }
    if ((false || _286) || _284)
    {
        if ((!_286) || _284)
        {
            _284 = false;
            float _328 = _278 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _330 = _278 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _332 = _278 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _334 = _278 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _336 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[4].x, _328);
            float _338 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[5].x, _330);
            float _340 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[6].x, _332);
            float _342 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[7].x, _334);
            float _344 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[4].z, _336);
            float _346 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[5].z, _338);
            float _348 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[6].z, _340);
            float _350 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[7].z, _342);
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _320 = _358;
            _322 = _356;
            _324 = _352;
            _326 = _354;
        }
        if (false || _286)
        {
            _286 = false;
            float _360 = _278 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _362 = _278 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _364 = _278 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _366 = _278 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _368 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[8].x, _360);
            float _370 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[9].x, _362);
            float _372 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[10].x, _364);
            float _374 = fma(_276, (*spvDescriptorSet0.fp_c3)._m0[11].x, _366);
            float _376 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[8].z, _368);
            float _378 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[9].z, _370);
            float _380 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[10].z, _372);
            float _382 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[11].z, _374);
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _320 = _390;
            _322 = _388;
            _324 = _384;
            _326 = _386;
        }
    }
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float _400 = 1.0 / _392;
    float _402 = float(int(_225));
    float _404 = rint(_402);
    float _406 = precise::max(_404, 0.0);
    uint _408 = uint(_406);
    uint _410 = clamp(_408, 0u, 65535u);
    float _412 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _414 = _400 * _394;
    float _416 = precise::clamp(_414, 0.0, 1.0);
    float _418 = _400 * _396;
    float _420 = _400 * _398;
    float _422 = _416 * _412;
    float _424 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _426 = fma(_422, 0.5, _418);
    float _428 = fma(_422, 1.5, _418);
    float _430 = fma(_422, -0.5, _418);
    float _432 = fma(_422, -1.5, _418);
    float _434 = _416 * _424;
    float _436 = fma(_434, 1.5, _420);
    float _438 = fma(_434, 0.5, _420);
    float3 _1254 = float3(_426, _436, float(int(_410)));
    float3 _1258 = select(_1254, float3(0.0), isnan(_1254));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1258.xy, uint(rint(_1258.z)), _416);
    float3 _1267 = float3(_428, _436, float(int(_410)));
    float3 _1269 = select(_1267, float3(0.0), isnan(_1267));
    float _442 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1269.xy, uint(rint(_1269.z)), _416);
    float3 _1278 = float3(_430, _436, float(int(_410)));
    float3 _1280 = select(_1278, float3(0.0), isnan(_1278));
    float _444 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1280.xy, uint(rint(_1280.z)), _416);
    float3 _1289 = float3(_432, _436, float(int(_410)));
    float3 _1291 = select(_1289, float3(0.0), isnan(_1289));
    float _446 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1291.xy, uint(rint(_1291.z)), _416);
    float3 _1300 = float3(_428, _438, float(int(_410)));
    float3 _1302 = select(_1300, float3(0.0), isnan(_1300));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1302.xy, uint(rint(_1302.z)), _416);
    float3 _1311 = float3(_426, _438, float(int(_410)));
    float3 _1313 = select(_1311, float3(0.0), isnan(_1311));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1313.xy, uint(rint(_1313.z)), _416);
    float2 _1319 = float2(_54, _56);
    float2 _454 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1319, float2(0.0), isnan(_1319))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1319, float2(0.0), isnan(_1319))).xy;
    float _456 = _454.x;
    float _458 = _454.y;
    float3 _1334 = float3(_430, _438, float(int(_410)));
    float3 _1336 = select(_1334, float3(0.0), isnan(_1334));
    float _460 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1336.xy, uint(rint(_1336.z)), _416);
    float _462 = fma(_434, -0.5, _420);
    float _464 = _442 + _440;
    float _466 = _464 + _444;
    float _468 = _466 + _446;
    float _470 = _468 + _448;
    float3 _1360 = float3(_432, _438, float(int(_410)));
    float3 _1362 = select(_1360, float3(0.0), isnan(_1360));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1362.xy, uint(rint(_1362.z)), _416);
    float3 _1371 = float3(_428, _462, float(int(_410)));
    float3 _1373 = select(_1371, float3(0.0), isnan(_1371));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1373.xy, uint(rint(_1373.z)), _416);
    float3 _1382 = float3(_426, _462, float(int(_410)));
    float3 _1384 = select(_1382, float3(0.0), isnan(_1382));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1384.xy, uint(rint(_1384.z)), _416);
    float3 _1393 = float3(_430, _462, float(int(_410)));
    float3 _1395 = select(_1393, float3(0.0), isnan(_1393));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1395.xy, uint(rint(_1395.z)), _416);
    float _480 = fma(_434, -1.5, _420);
    float _482 = _470 + _450;
    float _484 = fma(_456, 2.0, -1.0);
    float _486 = fma(_458, 2.0, -1.0);
    float _488 = _482 + _460;
    float _490 = _484 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _492 = _486 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _494 = fma(_490, 2.0, _54);
    float _496 = fma(_492, 2.0, _56);
    float3 _1434 = float3(_432, _462, float(int(_410)));
    float3 _1436 = select(_1434, float3(0.0), isnan(_1434));
    float _498 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1436.xy, uint(rint(_1436.z)), _416);
    float3 _1445 = float3(_428, _480, float(int(_410)));
    float3 _1447 = select(_1445, float3(0.0), isnan(_1445));
    float _500 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1447.xy, uint(rint(_1447.z)), _416);
    float3 _1456 = float3(_426, _480, float(int(_410)));
    float3 _1458 = select(_1456, float3(0.0), isnan(_1456));
    float _502 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1458.xy, uint(rint(_1458.z)), _416);
    float3 _1467 = float3(_430, _480, float(int(_410)));
    float3 _1469 = select(_1467, float3(0.0), isnan(_1467));
    float _504 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1469.xy, uint(rint(_1469.z)), _416);
    float3 _1478 = float3(_432, _480, float(int(_410)));
    float3 _1480 = select(_1478, float3(0.0), isnan(_1478));
    float _506 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1480.xy, uint(rint(_1480.z)), _416);
    float2 _1486 = float2(_494, _496);
    float _508 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1486, float2(0.0), isnan(_1486))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1486, float2(0.0), isnan(_1486))).x;
    float _510 = -_190;
    float _512 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _514 = _510 + _512;
    float _516 = _514 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _518 = precise::clamp(_516, 0.0, 1.0);
    float _520 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[48].w, _518);
    float _522 = _488 + _472;
    float _524 = _522 + _474;
    float _526 = _524 + _476;
    float _528 = _526 + _478;
    float _530 = _528 + _498;
    float _532 = _530 + _500;
    float _534 = -_190;
    float _536 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _538 = _534 + _536;
    float _540 = _532 + _502;
    float _542 = _538 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _544 = precise::clamp(_542, 0.0, 1.0);
    float _546 = _540 + _504;
    float _548 = _546 + _506;
    float _550 = fma(_548, 0.0625, _544);
    out.m_47.x = _508;
    out.m_47.y = _550;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _520;
    return out;
}

