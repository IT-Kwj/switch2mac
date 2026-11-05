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
    constant _16* vp_c9 [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c7 [[id(4)]];
    texture3d<float> vp_t_tcb_32 [[id(5)]];
    sampler vp_t_tcb_32Smplr [[id(6)]];
    texture3d<float> vp_t_tcb_30 [[id(7)]];
    sampler vp_t_tcb_30Smplr [[id(8)]];
    texture2d<float> vp_t_tcb_1C [[id(9)]];
    sampler vp_t_tcb_1CSmplr [[id(10)]];
    sampler vp_t_tcb_32Smplr_w [[id(11)]];
    sampler vp_t_tcb_30Smplr_w [[id(12)]];
    sampler vp_t_tcb_1CSmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_68 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_70 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_72 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(1)]];
    float4 m_49 [[attribute(2)]];
    float4 m_53 [[attribute(3)]];
    float4 m_59 [[attribute(4)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_55 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _921 = false;
    bool _669 = false;
    bool _505 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2402 = as_type<float>(_107);
        out.gl_Position.z = _2402;
    }
    if (!_95)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = 0.0;
    if (_121)
    {
        float _131 = float(_91);
        _101 = _131;
    }
    float _133 = _101;
    bool _135 = _125 >= _133;
    bool _137 = !_121;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _109 = as_type<int>(_145);
    }
    int _147 = _109;
    float _149 = as_type<float>(_147);
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2473 = as_type<float>(_147);
        out.gl_Position.z = _2473;
    }
    if (_139)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    float _157 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = _157;
    if (!_167)
    {
        float _171 = _157 * _157;
        float _173 = _171 * 0.5;
        _149 = _173;
    }
    float _175 = _149;
    float _177 = 0.0;
    float _179 = _175;
    if (!_167)
    {
        float _181 = _125 * _125;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    if (!_167)
    {
        float _187 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _187;
    }
    float _189 = _179;
    bool _191 = !_167;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _157 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _157);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _127 = _213;
        _193 = _223;
        _129 = _211;
    }
    float _225 = _127;
    float _227 = _193;
    float _229 = _129;
    bool _231 = !_167;
    float _233 = _225;
    float _235 = _229;
    if (!_231)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _157 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _233 = _249;
        _235 = _243;
        _169 = _255;
    }
    float _257 = _233;
    float _259 = _235;
    float _261 = _169;
    float _263 = _259;
    float _265 = _257;
    if (!_167)
    {
        _263 = _125;
    }
    float _267 = _263;
    float _269 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _267;
    if (!_167)
    {
        float _273 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _265 = _273;
    }
    float _275 = _265;
    bool _277 = !_167;
    float _279 = _275;
    if (!_277)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = _125 * _283;
        float _293 = 1.0 / _287;
        float _295 = _289 * 0.693147182464599609375;
        float _297 = exp2(_291);
        float _299 = 1.0 / _295;
        float _301 = _297 + (-1.0);
        float _303 = -_301;
        float _305 = fma(_303, _299, _125);
        float _307 = _305 * _293;
        float _309 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _309;
    }
    float _311 = _279;
    bool _313 = !_167;
    if (!_313)
    {
        float _315 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = log2(_315);
        float _319 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _321 = _319 + 1.0;
        float _323 = 1.0 / _321;
        float _325 = _125 * _317;
        float _327 = exp2(_325);
        float _329 = -_327;
        float _331 = _329 + 1.0;
        float _333 = _331 * _323;
        _271 = _333;
    }
    float _335 = _271;
    float _337 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _341 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _345 = fma(_261, _153, _337);
    float _347 = fma(_335, _153, _339);
    float _349 = fma(_261, _151, _269);
    float _351 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _353 = fma(_261, _155, _341);
    float _355 = fma(_335, _151, _343);
    float _357 = -_347;
    float _359 = _345 + _357;
    float _361 = fma(_335, _155, _351);
    float _363 = in.m_49.y;
    float _365 = -_355;
    float _367 = _349 + _365;
    float _369 = _359 * _359;
    float _371 = -_361;
    float _373 = _353 + _371;
    float _375 = in.m_51.y;
    float _377 = fma(_367, _367, _369);
    float _379 = in.m_53.y;
    float _381 = fma(_373, _373, _377);
    float _383 = in.m_51.x;
    float _385 = in.m_49.x;
    float _387 = sqrt(_381);
    float _389 = in.m_53.x;
    float _391 = in.m_51.z;
    float _393 = _359 * _363;
    float _395 = in.m_49.z;
    float _397 = _359 * _375;
    float _399 = in.m_53.z;
    bool _401 = _387 >= 9.9999999747524270787835121154785e-07;
    bool _403 = isnan(_387);
    bool _405 = _401 || _403;
    bool _407 = isnan(9.9999999747524270787835121154785e-07);
    bool _409 = _405 || _407;
    float _411 = _359 * _379;
    float _413 = _363 * _363;
    float _415 = in.m_55.w;
    float _417 = fma(_367, _383, _397);
    float _419 = fma(_375, _375, _413);
    float _421 = in.m_42.x;
    float _423 = in.m_42.y;
    float _425 = in.m_42.z;
    float _427 = fma(_367, _385, _393);
    float _429 = fma(_379, _379, _419);
    float _431 = fma(_367, _389, _411);
    float _433 = fma(_373, _391, _417);
    float _435 = fma(_373, _395, _427);
    float _437 = _427;
    float _439 = _431;
    float _441 = _415;
    if (_409)
    {
        _437 = _433;
    }
    float _443 = _437;
    float _445 = fma(_373, _399, _431);
    float _447 = _443;
    float _449 = _445;
    float _451 = _443;
    float _453 = _445;
    if (_409)
    {
        _439 = _435;
    }
    float _455 = _439;
    float _457 = fma(_349, _415, _421);
    float _459 = fma(_345, _415, _423);
    float _461 = fma(_353, _415, _425);
    float _463 = _455;
    float _465 = _455;
    if (!_409)
    {
        bool _467 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _469 = !_467;
        if (!_469)
        {
            float _471 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _473 = _375 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _475 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _477 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[16].x, _471);
            float _479 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[16].x, _473);
            float _481 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[16].x, _475);
            float _483 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].z, _477);
            float _485 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[16].z, _479);
            float _487 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[16].z, _481);
            float _489 = _483 * _483;
            float _491 = fma(_485, _485, _489);
            float _493 = fma(_487, _487, _491);
            float _495 = rsqrt(_493);
            float _497 = _495 * 9.9999999747524270787835121154785e-07;
            float _499 = _485 * _497;
            float _501 = _483 * _497;
            float _503 = _487 * _497;
            _465 = _501;
            _451 = _499;
            _453 = _503;
            _505 = true;
        }
        else
        {
            float _507 = _153 * _153;
            float _509 = fma(_151, _151, _507);
            float _511 = fma(_155, _155, _509);
            float _513 = sqrt(_511);
            bool _515 = _513 >= 9.9999999747524270787835121154785e-07;
            bool _517 = isnan(_513);
            bool _519 = _515 || _517;
            bool _521 = isnan(9.9999999747524270787835121154785e-07);
            bool _523 = _519 || _521;
            if (!_523)
            {
                float _525 = _423 * _423;
                float _527 = fma(_421, _421, _525);
                float _529 = fma(_425, _425, _527);
                float _531 = sqrt(_529);
                bool _533 = _531 >= 9.9999999747524270787835121154785e-07;
                bool _535 = isnan(_531);
                bool _537 = _533 || _535;
                bool _539 = isnan(9.9999999747524270787835121154785e-07);
                bool _541 = _537 || _539;
                float _543 = _429;
                if (!_541)
                {
                    float _545 = rsqrt(_429);
                    _543 = _545;
                }
                float _547 = _543;
                if (!_541)
                {
                    float _549 = _547 * 9.9999999747524270787835121154785e-07;
                    _441 = _549;
                }
                float _551 = _441;
                if (!_541)
                {
                    float _553 = _375 * _551;
                    _447 = _553;
                }
                float _555 = _447;
                _451 = _555;
                if (!_541)
                {
                    float _557 = _363 * _551;
                    _463 = _557;
                }
                float _559 = _463;
                _465 = _559;
                if (!_541)
                {
                    float _561 = _379 * _551;
                    _449 = _561;
                }
                float _563 = _449;
                bool _565 = !_541;
                _453 = _563;
                _505 = _565;
                if (!_505)
                {
                    float _567 = _363 * _423;
                    float _569 = _375 * _423;
                    float _571 = _379 * _423;
                    float _573 = fma(_421, _385, _567);
                    float _575 = fma(_421, _383, _569);
                    float _577 = fma(_421, _389, _571);
                    float _579 = fma(_425, _395, _573);
                    float _581 = fma(_425, _391, _575);
                    float _583 = fma(_425, _399, _577);
                    float _585 = _579 * _579;
                    float _587 = fma(_581, _581, _585);
                    float _589 = fma(_583, _583, _587);
                    float _591 = rsqrt(_589);
                    float _593 = _591 * 9.9999999747524270787835121154785e-07;
                    float _595 = _581 * _593;
                    float _597 = _579 * _593;
                    float _599 = _583 * _593;
                    _465 = _597;
                    _451 = _595;
                    _453 = _599;
                    _505 = true;
                }
            }
            else
            {
                float _601 = _363 * _153;
                float _603 = _375 * _153;
                float _605 = _379 * _153;
                float _607 = fma(_151, _385, _601);
                float _609 = fma(_151, _383, _603);
                float _611 = fma(_151, _389, _605);
                float _613 = fma(_155, _395, _607);
                float _615 = fma(_155, _391, _609);
                float _617 = fma(_155, _399, _611);
                float _619 = _613 * _613;
                float _621 = fma(_615, _615, _619);
                float _623 = fma(_617, _617, _621);
                float _625 = rsqrt(_623);
                float _627 = _625 * 9.9999999747524270787835121154785e-07;
                float _629 = _615 * _627;
                float _631 = _613 * _627;
                float _633 = _617 * _627;
                _465 = _631;
                _451 = _629;
                _453 = _633;
            }
        }
    }
    _505 = false;
    float _635 = _465;
    float _637 = _451;
    float _639 = _453;
    bool _641 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _643 = !_641;
    float _645 = _635;
    float _647 = _637;
    float _649 = _639;
    float _667;
    if (!_643)
    {
        float _651 = in.m_57.x;
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _655 = _651 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _659 = _657 * _653;
        float _661 = floor(_659);
        float _663 = -_661;
        float _665 = _659 + _663;
        _667 = _665;
        _669 = true;
    }
    else
    {
        float _671 = float(_91);
        float _673 = 1.0 / _671;
        float _675 = _125 * _673;
        _667 = _675;
    }
    _669 = false;
    float _677 = _667;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _681 = _677 + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _685 = _677 + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _689 = _677 + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _699;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _707 = in.m_57.x;
    bool _709 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _711 = isnan(_677);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = 1.0 / _693;
    bool _723 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _725 = isnan(_677);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _737 = 1.0 / _697;
    bool _739 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _741 = 1.0 / _705;
    float _743 = _681 * _721;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _747 = _677 + _745;
    bool _749 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _751 = isnan(_677);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _735 * _707;
    float _763 = 1.0 / _701;
    float _765 = _747 * _737;
    float _767 = _685 * _741;
    bool _769 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _771 = isnan(_677);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = -_759;
    float _783 = _781 + 1.0;
    float _785 = trunc(_761);
    int _787 = int(_785);
    float _789 = _779 * _783;
    float _791 = -_779;
    float _793 = _791 + 1.0;
    float _795 = _689 * _763;
    bool _797 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _799 = isnan(_677);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = -_807;
    float _811 = _809 + 1.0;
    float _813 = _807 * _793;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _823 = _719 * _811;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _825;
    float _829 = -_719;
    float _831 = _829 + 1.0;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _837 = fma(_817, _743, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _839 = fma(_827, _743, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _841 = _733 * _831;
    float _843 = fma(_821, _765, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _845 = fma(_835, _765, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _847 = _837 * _841;
    float _849 = _839 * _841;
    float _851 = -_733;
    float _853 = _851 + 1.0;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _855;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _859;
    float _863 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].x, _847);
    float _865 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].y, _849);
    float _867 = fma(_857, _795, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _869 = fma(_861, _795, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _871 = fma(_843, _823, _863);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _881 = fma(_845, _823, _865);
    float _883 = fma(_867, _813, _871);
    float _885 = fma(_875, _767, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _887 = fma(_879, _767, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _889 = fma(_869, _813, _881);
    float _891 = fma(_885, _789, _883);
    float _893 = fma(_887, _789, _889);
    float _895 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[147].x, _891);
    int _897 = _787 << 4;
    int _899 = _897 + 1712;
    float _901 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[147].y, _893);
    bool _903 = !_739;
    float _919;
    if (!_903)
    {
        float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _907 = _707 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _909 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _911 = _909 * _905;
        float _913 = floor(_911);
        float _915 = -_913;
        float _917 = _911 + _915;
        _919 = _917;
        _921 = true;
    }
    else
    {
        float _923 = float(_91);
        float _925 = 1.0 / _923;
        float _927 = _125 * _925;
        _919 = _927;
    }
    _921 = false;
    float _929 = _919;
    float _931 = in.m_57.z;
    float _933 = _707 * 2.0;
    float _935 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _937 = log2(_935);
    float _939 = in.m_57.y;
    float _941 = _635 * _635;
    float _943 = floor(_933);
    float _945 = fma(_637, _637, _941);
    float _947 = _931 * 2.0;
    bool _949 = _943 >= 0.0;
    bool _951 = isnan(_943);
    bool _953 = _949 || _951;
    bool _955 = isnan(0.0);
    bool _957 = _953 || _955;
    float _959 = _939 * 2.0;
    float _961 = _939 + _931;
    float _963 = floor(_947);
    float _965 = _961 + (-1.0);
    float _967 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _969 = floor(_959);
    int _971 = _957 ? 0 : 1;
    int _973 = ~_971;
    int _975 = _973 + 1;
    int _977 = _975 + 1;
    bool _979 = _963 >= 0.0;
    bool _981 = isnan(_963);
    bool _983 = _979 || _981;
    bool _985 = isnan(0.0);
    bool _987 = _983 || _985;
    float _989 = _125 * _937;
    bool _991 = _963 > 0.0;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _995 = 1.0 + _993;
    int _997 = _987 ? 0 : 1;
    bool _999 = _943 > 0.0;
    float _1001 = 1.0 / _995;
    int _1003 = ~_997;
    int _1005 = _1003 + 1;
    int _1007 = _1005 + 1;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1019 = _1017 != 0;
    bool _1021 = _969 >= 0.0;
    bool _1023 = isnan(_969);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan(0.0);
    bool _1029 = _1025 || _1027;
    int _1031 = _1007;
    int _1033 = _977;
    if (!_991)
    {
        int _1035 = ~_997;
        int _1037 = _1035 + 1;
        _1031 = _1037;
    }
    int _1039 = _1031;
    float _1041 = exp2(_989);
    bool _1043 = !_1015;
    int _1045 = _1043 ? 0 : 1;
    if (!_999)
    {
        int _1047 = ~_971;
        int _1049 = _1047 + 1;
        _1033 = _1049;
    }
    int _1051 = _1033;
    float _1053 = in.m_59.x;
    float _1055 = in.m_59.y;
    float _1057 = in.m_59.z;
    bool _1059 = _969 > 0.0;
    float _1061 = fma(_639, _639, _945);
    int _1063 = abs(_1045);
    float _1065 = _707 + _939;
    float _1067 = float(_1051);
    float _1069 = rsqrt(_1061);
    float _1071 = float(_1063);
    float _1073 = _1065 + (-1.0);
    bool _1075 = !_1011;
    int _1077 = _1075 ? 0 : 1;
    float _1079 = -_1041;
    float _1081 = _1079 + 1.0;
    float _1083 = _1071 * _1067;
    int _1085 = abs(_1077);
    bool _1087 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1089 = isnan(0.0);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1095 = _1091 || _1093;
    float _1097 = _1083 * (-2.0);
    float _1099 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1101 = _1095 ? _1081 : 0.0;
    float _1103 = fma(_967, _1097, _967);
    float _1105 = float(_1085);
    float _1107 = _1069 * _639;
    float _1109 = float(_1039);
    float _1111 = fma(_1097, _1055, _1055);
    float _1113 = _939 + (-0.5);
    float _1115 = _1101 * _1001;
    bool _1117 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1119 = isnan(1.0);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1125 = _1121 || _1123;
    float _1127 = _1105 * _1109;
    float _1129 = _1069 * _637;
    float _1131 = _1069 * _635;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1135 = _1107 * _1133;
    float _1137 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1111);
    bool _1139 = !_1019;
    int _1141 = _1139 ? 0 : 1;
    float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1145 = _1131 * _1143;
    bool _1147 = !_1125;
    float _1149 = _1147 ? _125 : _1115;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1153 = -_1135;
    float _1155 = fma(_1129, _1151, _1153);
    int _1157 = _1029 ? 0 : 1;
    float _1159 = _1127 * (-2.0);
    int _1161 = abs(_1141);
    float _1163 = fma(_1149, _1103, _1137);
    int _1165 = ~_1157;
    int _1167 = _1165 + 1;
    int _1169 = _1167 + 1;
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1173 = _1129 * _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1177 = -_1145;
    float _1179 = fma(_1107, _1175, _1177);
    float _1181 = _1155 * _1155;
    float _1183 = fma(_1099, _1159, _1099);
    int _1185 = _1169;
    float _1187 = _1061;
    if (!_1059)
    {
        int _1189 = ~_1157;
        int _1191 = _1189 + 1;
        _1185 = _1191;
    }
    int _1193 = _1185;
    float _1195 = fma(_1159, _1053, _1053);
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1199 = -_1173;
    float _1201 = fma(_1131, _1197, _1199);
    float _1203 = fma(_1179, _1179, _1181);
    float _1205 = _707 + (-0.5);
    float _1207 = float(_1161);
    float _1209 = as_type<float>(int(gl_VertexIndex));
    float _1211 = float(_1193);
    float _1213 = fma(_1201, _1201, _1203);
    float _1215 = _1163 * 0.15915493667125701904296875;
    float _1217 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1195);
    bool _1219 = _707 > 0.5;
    float _1221 = in.m_55.x;
    float _1223 = in.m_55.y;
    float _1225 = _1207 * _1211;
    float _1227 = _707 + _931;
    float _1229 = fma(_1149, _1183, _1217);
    float _1231 = _1225 * (-2.0);
    float _1233 = _1227 + (-1.0);
    float _1235 = _931 + (-0.5);
    float _1237 = _1229 * 0.15915493667125701904296875;
    float _1239 = fma(_1231, _1057, _1057);
    float _1241 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1243 = rsqrt(_1213);
    float _1245 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1239);
    float _1247 = fma(_1241, _1231, _1241);
    float _1249 = _459 * _375;
    float _1251 = in.m_49.w;
    float _1253 = fma(_1149, _1247, _1245);
    int _1255 = as_type<int>(_1209) & 1;
    bool _1257 = _1255 != 0;
    int _1259 = as_type<int>(_1209) & 2;
    bool _1261 = _1259 != 0;
    float _1263 = _1215 * 6.283185482025146484375;
    float _1265 = sin(_1263);
    bool _1267 = _939 > 0.5;
    float _1269 = _1253 * 0.15915493667125701904296875;
    float _1271 = _459 * _363;
    float _1273 = _901 * _1223;
    float _1275 = _459 * _379;
    float _1277 = fma(_457, _383, _1249);
    float _1279 = fma(_457, _385, _1271);
    float _1281 = _1215 * 6.283185482025146484375;
    float _1283 = cos(_1281);
    int _1285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1287 = _1285 != 0;
    float _1289 = _895 * _1221;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1293 = _1291 != 0;
    float _1295 = _1179 * _1243;
    float _1297 = _1155 * _1243;
    float _1299 = _1201 * _1243;
    float _1301 = _1237 * 6.283185482025146484375;
    float _1303 = cos(_1301);
    bool _1305 = !_1261;
    float _1307 = _1305 ? (-0.5) : 0.5;
    float _1309 = fma(_461, _391, _1277);
    float _1311 = fma(_461, _395, _1279);
    bool _1313 = !_1257;
    float _1315 = _1313 ? (-0.5) : 0.5;
    float _1317 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1319 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1307);
    float _1321 = _1311 + _1251;
    float _1323 = _1237 * 6.283185482025146484375;
    float _1325 = sin(_1323);
    float _1327 = _1269 * 6.283185482025146484375;
    float _1329 = cos(_1327);
    float _1331 = fma(_457, _389, _1275);
    float _1333 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1335 = _1303 * _1283;
    float _1337 = _1303 * _1265;
    float _1339 = fma(_461, _399, _1331);
    float _1341 = _1333 * _1319;
    float _1343 = _1129 * _1297;
    float _1345 = _1269 * 6.283185482025146484375;
    float _1347 = sin(_1345);
    float _1349 = _1325 * _1265;
    float _1351 = _1325 * _1283;
    float _1353 = _1303 * _1329;
    float _1355 = _1325 * _1329;
    float _1357 = _1283 * _1329;
    float _1359 = _1265 * _1329;
    float _1361 = _1353 * _1107;
    float _1363 = in.m_53.w;
    float _1365 = fma(_1347, _1335, _1349);
    float _1367 = fma(_1347, _1349, _1335);
    float _1369 = -_1337;
    float _1371 = fma(_1347, _1351, _1369);
    float _1373 = -_1351;
    float _1375 = fma(_1347, _1337, _1373);
    float _1377 = -_1343;
    float _1379 = fma(_1131, _1295, _1377);
    float _1381 = _1365 * _1107;
    float _1383 = -_1347;
    float _1385 = fma(_1383, _1299, _1361);
    float _1387 = _1375 * _1107;
    float _1389 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1315);
    float _1391 = fma(_1357, _1299, _1381);
    float _1393 = fma(_1355, _1379, _1385);
    float _1395 = fma(_1359, _1299, _1387);
    float _1397 = _1317 * _1389;
    float _1399 = fma(_1371, _1379, _1391);
    float _1401 = _1341 * _1393;
    float _1403 = fma(_1367, _1379, _1395);
    float _1405 = in.m_51.w;
    float _1407 = fma(_1397, _1399, _1401);
    float _1409 = _1131 * _1299;
    float _1411 = _1353 * _1129;
    float _1413 = _1375 * _1129;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1417 = _1415 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1419 = -_1409;
    float _1421 = fma(_1107, _1297, _1419);
    float _1423 = _1365 * _1129;
    float _1425 = -_1347;
    float _1427 = fma(_1425, _1295, _1411);
    float _1429 = _1339 + _1363;
    float _1431 = _1353 * _1131;
    float _1433 = 1.0 / _1417;
    float _1435 = fma(_1357, _1295, _1423);
    float _1437 = fma(_1355, _1421, _1427);
    float _1439 = fma(_1359, _1295, _1413);
    float _1441 = fma(_1371, _1421, _1435);
    float _1443 = _1341 * _1437;
    float _1445 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1447 = fma(_1367, _1421, _1439);
    float _1449 = -_1347;
    float _1451 = fma(_1449, _1297, _1431);
    float _1453 = fma(_1397, _1441, _1443);
    float _1455 = fma(_1445, _1403, _1407);
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1457;
    float _1461 = _1309 + _1405;
    float _1463 = fma(_1445, _1447, _1453);
    float _1465 = _1429 + _1455;
    float _1467 = _1459 * _1433;
    float _1469 = _1365 * _1131;
    float _1471 = _1461 + _1463;
    float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1475 = _1465 + _1473;
    float _1477 = _1375 * _1131;
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1481 = _929 + _1479;
    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1485 = _1471 + _1483;
    float _1487 = _1475 * _1475;
    bool _1489 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1491 = isnan(_929);
    bool _1493 = _1489 || _1491;
    bool _1495 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1497 = _1493 || _1495;
    float _1499 = float(_1497);
    float _1501 = fma(_1357, _1297, _1469);
    int _1503 = _899 + 8;
    uint _1506 = uint(int(uint(_1503) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[int(_1508)][_1510];
    float _1514 = fma(_1485, _1485, _1487);
    float _1516 = _1107 * _1295;
    float _1518 = fma(_1467, _1481, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1520 = fma(_1359, _1297, _1477);
    float _1522 = sqrt(_1514);
    float _1524 = -_1516;
    float _1526 = fma(_1129, _1299, _1524);
    bool _1528 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1530 = isnan(_929);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    uint _1540 = uint(int(uint(_899) >> uint(2)));
    uint _1542 = uint(int(uint(int(_1540)) >> uint(2)));
    int _1544 = int(_1540) & 3;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[int(_1542)][_1544];
    int _1548 = int(_1540) + 1;
    uint _1550 = uint(int(uint(_1548) >> uint(2)));
    int _1552 = _1548 & 3;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[int(_1550)][_1552];
    float _1556 = -_1315;
    int _1558 = _1219 ? as_type<int>(_1556) : as_type<int>(_1315);
    float _1560 = fma(_1355, _1526, _1451);
    float _1562 = fma(_1371, _1526, _1501);
    float _1564 = -_1538;
    float _1566 = _1564 + 1.0;
    float _1568 = fma(_1367, _1526, _1520);
    float _1570 = _1341 * _1560;
    bool _1572 = !_1287;
    float _1574 = _1572 ? _1315 : as_type<float>(_1558);
    float _1576 = _1499 * _1566;
    float _1578 = fma(_1397, _1562, _1570);
    float _1580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1582 = _1518 * _1576;
    bool _1584 = _1522 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1586 = -_1499;
    float _1588 = _1586 + 1.0;
    float _1590 = fma(_1445, _1568, _1578);
    float _1592 = -_1307;
    int _1594 = _1267 ? as_type<int>(_1592) : as_type<int>(_1307);
    float _1596 = _1574 + 0.5;
    float _1598 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1582);
    float _1600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1602 = _1321 + _1590;
    bool _1604 = !_1293;
    float _1606 = _1604 ? _1307 : as_type<float>(_1594);
    float _1608 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1598);
    float _1610 = _1451;
    float _1612 = _1471;
    float _1614 = _1465;
    if (!_1584)
    {
        _1610 = _1602;
    }
    float _1616 = _1610;
    bool _1618 = !_1584;
    float _1620 = _1616;
    if (!_1618)
    {
        float _1622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1626 = _1522 + _1624;
        float _1628 = rsqrt(_1514);
        float _1630 = _1626 * _1622;
        float _1632 = _1602 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1634 = _1630 * 0.15915493667125701904296875;
        float _1636 = _1634 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = _1634 * 6.283185482025146484375;
        float _1642 = cos(_1640);
        float _1644 = fma(_1638, _1632, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1646 = _1628 * _1644;
        float _1648 = _1642 + (-1.0);
        float _1650 = fma(_1485, _1646, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1652 = fma(_1475, _1646, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1654 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1656 = fma(_1602, _1642, _1654);
        _1620 = _1656;
        _1612 = _1650;
        _1614 = _1652;
    }
    float _1658 = _1620;
    float _1660 = _1612;
    float _1662 = _1614;
    float _1664 = -_1321;
    float _1666 = _1664 + _1658;
    float _1668 = -_1606;
    float _1670 = _1668 + 0.5;
    float _1672 = -_1461;
    float _1674 = _1672 + _1660;
    float _1676 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1678 = _1666 * _1666;
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1682 = -_1429;
    float _1684 = _1682 + _1662;
    float _1686 = _1676 * _1580;
    float _1688 = fma(_1674, _1674, _1678);
    float _1690 = _1680 * _1600;
    float _1692 = _1546 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1694 = fma(_1684, _1684, _1688);
    float _1696 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1698 = sqrt(_1694);
    float _1700 = _1512 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1708 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1710 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1716 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1718 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1720 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1722 = _1608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _1686;
    out.m_64.y = _1690;
    bool _1724 = _1698 > 0.0;
    out.m_66.x = _1712;
    out.m_66.y = _1716;
    out.m_66.z = _1718;
    out.m_66.w = _1714;
    out.m_68.x = _1708;
    out.m_68.y = _1710;
    out.m_68.z = _1720;
    out.m_68.w = _1722;
    bool _1726 = !_1724;
    float _1728 = _1710;
    float _1730 = _1714;
    float _1732 = _1712;
    float _1734 = _1658;
    float _1736 = _1660;
    float _1738 = _1662;
    float _1740 = _1716;
    float _1742 = _1712;
    if (!_1726)
    {
        bool _1744 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1746 = _1716;
        if (_1744)
        {
            float _1748 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1746 = _1748;
        }
        float _1750 = _1746;
        float _1752 = _1750;
        if (_1744)
        {
            float _1754 = _1750 * _637;
            _1728 = _1754;
        }
        float _1756 = _1728;
        float _1758 = _1756;
        if (_1744)
        {
            float _1760 = _1750 * _635;
            _1730 = _1760;
        }
        float _1762 = _1730;
        float _1764 = _1762;
        if (_1744)
        {
            float _1766 = _1750 * _639;
            _1752 = _1766;
        }
        float _1768 = _1752;
        float _1770 = _1768;
        if (!_1744)
        {
            float _1772 = _125 + 1.0;
            float _1774 = _1772;
            if (!_167)
            {
                float _1776 = _1772 * _1772;
                float _1778 = _1776 * 0.5;
                _1732 = _1778;
            }
            float _1780 = _1732;
            float _1782 = _1780;
            if (!_167)
            {
                float _1784 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1782 = _1784;
            }
            float _1786 = _1782;
            bool _1788 = !_167;
            float _1790 = _1786;
            if (!_1788)
            {
                float _1792 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1794 = log2(_1792);
                float _1796 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1798 = _1794 * _1772;
                float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1802 = 1.0 + _1800;
                float _1804 = 1.0 / _1802;
                float _1806 = _1796 * 0.693147182464599609375;
                float _1808 = exp2(_1798);
                float _1810 = 1.0 / _1806;
                float _1812 = _1808 + (-1.0);
                float _1814 = -_1812;
                float _1816 = fma(_1814, _1810, _1772);
                float _1818 = _1816 * _1804;
                float _1820 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1790 = _1820;
            }
            float _1822 = _1790;
            float _1824 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1826 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1828 = !_167;
            if (!_1828)
            {
                float _1830 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1832 = log2(_1830);
                float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1836 = 1.0 + _1834;
                float _1838 = 1.0 / _1836;
                float _1840 = _1832 * _1772;
                float _1842 = exp2(_1840);
                float _1844 = -_1842;
                float _1846 = _1844 + 1.0;
                float _1848 = _1846 * _1838;
                _1774 = _1848;
            }
            float _1850 = _1774;
            float _1852 = fma(_1850, _153, _1826);
            float _1854 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1856 = fma(_1850, _151, _1824);
            float _1858 = -_347;
            float _1860 = _1858 + _1852;
            float _1862 = fma(_1850, _155, _1854);
            float _1864 = -_355;
            float _1866 = _1864 + _1856;
            float _1868 = _1860 * _363;
            float _1870 = -_361;
            float _1872 = _1870 + _1862;
            float _1874 = _1860 * _375;
            float _1876 = _1860 * _379;
            float _1878 = fma(_1866, _385, _1868);
            float _1880 = fma(_1866, _383, _1874);
            float _1882 = fma(_1866, _389, _1876);
            float _1884 = fma(_1872, _395, _1878);
            float _1886 = fma(_1872, _391, _1880);
            float _1888 = fma(_1872, _399, _1882);
            float _1890 = _1884 * _1884;
            float _1892 = fma(_1886, _1886, _1890);
            float _1894 = fma(_1888, _1888, _1892);
            _1187 = _1894;
            _645 = _1884;
            _647 = _1886;
            _649 = _1888;
            _1758 = _1886;
            _1764 = _1884;
            _1770 = _1888;
        }
        float _1896 = _1187;
        float _1898 = _645;
        float _1900 = _647;
        float _1902 = _649;
        float _1904 = _1758;
        float _1906 = _1764;
        float _1908 = _1770;
        float _1910 = sqrt(_1896);
        float _1912 = rsqrt(_1694);
        bool _1914 = _1910 > 0.0;
        float _1916 = _1674 * _1912;
        float _1918 = _1666 * _1912;
        float _1920 = _1684 * _1912;
        bool _1922 = !_1914;
        _1740 = _1908;
        _1742 = _1916;
        if (!_1922)
        {
            float _1924 = rsqrt(_1896);
            float _1926 = _1924 * _1898;
            float _1928 = _1924 * _1900;
            float _1930 = _1924 * _1902;
            float _1932 = _1918 * _1926;
            float _1934 = fma(_1916, _1928, _1932);
            float _1936 = fma(_1920, _1930, _1934);
            float _1938 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1940 = fma(_1904, _1938, _1660);
            float _1942 = fma(_1906, _1938, _1658);
            float _1944 = fma(_1908, _1938, _1662);
            _1734 = _1942;
            _1736 = _1940;
            _1738 = _1944;
        }
    }
    float _1946 = _1734;
    float _1948 = _1736;
    float _1950 = _1738;
    float _1952 = _1740;
    float _1954 = _1742;
    float _1956 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1958 = _1946 + _1956;
    float _1960 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1962 = _1948 + _1960;
    float _1964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1966 = _1950 + _1964;
    float _1968 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1970 = _1958 * _1958;
    float _1972 = fma(_1962, _1962, _1970);
    float _1974 = fma(_1966, _1966, _1972);
    float _1976 = rsqrt(_1974);
    float _1978 = sqrt(_1974);
    float _1980 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1982 = _1962 * _1980;
    float _1984 = _1966 * _1980;
    float _1986 = _1982 * _1982;
    float _1988 = _1984 * _1984;
    float _1990 = _1986 + _1988;
    float _1992 = sqrt(_1990);
    bool _1994 = _1992 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1998 = _1992 + _1996;
    float _2000 = _1976;
    float _2002 = _1998;
    float _2004 = _1952;
    float _2006 = _1958;
    float _2008 = _1980;
    if (_1994)
    {
        float _2010 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2000 = _2010;
    }
    float _2012 = _2000;
    float _2014 = _2012;
    if (_1994)
    {
        float _2016 = _1998 * _2012;
        _2002 = _2016;
    }
    float _2018 = _2002;
    if (_1994)
    {
        float _2020 = rsqrt(_1990);
        _2014 = _2020;
    }
    float _2022 = _2014;
    float _2024 = _2022;
    if (_1994)
    {
        float _2026 = _2018 * 0.15915493667125701904296875;
        _2004 = _2026;
    }
    float _2028 = _2004;
    float _2030 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2032 = _1966;
    float _2034 = _2028;
    if (_1994)
    {
        float _2036 = _2028 * 6.283185482025146484375;
        float _2038 = sin(_2036);
        _2032 = _2038;
    }
    float _2040 = _2032;
    float _2042 = precise::max(0.0, _2030);
    float _2044 = _1954;
    float _2046 = _2042;
    if (_1994)
    {
        float _2048 = _2028 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        _2044 = _2050;
    }
    float _2052 = _2044;
    float _2054 = -_1980;
    float _2056 = -_2042;
    float _2058 = fma(_1958, _2054, _2056);
    if (_1994)
    {
        float _2060 = _2058 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2006 = _2060;
    }
    float _2062 = _2006;
    float _2064 = _2040;
    float _2066 = _2062;
    if (_1994)
    {
        float _2068 = fma(_2040, _2062, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2064 = _2068;
    }
    float _2070 = _2064;
    float _2072 = _2070;
    if (!_1994)
    {
        _2066 = _2058;
    }
    float _2074 = _2066;
    float _2076 = _2074;
    if (_1994)
    {
        float _2078 = _2022 * _2070;
        _2008 = _2078;
    }
    float _2080 = _2008;
    if (!_1994)
    {
        _2024 = _1982;
    }
    float _2082 = _2024;
    float _2084 = _2082;
    float _2086 = _2052;
    if (_1994)
    {
        float _2088 = _2052 + (-1.0);
        _2046 = _2088;
    }
    float _2090 = _2046;
    float _2092 = _2090;
    if (_1994)
    {
        float _2094 = _1982 * _2080;
        _2084 = _2094;
    }
    float _2096 = _2084;
    if (!_1994)
    {
        _2072 = _1986;
    }
    float _2098 = _2072;
    float _2100 = _2098;
    if (_1994)
    {
        float _2102 = _2090 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2034 = _2102;
    }
    float _2104 = _2034;
    if (!_1994)
    {
        _2092 = _1984;
    }
    float _2106 = _2092;
    float _2108 = _2106;
    if (_1994)
    {
        float _2110 = _1984 * _2080;
        _2108 = _2110;
    }
    float _2112 = _2108;
    if (_1994)
    {
        float _2114 = _2096 * _2096;
        _2100 = _2114;
    }
    float _2116 = _2100;
    if (_1994)
    {
        float _2118 = fma(_2058, _2052, _2104);
        _2076 = _2118;
    }
    float _2120 = _2076;
    if (!_1994)
    {
        _2086 = _1988;
    }
    float _2122 = _2086;
    float _2124 = _2122;
    if (_1994)
    {
        float _2126 = _2112 * _2112;
        _2124 = _2126;
    }
    float _2128 = _2124;
    float _2130 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2132 = fma(_2120, _2120, _2116);
    float _2134 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2130);
    float _2136 = _2132 + _2128;
    float _2138 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2142 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2140);
    float _2144 = precise::clamp(_2142, 0.0, 1.0);
    float _2146 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2134);
    float _2148 = rsqrt(_2136);
    float _2150 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2152 = -_2144;
    float _2154 = _2152 + 1.0;
    float _2156 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2138);
    float _2158 = _2146 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2160 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2162 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2150);
    float _2164 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2156);
    float _2166 = abs(_2154);
    float _2168 = log2(_2166);
    float _2170 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2172 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2160);
    float _2174 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2162);
    float _2176 = _2164 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2178 = -_2170;
    float _2180 = fma(_2178, _1968, 1.0);
    float _2182 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2172);
    float _2184 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2186 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2188 = _2148 * _2096;
    float _2190 = _2148 * _2120;
    float _2192 = _2148 * _2112;
    float _2194 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2186);
    float _2196 = _2188 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2198 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2200 = log2(_2180);
    float _2202 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2204 = -_2196;
    float _2206 = fma(_2190, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2204);
    float _2208 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2194);
    float _2210 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2212 = -_2192;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2206);
    float _2216 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2208);
    float _2218 = exp2(_2202);
    float _2220 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2222 = fma(_2214, -0.5, 0.5);
    float _2224 = fma(_2214, 0.5, 0.5);
    float _2226 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2210);
    float _2228 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2220);
    float _2230 = _2190 + 1.0;
    float _2232 = fma(_2224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2234 = 1.0 / _2216;
    float _2236 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2228);
    float _2238 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2226);
    float _2240 = fma(_2224, _2232, -0.212114393711090087890625);
    float _2242 = _2200 * 0.693147182464599609375;
    float _2244 = fma(_2224, _2240, 1.570728778839111328125);
    float _2246 = sqrt(_2222);
    float _2248 = -_2190;
    float _2250 = fma(_2218, _2230, _2248);
    float _2252 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2236);
    float _2254 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2238);
    float _2256 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2258 = _2252 * _2234;
    float _2260 = _2254 * _2234;
    float _2262 = fma(_2258, 0.5, 0.5);
    float _2264 = fma(_2260, -0.5, 0.5);
    float _2266 = fma(_2250, 0.5, 0.5);
    float _2268 = _2246 * 0.636619746685028076171875;
    float3 _5747 = float3(_2262, _2264, _2256);
    float _2270 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5747, float3(0.0), isnan(_5747)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5747, float3(0.0), isnan(_5747)), level(0.0)).x;
    float3 _5758 = float3(_2262, _2264, _2256);
    float4 _2273 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5758, float3(0.0), isnan(_5758)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5758, float3(0.0), isnan(_5758)), level(0.0)).xyzw;
    float _2275 = _2273.x;
    float _2277 = _2273.y;
    float _2279 = _2273.z;
    float _2281 = _2273.w;
    float _2283 = -_2244;
    float _2285 = fma(_2268, _2283, 1.0);
    float2 _5780 = float2(_2285, _2266);
    float3 _2289 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5780, float2(0.0), isnan(_5780)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5780, float2(0.0), isnan(_5780)), level(0.0)).xyz;
    float _2291 = _2289.x;
    float _2293 = _2289.y;
    float _2295 = _2289.z;
    float _2297 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2299 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2301 = _2252 + _2216;
    float _2303 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2297);
    float _2305 = _2301 * 0.5;
    float _2307 = exp2(_2299);
    float _2309 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2303);
    float _2311 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2309);
    float _2313 = _2216 * 0.5;
    float _2315 = _2311 + _2216;
    float _2317 = fma(_2254, -0.5, _2313);
    out.gl_Position.x = _2252;
    out.gl_Position.y = _2254;
    out.gl_Position.z = _2311;
    out.gl_Position.w = _2216;
    float _2319 = _2315 * 0.5;
    float _2321 = -_2307;
    float _2323 = _2321 + 1.0;
    out.m_70.x = _2305;
    out.m_70.y = _2317;
    out.m_70.z = _2319;
    out.m_70.w = _2216;
    float _2325 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2327 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2327;
    float _2329 = _2325 * _2270;
    float _2331 = -_2325;
    float _2333 = _2331 + 1.0;
    float _2335 = _2281 * _2329;
    float _2337 = _2281 * _2333;
    float _2339 = _2295 * _2329;
    float _2341 = fma(_2291, _2335, _2275);
    float _2343 = fma(_2293, _2335, _2277);
    float _2345 = fma(_2281, _2339, _2279);
    out.m_72.x = _2341;
    out.m_72.y = _2343;
    out.m_72.z = _2345;
    out.m_72.w = _2337;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _921 = false;
    bool _669 = false;
    bool _505 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2402 = as_type<float>(_107);
        out.gl_Position.z = _2402;
    }
    if (!_95)
    {
        return out;
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = 0.0;
    if (_121)
    {
        float _131 = float(_91);
        _101 = _131;
    }
    float _133 = _101;
    bool _135 = _125 >= _133;
    bool _137 = !_121;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _109 = as_type<int>(_145);
    }
    int _147 = _109;
    float _149 = as_type<float>(_147);
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2473 = as_type<float>(_147);
        out.gl_Position.z = _2473;
    }
    if (_139)
    {
        return out;
    }
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    float _157 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = _157;
    if (!_167)
    {
        float _171 = _157 * _157;
        float _173 = _171 * 0.5;
        _149 = _173;
    }
    float _175 = _149;
    float _177 = 0.0;
    float _179 = _175;
    if (!_167)
    {
        float _181 = _125 * _125;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    if (!_167)
    {
        float _187 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _187;
    }
    float _189 = _179;
    bool _191 = !_167;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _157 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _157);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _127 = _213;
        _193 = _223;
        _129 = _211;
    }
    float _225 = _127;
    float _227 = _193;
    float _229 = _129;
    bool _231 = !_167;
    float _233 = _225;
    float _235 = _229;
    if (!_231)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _157 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _233 = _249;
        _235 = _243;
        _169 = _255;
    }
    float _257 = _233;
    float _259 = _235;
    float _261 = _169;
    float _263 = _259;
    float _265 = _257;
    if (!_167)
    {
        _263 = _125;
    }
    float _267 = _263;
    float _269 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _267;
    if (!_167)
    {
        float _273 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _265 = _273;
    }
    float _275 = _265;
    bool _277 = !_167;
    float _279 = _275;
    if (!_277)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = _125 * _283;
        float _293 = 1.0 / _287;
        float _295 = _289 * 0.693147182464599609375;
        float _297 = exp2(_291);
        float _299 = 1.0 / _295;
        float _301 = _297 + (-1.0);
        float _303 = -_301;
        float _305 = fma(_303, _299, _125);
        float _307 = _305 * _293;
        float _309 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _309;
    }
    float _311 = _279;
    bool _313 = !_167;
    if (!_313)
    {
        float _315 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = log2(_315);
        float _319 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _321 = _319 + 1.0;
        float _323 = 1.0 / _321;
        float _325 = _125 * _317;
        float _327 = exp2(_325);
        float _329 = -_327;
        float _331 = _329 + 1.0;
        float _333 = _331 * _323;
        _271 = _333;
    }
    float _335 = _271;
    float _337 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _341 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _345 = fma(_261, _153, _337);
    float _347 = fma(_335, _153, _339);
    float _349 = fma(_261, _151, _269);
    float _351 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _353 = fma(_261, _155, _341);
    float _355 = fma(_335, _151, _343);
    float _357 = -_347;
    float _359 = _345 + _357;
    float _361 = fma(_335, _155, _351);
    float _363 = in.m_49.y;
    float _365 = -_355;
    float _367 = _349 + _365;
    float _369 = _359 * _359;
    float _371 = -_361;
    float _373 = _353 + _371;
    float _375 = in.m_51.y;
    float _377 = fma(_367, _367, _369);
    float _379 = in.m_53.y;
    float _381 = fma(_373, _373, _377);
    float _383 = in.m_51.x;
    float _385 = in.m_49.x;
    float _387 = sqrt(_381);
    float _389 = in.m_53.x;
    float _391 = in.m_51.z;
    float _393 = _359 * _363;
    float _395 = in.m_49.z;
    float _397 = _359 * _375;
    float _399 = in.m_53.z;
    bool _401 = _387 >= 9.9999999747524270787835121154785e-07;
    bool _403 = isnan(_387);
    bool _405 = _401 || _403;
    bool _407 = isnan(9.9999999747524270787835121154785e-07);
    bool _409 = _405 || _407;
    float _411 = _359 * _379;
    float _413 = _363 * _363;
    float _415 = in.m_55.w;
    float _417 = fma(_367, _383, _397);
    float _419 = fma(_375, _375, _413);
    float _421 = in.m_42.x;
    float _423 = in.m_42.y;
    float _425 = in.m_42.z;
    float _427 = fma(_367, _385, _393);
    float _429 = fma(_379, _379, _419);
    float _431 = fma(_367, _389, _411);
    float _433 = fma(_373, _391, _417);
    float _435 = fma(_373, _395, _427);
    float _437 = _427;
    float _439 = _431;
    float _441 = _415;
    if (_409)
    {
        _437 = _433;
    }
    float _443 = _437;
    float _445 = fma(_373, _399, _431);
    float _447 = _443;
    float _449 = _445;
    float _451 = _443;
    float _453 = _445;
    if (_409)
    {
        _439 = _435;
    }
    float _455 = _439;
    float _457 = fma(_349, _415, _421);
    float _459 = fma(_345, _415, _423);
    float _461 = fma(_353, _415, _425);
    float _463 = _455;
    float _465 = _455;
    if (!_409)
    {
        bool _467 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _469 = !_467;
        if (!_469)
        {
            float _471 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _473 = _375 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _475 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _477 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[16].x, _471);
            float _479 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[16].x, _473);
            float _481 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[16].x, _475);
            float _483 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].z, _477);
            float _485 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[16].z, _479);
            float _487 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[16].z, _481);
            float _489 = _483 * _483;
            float _491 = fma(_485, _485, _489);
            float _493 = fma(_487, _487, _491);
            float _495 = rsqrt(_493);
            float _497 = _495 * 9.9999999747524270787835121154785e-07;
            float _499 = _485 * _497;
            float _501 = _483 * _497;
            float _503 = _487 * _497;
            _465 = _501;
            _451 = _499;
            _453 = _503;
            _505 = true;
        }
        else
        {
            float _507 = _153 * _153;
            float _509 = fma(_151, _151, _507);
            float _511 = fma(_155, _155, _509);
            float _513 = sqrt(_511);
            bool _515 = _513 >= 9.9999999747524270787835121154785e-07;
            bool _517 = isnan(_513);
            bool _519 = _515 || _517;
            bool _521 = isnan(9.9999999747524270787835121154785e-07);
            bool _523 = _519 || _521;
            if (!_523)
            {
                float _525 = _423 * _423;
                float _527 = fma(_421, _421, _525);
                float _529 = fma(_425, _425, _527);
                float _531 = sqrt(_529);
                bool _533 = _531 >= 9.9999999747524270787835121154785e-07;
                bool _535 = isnan(_531);
                bool _537 = _533 || _535;
                bool _539 = isnan(9.9999999747524270787835121154785e-07);
                bool _541 = _537 || _539;
                float _543 = _429;
                if (!_541)
                {
                    float _545 = rsqrt(_429);
                    _543 = _545;
                }
                float _547 = _543;
                if (!_541)
                {
                    float _549 = _547 * 9.9999999747524270787835121154785e-07;
                    _441 = _549;
                }
                float _551 = _441;
                if (!_541)
                {
                    float _553 = _375 * _551;
                    _447 = _553;
                }
                float _555 = _447;
                _451 = _555;
                if (!_541)
                {
                    float _557 = _363 * _551;
                    _463 = _557;
                }
                float _559 = _463;
                _465 = _559;
                if (!_541)
                {
                    float _561 = _379 * _551;
                    _449 = _561;
                }
                float _563 = _449;
                bool _565 = !_541;
                _453 = _563;
                _505 = _565;
                if (!_505)
                {
                    float _567 = _363 * _423;
                    float _569 = _375 * _423;
                    float _571 = _379 * _423;
                    float _573 = fma(_421, _385, _567);
                    float _575 = fma(_421, _383, _569);
                    float _577 = fma(_421, _389, _571);
                    float _579 = fma(_425, _395, _573);
                    float _581 = fma(_425, _391, _575);
                    float _583 = fma(_425, _399, _577);
                    float _585 = _579 * _579;
                    float _587 = fma(_581, _581, _585);
                    float _589 = fma(_583, _583, _587);
                    float _591 = rsqrt(_589);
                    float _593 = _591 * 9.9999999747524270787835121154785e-07;
                    float _595 = _581 * _593;
                    float _597 = _579 * _593;
                    float _599 = _583 * _593;
                    _465 = _597;
                    _451 = _595;
                    _453 = _599;
                    _505 = true;
                }
            }
            else
            {
                float _601 = _363 * _153;
                float _603 = _375 * _153;
                float _605 = _379 * _153;
                float _607 = fma(_151, _385, _601);
                float _609 = fma(_151, _383, _603);
                float _611 = fma(_151, _389, _605);
                float _613 = fma(_155, _395, _607);
                float _615 = fma(_155, _391, _609);
                float _617 = fma(_155, _399, _611);
                float _619 = _613 * _613;
                float _621 = fma(_615, _615, _619);
                float _623 = fma(_617, _617, _621);
                float _625 = rsqrt(_623);
                float _627 = _625 * 9.9999999747524270787835121154785e-07;
                float _629 = _615 * _627;
                float _631 = _613 * _627;
                float _633 = _617 * _627;
                _465 = _631;
                _451 = _629;
                _453 = _633;
            }
        }
    }
    _505 = false;
    float _635 = _465;
    float _637 = _451;
    float _639 = _453;
    bool _641 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _643 = !_641;
    float _645 = _635;
    float _647 = _637;
    float _649 = _639;
    float _667;
    if (!_643)
    {
        float _651 = in.m_57.x;
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _655 = _651 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _659 = _657 * _653;
        float _661 = floor(_659);
        float _663 = -_661;
        float _665 = _659 + _663;
        _667 = _665;
        _669 = true;
    }
    else
    {
        float _671 = float(_91);
        float _673 = 1.0 / _671;
        float _675 = _125 * _673;
        _667 = _675;
    }
    _669 = false;
    float _677 = _667;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _681 = _677 + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _685 = _677 + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _689 = _677 + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _699;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _707 = in.m_57.x;
    bool _709 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _711 = isnan(_677);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = 1.0 / _693;
    bool _723 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _725 = isnan(_677);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _737 = 1.0 / _697;
    bool _739 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _741 = 1.0 / _705;
    float _743 = _681 * _721;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _747 = _677 + _745;
    bool _749 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _751 = isnan(_677);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _735 * _707;
    float _763 = 1.0 / _701;
    float _765 = _747 * _737;
    float _767 = _685 * _741;
    bool _769 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _771 = isnan(_677);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = -_759;
    float _783 = _781 + 1.0;
    float _785 = trunc(_761);
    int _787 = int(_785);
    float _789 = _779 * _783;
    float _791 = -_779;
    float _793 = _791 + 1.0;
    float _795 = _689 * _763;
    bool _797 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _799 = isnan(_677);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = -_807;
    float _811 = _809 + 1.0;
    float _813 = _807 * _793;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _823 = _719 * _811;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _825;
    float _829 = -_719;
    float _831 = _829 + 1.0;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _837 = fma(_817, _743, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _839 = fma(_827, _743, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _841 = _733 * _831;
    float _843 = fma(_821, _765, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _845 = fma(_835, _765, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _847 = _837 * _841;
    float _849 = _839 * _841;
    float _851 = -_733;
    float _853 = _851 + 1.0;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _855;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _859;
    float _863 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].x, _847);
    float _865 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].y, _849);
    float _867 = fma(_857, _795, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _869 = fma(_861, _795, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _871 = fma(_843, _823, _863);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _881 = fma(_845, _823, _865);
    float _883 = fma(_867, _813, _871);
    float _885 = fma(_875, _767, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _887 = fma(_879, _767, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _889 = fma(_869, _813, _881);
    float _891 = fma(_885, _789, _883);
    float _893 = fma(_887, _789, _889);
    float _895 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[147].x, _891);
    int _897 = _787 << 4;
    int _899 = _897 + 1712;
    float _901 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[147].y, _893);
    bool _903 = !_739;
    float _919;
    if (!_903)
    {
        float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _907 = _707 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _909 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _911 = _909 * _905;
        float _913 = floor(_911);
        float _915 = -_913;
        float _917 = _911 + _915;
        _919 = _917;
        _921 = true;
    }
    else
    {
        float _923 = float(_91);
        float _925 = 1.0 / _923;
        float _927 = _125 * _925;
        _919 = _927;
    }
    _921 = false;
    float _929 = _919;
    float _931 = in.m_57.z;
    float _933 = _707 * 2.0;
    float _935 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _937 = log2(_935);
    float _939 = in.m_57.y;
    float _941 = _635 * _635;
    float _943 = floor(_933);
    float _945 = fma(_637, _637, _941);
    float _947 = _931 * 2.0;
    bool _949 = _943 >= 0.0;
    bool _951 = isnan(_943);
    bool _953 = _949 || _951;
    bool _955 = isnan(0.0);
    bool _957 = _953 || _955;
    float _959 = _939 * 2.0;
    float _961 = _939 + _931;
    float _963 = floor(_947);
    float _965 = _961 + (-1.0);
    float _967 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _969 = floor(_959);
    int _971 = _957 ? 0 : 1;
    int _973 = ~_971;
    int _975 = _973 + 1;
    int _977 = _975 + 1;
    bool _979 = _963 >= 0.0;
    bool _981 = isnan(_963);
    bool _983 = _979 || _981;
    bool _985 = isnan(0.0);
    bool _987 = _983 || _985;
    float _989 = _125 * _937;
    bool _991 = _963 > 0.0;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _995 = 1.0 + _993;
    int _997 = _987 ? 0 : 1;
    bool _999 = _943 > 0.0;
    float _1001 = 1.0 / _995;
    int _1003 = ~_997;
    int _1005 = _1003 + 1;
    int _1007 = _1005 + 1;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1019 = _1017 != 0;
    bool _1021 = _969 >= 0.0;
    bool _1023 = isnan(_969);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan(0.0);
    bool _1029 = _1025 || _1027;
    int _1031 = _1007;
    int _1033 = _977;
    if (!_991)
    {
        int _1035 = ~_997;
        int _1037 = _1035 + 1;
        _1031 = _1037;
    }
    int _1039 = _1031;
    float _1041 = exp2(_989);
    bool _1043 = !_1015;
    int _1045 = _1043 ? 0 : 1;
    if (!_999)
    {
        int _1047 = ~_971;
        int _1049 = _1047 + 1;
        _1033 = _1049;
    }
    int _1051 = _1033;
    float _1053 = in.m_59.x;
    float _1055 = in.m_59.y;
    float _1057 = in.m_59.z;
    bool _1059 = _969 > 0.0;
    float _1061 = fma(_639, _639, _945);
    int _1063 = abs(_1045);
    float _1065 = _707 + _939;
    float _1067 = float(_1051);
    float _1069 = rsqrt(_1061);
    float _1071 = float(_1063);
    float _1073 = _1065 + (-1.0);
    bool _1075 = !_1011;
    int _1077 = _1075 ? 0 : 1;
    float _1079 = -_1041;
    float _1081 = _1079 + 1.0;
    float _1083 = _1071 * _1067;
    int _1085 = abs(_1077);
    bool _1087 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1089 = isnan(0.0);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1095 = _1091 || _1093;
    float _1097 = _1083 * (-2.0);
    float _1099 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1101 = _1095 ? _1081 : 0.0;
    float _1103 = fma(_967, _1097, _967);
    float _1105 = float(_1085);
    float _1107 = _1069 * _639;
    float _1109 = float(_1039);
    float _1111 = fma(_1097, _1055, _1055);
    float _1113 = _939 + (-0.5);
    float _1115 = _1101 * _1001;
    bool _1117 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1119 = isnan(1.0);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1125 = _1121 || _1123;
    float _1127 = _1105 * _1109;
    float _1129 = _1069 * _637;
    float _1131 = _1069 * _635;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1135 = _1107 * _1133;
    float _1137 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1111);
    bool _1139 = !_1019;
    int _1141 = _1139 ? 0 : 1;
    float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1145 = _1131 * _1143;
    bool _1147 = !_1125;
    float _1149 = _1147 ? _125 : _1115;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1153 = -_1135;
    float _1155 = fma(_1129, _1151, _1153);
    int _1157 = _1029 ? 0 : 1;
    float _1159 = _1127 * (-2.0);
    int _1161 = abs(_1141);
    float _1163 = fma(_1149, _1103, _1137);
    int _1165 = ~_1157;
    int _1167 = _1165 + 1;
    int _1169 = _1167 + 1;
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1173 = _1129 * _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1177 = -_1145;
    float _1179 = fma(_1107, _1175, _1177);
    float _1181 = _1155 * _1155;
    float _1183 = fma(_1099, _1159, _1099);
    int _1185 = _1169;
    float _1187 = _1061;
    if (!_1059)
    {
        int _1189 = ~_1157;
        int _1191 = _1189 + 1;
        _1185 = _1191;
    }
    int _1193 = _1185;
    float _1195 = fma(_1159, _1053, _1053);
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1199 = -_1173;
    float _1201 = fma(_1131, _1197, _1199);
    float _1203 = fma(_1179, _1179, _1181);
    float _1205 = _707 + (-0.5);
    float _1207 = float(_1161);
    float _1209 = as_type<float>(int(gl_VertexIndex));
    float _1211 = float(_1193);
    float _1213 = fma(_1201, _1201, _1203);
    float _1215 = _1163 * 0.15915493667125701904296875;
    float _1217 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1195);
    bool _1219 = _707 > 0.5;
    float _1221 = in.m_55.x;
    float _1223 = in.m_55.y;
    float _1225 = _1207 * _1211;
    float _1227 = _707 + _931;
    float _1229 = fma(_1149, _1183, _1217);
    float _1231 = _1225 * (-2.0);
    float _1233 = _1227 + (-1.0);
    float _1235 = _931 + (-0.5);
    float _1237 = _1229 * 0.15915493667125701904296875;
    float _1239 = fma(_1231, _1057, _1057);
    float _1241 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1243 = rsqrt(_1213);
    float _1245 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1239);
    float _1247 = fma(_1241, _1231, _1241);
    float _1249 = _459 * _375;
    float _1251 = in.m_49.w;
    float _1253 = fma(_1149, _1247, _1245);
    int _1255 = as_type<int>(_1209) & 1;
    bool _1257 = _1255 != 0;
    int _1259 = as_type<int>(_1209) & 2;
    bool _1261 = _1259 != 0;
    float _1263 = _1215 * 6.283185482025146484375;
    float _1265 = sin(_1263);
    bool _1267 = _939 > 0.5;
    float _1269 = _1253 * 0.15915493667125701904296875;
    float _1271 = _459 * _363;
    float _1273 = _901 * _1223;
    float _1275 = _459 * _379;
    float _1277 = fma(_457, _383, _1249);
    float _1279 = fma(_457, _385, _1271);
    float _1281 = _1215 * 6.283185482025146484375;
    float _1283 = cos(_1281);
    int _1285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1287 = _1285 != 0;
    float _1289 = _895 * _1221;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1293 = _1291 != 0;
    float _1295 = _1179 * _1243;
    float _1297 = _1155 * _1243;
    float _1299 = _1201 * _1243;
    float _1301 = _1237 * 6.283185482025146484375;
    float _1303 = cos(_1301);
    bool _1305 = !_1261;
    float _1307 = _1305 ? (-0.5) : 0.5;
    float _1309 = fma(_461, _391, _1277);
    float _1311 = fma(_461, _395, _1279);
    bool _1313 = !_1257;
    float _1315 = _1313 ? (-0.5) : 0.5;
    float _1317 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1319 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1307);
    float _1321 = _1311 + _1251;
    float _1323 = _1237 * 6.283185482025146484375;
    float _1325 = sin(_1323);
    float _1327 = _1269 * 6.283185482025146484375;
    float _1329 = cos(_1327);
    float _1331 = fma(_457, _389, _1275);
    float _1333 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1335 = _1303 * _1283;
    float _1337 = _1303 * _1265;
    float _1339 = fma(_461, _399, _1331);
    float _1341 = _1333 * _1319;
    float _1343 = _1129 * _1297;
    float _1345 = _1269 * 6.283185482025146484375;
    float _1347 = sin(_1345);
    float _1349 = _1325 * _1265;
    float _1351 = _1325 * _1283;
    float _1353 = _1303 * _1329;
    float _1355 = _1325 * _1329;
    float _1357 = _1283 * _1329;
    float _1359 = _1265 * _1329;
    float _1361 = _1353 * _1107;
    float _1363 = in.m_53.w;
    float _1365 = fma(_1347, _1335, _1349);
    float _1367 = fma(_1347, _1349, _1335);
    float _1369 = -_1337;
    float _1371 = fma(_1347, _1351, _1369);
    float _1373 = -_1351;
    float _1375 = fma(_1347, _1337, _1373);
    float _1377 = -_1343;
    float _1379 = fma(_1131, _1295, _1377);
    float _1381 = _1365 * _1107;
    float _1383 = -_1347;
    float _1385 = fma(_1383, _1299, _1361);
    float _1387 = _1375 * _1107;
    float _1389 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1315);
    float _1391 = fma(_1357, _1299, _1381);
    float _1393 = fma(_1355, _1379, _1385);
    float _1395 = fma(_1359, _1299, _1387);
    float _1397 = _1317 * _1389;
    float _1399 = fma(_1371, _1379, _1391);
    float _1401 = _1341 * _1393;
    float _1403 = fma(_1367, _1379, _1395);
    float _1405 = in.m_51.w;
    float _1407 = fma(_1397, _1399, _1401);
    float _1409 = _1131 * _1299;
    float _1411 = _1353 * _1129;
    float _1413 = _1375 * _1129;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1417 = _1415 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1419 = -_1409;
    float _1421 = fma(_1107, _1297, _1419);
    float _1423 = _1365 * _1129;
    float _1425 = -_1347;
    float _1427 = fma(_1425, _1295, _1411);
    float _1429 = _1339 + _1363;
    float _1431 = _1353 * _1131;
    float _1433 = 1.0 / _1417;
    float _1435 = fma(_1357, _1295, _1423);
    float _1437 = fma(_1355, _1421, _1427);
    float _1439 = fma(_1359, _1295, _1413);
    float _1441 = fma(_1371, _1421, _1435);
    float _1443 = _1341 * _1437;
    float _1445 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1447 = fma(_1367, _1421, _1439);
    float _1449 = -_1347;
    float _1451 = fma(_1449, _1297, _1431);
    float _1453 = fma(_1397, _1441, _1443);
    float _1455 = fma(_1445, _1403, _1407);
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1457;
    float _1461 = _1309 + _1405;
    float _1463 = fma(_1445, _1447, _1453);
    float _1465 = _1429 + _1455;
    float _1467 = _1459 * _1433;
    float _1469 = _1365 * _1131;
    float _1471 = _1461 + _1463;
    float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1475 = _1465 + _1473;
    float _1477 = _1375 * _1131;
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1481 = _929 + _1479;
    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1485 = _1471 + _1483;
    float _1487 = _1475 * _1475;
    bool _1489 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1491 = isnan(_929);
    bool _1493 = _1489 || _1491;
    bool _1495 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1497 = _1493 || _1495;
    float _1499 = float(_1497);
    float _1501 = fma(_1357, _1297, _1469);
    int _1503 = _899 + 8;
    uint _1506 = uint(int(uint(_1503) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[int(_1508)][_1510];
    float _1514 = fma(_1485, _1485, _1487);
    float _1516 = _1107 * _1295;
    float _1518 = fma(_1467, _1481, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1520 = fma(_1359, _1297, _1477);
    float _1522 = sqrt(_1514);
    float _1524 = -_1516;
    float _1526 = fma(_1129, _1299, _1524);
    bool _1528 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1530 = isnan(_929);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    uint _1540 = uint(int(uint(_899) >> uint(2)));
    uint _1542 = uint(int(uint(int(_1540)) >> uint(2)));
    int _1544 = int(_1540) & 3;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[int(_1542)][_1544];
    int _1548 = int(_1540) + 1;
    uint _1550 = uint(int(uint(_1548) >> uint(2)));
    int _1552 = _1548 & 3;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[int(_1550)][_1552];
    float _1556 = -_1315;
    int _1558 = _1219 ? as_type<int>(_1556) : as_type<int>(_1315);
    float _1560 = fma(_1355, _1526, _1451);
    float _1562 = fma(_1371, _1526, _1501);
    float _1564 = -_1538;
    float _1566 = _1564 + 1.0;
    float _1568 = fma(_1367, _1526, _1520);
    float _1570 = _1341 * _1560;
    bool _1572 = !_1287;
    float _1574 = _1572 ? _1315 : as_type<float>(_1558);
    float _1576 = _1499 * _1566;
    float _1578 = fma(_1397, _1562, _1570);
    float _1580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1582 = _1518 * _1576;
    bool _1584 = _1522 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1586 = -_1499;
    float _1588 = _1586 + 1.0;
    float _1590 = fma(_1445, _1568, _1578);
    float _1592 = -_1307;
    int _1594 = _1267 ? as_type<int>(_1592) : as_type<int>(_1307);
    float _1596 = _1574 + 0.5;
    float _1598 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1582);
    float _1600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1602 = _1321 + _1590;
    bool _1604 = !_1293;
    float _1606 = _1604 ? _1307 : as_type<float>(_1594);
    float _1608 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1598);
    float _1610 = _1451;
    float _1612 = _1471;
    float _1614 = _1465;
    if (!_1584)
    {
        _1610 = _1602;
    }
    float _1616 = _1610;
    bool _1618 = !_1584;
    float _1620 = _1616;
    if (!_1618)
    {
        float _1622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1626 = _1522 + _1624;
        float _1628 = rsqrt(_1514);
        float _1630 = _1626 * _1622;
        float _1632 = _1602 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1634 = _1630 * 0.15915493667125701904296875;
        float _1636 = _1634 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = _1634 * 6.283185482025146484375;
        float _1642 = cos(_1640);
        float _1644 = fma(_1638, _1632, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1646 = _1628 * _1644;
        float _1648 = _1642 + (-1.0);
        float _1650 = fma(_1485, _1646, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1652 = fma(_1475, _1646, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1654 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1656 = fma(_1602, _1642, _1654);
        _1620 = _1656;
        _1612 = _1650;
        _1614 = _1652;
    }
    float _1658 = _1620;
    float _1660 = _1612;
    float _1662 = _1614;
    float _1664 = -_1321;
    float _1666 = _1664 + _1658;
    float _1668 = -_1606;
    float _1670 = _1668 + 0.5;
    float _1672 = -_1461;
    float _1674 = _1672 + _1660;
    float _1676 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1678 = _1666 * _1666;
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1682 = -_1429;
    float _1684 = _1682 + _1662;
    float _1686 = _1676 * _1580;
    float _1688 = fma(_1674, _1674, _1678);
    float _1690 = _1680 * _1600;
    float _1692 = _1546 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1694 = fma(_1684, _1684, _1688);
    float _1696 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1698 = sqrt(_1694);
    float _1700 = _1512 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1708 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1710 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1716 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1718 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1720 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1722 = _1608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _1686;
    out.m_64.y = _1690;
    bool _1724 = _1698 > 0.0;
    out.m_66.x = _1712;
    out.m_66.y = _1716;
    out.m_66.z = _1718;
    out.m_66.w = _1714;
    out.m_68.x = _1708;
    out.m_68.y = _1710;
    out.m_68.z = _1720;
    out.m_68.w = _1722;
    bool _1726 = !_1724;
    float _1728 = _1710;
    float _1730 = _1714;
    float _1732 = _1712;
    float _1734 = _1658;
    float _1736 = _1660;
    float _1738 = _1662;
    float _1740 = _1716;
    float _1742 = _1712;
    if (!_1726)
    {
        bool _1744 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1746 = _1716;
        if (_1744)
        {
            float _1748 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1746 = _1748;
        }
        float _1750 = _1746;
        float _1752 = _1750;
        if (_1744)
        {
            float _1754 = _1750 * _637;
            _1728 = _1754;
        }
        float _1756 = _1728;
        float _1758 = _1756;
        if (_1744)
        {
            float _1760 = _1750 * _635;
            _1730 = _1760;
        }
        float _1762 = _1730;
        float _1764 = _1762;
        if (_1744)
        {
            float _1766 = _1750 * _639;
            _1752 = _1766;
        }
        float _1768 = _1752;
        float _1770 = _1768;
        if (!_1744)
        {
            float _1772 = _125 + 1.0;
            float _1774 = _1772;
            if (!_167)
            {
                float _1776 = _1772 * _1772;
                float _1778 = _1776 * 0.5;
                _1732 = _1778;
            }
            float _1780 = _1732;
            float _1782 = _1780;
            if (!_167)
            {
                float _1784 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1782 = _1784;
            }
            float _1786 = _1782;
            bool _1788 = !_167;
            float _1790 = _1786;
            if (!_1788)
            {
                float _1792 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1794 = log2(_1792);
                float _1796 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1798 = _1794 * _1772;
                float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1802 = 1.0 + _1800;
                float _1804 = 1.0 / _1802;
                float _1806 = _1796 * 0.693147182464599609375;
                float _1808 = exp2(_1798);
                float _1810 = 1.0 / _1806;
                float _1812 = _1808 + (-1.0);
                float _1814 = -_1812;
                float _1816 = fma(_1814, _1810, _1772);
                float _1818 = _1816 * _1804;
                float _1820 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1790 = _1820;
            }
            float _1822 = _1790;
            float _1824 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1826 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1828 = !_167;
            if (!_1828)
            {
                float _1830 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1832 = log2(_1830);
                float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1836 = 1.0 + _1834;
                float _1838 = 1.0 / _1836;
                float _1840 = _1832 * _1772;
                float _1842 = exp2(_1840);
                float _1844 = -_1842;
                float _1846 = _1844 + 1.0;
                float _1848 = _1846 * _1838;
                _1774 = _1848;
            }
            float _1850 = _1774;
            float _1852 = fma(_1850, _153, _1826);
            float _1854 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1856 = fma(_1850, _151, _1824);
            float _1858 = -_347;
            float _1860 = _1858 + _1852;
            float _1862 = fma(_1850, _155, _1854);
            float _1864 = -_355;
            float _1866 = _1864 + _1856;
            float _1868 = _1860 * _363;
            float _1870 = -_361;
            float _1872 = _1870 + _1862;
            float _1874 = _1860 * _375;
            float _1876 = _1860 * _379;
            float _1878 = fma(_1866, _385, _1868);
            float _1880 = fma(_1866, _383, _1874);
            float _1882 = fma(_1866, _389, _1876);
            float _1884 = fma(_1872, _395, _1878);
            float _1886 = fma(_1872, _391, _1880);
            float _1888 = fma(_1872, _399, _1882);
            float _1890 = _1884 * _1884;
            float _1892 = fma(_1886, _1886, _1890);
            float _1894 = fma(_1888, _1888, _1892);
            _1187 = _1894;
            _645 = _1884;
            _647 = _1886;
            _649 = _1888;
            _1758 = _1886;
            _1764 = _1884;
            _1770 = _1888;
        }
        float _1896 = _1187;
        float _1898 = _645;
        float _1900 = _647;
        float _1902 = _649;
        float _1904 = _1758;
        float _1906 = _1764;
        float _1908 = _1770;
        float _1910 = sqrt(_1896);
        float _1912 = rsqrt(_1694);
        bool _1914 = _1910 > 0.0;
        float _1916 = _1674 * _1912;
        float _1918 = _1666 * _1912;
        float _1920 = _1684 * _1912;
        bool _1922 = !_1914;
        _1740 = _1908;
        _1742 = _1916;
        if (!_1922)
        {
            float _1924 = rsqrt(_1896);
            float _1926 = _1924 * _1898;
            float _1928 = _1924 * _1900;
            float _1930 = _1924 * _1902;
            float _1932 = _1918 * _1926;
            float _1934 = fma(_1916, _1928, _1932);
            float _1936 = fma(_1920, _1930, _1934);
            float _1938 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1940 = fma(_1904, _1938, _1660);
            float _1942 = fma(_1906, _1938, _1658);
            float _1944 = fma(_1908, _1938, _1662);
            _1734 = _1942;
            _1736 = _1940;
            _1738 = _1944;
        }
    }
    float _1946 = _1734;
    float _1948 = _1736;
    float _1950 = _1738;
    float _1952 = _1740;
    float _1954 = _1742;
    float _1956 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1958 = _1946 + _1956;
    float _1960 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1962 = _1948 + _1960;
    float _1964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1966 = _1950 + _1964;
    float _1968 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1970 = _1958 * _1958;
    float _1972 = fma(_1962, _1962, _1970);
    float _1974 = fma(_1966, _1966, _1972);
    float _1976 = rsqrt(_1974);
    float _1978 = sqrt(_1974);
    float _1980 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1982 = _1962 * _1980;
    float _1984 = _1966 * _1980;
    float _1986 = _1982 * _1982;
    float _1988 = _1984 * _1984;
    float _1990 = _1986 + _1988;
    float _1992 = sqrt(_1990);
    bool _1994 = _1992 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1998 = _1992 + _1996;
    float _2000 = _1976;
    float _2002 = _1998;
    float _2004 = _1952;
    float _2006 = _1958;
    float _2008 = _1980;
    if (_1994)
    {
        float _2010 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2000 = _2010;
    }
    float _2012 = _2000;
    float _2014 = _2012;
    if (_1994)
    {
        float _2016 = _1998 * _2012;
        _2002 = _2016;
    }
    float _2018 = _2002;
    if (_1994)
    {
        float _2020 = rsqrt(_1990);
        _2014 = _2020;
    }
    float _2022 = _2014;
    float _2024 = _2022;
    if (_1994)
    {
        float _2026 = _2018 * 0.15915493667125701904296875;
        _2004 = _2026;
    }
    float _2028 = _2004;
    float _2030 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2032 = _1966;
    float _2034 = _2028;
    if (_1994)
    {
        float _2036 = _2028 * 6.283185482025146484375;
        float _2038 = sin(_2036);
        _2032 = _2038;
    }
    float _2040 = _2032;
    float _2042 = precise::max(0.0, _2030);
    float _2044 = _1954;
    float _2046 = _2042;
    if (_1994)
    {
        float _2048 = _2028 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        _2044 = _2050;
    }
    float _2052 = _2044;
    float _2054 = -_1980;
    float _2056 = -_2042;
    float _2058 = fma(_1958, _2054, _2056);
    if (_1994)
    {
        float _2060 = _2058 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2006 = _2060;
    }
    float _2062 = _2006;
    float _2064 = _2040;
    float _2066 = _2062;
    if (_1994)
    {
        float _2068 = fma(_2040, _2062, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2064 = _2068;
    }
    float _2070 = _2064;
    float _2072 = _2070;
    if (!_1994)
    {
        _2066 = _2058;
    }
    float _2074 = _2066;
    float _2076 = _2074;
    if (_1994)
    {
        float _2078 = _2022 * _2070;
        _2008 = _2078;
    }
    float _2080 = _2008;
    if (!_1994)
    {
        _2024 = _1982;
    }
    float _2082 = _2024;
    float _2084 = _2082;
    float _2086 = _2052;
    if (_1994)
    {
        float _2088 = _2052 + (-1.0);
        _2046 = _2088;
    }
    float _2090 = _2046;
    float _2092 = _2090;
    if (_1994)
    {
        float _2094 = _1982 * _2080;
        _2084 = _2094;
    }
    float _2096 = _2084;
    if (!_1994)
    {
        _2072 = _1986;
    }
    float _2098 = _2072;
    float _2100 = _2098;
    if (_1994)
    {
        float _2102 = _2090 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2034 = _2102;
    }
    float _2104 = _2034;
    if (!_1994)
    {
        _2092 = _1984;
    }
    float _2106 = _2092;
    float _2108 = _2106;
    if (_1994)
    {
        float _2110 = _1984 * _2080;
        _2108 = _2110;
    }
    float _2112 = _2108;
    if (_1994)
    {
        float _2114 = _2096 * _2096;
        _2100 = _2114;
    }
    float _2116 = _2100;
    if (_1994)
    {
        float _2118 = fma(_2058, _2052, _2104);
        _2076 = _2118;
    }
    float _2120 = _2076;
    if (!_1994)
    {
        _2086 = _1988;
    }
    float _2122 = _2086;
    float _2124 = _2122;
    if (_1994)
    {
        float _2126 = _2112 * _2112;
        _2124 = _2126;
    }
    float _2128 = _2124;
    float _2130 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2132 = fma(_2120, _2120, _2116);
    float _2134 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2130);
    float _2136 = _2132 + _2128;
    float _2138 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2142 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2140);
    float _2144 = precise::clamp(_2142, 0.0, 1.0);
    float _2146 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2134);
    float _2148 = rsqrt(_2136);
    float _2150 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2152 = -_2144;
    float _2154 = _2152 + 1.0;
    float _2156 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2138);
    float _2158 = _2146 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2160 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2162 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2150);
    float _2164 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2156);
    float _2166 = abs(_2154);
    float _2168 = log2(_2166);
    float _2170 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2172 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2160);
    float _2174 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2162);
    float _2176 = _2164 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2178 = -_2170;
    float _2180 = fma(_2178, _1968, 1.0);
    float _2182 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2172);
    float _2184 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2186 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2188 = _2148 * _2096;
    float _2190 = _2148 * _2120;
    float _2192 = _2148 * _2112;
    float _2194 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2186);
    float _2196 = _2188 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2198 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2200 = log2(_2180);
    float _2202 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2204 = -_2196;
    float _2206 = fma(_2190, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2204);
    float _2208 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2194);
    float _2210 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2212 = -_2192;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2206);
    float _2216 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2208);
    float _2218 = exp2(_2202);
    float _2220 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2222 = fma(_2214, -0.5, 0.5);
    float _2224 = fma(_2214, 0.5, 0.5);
    float _2226 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2210);
    float _2228 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2220);
    float _2230 = _2190 + 1.0;
    float _2232 = fma(_2224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2234 = 1.0 / _2216;
    float _2236 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2228);
    float _2238 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2226);
    float _2240 = fma(_2224, _2232, -0.212114393711090087890625);
    float _2242 = _2200 * 0.693147182464599609375;
    float _2244 = fma(_2224, _2240, 1.570728778839111328125);
    float _2246 = sqrt(_2222);
    float _2248 = -_2190;
    float _2250 = fma(_2218, _2230, _2248);
    float _2252 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2236);
    float _2254 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2238);
    float _2256 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2258 = _2252 * _2234;
    float _2260 = _2254 * _2234;
    float _2262 = fma(_2258, 0.5, 0.5);
    float _2264 = fma(_2260, -0.5, 0.5);
    float _2266 = fma(_2250, 0.5, 0.5);
    float _2268 = _2246 * 0.636619746685028076171875;
    float3 _5747 = float3(_2262, _2264, _2256);
    float _2270 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5747, float3(0.0), isnan(_5747)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5747, float3(0.0), isnan(_5747)), level(0.0)).x;
    float3 _5758 = float3(_2262, _2264, _2256);
    float4 _2273 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5758, float3(0.0), isnan(_5758)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5758, float3(0.0), isnan(_5758)), level(0.0)).xyzw;
    float _2275 = _2273.x;
    float _2277 = _2273.y;
    float _2279 = _2273.z;
    float _2281 = _2273.w;
    float _2283 = -_2244;
    float _2285 = fma(_2268, _2283, 1.0);
    float2 _5780 = float2(_2285, _2266);
    float3 _2289 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5780, float2(0.0), isnan(_5780)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5780, float2(0.0), isnan(_5780)), level(0.0)).xyz;
    float _2291 = _2289.x;
    float _2293 = _2289.y;
    float _2295 = _2289.z;
    float _2297 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2299 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2301 = _2252 + _2216;
    float _2303 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2297);
    float _2305 = _2301 * 0.5;
    float _2307 = exp2(_2299);
    float _2309 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2303);
    float _2311 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2309);
    float _2313 = _2216 * 0.5;
    float _2315 = _2311 + _2216;
    float _2317 = fma(_2254, -0.5, _2313);
    out.gl_Position.x = _2252;
    out.gl_Position.y = _2254;
    out.gl_Position.z = _2311;
    out.gl_Position.w = _2216;
    float _2319 = _2315 * 0.5;
    float _2321 = -_2307;
    float _2323 = _2321 + 1.0;
    out.m_70.x = _2305;
    out.m_70.y = _2317;
    out.m_70.z = _2319;
    out.m_70.w = _2216;
    float _2325 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2327 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2327;
    float _2329 = _2325 * _2270;
    float _2331 = -_2325;
    float _2333 = _2331 + 1.0;
    float _2335 = _2281 * _2329;
    float _2337 = _2281 * _2333;
    float _2339 = _2295 * _2329;
    float _2341 = fma(_2291, _2335, _2275);
    float _2343 = fma(_2293, _2335, _2277);
    float _2345 = fma(_2281, _2339, _2279);
    out.m_72.x = _2341;
    out.m_72.y = _2343;
    out.m_72.z = _2345;
    out.m_72.w = _2337;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_vid = gl_VertexIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _921 = false;
    bool _669 = false;
    bool _505 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _86 = in.m_42.w;
    float _88 = trunc(_86);
    int _91 = int(_88);
    bool _95 = _91 >= 1;
    float _97 = 0.0;
    if (!_95)
    {
        _97 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _99 = _97;
    float _101 = _99;
    if (!_95)
    {
        out.m_45.x = 0.0;
    }
    int _103 = 0;
    if (!_95)
    {
        float _105 = _99 * 5.0;
        _103 = as_type<int>(_105);
    }
    int _107 = _103;
    int _109 = _107;
    if (!_95)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2402 = as_type<float>(_107);
        out.gl_Position.z = _2402;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _111 = in.m_47.w;
    bool _113 = _111 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _115 = isnan(_111);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _121 = _117 || _119;
    float _123 = -_111;
    float _125 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _127 = 0.0;
    float _129 = 0.0;
    if (_121)
    {
        float _131 = float(_91);
        _101 = _131;
    }
    float _133 = _101;
    bool _135 = _125 >= _133;
    bool _137 = !_121;
    bool _139 = _135 || _137;
    float _141 = _133;
    if (_139)
    {
        _141 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _143 = _141;
    if (_139)
    {
        out.m_45.x = 0.0;
    }
    if (_139)
    {
        float _145 = _143 * 5.0;
        _109 = as_type<int>(_145);
    }
    int _147 = _109;
    float _149 = as_type<float>(_147);
    if (_139)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2473 = as_type<float>(_147);
        out.gl_Position.z = _2473;
    }
    if (_139)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    float _157 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _159 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _161 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _163 = _159 || _161;
    bool _165 = isnan(1.0);
    bool _167 = _163 || _165;
    float _169 = _157;
    if (!_167)
    {
        float _171 = _157 * _157;
        float _173 = _171 * 0.5;
        _149 = _173;
    }
    float _175 = _149;
    float _177 = 0.0;
    float _179 = _175;
    if (!_167)
    {
        float _181 = _125 * _125;
        float _183 = _181 * 0.5;
        _177 = _183;
    }
    float _185 = _177;
    if (!_167)
    {
        float _187 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _187;
    }
    float _189 = _179;
    bool _191 = !_167;
    float _193 = _189;
    if (!_191)
    {
        float _195 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _197 = log2(_195);
        float _199 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _201 = _199 + 1.0;
        float _203 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _205 = _157 * _197;
        float _207 = 1.0 / _201;
        float _209 = _203 * 0.693147182464599609375;
        float _211 = exp2(_205);
        float _213 = 1.0 / _209;
        float _215 = _211 + (-1.0);
        float _217 = -_215;
        float _219 = fma(_217, _213, _157);
        float _221 = _219 * _207;
        float _223 = _221 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _127 = _213;
        _193 = _223;
        _129 = _211;
    }
    float _225 = _127;
    float _227 = _193;
    float _229 = _129;
    bool _231 = !_167;
    float _233 = _225;
    float _235 = _229;
    if (!_231)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = 1.0 / _243;
        float _247 = _157 * _239;
        float _249 = exp2(_247);
        float _251 = -_249;
        float _253 = _251 + 1.0;
        float _255 = _253 * _245;
        _233 = _249;
        _235 = _243;
        _169 = _255;
    }
    float _257 = _233;
    float _259 = _235;
    float _261 = _169;
    float _263 = _259;
    float _265 = _257;
    if (!_167)
    {
        _263 = _125;
    }
    float _267 = _263;
    float _269 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _271 = _267;
    if (!_167)
    {
        float _273 = _185 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _265 = _273;
    }
    float _275 = _265;
    bool _277 = !_167;
    float _279 = _275;
    if (!_277)
    {
        float _281 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _283 = log2(_281);
        float _285 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _287 = _285 + 1.0;
        float _289 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _291 = _125 * _283;
        float _293 = 1.0 / _287;
        float _295 = _289 * 0.693147182464599609375;
        float _297 = exp2(_291);
        float _299 = 1.0 / _295;
        float _301 = _297 + (-1.0);
        float _303 = -_301;
        float _305 = fma(_303, _299, _125);
        float _307 = _305 * _293;
        float _309 = _307 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _309;
    }
    float _311 = _279;
    bool _313 = !_167;
    if (!_313)
    {
        float _315 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _317 = log2(_315);
        float _319 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _321 = _319 + 1.0;
        float _323 = 1.0 / _321;
        float _325 = _125 * _317;
        float _327 = exp2(_325);
        float _329 = -_327;
        float _331 = _329 + 1.0;
        float _333 = _331 * _323;
        _271 = _333;
    }
    float _335 = _271;
    float _337 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _341 = _227 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _343 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _345 = fma(_261, _153, _337);
    float _347 = fma(_335, _153, _339);
    float _349 = fma(_261, _151, _269);
    float _351 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _353 = fma(_261, _155, _341);
    float _355 = fma(_335, _151, _343);
    float _357 = -_347;
    float _359 = _345 + _357;
    float _361 = fma(_335, _155, _351);
    float _363 = in.m_49.y;
    float _365 = -_355;
    float _367 = _349 + _365;
    float _369 = _359 * _359;
    float _371 = -_361;
    float _373 = _353 + _371;
    float _375 = in.m_51.y;
    float _377 = fma(_367, _367, _369);
    float _379 = in.m_53.y;
    float _381 = fma(_373, _373, _377);
    float _383 = in.m_51.x;
    float _385 = in.m_49.x;
    float _387 = sqrt(_381);
    float _389 = in.m_53.x;
    float _391 = in.m_51.z;
    float _393 = _359 * _363;
    float _395 = in.m_49.z;
    float _397 = _359 * _375;
    float _399 = in.m_53.z;
    bool _401 = _387 >= 9.9999999747524270787835121154785e-07;
    bool _403 = isnan(_387);
    bool _405 = _401 || _403;
    bool _407 = isnan(9.9999999747524270787835121154785e-07);
    bool _409 = _405 || _407;
    float _411 = _359 * _379;
    float _413 = _363 * _363;
    float _415 = in.m_55.w;
    float _417 = fma(_367, _383, _397);
    float _419 = fma(_375, _375, _413);
    float _421 = in.m_42.x;
    float _423 = in.m_42.y;
    float _425 = in.m_42.z;
    float _427 = fma(_367, _385, _393);
    float _429 = fma(_379, _379, _419);
    float _431 = fma(_367, _389, _411);
    float _433 = fma(_373, _391, _417);
    float _435 = fma(_373, _395, _427);
    float _437 = _427;
    float _439 = _431;
    float _441 = _415;
    if (_409)
    {
        _437 = _433;
    }
    float _443 = _437;
    float _445 = fma(_373, _399, _431);
    float _447 = _443;
    float _449 = _445;
    float _451 = _443;
    float _453 = _445;
    if (_409)
    {
        _439 = _435;
    }
    float _455 = _439;
    float _457 = fma(_349, _415, _421);
    float _459 = fma(_345, _415, _423);
    float _461 = fma(_353, _415, _425);
    float _463 = _455;
    float _465 = _455;
    if (!_409)
    {
        bool _467 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _469 = !_467;
        if (!_469)
        {
            float _471 = _363 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _473 = _375 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _475 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _477 = fma(_385, (*spvDescriptorSet0.vp_c9)._m0[16].x, _471);
            float _479 = fma(_383, (*spvDescriptorSet0.vp_c9)._m0[16].x, _473);
            float _481 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[16].x, _475);
            float _483 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].z, _477);
            float _485 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[16].z, _479);
            float _487 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[16].z, _481);
            float _489 = _483 * _483;
            float _491 = fma(_485, _485, _489);
            float _493 = fma(_487, _487, _491);
            float _495 = rsqrt(_493);
            float _497 = _495 * 9.9999999747524270787835121154785e-07;
            float _499 = _485 * _497;
            float _501 = _483 * _497;
            float _503 = _487 * _497;
            _465 = _501;
            _451 = _499;
            _453 = _503;
            _505 = true;
        }
        else
        {
            float _507 = _153 * _153;
            float _509 = fma(_151, _151, _507);
            float _511 = fma(_155, _155, _509);
            float _513 = sqrt(_511);
            bool _515 = _513 >= 9.9999999747524270787835121154785e-07;
            bool _517 = isnan(_513);
            bool _519 = _515 || _517;
            bool _521 = isnan(9.9999999747524270787835121154785e-07);
            bool _523 = _519 || _521;
            if (!_523)
            {
                float _525 = _423 * _423;
                float _527 = fma(_421, _421, _525);
                float _529 = fma(_425, _425, _527);
                float _531 = sqrt(_529);
                bool _533 = _531 >= 9.9999999747524270787835121154785e-07;
                bool _535 = isnan(_531);
                bool _537 = _533 || _535;
                bool _539 = isnan(9.9999999747524270787835121154785e-07);
                bool _541 = _537 || _539;
                float _543 = _429;
                if (!_541)
                {
                    float _545 = rsqrt(_429);
                    _543 = _545;
                }
                float _547 = _543;
                if (!_541)
                {
                    float _549 = _547 * 9.9999999747524270787835121154785e-07;
                    _441 = _549;
                }
                float _551 = _441;
                if (!_541)
                {
                    float _553 = _375 * _551;
                    _447 = _553;
                }
                float _555 = _447;
                _451 = _555;
                if (!_541)
                {
                    float _557 = _363 * _551;
                    _463 = _557;
                }
                float _559 = _463;
                _465 = _559;
                if (!_541)
                {
                    float _561 = _379 * _551;
                    _449 = _561;
                }
                float _563 = _449;
                bool _565 = !_541;
                _453 = _563;
                _505 = _565;
                if (!_505)
                {
                    float _567 = _363 * _423;
                    float _569 = _375 * _423;
                    float _571 = _379 * _423;
                    float _573 = fma(_421, _385, _567);
                    float _575 = fma(_421, _383, _569);
                    float _577 = fma(_421, _389, _571);
                    float _579 = fma(_425, _395, _573);
                    float _581 = fma(_425, _391, _575);
                    float _583 = fma(_425, _399, _577);
                    float _585 = _579 * _579;
                    float _587 = fma(_581, _581, _585);
                    float _589 = fma(_583, _583, _587);
                    float _591 = rsqrt(_589);
                    float _593 = _591 * 9.9999999747524270787835121154785e-07;
                    float _595 = _581 * _593;
                    float _597 = _579 * _593;
                    float _599 = _583 * _593;
                    _465 = _597;
                    _451 = _595;
                    _453 = _599;
                    _505 = true;
                }
            }
            else
            {
                float _601 = _363 * _153;
                float _603 = _375 * _153;
                float _605 = _379 * _153;
                float _607 = fma(_151, _385, _601);
                float _609 = fma(_151, _383, _603);
                float _611 = fma(_151, _389, _605);
                float _613 = fma(_155, _395, _607);
                float _615 = fma(_155, _391, _609);
                float _617 = fma(_155, _399, _611);
                float _619 = _613 * _613;
                float _621 = fma(_615, _615, _619);
                float _623 = fma(_617, _617, _621);
                float _625 = rsqrt(_623);
                float _627 = _625 * 9.9999999747524270787835121154785e-07;
                float _629 = _615 * _627;
                float _631 = _613 * _627;
                float _633 = _617 * _627;
                _465 = _631;
                _451 = _629;
                _453 = _633;
            }
        }
    }
    _505 = false;
    float _635 = _465;
    float _637 = _451;
    float _639 = _453;
    bool _641 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _643 = !_641;
    float _645 = _635;
    float _647 = _637;
    float _649 = _639;
    float _667;
    if (!_643)
    {
        float _651 = in.m_57.x;
        float _653 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _655 = _651 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _657 = fma(_655, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _659 = _657 * _653;
        float _661 = floor(_659);
        float _663 = -_661;
        float _665 = _659 + _663;
        _667 = _665;
        _669 = true;
    }
    else
    {
        float _671 = float(_91);
        float _673 = 1.0 / _671;
        float _675 = _125 * _673;
        _667 = _675;
    }
    _669 = false;
    float _677 = _667;
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _681 = _677 + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _685 = _677 + _683;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _689 = _677 + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _701 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _699;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _705 = _703 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _707 = in.m_57.x;
    bool _709 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _711 = isnan(_677);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = 1.0 / _693;
    bool _723 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _725 = isnan(_677);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _737 = 1.0 / _697;
    bool _739 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _741 = 1.0 / _705;
    float _743 = _681 * _721;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _747 = _677 + _745;
    bool _749 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _751 = isnan(_677);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _735 * _707;
    float _763 = 1.0 / _701;
    float _765 = _747 * _737;
    float _767 = _685 * _741;
    bool _769 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _771 = isnan(_677);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = -_759;
    float _783 = _781 + 1.0;
    float _785 = trunc(_761);
    int _787 = int(_785);
    float _789 = _779 * _783;
    float _791 = -_779;
    float _793 = _791 + 1.0;
    float _795 = _689 * _763;
    bool _797 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _799 = isnan(_677);
    bool _801 = _797 || _799;
    bool _803 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _805 = _801 || _803;
    float _807 = float(_805);
    float _809 = -_807;
    float _811 = _809 + 1.0;
    float _813 = _807 * _793;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _815;
    float _819 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _821 = _819 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _823 = _719 * _811;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _825;
    float _829 = -_719;
    float _831 = _829 + 1.0;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _835 = _833 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _837 = fma(_817, _743, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _839 = fma(_827, _743, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _841 = _733 * _831;
    float _843 = fma(_821, _765, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _845 = fma(_835, _765, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _847 = _837 * _841;
    float _849 = _839 * _841;
    float _851 = -_733;
    float _853 = _851 + 1.0;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _855;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _861 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _859;
    float _863 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].x, _847);
    float _865 = fma(_853, (*spvDescriptorSet0.vp_c9)._m0[143].y, _849);
    float _867 = fma(_857, _795, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _869 = fma(_861, _795, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _871 = fma(_843, _823, _863);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _881 = fma(_845, _823, _865);
    float _883 = fma(_867, _813, _871);
    float _885 = fma(_875, _767, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _887 = fma(_879, _767, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _889 = fma(_869, _813, _881);
    float _891 = fma(_885, _789, _883);
    float _893 = fma(_887, _789, _889);
    float _895 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[147].x, _891);
    int _897 = _787 << 4;
    int _899 = _897 + 1712;
    float _901 = fma(_759, (*spvDescriptorSet0.vp_c9)._m0[147].y, _893);
    bool _903 = !_739;
    float _919;
    if (!_903)
    {
        float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _907 = _707 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _909 = fma(_907, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _911 = _909 * _905;
        float _913 = floor(_911);
        float _915 = -_913;
        float _917 = _911 + _915;
        _919 = _917;
        _921 = true;
    }
    else
    {
        float _923 = float(_91);
        float _925 = 1.0 / _923;
        float _927 = _125 * _925;
        _919 = _927;
    }
    _921 = false;
    float _929 = _919;
    float _931 = in.m_57.z;
    float _933 = _707 * 2.0;
    float _935 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _937 = log2(_935);
    float _939 = in.m_57.y;
    float _941 = _635 * _635;
    float _943 = floor(_933);
    float _945 = fma(_637, _637, _941);
    float _947 = _931 * 2.0;
    bool _949 = _943 >= 0.0;
    bool _951 = isnan(_943);
    bool _953 = _949 || _951;
    bool _955 = isnan(0.0);
    bool _957 = _953 || _955;
    float _959 = _939 * 2.0;
    float _961 = _939 + _931;
    float _963 = floor(_947);
    float _965 = _961 + (-1.0);
    float _967 = fma(_965, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _969 = floor(_959);
    int _971 = _957 ? 0 : 1;
    int _973 = ~_971;
    int _975 = _973 + 1;
    int _977 = _975 + 1;
    bool _979 = _963 >= 0.0;
    bool _981 = isnan(_963);
    bool _983 = _979 || _981;
    bool _985 = isnan(0.0);
    bool _987 = _983 || _985;
    float _989 = _125 * _937;
    bool _991 = _963 > 0.0;
    float _993 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _995 = 1.0 + _993;
    int _997 = _987 ? 0 : 1;
    bool _999 = _943 > 0.0;
    float _1001 = 1.0 / _995;
    int _1003 = ~_997;
    int _1005 = _1003 + 1;
    int _1007 = _1005 + 1;
    int _1009 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1011 = _1009 != 0;
    int _1013 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1015 = _1013 != 0;
    int _1017 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1019 = _1017 != 0;
    bool _1021 = _969 >= 0.0;
    bool _1023 = isnan(_969);
    bool _1025 = _1021 || _1023;
    bool _1027 = isnan(0.0);
    bool _1029 = _1025 || _1027;
    int _1031 = _1007;
    int _1033 = _977;
    if (!_991)
    {
        int _1035 = ~_997;
        int _1037 = _1035 + 1;
        _1031 = _1037;
    }
    int _1039 = _1031;
    float _1041 = exp2(_989);
    bool _1043 = !_1015;
    int _1045 = _1043 ? 0 : 1;
    if (!_999)
    {
        int _1047 = ~_971;
        int _1049 = _1047 + 1;
        _1033 = _1049;
    }
    int _1051 = _1033;
    float _1053 = in.m_59.x;
    float _1055 = in.m_59.y;
    float _1057 = in.m_59.z;
    bool _1059 = _969 > 0.0;
    float _1061 = fma(_639, _639, _945);
    int _1063 = abs(_1045);
    float _1065 = _707 + _939;
    float _1067 = float(_1051);
    float _1069 = rsqrt(_1061);
    float _1071 = float(_1063);
    float _1073 = _1065 + (-1.0);
    bool _1075 = !_1011;
    int _1077 = _1075 ? 0 : 1;
    float _1079 = -_1041;
    float _1081 = _1079 + 1.0;
    float _1083 = _1071 * _1067;
    int _1085 = abs(_1077);
    bool _1087 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1089 = isnan(0.0);
    bool _1091 = _1087 || _1089;
    bool _1093 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1095 = _1091 || _1093;
    float _1097 = _1083 * (-2.0);
    float _1099 = fma(_1073, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1101 = _1095 ? _1081 : 0.0;
    float _1103 = fma(_967, _1097, _967);
    float _1105 = float(_1085);
    float _1107 = _1069 * _639;
    float _1109 = float(_1039);
    float _1111 = fma(_1097, _1055, _1055);
    float _1113 = _939 + (-0.5);
    float _1115 = _1101 * _1001;
    bool _1117 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1119 = isnan(1.0);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1125 = _1121 || _1123;
    float _1127 = _1105 * _1109;
    float _1129 = _1069 * _637;
    float _1131 = _1069 * _635;
    float _1133 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1135 = _1107 * _1133;
    float _1137 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1111);
    bool _1139 = !_1019;
    int _1141 = _1139 ? 0 : 1;
    float _1143 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1145 = _1131 * _1143;
    bool _1147 = !_1125;
    float _1149 = _1147 ? _125 : _1115;
    float _1151 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1153 = -_1135;
    float _1155 = fma(_1129, _1151, _1153);
    int _1157 = _1029 ? 0 : 1;
    float _1159 = _1127 * (-2.0);
    int _1161 = abs(_1141);
    float _1163 = fma(_1149, _1103, _1137);
    int _1165 = ~_1157;
    int _1167 = _1165 + 1;
    int _1169 = _1167 + 1;
    float _1171 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1173 = _1129 * _1171;
    float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1177 = -_1145;
    float _1179 = fma(_1107, _1175, _1177);
    float _1181 = _1155 * _1155;
    float _1183 = fma(_1099, _1159, _1099);
    int _1185 = _1169;
    float _1187 = _1061;
    if (!_1059)
    {
        int _1189 = ~_1157;
        int _1191 = _1189 + 1;
        _1185 = _1191;
    }
    int _1193 = _1185;
    float _1195 = fma(_1159, _1053, _1053);
    float _1197 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1199 = -_1173;
    float _1201 = fma(_1131, _1197, _1199);
    float _1203 = fma(_1179, _1179, _1181);
    float _1205 = _707 + (-0.5);
    float _1207 = float(_1161);
    float _1209 = as_type<float>(int(gl_VertexIndex));
    float _1211 = float(_1193);
    float _1213 = fma(_1201, _1201, _1203);
    float _1215 = _1163 * 0.15915493667125701904296875;
    float _1217 = fma(_1205, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1195);
    bool _1219 = _707 > 0.5;
    float _1221 = in.m_55.x;
    float _1223 = in.m_55.y;
    float _1225 = _1207 * _1211;
    float _1227 = _707 + _931;
    float _1229 = fma(_1149, _1183, _1217);
    float _1231 = _1225 * (-2.0);
    float _1233 = _1227 + (-1.0);
    float _1235 = _931 + (-0.5);
    float _1237 = _1229 * 0.15915493667125701904296875;
    float _1239 = fma(_1231, _1057, _1057);
    float _1241 = fma(_1233, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1243 = rsqrt(_1213);
    float _1245 = fma(_1235, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1239);
    float _1247 = fma(_1241, _1231, _1241);
    float _1249 = _459 * _375;
    float _1251 = in.m_49.w;
    float _1253 = fma(_1149, _1247, _1245);
    int _1255 = as_type<int>(_1209) & 1;
    bool _1257 = _1255 != 0;
    int _1259 = as_type<int>(_1209) & 2;
    bool _1261 = _1259 != 0;
    float _1263 = _1215 * 6.283185482025146484375;
    float _1265 = sin(_1263);
    bool _1267 = _939 > 0.5;
    float _1269 = _1253 * 0.15915493667125701904296875;
    float _1271 = _459 * _363;
    float _1273 = _901 * _1223;
    float _1275 = _459 * _379;
    float _1277 = fma(_457, _383, _1249);
    float _1279 = fma(_457, _385, _1271);
    float _1281 = _1215 * 6.283185482025146484375;
    float _1283 = cos(_1281);
    int _1285 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1287 = _1285 != 0;
    float _1289 = _895 * _1221;
    int _1291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1293 = _1291 != 0;
    float _1295 = _1179 * _1243;
    float _1297 = _1155 * _1243;
    float _1299 = _1201 * _1243;
    float _1301 = _1237 * 6.283185482025146484375;
    float _1303 = cos(_1301);
    bool _1305 = !_1261;
    float _1307 = _1305 ? (-0.5) : 0.5;
    float _1309 = fma(_461, _391, _1277);
    float _1311 = fma(_461, _395, _1279);
    bool _1313 = !_1257;
    float _1315 = _1313 ? (-0.5) : 0.5;
    float _1317 = _1289 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1319 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1307);
    float _1321 = _1311 + _1251;
    float _1323 = _1237 * 6.283185482025146484375;
    float _1325 = sin(_1323);
    float _1327 = _1269 * 6.283185482025146484375;
    float _1329 = cos(_1327);
    float _1331 = fma(_457, _389, _1275);
    float _1333 = _1273 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1335 = _1303 * _1283;
    float _1337 = _1303 * _1265;
    float _1339 = fma(_461, _399, _1331);
    float _1341 = _1333 * _1319;
    float _1343 = _1129 * _1297;
    float _1345 = _1269 * 6.283185482025146484375;
    float _1347 = sin(_1345);
    float _1349 = _1325 * _1265;
    float _1351 = _1325 * _1283;
    float _1353 = _1303 * _1329;
    float _1355 = _1325 * _1329;
    float _1357 = _1283 * _1329;
    float _1359 = _1265 * _1329;
    float _1361 = _1353 * _1107;
    float _1363 = in.m_53.w;
    float _1365 = fma(_1347, _1335, _1349);
    float _1367 = fma(_1347, _1349, _1335);
    float _1369 = -_1337;
    float _1371 = fma(_1347, _1351, _1369);
    float _1373 = -_1351;
    float _1375 = fma(_1347, _1337, _1373);
    float _1377 = -_1343;
    float _1379 = fma(_1131, _1295, _1377);
    float _1381 = _1365 * _1107;
    float _1383 = -_1347;
    float _1385 = fma(_1383, _1299, _1361);
    float _1387 = _1375 * _1107;
    float _1389 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1315);
    float _1391 = fma(_1357, _1299, _1381);
    float _1393 = fma(_1355, _1379, _1385);
    float _1395 = fma(_1359, _1299, _1387);
    float _1397 = _1317 * _1389;
    float _1399 = fma(_1371, _1379, _1391);
    float _1401 = _1341 * _1393;
    float _1403 = fma(_1367, _1379, _1395);
    float _1405 = in.m_51.w;
    float _1407 = fma(_1397, _1399, _1401);
    float _1409 = _1131 * _1299;
    float _1411 = _1353 * _1129;
    float _1413 = _1375 * _1129;
    float _1415 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1417 = _1415 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1419 = -_1409;
    float _1421 = fma(_1107, _1297, _1419);
    float _1423 = _1365 * _1129;
    float _1425 = -_1347;
    float _1427 = fma(_1425, _1295, _1411);
    float _1429 = _1339 + _1363;
    float _1431 = _1353 * _1131;
    float _1433 = 1.0 / _1417;
    float _1435 = fma(_1357, _1295, _1423);
    float _1437 = fma(_1355, _1421, _1427);
    float _1439 = fma(_1359, _1295, _1413);
    float _1441 = fma(_1371, _1421, _1435);
    float _1443 = _1341 * _1437;
    float _1445 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1447 = fma(_1367, _1421, _1439);
    float _1449 = -_1347;
    float _1451 = fma(_1449, _1297, _1431);
    float _1453 = fma(_1397, _1441, _1443);
    float _1455 = fma(_1445, _1403, _1407);
    float _1457 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1459 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1457;
    float _1461 = _1309 + _1405;
    float _1463 = fma(_1445, _1447, _1453);
    float _1465 = _1429 + _1455;
    float _1467 = _1459 * _1433;
    float _1469 = _1365 * _1131;
    float _1471 = _1461 + _1463;
    float _1473 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1475 = _1465 + _1473;
    float _1477 = _1375 * _1131;
    float _1479 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1481 = _929 + _1479;
    float _1483 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1485 = _1471 + _1483;
    float _1487 = _1475 * _1475;
    bool _1489 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1491 = isnan(_929);
    bool _1493 = _1489 || _1491;
    bool _1495 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1497 = _1493 || _1495;
    float _1499 = float(_1497);
    float _1501 = fma(_1357, _1297, _1469);
    int _1503 = _899 + 8;
    uint _1506 = uint(int(uint(_1503) >> uint(2)));
    uint _1508 = uint(int(uint(int(_1506)) >> uint(2)));
    int _1510 = int(_1506) & 3;
    float _1512 = (*spvDescriptorSet0.vp_c9)._m0[int(_1508)][_1510];
    float _1514 = fma(_1485, _1485, _1487);
    float _1516 = _1107 * _1295;
    float _1518 = fma(_1467, _1481, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1520 = fma(_1359, _1297, _1477);
    float _1522 = sqrt(_1514);
    float _1524 = -_1516;
    float _1526 = fma(_1129, _1299, _1524);
    bool _1528 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1530 = isnan(_929);
    bool _1532 = _1528 || _1530;
    bool _1534 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1536 = _1532 || _1534;
    float _1538 = float(_1536);
    uint _1540 = uint(int(uint(_899) >> uint(2)));
    uint _1542 = uint(int(uint(int(_1540)) >> uint(2)));
    int _1544 = int(_1540) & 3;
    float _1546 = (*spvDescriptorSet0.vp_c9)._m0[int(_1542)][_1544];
    int _1548 = int(_1540) + 1;
    uint _1550 = uint(int(uint(_1548) >> uint(2)));
    int _1552 = _1548 & 3;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[int(_1550)][_1552];
    float _1556 = -_1315;
    int _1558 = _1219 ? as_type<int>(_1556) : as_type<int>(_1315);
    float _1560 = fma(_1355, _1526, _1451);
    float _1562 = fma(_1371, _1526, _1501);
    float _1564 = -_1538;
    float _1566 = _1564 + 1.0;
    float _1568 = fma(_1367, _1526, _1520);
    float _1570 = _1341 * _1560;
    bool _1572 = !_1287;
    float _1574 = _1572 ? _1315 : as_type<float>(_1558);
    float _1576 = _1499 * _1566;
    float _1578 = fma(_1397, _1562, _1570);
    float _1580 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1582 = _1518 * _1576;
    bool _1584 = _1522 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1586 = -_1499;
    float _1588 = _1586 + 1.0;
    float _1590 = fma(_1445, _1568, _1578);
    float _1592 = -_1307;
    int _1594 = _1267 ? as_type<int>(_1592) : as_type<int>(_1307);
    float _1596 = _1574 + 0.5;
    float _1598 = fma(_1588, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1582);
    float _1600 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1602 = _1321 + _1590;
    bool _1604 = !_1293;
    float _1606 = _1604 ? _1307 : as_type<float>(_1594);
    float _1608 = fma(_1538, (*spvDescriptorSet0.vp_c9)._m0[116].x, _1598);
    float _1610 = _1451;
    float _1612 = _1471;
    float _1614 = _1465;
    if (!_1584)
    {
        _1610 = _1602;
    }
    float _1616 = _1610;
    bool _1618 = !_1584;
    float _1620 = _1616;
    if (!_1618)
    {
        float _1622 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1624 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1626 = _1522 + _1624;
        float _1628 = rsqrt(_1514);
        float _1630 = _1626 * _1622;
        float _1632 = _1602 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1634 = _1630 * 0.15915493667125701904296875;
        float _1636 = _1634 * 6.283185482025146484375;
        float _1638 = sin(_1636);
        float _1640 = _1634 * 6.283185482025146484375;
        float _1642 = cos(_1640);
        float _1644 = fma(_1638, _1632, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1646 = _1628 * _1644;
        float _1648 = _1642 + (-1.0);
        float _1650 = fma(_1485, _1646, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1652 = fma(_1475, _1646, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1654 = _1648 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1656 = fma(_1602, _1642, _1654);
        _1620 = _1656;
        _1612 = _1650;
        _1614 = _1652;
    }
    float _1658 = _1620;
    float _1660 = _1612;
    float _1662 = _1614;
    float _1664 = -_1321;
    float _1666 = _1664 + _1658;
    float _1668 = -_1606;
    float _1670 = _1668 + 0.5;
    float _1672 = -_1461;
    float _1674 = _1672 + _1660;
    float _1676 = _1596 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1678 = _1666 * _1666;
    float _1680 = _1670 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1682 = -_1429;
    float _1684 = _1682 + _1662;
    float _1686 = _1676 * _1580;
    float _1688 = fma(_1674, _1674, _1678);
    float _1690 = _1680 * _1600;
    float _1692 = _1546 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1694 = fma(_1684, _1684, _1688);
    float _1696 = _1554 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1698 = sqrt(_1694);
    float _1700 = _1512 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1702 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1704 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1706 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1708 = _1692 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1710 = _1696 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1712 = _1702 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1714 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1716 = _1704 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1718 = _1706 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1720 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1722 = _1608 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _1686;
    out.m_64.y = _1690;
    bool _1724 = _1698 > 0.0;
    out.m_66.x = _1712;
    out.m_66.y = _1716;
    out.m_66.z = _1718;
    out.m_66.w = _1714;
    out.m_68.x = _1708;
    out.m_68.y = _1710;
    out.m_68.z = _1720;
    out.m_68.w = _1722;
    bool _1726 = !_1724;
    float _1728 = _1710;
    float _1730 = _1714;
    float _1732 = _1712;
    float _1734 = _1658;
    float _1736 = _1660;
    float _1738 = _1662;
    float _1740 = _1716;
    float _1742 = _1712;
    if (!_1726)
    {
        bool _1744 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1746 = _1716;
        if (_1744)
        {
            float _1748 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1746 = _1748;
        }
        float _1750 = _1746;
        float _1752 = _1750;
        if (_1744)
        {
            float _1754 = _1750 * _637;
            _1728 = _1754;
        }
        float _1756 = _1728;
        float _1758 = _1756;
        if (_1744)
        {
            float _1760 = _1750 * _635;
            _1730 = _1760;
        }
        float _1762 = _1730;
        float _1764 = _1762;
        if (_1744)
        {
            float _1766 = _1750 * _639;
            _1752 = _1766;
        }
        float _1768 = _1752;
        float _1770 = _1768;
        if (!_1744)
        {
            float _1772 = _125 + 1.0;
            float _1774 = _1772;
            if (!_167)
            {
                float _1776 = _1772 * _1772;
                float _1778 = _1776 * 0.5;
                _1732 = _1778;
            }
            float _1780 = _1732;
            float _1782 = _1780;
            if (!_167)
            {
                float _1784 = _1780 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1782 = _1784;
            }
            float _1786 = _1782;
            bool _1788 = !_167;
            float _1790 = _1786;
            if (!_1788)
            {
                float _1792 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1794 = log2(_1792);
                float _1796 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1798 = _1794 * _1772;
                float _1800 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1802 = 1.0 + _1800;
                float _1804 = 1.0 / _1802;
                float _1806 = _1796 * 0.693147182464599609375;
                float _1808 = exp2(_1798);
                float _1810 = 1.0 / _1806;
                float _1812 = _1808 + (-1.0);
                float _1814 = -_1812;
                float _1816 = fma(_1814, _1810, _1772);
                float _1818 = _1816 * _1804;
                float _1820 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1790 = _1820;
            }
            float _1822 = _1790;
            float _1824 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1826 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1828 = !_167;
            if (!_1828)
            {
                float _1830 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1832 = log2(_1830);
                float _1834 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1836 = 1.0 + _1834;
                float _1838 = 1.0 / _1836;
                float _1840 = _1832 * _1772;
                float _1842 = exp2(_1840);
                float _1844 = -_1842;
                float _1846 = _1844 + 1.0;
                float _1848 = _1846 * _1838;
                _1774 = _1848;
            }
            float _1850 = _1774;
            float _1852 = fma(_1850, _153, _1826);
            float _1854 = _1822 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1856 = fma(_1850, _151, _1824);
            float _1858 = -_347;
            float _1860 = _1858 + _1852;
            float _1862 = fma(_1850, _155, _1854);
            float _1864 = -_355;
            float _1866 = _1864 + _1856;
            float _1868 = _1860 * _363;
            float _1870 = -_361;
            float _1872 = _1870 + _1862;
            float _1874 = _1860 * _375;
            float _1876 = _1860 * _379;
            float _1878 = fma(_1866, _385, _1868);
            float _1880 = fma(_1866, _383, _1874);
            float _1882 = fma(_1866, _389, _1876);
            float _1884 = fma(_1872, _395, _1878);
            float _1886 = fma(_1872, _391, _1880);
            float _1888 = fma(_1872, _399, _1882);
            float _1890 = _1884 * _1884;
            float _1892 = fma(_1886, _1886, _1890);
            float _1894 = fma(_1888, _1888, _1892);
            _1187 = _1894;
            _645 = _1884;
            _647 = _1886;
            _649 = _1888;
            _1758 = _1886;
            _1764 = _1884;
            _1770 = _1888;
        }
        float _1896 = _1187;
        float _1898 = _645;
        float _1900 = _647;
        float _1902 = _649;
        float _1904 = _1758;
        float _1906 = _1764;
        float _1908 = _1770;
        float _1910 = sqrt(_1896);
        float _1912 = rsqrt(_1694);
        bool _1914 = _1910 > 0.0;
        float _1916 = _1674 * _1912;
        float _1918 = _1666 * _1912;
        float _1920 = _1684 * _1912;
        bool _1922 = !_1914;
        _1740 = _1908;
        _1742 = _1916;
        if (!_1922)
        {
            float _1924 = rsqrt(_1896);
            float _1926 = _1924 * _1898;
            float _1928 = _1924 * _1900;
            float _1930 = _1924 * _1902;
            float _1932 = _1918 * _1926;
            float _1934 = fma(_1916, _1928, _1932);
            float _1936 = fma(_1920, _1930, _1934);
            float _1938 = _1936 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1940 = fma(_1904, _1938, _1660);
            float _1942 = fma(_1906, _1938, _1658);
            float _1944 = fma(_1908, _1938, _1662);
            _1734 = _1942;
            _1736 = _1940;
            _1738 = _1944;
        }
    }
    float _1946 = _1734;
    float _1948 = _1736;
    float _1950 = _1738;
    float _1952 = _1740;
    float _1954 = _1742;
    float _1956 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1958 = _1946 + _1956;
    float _1960 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1962 = _1948 + _1960;
    float _1964 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1966 = _1950 + _1964;
    float _1968 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1970 = _1958 * _1958;
    float _1972 = fma(_1962, _1962, _1970);
    float _1974 = fma(_1966, _1966, _1972);
    float _1976 = rsqrt(_1974);
    float _1978 = sqrt(_1974);
    float _1980 = _1976 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1982 = _1962 * _1980;
    float _1984 = _1966 * _1980;
    float _1986 = _1982 * _1982;
    float _1988 = _1984 * _1984;
    float _1990 = _1986 + _1988;
    float _1992 = sqrt(_1990);
    bool _1994 = _1992 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1996 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1998 = _1992 + _1996;
    float _2000 = _1976;
    float _2002 = _1998;
    float _2004 = _1952;
    float _2006 = _1958;
    float _2008 = _1980;
    if (_1994)
    {
        float _2010 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2000 = _2010;
    }
    float _2012 = _2000;
    float _2014 = _2012;
    if (_1994)
    {
        float _2016 = _1998 * _2012;
        _2002 = _2016;
    }
    float _2018 = _2002;
    if (_1994)
    {
        float _2020 = rsqrt(_1990);
        _2014 = _2020;
    }
    float _2022 = _2014;
    float _2024 = _2022;
    if (_1994)
    {
        float _2026 = _2018 * 0.15915493667125701904296875;
        _2004 = _2026;
    }
    float _2028 = _2004;
    float _2030 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2032 = _1966;
    float _2034 = _2028;
    if (_1994)
    {
        float _2036 = _2028 * 6.283185482025146484375;
        float _2038 = sin(_2036);
        _2032 = _2038;
    }
    float _2040 = _2032;
    float _2042 = precise::max(0.0, _2030);
    float _2044 = _1954;
    float _2046 = _2042;
    if (_1994)
    {
        float _2048 = _2028 * 6.283185482025146484375;
        float _2050 = cos(_2048);
        _2044 = _2050;
    }
    float _2052 = _2044;
    float _2054 = -_1980;
    float _2056 = -_2042;
    float _2058 = fma(_1958, _2054, _2056);
    if (_1994)
    {
        float _2060 = _2058 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2006 = _2060;
    }
    float _2062 = _2006;
    float _2064 = _2040;
    float _2066 = _2062;
    if (_1994)
    {
        float _2068 = fma(_2040, _2062, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2064 = _2068;
    }
    float _2070 = _2064;
    float _2072 = _2070;
    if (!_1994)
    {
        _2066 = _2058;
    }
    float _2074 = _2066;
    float _2076 = _2074;
    if (_1994)
    {
        float _2078 = _2022 * _2070;
        _2008 = _2078;
    }
    float _2080 = _2008;
    if (!_1994)
    {
        _2024 = _1982;
    }
    float _2082 = _2024;
    float _2084 = _2082;
    float _2086 = _2052;
    if (_1994)
    {
        float _2088 = _2052 + (-1.0);
        _2046 = _2088;
    }
    float _2090 = _2046;
    float _2092 = _2090;
    if (_1994)
    {
        float _2094 = _1982 * _2080;
        _2084 = _2094;
    }
    float _2096 = _2084;
    if (!_1994)
    {
        _2072 = _1986;
    }
    float _2098 = _2072;
    float _2100 = _2098;
    if (_1994)
    {
        float _2102 = _2090 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2034 = _2102;
    }
    float _2104 = _2034;
    if (!_1994)
    {
        _2092 = _1984;
    }
    float _2106 = _2092;
    float _2108 = _2106;
    if (_1994)
    {
        float _2110 = _1984 * _2080;
        _2108 = _2110;
    }
    float _2112 = _2108;
    if (_1994)
    {
        float _2114 = _2096 * _2096;
        _2100 = _2114;
    }
    float _2116 = _2100;
    if (_1994)
    {
        float _2118 = fma(_2058, _2052, _2104);
        _2076 = _2118;
    }
    float _2120 = _2076;
    if (!_1994)
    {
        _2086 = _1988;
    }
    float _2122 = _2086;
    float _2124 = _2122;
    if (_1994)
    {
        float _2126 = _2112 * _2112;
        _2124 = _2126;
    }
    float _2128 = _2124;
    float _2130 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2132 = fma(_2120, _2120, _2116);
    float _2134 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2130);
    float _2136 = _2132 + _2128;
    float _2138 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2140 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2142 = fma(_1978, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2140);
    float _2144 = precise::clamp(_2142, 0.0, 1.0);
    float _2146 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2134);
    float _2148 = rsqrt(_2136);
    float _2150 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2152 = -_2144;
    float _2154 = _2152 + 1.0;
    float _2156 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2138);
    float _2158 = _2146 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2160 = _1946 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2162 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2150);
    float _2164 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2156);
    float _2166 = abs(_2154);
    float _2168 = log2(_2166);
    float _2170 = _2158 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2172 = fma(_1948, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2160);
    float _2174 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2162);
    float _2176 = _2164 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2178 = -_2170;
    float _2180 = fma(_2178, _1968, 1.0);
    float _2182 = fma(_1950, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2172);
    float _2184 = _2174 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2186 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2188 = _2148 * _2096;
    float _2190 = _2148 * _2120;
    float _2192 = _2148 * _2112;
    float _2194 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2186);
    float _2196 = _2188 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2198 = _2182 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2200 = log2(_2180);
    float _2202 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2204 = -_2196;
    float _2206 = fma(_2190, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2204);
    float _2208 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2194);
    float _2210 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2212 = -_2192;
    float _2214 = fma(_2212, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2206);
    float _2216 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2208);
    float _2218 = exp2(_2202);
    float _2220 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2222 = fma(_2214, -0.5, 0.5);
    float _2224 = fma(_2214, 0.5, 0.5);
    float _2226 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2210);
    float _2228 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2220);
    float _2230 = _2190 + 1.0;
    float _2232 = fma(_2224, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2234 = 1.0 / _2216;
    float _2236 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2228);
    float _2238 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2226);
    float _2240 = fma(_2224, _2232, -0.212114393711090087890625);
    float _2242 = _2200 * 0.693147182464599609375;
    float _2244 = fma(_2224, _2240, 1.570728778839111328125);
    float _2246 = sqrt(_2222);
    float _2248 = -_2190;
    float _2250 = fma(_2218, _2230, _2248);
    float _2252 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2236);
    float _2254 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2238);
    float _2256 = _2242 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2258 = _2252 * _2234;
    float _2260 = _2254 * _2234;
    float _2262 = fma(_2258, 0.5, 0.5);
    float _2264 = fma(_2260, -0.5, 0.5);
    float _2266 = fma(_2250, 0.5, 0.5);
    float _2268 = _2246 * 0.636619746685028076171875;
    float3 _5747 = float3(_2262, _2264, _2256);
    float _2270 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5747, float3(0.0), isnan(_5747)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5747, float3(0.0), isnan(_5747)), level(0.0)).x;
    float3 _5758 = float3(_2262, _2264, _2256);
    float4 _2273 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5758, float3(0.0), isnan(_5758)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5758, float3(0.0), isnan(_5758)), level(0.0)).xyzw;
    float _2275 = _2273.x;
    float _2277 = _2273.y;
    float _2279 = _2273.z;
    float _2281 = _2273.w;
    float _2283 = -_2244;
    float _2285 = fma(_2268, _2283, 1.0);
    float2 _5780 = float2(_2285, _2266);
    float3 _2289 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5780, float2(0.0), isnan(_5780)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5780, float2(0.0), isnan(_5780)), level(0.0)).xyz;
    float _2291 = _2289.x;
    float _2293 = _2289.y;
    float _2295 = _2289.z;
    float _2297 = _2176 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2299 = _2168 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2301 = _2252 + _2216;
    float _2303 = fma(_2184, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2297);
    float _2305 = _2301 * 0.5;
    float _2307 = exp2(_2299);
    float _2309 = fma(_2158, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2303);
    float _2311 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2309);
    float _2313 = _2216 * 0.5;
    float _2315 = _2311 + _2216;
    float _2317 = fma(_2254, -0.5, _2313);
    out.gl_Position.x = _2252;
    out.gl_Position.y = _2254;
    out.gl_Position.z = _2311;
    out.gl_Position.w = _2216;
    float _2319 = _2315 * 0.5;
    float _2321 = -_2307;
    float _2323 = _2321 + 1.0;
    out.m_70.x = _2305;
    out.m_70.y = _2317;
    out.m_70.z = _2319;
    out.m_70.w = _2216;
    float _2325 = _2323 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2327 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_45.x = _2327;
    float _2329 = _2325 * _2270;
    float _2331 = -_2325;
    float _2333 = _2331 + 1.0;
    float _2335 = _2281 * _2329;
    float _2337 = _2281 * _2333;
    float _2339 = _2295 * _2329;
    float _2341 = fma(_2291, _2335, _2275);
    float _2343 = fma(_2293, _2335, _2277);
    float _2345 = fma(_2281, _2339, _2279);
    out.m_72.x = _2341;
    out.m_72.y = _2343;
    out.m_72.z = _2345;
    out.m_72.w = _2337;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

