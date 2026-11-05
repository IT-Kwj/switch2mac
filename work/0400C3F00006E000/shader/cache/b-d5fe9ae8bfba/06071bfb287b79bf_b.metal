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

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    texture3d<float> fp_t_tcb_8 [[id(7)]];
    sampler fp_t_tcb_8Smplr [[id(8)]];
    texture2d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_ASmplr_w [[id(14)]];
    sampler fp_t_tcb_8Smplr_w [[id(15)]];
    sampler fp_t_tcb_ESmplr_w [[id(16)]];
    sampler fp_t_tcb_10Smplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _58 = gl_FragCoord.w;
    float _60 = gl_FragCoord.y;
    float _62 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _64 = _60 / _62;
    float _66 = in.m_42.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_44.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = gl_FragCoord.x;
    float _80 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _82 = _78 / _80;
    float _84 = in.m_46.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = precise::max((*spvDescriptorSet0.fp_c4)._m0[1].y, -0.19750000536441802978515625);
    float _92 = in.m_48.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = _90 * 5.34962368011474609375;
    float _100 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _104 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _102;
    float _106 = abs(_98);
    bool _110 = _106 > 1.0;
    float _112 = -_100;
    float _114 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _112);
    float _116 = abs(_98);
    bool _118 = _116 > as_type<float>(0x7f800000u /* inf */);
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _126 = _122 || _124;
    float _128 = 1.0 / _104;
    float _130 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
    float _132 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _134 = _132 + 1.0;
    float _136 = sqrt(_114);
    float _138 = 0.0;
    if (!_110)
    {
        float _140 = abs(_98);
        float _142 = (-0.0) + _140;
        _138 = _142;
    }
    float _144 = _138;
    float _146 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _148 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _150 = 1.0 / _58;
    float _152 = fma(_148, 2.0, -1.0);
    float _154 = _82 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _156 = 0.0;
    float _158 = _144;
    if (_110)
    {
        float _160 = abs(_98);
        float _162 = 1.0 / _160;
        _156 = _162;
    }
    float _164 = _156;
    float _166 = _150 * _70;
    float _168 = _150 * _76;
    int _171 = as_type<int>(_98) & int(0x80000000);
    float _173 = _150 * _88;
    float _175 = _150 * _96;
    float _177 = precise::max(_152, _166);
    float _179 = _168 * _168;
    float _181 = _168 * _177;
    float _183 = -_100;
    float _185 = _183 + _179;
    float _187 = _177;
    float _189 = _179;
    if (!_110)
    {
        _187 = _144;
    }
    float _191 = _187;
    float _193 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _195 = _168 + _193;
    float _197 = -_179;
    float _199 = fma(_181, _181, _197);
    float _201 = _191;
    if (_110)
    {
        _201 = _164;
    }
    float _203 = _201;
    float _205 = sqrt(_185);
    float _207 = _195 * _128;
    float _209 = -_100;
    bool _211 = _199 > _209;
    float _213 = _203 * _203;
    float _215 = _100 + _199;
    bool _217 = _181 < 0.0;
    bool _219 = _217 && _211;
    float _221 = _213 + 11.33538818359375;
    float _223 = fma(_213, _221, 28.84246826171875);
    float _225 = fma(_213, _223, 19.6966705322265625);
    float _227 = fma(_213, -0.82336294651031494140625, -5.674867153167724609375);
    float _229 = _221;
    if (_219)
    {
        _189 = 0.0;
    }
    float _231 = _189;
    float _233 = fma(_213, _227, -6.565555095672607421875);
    float _235 = _231;
    if (!_219)
    {
        _235 = _136;
    }
    float _237 = _235;
    float _239 = 1.0 / _225;
    if (_219)
    {
        _229 = 0.0;
    }
    float _241 = _229;
    float _243 = _213 * _233;
    float _245 = _241;
    if (!_219)
    {
        _245 = _114;
    }
    float _247 = _245;
    float _249 = _205 + _237;
    float _251 = _154 * 1.57079637050628662109375;
    float _253 = in.m_48.y;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = _243 * _203;
    float _261 = _215 + _247;
    float _263 = _251 * 0.15915493667125701904296875;
    float _265 = 1.0 / _249;
    float _267 = _251;
    if (_219)
    {
        _267 = 1.0;
    }
    float _269 = _267;
    float _271 = _269;
    if (!_219)
    {
        _271 = -1.0;
    }
    float _273 = _271;
    float _275 = _263 * 6.283185482025146484375;
    float _277 = sin(_275);
    float _279 = sqrt(_261);
    float _281 = _277 * _130;
    float _283 = fma(_259, _239, _203);
    float _285 = floor(_281);
    int _287 = as_type<int>(_283);
    if (_110)
    {
        float _289 = -_283;
        float _291 = _289 + 1.57079637050628662109375;
        _287 = as_type<int>(_291);
    }
    int _293 = _287;
    float _295 = _150 * _257;
    float _297 = fma(_181, _273, _279);
    float _299 = as_type<float>(_293);
    if (!_126)
    {
        int _301 = _171 | _293;
        _299 = as_type<float>(_301);
    }
    float _303 = _299;
    float _305 = _297 * _265;
    float _307 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _309 = _307 + 1.0;
    float _311 = fma(0.454545438289642333984375, _303, 0.37000000476837158203125);
    float _313 = 0.0;
    if (_219)
    {
        float _315 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _317 = fma(_315, 0.5, 0.5);
        _313 = _317;
    }
    float _319 = _313;
    float _321 = fma(_311, _134, _146);
    float _323 = _207 * _309;
    float _325 = _319;
    if (!_219)
    {
        float _327 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
        _325 = _327;
    }
    float _329 = _325;
    float _331 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _333 = _331 + 0.5;
    float _335 = _321 + _285;
    float _337 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _323);
    float _339 = fma(_305, _333, _329);
    float _341 = _335 + 1.0;
    float _343 = _335 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float2 _1322 = float2(_175, _295);
    float4 _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1322, float2(0.0), isnan(_1322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1322, float2(0.0), isnan(_1322))).xyzw;
    float _348 = _346.x;
    float _350 = _346.y;
    float _352 = _346.z;
    float _354 = _346.w;
    float2 _1340 = float2(_175, _295);
    float4 _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1340, float2(0.0), isnan(_1340))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1340, float2(0.0), isnan(_1340))).xyzw;
    float _358 = _356.x;
    float _360 = _356.y;
    float _362 = _356.z;
    float _364 = _356.w;
    float _366 = _341 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1362 = float3(_343, _339, _337);
    float4 _368 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1362, float3(0.0), isnan(_1362))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1362, float3(0.0), isnan(_1362))).xyzw;
    float _370 = _368.x;
    float _372 = _368.y;
    float _374 = _368.z;
    float _376 = _368.w;
    float3 _1381 = float3(_366, _339, _337);
    float4 _378 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1381, float3(0.0), isnan(_1381))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1381, float3(0.0), isnan(_1381))).xyzw;
    float _380 = _378.x;
    float _382 = _378.y;
    float _384 = _378.z;
    float _386 = _378.w;
    float2 _1397 = float2(_175, _295);
    float4 _388 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1397, float2(0.0), isnan(_1397))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1397, float2(0.0), isnan(_1397))).xyzw;
    float _390 = _388.x;
    float _392 = _388.y;
    float _394 = _388.z;
    float _396 = _388.w;
    float2 _1413 = float2(_175, _295);
    float4 _398 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1413, float2(0.0), isnan(_1413))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1413, float2(0.0), isnan(_1413))).xyzw;
    float _400 = _398.x;
    float _402 = _398.y;
    float _404 = _398.z;
    float _406 = _398.w;
    float _408 = fma(_154, 2.0, -0.25);
    float _410 = precise::clamp(_408, 0.0, 1.0);
    bool _412 = _173 < _152;
    int _414 = _412 ? 1065353216 : 0;
    float _416 = -_285;
    float _418 = _281 + _416;
    bool _420 = 0.0 < (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _422 = _348 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _424 = fma(_148, 2.0, -0.25);
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = fma(_277, 2.0, -1.0);
    float _430 = precise::max(_410, _426);
    float _432 = fma(_358, (*spvDescriptorSet0.fp_c4)._m0[6].x, _422);
    float _434 = fma(_428, _428, 1.0);
    float _436 = _430 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _438 = -_436;
    float _440 = fma(_438, _436, 1.0);
    float _442 = _436 * 2.0;
    float _444 = _440 * _434;
    float _446 = fma(_436, _436, 1.0);
    float _448 = -_370;
    float _450 = _448 + _380;
    float _452 = fma(_436, _436, 2.0);
    float _454 = -_376;
    float _456 = _454 + _386;
    float _458 = -_442;
    float _460 = fma(_428, _458, _446);
    float _462 = fma(_418, _450, _370);
    float _464 = _350 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _466 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _468 = fma(_418, _456, _376);
    float _470 = -_372;
    float _472 = _470 + _382;
    float _474 = precise::max(0.0, _462);
    float _476 = _444 * 0.119366206228733062744140625;
    float _478 = fma(_418, _472, _372);
    float _480 = precise::max(0.0, _468);
    float _482 = abs(_460);
    float _484 = log2(_482);
    float _486 = precise::max(0.0, _478);
    float _488 = _484 * 1.5;
    float _490 = exp2(_488);
    float _492 = _452 * _490;
    float _494 = fma(_360, (*spvDescriptorSet0.fp_c4)._m0[6].x, _464);
    float _496 = precise::max(_474, 9.9999997473787516355514526367188e-05);
    float _498 = _352 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _500 = _354 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _502 = 1.0 / _492;
    float _504 = fma(_362, (*spvDescriptorSet0.fp_c4)._m0[6].x, _498);
    float _506 = fma(_364, (*spvDescriptorSet0.fp_c4)._m0[6].x, _500);
    float _508 = -_374;
    float _510 = _508 + _384;
    float _512 = fma(_418, _510, _374);
    float _514 = 1.0 / _496;
    float _516 = precise::max(0.0, _512);
    float _518 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _520 = fma(_396, (*spvDescriptorSet0.fp_c4)._m0[6].z, _506);
    float _522 = _476 * _502;
    float _524 = _466 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _526 = fma(_390, (*spvDescriptorSet0.fp_c4)._m0[6].z, _432);
    float _528 = fma(_392, (*spvDescriptorSet0.fp_c4)._m0[6].z, _494);
    float _530 = _522 * (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _532 = fma(_394, (*spvDescriptorSet0.fp_c4)._m0[6].z, _504);
    float _534 = _480 * _514;
    float _536 = _486 * _534;
    float _538 = _516 * _534;
    float _540 = _474 * _534;
    float _542 = _518 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _544 = _538 * _524;
    float _546 = _536 * _542;
    float _548 = fma(_406, (*spvDescriptorSet0.fp_c4)._m0[6].w, _520);
    float _550 = _530 * _540;
    float _552 = _530 * _544;
    float _554 = _530 * _546;
    float _556 = fma(_400, (*spvDescriptorSet0.fp_c4)._m0[6].w, _526);
    float _558 = fma(_402, (*spvDescriptorSet0.fp_c4)._m0[6].w, _528);
    float _560 = fma(_404, (*spvDescriptorSet0.fp_c4)._m0[6].w, _532);
    float _562 = _548 * 20.0;
    float _564 = _550 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _566 = _554 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _568 = _552 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _570 = fma(_556, _562, _564);
    float _572 = fma(_558, _562, _566);
    float _574 = fma(_560, _562, _568);
    float _576 = precise::max(0.0, _570);
    float _578 = precise::max(0.0, _572);
    float _580 = precise::max(0.0, _574);
    float _582 = _560;
    if (!_420)
    {
        out.m_51.x = _576;
        out.m_51.y = _578;
        out.m_51.z = _580;
        out.m_51.w = as_type<float>(_414);
        return out;
    }
    if (_110)
    {
        _158 = _164;
    }
    float _584 = _158;
    float _586 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[6].x, -0.5);
    float _588 = _584 * _584;
    float _590 = _588 + 11.33538818359375;
    float _592 = fma(_588, -0.82336294651031494140625, -5.674867153167724609375);
    float _594 = fma(_588, _590, 28.84246826171875);
    float _596 = fma(_588, _592, -6.565555095672607421875);
    float _598 = _590;
    float _600 = _588;
    if (_219)
    {
        _598 = 0.0;
        _582 = 0.0;
    }
    float _602 = _598;
    float _604 = _582;
    float _606 = fma(_588, _594, 19.6966705322265625);
    float _608 = _602;
    float _610 = _604;
    if (!_219)
    {
        _608 = _114;
    }
    float _612 = _608;
    float _614 = _588 * _596;
    if (!_219)
    {
        _610 = _136;
    }
    float _616 = _610;
    float _618 = floor(_586);
    float _620 = _616;
    if (_219)
    {
        _600 = 1.0;
    }
    float _622 = _600;
    float _624 = _614 * _584;
    float _626 = _215 + _612;
    float _628 = _205 + _616;
    float _630 = _622;
    if (!_219)
    {
        _630 = -1.0;
    }
    float _632 = _630;
    if (_219)
    {
        float _634 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _636 = fma(0.5, _634, 0.5);
        _620 = _636;
    }
    float _638 = _620;
    float _640 = _638;
    if (!_219)
    {
        float _642 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5);
        _640 = _642;
    }
    float _644 = _640;
    float _646 = 1.0 / _606;
    float _648 = sqrt(_626);
    float _650 = fma(_624, _646, _584);
    float _652 = 1.0 / _628;
    int _654 = as_type<int>(_650);
    if (_110)
    {
        float _656 = -_650;
        float _658 = _656 + 1.57079637050628662109375;
        _654 = as_type<int>(_658);
    }
    int _660 = _654;
    float _662 = fma(_181, _632, _648);
    float _664 = as_type<float>(_660);
    if (!_126)
    {
        int _666 = _171 | _660;
        _664 = as_type<float>(_666);
    }
    float _668 = _664;
    float _670 = fma(0.454545438289642333984375, _668, 0.37000000476837158203125);
    float _672 = _662 * _652;
    float _674 = fma(_134, _670, _146);
    float _676 = fma(_333, _672, _644);
    float _678 = _674 + _618;
    float _680 = _678 + 1.0;
    float _682 = _678 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _684 = _680 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1880 = float3(_682, _676, _337);
    float4 _686 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1880, float3(0.0), isnan(_1880))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1880, float3(0.0), isnan(_1880))).xyzw;
    float _688 = _686.x;
    float _690 = _686.y;
    float _692 = _686.z;
    float _694 = _686.w;
    float3 _1897 = float3(_684, _676, _337);
    float4 _696 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1897, float3(0.0), isnan(_1897))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1897, float3(0.0), isnan(_1897))).xyzw;
    float _698 = _696.x;
    float _700 = _696.y;
    float _702 = _696.z;
    float _704 = _696.w;
    float2 _1912 = float2(0.5, _295);
    float4 _706 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1912, float2(0.0), isnan(_1912))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1912, float2(0.0), isnan(_1912))).xyzw;
    float _708 = _706.x;
    float _710 = _706.y;
    float _712 = _706.z;
    float _714 = _706.w;
    float2 _1927 = float2(0.5, _295);
    float4 _716 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1927, float2(0.0), isnan(_1927))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1927, float2(0.0), isnan(_1927))).xyzw;
    float _718 = _716.x;
    float _720 = _716.y;
    float _722 = _716.z;
    float _724 = _716.w;
    float2 _1942 = float2(0.5, _295);
    float4 _726 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1942, float2(0.0), isnan(_1942))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1942, float2(0.0), isnan(_1942))).xyzw;
    float _728 = _726.x;
    float _730 = _726.y;
    float _732 = _726.z;
    float _734 = _726.w;
    float2 _1957 = float2(0.5, _295);
    float4 _736 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1957, float2(0.0), isnan(_1957))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1957, float2(0.0), isnan(_1957))).xyzw;
    float _738 = _736.x;
    float _740 = _736.y;
    float _742 = _736.z;
    float _744 = _736.w;
    float _746 = -_618;
    float _748 = _586 + _746;
    float _750 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _752 = _750 + 1.0;
    float _754 = abs(_752);
    float _756 = log2(_754);
    float _758 = _756 * 1.5;
    float _760 = exp2(_758);
    float _762 = -_688;
    float _764 = _762 + _698;
    float _766 = -_694;
    float _768 = _766 + _704;
    float _770 = -_690;
    float _772 = _770 + _700;
    float _774 = fma(_748, _764, _688);
    float _776 = _750 + 2.0;
    float _778 = fma(_748, _768, _694);
    float _780 = -_692;
    float _782 = _780 + _702;
    float _784 = fma(_748, _772, _690);
    float _786 = precise::max(0.0, _774);
    float _788 = _776 * _760;
    float _790 = fma(_748, _782, _692);
    float _792 = precise::max(_786, 9.9999997473787516355514526367188e-05);
    float _794 = 1.0 / _788;
    float _796 = precise::max(0.0, _778);
    float _798 = fma(_750, -0.119366206228733062744140625, 0.119366206228733062744140625);
    float _800 = precise::max(0.0, _784);
    float _802 = precise::max(0.0, _790);
    float _804 = 1.0 / _792;
    float _806 = _798 * _794;
    float _808 = _806 * (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _810 = _796 * _804;
    float _812 = _800 * _810;
    float _814 = _802 * _810;
    float _816 = _786 * _810;
    float _818 = _542 * _812;
    float _820 = _714 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _822 = _524 * _814;
    float _824 = _710 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _826 = _808 * _818;
    float _828 = _708 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _830 = _712 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _832 = fma(_724, (*spvDescriptorSet0.fp_c4)._m0[6].x, _820);
    float _834 = fma(_720, (*spvDescriptorSet0.fp_c4)._m0[6].x, _824);
    float _836 = fma(_718, (*spvDescriptorSet0.fp_c4)._m0[6].x, _828);
    float _838 = fma(_722, (*spvDescriptorSet0.fp_c4)._m0[6].x, _830);
    float _840 = fma(_734, (*spvDescriptorSet0.fp_c4)._m0[6].z, _832);
    float _842 = _808 * _816;
    float _844 = _808 * _822;
    float _846 = fma(_728, (*spvDescriptorSet0.fp_c4)._m0[6].z, _836);
    float _848 = fma(_730, (*spvDescriptorSet0.fp_c4)._m0[6].z, _834);
    float _850 = fma(_732, (*spvDescriptorSet0.fp_c4)._m0[6].z, _838);
    float _852 = fma(_744, (*spvDescriptorSet0.fp_c4)._m0[6].w, _840);
    float _854 = fma(_738, (*spvDescriptorSet0.fp_c4)._m0[6].w, _846);
    float _856 = fma(_740, (*spvDescriptorSet0.fp_c4)._m0[6].w, _848);
    float _858 = fma(_742, (*spvDescriptorSet0.fp_c4)._m0[6].w, _850);
    float _860 = _852 * 20.0;
    float _862 = _842 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _864 = _826 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _866 = _844 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _868 = fma(_854, _860, _862);
    float _870 = fma(_856, _860, _864);
    float _872 = fma(_858, _860, _866);
    float _874 = precise::max(0.0, _868);
    float _876 = precise::max(0.0, _870);
    float _878 = precise::max(0.0, _872);
    float _880 = -_576;
    float _882 = _880 + _874;
    float _884 = -_578;
    float _886 = _884 + _876;
    float _888 = -_580;
    float _890 = _888 + _878;
    float _892 = fma(_882, (*spvDescriptorSet0.fp_c4)._m0[2].w, _576);
    float _894 = fma(_886, (*spvDescriptorSet0.fp_c4)._m0[2].w, _578);
    float _896 = fma(_890, (*spvDescriptorSet0.fp_c4)._m0[2].w, _580);
    out.m_51.x = _892;
    out.m_51.y = _894;
    out.m_51.z = _896;
    out.m_51.w = as_type<float>(_414);
    return out;
}


struct main0_out_u
{
    uint4 m_51 [[color(0)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _58 = gl_FragCoord.w;
    float _60 = gl_FragCoord.y;
    float _62 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _64 = _60 / _62;
    float _66 = in.m_42.x;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = in.m_44.x;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = gl_FragCoord.x;
    float _80 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _82 = _78 / _80;
    float _84 = in.m_46.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = precise::max((*spvDescriptorSet0.fp_c4)._m0[1].y, -0.19750000536441802978515625);
    float _92 = in.m_48.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = _90 * 5.34962368011474609375;
    float _100 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _102 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _104 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _102;
    float _106 = abs(_98);
    bool _110 = _106 > 1.0;
    float _112 = -_100;
    float _114 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _112);
    float _116 = abs(_98);
    bool _118 = _116 > as_type<float>(0x7f800000u /* inf */);
    bool _120 = isnan(_116);
    bool _122 = _118 || _120;
    bool _124 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _126 = _122 || _124;
    float _128 = 1.0 / _104;
    float _130 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
    float _132 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _134 = _132 + 1.0;
    float _136 = sqrt(_114);
    float _138 = 0.0;
    if (!_110)
    {
        float _140 = abs(_98);
        float _142 = (-0.0) + _140;
        _138 = _142;
    }
    float _144 = _138;
    float _146 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _148 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _150 = 1.0 / _58;
    float _152 = fma(_148, 2.0, -1.0);
    float _154 = _82 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _156 = 0.0;
    float _158 = _144;
    if (_110)
    {
        float _160 = abs(_98);
        float _162 = 1.0 / _160;
        _156 = _162;
    }
    float _164 = _156;
    float _166 = _150 * _70;
    float _168 = _150 * _76;
    int _171 = as_type<int>(_98) & int(0x80000000);
    float _173 = _150 * _88;
    float _175 = _150 * _96;
    float _177 = precise::max(_152, _166);
    float _179 = _168 * _168;
    float _181 = _168 * _177;
    float _183 = -_100;
    float _185 = _183 + _179;
    float _187 = _177;
    float _189 = _179;
    if (!_110)
    {
        _187 = _144;
    }
    float _191 = _187;
    float _193 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _195 = _168 + _193;
    float _197 = -_179;
    float _199 = fma(_181, _181, _197);
    float _201 = _191;
    if (_110)
    {
        _201 = _164;
    }
    float _203 = _201;
    float _205 = sqrt(_185);
    float _207 = _195 * _128;
    float _209 = -_100;
    bool _211 = _199 > _209;
    float _213 = _203 * _203;
    float _215 = _100 + _199;
    bool _217 = _181 < 0.0;
    bool _219 = _217 && _211;
    float _221 = _213 + 11.33538818359375;
    float _223 = fma(_213, _221, 28.84246826171875);
    float _225 = fma(_213, _223, 19.6966705322265625);
    float _227 = fma(_213, -0.82336294651031494140625, -5.674867153167724609375);
    float _229 = _221;
    if (_219)
    {
        _189 = 0.0;
    }
    float _231 = _189;
    float _233 = fma(_213, _227, -6.565555095672607421875);
    float _235 = _231;
    if (!_219)
    {
        _235 = _136;
    }
    float _237 = _235;
    float _239 = 1.0 / _225;
    if (_219)
    {
        _229 = 0.0;
    }
    float _241 = _229;
    float _243 = _213 * _233;
    float _245 = _241;
    if (!_219)
    {
        _245 = _114;
    }
    float _247 = _245;
    float _249 = _205 + _237;
    float _251 = _154 * 1.57079637050628662109375;
    float _253 = in.m_48.y;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = _243 * _203;
    float _261 = _215 + _247;
    float _263 = _251 * 0.15915493667125701904296875;
    float _265 = 1.0 / _249;
    float _267 = _251;
    if (_219)
    {
        _267 = 1.0;
    }
    float _269 = _267;
    float _271 = _269;
    if (!_219)
    {
        _271 = -1.0;
    }
    float _273 = _271;
    float _275 = _263 * 6.283185482025146484375;
    float _277 = sin(_275);
    float _279 = sqrt(_261);
    float _281 = _277 * _130;
    float _283 = fma(_259, _239, _203);
    float _285 = floor(_281);
    int _287 = as_type<int>(_283);
    if (_110)
    {
        float _289 = -_283;
        float _291 = _289 + 1.57079637050628662109375;
        _287 = as_type<int>(_291);
    }
    int _293 = _287;
    float _295 = _150 * _257;
    float _297 = fma(_181, _273, _279);
    float _299 = as_type<float>(_293);
    if (!_126)
    {
        int _301 = _171 | _293;
        _299 = as_type<float>(_301);
    }
    float _303 = _299;
    float _305 = _297 * _265;
    float _307 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _309 = _307 + 1.0;
    float _311 = fma(0.454545438289642333984375, _303, 0.37000000476837158203125);
    float _313 = 0.0;
    if (_219)
    {
        float _315 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _317 = fma(_315, 0.5, 0.5);
        _313 = _317;
    }
    float _319 = _313;
    float _321 = fma(_311, _134, _146);
    float _323 = _207 * _309;
    float _325 = _319;
    if (!_219)
    {
        float _327 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
        _325 = _327;
    }
    float _329 = _325;
    float _331 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _333 = _331 + 0.5;
    float _335 = _321 + _285;
    float _337 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _323);
    float _339 = fma(_305, _333, _329);
    float _341 = _335 + 1.0;
    float _343 = _335 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float2 _1322 = float2(_175, _295);
    float4 _346 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1322, float2(0.0), isnan(_1322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1322, float2(0.0), isnan(_1322))).xyzw;
    float _348 = _346.x;
    float _350 = _346.y;
    float _352 = _346.z;
    float _354 = _346.w;
    float2 _1340 = float2(_175, _295);
    float4 _356 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1340, float2(0.0), isnan(_1340))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1340, float2(0.0), isnan(_1340))).xyzw;
    float _358 = _356.x;
    float _360 = _356.y;
    float _362 = _356.z;
    float _364 = _356.w;
    float _366 = _341 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1362 = float3(_343, _339, _337);
    float4 _368 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1362, float3(0.0), isnan(_1362))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1362, float3(0.0), isnan(_1362))).xyzw;
    float _370 = _368.x;
    float _372 = _368.y;
    float _374 = _368.z;
    float _376 = _368.w;
    float3 _1381 = float3(_366, _339, _337);
    float4 _378 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1381, float3(0.0), isnan(_1381))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1381, float3(0.0), isnan(_1381))).xyzw;
    float _380 = _378.x;
    float _382 = _378.y;
    float _384 = _378.z;
    float _386 = _378.w;
    float2 _1397 = float2(_175, _295);
    float4 _388 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1397, float2(0.0), isnan(_1397))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1397, float2(0.0), isnan(_1397))).xyzw;
    float _390 = _388.x;
    float _392 = _388.y;
    float _394 = _388.z;
    float _396 = _388.w;
    float2 _1413 = float2(_175, _295);
    float4 _398 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1413, float2(0.0), isnan(_1413))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1413, float2(0.0), isnan(_1413))).xyzw;
    float _400 = _398.x;
    float _402 = _398.y;
    float _404 = _398.z;
    float _406 = _398.w;
    float _408 = fma(_154, 2.0, -0.25);
    float _410 = precise::clamp(_408, 0.0, 1.0);
    bool _412 = _173 < _152;
    int _414 = _412 ? 1065353216 : 0;
    float _416 = -_285;
    float _418 = _281 + _416;
    bool _420 = 0.0 < (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _422 = _348 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _424 = fma(_148, 2.0, -0.25);
    float _426 = precise::clamp(_424, 0.0, 1.0);
    float _428 = fma(_277, 2.0, -1.0);
    float _430 = precise::max(_410, _426);
    float _432 = fma(_358, (*spvDescriptorSet0.fp_c4)._m0[6].x, _422);
    float _434 = fma(_428, _428, 1.0);
    float _436 = _430 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _438 = -_436;
    float _440 = fma(_438, _436, 1.0);
    float _442 = _436 * 2.0;
    float _444 = _440 * _434;
    float _446 = fma(_436, _436, 1.0);
    float _448 = -_370;
    float _450 = _448 + _380;
    float _452 = fma(_436, _436, 2.0);
    float _454 = -_376;
    float _456 = _454 + _386;
    float _458 = -_442;
    float _460 = fma(_428, _458, _446);
    float _462 = fma(_418, _450, _370);
    float _464 = _350 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _466 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _468 = fma(_418, _456, _376);
    float _470 = -_372;
    float _472 = _470 + _382;
    float _474 = precise::max(0.0, _462);
    float _476 = _444 * 0.119366206228733062744140625;
    float _478 = fma(_418, _472, _372);
    float _480 = precise::max(0.0, _468);
    float _482 = abs(_460);
    float _484 = log2(_482);
    float _486 = precise::max(0.0, _478);
    float _488 = _484 * 1.5;
    float _490 = exp2(_488);
    float _492 = _452 * _490;
    float _494 = fma(_360, (*spvDescriptorSet0.fp_c4)._m0[6].x, _464);
    float _496 = precise::max(_474, 9.9999997473787516355514526367188e-05);
    float _498 = _352 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _500 = _354 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _502 = 1.0 / _492;
    float _504 = fma(_362, (*spvDescriptorSet0.fp_c4)._m0[6].x, _498);
    float _506 = fma(_364, (*spvDescriptorSet0.fp_c4)._m0[6].x, _500);
    float _508 = -_374;
    float _510 = _508 + _384;
    float _512 = fma(_418, _510, _374);
    float _514 = 1.0 / _496;
    float _516 = precise::max(0.0, _512);
    float _518 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _520 = fma(_396, (*spvDescriptorSet0.fp_c4)._m0[6].z, _506);
    float _522 = _476 * _502;
    float _524 = _466 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _526 = fma(_390, (*spvDescriptorSet0.fp_c4)._m0[6].z, _432);
    float _528 = fma(_392, (*spvDescriptorSet0.fp_c4)._m0[6].z, _494);
    float _530 = _522 * (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _532 = fma(_394, (*spvDescriptorSet0.fp_c4)._m0[6].z, _504);
    float _534 = _480 * _514;
    float _536 = _486 * _534;
    float _538 = _516 * _534;
    float _540 = _474 * _534;
    float _542 = _518 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _544 = _538 * _524;
    float _546 = _536 * _542;
    float _548 = fma(_406, (*spvDescriptorSet0.fp_c4)._m0[6].w, _520);
    float _550 = _530 * _540;
    float _552 = _530 * _544;
    float _554 = _530 * _546;
    float _556 = fma(_400, (*spvDescriptorSet0.fp_c4)._m0[6].w, _526);
    float _558 = fma(_402, (*spvDescriptorSet0.fp_c4)._m0[6].w, _528);
    float _560 = fma(_404, (*spvDescriptorSet0.fp_c4)._m0[6].w, _532);
    float _562 = _548 * 20.0;
    float _564 = _550 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _566 = _554 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _568 = _552 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _570 = fma(_556, _562, _564);
    float _572 = fma(_558, _562, _566);
    float _574 = fma(_560, _562, _568);
    float _576 = precise::max(0.0, _570);
    float _578 = precise::max(0.0, _572);
    float _580 = precise::max(0.0, _574);
    float _582 = _560;
    if (!_420)
    {
        out.m_51.x = _576;
        out.m_51.y = _578;
        out.m_51.z = _580;
        out.m_51.w = as_type<float>(_414);
        return main0_out_u{as_type<uint4>(out.m_51)};
    }
    if (_110)
    {
        _158 = _164;
    }
    float _584 = _158;
    float _586 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[6].x, -0.5);
    float _588 = _584 * _584;
    float _590 = _588 + 11.33538818359375;
    float _592 = fma(_588, -0.82336294651031494140625, -5.674867153167724609375);
    float _594 = fma(_588, _590, 28.84246826171875);
    float _596 = fma(_588, _592, -6.565555095672607421875);
    float _598 = _590;
    float _600 = _588;
    if (_219)
    {
        _598 = 0.0;
        _582 = 0.0;
    }
    float _602 = _598;
    float _604 = _582;
    float _606 = fma(_588, _594, 19.6966705322265625);
    float _608 = _602;
    float _610 = _604;
    if (!_219)
    {
        _608 = _114;
    }
    float _612 = _608;
    float _614 = _588 * _596;
    if (!_219)
    {
        _610 = _136;
    }
    float _616 = _610;
    float _618 = floor(_586);
    float _620 = _616;
    if (_219)
    {
        _600 = 1.0;
    }
    float _622 = _600;
    float _624 = _614 * _584;
    float _626 = _215 + _612;
    float _628 = _205 + _616;
    float _630 = _622;
    if (!_219)
    {
        _630 = -1.0;
    }
    float _632 = _630;
    if (_219)
    {
        float _634 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _636 = fma(0.5, _634, 0.5);
        _620 = _636;
    }
    float _638 = _620;
    float _640 = _638;
    if (!_219)
    {
        float _642 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5);
        _640 = _642;
    }
    float _644 = _640;
    float _646 = 1.0 / _606;
    float _648 = sqrt(_626);
    float _650 = fma(_624, _646, _584);
    float _652 = 1.0 / _628;
    int _654 = as_type<int>(_650);
    if (_110)
    {
        float _656 = -_650;
        float _658 = _656 + 1.57079637050628662109375;
        _654 = as_type<int>(_658);
    }
    int _660 = _654;
    float _662 = fma(_181, _632, _648);
    float _664 = as_type<float>(_660);
    if (!_126)
    {
        int _666 = _171 | _660;
        _664 = as_type<float>(_666);
    }
    float _668 = _664;
    float _670 = fma(0.454545438289642333984375, _668, 0.37000000476837158203125);
    float _672 = _662 * _652;
    float _674 = fma(_134, _670, _146);
    float _676 = fma(_333, _672, _644);
    float _678 = _674 + _618;
    float _680 = _678 + 1.0;
    float _682 = _678 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _684 = _680 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1880 = float3(_682, _676, _337);
    float4 _686 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1880, float3(0.0), isnan(_1880))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1880, float3(0.0), isnan(_1880))).xyzw;
    float _688 = _686.x;
    float _690 = _686.y;
    float _692 = _686.z;
    float _694 = _686.w;
    float3 _1897 = float3(_684, _676, _337);
    float4 _696 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1897, float3(0.0), isnan(_1897))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1897, float3(0.0), isnan(_1897))).xyzw;
    float _698 = _696.x;
    float _700 = _696.y;
    float _702 = _696.z;
    float _704 = _696.w;
    float2 _1912 = float2(0.5, _295);
    float4 _706 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1912, float2(0.0), isnan(_1912))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1912, float2(0.0), isnan(_1912))).xyzw;
    float _708 = _706.x;
    float _710 = _706.y;
    float _712 = _706.z;
    float _714 = _706.w;
    float2 _1927 = float2(0.5, _295);
    float4 _716 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1927, float2(0.0), isnan(_1927))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1927, float2(0.0), isnan(_1927))).xyzw;
    float _718 = _716.x;
    float _720 = _716.y;
    float _722 = _716.z;
    float _724 = _716.w;
    float2 _1942 = float2(0.5, _295);
    float4 _726 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1942, float2(0.0), isnan(_1942))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1942, float2(0.0), isnan(_1942))).xyzw;
    float _728 = _726.x;
    float _730 = _726.y;
    float _732 = _726.z;
    float _734 = _726.w;
    float2 _1957 = float2(0.5, _295);
    float4 _736 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1957, float2(0.0), isnan(_1957))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1957, float2(0.0), isnan(_1957))).xyzw;
    float _738 = _736.x;
    float _740 = _736.y;
    float _742 = _736.z;
    float _744 = _736.w;
    float _746 = -_618;
    float _748 = _586 + _746;
    float _750 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _752 = _750 + 1.0;
    float _754 = abs(_752);
    float _756 = log2(_754);
    float _758 = _756 * 1.5;
    float _760 = exp2(_758);
    float _762 = -_688;
    float _764 = _762 + _698;
    float _766 = -_694;
    float _768 = _766 + _704;
    float _770 = -_690;
    float _772 = _770 + _700;
    float _774 = fma(_748, _764, _688);
    float _776 = _750 + 2.0;
    float _778 = fma(_748, _768, _694);
    float _780 = -_692;
    float _782 = _780 + _702;
    float _784 = fma(_748, _772, _690);
    float _786 = precise::max(0.0, _774);
    float _788 = _776 * _760;
    float _790 = fma(_748, _782, _692);
    float _792 = precise::max(_786, 9.9999997473787516355514526367188e-05);
    float _794 = 1.0 / _788;
    float _796 = precise::max(0.0, _778);
    float _798 = fma(_750, -0.119366206228733062744140625, 0.119366206228733062744140625);
    float _800 = precise::max(0.0, _784);
    float _802 = precise::max(0.0, _790);
    float _804 = 1.0 / _792;
    float _806 = _798 * _794;
    float _808 = _806 * (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _810 = _796 * _804;
    float _812 = _800 * _810;
    float _814 = _802 * _810;
    float _816 = _786 * _810;
    float _818 = _542 * _812;
    float _820 = _714 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _822 = _524 * _814;
    float _824 = _710 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _826 = _808 * _818;
    float _828 = _708 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _830 = _712 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _832 = fma(_724, (*spvDescriptorSet0.fp_c4)._m0[6].x, _820);
    float _834 = fma(_720, (*spvDescriptorSet0.fp_c4)._m0[6].x, _824);
    float _836 = fma(_718, (*spvDescriptorSet0.fp_c4)._m0[6].x, _828);
    float _838 = fma(_722, (*spvDescriptorSet0.fp_c4)._m0[6].x, _830);
    float _840 = fma(_734, (*spvDescriptorSet0.fp_c4)._m0[6].z, _832);
    float _842 = _808 * _816;
    float _844 = _808 * _822;
    float _846 = fma(_728, (*spvDescriptorSet0.fp_c4)._m0[6].z, _836);
    float _848 = fma(_730, (*spvDescriptorSet0.fp_c4)._m0[6].z, _834);
    float _850 = fma(_732, (*spvDescriptorSet0.fp_c4)._m0[6].z, _838);
    float _852 = fma(_744, (*spvDescriptorSet0.fp_c4)._m0[6].w, _840);
    float _854 = fma(_738, (*spvDescriptorSet0.fp_c4)._m0[6].w, _846);
    float _856 = fma(_740, (*spvDescriptorSet0.fp_c4)._m0[6].w, _848);
    float _858 = fma(_742, (*spvDescriptorSet0.fp_c4)._m0[6].w, _850);
    float _860 = _852 * 20.0;
    float _862 = _842 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _864 = _826 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _866 = _844 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _868 = fma(_854, _860, _862);
    float _870 = fma(_856, _860, _864);
    float _872 = fma(_858, _860, _866);
    float _874 = precise::max(0.0, _868);
    float _876 = precise::max(0.0, _870);
    float _878 = precise::max(0.0, _872);
    float _880 = -_576;
    float _882 = _880 + _874;
    float _884 = -_578;
    float _886 = _884 + _876;
    float _888 = -_580;
    float _890 = _888 + _878;
    float _892 = fma(_882, (*spvDescriptorSet0.fp_c4)._m0[2].w, _576);
    float _894 = fma(_886, (*spvDescriptorSet0.fp_c4)._m0[2].w, _578);
    float _896 = fma(_890, (*spvDescriptorSet0.fp_c4)._m0[2].w, _580);
    out.m_51.x = _892;
    out.m_51.y = _894;
    out.m_51.z = _896;
    out.m_51.w = as_type<float>(_414);
    return main0_out_u{as_type<uint4>(out.m_51)};
}

