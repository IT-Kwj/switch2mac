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
    texture2d_array<float> fp_t_tcb_12 [[id(6)]];
    sampler fp_t_tcb_12Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_10 [[id(8)]];
    sampler fp_t_tcb_10Smplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_E [[id(10)]];
    sampler fp_t_tcb_ESmplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_48 [[user(locn1), center_no_perspective]];
    float4 m_46 [[user(locn2), center_no_perspective]];
    float4 m_42 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _274 = false;
    bool _272 = false;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float2 _810 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_810, float2(0.0), isnan(_810)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _827 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_827, float2(0.0), isnan(_827))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_827, float2(0.0), isnan(_827))).x;
    float _74 = in.m_44.y;
    float _76 = in.m_44.x;
    float _78 = in.m_46.y;
    float _80 = in.m_48.y;
    float _82 = in.m_46.x;
    float _84 = in.m_48.x;
    float _86 = -_66;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_68;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = -_70;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].z, _100);
    float _104 = _74 * _90;
    float _106 = _76 * _90;
    float _108 = -_104;
    float _110 = fma(_96, _78, _108);
    float _112 = -_104;
    float _114 = fma(_102, _80, _112);
    float _116 = -_106;
    float _118 = fma(_96, _82, _116);
    float _120 = -_106;
    float _122 = fma(_102, _84, _120);
    float _124 = _110 * _110;
    float _126 = _114 * _114;
    float _128 = -_90;
    float _130 = _128 + _96;
    float _132 = -_90;
    float _134 = _132 + _102;
    float _136 = fma(_118, _118, _124);
    float _138 = fma(_122, _122, _126);
    float _140 = fma(_130, _130, _136);
    float _142 = fma(_134, _134, _138);
    float _144 = rsqrt(_140);
    float _146 = rsqrt(_142);
    float _148 = _118 * _144;
    float _150 = _130 * _144;
    float _152 = _110 * _144;
    float _154 = _134 * _146;
    float _156 = _114 * _146;
    float _158 = _122 * _146;
    float _160 = _148 * _154;
    float _162 = _150 * _156;
    float _164 = -_160;
    float _166 = fma(_150, _158, _164);
    float _168 = _152 * _158;
    float _170 = -_162;
    float _172 = fma(_152, _154, _170);
    float _174 = _166 * _166;
    float _176 = -_72;
    float _178 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _180 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[46].z, _178);
    float _182 = -_168;
    float _184 = fma(_148, _156, _182);
    float _186 = fma(_172, _172, _174);
    float _188 = _180 * _74;
    float _190 = -_180;
    bool _194 = _190 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _196 = fma(_184, _184, _186);
    float _198 = -_180;
    bool _200 = _198 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    bool _202 = !_194;
    uint _205 = uint(_202 ? 0 : 1);
    float _207 = rsqrt(_196);
    uint _209 = 2u;
    if (!_194)
    {
        _209 = 1u;
    }
    uint _211 = _209;
    uint _213 = _211;
    if (!_200)
    {
        _213 = _205;
    }
    uint _215 = _213;
    uint _217 = min(_215, 2u);
    float _219 = _166 * _207;
    float _221 = _172 * _207;
    int _224 = int(_217) << 2;
    float _226 = _184 * _207;
    float _228 = _219 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _230 = uint(int(uint(_224) >> uint(2)));
    uint _232 = uint(int(uint(int(_230)) >> uint(2)));
    int _234 = int(_230) & 3;
    float _236 = (*spvDescriptorSet0.fp_c1)._m0[int(_232)][_234];
    float _238 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[35].x, _228);
    float _240 = fma(_226, (*spvDescriptorSet0.fp_c3)._m0[35].z, _238);
    float _242 = abs(_240);
    float _244 = -_242;
    float _246 = _244 + 1.0;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = _180 * _76;
    float _252 = abs(_248);
    float _254 = log2(_252);
    float _256 = _254 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _258 = exp2(_256);
    float _260 = _258 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _262 = fma(_221, _260, _250);
    float _264 = fma(_219, _260, _188);
    float _266 = fma(_226, _260, _180);
    bool _268 = as_type<int>(_236) == 1216;
    if (!_268)
    {
        bool _270 = as_type<int>(_236) == 1488;
        _272 = _270;
        if (!_272)
        {
            _274 = true;
        }
    }
    float _308;
    float _310;
    float _312;
    float _314;
    if (!_272)
    {
        if (!_274)
        {
            float _276 = _264 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _278 = _264 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _280 = _264 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _282 = _264 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _284 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].x, _276);
            float _286 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[1].x, _278);
            float _288 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].x, _280);
            float _290 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[3].x, _282);
            float _292 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].z, _284);
            float _294 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[1].z, _286);
            float _296 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].z, _288);
            float _298 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[3].z, _290);
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _308 = _306;
            _310 = _300;
            _312 = _304;
            _314 = _302;
        }
    }
    if ((false || _274) || _272)
    {
        if ((!_274) || _272)
        {
            _272 = false;
            float _316 = _264 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _318 = _264 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _320 = _264 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _322 = _264 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _324 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[4].x, _316);
            float _326 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[5].x, _318);
            float _328 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[6].x, _320);
            float _330 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[7].x, _322);
            float _332 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[4].z, _324);
            float _334 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[5].z, _326);
            float _336 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[6].z, _328);
            float _338 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[7].z, _330);
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _308 = _346;
            _310 = _340;
            _312 = _344;
            _314 = _342;
        }
        if (false || _274)
        {
            _274 = false;
            float _348 = _264 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _350 = _264 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _352 = _264 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _354 = _264 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _356 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[8].x, _348);
            float _358 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[9].x, _350);
            float _360 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[10].x, _352);
            float _362 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[11].x, _354);
            float _364 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[8].z, _356);
            float _366 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[9].z, _358);
            float _368 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[10].z, _360);
            float _370 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[11].z, _362);
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _308 = _378;
            _310 = _372;
            _312 = _376;
            _314 = _374;
        }
    }
    float _380 = _308;
    float _382 = _310;
    float _384 = _312;
    float _386 = _314;
    float _388 = -_188;
    float _390 = _388 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _392 = -_250;
    float _394 = _392 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _396 = -_188;
    float _398 = _396 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _400 = _390 * _390;
    float _402 = -_180;
    float _404 = _402 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _406 = _398 * _398;
    float _408 = _188 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _410 = fma(_394, _394, _400);
    float _412 = -_250;
    float _414 = _412 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _416 = _188 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _418 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[33].x, _408);
    float _420 = fma(_404, _404, _410);
    float _422 = -_180;
    float _424 = _422 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _426 = fma(_414, _414, _406);
    float _428 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[33].z, _418);
    float _430 = _188 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _432 = fma(_424, _424, _426);
    float _434 = sqrt(_420);
    float _436 = _188 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _438 = _188 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _440 = _188 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _442 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[20].x, _416);
    float _444 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[19].x, _430);
    float _446 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[17].x, _436);
    float _448 = _188 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _450 = sqrt(_432);
    float _452 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[20].z, _442);
    float _454 = _188 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _456 = _188 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _458 = _188 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _460 = _188 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _462 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[19].z, _444);
    float _464 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[17].z, _446);
    bool _466 = _434 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _468 = 1.0 / _380;
    bool _470 = _434 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _472 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[16].x, _454);
    bool _474 = !_466;
    int _476 = _474 ? 0 : 1;
    float _478 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[29].x, _456);
    float _480 = float(int(_215));
    float _482 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[31].x, _458);
    bool _484 = _450 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _486 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[32].x, _460);
    bool _488 = _450 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _490 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[29].z, _478);
    bool _492 = !_484;
    int _494 = _492 ? 0 : 1;
    float _496 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[32].z, _486);
    int _498 = 2;
    int _500 = 2;
    if (!_466)
    {
        _498 = 1;
    }
    int _502 = _498;
    float _504 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[31].z, _482);
    int _506 = _502;
    if (!_470)
    {
        _506 = _476;
    }
    int _508 = _506;
    float _510 = _188 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _512 = _468 * _382;
    float _514 = _468 * _384;
    float _516 = precise::clamp(_514, 0.0, 1.0);
    float _518 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[16].z, _472);
    if (!_484)
    {
        _500 = 1;
    }
    int _520 = _500;
    float _522 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[21].x, _510);
    int _524 = _520;
    if (!_488)
    {
        _524 = _494;
    }
    int _526 = _524;
    float _528 = float(_508);
    float _530 = _188 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _532 = float(_526);
    float _534 = _188 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _536 = precise::min(_528, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _538 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[24].x, _530);
    float _540 = precise::min(_532, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _542 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[30].x, _534);
    bool _544 = _536 != 1.0;
    bool _546 = isnan(_536);
    bool _548 = _544 || _546;
    bool _550 = isnan(1.0);
    bool _552 = _548 || _550;
    float _554 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[21].z, _522);
    bool _556 = _540 != 1.0;
    bool _558 = isnan(_540);
    bool _560 = _556 || _558;
    bool _562 = isnan(1.0);
    bool _564 = _560 || _562;
    float _566 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[30].z, _542);
    float _568 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[24].z, _538);
    float _570 = _554 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _572 = _188 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _574 = _566 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    bool _576 = _536 != 0.0;
    bool _578 = isnan(_536);
    bool _580 = _576 || _578;
    bool _582 = isnan(0.0);
    bool _584 = _580 || _582;
    float _586 = _188 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _588 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[22].x, _572);
    bool _590 = _540 != 0.0;
    bool _592 = isnan(_540);
    bool _594 = _590 || _592;
    bool _596 = isnan(0.0);
    bool _598 = _594 || _596;
    float _600 = rint(_536);
    float _602 = precise::max(_600, 0.0);
    uint _604 = uint(_602);
    uint _606 = clamp(_604, 0u, 65535u);
    float _608 = _570;
    float _610 = _574;
    if (_552)
    {
        float _612 = _568 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _608 = _612;
    }
    float _614 = _608;
    float _616 = _188 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _618 = _614;
    if (_564)
    {
        float _620 = _428 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _610 = _620;
    }
    float _622 = _610;
    float _624 = _188 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _626 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[26].x, _448);
    float _628 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[23].x, _616);
    float _630 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[27].x, _586);
    float _632 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[18].x, _624);
    float _634 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[25].x, _438);
    float _636 = fma(_250, (*spvDescriptorSet0.fp_c3)._m0[28].x, _440);
    float _638 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[22].z, _588);
    float _640 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[23].z, _628);
    float _642 = _452 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _644 = _462 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _646 = _644;
    float _648 = _642;
    float _650 = _622;
    if (_552)
    {
        float _652 = _638 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _646 = _652;
    }
    float _654 = _646;
    float _656 = _654;
    if (_552)
    {
        float _658 = _640 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _648 = _658;
    }
    float _660 = _648;
    float _662 = _660;
    if (!_584)
    {
        float _664 = _464 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _662 = _664;
    }
    float _666 = _662;
    float _668 = rint(_540);
    float _670 = precise::max(_668, 0.0);
    uint _672 = uint(_670);
    uint _674 = clamp(_672, 0u, 65535u);
    float2 _1933 = float2(_58, _60);
    float2 _678 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1933, float2(0.0), isnan(_1933))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1933, float2(0.0), isnan(_1933))).xy;
    float _680 = _678.x;
    float _682 = _678.y;
    float _684 = _468 * _386;
    float _686 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[27].z, _630);
    float _688 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[18].z, _632);
    float _690 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[28].z, _636);
    float _692 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[26].z, _626);
    if (!_598)
    {
        float _694 = _686 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _650 = _694;
    }
    float _696 = _650;
    float _698 = rint(_480);
    float _700 = precise::max(_698, 0.0);
    uint _702 = uint(_700);
    uint _704 = clamp(_702, 0u, 65535u);
    float _706 = _490 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _708 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[25].z, _634);
    float _710 = _706;
    if (!_584)
    {
        float _712 = _688 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _618 = _712;
    }
    float _714 = _618;
    if (_564)
    {
        float _716 = _496 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _710 = _716;
    }
    float _718 = _710;
    float _720 = _690 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _722 = _718;
    float _724 = _720;
    if (!_598)
    {
        float _726 = _692 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _722 = _726;
    }
    float _728 = _722;
    if (_564)
    {
        float _730 = _504 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _724 = _730;
    }
    float _732 = _724;
    float _734 = _732;
    if (!_584)
    {
        float _736 = _518 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _656 = _736;
    }
    float _738 = _656;
    if (!_598)
    {
        float _740 = _708 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _734 = _740;
    }
    float _742 = _734;
    float _744 = 0.0 + _696;
    float _746 = precise::clamp(_744, 0.0, 1.0);
    float _748 = 0.0 + _714;
    float _750 = precise::clamp(_748, 0.0, 1.0);
    float3 _2072 = float3(_742, _728, float(int(_674)));
    float3 _2076 = select(_2072, float3(0.0), isnan(_2072));
    float _752 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2076.xy, uint(rint(_2076.z)), _746);
    float3 _2085 = float3(_738, _666, float(int(_606)));
    float3 _2087 = select(_2085, float3(0.0), isnan(_2085));
    float _754 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2087.xy, uint(rint(_2087.z)), _750);
    float3 _2096 = float3(_512, _684, float(int(_704)));
    float3 _2098 = select(_2096, float3(0.0), isnan(_2096));
    float _756 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _2098.xy, uint(rint(_2098.z)), _516);
    float _758 = fma(_680, 2.0, -1.0);
    float _760 = fma(_682, 2.0, -1.0);
    float _762 = _758 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _764 = _760 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _766 = fma(_762, 2.0, _58);
    float _768 = fma(_764, 2.0, _60);
    float2 _2125 = float2(_766, _768);
    float _770 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2125, float2(0.0), isnan(_2125))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2125, float2(0.0), isnan(_2125))).x;
    float _772 = -_180;
    float _774 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _776 = _772 + _774;
    float _778 = -_180;
    float _780 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _782 = _778 + _780;
    float _784 = _776 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _786 = precise::clamp(_784, 0.0, 1.0);
    float _788 = _782 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _790 = precise::clamp(_788, 0.0, 1.0);
    float _792 = _752 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _794 = _756 + _786;
    float _796 = fma(_754, (*spvDescriptorSet0.fp_c3)._m0[49].z, _792);
    float _798 = _796 + _790;
    out.m_51.x = _770;
    out.m_51.y = _794;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _798;
    return out;
}

