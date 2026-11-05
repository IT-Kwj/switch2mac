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
    texture3d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    texture2d<float> fp_t_tcb_E [[id(9)]];
    sampler fp_t_tcb_ESmplr [[id(10)]];
    texture2d<float> fp_t_tcb_10 [[id(11)]];
    sampler fp_t_tcb_10Smplr [[id(12)]];
    sampler fp_t_tcb_8Smplr_w [[id(13)]];
    sampler fp_t_tcb_CSmplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
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
    float4 m_48 [[user(locn1)]];
    float4 m_42 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
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
    float _92 = in.m_46.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = _90 * 5.34962368011474609375;
    float _100 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _102 = abs(_98);
    bool _106 = _102 > 1.0;
    float _108 = abs(_98);
    bool _110 = _108 > as_type<float>(0x7f800000u /* inf */);
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _118 = _114 || _116;
    float _120 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _122 = _120 + 1.0;
    float _124 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _126 = 0.0;
    if (_106)
    {
        float _128 = abs(_98);
        float _130 = 1.0 / _128;
        _126 = _130;
    }
    float _132 = _126;
    float _134 = 0.0;
    if (!_106)
    {
        float _136 = abs(_98);
        float _138 = (-0.0) + _136;
        _134 = _138;
    }
    float _140 = _134;
    float _142 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _144 = fma(_142, 2.0, -1.0);
    float _146 = _82 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _148 = 1.0 / _58;
    int _151 = as_type<int>(_98) & int(0x80000000);
    float _153 = _148 * _70;
    float _155 = _148 * _76;
    float _157 = _148 * _88;
    float _159 = _148 * _96;
    float _161 = precise::max(_144, _153);
    float _163 = _155 * _155;
    float _165 = _153;
    float _167 = _163;
    float _169 = _140;
    if (!_106)
    {
        _165 = _140;
    }
    float _171 = _165;
    float _173 = _171;
    if (_106)
    {
        _173 = _132;
    }
    float _175 = _173;
    float _177 = _155 * _161;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _181 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _179;
    float _183 = -_100;
    float _185 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _183);
    float _187 = -_100;
    float _189 = _187 + _163;
    float _191 = -_163;
    float _193 = fma(_177, _177, _191);
    float _195 = _175 * _175;
    float _197 = 1.0 / _181;
    float _199 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _201 = _155 + _199;
    float _203 = -_100;
    bool _205 = _193 > _203;
    float _207 = _195 + 11.33538818359375;
    float _209 = _100 + _193;
    float _211 = fma(_195, -0.82336294651031494140625, -5.674867153167724609375);
    bool _213 = _177 < 0.0;
    bool _215 = _213 && _205;
    float _217 = fma(_195, _207, 28.84246826171875);
    float _219 = sqrt(_185);
    float _221 = _146 * 1.57079637050628662109375;
    float _223 = fma(_195, _211, -6.565555095672607421875);
    float _225 = fma(_195, _217, 19.6966705322265625);
    float _227 = _221 * 0.15915493667125701904296875;
    float _229 = _195 * _223;
    float _231 = _201 * _197;
    float _233 = sqrt(_189);
    float _235 = _229 * _175;
    float _237 = _207;
    float _239 = _221;
    if (_215)
    {
        _237 = 0.0;
    }
    float _241 = _237;
    float _243 = _241;
    if (!_215)
    {
        _243 = _185;
    }
    float _245 = _243;
    if (_215)
    {
        _239 = 0.0;
    }
    float _247 = _239;
    float _249 = 1.0 / _225;
    float _251 = _247;
    if (!_215)
    {
        _251 = _219;
    }
    float _253 = _251;
    float _255 = _209 + _245;
    if (_215)
    {
        _167 = 1.0;
    }
    float _257 = _167;
    float _259 = _257;
    if (!_215)
    {
        _259 = -1.0;
    }
    float _261 = _259;
    float _263 = _227 * 6.283185482025146484375;
    float _265 = sin(_263);
    float _267 = _233 + _253;
    float _269 = sqrt(_255);
    float _271 = fma(_235, _249, _175);
    int _273 = as_type<int>(_271);
    float _275 = _267;
    if (_106)
    {
        float _277 = -_271;
        float _279 = _277 + 1.57079637050628662109375;
        _273 = as_type<int>(_279);
    }
    int _281 = _273;
    float _283 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _285 = _283 + 0.5;
    float _287 = 1.0 / _267;
    float _289 = as_type<float>(_281);
    if (!_118)
    {
        int _291 = _151 | _281;
        _289 = as_type<float>(_291);
    }
    float _293 = _289;
    float _295 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
    float _297 = fma(_177, _261, _269);
    float _299 = fma(0.454545438289642333984375, _293, 0.37000000476837158203125);
    float _301 = _265 * _295;
    if (_215)
    {
        float _303 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _305 = fma(_303, 0.5, 0.5);
        _275 = _305;
    }
    float _307 = _275;
    float _309 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _311 = _309 + 1.0;
    float _313 = _307;
    if (!_215)
    {
        float _315 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
        _313 = _315;
    }
    float _317 = _313;
    float _319 = floor(_301);
    float _321 = _297 * _287;
    float _323 = fma(_299, _122, _124);
    float _325 = _231 * _311;
    float _327 = fma(_321, _285, _317);
    float _329 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _325);
    float _331 = _323 + _319;
    float _333 = _331 + 1.0;
    float _335 = _331 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _337 = _333 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1283 = float3(_335, _327, _329);
    float4 _340 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1283, float3(0.0), isnan(_1283))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1283, float3(0.0), isnan(_1283))).xyzw;
    float _342 = _340.x;
    float _344 = _340.y;
    float _346 = _340.z;
    float _348 = _340.w;
    float3 _1302 = float3(_337, _327, _329);
    float4 _350 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1302, float3(0.0), isnan(_1302))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1302, float3(0.0), isnan(_1302))).xyzw;
    float _352 = _350.x;
    float _354 = _350.y;
    float _356 = _350.z;
    float _358 = _350.w;
    float2 _1319 = float2(_157, _159);
    float3 _362 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1319, float2(0.0), isnan(_1319))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1319, float2(0.0), isnan(_1319))).xyz;
    float _364 = _362.x;
    float _366 = _362.y;
    float _368 = _362.z;
    float2 _1335 = float2(_157, _159);
    float3 _370 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1335, float2(0.0), isnan(_1335))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1335, float2(0.0), isnan(_1335))).xyz;
    float _372 = _370.x;
    float _374 = _370.y;
    float _376 = _370.z;
    float2 _1349 = float2(_157, _159);
    float3 _378 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1349, float2(0.0), isnan(_1349))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1349, float2(0.0), isnan(_1349))).xyz;
    float _380 = _378.x;
    float _382 = _378.y;
    float _384 = _378.z;
    float2 _1363 = float2(_157, _159);
    float3 _386 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1363, float2(0.0), isnan(_1363))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1363, float2(0.0), isnan(_1363))).xyz;
    float _388 = _386.x;
    float _390 = _386.y;
    float _392 = _386.z;
    float _394 = in.m_48.x;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = fma(_142, 2.0, -0.25);
    float _402 = precise::clamp(_400, 0.0, 1.0);
    float _404 = fma(_146, 2.0, -0.25);
    float _406 = precise::clamp(_404, 0.0, 1.0);
    float _408 = fma(_265, 2.0, -1.0);
    bool _410 = 0.0 < (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _412 = precise::max(_406, _402);
    float _414 = _412 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _416 = fma(_414, _414, 1.0);
    float _418 = _148 * _398;
    float _420 = _414 * 2.0;
    float _422 = -_420;
    float _424 = fma(_408, _422, _416);
    float _426 = fma(_414, _414, 2.0);
    float _428 = -_414;
    float _430 = fma(_428, _414, 1.0);
    float _432 = fma(_408, _408, 1.0);
    bool _434 = _418 < _144;
    int _436 = _434 ? 1065353216 : 0;
    float _438 = abs(_424);
    float _440 = log2(_438);
    float _442 = _430 * _432;
    float _444 = -_319;
    float _446 = _301 + _444;
    float _448 = _442 * 0.119366206228733062744140625;
    float _450 = _440 * 1.5;
    float _452 = exp2(_450);
    float _454 = _426 * _452;
    float _456 = 1.0 / _454;
    float _458 = -_342;
    float _460 = _458 + _352;
    float _462 = _366 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _464 = -_348;
    float _466 = _464 + _358;
    float _468 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _470 = fma(_446, _460, _342);
    float _472 = _448 * _456;
    float _474 = fma(_446, _466, _348);
    float _476 = -_344;
    float _478 = _476 + _354;
    float _480 = -_346;
    float _482 = _480 + _356;
    float _484 = precise::max(0.0, _470);
    float _486 = _364 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _488 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _490 = fma(_446, _478, _344);
    float _492 = precise::max(_484, 9.9999997473787516355514526367188e-05);
    float _494 = fma(_446, _482, _346);
    float _496 = precise::max(0.0, _474);
    float _498 = _368 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _500 = precise::max(0.0, _490);
    float _502 = _472 * (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _504 = 1.0 / _492;
    float _506 = precise::max(0.0, _494);
    float _508 = _468 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _510 = fma(_372, (*spvDescriptorSet0.fp_c4)._m0[6].x, _486);
    float _512 = fma(_374, (*spvDescriptorSet0.fp_c4)._m0[6].x, _462);
    float _514 = fma(_376, (*spvDescriptorSet0.fp_c4)._m0[6].x, _498);
    float _516 = _488 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _518 = _496 * _504;
    float _520 = _500 * _518;
    float _522 = _506 * _518;
    float _524 = _484 * _518;
    float _526 = _520 * _508;
    float _528 = _522 * _516;
    float _530 = fma(_380, (*spvDescriptorSet0.fp_c4)._m0[6].z, _510);
    float _532 = _502 * _524;
    float _534 = fma(_382, (*spvDescriptorSet0.fp_c4)._m0[6].z, _512);
    float _536 = fma(_384, (*spvDescriptorSet0.fp_c4)._m0[6].z, _514);
    float _538 = _502 * _526;
    float _540 = _502 * _528;
    float _542 = fma(_388, (*spvDescriptorSet0.fp_c4)._m0[6].w, _530);
    float _544 = _532 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _546 = fma(_390, (*spvDescriptorSet0.fp_c4)._m0[6].w, _534);
    float _548 = fma(_392, (*spvDescriptorSet0.fp_c4)._m0[6].w, _536);
    float _550 = _538 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _552 = _540 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _554 = fma(_542, (*spvDescriptorSet0.fp_c4)._m0[4].x, _544);
    float _556 = fma(_546, (*spvDescriptorSet0.fp_c4)._m0[4].y, _550);
    float _558 = fma(_548, (*spvDescriptorSet0.fp_c4)._m0[4].z, _552);
    float _560 = precise::max(0.0, _554);
    float _562 = precise::max(0.0, _556);
    float _564 = precise::max(0.0, _558);
    float _566 = _538;
    if (!_410)
    {
        out.m_51.x = _560;
        out.m_51.y = _562;
        out.m_51.z = _564;
        out.m_51.w = as_type<float>(_436);
        return out;
    }
    if (_106)
    {
        _169 = _132;
    }
    float _568 = _169;
    float _570 = _568 * _568;
    float _572 = _570 + 11.33538818359375;
    float _574 = fma(_570, -0.82336294651031494140625, -5.674867153167724609375);
    float _576 = fma(_570, _572, 28.84246826171875);
    float _578 = fma(_570, _574, -6.565555095672607421875);
    float _580 = _572;
    float _582 = _570;
    if (_215)
    {
        _580 = 0.0;
        _566 = 0.0;
    }
    float _584 = _580;
    float _586 = _566;
    float _588 = fma(_570, _576, 19.6966705322265625);
    float _590 = _584;
    float _592 = _586;
    if (!_215)
    {
        _590 = _185;
    }
    float _594 = _590;
    float _596 = _570 * _578;
    if (!_215)
    {
        _592 = _219;
    }
    float _598 = _592;
    float _600 = _598;
    if (_215)
    {
        _582 = 1.0;
    }
    float _602 = _582;
    float _604 = 1.0 / _588;
    float _606 = _596 * _568;
    float _608 = _209 + _594;
    float _610 = _233 + _598;
    float _612 = _602;
    if (!_215)
    {
        _612 = -1.0;
    }
    float _614 = _612;
    if (_215)
    {
        float _616 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _618 = fma(0.5, _616, 0.5);
        _600 = _618;
    }
    float _620 = _600;
    float _622 = _620;
    if (!_215)
    {
        float _624 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5);
        _622 = _624;
    }
    float _626 = _622;
    float _628 = sqrt(_608);
    float _630 = fma(_606, _604, _568);
    float _632 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[6].x, -0.5);
    float _634 = 1.0 / _610;
    int _636 = as_type<int>(_630);
    if (_106)
    {
        float _638 = -_630;
        float _640 = _638 + 1.57079637050628662109375;
        _636 = as_type<int>(_640);
    }
    int _642 = _636;
    float _644 = fma(_177, _614, _628);
    float _646 = as_type<float>(_642);
    if (!_118)
    {
        int _648 = _151 | _642;
        _646 = as_type<float>(_648);
    }
    float _650 = _646;
    float _652 = floor(_632);
    float _654 = fma(0.454545438289642333984375, _650, 0.37000000476837158203125);
    float _656 = fma(_122, _654, _124);
    float _658 = _644 * _634;
    float _660 = fma(_285, _658, _626);
    float _662 = _656 + _652;
    float _664 = _662 + 1.0;
    float _666 = _662 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _668 = _664 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1819 = float3(_666, _660, _329);
    float4 _670 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1819, float3(0.0), isnan(_1819))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1819, float3(0.0), isnan(_1819))).xyzw;
    float _672 = _670.x;
    float _674 = _670.y;
    float _676 = _670.z;
    float _678 = _670.w;
    float3 _1836 = float3(_668, _660, _329);
    float4 _680 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1836, float3(0.0), isnan(_1836))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1836, float3(0.0), isnan(_1836))).xyzw;
    float _682 = _680.x;
    float _684 = _680.y;
    float _686 = _680.z;
    float _688 = _680.w;
    float2 _1851 = float2(0.5, _159);
    float3 _690 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1851, float2(0.0), isnan(_1851))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1851, float2(0.0), isnan(_1851))).xyz;
    float _692 = _690.x;
    float _694 = _690.y;
    float _696 = _690.z;
    float2 _1864 = float2(0.5, _159);
    float3 _698 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1864, float2(0.0), isnan(_1864))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1864, float2(0.0), isnan(_1864))).xyz;
    float _700 = _698.x;
    float _702 = _698.y;
    float _704 = _698.z;
    float2 _1877 = float2(0.5, _159);
    float3 _706 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1877, float2(0.0), isnan(_1877))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1877, float2(0.0), isnan(_1877))).xyz;
    float _708 = _706.x;
    float _710 = _706.y;
    float _712 = _706.z;
    float2 _1890 = float2(0.5, _159);
    float3 _714 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1890, float2(0.0), isnan(_1890))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1890, float2(0.0), isnan(_1890))).xyz;
    float _716 = _714.x;
    float _718 = _714.y;
    float _720 = _714.z;
    float _722 = -_652;
    float _724 = _632 + _722;
    float _726 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _728 = _726 + 1.0;
    float _730 = abs(_728);
    float _732 = log2(_730);
    float _734 = _732 * 1.5;
    float _736 = exp2(_734);
    float _738 = -_672;
    float _740 = _738 + _682;
    float _742 = _726 + 2.0;
    float _744 = -_678;
    float _746 = _744 + _688;
    float _748 = -_674;
    float _750 = _748 + _684;
    float _752 = fma(_724, _740, _672);
    float _754 = _742 * _736;
    float _756 = fma(_724, _746, _678);
    float _758 = -_676;
    float _760 = _758 + _686;
    float _762 = fma(_724, _750, _674);
    float _764 = precise::max(0.0, _752);
    float _766 = 1.0 / _754;
    float _768 = precise::max(0.0, _756);
    float _770 = fma(_724, _760, _676);
    float _772 = precise::max(_764, 9.9999997473787516355514526367188e-05);
    float _774 = _696 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _776 = precise::max(0.0, _762);
    float _778 = fma(_704, (*spvDescriptorSet0.fp_c4)._m0[6].x, _774);
    float _780 = 1.0 / _772;
    float _782 = precise::max(0.0, _770);
    float _784 = fma(_726, -0.119366206228733062744140625, 0.119366206228733062744140625);
    float _786 = fma(_712, (*spvDescriptorSet0.fp_c4)._m0[6].z, _778);
    float _788 = _784 * _766;
    float _790 = fma(_720, (*spvDescriptorSet0.fp_c4)._m0[6].w, _786);
    float _792 = _788 * (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _794 = _768 * _780;
    float _796 = _776 * _794;
    float _798 = _782 * _794;
    float _800 = _692 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _802 = _764 * _794;
    float _804 = _508 * _796;
    float _806 = _694 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _808 = _516 * _798;
    float _810 = fma(_700, (*spvDescriptorSet0.fp_c4)._m0[6].x, _800);
    float _812 = _792 * _802;
    float _814 = fma(_702, (*spvDescriptorSet0.fp_c4)._m0[6].x, _806);
    float _816 = _792 * _804;
    float _818 = fma(_708, (*spvDescriptorSet0.fp_c4)._m0[6].z, _810);
    float _820 = _792 * _808;
    float _822 = fma(_710, (*spvDescriptorSet0.fp_c4)._m0[6].z, _814);
    float _824 = _812 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _826 = fma(_716, (*spvDescriptorSet0.fp_c4)._m0[6].w, _818);
    float _828 = _816 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _830 = fma(_718, (*spvDescriptorSet0.fp_c4)._m0[6].w, _822);
    float _832 = _820 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _834 = fma(_826, (*spvDescriptorSet0.fp_c4)._m0[4].x, _824);
    float _836 = fma(_830, (*spvDescriptorSet0.fp_c4)._m0[4].y, _828);
    float _838 = fma(_790, (*spvDescriptorSet0.fp_c4)._m0[4].z, _832);
    float _840 = precise::max(0.0, _834);
    float _842 = precise::max(0.0, _836);
    float _844 = precise::max(0.0, _838);
    float _846 = -_560;
    float _848 = _846 + _840;
    float _850 = -_562;
    float _852 = _850 + _842;
    float _854 = -_564;
    float _856 = _854 + _844;
    float _858 = fma(_848, (*spvDescriptorSet0.fp_c4)._m0[2].w, _560);
    float _860 = fma(_852, (*spvDescriptorSet0.fp_c4)._m0[2].w, _562);
    float _862 = fma(_856, (*spvDescriptorSet0.fp_c4)._m0[2].w, _564);
    out.m_51.x = _858;
    out.m_51.y = _860;
    out.m_51.z = _862;
    out.m_51.w = as_type<float>(_436);
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
    float _92 = in.m_46.y;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = _90 * 5.34962368011474609375;
    float _100 = (*spvDescriptorSet0.fp_c3)._m0[8].x * (*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _102 = abs(_98);
    bool _106 = _102 > 1.0;
    float _108 = abs(_98);
    bool _110 = _108 > as_type<float>(0x7f800000u /* inf */);
    bool _112 = isnan(_108);
    bool _114 = _110 || _112;
    bool _116 = isnan(as_type<float>(0x7f800000u /* inf */));
    bool _118 = _114 || _116;
    float _120 = -(*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _122 = _120 + 1.0;
    float _124 = 0.5 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _126 = 0.0;
    if (_106)
    {
        float _128 = abs(_98);
        float _130 = 1.0 / _128;
        _126 = _130;
    }
    float _132 = _126;
    float _134 = 0.0;
    if (!_106)
    {
        float _136 = abs(_98);
        float _138 = (-0.0) + _136;
        _134 = _138;
    }
    float _140 = _134;
    float _142 = _64 * (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _144 = fma(_142, 2.0, -1.0);
    float _146 = _82 * (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _148 = 1.0 / _58;
    int _151 = as_type<int>(_98) & int(0x80000000);
    float _153 = _148 * _70;
    float _155 = _148 * _76;
    float _157 = _148 * _88;
    float _159 = _148 * _96;
    float _161 = precise::max(_144, _153);
    float _163 = _155 * _155;
    float _165 = _153;
    float _167 = _163;
    float _169 = _140;
    if (!_106)
    {
        _165 = _140;
    }
    float _171 = _165;
    float _173 = _171;
    if (_106)
    {
        _173 = _132;
    }
    float _175 = _173;
    float _177 = _155 * _161;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _181 = (*spvDescriptorSet0.fp_c3)._m0[8].y + _179;
    float _183 = -_100;
    float _185 = fma((*spvDescriptorSet0.fp_c3)._m0[8].y, (*spvDescriptorSet0.fp_c3)._m0[8].y, _183);
    float _187 = -_100;
    float _189 = _187 + _163;
    float _191 = -_163;
    float _193 = fma(_177, _177, _191);
    float _195 = _175 * _175;
    float _197 = 1.0 / _181;
    float _199 = -(*spvDescriptorSet0.fp_c3)._m0[8].x;
    float _201 = _155 + _199;
    float _203 = -_100;
    bool _205 = _193 > _203;
    float _207 = _195 + 11.33538818359375;
    float _209 = _100 + _193;
    float _211 = fma(_195, -0.82336294651031494140625, -5.674867153167724609375);
    bool _213 = _177 < 0.0;
    bool _215 = _213 && _205;
    float _217 = fma(_195, _207, 28.84246826171875);
    float _219 = sqrt(_185);
    float _221 = _146 * 1.57079637050628662109375;
    float _223 = fma(_195, _211, -6.565555095672607421875);
    float _225 = fma(_195, _217, 19.6966705322265625);
    float _227 = _221 * 0.15915493667125701904296875;
    float _229 = _195 * _223;
    float _231 = _201 * _197;
    float _233 = sqrt(_189);
    float _235 = _229 * _175;
    float _237 = _207;
    float _239 = _221;
    if (_215)
    {
        _237 = 0.0;
    }
    float _241 = _237;
    float _243 = _241;
    if (!_215)
    {
        _243 = _185;
    }
    float _245 = _243;
    if (_215)
    {
        _239 = 0.0;
    }
    float _247 = _239;
    float _249 = 1.0 / _225;
    float _251 = _247;
    if (!_215)
    {
        _251 = _219;
    }
    float _253 = _251;
    float _255 = _209 + _245;
    if (_215)
    {
        _167 = 1.0;
    }
    float _257 = _167;
    float _259 = _257;
    if (!_215)
    {
        _259 = -1.0;
    }
    float _261 = _259;
    float _263 = _227 * 6.283185482025146484375;
    float _265 = sin(_263);
    float _267 = _233 + _253;
    float _269 = sqrt(_255);
    float _271 = fma(_235, _249, _175);
    int _273 = as_type<int>(_271);
    float _275 = _267;
    if (_106)
    {
        float _277 = -_271;
        float _279 = _277 + 1.57079637050628662109375;
        _273 = as_type<int>(_279);
    }
    int _281 = _273;
    float _283 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _285 = _283 + 0.5;
    float _287 = 1.0 / _267;
    float _289 = as_type<float>(_281);
    if (!_118)
    {
        int _291 = _151 | _281;
        _289 = as_type<float>(_291);
    }
    float _293 = _289;
    float _295 = (*spvDescriptorSet0.fp_c3)._m0[6].x + (-1.0);
    float _297 = fma(_177, _261, _269);
    float _299 = fma(0.454545438289642333984375, _293, 0.37000000476837158203125);
    float _301 = _265 * _295;
    if (_215)
    {
        float _303 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _305 = fma(_303, 0.5, 0.5);
        _275 = _305;
    }
    float _307 = _275;
    float _309 = -(*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _311 = _309 + 1.0;
    float _313 = _307;
    if (!_215)
    {
        float _315 = fma((*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5, 0.5);
        _313 = _315;
    }
    float _317 = _313;
    float _319 = floor(_301);
    float _321 = _297 * _287;
    float _323 = fma(_299, _122, _124);
    float _325 = _231 * _311;
    float _327 = fma(_321, _285, _317);
    float _329 = fma((*spvDescriptorSet0.fp_c3)._m0[7].y, 0.5, _325);
    float _331 = _323 + _319;
    float _333 = _331 + 1.0;
    float _335 = _331 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _337 = _333 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1283 = float3(_335, _327, _329);
    float4 _340 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1283, float3(0.0), isnan(_1283))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1283, float3(0.0), isnan(_1283))).xyzw;
    float _342 = _340.x;
    float _344 = _340.y;
    float _346 = _340.z;
    float _348 = _340.w;
    float3 _1302 = float3(_337, _327, _329);
    float4 _350 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1302, float3(0.0), isnan(_1302))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1302, float3(0.0), isnan(_1302))).xyzw;
    float _352 = _350.x;
    float _354 = _350.y;
    float _356 = _350.z;
    float _358 = _350.w;
    float2 _1319 = float2(_157, _159);
    float3 _362 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1319, float2(0.0), isnan(_1319))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1319, float2(0.0), isnan(_1319))).xyz;
    float _364 = _362.x;
    float _366 = _362.y;
    float _368 = _362.z;
    float2 _1335 = float2(_157, _159);
    float3 _370 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1335, float2(0.0), isnan(_1335))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1335, float2(0.0), isnan(_1335))).xyz;
    float _372 = _370.x;
    float _374 = _370.y;
    float _376 = _370.z;
    float2 _1349 = float2(_157, _159);
    float3 _378 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1349, float2(0.0), isnan(_1349))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1349, float2(0.0), isnan(_1349))).xyz;
    float _380 = _378.x;
    float _382 = _378.y;
    float _384 = _378.z;
    float2 _1363 = float2(_157, _159);
    float3 _386 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1363, float2(0.0), isnan(_1363))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1363, float2(0.0), isnan(_1363))).xyz;
    float _388 = _386.x;
    float _390 = _386.y;
    float _392 = _386.z;
    float _394 = in.m_48.x;
    float _396 = gl_FragCoord.w;
    float _398 = _394 * _396;
    float _400 = fma(_142, 2.0, -0.25);
    float _402 = precise::clamp(_400, 0.0, 1.0);
    float _404 = fma(_146, 2.0, -0.25);
    float _406 = precise::clamp(_404, 0.0, 1.0);
    float _408 = fma(_265, 2.0, -1.0);
    bool _410 = 0.0 < (*spvDescriptorSet0.fp_c4)._m0[2].w;
    float _412 = precise::max(_406, _402);
    float _414 = _412 * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _416 = fma(_414, _414, 1.0);
    float _418 = _148 * _398;
    float _420 = _414 * 2.0;
    float _422 = -_420;
    float _424 = fma(_408, _422, _416);
    float _426 = fma(_414, _414, 2.0);
    float _428 = -_414;
    float _430 = fma(_428, _414, 1.0);
    float _432 = fma(_408, _408, 1.0);
    bool _434 = _418 < _144;
    int _436 = _434 ? 1065353216 : 0;
    float _438 = abs(_424);
    float _440 = log2(_438);
    float _442 = _430 * _432;
    float _444 = -_319;
    float _446 = _301 + _444;
    float _448 = _442 * 0.119366206228733062744140625;
    float _450 = _440 * 1.5;
    float _452 = exp2(_450);
    float _454 = _426 * _452;
    float _456 = 1.0 / _454;
    float _458 = -_342;
    float _460 = _458 + _352;
    float _462 = _366 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _464 = -_348;
    float _466 = _464 + _358;
    float _468 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].y;
    float _470 = fma(_446, _460, _342);
    float _472 = _448 * _456;
    float _474 = fma(_446, _466, _348);
    float _476 = -_344;
    float _478 = _476 + _354;
    float _480 = -_346;
    float _482 = _480 + _356;
    float _484 = precise::max(0.0, _470);
    float _486 = _364 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _488 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[0].z;
    float _490 = fma(_446, _478, _344);
    float _492 = precise::max(_484, 9.9999997473787516355514526367188e-05);
    float _494 = fma(_446, _482, _346);
    float _496 = precise::max(0.0, _474);
    float _498 = _368 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _500 = precise::max(0.0, _490);
    float _502 = _472 * (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _504 = 1.0 / _492;
    float _506 = precise::max(0.0, _494);
    float _508 = _468 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _510 = fma(_372, (*spvDescriptorSet0.fp_c4)._m0[6].x, _486);
    float _512 = fma(_374, (*spvDescriptorSet0.fp_c4)._m0[6].x, _462);
    float _514 = fma(_376, (*spvDescriptorSet0.fp_c4)._m0[6].x, _498);
    float _516 = _488 * (*spvDescriptorSet0.fp_c4)._m0[0].x;
    float _518 = _496 * _504;
    float _520 = _500 * _518;
    float _522 = _506 * _518;
    float _524 = _484 * _518;
    float _526 = _520 * _508;
    float _528 = _522 * _516;
    float _530 = fma(_380, (*spvDescriptorSet0.fp_c4)._m0[6].z, _510);
    float _532 = _502 * _524;
    float _534 = fma(_382, (*spvDescriptorSet0.fp_c4)._m0[6].z, _512);
    float _536 = fma(_384, (*spvDescriptorSet0.fp_c4)._m0[6].z, _514);
    float _538 = _502 * _526;
    float _540 = _502 * _528;
    float _542 = fma(_388, (*spvDescriptorSet0.fp_c4)._m0[6].w, _530);
    float _544 = _532 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _546 = fma(_390, (*spvDescriptorSet0.fp_c4)._m0[6].w, _534);
    float _548 = fma(_392, (*spvDescriptorSet0.fp_c4)._m0[6].w, _536);
    float _550 = _538 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _552 = _540 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _554 = fma(_542, (*spvDescriptorSet0.fp_c4)._m0[4].x, _544);
    float _556 = fma(_546, (*spvDescriptorSet0.fp_c4)._m0[4].y, _550);
    float _558 = fma(_548, (*spvDescriptorSet0.fp_c4)._m0[4].z, _552);
    float _560 = precise::max(0.0, _554);
    float _562 = precise::max(0.0, _556);
    float _564 = precise::max(0.0, _558);
    float _566 = _538;
    if (!_410)
    {
        out.m_51.x = _560;
        out.m_51.y = _562;
        out.m_51.z = _564;
        out.m_51.w = as_type<float>(_436);
        return main0_out_u{as_type<uint4>(out.m_51)};
    }
    if (_106)
    {
        _169 = _132;
    }
    float _568 = _169;
    float _570 = _568 * _568;
    float _572 = _570 + 11.33538818359375;
    float _574 = fma(_570, -0.82336294651031494140625, -5.674867153167724609375);
    float _576 = fma(_570, _572, 28.84246826171875);
    float _578 = fma(_570, _574, -6.565555095672607421875);
    float _580 = _572;
    float _582 = _570;
    if (_215)
    {
        _580 = 0.0;
        _566 = 0.0;
    }
    float _584 = _580;
    float _586 = _566;
    float _588 = fma(_570, _576, 19.6966705322265625);
    float _590 = _584;
    float _592 = _586;
    if (!_215)
    {
        _590 = _185;
    }
    float _594 = _590;
    float _596 = _570 * _578;
    if (!_215)
    {
        _592 = _219;
    }
    float _598 = _592;
    float _600 = _598;
    if (_215)
    {
        _582 = 1.0;
    }
    float _602 = _582;
    float _604 = 1.0 / _588;
    float _606 = _596 * _568;
    float _608 = _209 + _594;
    float _610 = _233 + _598;
    float _612 = _602;
    if (!_215)
    {
        _612 = -1.0;
    }
    float _614 = _612;
    if (_215)
    {
        float _616 = -(*spvDescriptorSet0.fp_c3)._m0[4].y;
        float _618 = fma(0.5, _616, 0.5);
        _600 = _618;
    }
    float _620 = _600;
    float _622 = _620;
    if (!_215)
    {
        float _624 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[4].y, 0.5);
        _622 = _624;
    }
    float _626 = _622;
    float _628 = sqrt(_608);
    float _630 = fma(_606, _604, _568);
    float _632 = fma(0.5, (*spvDescriptorSet0.fp_c3)._m0[6].x, -0.5);
    float _634 = 1.0 / _610;
    int _636 = as_type<int>(_630);
    if (_106)
    {
        float _638 = -_630;
        float _640 = _638 + 1.57079637050628662109375;
        _636 = as_type<int>(_640);
    }
    int _642 = _636;
    float _644 = fma(_177, _614, _628);
    float _646 = as_type<float>(_642);
    if (!_118)
    {
        int _648 = _151 | _642;
        _646 = as_type<float>(_648);
    }
    float _650 = _646;
    float _652 = floor(_632);
    float _654 = fma(0.454545438289642333984375, _650, 0.37000000476837158203125);
    float _656 = fma(_122, _654, _124);
    float _658 = _644 * _634;
    float _660 = fma(_285, _658, _626);
    float _662 = _656 + _652;
    float _664 = _662 + 1.0;
    float _666 = _662 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _668 = _664 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float3 _1819 = float3(_666, _660, _329);
    float4 _670 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1819, float3(0.0), isnan(_1819))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1819, float3(0.0), isnan(_1819))).xyzw;
    float _672 = _670.x;
    float _674 = _670.y;
    float _676 = _670.z;
    float _678 = _670.w;
    float3 _1836 = float3(_668, _660, _329);
    float4 _680 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_1836, float3(0.0), isnan(_1836))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_1836, float3(0.0), isnan(_1836))).xyzw;
    float _682 = _680.x;
    float _684 = _680.y;
    float _686 = _680.z;
    float _688 = _680.w;
    float2 _1851 = float2(0.5, _159);
    float3 _690 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1851, float2(0.0), isnan(_1851))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1851, float2(0.0), isnan(_1851))).xyz;
    float _692 = _690.x;
    float _694 = _690.y;
    float _696 = _690.z;
    float2 _1864 = float2(0.5, _159);
    float3 _698 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1864, float2(0.0), isnan(_1864))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1864, float2(0.0), isnan(_1864))).xyz;
    float _700 = _698.x;
    float _702 = _698.y;
    float _704 = _698.z;
    float2 _1877 = float2(0.5, _159);
    float3 _706 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_1877, float2(0.0), isnan(_1877))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_1877, float2(0.0), isnan(_1877))).xyz;
    float _708 = _706.x;
    float _710 = _706.y;
    float _712 = _706.z;
    float2 _1890 = float2(0.5, _159);
    float3 _714 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1890, float2(0.0), isnan(_1890))), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1890, float2(0.0), isnan(_1890))).xyz;
    float _716 = _714.x;
    float _718 = _714.y;
    float _720 = _714.z;
    float _722 = -_652;
    float _724 = _632 + _722;
    float _726 = (*spvDescriptorSet0.fp_c4)._m0[0].w * (*spvDescriptorSet0.fp_c4)._m0[0].w;
    float _728 = _726 + 1.0;
    float _730 = abs(_728);
    float _732 = log2(_730);
    float _734 = _732 * 1.5;
    float _736 = exp2(_734);
    float _738 = -_672;
    float _740 = _738 + _682;
    float _742 = _726 + 2.0;
    float _744 = -_678;
    float _746 = _744 + _688;
    float _748 = -_674;
    float _750 = _748 + _684;
    float _752 = fma(_724, _740, _672);
    float _754 = _742 * _736;
    float _756 = fma(_724, _746, _678);
    float _758 = -_676;
    float _760 = _758 + _686;
    float _762 = fma(_724, _750, _674);
    float _764 = precise::max(0.0, _752);
    float _766 = 1.0 / _754;
    float _768 = precise::max(0.0, _756);
    float _770 = fma(_724, _760, _676);
    float _772 = precise::max(_764, 9.9999997473787516355514526367188e-05);
    float _774 = _696 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _776 = precise::max(0.0, _762);
    float _778 = fma(_704, (*spvDescriptorSet0.fp_c4)._m0[6].x, _774);
    float _780 = 1.0 / _772;
    float _782 = precise::max(0.0, _770);
    float _784 = fma(_726, -0.119366206228733062744140625, 0.119366206228733062744140625);
    float _786 = fma(_712, (*spvDescriptorSet0.fp_c4)._m0[6].z, _778);
    float _788 = _784 * _766;
    float _790 = fma(_720, (*spvDescriptorSet0.fp_c4)._m0[6].w, _786);
    float _792 = _788 * (*spvDescriptorSet0.fp_c4)._m0[4].w;
    float _794 = _768 * _780;
    float _796 = _776 * _794;
    float _798 = _782 * _794;
    float _800 = _692 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _802 = _764 * _794;
    float _804 = _508 * _796;
    float _806 = _694 * (*spvDescriptorSet0.fp_c4)._m0[6].y;
    float _808 = _516 * _798;
    float _810 = fma(_700, (*spvDescriptorSet0.fp_c4)._m0[6].x, _800);
    float _812 = _792 * _802;
    float _814 = fma(_702, (*spvDescriptorSet0.fp_c4)._m0[6].x, _806);
    float _816 = _792 * _804;
    float _818 = fma(_708, (*spvDescriptorSet0.fp_c4)._m0[6].z, _810);
    float _820 = _792 * _808;
    float _822 = fma(_710, (*spvDescriptorSet0.fp_c4)._m0[6].z, _814);
    float _824 = _812 * (*spvDescriptorSet0.fp_c4)._m0[2].x;
    float _826 = fma(_716, (*spvDescriptorSet0.fp_c4)._m0[6].w, _818);
    float _828 = _816 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _830 = fma(_718, (*spvDescriptorSet0.fp_c4)._m0[6].w, _822);
    float _832 = _820 * (*spvDescriptorSet0.fp_c4)._m0[2].z;
    float _834 = fma(_826, (*spvDescriptorSet0.fp_c4)._m0[4].x, _824);
    float _836 = fma(_830, (*spvDescriptorSet0.fp_c4)._m0[4].y, _828);
    float _838 = fma(_790, (*spvDescriptorSet0.fp_c4)._m0[4].z, _832);
    float _840 = precise::max(0.0, _834);
    float _842 = precise::max(0.0, _836);
    float _844 = precise::max(0.0, _838);
    float _846 = -_560;
    float _848 = _846 + _840;
    float _850 = -_562;
    float _852 = _850 + _842;
    float _854 = -_564;
    float _856 = _854 + _844;
    float _858 = fma(_848, (*spvDescriptorSet0.fp_c4)._m0[2].w, _560);
    float _860 = fma(_852, (*spvDescriptorSet0.fp_c4)._m0[2].w, _562);
    float _862 = fma(_856, (*spvDescriptorSet0.fp_c4)._m0[2].w, _564);
    out.m_51.x = _858;
    out.m_51.y = _860;
    out.m_51.z = _862;
    out.m_51.w = as_type<float>(_436);
    return main0_out_u{as_type<uint4>(out.m_51)};
}

