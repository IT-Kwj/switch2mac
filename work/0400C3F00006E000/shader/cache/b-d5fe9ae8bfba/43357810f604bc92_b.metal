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
    texture2d<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
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
    float2 _554 = float2(_54, _56);
    float3 _60 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_554, float2(0.0), isnan(_554)), int2(0), component::x).xyw;
    float _62 = _60.x;
    float _64 = _60.y;
    float _66 = _60.z;
    float2 _571 = float2(_54, _56);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_571, float2(0.0), isnan(_571))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_571, float2(0.0), isnan(_571))).x;
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
    float _164 = 1.0 / _158;
    float _166 = _114 * _152;
    float _168 = _142 * _154;
    float _170 = _132 * _154;
    float _172 = _136 * _154;
    float _174 = _160 * _168;
    float _176 = _162 * _170;
    float _178 = -_174;
    float _180 = fma(_162, _172, _178);
    float _182 = _166 * _172;
    float _184 = -_176;
    float _186 = fma(_166, _168, _184);
    float _188 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _190 = _164 * _188;
    float _192 = _180 * _180;
    float _194 = -_182;
    float _196 = fma(_160, _170, _194);
    float _198 = _190 * _74;
    float _200 = fma(_186, _186, _192);
    float _202 = -_190;
    bool _206 = _202 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _208 = _190 * _70;
    float _210 = -_190;
    bool _212 = _210 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _214 = fma(_196, _196, _200);
    bool _216 = !_206;
    uint _219 = uint(_216 ? 0 : 1);
    float _221 = rsqrt(_214);
    uint _223 = 2u;
    if (!_206)
    {
        _223 = 1u;
    }
    uint _225 = _223;
    uint _227 = _225;
    if (!_212)
    {
        _227 = _219;
    }
    uint _229 = _227;
    uint _231 = min(_229, 2u);
    float _233 = _180 * _221;
    float _235 = _186 * _221;
    int _238 = int(_231) << 2;
    float _240 = _196 * _221;
    float _242 = _233 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _244 = uint(int(uint(_238) >> uint(2)));
    uint _246 = uint(int(uint(int(_244)) >> uint(2)));
    int _248 = int(_244) & 3;
    float _250 = (*spvDescriptorSet0.fp_c1)._m0[int(_246)][_248];
    float _252 = fma(_235, (*spvDescriptorSet0.fp_c3)._m0[35].x, _242);
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
    float _274 = fma(_235, _272, _198);
    float _276 = fma(_233, _272, _208);
    float _278 = fma(_240, _272, _190);
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
            _322 = _314;
            _324 = _316;
            _326 = _312;
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
            _322 = _354;
            _324 = _356;
            _326 = _352;
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
            _322 = _386;
            _324 = _388;
            _326 = _384;
        }
    }
    float _392 = _320;
    float _394 = _322;
    float _396 = _324;
    float _398 = _326;
    float _400 = _208 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _402 = 1.0 / _392;
    float _404 = _208 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _406 = float(int(_229));
    float _408 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[15].x, _400);
    float _410 = _208 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _412 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[13].x, _404);
    float _414 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[15].z, _408);
    float _416 = rint(_406);
    float _418 = precise::max(_416, 0.0);
    uint _420 = uint(_418);
    uint _422 = clamp(_420, 0u, 65535u);
    float _424 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[13].z, _412);
    float _426 = _414 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _428 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[12].x, _410);
    float _430 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[12].z, _428);
    float _432 = 1.0 / _426;
    float _434 = _402 * _394;
    float _436 = _424 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _438 = _430 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _440 = _402 * _396;
    float _442 = precise::clamp(_440, 0.0, 1.0);
    float _444 = _402 * _398;
    float _446 = _442 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _448 = _446 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _450 = _446 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _452 = _438 * _432;
    float _454 = _436 * _432;
    float _456 = fma(_448, 0.5, _444);
    float _458 = fma(_448, -0.5, _444);
    float _460 = fma(_450, 0.5, _434);
    float _462 = fma(_450, -0.5, _434);
    float2 _1296 = float2(_452, _454);
    float2 _466 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1296, float2(0.0), isnan(_1296))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1296, float2(0.0), isnan(_1296))).xy;
    float _468 = _466.x;
    float _470 = _466.y;
    float3 _1311 = float3(_458, _460, float(int(_422)));
    float3 _1315 = select(_1311, float3(0.0), isnan(_1311));
    float _472 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1315.xy, uint(rint(_1315.z)), _442);
    float3 _1324 = float3(_456, _460, float(int(_422)));
    float3 _1326 = select(_1324, float3(0.0), isnan(_1324));
    float _474 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1326.xy, uint(rint(_1326.z)), _442);
    float3 _1335 = float3(_456, _462, float(int(_422)));
    float3 _1337 = select(_1335, float3(0.0), isnan(_1335));
    float _476 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1337.xy, uint(rint(_1337.z)), _442);
    float3 _1346 = float3(_458, _462, float(int(_422)));
    float3 _1348 = select(_1346, float3(0.0), isnan(_1346));
    float _478 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_C).sample_compare(spvDescriptorSet0.fp_t_tcb_CSmplr, _1348.xy, uint(rint(_1348.z)), _442);
    float2 _1354 = float2(_54, _56);
    float _480 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1354, float2(0.0), isnan(_1354))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1354, float2(0.0), isnan(_1354))).x;
    float _482 = _208 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _484 = fma(_198, (*spvDescriptorSet0.fp_c3)._m0[14].x, _482);
    float _486 = fma(_190, (*spvDescriptorSet0.fp_c3)._m0[14].z, _484);
    float _488 = _486 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _490 = precise::min(_488, 1.0);
    float _492 = -_190;
    float _494 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _496 = _492 + _494;
    float _498 = -_190;
    float _500 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _502 = _498 + _500;
    float _504 = _496 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _506 = precise::clamp(_504, 0.0, 1.0);
    float _508 = -_468;
    float _510 = fma(_508, _468, _470);
    float _512 = -_468;
    float _514 = _490 + _512;
    float _516 = _474 + _472;
    float _518 = fma(_514, _514, _510);
    bool _520 = _514 <= 0.001000000047497451305389404296875;
    float _522 = float(_520);
    float _524 = 1.0 / _518;
    float _526 = _516 + _476;
    float _528 = _526 + _478;
    float _530 = fma(_528, 0.25, _506);
    float _532 = _510 * _524;
    float _534 = _502 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _536 = precise::clamp(_534, 0.0, 1.0);
    float _538 = precise::max(_532, _522);
    float _540 = precise::min(_538, 1.0);
    float _542 = _540 + _536;
    out.m_47.x = _480;
    out.m_47.y = _530;
    out.m_47.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_47.w = _542;
    return out;
}

