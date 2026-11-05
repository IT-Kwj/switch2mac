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
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_47 [[user(locn0)]];
    float4 m_39 [[user(locn1), flat]];
    float4 m_37 [[user(locn2)]];
    float4 m_56 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_52 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _686 = float2(_79, _81);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_686, float2(0.0), isnan(_686))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_686, float2(0.0), isnan(_686))).xy;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = in.m_39.y;
    float _93 = in.m_41.y;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_37.z;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_37.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = _91 * (-0.2599999904632568359375);
    float _113 = _77 * _97;
    float _115 = _91 * (-0.319999992847442626953125);
    float _117 = fma(_113, 17.0, _111);
    float _119 = fma(_113, 21.0, _115);
    float _121 = -_113;
    float _123 = _121 + 1.0;
    float _125 = _117 * 0.15915493667125701904296875;
    float _127 = _119 * 0.15915493667125701904296875;
    float _129 = _125 * 6.283185482025146484375;
    float _131 = sin(_129);
    float _133 = _127 * 6.283185482025146484375;
    float _135 = sin(_133);
    float _137 = _131 + _135;
    float _139 = _77 * _103;
    float _141 = _77 * _109;
    float _143 = _137 * _123;
    float _145 = fma(_87, (*spvDescriptorSet0.fp_c9)._m0[194].w, _139);
    float _147 = fma(_89, (*spvDescriptorSet0.fp_c9)._m0[194].w, _141);
    float _149 = fma(_143, 0.0040000001899898052215576171875, _145);
    float2 _789 = float2(_149, _147);
    float _151 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_789, float2(0.0), isnan(_789))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_789, float2(0.0), isnan(_789))).w;
    float _153 = in.m_43.y;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_43.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = _77 * _157;
    float _167 = fma(_151, 2.0, -1.0);
    float _169 = _123 * _167;
    float _171 = _77 * _163;
    float _173 = fma(_169, 0.0500000007450580596923828125, _165);
    float2 _828 = float2(_171, _173);
    float2 _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_828, float2(0.0), isnan(_828))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_828, float2(0.0), isnan(_828))).xw;
    float _177 = _175.x;
    float _179 = _175.y;
    float _181 = in.m_45.x;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = _77 * _185;
    float _189 = _113 + (-0.20000000298023223876953125);
    float _191 = _189 * _189;
    float _193 = in.m_47.w;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = 0.0 + _179;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = _201 * _187;
    bool _207 = _203 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _209 = isnan(_203);
    bool _211 = _207 || _209;
    bool _213 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _215 = _211 || _213;
    float _217 = in.m_41.x;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    if (!_215)
    {
        discard_fragment();
    }
    float _223 = _77 * _221;
    float _225 = _223 + (-0.5);
    float _227 = fma(_225, _225, _191);
    float _229 = sqrt(_227);
    float _231 = precise::max(_229, 0.119999997317790985107421875);
    float _233 = precise::min(_231, 0.60000002384185791015625);
    float _235 = fma(_233, 2.0833332538604736328125, -0.24999998509883880615234375);
    float _237 = fma(_233, -2.0833332538604736328125, 1.25);
    float _239 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _241 = (*spvDescriptorSet0.fp_c9)._m0[108].w + _239;
    float _243 = _151 * _237;
    float _245 = 1.0 / _241;
    float _247 = precise::max(_243, 0.300000011920928955078125);
    float _249 = precise::min(_247, 0.5);
    float _251 = -_177;
    float _253 = fma(_251, _177, 1.0);
    float _255 = fma(_249, 5.000000476837158203125, -1.5000002384185791015625);
    float _257 = -_253;
    float _259 = fma(_257, _235, 1.0);
    float _261 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _263 = _261 + (*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _265 = fma(_151, _259, _255);
    float _267 = _77 * _197;
    float _269 = 1.0 / _263;
    float _271 = fma(_177, _177, _265);
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _277 = (*spvDescriptorSet0.fp_c9)._m0[110].w + _275;
    float _279 = -(*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _281 = (*spvDescriptorSet0.fp_c9)._m0[108].y + _279;
    float _283 = _273 * _267;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = 1.0 / _277;
    float _289 = -(*spvDescriptorSet0.fp_c9)._m0[107].w;
    float _291 = _285 + _289;
    float _293 = _291 * _245;
    float _295 = -(*spvDescriptorSet0.fp_c9)._m0[108].w;
    float _297 = _285 + _295;
    float _299 = -(*spvDescriptorSet0.fp_c9)._m0[107].z;
    float _301 = (*spvDescriptorSet0.fp_c9)._m0[108].z + _299;
    float _303 = _297 * _269;
    float _305 = -(*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _307 = (*spvDescriptorSet0.fp_c9)._m0[108].x + _305;
    float _309 = fma(_281, _293, (*spvDescriptorSet0.fp_c9)._m0[107].y);
    float _311 = -(*spvDescriptorSet0.fp_c9)._m0[109].w;
    float _313 = _285 + _311;
    bool _315 = _285 >= (*spvDescriptorSet0.fp_c9)._m0[110].w;
    bool _317 = isnan(_285);
    bool _319 = _315 || _317;
    bool _321 = isnan((*spvDescriptorSet0.fp_c9)._m0[110].w);
    bool _323 = _319 || _321;
    float _325 = float(_323);
    float _327 = fma(_307, _293, (*spvDescriptorSet0.fp_c9)._m0[107].x);
    float _329 = -(*spvDescriptorSet0.fp_c9)._m0[108].x;
    float _331 = _329 + (*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _333 = fma(_301, _293, (*spvDescriptorSet0.fp_c9)._m0[107].z);
    bool _335 = _285 >= (*spvDescriptorSet0.fp_c9)._m0[108].w;
    bool _337 = isnan(_285);
    bool _339 = _335 || _337;
    bool _341 = isnan((*spvDescriptorSet0.fp_c9)._m0[108].w);
    bool _343 = _339 || _341;
    float _345 = float(_343);
    float _347 = -(*spvDescriptorSet0.fp_c9)._m0[108].y;
    float _349 = _347 + (*spvDescriptorSet0.fp_c9)._m0[109].y;
    bool _351 = _285 >= (*spvDescriptorSet0.fp_c9)._m0[109].w;
    bool _353 = isnan(_285);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.fp_c9)._m0[109].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = _313 * _287;
    float _365 = -(*spvDescriptorSet0.fp_c9)._m0[108].z;
    float _367 = _365 + (*spvDescriptorSet0.fp_c9)._m0[109].z;
    bool _369 = _285 >= (*spvDescriptorSet0.fp_c9)._m0[107].w;
    bool _371 = isnan(_285);
    bool _373 = _369 || _371;
    bool _375 = isnan((*spvDescriptorSet0.fp_c9)._m0[107].w);
    bool _377 = _373 || _375;
    float _379 = float(_377);
    float _381 = -_325;
    float _383 = _381 + 1.0;
    float _385 = -_345;
    float _387 = _385 + 1.0;
    float _389 = -_361;
    float _391 = _389 + 1.0;
    float _393 = fma(_331, _303, (*spvDescriptorSet0.fp_c9)._m0[108].x);
    float _395 = _361 * _383;
    float _397 = _379 * _387;
    float _399 = fma(_349, _303, (*spvDescriptorSet0.fp_c9)._m0[108].y);
    float _401 = fma(_367, _303, (*spvDescriptorSet0.fp_c9)._m0[108].z);
    float _403 = _345 * _391;
    float _405 = _327 * _397;
    float _407 = _309 * _397;
    float _409 = -_379;
    float _411 = _409 + 1.0;
    float _413 = _333 * _397;
    float _415 = -(*spvDescriptorSet0.fp_c9)._m0[109].x;
    float _417 = (*spvDescriptorSet0.fp_c9)._m0[110].x + _415;
    float _419 = -(*spvDescriptorSet0.fp_c9)._m0[109].y;
    float _421 = (*spvDescriptorSet0.fp_c9)._m0[110].y + _419;
    float _423 = fma(_411, (*spvDescriptorSet0.fp_c9)._m0[107].x, _405);
    float _425 = fma(_411, (*spvDescriptorSet0.fp_c9)._m0[107].y, _407);
    float _427 = -(*spvDescriptorSet0.fp_c9)._m0[109].z;
    float _429 = (*spvDescriptorSet0.fp_c9)._m0[110].z + _427;
    float _431 = fma(_411, (*spvDescriptorSet0.fp_c9)._m0[107].z, _413);
    float _433 = fma(_417, _363, (*spvDescriptorSet0.fp_c9)._m0[109].x);
    float _435 = fma(_421, _363, (*spvDescriptorSet0.fp_c9)._m0[109].y);
    float _437 = fma(_393, _403, _423);
    float _439 = fma(_399, _403, _425);
    float _441 = fma(_429, _363, (*spvDescriptorSet0.fp_c9)._m0[109].z);
    float _443 = fma(_401, _403, _431);
    float _445 = fma(_433, _395, _437);
    float _447 = fma(_435, _395, _439);
    float _449 = fma(_441, _395, _443);
    float _451 = fma(_325, (*spvDescriptorSet0.fp_c9)._m0[110].x, _445);
    float _453 = fma(_325, (*spvDescriptorSet0.fp_c9)._m0[110].y, _447);
    float _455 = fma(_325, (*spvDescriptorSet0.fp_c9)._m0[110].z, _449);
    if (!_215)
    {
        out.m_50.x = _451;
        out.m_50.y = _453;
        out.m_50.z = _455;
        out.m_50.w = _179;
        return out;
    }
    float _457 = in.m_52.w;
    float _459 = gl_FragCoord.w;
    float _461 = _457 * _459;
    float _463 = _77 * _461;
    bool _465 = _463 != 1.0;
    bool _467 = isnan(_463);
    bool _469 = _465 || _467;
    bool _471 = isnan(1.0);
    bool _473 = _469 || _471;
    bool _475 = !_473;
    if (!_475)
    {
        float _477 = gl_FragCoord.x;
        float _479 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _481 = _477 / _479;
        float _483 = gl_FragCoord.y;
        float _485 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _487 = _483 / _485;
        float _489 = _463 * 256.0;
        float _491 = trunc(_489);
        int _494 = int(_491);
        uint _497 = uint(int(uint(_494) >> uint(7)));
        int _499 = int(_497) + _494;
        float _501 = trunc(_481);
        int _503 = int(_501);
        float _505 = trunc(_487);
        int _507 = int(_505);
        int _509 = _503 + 2;
        int _511 = _509 >> 1;
        uint _513 = uint(int(uint(_507) >> uint(1)));
        int _515 = _511 ^ int(_513);
        int _517 = _515 << 16;
        int _519 = _517 ^ _511;
        int _521 = 983055 & _519;
        int _523 = _521 << 6;
        int _525 = _523 + _521;
        int _527 = _525 & 13369548;
        uint _529 = uint(int(uint(_527) >> uint(3)));
        int _531 = _527 | int(_529);
        int _533 = _531 & 5570560;
        int _535 = _531 & 85;
        uint _537 = uint(int(uint(_533) >> uint(15)));
        int _539 = int(_537) + _535;
        bool _541 = uint(_499) > uint(_539);
        if (!_541)
        {
            discard_fragment();
        }
        if (!_541)
        {
            out.m_50.x = _451;
            out.m_50.y = _453;
            out.m_50.z = _455;
            out.m_50.w = _203;
            return out;
        }
    }
    float _543 = _453 * 0.715200006961822509765625;
    float _545 = in.m_54.w;
    float _547 = gl_FragCoord.w;
    float _549 = _545 * _547;
    float _551 = in.m_54.z;
    float _553 = gl_FragCoord.w;
    float _555 = _551 * _553;
    float _557 = in.m_54.x;
    float _559 = gl_FragCoord.w;
    float _561 = _557 * _559;
    float _563 = fma(_451, 0.2125999927520751953125, _543);
    float _565 = in.m_54.y;
    float _567 = gl_FragCoord.w;
    float _569 = _565 * _567;
    float _571 = fma(_455, 0.072200000286102294921875, _563);
    bool _573 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _575 = 1.0 / _571;
    float _577 = _575 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _579 = precise::clamp(_577, 0.0, 1.0);
    float _581 = fma(_579, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _583 = _77 * _549;
    float _585 = 0.0 + _203;
    float _587 = precise::clamp(_585, 0.0, 1.0);
    float _589 = _77 * _555;
    float _591 = _77 * _569;
    float _593 = _581 * _583;
    float _595 = _77 * _561;
    float _597 = fma(_455, _593, _589);
    float _599 = fma(_451, _593, _595);
    float _601 = fma(_453, _593, _591);
    float _603 = _589;
    if (!_573)
    {
        _603 = _587;
    }
    float _605 = _603;
    bool _607 = !_573;
    float _609 = _605;
    if (!_607)
    {
        float _611 = in.m_56.w;
        float _613 = gl_FragCoord.w;
        float _615 = _611 * _613;
        float _617 = in.m_56.z;
        float _619 = gl_FragCoord.w;
        float _621 = _617 * _619;
        float _623 = _77 * _615;
        float _625 = _77 * _621;
        float _627 = 1.0 / _623;
        float _629 = _625 * _627;
        float _631 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _633 = fma(_629, (*spvDescriptorSet0.fp_c8)._m0[30].w, _631);
        float _635 = 1.0 / _633;
        float _637 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _639 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _641 = fma(_635, _637, _639);
        float _643 = _641 * 8.0;
        float _645 = precise::clamp(_643, 0.0, 1.0);
        float _647 = _587 * _645;
        _609 = _647;
    }
    float _649 = _609;
    float _651 = 0.0 + _649;
    float _653 = precise::clamp(_651, 0.0, 1.0);
    out.m_50.x = _599;
    out.m_50.y = _601;
    out.m_50.z = _597;
    out.m_50.w = _653;
    return out;
}

