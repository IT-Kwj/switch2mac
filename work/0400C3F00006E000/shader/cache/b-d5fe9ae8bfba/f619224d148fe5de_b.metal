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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_49 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_58 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_47 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
    float4 m_43 [[user(locn8)]];
    float4 m_45 [[user(locn9)]];
    float4 m_54 [[user(locn10)]];
    float4 m_56 [[user(locn11)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _65 = gl_FragCoord.w;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _65;
    float _81 = _79 * _71;
    float _83 = _79 * _77;
    float2 _718 = float2(_83, _81);
    float2 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_718, float2(0.0), isnan(_718))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_718, float2(0.0), isnan(_718))).xw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = in.m_37.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _79 * _97;
    float _107 = _79 * _103;
    float _109 = in.m_35.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_35.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _79 * _119;
    bool _125 = _91 >= _105;
    bool _127 = isnan(_91);
    bool _129 = _125 || _127;
    bool _131 = isnan(_105);
    bool _133 = _129 || _131;
    float _135 = float(_133);
    float _137 = 0.0 + _135;
    float _139 = precise::clamp(_137, 0.0, 1.0);
    float _141 = _139 * _107;
    bool _143 = _141 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _145 = isnan(_141);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _151 = _147 || _149;
    if (!_151)
    {
        discard_fragment();
    }
    float _153 = _79 * _113;
    float2 _818 = float2(_153, _121);
    float2 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_818, float2(0.0), isnan(_818))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_818, float2(0.0), isnan(_818))).xy;
    float _157 = _155.x;
    float _159 = _155.y;
    float _161 = in.m_41.y;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_41.x;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = in.m_43.y;
    float _175 = gl_FragCoord.w;
    float _177 = _173 * _175;
    float _179 = in.m_41.z;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = in.m_43.x;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    float _191 = in.m_43.z;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_45.y;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = in.m_45.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_47.y;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_45.z;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = in.m_47.x;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = in.m_47.z;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = _79 * _165;
    float _235 = _79 * _171;
    float _237 = _79 * _177;
    float _239 = _79 * _183;
    float _241 = _233 * _233;
    float _243 = _79 * _189;
    float _245 = -(*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _247 = _237 + _245;
    float _249 = _79 * _195;
    float _251 = fma(_235, _235, _241);
    float _253 = -(*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _255 = _243 + _253;
    float _257 = _247 * _247;
    float _259 = -(*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _261 = _249 + _259;
    float _263 = fma(_239, _239, _251);
    float _265 = _79 * _201;
    float _267 = fma(_255, _255, _257);
    float _269 = _79 * _207;
    float _271 = rsqrt(_263);
    float _273 = _265 * _265;
    float _275 = fma(_261, _261, _267);
    float _277 = _79 * _213;
    float _279 = _79 * _219;
    float _281 = fma(_269, _269, _273);
    float _283 = _79 * _225;
    float _285 = _277 * _277;
    float _287 = rsqrt(_275);
    float _289 = fma(_279, _279, _281);
    float _291 = _79 * _231;
    float _293 = fma(_283, _283, _285);
    float _295 = fma(_291, _291, _293);
    float _297 = _233 * _271;
    float _299 = _235 * _271;
    float _301 = _239 * _271;
    float _303 = rsqrt(_289);
    float _305 = _297 * _297;
    float _307 = in.m_49.z;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = fma(_299, _299, _305);
    float _315 = _247 * _287;
    float _317 = _255 * _287;
    float _319 = rsqrt(_295);
    float _321 = _261 * _287;
    float _323 = fma(_301, _301, _313);
    float _325 = _315 * _315;
    float _327 = fma(_317, _317, _325);
    float _329 = rsqrt(_323);
    float _331 = fma(_321, _321, _327);
    float _333 = _291 * _319;
    float _335 = rsqrt(_331);
    float _337 = _159 * _159;
    float _339 = _319 * _159;
    float _341 = _303 * _157;
    float _343 = _159 * _333;
    float _345 = fma(_157, _157, _337);
    float _347 = precise::clamp(_345, 0.0, 1.0);
    float _349 = _277 * _339;
    float _351 = _283 * _339;
    float _353 = fma(_279, _341, _343);
    float _355 = -_347;
    float _357 = _355 + 1.0;
    float _359 = fma(_265, _341, _349);
    float _361 = fma(_269, _341, _351);
    float _363 = _315 * _335;
    float _365 = sqrt(_357);
    float _367 = in.m_49.x;
    float _369 = gl_FragCoord.w;
    float _371 = _367 * _369;
    float _373 = _317 * _335;
    float _375 = _321 * _335;
    float _377 = in.m_37.y;
    float _379 = gl_FragCoord.w;
    float _381 = _377 * _379;
    float _383 = in.m_49.y;
    float _385 = gl_FragCoord.w;
    float _387 = _383 * _385;
    float _389 = _365 * _329;
    float _391 = fma(_297, _389, _359);
    float _393 = fma(_299, _389, _361);
    float _395 = fma(_301, _389, _353);
    float _397 = _391 * _391;
    float _399 = _391 * _363;
    float _401 = fma(_393, _393, _397);
    float _403 = fma(_393, _373, _399);
    float _405 = _79 * _311;
    float _407 = fma(_395, _395, _401);
    float _409 = fma(_395, _375, _403);
    float _411 = in.m_37.x;
    float _413 = gl_FragCoord.w;
    float _415 = _411 * _413;
    float _417 = abs(_409);
    float _419 = _417 + (-1.0);
    float _421 = rsqrt(_407);
    float _423 = -_419;
    float _425 = 0.0 + _423;
    float _427 = precise::clamp(_425, 0.0, 1.0);
    float _429 = _391 * _421;
    float _431 = _395 * _421;
    float _433 = _79 * _387;
    float _435 = _429 * (-0.816474258899688720703125);
    float _437 = in.m_37.z;
    float _439 = gl_FragCoord.w;
    float _441 = _437 * _439;
    float _443 = -_435;
    float _445 = fma(_431, 0.577381789684295654296875, _443);
    float _447 = fma(_445, 0.5, 0.5);
    float _449 = precise::clamp(_447, 0.0, 1.0);
    float _451 = fma(_89, (*spvDescriptorSet0.fp_c9)._m0[191].x, _449);
    float _453 = precise::clamp(_451, 0.0, 1.0);
    float _455 = _453 * _453;
    float _457 = _79 * _371;
    float _459 = _455 * 0.699999988079071044921875;
    float _461 = fma(_427, -2.0, 3.0);
    float _463 = _427 * _427;
    float _465 = _457 * _459;
    float _467 = _433 * _459;
    float _469 = _405 * _459;
    float _471 = _461 * _463;
    float _473 = fma(_457, 0.300000011920928955078125, _465);
    float _475 = _79 * _415;
    float _477 = fma(_433, 0.300000011920928955078125, _467);
    float _479 = fma(_405, 0.300000011920928955078125, _469);
    float _481 = _471 * (*spvDescriptorSet0.fp_c9)._m0[191].y;
    float _483 = _79 * _381;
    float _485 = _79 * _441;
    float _487 = fma(_475, _481, _473);
    float _489 = fma(_483, _481, _477);
    float _491 = fma(_485, _481, _479);
    if (!_151)
    {
        out.m_52.x = _487;
        out.m_52.y = _489;
        out.m_52.z = _491;
        out.m_52.w = _135;
        return out;
    }
    float _493 = in.m_54.w;
    float _495 = gl_FragCoord.w;
    float _497 = _493 * _495;
    float _499 = _79 * _497;
    bool _501 = _499 != 1.0;
    bool _503 = isnan(_499);
    bool _505 = _501 || _503;
    bool _507 = isnan(1.0);
    bool _509 = _505 || _507;
    bool _511 = !_509;
    if (!_511)
    {
        float _513 = gl_FragCoord.x;
        float _515 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _517 = _513 / _515;
        float _519 = gl_FragCoord.y;
        float _521 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _523 = _519 / _521;
        float _525 = _499 * 256.0;
        float _527 = trunc(_525);
        int _530 = int(_527);
        float _532 = trunc(_517);
        int _534 = int(_532);
        float _536 = trunc(_523);
        int _538 = int(_536);
        int _540 = _534 + 2;
        int _542 = _540 >> 1;
        uint _545 = uint(int(uint(_538) >> uint(1)));
        int _547 = _542 ^ int(_545);
        int _549 = _547 << 16;
        int _551 = _549 ^ _542;
        int _553 = 983055 & _551;
        int _555 = _553 << 6;
        int _557 = _555 + _553;
        int _559 = _557 & 13369548;
        uint _561 = uint(int(uint(_559) >> uint(3)));
        int _563 = _559 | int(_561);
        uint _565 = uint(int(uint(_530) >> uint(7)));
        int _567 = int(_565) + _530;
        int _569 = _563 & 5570560;
        int _571 = _563 & 85;
        uint _573 = uint(int(uint(_569) >> uint(15)));
        int _575 = int(_573) + _571;
        bool _577 = uint(_567) > uint(_575);
        if (!_577)
        {
            discard_fragment();
        }
        if (!_577)
        {
            out.m_52.x = _487;
            out.m_52.y = _489;
            out.m_52.z = _491;
            out.m_52.w = _141;
            return out;
        }
    }
    float _579 = _489 * 0.715200006961822509765625;
    float _581 = in.m_56.w;
    float _583 = gl_FragCoord.w;
    float _585 = _581 * _583;
    float _587 = in.m_56.x;
    float _589 = gl_FragCoord.w;
    float _591 = _587 * _589;
    float _593 = in.m_56.y;
    float _595 = gl_FragCoord.w;
    float _597 = _593 * _595;
    float _599 = fma(_487, 0.2125999927520751953125, _579);
    float _601 = in.m_56.z;
    float _603 = gl_FragCoord.w;
    float _605 = _601 * _603;
    float _607 = fma(_491, 0.072200000286102294921875, _599);
    bool _609 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _611 = 1.0 / _607;
    float _613 = _611 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _615 = precise::clamp(_613, 0.0, 1.0);
    float _617 = 0.0 + _141;
    float _619 = precise::clamp(_617, 0.0, 1.0);
    float _621 = fma(_615, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _623 = _79 * _585;
    float _625 = _79 * _597;
    float _627 = _79 * _605;
    float _629 = _621 * _623;
    float _631 = _79 * _591;
    float _633 = fma(_489, _629, _625);
    float _635 = fma(_487, _629, _631);
    float _637 = fma(_491, _629, _627);
    bool _639 = !_609;
    float _641 = _619;
    if (!_639)
    {
        float _643 = in.m_58.w;
        float _645 = gl_FragCoord.w;
        float _647 = _643 * _645;
        float _649 = in.m_58.z;
        float _651 = gl_FragCoord.w;
        float _653 = _649 * _651;
        float _655 = _79 * _647;
        float _657 = _79 * _653;
        float _659 = 1.0 / _655;
        float _661 = _657 * _659;
        float _663 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _665 = fma(_661, (*spvDescriptorSet0.fp_c8)._m0[30].w, _663);
        float _667 = 1.0 / _665;
        float _669 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _671 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _673 = fma(_667, _669, _671);
        float _675 = _673 * 8.0;
        float _677 = precise::clamp(_675, 0.0, 1.0);
        float _679 = _619 * _677;
        _641 = _679;
    }
    float _681 = _641;
    float _683 = 0.0 + _681;
    float _685 = precise::clamp(_683, 0.0, 1.0);
    out.m_52.x = _635;
    out.m_52.y = _633;
    out.m_52.z = _637;
    out.m_52.w = _685;
    return out;
}

