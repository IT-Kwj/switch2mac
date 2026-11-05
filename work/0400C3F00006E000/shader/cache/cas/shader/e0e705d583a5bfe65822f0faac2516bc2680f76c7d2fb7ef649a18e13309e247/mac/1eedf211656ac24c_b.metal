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
    texture2d<float> fp_t_tcb_E [[id(6)]];
    sampler fp_t_tcb_ESmplr [[id(7)]];
    texture2d<float> fp_t_tcb_A [[id(8)]];
    sampler fp_t_tcb_ASmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ESmplr_w [[id(11)]];
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
    bool _296 = false;
    bool _294 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _622 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_622, float2(0.0), isnan(_622)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _639 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_639, float2(0.0), isnan(_639))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_639, float2(0.0), isnan(_639))).x;
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
    float _160 = 1.0 / _158;
    float _162 = _118 * _152;
    float _164 = _122 * _152;
    float _166 = _114 * _152;
    float _168 = _142 * _154;
    float _170 = _132 * _154;
    float _172 = _136 * _154;
    float _174 = _162 * _168;
    float _176 = _164 * _170;
    float _178 = -_174;
    float _180 = fma(_164, _172, _178);
    float _182 = _166 * _172;
    float _184 = -_176;
    float _186 = fma(_166, _168, _184);
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _190 = _160 * _188;
    float _192 = _180 * _180;
    float _194 = -_182;
    float _196 = fma(_162, _170, _194);
    float _198 = _190 * _70;
    float _200 = fma(_186, _186, _192);
    float _202 = -_190;
    bool _206 = _202 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _208 = _190 * _74;
    float _210 = -_190;
    bool _212 = _210 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _214 = fma(_196, _196, _200);
    float _216 = -_190;
    bool _218 = _216 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    bool _220 = !_206;
    int _223 = _220 ? 0 : 1;
    float _225 = rsqrt(_214);
    int _227 = 2;
    if (!_206)
    {
        _227 = 1;
    }
    int _229 = _227;
    int _231 = _229;
    if (!_212)
    {
        _231 = _223;
    }
    int _233 = _231;
    int _235 = _233 + 1;
    uint _238 = uint(_235);
    if (!_218)
    {
        _238 = uint(_233);
    }
    uint _240 = _238;
    float _242 = _180 * _225;
    float _244 = _186 * _225;
    uint _246 = min(_240, 2u);
    float _248 = _196 * _225;
    float _250 = _242 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    int _252 = int(_246) << 2;
    float _254 = fma(_244, (*spvDescriptorSet0.fp_c3)._m0[35].x, _250);
    uint _256 = uint(int(uint(_252) >> uint(2)));
    uint _258 = uint(int(uint(int(_256)) >> uint(2)));
    int _260 = int(_256) & 3;
    float _262 = (*spvDescriptorSet0.fp_c1)._m0[int(_258)][_260];
    float _264 = fma(_248, (*spvDescriptorSet0.fp_c3)._m0[35].z, _254);
    float _266 = abs(_264);
    float _268 = -_266;
    float _270 = _268 + 1.0;
    float _272 = precise::clamp(_270, 0.0, 1.0);
    float _274 = abs(_272);
    float _276 = log2(_274);
    float _278 = _276 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _280 = exp2(_278);
    float _282 = _280 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _284 = fma(_244, _282, _208);
    float _286 = fma(_242, _282, _198);
    float _288 = fma(_248, _282, _190);
    bool _290 = as_type<int>(_262) == 1392;
    if (!_290)
    {
        bool _292 = as_type<int>(_262) == 1664;
        _294 = _292;
        if (!_294)
        {
            _296 = true;
        }
    }
    float _330;
    float _332;
    float _334;
    float _336;
    if (!_294)
    {
        if (!_296)
        {
            float _298 = _286 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _300 = _286 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _302 = _286 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _304 = _286 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _306 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[0].x, _298);
            float _308 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[1].x, _300);
            float _310 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[2].x, _302);
            float _312 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[3].x, _304);
            float _314 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[0].z, _306);
            float _316 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[1].z, _308);
            float _318 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[2].z, _310);
            float _320 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[3].z, _312);
            float _322 = _314 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _324 = _316 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _326 = _318 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _328 = _320 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _330 = _328;
            _332 = _326;
            _334 = _322;
            _336 = _324;
        }
    }
    if ((false || _296) || _294)
    {
        if ((!_296) || _294)
        {
            _294 = false;
            float _338 = _286 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _340 = _286 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _342 = _286 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _344 = _286 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _346 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[4].x, _338);
            float _348 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[5].x, _340);
            float _350 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[6].x, _342);
            float _352 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[7].x, _344);
            float _354 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[4].z, _346);
            float _356 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[5].z, _348);
            float _358 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[6].z, _350);
            float _360 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[7].z, _352);
            float _362 = _354 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _364 = _356 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _366 = _358 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _368 = _360 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _330 = _368;
            _332 = _366;
            _334 = _362;
            _336 = _364;
        }
        if (false || _296)
        {
            _296 = false;
            float _370 = _286 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _372 = _286 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _374 = _286 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _376 = _286 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _378 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[8].x, _370);
            float _380 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[9].x, _372);
            float _382 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[10].x, _374);
            float _384 = fma(_284, (*spvDescriptorSet0.fp_c3)._m0[11].x, _376);
            float _386 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[8].z, _378);
            float _388 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[9].z, _380);
            float _390 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[10].z, _382);
            float _392 = fma(_288, (*spvDescriptorSet0.fp_c3)._m0[11].z, _384);
            float _394 = _386 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _396 = _388 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _398 = _390 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _400 = _392 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _330 = _400;
            _332 = _398;
            _334 = _394;
            _336 = _396;
        }
    }
    float _402 = _330;
    float _404 = _332;
    float _406 = _334;
    float _408 = _336;
    float _410 = 1.0 / _402;
    float _412 = float(int(_240));
    float _414 = rint(_412);
    float _416 = precise::max(_414, 0.0);
    uint _418 = uint(_416);
    uint _420 = clamp(_418, 0u, 65535u);
    float _422 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _424 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _426 = _410 * _404;
    float _428 = precise::clamp(_426, 0.0, 1.0);
    float _430 = _410 * _406;
    float _432 = _410 * _408;
    float _434 = _428 * _422;
    float _436 = _428 * _424;
    float _438 = fma(_434, 0.5, _430);
    float _440 = fma(_436, 0.5, _432);
    float _442 = fma(_436, 1.5, _432);
    float _444 = fma(_434, -0.5, _430);
    float _446 = fma(_434, 1.5, _430);
    float3 _1326 = float3(_438, _442, float(int(_420)));
    float3 _1330 = select(_1326, float3(0.0), isnan(_1326));
    float _448 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1330.xy, uint(rint(_1330.z)), _428);
    float3 _1339 = float3(_444, _442, float(int(_420)));
    float3 _1341 = select(_1339, float3(0.0), isnan(_1339));
    float _450 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1341.xy, uint(rint(_1341.z)), _428);
    float3 _1350 = float3(_446, _440, float(int(_420)));
    float3 _1352 = select(_1350, float3(0.0), isnan(_1350));
    float _452 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1352.xy, uint(rint(_1352.z)), _428);
    float3 _1361 = float3(_438, _440, float(int(_420)));
    float3 _1363 = select(_1361, float3(0.0), isnan(_1361));
    float _454 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1363.xy, uint(rint(_1363.z)), _428);
    float3 _1372 = float3(_444, _440, float(int(_420)));
    float3 _1374 = select(_1372, float3(0.0), isnan(_1372));
    float _456 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1374.xy, uint(rint(_1374.z)), _428);
    float _458 = fma(_434, -1.5, _430);
    float _460 = fma(_436, -0.5, _432);
    float3 _1390 = float3(_458, _440, float(int(_420)));
    float3 _1392 = select(_1390, float3(0.0), isnan(_1390));
    float _462 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1392.xy, uint(rint(_1392.z)), _428);
    float3 _1401 = float3(_438, _460, float(int(_420)));
    float3 _1403 = select(_1401, float3(0.0), isnan(_1401));
    float _464 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1403.xy, uint(rint(_1403.z)), _428);
    float3 _1412 = float3(_458, _442, float(int(_420)));
    float3 _1414 = select(_1412, float3(0.0), isnan(_1412));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1414.xy, uint(rint(_1414.z)), _428);
    float3 _1423 = float3(_446, _442, float(int(_420)));
    float3 _1425 = select(_1423, float3(0.0), isnan(_1423));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1425.xy, uint(rint(_1425.z)), _428);
    float3 _1434 = float3(_446, _460, float(int(_420)));
    float3 _1436 = select(_1434, float3(0.0), isnan(_1434));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1436.xy, uint(rint(_1436.z)), _428);
    float3 _1445 = float3(_444, _460, float(int(_420)));
    float3 _1447 = select(_1445, float3(0.0), isnan(_1445));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1447.xy, uint(rint(_1447.z)), _428);
    float3 _1456 = float3(_458, _460, float(int(_420)));
    float3 _1458 = select(_1456, float3(0.0), isnan(_1456));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1458.xy, uint(rint(_1458.z)), _428);
    float _476 = fma(_436, -1.5, _432);
    float _478 = _198 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _480 = _198 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _482 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[15].x, _478);
    float _484 = _198 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _486 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[13].x, _480);
    float _488 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[15].z, _482);
    float _490 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[12].x, _484);
    float _492 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[13].z, _486);
    float _494 = _488 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _496 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[12].z, _490);
    float _498 = _492 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _500 = 1.0 / _494;
    float _502 = _496 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _504 = _502 * _500;
    float _506 = _498 * _500;
    float2 _1532 = float2(_504, _506);
    float2 _510 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1532, float2(0.0), isnan(_1532))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1532, float2(0.0), isnan(_1532))).xy;
    float _512 = _510.x;
    float _514 = _510.y;
    float3 _1547 = float3(_446, _476, float(int(_420)));
    float3 _1549 = select(_1547, float3(0.0), isnan(_1547));
    float _516 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1549.xy, uint(rint(_1549.z)), _428);
    float3 _1558 = float3(_438, _476, float(int(_420)));
    float3 _1560 = select(_1558, float3(0.0), isnan(_1558));
    float _518 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1560.xy, uint(rint(_1560.z)), _428);
    float3 _1569 = float3(_444, _476, float(int(_420)));
    float3 _1571 = select(_1569, float3(0.0), isnan(_1569));
    float _520 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1571.xy, uint(rint(_1571.z)), _428);
    float3 _1580 = float3(_458, _476, float(int(_420)));
    float3 _1582 = select(_1580, float3(0.0), isnan(_1580));
    float _522 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1582.xy, uint(rint(_1582.z)), _428);
    float2 _1588 = float2(_54, _56);
    float _524 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1588, float2(0.0), isnan(_1588))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1588, float2(0.0), isnan(_1588))).x;
    float _526 = _198 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _528 = fma(_208, (*spvDescriptorSet0.fp_c3)._m0[14].x, _526);
    float _530 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[14].z, _528);
    float _532 = _530 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _534 = precise::min(_532, 1.0);
    float _536 = _468 + _448;
    float _538 = _536 + _450;
    float _540 = _538 + _466;
    float _542 = _540 + _452;
    float _544 = _542 + _454;
    float _546 = _544 + _456;
    float _548 = _546 + _462;
    float _550 = _548 + _470;
    float _552 = _550 + _464;
    float _554 = _552 + _472;
    float _556 = _554 + _474;
    float _558 = -_512;
    float _560 = fma(_558, _512, _514);
    float _562 = -_512;
    float _564 = _534 + _562;
    float _566 = _556 + _516;
    float _568 = fma(_564, _564, _560);
    float _570 = _566 + _518;
    bool _572 = _564 <= 0.001000000047497451305389404296875;
    float _574 = float(_572);
    float _576 = 1.0 / _568;
    float _578 = _570 + _520;
    float _580 = -_190;
    float _582 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _584 = _580 + _582;
    float _586 = _578 + _522;
    float _588 = _584 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _590 = precise::clamp(_588, 0.0, 1.0);
    float _592 = _560 * _576;
    float _594 = -_190;
    float _596 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _598 = _594 + _596;
    float _600 = precise::max(_592, _574);
    float _602 = _598 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _604 = precise::clamp(_602, 0.0, 1.0);
    float _606 = precise::min(_600, 1.0);
    float _608 = fma(_586, 0.0625, _604);
    float _610 = _606 + _590;
    out.m_47.x = _524;
    out.m_47.y = _608;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _610;
    return out;
}

