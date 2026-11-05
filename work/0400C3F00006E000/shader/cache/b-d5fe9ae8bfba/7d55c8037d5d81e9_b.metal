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
    bool _286 = false;
    bool _284 = false;
    float _54 = in.m_38.x;
    float _56 = in.m_38.y;
    float2 _576 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_576, float2(0.0), isnan(_576)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _593 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_593, float2(0.0), isnan(_593))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_593, float2(0.0), isnan(_593))).x;
    float _70 = in.m_40.y;
    float _72 = in.m_40.x;
    float _74 = in.m_42.y;
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
    float _106 = _72 * _102;
    float _108 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _110 = _96 * _108;
    float _112 = -_104;
    float _114 = fma(_110, _74, _112);
    float _116 = -_106;
    float _118 = fma(_110, _78, _116);
    float _120 = -_102;
    float _122 = _120 + _110;
    float _124 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _126 = _98 * _124;
    float _128 = _114 * _114;
    float _130 = -_68;
    float _132 = fma(_130, (*spvDescriptorSet0.fp_c3)._m0[46].w, 1.0);
    float _134 = -_104;
    float _136 = fma(_126, _76, _134);
    float _138 = -_106;
    float _140 = fma(_126, _80, _138);
    float _142 = fma(_118, _118, _128);
    float _144 = -_102;
    float _146 = _144 + _126;
    float _148 = _136 * _136;
    float _150 = 1.0 / _132;
    float _152 = fma(_122, _122, _142);
    float _154 = fma(_140, _140, _148);
    float _156 = fma(_146, _146, _154);
    float _158 = rsqrt(_152);
    float _160 = rsqrt(_156);
    float _162 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _164 = _150 * _162;
    float _166 = _164 * _72;
    float _168 = -_164;
    bool _172 = _168 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _174 = _164 * _70;
    float _176 = _118 * _158;
    float _178 = _122 * _158;
    float _180 = _114 * _158;
    float _182 = -_164;
    bool _184 = _182 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _186 = _146 * _160;
    float _188 = _140 * _160;
    float _190 = _136 * _160;
    bool _192 = !_172;
    uint _195 = uint(_192 ? 0 : 1);
    float _197 = _176 * _186;
    uint _199 = 2u;
    if (!_172)
    {
        _199 = 1u;
    }
    uint _201 = _199;
    float _203 = _178 * _190;
    float _205 = -_197;
    float _207 = fma(_178, _188, _205);
    float _209 = _180 * _188;
    float _211 = -_203;
    float _213 = fma(_180, _186, _211);
    uint _215 = _201;
    if (!_184)
    {
        _215 = _195;
    }
    uint _217 = _215;
    float _219 = _207 * _207;
    float _221 = -_209;
    float _223 = fma(_176, _190, _221);
    uint _225 = min(_217, 2u);
    float _227 = fma(_213, _213, _219);
    int _230 = int(_225) << 2;
    float _232 = fma(_223, _223, _227);
    float _234 = rsqrt(_232);
    float _236 = _207 * _234;
    float _238 = _213 * _234;
    float _240 = _223 * _234;
    float _242 = _236 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _244 = uint(int(uint(_230) >> uint(2)));
    uint _246 = uint(int(uint(int(_244)) >> uint(2)));
    int _248 = int(_244) & 3;
    float _250 = (*spvDescriptorSet0.fp_c1)._m0[int(_246)][_248];
    float _252 = fma(_238, (*spvDescriptorSet0.fp_c3)._m0[35].x, _242);
    float _254 = fma(_240, (*spvDescriptorSet0.fp_c3)._m0[35].z, _252);
    float _256 = abs(_254);
    float _258 = -_256;
    float _260 = _258 + 1.0;
    float _262 = precise::clamp(_260, 0.0, 1.0);
    float _264 = abs(_262);
    float _266 = log2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _270 = exp2(_268);
    float _272 = _270 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _274 = fma(_238, _272, _166);
    float _276 = fma(_236, _272, _174);
    float _278 = fma(_240, _272, _164);
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
            float _288 = _276 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _290 = _276 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _292 = _276 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _294 = _276 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _296 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].x, _288);
            float _298 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[1].x, _290);
            float _300 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[2].x, _292);
            float _302 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[3].x, _294);
            float _304 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[0].z, _296);
            float _306 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[1].z, _298);
            float _308 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[2].z, _300);
            float _310 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[3].z, _302);
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _316 = _308 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _318 = _310 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _320 = _318;
            _322 = _312;
            _324 = _316;
            _326 = _314;
        }
    }
    if ((false || _286) || _284)
    {
        if ((!_286) || _284)
        {
            _284 = false;
            float _328 = _276 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _330 = _276 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _332 = _276 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _334 = _276 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _336 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[4].x, _328);
            float _338 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[5].x, _330);
            float _340 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[6].x, _332);
            float _342 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[7].x, _334);
            float _344 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[4].z, _336);
            float _346 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[5].z, _338);
            float _348 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[6].z, _340);
            float _350 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[7].z, _342);
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _356 = _348 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _358 = _350 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _320 = _358;
            _322 = _352;
            _324 = _356;
            _326 = _354;
        }
        if (false || _286)
        {
            _286 = false;
            float _360 = _276 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _362 = _276 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _364 = _276 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _366 = _276 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _368 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[8].x, _360);
            float _370 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[9].x, _362);
            float _372 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[10].x, _364);
            float _374 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[11].x, _366);
            float _376 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[8].z, _368);
            float _378 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[9].z, _370);
            float _380 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[10].z, _372);
            float _382 = fma(_278, (*spvDescriptorSet0.fp_c3)._m0[11].z, _374);
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _388 = _380 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _390 = _382 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _320 = _390;
            _322 = _384;
            _324 = _388;
            _326 = _386;
        }
    }
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float _400 = _174 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _402 = 1.0 / _392;
    float _404 = _174 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _406 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[15].x, _400);
    float _408 = _174 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _410 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[13].x, _404);
    float _412 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[15].z, _406);
    float _414 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _416 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[13].z, _410);
    float _418 = _412 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _420 = float(int(_217));
    float _422 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[12].x, _408);
    float _424 = _416 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _426 = _402 * _394;
    float _428 = 1.0 / _418;
    float _430 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[12].z, _422);
    float _432 = _402 * _396;
    float _434 = precise::clamp(_432, 0.0, 1.0);
    float _436 = _402 * _398;
    float _438 = _430 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _440 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _442 = -_414;
    float _444 = fma(_434, _442, _436);
    float _446 = rint(_420);
    float _448 = precise::max(_446, 0.0);
    uint _450 = uint(_448);
    uint _452 = clamp(_450, 0u, 65535u);
    float _454 = fma(_434, _440, _426);
    float _456 = -_440;
    float _458 = fma(_434, _456, _426);
    float _460 = fma(_434, _414, _436);
    float _462 = _424 * _428;
    float _464 = _438 * _428;
    float3 _1325 = float3(_426, _460, float(int(_452)));
    float3 _1329 = select(_1325, float3(0.0), isnan(_1325));
    float _466 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1329.xy, uint(rint(_1329.z)), _434);
    float3 _1338 = float3(_454, _460, float(int(_452)));
    float3 _1340 = select(_1338, float3(0.0), isnan(_1338));
    float _468 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1340.xy, uint(rint(_1340.z)), _434);
    float3 _1349 = float3(_458, _460, float(int(_452)));
    float3 _1351 = select(_1349, float3(0.0), isnan(_1349));
    float _470 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1351.xy, uint(rint(_1351.z)), _434);
    float3 _1360 = float3(_454, _436, float(int(_452)));
    float3 _1362 = select(_1360, float3(0.0), isnan(_1360));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1362.xy, uint(rint(_1362.z)), _434);
    float3 _1371 = float3(_426, _436, float(int(_452)));
    float3 _1373 = select(_1371, float3(0.0), isnan(_1371));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1373.xy, uint(rint(_1373.z)), _434);
    float3 _1382 = float3(_458, _436, float(int(_452)));
    float3 _1384 = select(_1382, float3(0.0), isnan(_1382));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1384.xy, uint(rint(_1384.z)), _434);
    float2 _1390 = float2(_464, _462);
    float2 _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1390, float2(0.0), isnan(_1390))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1390, float2(0.0), isnan(_1390))).xy;
    float _482 = _480.x;
    float _484 = _480.y;
    float3 _1405 = float3(_454, _444, float(int(_452)));
    float3 _1407 = select(_1405, float3(0.0), isnan(_1405));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1407.xy, uint(rint(_1407.z)), _434);
    float3 _1416 = float3(_426, _444, float(int(_452)));
    float3 _1418 = select(_1416, float3(0.0), isnan(_1416));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1418.xy, uint(rint(_1418.z)), _434);
    float3 _1427 = float3(_458, _444, float(int(_452)));
    float3 _1429 = select(_1427, float3(0.0), isnan(_1427));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1429.xy, uint(rint(_1429.z)), _434);
    float2 _1435 = float2(_54, _56);
    float _492 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1435, float2(0.0), isnan(_1435))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1435, float2(0.0), isnan(_1435))).x;
    float _494 = _174 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _496 = fma(_166, (*spvDescriptorSet0.fp_c3)._m0[14].x, _494);
    float _498 = fma(_164, (*spvDescriptorSet0.fp_c3)._m0[14].z, _496);
    float _500 = _498 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _502 = precise::min(_500, 1.0);
    float _504 = -_164;
    float _506 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _508 = _504 + _506;
    float _510 = -_164;
    float _512 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _514 = _510 + _512;
    float _516 = _508 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _518 = precise::clamp(_516, 0.0, 1.0);
    float _520 = _468 + _466;
    float _522 = _520 + _470;
    float _524 = _522 + _472;
    float _526 = -_482;
    float _528 = fma(_526, _482, _484);
    float _530 = -_482;
    float _532 = _502 + _530;
    float _534 = _524 + _474;
    float _536 = fma(_532, _532, _528);
    float _538 = _534 + _476;
    bool _540 = _532 <= 0.001000000047497451305389404296875;
    float _542 = float(_540);
    float _544 = _538 + _486;
    float _546 = 1.0 / _536;
    float _548 = _544 + _488;
    float _550 = _548 + _490;
    float _552 = fma(_550, 0.111111111938953399658203125, _518);
    float _554 = _528 * _546;
    float _556 = _514 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _558 = precise::clamp(_556, 0.0, 1.0);
    float _560 = precise::max(_554, _542);
    float _562 = precise::min(_560, 1.0);
    float _564 = _562 + _558;
    out.m_47.x = _492;
    out.m_47.y = _552;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _564;
    return out;
}

