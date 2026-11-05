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
    float4 m_62 [[attribute(4)]];
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
        float _2546 = as_type<float>(_107);
        out.gl_Position.z = _2546;
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
        float _2617 = as_type<float>(_147);
        out.gl_Position.z = _2617;
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
    float _399 = in.m_55.w;
    bool _401 = _387 >= 9.9999999747524270787835121154785e-07;
    bool _403 = isnan(_387);
    bool _405 = _401 || _403;
    bool _407 = isnan(9.9999999747524270787835121154785e-07);
    bool _409 = _405 || _407;
    float _411 = _359 * _379;
    float _413 = _363 * _363;
    float _415 = in.m_53.z;
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
    float _441 = _399;
    if (_409)
    {
        _437 = _433;
    }
    float _443 = _437;
    float _445 = fma(_373, _415, _431);
    float _447 = _443;
    float _449 = _445;
    float _451 = _443;
    float _453 = _445;
    if (_409)
    {
        _439 = _435;
    }
    float _455 = _439;
    float _457 = fma(_349, _399, _421);
    float _459 = fma(_345, _399, _423);
    float _461 = fma(_353, _399, _425);
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
            float _487 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[16].z, _481);
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
                    float _583 = fma(_425, _415, _577);
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
                float _617 = fma(_155, _415, _611);
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
    float _687 = in.m_57.x;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _705 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _707 = isnan(_677);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = 1.0 / _691;
    bool _719 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _721 = isnan(_677);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    bool _731 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _733 = isnan(_677);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = 1.0 / _695;
    bool _745 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _747 = 1.0 / _703;
    float _749 = _681 * _717;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _753 = _677 + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _757 = _677 + _755;
    float _759 = 1.0 / _699;
    float _761 = _753 * _743;
    float _763 = _685 * _747;
    bool _765 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _767 = isnan(_677);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -_775;
    float _779 = _777 + 1.0;
    float _781 = _757 * _759;
    bool _783 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _785 = isnan(_677);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -_715;
    float _797 = _795 + 1.0;
    float _799 = -_793;
    float _801 = _799 + 1.0;
    float _803 = _775 * _797;
    float _805 = _793 * _779;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _819 = _729 * _801;
    float _821 = -_729;
    float _823 = _821 + 1.0;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _825;
    float _829 = fma(_813, _761, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _831 = fma(_817, _761, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _833 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _835 = fma(_809, _749, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _837 = _741 * _823;
    float _839 = fma(_827, _749, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _841 = -_741;
    float _843 = _841 + 1.0;
    float _845 = _833 * _687;
    float _847 = _835 * _837;
    float _849 = _839 * _837;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _855;
    float _859 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[143].x, _847);
    float _861 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[143].y, _849);
    float _863 = trunc(_845);
    int _865 = int(_863);
    float _867 = fma(_853, _781, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _869 = fma(_857, _781, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _871 = fma(_829, _819, _859);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _881 = fma(_831, _819, _861);
    float _883 = fma(_867, _805, _871);
    float _885 = fma(_875, _763, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _887 = fma(_879, _763, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _889 = fma(_869, _805, _881);
    float _891 = fma(_885, _803, _883);
    float _893 = fma(_887, _803, _889);
    float _895 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[147].x, _891);
    int _897 = _865 << 4;
    int _899 = _897 + 1712;
    float _901 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[147].y, _893);
    bool _903 = !_745;
    float _919;
    if (!_903)
    {
        float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _907 = _687 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
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
    float _933 = _687 * 2.0;
    float _935 = _635 * _635;
    float _937 = in.m_57.y;
    float _939 = _687 + (-0.5);
    float _941 = floor(_933);
    float _943 = as_type<float>(int(gl_VertexIndex));
    float _945 = fma(_637, _637, _935);
    bool _947 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _949 = isnan(_929);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _967 = 1.0 / _961;
    bool _969 = _941 > 0.0;
    float _971 = _931 * 2.0;
    bool _973 = _941 >= 0.0;
    bool _975 = isnan(_941);
    bool _977 = _973 || _975;
    bool _979 = isnan(0.0);
    bool _981 = _977 || _979;
    float _983 = _937 * 2.0;
    int _985 = _981 ? 0 : 1;
    float _987 = floor(_971);
    int _989 = ~_985;
    int _991 = _989 + 1;
    int _993 = _991 + 1;
    int _995 = _993;
    if (!_969)
    {
        int _997 = ~_985;
        int _999 = _997 + 1;
        _995 = _999;
    }
    int _1001 = _995;
    float _1003 = floor(_983);
    bool _1005 = _987 >= 0.0;
    bool _1007 = isnan(_987);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan(0.0);
    bool _1013 = _1009 || _1011;
    float _1015 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1017 = log2(_1015);
    bool _1019 = _987 > 0.0;
    int _1021 = _1013 ? 0 : 1;
    bool _1023 = _1003 > 0.0;
    float _1025 = 1.0 / _965;
    bool _1027 = _1003 >= 0.0;
    bool _1029 = isnan(_1003);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan(0.0);
    bool _1035 = _1031 || _1033;
    int _1037 = ~_1021;
    int _1039 = _1037 + 1;
    int _1041 = _1039 + 1;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1045 = _1043 != 0;
    int _1047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1049 = _1047 != 0;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1053 = _1051 != 0;
    int _1055 = _1035 ? 0 : 1;
    int _1057 = _1041;
    if (!_1019)
    {
        int _1059 = ~_1021;
        int _1061 = _1059 + 1;
        _1057 = _1061;
    }
    int _1063 = _1057;
    bool _1065 = !_1049;
    int _1067 = _1065 ? 0 : 1;
    int _1069 = ~_1055;
    int _1071 = _1069 + 1;
    int _1073 = _1071 + 1;
    int _1075 = _1073;
    if (!_1023)
    {
        int _1077 = ~_1055;
        int _1079 = _1077 + 1;
        _1075 = _1079;
    }
    int _1081 = _1075;
    int _1083 = abs(_1067);
    float _1085 = _937 + _931;
    int _1087 = as_type<int>(_943) & 1;
    bool _1089 = _1087 != 0;
    int _1091 = as_type<int>(_943) & 2;
    bool _1093 = _1091 != 0;
    float _1095 = _125 * _1017;
    float _1097 = float(_1001);
    float _1099 = _1085 + (-1.0);
    float _1101 = float(_1083);
    float _1103 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1105 = !_1045;
    int _1107 = _1105 ? 0 : 1;
    float _1109 = exp2(_1095);
    float _1111 = _1101 * _1097;
    bool _1113 = !_1053;
    int _1115 = _1113 ? 0 : 1;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1119 = 1.0 + _1117;
    int _1121 = abs(_1107);
    float _1123 = in.m_62.x;
    float _1125 = in.m_62.y;
    float _1127 = in.m_62.z;
    int _1129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1131 = _1129 != 0;
    float _1133 = 1.0 / _1119;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1137 = _1135 != 0;
    float _1139 = fma(_639, _639, _945);
    int _1141 = abs(_1115);
    float _1143 = _687 + _937;
    float _1145 = _1111 * (-2.0);
    float _1147 = float(_1063);
    float _1149 = rsqrt(_1139);
    float _1151 = float(_1121);
    float _1153 = -_1109;
    float _1155 = _1153 + 1.0;
    bool _1157 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1159 = isnan(0.0);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1165 = _1161 || _1163;
    float _1167 = _1143 + (-1.0);
    float _1169 = float(_1141);
    float _1171 = _1151 * _1147;
    float _1173 = _1165 ? _1155 : 0.0;
    float _1175 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1177 = float(_1081);
    float _1179 = _1171 * (-2.0);
    bool _1181 = _937 > 0.5;
    float _1183 = _1173 * _1133;
    bool _1185 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1187 = isnan(1.0);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1193 = _1189 || _1191;
    float _1195 = _1169 * _1177;
    float _1197 = fma(_1175, _1179, _1175);
    float _1199 = _1149 * _639;
    float _1201 = _1149 * _637;
    float _1203 = fma(_1145, _1125, _1125);
    float _1205 = _1149 * _635;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1209 = _1199 * _1207;
    float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1213 = _1201 * _1211;
    float _1215 = fma(_1103, _1145, _1103);
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1219 = _1205 * _1217;
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1223 = -_1209;
    float _1225 = fma(_1201, _1221, _1223);
    float _1227 = _937 + (-0.5);
    float _1229 = fma(_1179, _1123, _1123);
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1233 = -_1213;
    float _1235 = fma(_1205, _1231, _1233);
    bool _1237 = !_1193;
    float _1239 = _1237 ? _125 : _1183;
    float _1241 = in.m_55.x;
    float _1243 = in.m_55.y;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1247 = -_1219;
    float _1249 = fma(_1199, _1245, _1247);
    float _1251 = _1225 * _1225;
    float _1253 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1203);
    bool _1255 = _687 > 0.5;
    float _1257 = _687 + _931;
    float _1259 = fma(_1249, _1249, _1251);
    float _1261 = fma(_1239, _1215, _1253);
    float _1263 = _459 * _363;
    float _1265 = fma(_1235, _1235, _1259);
    float _1267 = _1261 * 0.15915493667125701904296875;
    float _1269 = _459 * _375;
    float _1271 = _459 * _379;
    float _1273 = _1257 + (-1.0);
    float _1275 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1229);
    float _1277 = _1195 * (-2.0);
    float _1279 = fma(_457, _383, _1269);
    float _1281 = fma(_457, _385, _1263);
    float _1283 = fma(_457, _389, _1271);
    float _1285 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1287 = fma(_1239, _1197, _1275);
    float _1289 = fma(_1277, _1127, _1127);
    float _1291 = in.m_51.w;
    float _1293 = _931 + (-0.5);
    float _1295 = _1287 * 0.15915493667125701904296875;
    float _1297 = fma(_1285, _1277, _1285);
    float _1299 = _895 * _1241;
    float _1301 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1289);
    float _1303 = _901 * _1243;
    float _1305 = in.m_53.w;
    float _1307 = rsqrt(_1265);
    float _1309 = fma(_1239, _1297, _1301);
    float _1311 = in.m_49.w;
    float _1313 = fma(_461, _391, _1279);
    float _1315 = _1309 * 0.15915493667125701904296875;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1317;
    float _1321 = _1267 * 6.283185482025146484375;
    float _1323 = sin(_1321);
    float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1327 = _1325 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1329 = fma(_461, _395, _1281);
    float _1331 = _1319 * _967;
    float _1333 = fma(_461, _415, _1283);
    float _1335 = _1327 * _1025;
    bool _1337 = !_1089;
    float _1339 = _1337 ? (-0.5) : 0.5;
    float _1341 = _1299 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1343 = _1267 * 6.283185482025146484375;
    float _1345 = cos(_1343);
    float _1347 = _1313 + _1291;
    float _1349 = _1249 * _1307;
    float _1351 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1339);
    float _1353 = _1225 * _1307;
    float _1355 = _1235 * _1307;
    bool _1357 = !_1093;
    float _1359 = _1357 ? (-0.5) : 0.5;
    float _1361 = _1333 + _1305;
    float _1363 = _1295 * 6.283185482025146484375;
    float _1365 = sin(_1363);
    float _1367 = _1341 * _1351;
    float _1369 = _1303 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1371 = _1329 + _1311;
    float _1373 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1359);
    float _1375 = _1205 * _1355;
    float _1377 = -_1339;
    int _1379 = _1255 ? as_type<int>(_1377) : as_type<int>(_1339);
    float _1381 = _1315 * 6.283185482025146484375;
    float _1383 = cos(_1381);
    float _1385 = _1369 * _1373;
    float _1387 = -_1375;
    float _1389 = fma(_1199, _1353, _1387);
    bool _1391 = !_1131;
    float _1393 = _1391 ? _1339 : as_type<float>(_1379);
    float _1395 = _1295 * 6.283185482025146484375;
    float _1397 = cos(_1395);
    float _1399 = _1365 * _1323;
    float _1401 = _1365 * _1345;
    float _1403 = _1393 + 0.5;
    float _1405 = _1315 * 6.283185482025146484375;
    float _1407 = sin(_1405);
    float _1409 = _1365 * _1383;
    float _1411 = _1397 * _1345;
    float _1413 = _1397 * _1323;
    float _1415 = _1397 * _1383;
    float _1417 = _1345 * _1383;
    float _1419 = _1323 * _1383;
    float _1421 = _1201 * _1353;
    float _1423 = _1415 * _1201;
    float _1425 = fma(_1407, _1411, _1399);
    float _1427 = fma(_1407, _1399, _1411);
    float _1429 = -_1413;
    float _1431 = fma(_1407, _1401, _1429);
    float _1433 = -_1401;
    float _1435 = fma(_1407, _1413, _1433);
    float _1437 = _1415 * _1199;
    float _1439 = -_1407;
    float _1441 = fma(_1439, _1349, _1423);
    float _1443 = _1425 * _1201;
    float _1445 = -_1421;
    float _1447 = fma(_1205, _1349, _1445);
    float _1449 = -_1407;
    float _1451 = fma(_1449, _1355, _1437);
    float _1453 = _1425 * _1199;
    float _1455 = fma(_1417, _1349, _1443);
    float _1457 = _1435 * _1201;
    float _1459 = fma(_1409, _1447, _1451);
    float _1461 = fma(_1417, _1355, _1453);
    float _1463 = _1435 * _1199;
    float _1465 = fma(_1409, _1389, _1441);
    float _1467 = _1385 * _1459;
    float _1469 = fma(_1431, _1447, _1461);
    float _1471 = fma(_1419, _1349, _1457);
    float _1473 = fma(_1419, _1355, _1463);
    float _1475 = fma(_1431, _1389, _1455);
    float _1477 = fma(_1367, _1469, _1467);
    float _1479 = fma(_1427, _1389, _1471);
    float _1481 = _1385 * _1465;
    float _1483 = fma(_1427, _1447, _1473);
    float _1485 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1489 = _929 + _1487;
    float _1491 = fma(_1367, _1475, _1481);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1495 = _929 + _1493;
    float _1497 = fma(_1485, _1483, _1477);
    float _1499 = fma(_1331, _1489, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1501 = fma(_1485, _1479, _1491);
    float _1503 = fma(_1335, _1495, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1505 = _1361 + _1497;
    int _1507 = _899 + 8;
    uint _1510 = uint(int(uint(_1507) >> uint(2)));
    uint _1512 = uint(int(uint(int(_1510)) >> uint(2)));
    int _1514 = int(_1510) & 3;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[int(_1512)][_1514];
    float _1518 = _1347 + _1501;
    float _1520 = _1199 * _1349;
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1524 = _1505 + _1522;
    bool _1526 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1528 = isnan(_929);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1540 = _1518 + _1538;
    bool _1542 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1544 = isnan(_929);
    bool _1546 = _1542 || _1544;
    bool _1548 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1550 = _1546 || _1548;
    float _1552 = float(_1550);
    float _1554 = _1524 * _1524;
    uint _1556 = uint(int(uint(_899) >> uint(2)));
    uint _1558 = uint(int(uint(int(_1556)) >> uint(2)));
    int _1560 = int(_1556) & 3;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[int(_1558)][_1560];
    int _1564 = int(_1556) + 1;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    int _1568 = _1564 & 3;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[int(_1566)][_1568];
    float _1572 = _1415 * _1205;
    float _1574 = -_1536;
    float _1576 = _1574 + 1.0;
    float _1578 = fma(_1540, _1540, _1554);
    float _1580 = -_1520;
    float _1582 = fma(_1201, _1355, _1580);
    float _1584 = _1425 * _1205;
    float _1586 = -_1407;
    float _1588 = fma(_1586, _1353, _1572);
    float _1590 = sqrt(_1578);
    float _1592 = _957 * _1576;
    float _1594 = _1435 * _1205;
    float _1596 = fma(_1417, _1353, _1584);
    float _1598 = fma(_1409, _1582, _1588);
    float _1600 = -_957;
    float _1602 = _1600 + 1.0;
    float _1604 = fma(_1419, _1353, _1594);
    float _1606 = fma(_1431, _1582, _1596);
    float _1608 = _1385 * _1598;
    float _1610 = _1552 * _1602;
    float _1612 = fma(_1427, _1582, _1604);
    float _1614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1616 = fma(_1367, _1606, _1608);
    float _1618 = _1499 * _1610;
    float _1620 = -_1552;
    float _1622 = _1620 + 1.0;
    bool _1624 = _1590 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1626 = fma(_1485, _1612, _1616);
    float _1628 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1618);
    float _1630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1632 = -_1359;
    int _1634 = _1181 ? as_type<int>(_1632) : as_type<int>(_1359);
    float _1636 = _1371 + _1626;
    float _1638 = fma(_1503, _1592, _1628);
    bool _1640 = !_1137;
    float _1642 = _1640 ? _1359 : as_type<float>(_1634);
    float _1644 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1638);
    float _1646 = _1626;
    float _1648 = _1518;
    float _1650 = _1505;
    float _1652 = _1139;
    if (!_1624)
    {
        _1646 = _1636;
    }
    float _1654 = _1646;
    bool _1656 = !_1624;
    float _1658 = _1654;
    if (!_1656)
    {
        float _1660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1664 = _1590 + _1662;
        float _1666 = rsqrt(_1578);
        float _1668 = _1664 * _1660;
        float _1670 = _1636 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1672 = _1668 * 0.15915493667125701904296875;
        float _1674 = _1672 * 6.283185482025146484375;
        float _1676 = sin(_1674);
        float _1678 = _1672 * 6.283185482025146484375;
        float _1680 = cos(_1678);
        float _1682 = fma(_1676, _1670, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1684 = _1666 * _1682;
        float _1686 = _1680 + (-1.0);
        float _1688 = fma(_1540, _1684, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1690 = fma(_1524, _1684, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1692 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1694 = fma(_1636, _1680, _1692);
        _1658 = _1694;
        _1648 = _1688;
        _1650 = _1690;
    }
    float _1696 = _1658;
    float _1698 = _1648;
    float _1700 = _1650;
    float _1702 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1704 = -_1371;
    float _1706 = _1704 + _1696;
    float _1708 = -_1642;
    float _1710 = _1708 + 0.5;
    float _1712 = -_1347;
    float _1714 = _1712 + _1698;
    float _1716 = _1702 * _1614;
    float _1718 = _1706 * _1706;
    float _1720 = _1710 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1722 = -_1361;
    float _1724 = _1722 + _1700;
    float _1726 = fma(_1714, _1714, _1718);
    float _1728 = _1720 * _1630;
    float _1730 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1732 = fma(_1724, _1724, _1726);
    float _1734 = _1562 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1736 = _1570 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1738 = sqrt(_1732);
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1746 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1748 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1750 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1756 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1758 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1760 = _1644 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _1716;
    out.m_64.y = _1728;
    bool _1762 = _1738 > 0.0;
    out.m_66.x = _1750;
    out.m_66.y = _1752;
    out.m_66.z = _1756;
    out.m_66.w = _1754;
    out.m_68.x = _1746;
    out.m_68.y = _1748;
    out.m_68.z = _1758;
    out.m_68.w = _1760;
    bool _1764 = !_1762;
    float _1766 = _1750;
    float _1768 = _1754;
    float _1770 = _1696;
    float _1772 = _1698;
    float _1774 = _1700;
    float _1776 = _1752;
    float _1778 = _1750;
    if (!_1764)
    {
        bool _1780 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1782 = _1752;
        if (_1780)
        {
            float _1784 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1782 = _1784;
        }
        float _1786 = _1782;
        float _1788 = _1786;
        if (_1780)
        {
            float _1790 = _1786 * _637;
            _1766 = _1790;
        }
        float _1792 = _1766;
        float _1794 = _1792;
        float _1796 = _1792;
        if (_1780)
        {
            float _1798 = _1786 * _635;
            _1768 = _1798;
        }
        float _1800 = _1768;
        float _1802 = _1800;
        if (_1780)
        {
            float _1804 = _1786 * _639;
            _1788 = _1804;
        }
        float _1806 = _1788;
        float _1808 = _1806;
        if (!_1780)
        {
            float _1810 = _125 + 1.0;
            float _1812 = _1810;
            if (!_167)
            {
                float _1814 = _1810 * _1810;
                float _1816 = _1814 * 0.5;
                _1794 = _1816;
            }
            float _1818 = _1794;
            float _1820 = _1818;
            if (!_167)
            {
                float _1822 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1820 = _1822;
            }
            float _1824 = _1820;
            bool _1826 = !_167;
            float _1828 = _1824;
            if (!_1826)
            {
                float _1830 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1832 = log2(_1830);
                float _1834 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1836 = _1832 * _1810;
                float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1840 = 1.0 + _1838;
                float _1842 = 1.0 / _1840;
                float _1844 = _1834 * 0.693147182464599609375;
                float _1846 = exp2(_1836);
                float _1848 = 1.0 / _1844;
                float _1850 = _1846 + (-1.0);
                float _1852 = -_1850;
                float _1854 = fma(_1852, _1848, _1810);
                float _1856 = _1854 * _1842;
                float _1858 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1828 = _1858;
            }
            float _1860 = _1828;
            float _1862 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1864 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1866 = !_167;
            if (!_1866)
            {
                float _1868 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1870 = log2(_1868);
                float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1874 = 1.0 + _1872;
                float _1876 = 1.0 / _1874;
                float _1878 = _1870 * _1810;
                float _1880 = exp2(_1878);
                float _1882 = -_1880;
                float _1884 = _1882 + 1.0;
                float _1886 = _1884 * _1876;
                _1812 = _1886;
            }
            float _1888 = _1812;
            float _1890 = fma(_1888, _153, _1864);
            float _1892 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1894 = fma(_1888, _151, _1862);
            float _1896 = -_347;
            float _1898 = _1896 + _1890;
            float _1900 = fma(_1888, _155, _1892);
            float _1902 = -_355;
            float _1904 = _1902 + _1894;
            float _1906 = _1898 * _363;
            float _1908 = -_361;
            float _1910 = _1908 + _1900;
            float _1912 = _1898 * _375;
            float _1914 = _1898 * _379;
            float _1916 = fma(_1904, _385, _1906);
            float _1918 = fma(_1904, _383, _1912);
            float _1920 = fma(_1904, _389, _1914);
            float _1922 = fma(_1910, _395, _1916);
            float _1924 = fma(_1910, _391, _1918);
            float _1926 = fma(_1910, _415, _1920);
            float _1928 = _1922 * _1922;
            float _1930 = fma(_1924, _1924, _1928);
            float _1932 = fma(_1926, _1926, _1930);
            _1652 = _1932;
            _645 = _1922;
            _647 = _1924;
            _649 = _1926;
            _1796 = _1924;
            _1802 = _1922;
            _1808 = _1926;
        }
        float _1934 = _1652;
        float _1936 = _645;
        float _1938 = _647;
        float _1940 = _649;
        float _1942 = _1796;
        float _1944 = _1802;
        float _1946 = _1808;
        float _1948 = sqrt(_1934);
        float _1950 = rsqrt(_1732);
        bool _1952 = _1948 > 0.0;
        float _1954 = _1714 * _1950;
        float _1956 = _1706 * _1950;
        float _1958 = _1724 * _1950;
        bool _1960 = !_1952;
        _1776 = _1946;
        _1778 = _1942;
        if (!_1960)
        {
            float _1962 = rsqrt(_1934);
            float _1964 = _1962 * _1936;
            float _1966 = _1962 * _1938;
            float _1968 = _1962 * _1940;
            float _1970 = _1956 * _1964;
            float _1972 = fma(_1954, _1966, _1970);
            float _1974 = fma(_1958, _1968, _1972);
            float _1976 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1978 = fma(_1942, _1976, _1698);
            float _1980 = fma(_1944, _1976, _1696);
            float _1982 = fma(_1946, _1976, _1700);
            _1770 = _1980;
            _1772 = _1978;
            _1774 = _1982;
        }
    }
    float _1984 = _1770;
    float _1986 = _1772;
    float _1988 = _1774;
    float _1990 = _1776;
    float _1992 = _1778;
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1996 = _1984 + _1994;
    float _1998 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2000 = _1986 + _1998;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2004 = _1988 + _2002;
    float _2006 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2008 = _1996 * _1996;
    float _2010 = fma(_2000, _2000, _2008);
    float _2012 = fma(_2004, _2004, _2010);
    float _2014 = rsqrt(_2012);
    float _2016 = sqrt(_2012);
    float _2018 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2020 = _2000 * _2018;
    float _2022 = _2004 * _2018;
    float _2024 = _2020 * _2020;
    float _2026 = _2022 * _2022;
    float _2028 = _2024 + _2026;
    float _2030 = sqrt(_2028);
    bool _2032 = _2030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2036 = _2030 + _2034;
    float _2038 = _2014;
    float _2040 = _2036;
    float _2042 = _1990;
    float _2044 = _1996;
    float _2046 = _2018;
    if (_2032)
    {
        float _2048 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2038 = _2048;
    }
    float _2050 = _2038;
    float _2052 = _2050;
    if (_2032)
    {
        float _2054 = _2036 * _2050;
        _2040 = _2054;
    }
    float _2056 = _2040;
    if (_2032)
    {
        float _2058 = rsqrt(_2028);
        _2052 = _2058;
    }
    float _2060 = _2052;
    float _2062 = _2060;
    if (_2032)
    {
        float _2064 = _2056 * 0.15915493667125701904296875;
        _2042 = _2064;
    }
    float _2066 = _2042;
    float _2068 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2070 = _2004;
    float _2072 = _2066;
    if (_2032)
    {
        float _2074 = _2066 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        _2070 = _2076;
    }
    float _2078 = _2070;
    float _2080 = precise::max(0.0, _2068);
    float _2082 = _1992;
    float _2084 = _2080;
    if (_2032)
    {
        float _2086 = _2066 * 6.283185482025146484375;
        float _2088 = cos(_2086);
        _2082 = _2088;
    }
    float _2090 = _2082;
    float _2092 = -_2018;
    float _2094 = -_2080;
    float _2096 = fma(_1996, _2092, _2094);
    if (_2032)
    {
        float _2098 = _2096 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2044 = _2098;
    }
    float _2100 = _2044;
    float _2102 = _2078;
    float _2104 = _2100;
    if (_2032)
    {
        float _2106 = fma(_2078, _2100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2102 = _2106;
    }
    float _2108 = _2102;
    float _2110 = _2108;
    if (!_2032)
    {
        _2104 = _2096;
    }
    float _2112 = _2104;
    float _2114 = _2112;
    if (_2032)
    {
        float _2116 = _2060 * _2108;
        _2046 = _2116;
    }
    float _2118 = _2046;
    if (!_2032)
    {
        _2062 = _2020;
    }
    float _2120 = _2062;
    float _2122 = _2120;
    float _2124 = _2090;
    if (_2032)
    {
        float _2126 = _2090 + (-1.0);
        _2084 = _2126;
    }
    float _2128 = _2084;
    float _2130 = _2128;
    if (_2032)
    {
        float _2132 = _2020 * _2118;
        _2122 = _2132;
    }
    float _2134 = _2122;
    if (!_2032)
    {
        _2110 = _2024;
    }
    float _2136 = _2110;
    float _2138 = _2136;
    if (_2032)
    {
        float _2140 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2072 = _2140;
    }
    float _2142 = _2072;
    if (!_2032)
    {
        _2130 = _2022;
    }
    float _2144 = _2130;
    float _2146 = _2144;
    if (_2032)
    {
        float _2148 = _2022 * _2118;
        _2146 = _2148;
    }
    float _2150 = _2146;
    if (_2032)
    {
        float _2152 = _2134 * _2134;
        _2138 = _2152;
    }
    float _2154 = _2138;
    if (_2032)
    {
        float _2156 = fma(_2096, _2090, _2142);
        _2114 = _2156;
    }
    float _2158 = _2114;
    if (!_2032)
    {
        _2124 = _2026;
    }
    float _2160 = _2124;
    float _2162 = _2160;
    if (_2032)
    {
        float _2164 = _2150 * _2150;
        _2162 = _2164;
    }
    float _2166 = _2162;
    float _2168 = fma(_2158, _2158, _2154);
    float _2170 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2172 = _2168 + _2166;
    float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2176 = fma(_2016, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2174);
    float _2178 = precise::clamp(_2176, 0.0, 1.0);
    float _2180 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2170);
    float _2182 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2184 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2186 = -_2178;
    float _2188 = _2186 + 1.0;
    float _2190 = rsqrt(_2172);
    float _2192 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2180);
    float _2194 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2182);
    float _2196 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2198 = _2192 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2200 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2184);
    float _2202 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2194);
    float _2204 = abs(_2188);
    float _2206 = log2(_2204);
    float _2208 = _2198 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2210 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2200);
    float _2212 = _2202 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2214 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2196);
    float _2216 = -_2208;
    float _2218 = fma(_2216, _2006, 1.0);
    float _2220 = _2210 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2222 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2224 = _2190 * _2134;
    float _2226 = _2190 * _2158;
    float _2228 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2214);
    float _2230 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2222);
    float _2232 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2234 = _2190 * _2150;
    float _2236 = _2228 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2238 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2230);
    float _2240 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2242 = -_2232;
    float _2244 = fma(_2226, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2242);
    float _2246 = log2(_2218);
    float _2248 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2238);
    float _2250 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2252 = -_2234;
    float _2254 = fma(_2252, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2244);
    float _2256 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2258 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2250);
    float _2260 = fma(_2254, -0.5, 0.5);
    float _2262 = exp2(_2240);
    float _2264 = fma(_2254, 0.5, 0.5);
    float _2266 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2256);
    float _2268 = _2226 + 1.0;
    float _2270 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2258);
    float _2272 = fma(_2264, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2274 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2266);
    float _2276 = 1.0 / _2248;
    float _2278 = fma(_2264, _2272, -0.212114393711090087890625);
    float _2280 = _2246 * 0.693147182464599609375;
    float _2282 = fma(_2264, _2278, 1.570728778839111328125);
    float _2284 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2286 = sqrt(_2260);
    float _2288 = -_2226;
    float _2290 = fma(_2262, _2268, _2288);
    float _2292 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2274);
    float _2294 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2270);
    float _2296 = fma(_2290, 0.5, 0.5);
    float _2298 = _2292 * _2276;
    float _2300 = _2294 * _2276;
    float _2302 = fma(_2298, 0.5, 0.5);
    float _2304 = fma(_2300, -0.5, 0.5);
    float _2306 = _2286 * 0.636619746685028076171875;
    float3 _5950 = float3(_2302, _2304, _2284);
    float _2308 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5950, float3(0.0), isnan(_5950)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5950, float3(0.0), isnan(_5950)), level(0.0)).x;
    float3 _5961 = float3(_2302, _2304, _2284);
    float4 _2311 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5961, float3(0.0), isnan(_5961)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5961, float3(0.0), isnan(_5961)), level(0.0)).xyzw;
    float _2313 = _2311.x;
    float _2315 = _2311.y;
    float _2317 = _2311.z;
    float _2319 = _2311.w;
    float _2321 = -_2282;
    float _2323 = fma(_2306, _2321, 1.0);
    float2 _5983 = float2(_2323, _2296);
    float3 _2327 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5983, float2(0.0), isnan(_5983)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5983, float2(0.0), isnan(_5983)), level(0.0)).xyz;
    float _2329 = _2327.x;
    float _2331 = _2327.y;
    float _2333 = _2327.z;
    float _2335 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2337 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2339 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2341 = isnan(0.5);
    bool _2343 = _2339 || _2341;
    bool _2345 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2347 = _2343 || _2345;
    float _2349 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2351 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2335);
    float _2353 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2337);
    float _2355 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2351);
    float _2357 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2353);
    float _2359 = exp2(_2349);
    float _2361 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2363 = _2357 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2365 = _2355;
    float _2367 = _2302;
    float _2369 = _2206;
    float _2371 = _2212;
    if (!_2347)
    {
        _2365 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2373 = _2365;
    float _2375 = _2363 + _2361;
    float _2377 = 1.0 / _2361;
    float _2379 = _2373;
    if (!_2347)
    {
        _2367 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2381 = _2367;
    if (_2347)
    {
        _2369 = 1.0;
    }
    float _2383 = _2369;
    float _2385 = -_2359;
    float _2387 = _2385 + 1.0;
    float _2389 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2391 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2393 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2389);
    float _2395 = _2375 * _2377;
    float _2397 = _2395 * 0.5;
    float _2399 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2393);
    float _2401 = _2397;
    float _2403 = _2383;
    if (!_2347)
    {
        float _2405 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2407 = fma(_2397, _2373, _2405);
        _2379 = _2407;
    }
    float _2409 = _2379;
    if (!_2347)
    {
        float _2411 = -_2381;
        float _2413 = _2411 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2401 = _2413;
    }
    float _2415 = _2401;
    float _2417 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2399);
    float _2419 = _2292 + _2248;
    float _2421 = _2409;
    if (!_2347)
    {
        float _2423 = 1.0 / _2409;
        _2421 = _2423;
    }
    float _2425 = _2421;
    float _2427 = _2417 + _2248;
    out.gl_Position.x = _2292;
    out.gl_Position.y = _2294;
    out.gl_Position.z = _2417;
    out.gl_Position.w = _2248;
    float _2429 = _2419 * 0.5;
    float _2431 = _2427 * 0.5;
    float _2433 = _2415;
    if (!_2347)
    {
        float _2435 = 1.0 / _2415;
        _2433 = _2435;
    }
    float _2437 = _2433;
    if (!_2347)
    {
        float _2439 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2441 = -_2381;
        float _2443 = fma(_2425, _2439, _2441);
        _2371 = _2443;
    }
    float _2445 = _2371;
    if (!_2347)
    {
        float _2447 = _2445 * _2437;
        float _2449 = precise::clamp(_2447, 0.0, 1.0);
        _2403 = _2449;
    }
    float _2451 = _2403;
    float _2453 = _2248 * 0.5;
    bool _2455 = _2451 > 0.0;
    bool _2457 = isnan(_2451);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan(0.0);
    bool _2463 = _2459 || _2461;
    float _2465 = fma(_2294, -0.5, _2453);
    float _2467 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2469 = _2467 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.x = _2429;
    out.m_70.y = _2465;
    out.m_70.z = _2431;
    out.m_70.w = _2248;
    out.m_45.x = _2469;
    float _2471 = _2391 * _2308;
    float _2473 = -_2391;
    float _2475 = _2473 + 1.0;
    float _2477 = _2319 * _2471;
    float _2479 = _2333 * _2471;
    float _2481 = fma(_2329, _2477, _2313);
    float _2483 = fma(_2331, _2477, _2315);
    float _2485 = _2319 * _2475;
    float _2487 = fma(_2319, _2479, _2317);
    out.m_72.x = _2481;
    out.m_72.y = _2483;
    out.m_72.z = _2487;
    out.m_72.w = _2485;
    if (_2463)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2489 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2489;
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
        float _2546 = as_type<float>(_107);
        out.gl_Position.z = _2546;
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
        float _2617 = as_type<float>(_147);
        out.gl_Position.z = _2617;
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
    float _399 = in.m_55.w;
    bool _401 = _387 >= 9.9999999747524270787835121154785e-07;
    bool _403 = isnan(_387);
    bool _405 = _401 || _403;
    bool _407 = isnan(9.9999999747524270787835121154785e-07);
    bool _409 = _405 || _407;
    float _411 = _359 * _379;
    float _413 = _363 * _363;
    float _415 = in.m_53.z;
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
    float _441 = _399;
    if (_409)
    {
        _437 = _433;
    }
    float _443 = _437;
    float _445 = fma(_373, _415, _431);
    float _447 = _443;
    float _449 = _445;
    float _451 = _443;
    float _453 = _445;
    if (_409)
    {
        _439 = _435;
    }
    float _455 = _439;
    float _457 = fma(_349, _399, _421);
    float _459 = fma(_345, _399, _423);
    float _461 = fma(_353, _399, _425);
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
            float _487 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[16].z, _481);
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
                    float _583 = fma(_425, _415, _577);
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
                float _617 = fma(_155, _415, _611);
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
    float _687 = in.m_57.x;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _705 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _707 = isnan(_677);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = 1.0 / _691;
    bool _719 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _721 = isnan(_677);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    bool _731 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _733 = isnan(_677);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = 1.0 / _695;
    bool _745 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _747 = 1.0 / _703;
    float _749 = _681 * _717;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _753 = _677 + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _757 = _677 + _755;
    float _759 = 1.0 / _699;
    float _761 = _753 * _743;
    float _763 = _685 * _747;
    bool _765 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _767 = isnan(_677);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -_775;
    float _779 = _777 + 1.0;
    float _781 = _757 * _759;
    bool _783 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _785 = isnan(_677);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -_715;
    float _797 = _795 + 1.0;
    float _799 = -_793;
    float _801 = _799 + 1.0;
    float _803 = _775 * _797;
    float _805 = _793 * _779;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _819 = _729 * _801;
    float _821 = -_729;
    float _823 = _821 + 1.0;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _825;
    float _829 = fma(_813, _761, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _831 = fma(_817, _761, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _833 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _835 = fma(_809, _749, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _837 = _741 * _823;
    float _839 = fma(_827, _749, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _841 = -_741;
    float _843 = _841 + 1.0;
    float _845 = _833 * _687;
    float _847 = _835 * _837;
    float _849 = _839 * _837;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _855;
    float _859 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[143].x, _847);
    float _861 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[143].y, _849);
    float _863 = trunc(_845);
    int _865 = int(_863);
    float _867 = fma(_853, _781, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _869 = fma(_857, _781, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _871 = fma(_829, _819, _859);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _881 = fma(_831, _819, _861);
    float _883 = fma(_867, _805, _871);
    float _885 = fma(_875, _763, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _887 = fma(_879, _763, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _889 = fma(_869, _805, _881);
    float _891 = fma(_885, _803, _883);
    float _893 = fma(_887, _803, _889);
    float _895 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[147].x, _891);
    int _897 = _865 << 4;
    int _899 = _897 + 1712;
    float _901 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[147].y, _893);
    bool _903 = !_745;
    float _919;
    if (!_903)
    {
        float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _907 = _687 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
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
    float _933 = _687 * 2.0;
    float _935 = _635 * _635;
    float _937 = in.m_57.y;
    float _939 = _687 + (-0.5);
    float _941 = floor(_933);
    float _943 = as_type<float>(int(gl_VertexIndex));
    float _945 = fma(_637, _637, _935);
    bool _947 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _949 = isnan(_929);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _967 = 1.0 / _961;
    bool _969 = _941 > 0.0;
    float _971 = _931 * 2.0;
    bool _973 = _941 >= 0.0;
    bool _975 = isnan(_941);
    bool _977 = _973 || _975;
    bool _979 = isnan(0.0);
    bool _981 = _977 || _979;
    float _983 = _937 * 2.0;
    int _985 = _981 ? 0 : 1;
    float _987 = floor(_971);
    int _989 = ~_985;
    int _991 = _989 + 1;
    int _993 = _991 + 1;
    int _995 = _993;
    if (!_969)
    {
        int _997 = ~_985;
        int _999 = _997 + 1;
        _995 = _999;
    }
    int _1001 = _995;
    float _1003 = floor(_983);
    bool _1005 = _987 >= 0.0;
    bool _1007 = isnan(_987);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan(0.0);
    bool _1013 = _1009 || _1011;
    float _1015 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1017 = log2(_1015);
    bool _1019 = _987 > 0.0;
    int _1021 = _1013 ? 0 : 1;
    bool _1023 = _1003 > 0.0;
    float _1025 = 1.0 / _965;
    bool _1027 = _1003 >= 0.0;
    bool _1029 = isnan(_1003);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan(0.0);
    bool _1035 = _1031 || _1033;
    int _1037 = ~_1021;
    int _1039 = _1037 + 1;
    int _1041 = _1039 + 1;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1045 = _1043 != 0;
    int _1047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1049 = _1047 != 0;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1053 = _1051 != 0;
    int _1055 = _1035 ? 0 : 1;
    int _1057 = _1041;
    if (!_1019)
    {
        int _1059 = ~_1021;
        int _1061 = _1059 + 1;
        _1057 = _1061;
    }
    int _1063 = _1057;
    bool _1065 = !_1049;
    int _1067 = _1065 ? 0 : 1;
    int _1069 = ~_1055;
    int _1071 = _1069 + 1;
    int _1073 = _1071 + 1;
    int _1075 = _1073;
    if (!_1023)
    {
        int _1077 = ~_1055;
        int _1079 = _1077 + 1;
        _1075 = _1079;
    }
    int _1081 = _1075;
    int _1083 = abs(_1067);
    float _1085 = _937 + _931;
    int _1087 = as_type<int>(_943) & 1;
    bool _1089 = _1087 != 0;
    int _1091 = as_type<int>(_943) & 2;
    bool _1093 = _1091 != 0;
    float _1095 = _125 * _1017;
    float _1097 = float(_1001);
    float _1099 = _1085 + (-1.0);
    float _1101 = float(_1083);
    float _1103 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1105 = !_1045;
    int _1107 = _1105 ? 0 : 1;
    float _1109 = exp2(_1095);
    float _1111 = _1101 * _1097;
    bool _1113 = !_1053;
    int _1115 = _1113 ? 0 : 1;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1119 = 1.0 + _1117;
    int _1121 = abs(_1107);
    float _1123 = in.m_62.x;
    float _1125 = in.m_62.y;
    float _1127 = in.m_62.z;
    int _1129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1131 = _1129 != 0;
    float _1133 = 1.0 / _1119;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1137 = _1135 != 0;
    float _1139 = fma(_639, _639, _945);
    int _1141 = abs(_1115);
    float _1143 = _687 + _937;
    float _1145 = _1111 * (-2.0);
    float _1147 = float(_1063);
    float _1149 = rsqrt(_1139);
    float _1151 = float(_1121);
    float _1153 = -_1109;
    float _1155 = _1153 + 1.0;
    bool _1157 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1159 = isnan(0.0);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1165 = _1161 || _1163;
    float _1167 = _1143 + (-1.0);
    float _1169 = float(_1141);
    float _1171 = _1151 * _1147;
    float _1173 = _1165 ? _1155 : 0.0;
    float _1175 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1177 = float(_1081);
    float _1179 = _1171 * (-2.0);
    bool _1181 = _937 > 0.5;
    float _1183 = _1173 * _1133;
    bool _1185 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1187 = isnan(1.0);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1193 = _1189 || _1191;
    float _1195 = _1169 * _1177;
    float _1197 = fma(_1175, _1179, _1175);
    float _1199 = _1149 * _639;
    float _1201 = _1149 * _637;
    float _1203 = fma(_1145, _1125, _1125);
    float _1205 = _1149 * _635;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1209 = _1199 * _1207;
    float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1213 = _1201 * _1211;
    float _1215 = fma(_1103, _1145, _1103);
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1219 = _1205 * _1217;
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1223 = -_1209;
    float _1225 = fma(_1201, _1221, _1223);
    float _1227 = _937 + (-0.5);
    float _1229 = fma(_1179, _1123, _1123);
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1233 = -_1213;
    float _1235 = fma(_1205, _1231, _1233);
    bool _1237 = !_1193;
    float _1239 = _1237 ? _125 : _1183;
    float _1241 = in.m_55.x;
    float _1243 = in.m_55.y;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1247 = -_1219;
    float _1249 = fma(_1199, _1245, _1247);
    float _1251 = _1225 * _1225;
    float _1253 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1203);
    bool _1255 = _687 > 0.5;
    float _1257 = _687 + _931;
    float _1259 = fma(_1249, _1249, _1251);
    float _1261 = fma(_1239, _1215, _1253);
    float _1263 = _459 * _363;
    float _1265 = fma(_1235, _1235, _1259);
    float _1267 = _1261 * 0.15915493667125701904296875;
    float _1269 = _459 * _375;
    float _1271 = _459 * _379;
    float _1273 = _1257 + (-1.0);
    float _1275 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1229);
    float _1277 = _1195 * (-2.0);
    float _1279 = fma(_457, _383, _1269);
    float _1281 = fma(_457, _385, _1263);
    float _1283 = fma(_457, _389, _1271);
    float _1285 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1287 = fma(_1239, _1197, _1275);
    float _1289 = fma(_1277, _1127, _1127);
    float _1291 = in.m_51.w;
    float _1293 = _931 + (-0.5);
    float _1295 = _1287 * 0.15915493667125701904296875;
    float _1297 = fma(_1285, _1277, _1285);
    float _1299 = _895 * _1241;
    float _1301 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1289);
    float _1303 = _901 * _1243;
    float _1305 = in.m_53.w;
    float _1307 = rsqrt(_1265);
    float _1309 = fma(_1239, _1297, _1301);
    float _1311 = in.m_49.w;
    float _1313 = fma(_461, _391, _1279);
    float _1315 = _1309 * 0.15915493667125701904296875;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1317;
    float _1321 = _1267 * 6.283185482025146484375;
    float _1323 = sin(_1321);
    float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1327 = _1325 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1329 = fma(_461, _395, _1281);
    float _1331 = _1319 * _967;
    float _1333 = fma(_461, _415, _1283);
    float _1335 = _1327 * _1025;
    bool _1337 = !_1089;
    float _1339 = _1337 ? (-0.5) : 0.5;
    float _1341 = _1299 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1343 = _1267 * 6.283185482025146484375;
    float _1345 = cos(_1343);
    float _1347 = _1313 + _1291;
    float _1349 = _1249 * _1307;
    float _1351 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1339);
    float _1353 = _1225 * _1307;
    float _1355 = _1235 * _1307;
    bool _1357 = !_1093;
    float _1359 = _1357 ? (-0.5) : 0.5;
    float _1361 = _1333 + _1305;
    float _1363 = _1295 * 6.283185482025146484375;
    float _1365 = sin(_1363);
    float _1367 = _1341 * _1351;
    float _1369 = _1303 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1371 = _1329 + _1311;
    float _1373 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1359);
    float _1375 = _1205 * _1355;
    float _1377 = -_1339;
    int _1379 = _1255 ? as_type<int>(_1377) : as_type<int>(_1339);
    float _1381 = _1315 * 6.283185482025146484375;
    float _1383 = cos(_1381);
    float _1385 = _1369 * _1373;
    float _1387 = -_1375;
    float _1389 = fma(_1199, _1353, _1387);
    bool _1391 = !_1131;
    float _1393 = _1391 ? _1339 : as_type<float>(_1379);
    float _1395 = _1295 * 6.283185482025146484375;
    float _1397 = cos(_1395);
    float _1399 = _1365 * _1323;
    float _1401 = _1365 * _1345;
    float _1403 = _1393 + 0.5;
    float _1405 = _1315 * 6.283185482025146484375;
    float _1407 = sin(_1405);
    float _1409 = _1365 * _1383;
    float _1411 = _1397 * _1345;
    float _1413 = _1397 * _1323;
    float _1415 = _1397 * _1383;
    float _1417 = _1345 * _1383;
    float _1419 = _1323 * _1383;
    float _1421 = _1201 * _1353;
    float _1423 = _1415 * _1201;
    float _1425 = fma(_1407, _1411, _1399);
    float _1427 = fma(_1407, _1399, _1411);
    float _1429 = -_1413;
    float _1431 = fma(_1407, _1401, _1429);
    float _1433 = -_1401;
    float _1435 = fma(_1407, _1413, _1433);
    float _1437 = _1415 * _1199;
    float _1439 = -_1407;
    float _1441 = fma(_1439, _1349, _1423);
    float _1443 = _1425 * _1201;
    float _1445 = -_1421;
    float _1447 = fma(_1205, _1349, _1445);
    float _1449 = -_1407;
    float _1451 = fma(_1449, _1355, _1437);
    float _1453 = _1425 * _1199;
    float _1455 = fma(_1417, _1349, _1443);
    float _1457 = _1435 * _1201;
    float _1459 = fma(_1409, _1447, _1451);
    float _1461 = fma(_1417, _1355, _1453);
    float _1463 = _1435 * _1199;
    float _1465 = fma(_1409, _1389, _1441);
    float _1467 = _1385 * _1459;
    float _1469 = fma(_1431, _1447, _1461);
    float _1471 = fma(_1419, _1349, _1457);
    float _1473 = fma(_1419, _1355, _1463);
    float _1475 = fma(_1431, _1389, _1455);
    float _1477 = fma(_1367, _1469, _1467);
    float _1479 = fma(_1427, _1389, _1471);
    float _1481 = _1385 * _1465;
    float _1483 = fma(_1427, _1447, _1473);
    float _1485 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1489 = _929 + _1487;
    float _1491 = fma(_1367, _1475, _1481);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1495 = _929 + _1493;
    float _1497 = fma(_1485, _1483, _1477);
    float _1499 = fma(_1331, _1489, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1501 = fma(_1485, _1479, _1491);
    float _1503 = fma(_1335, _1495, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1505 = _1361 + _1497;
    int _1507 = _899 + 8;
    uint _1510 = uint(int(uint(_1507) >> uint(2)));
    uint _1512 = uint(int(uint(int(_1510)) >> uint(2)));
    int _1514 = int(_1510) & 3;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[int(_1512)][_1514];
    float _1518 = _1347 + _1501;
    float _1520 = _1199 * _1349;
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1524 = _1505 + _1522;
    bool _1526 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1528 = isnan(_929);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1540 = _1518 + _1538;
    bool _1542 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1544 = isnan(_929);
    bool _1546 = _1542 || _1544;
    bool _1548 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1550 = _1546 || _1548;
    float _1552 = float(_1550);
    float _1554 = _1524 * _1524;
    uint _1556 = uint(int(uint(_899) >> uint(2)));
    uint _1558 = uint(int(uint(int(_1556)) >> uint(2)));
    int _1560 = int(_1556) & 3;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[int(_1558)][_1560];
    int _1564 = int(_1556) + 1;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    int _1568 = _1564 & 3;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[int(_1566)][_1568];
    float _1572 = _1415 * _1205;
    float _1574 = -_1536;
    float _1576 = _1574 + 1.0;
    float _1578 = fma(_1540, _1540, _1554);
    float _1580 = -_1520;
    float _1582 = fma(_1201, _1355, _1580);
    float _1584 = _1425 * _1205;
    float _1586 = -_1407;
    float _1588 = fma(_1586, _1353, _1572);
    float _1590 = sqrt(_1578);
    float _1592 = _957 * _1576;
    float _1594 = _1435 * _1205;
    float _1596 = fma(_1417, _1353, _1584);
    float _1598 = fma(_1409, _1582, _1588);
    float _1600 = -_957;
    float _1602 = _1600 + 1.0;
    float _1604 = fma(_1419, _1353, _1594);
    float _1606 = fma(_1431, _1582, _1596);
    float _1608 = _1385 * _1598;
    float _1610 = _1552 * _1602;
    float _1612 = fma(_1427, _1582, _1604);
    float _1614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1616 = fma(_1367, _1606, _1608);
    float _1618 = _1499 * _1610;
    float _1620 = -_1552;
    float _1622 = _1620 + 1.0;
    bool _1624 = _1590 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1626 = fma(_1485, _1612, _1616);
    float _1628 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1618);
    float _1630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1632 = -_1359;
    int _1634 = _1181 ? as_type<int>(_1632) : as_type<int>(_1359);
    float _1636 = _1371 + _1626;
    float _1638 = fma(_1503, _1592, _1628);
    bool _1640 = !_1137;
    float _1642 = _1640 ? _1359 : as_type<float>(_1634);
    float _1644 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1638);
    float _1646 = _1626;
    float _1648 = _1518;
    float _1650 = _1505;
    float _1652 = _1139;
    if (!_1624)
    {
        _1646 = _1636;
    }
    float _1654 = _1646;
    bool _1656 = !_1624;
    float _1658 = _1654;
    if (!_1656)
    {
        float _1660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1664 = _1590 + _1662;
        float _1666 = rsqrt(_1578);
        float _1668 = _1664 * _1660;
        float _1670 = _1636 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1672 = _1668 * 0.15915493667125701904296875;
        float _1674 = _1672 * 6.283185482025146484375;
        float _1676 = sin(_1674);
        float _1678 = _1672 * 6.283185482025146484375;
        float _1680 = cos(_1678);
        float _1682 = fma(_1676, _1670, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1684 = _1666 * _1682;
        float _1686 = _1680 + (-1.0);
        float _1688 = fma(_1540, _1684, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1690 = fma(_1524, _1684, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1692 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1694 = fma(_1636, _1680, _1692);
        _1658 = _1694;
        _1648 = _1688;
        _1650 = _1690;
    }
    float _1696 = _1658;
    float _1698 = _1648;
    float _1700 = _1650;
    float _1702 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1704 = -_1371;
    float _1706 = _1704 + _1696;
    float _1708 = -_1642;
    float _1710 = _1708 + 0.5;
    float _1712 = -_1347;
    float _1714 = _1712 + _1698;
    float _1716 = _1702 * _1614;
    float _1718 = _1706 * _1706;
    float _1720 = _1710 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1722 = -_1361;
    float _1724 = _1722 + _1700;
    float _1726 = fma(_1714, _1714, _1718);
    float _1728 = _1720 * _1630;
    float _1730 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1732 = fma(_1724, _1724, _1726);
    float _1734 = _1562 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1736 = _1570 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1738 = sqrt(_1732);
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1746 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1748 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1750 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1756 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1758 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1760 = _1644 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _1716;
    out.m_64.y = _1728;
    bool _1762 = _1738 > 0.0;
    out.m_66.x = _1750;
    out.m_66.y = _1752;
    out.m_66.z = _1756;
    out.m_66.w = _1754;
    out.m_68.x = _1746;
    out.m_68.y = _1748;
    out.m_68.z = _1758;
    out.m_68.w = _1760;
    bool _1764 = !_1762;
    float _1766 = _1750;
    float _1768 = _1754;
    float _1770 = _1696;
    float _1772 = _1698;
    float _1774 = _1700;
    float _1776 = _1752;
    float _1778 = _1750;
    if (!_1764)
    {
        bool _1780 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1782 = _1752;
        if (_1780)
        {
            float _1784 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1782 = _1784;
        }
        float _1786 = _1782;
        float _1788 = _1786;
        if (_1780)
        {
            float _1790 = _1786 * _637;
            _1766 = _1790;
        }
        float _1792 = _1766;
        float _1794 = _1792;
        float _1796 = _1792;
        if (_1780)
        {
            float _1798 = _1786 * _635;
            _1768 = _1798;
        }
        float _1800 = _1768;
        float _1802 = _1800;
        if (_1780)
        {
            float _1804 = _1786 * _639;
            _1788 = _1804;
        }
        float _1806 = _1788;
        float _1808 = _1806;
        if (!_1780)
        {
            float _1810 = _125 + 1.0;
            float _1812 = _1810;
            if (!_167)
            {
                float _1814 = _1810 * _1810;
                float _1816 = _1814 * 0.5;
                _1794 = _1816;
            }
            float _1818 = _1794;
            float _1820 = _1818;
            if (!_167)
            {
                float _1822 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1820 = _1822;
            }
            float _1824 = _1820;
            bool _1826 = !_167;
            float _1828 = _1824;
            if (!_1826)
            {
                float _1830 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1832 = log2(_1830);
                float _1834 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1836 = _1832 * _1810;
                float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1840 = 1.0 + _1838;
                float _1842 = 1.0 / _1840;
                float _1844 = _1834 * 0.693147182464599609375;
                float _1846 = exp2(_1836);
                float _1848 = 1.0 / _1844;
                float _1850 = _1846 + (-1.0);
                float _1852 = -_1850;
                float _1854 = fma(_1852, _1848, _1810);
                float _1856 = _1854 * _1842;
                float _1858 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1828 = _1858;
            }
            float _1860 = _1828;
            float _1862 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1864 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1866 = !_167;
            if (!_1866)
            {
                float _1868 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1870 = log2(_1868);
                float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1874 = 1.0 + _1872;
                float _1876 = 1.0 / _1874;
                float _1878 = _1870 * _1810;
                float _1880 = exp2(_1878);
                float _1882 = -_1880;
                float _1884 = _1882 + 1.0;
                float _1886 = _1884 * _1876;
                _1812 = _1886;
            }
            float _1888 = _1812;
            float _1890 = fma(_1888, _153, _1864);
            float _1892 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1894 = fma(_1888, _151, _1862);
            float _1896 = -_347;
            float _1898 = _1896 + _1890;
            float _1900 = fma(_1888, _155, _1892);
            float _1902 = -_355;
            float _1904 = _1902 + _1894;
            float _1906 = _1898 * _363;
            float _1908 = -_361;
            float _1910 = _1908 + _1900;
            float _1912 = _1898 * _375;
            float _1914 = _1898 * _379;
            float _1916 = fma(_1904, _385, _1906);
            float _1918 = fma(_1904, _383, _1912);
            float _1920 = fma(_1904, _389, _1914);
            float _1922 = fma(_1910, _395, _1916);
            float _1924 = fma(_1910, _391, _1918);
            float _1926 = fma(_1910, _415, _1920);
            float _1928 = _1922 * _1922;
            float _1930 = fma(_1924, _1924, _1928);
            float _1932 = fma(_1926, _1926, _1930);
            _1652 = _1932;
            _645 = _1922;
            _647 = _1924;
            _649 = _1926;
            _1796 = _1924;
            _1802 = _1922;
            _1808 = _1926;
        }
        float _1934 = _1652;
        float _1936 = _645;
        float _1938 = _647;
        float _1940 = _649;
        float _1942 = _1796;
        float _1944 = _1802;
        float _1946 = _1808;
        float _1948 = sqrt(_1934);
        float _1950 = rsqrt(_1732);
        bool _1952 = _1948 > 0.0;
        float _1954 = _1714 * _1950;
        float _1956 = _1706 * _1950;
        float _1958 = _1724 * _1950;
        bool _1960 = !_1952;
        _1776 = _1946;
        _1778 = _1942;
        if (!_1960)
        {
            float _1962 = rsqrt(_1934);
            float _1964 = _1962 * _1936;
            float _1966 = _1962 * _1938;
            float _1968 = _1962 * _1940;
            float _1970 = _1956 * _1964;
            float _1972 = fma(_1954, _1966, _1970);
            float _1974 = fma(_1958, _1968, _1972);
            float _1976 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1978 = fma(_1942, _1976, _1698);
            float _1980 = fma(_1944, _1976, _1696);
            float _1982 = fma(_1946, _1976, _1700);
            _1770 = _1980;
            _1772 = _1978;
            _1774 = _1982;
        }
    }
    float _1984 = _1770;
    float _1986 = _1772;
    float _1988 = _1774;
    float _1990 = _1776;
    float _1992 = _1778;
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1996 = _1984 + _1994;
    float _1998 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2000 = _1986 + _1998;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2004 = _1988 + _2002;
    float _2006 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2008 = _1996 * _1996;
    float _2010 = fma(_2000, _2000, _2008);
    float _2012 = fma(_2004, _2004, _2010);
    float _2014 = rsqrt(_2012);
    float _2016 = sqrt(_2012);
    float _2018 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2020 = _2000 * _2018;
    float _2022 = _2004 * _2018;
    float _2024 = _2020 * _2020;
    float _2026 = _2022 * _2022;
    float _2028 = _2024 + _2026;
    float _2030 = sqrt(_2028);
    bool _2032 = _2030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2036 = _2030 + _2034;
    float _2038 = _2014;
    float _2040 = _2036;
    float _2042 = _1990;
    float _2044 = _1996;
    float _2046 = _2018;
    if (_2032)
    {
        float _2048 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2038 = _2048;
    }
    float _2050 = _2038;
    float _2052 = _2050;
    if (_2032)
    {
        float _2054 = _2036 * _2050;
        _2040 = _2054;
    }
    float _2056 = _2040;
    if (_2032)
    {
        float _2058 = rsqrt(_2028);
        _2052 = _2058;
    }
    float _2060 = _2052;
    float _2062 = _2060;
    if (_2032)
    {
        float _2064 = _2056 * 0.15915493667125701904296875;
        _2042 = _2064;
    }
    float _2066 = _2042;
    float _2068 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2070 = _2004;
    float _2072 = _2066;
    if (_2032)
    {
        float _2074 = _2066 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        _2070 = _2076;
    }
    float _2078 = _2070;
    float _2080 = precise::max(0.0, _2068);
    float _2082 = _1992;
    float _2084 = _2080;
    if (_2032)
    {
        float _2086 = _2066 * 6.283185482025146484375;
        float _2088 = cos(_2086);
        _2082 = _2088;
    }
    float _2090 = _2082;
    float _2092 = -_2018;
    float _2094 = -_2080;
    float _2096 = fma(_1996, _2092, _2094);
    if (_2032)
    {
        float _2098 = _2096 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2044 = _2098;
    }
    float _2100 = _2044;
    float _2102 = _2078;
    float _2104 = _2100;
    if (_2032)
    {
        float _2106 = fma(_2078, _2100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2102 = _2106;
    }
    float _2108 = _2102;
    float _2110 = _2108;
    if (!_2032)
    {
        _2104 = _2096;
    }
    float _2112 = _2104;
    float _2114 = _2112;
    if (_2032)
    {
        float _2116 = _2060 * _2108;
        _2046 = _2116;
    }
    float _2118 = _2046;
    if (!_2032)
    {
        _2062 = _2020;
    }
    float _2120 = _2062;
    float _2122 = _2120;
    float _2124 = _2090;
    if (_2032)
    {
        float _2126 = _2090 + (-1.0);
        _2084 = _2126;
    }
    float _2128 = _2084;
    float _2130 = _2128;
    if (_2032)
    {
        float _2132 = _2020 * _2118;
        _2122 = _2132;
    }
    float _2134 = _2122;
    if (!_2032)
    {
        _2110 = _2024;
    }
    float _2136 = _2110;
    float _2138 = _2136;
    if (_2032)
    {
        float _2140 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2072 = _2140;
    }
    float _2142 = _2072;
    if (!_2032)
    {
        _2130 = _2022;
    }
    float _2144 = _2130;
    float _2146 = _2144;
    if (_2032)
    {
        float _2148 = _2022 * _2118;
        _2146 = _2148;
    }
    float _2150 = _2146;
    if (_2032)
    {
        float _2152 = _2134 * _2134;
        _2138 = _2152;
    }
    float _2154 = _2138;
    if (_2032)
    {
        float _2156 = fma(_2096, _2090, _2142);
        _2114 = _2156;
    }
    float _2158 = _2114;
    if (!_2032)
    {
        _2124 = _2026;
    }
    float _2160 = _2124;
    float _2162 = _2160;
    if (_2032)
    {
        float _2164 = _2150 * _2150;
        _2162 = _2164;
    }
    float _2166 = _2162;
    float _2168 = fma(_2158, _2158, _2154);
    float _2170 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2172 = _2168 + _2166;
    float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2176 = fma(_2016, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2174);
    float _2178 = precise::clamp(_2176, 0.0, 1.0);
    float _2180 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2170);
    float _2182 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2184 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2186 = -_2178;
    float _2188 = _2186 + 1.0;
    float _2190 = rsqrt(_2172);
    float _2192 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2180);
    float _2194 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2182);
    float _2196 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2198 = _2192 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2200 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2184);
    float _2202 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2194);
    float _2204 = abs(_2188);
    float _2206 = log2(_2204);
    float _2208 = _2198 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2210 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2200);
    float _2212 = _2202 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2214 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2196);
    float _2216 = -_2208;
    float _2218 = fma(_2216, _2006, 1.0);
    float _2220 = _2210 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2222 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2224 = _2190 * _2134;
    float _2226 = _2190 * _2158;
    float _2228 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2214);
    float _2230 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2222);
    float _2232 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2234 = _2190 * _2150;
    float _2236 = _2228 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2238 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2230);
    float _2240 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2242 = -_2232;
    float _2244 = fma(_2226, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2242);
    float _2246 = log2(_2218);
    float _2248 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2238);
    float _2250 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2252 = -_2234;
    float _2254 = fma(_2252, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2244);
    float _2256 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2258 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2250);
    float _2260 = fma(_2254, -0.5, 0.5);
    float _2262 = exp2(_2240);
    float _2264 = fma(_2254, 0.5, 0.5);
    float _2266 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2256);
    float _2268 = _2226 + 1.0;
    float _2270 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2258);
    float _2272 = fma(_2264, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2274 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2266);
    float _2276 = 1.0 / _2248;
    float _2278 = fma(_2264, _2272, -0.212114393711090087890625);
    float _2280 = _2246 * 0.693147182464599609375;
    float _2282 = fma(_2264, _2278, 1.570728778839111328125);
    float _2284 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2286 = sqrt(_2260);
    float _2288 = -_2226;
    float _2290 = fma(_2262, _2268, _2288);
    float _2292 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2274);
    float _2294 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2270);
    float _2296 = fma(_2290, 0.5, 0.5);
    float _2298 = _2292 * _2276;
    float _2300 = _2294 * _2276;
    float _2302 = fma(_2298, 0.5, 0.5);
    float _2304 = fma(_2300, -0.5, 0.5);
    float _2306 = _2286 * 0.636619746685028076171875;
    float3 _5950 = float3(_2302, _2304, _2284);
    float _2308 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5950, float3(0.0), isnan(_5950)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5950, float3(0.0), isnan(_5950)), level(0.0)).x;
    float3 _5961 = float3(_2302, _2304, _2284);
    float4 _2311 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5961, float3(0.0), isnan(_5961)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5961, float3(0.0), isnan(_5961)), level(0.0)).xyzw;
    float _2313 = _2311.x;
    float _2315 = _2311.y;
    float _2317 = _2311.z;
    float _2319 = _2311.w;
    float _2321 = -_2282;
    float _2323 = fma(_2306, _2321, 1.0);
    float2 _5983 = float2(_2323, _2296);
    float3 _2327 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5983, float2(0.0), isnan(_5983)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5983, float2(0.0), isnan(_5983)), level(0.0)).xyz;
    float _2329 = _2327.x;
    float _2331 = _2327.y;
    float _2333 = _2327.z;
    float _2335 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2337 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2339 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2341 = isnan(0.5);
    bool _2343 = _2339 || _2341;
    bool _2345 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2347 = _2343 || _2345;
    float _2349 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2351 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2335);
    float _2353 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2337);
    float _2355 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2351);
    float _2357 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2353);
    float _2359 = exp2(_2349);
    float _2361 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2363 = _2357 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2365 = _2355;
    float _2367 = _2302;
    float _2369 = _2206;
    float _2371 = _2212;
    if (!_2347)
    {
        _2365 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2373 = _2365;
    float _2375 = _2363 + _2361;
    float _2377 = 1.0 / _2361;
    float _2379 = _2373;
    if (!_2347)
    {
        _2367 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2381 = _2367;
    if (_2347)
    {
        _2369 = 1.0;
    }
    float _2383 = _2369;
    float _2385 = -_2359;
    float _2387 = _2385 + 1.0;
    float _2389 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2391 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2393 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2389);
    float _2395 = _2375 * _2377;
    float _2397 = _2395 * 0.5;
    float _2399 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2393);
    float _2401 = _2397;
    float _2403 = _2383;
    if (!_2347)
    {
        float _2405 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2407 = fma(_2397, _2373, _2405);
        _2379 = _2407;
    }
    float _2409 = _2379;
    if (!_2347)
    {
        float _2411 = -_2381;
        float _2413 = _2411 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2401 = _2413;
    }
    float _2415 = _2401;
    float _2417 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2399);
    float _2419 = _2292 + _2248;
    float _2421 = _2409;
    if (!_2347)
    {
        float _2423 = 1.0 / _2409;
        _2421 = _2423;
    }
    float _2425 = _2421;
    float _2427 = _2417 + _2248;
    out.gl_Position.x = _2292;
    out.gl_Position.y = _2294;
    out.gl_Position.z = _2417;
    out.gl_Position.w = _2248;
    float _2429 = _2419 * 0.5;
    float _2431 = _2427 * 0.5;
    float _2433 = _2415;
    if (!_2347)
    {
        float _2435 = 1.0 / _2415;
        _2433 = _2435;
    }
    float _2437 = _2433;
    if (!_2347)
    {
        float _2439 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2441 = -_2381;
        float _2443 = fma(_2425, _2439, _2441);
        _2371 = _2443;
    }
    float _2445 = _2371;
    if (!_2347)
    {
        float _2447 = _2445 * _2437;
        float _2449 = precise::clamp(_2447, 0.0, 1.0);
        _2403 = _2449;
    }
    float _2451 = _2403;
    float _2453 = _2248 * 0.5;
    bool _2455 = _2451 > 0.0;
    bool _2457 = isnan(_2451);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan(0.0);
    bool _2463 = _2459 || _2461;
    float _2465 = fma(_2294, -0.5, _2453);
    float _2467 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2469 = _2467 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.x = _2429;
    out.m_70.y = _2465;
    out.m_70.z = _2431;
    out.m_70.w = _2248;
    out.m_45.x = _2469;
    float _2471 = _2391 * _2308;
    float _2473 = -_2391;
    float _2475 = _2473 + 1.0;
    float _2477 = _2319 * _2471;
    float _2479 = _2333 * _2471;
    float _2481 = fma(_2329, _2477, _2313);
    float _2483 = fma(_2331, _2477, _2315);
    float _2485 = _2319 * _2475;
    float _2487 = fma(_2319, _2479, _2317);
    out.m_72.x = _2481;
    out.m_72.y = _2483;
    out.m_72.z = _2487;
    out.m_72.w = _2485;
    if (_2463)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2489 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2489;
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
        float _2546 = as_type<float>(_107);
        out.gl_Position.z = _2546;
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
        float _2617 = as_type<float>(_147);
        out.gl_Position.z = _2617;
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
    float _399 = in.m_55.w;
    bool _401 = _387 >= 9.9999999747524270787835121154785e-07;
    bool _403 = isnan(_387);
    bool _405 = _401 || _403;
    bool _407 = isnan(9.9999999747524270787835121154785e-07);
    bool _409 = _405 || _407;
    float _411 = _359 * _379;
    float _413 = _363 * _363;
    float _415 = in.m_53.z;
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
    float _441 = _399;
    if (_409)
    {
        _437 = _433;
    }
    float _443 = _437;
    float _445 = fma(_373, _415, _431);
    float _447 = _443;
    float _449 = _445;
    float _451 = _443;
    float _453 = _445;
    if (_409)
    {
        _439 = _435;
    }
    float _455 = _439;
    float _457 = fma(_349, _399, _421);
    float _459 = fma(_345, _399, _423);
    float _461 = fma(_353, _399, _425);
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
            float _487 = fma(_415, (*spvDescriptorSet0.vp_c9)._m0[16].z, _481);
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
                    float _583 = fma(_425, _415, _577);
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
                float _617 = fma(_155, _415, _611);
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
    float _687 = in.m_57.x;
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _697 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _699 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _697;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _705 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _707 = isnan(_677);
    bool _709 = _705 || _707;
    bool _711 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _713 = _709 || _711;
    float _715 = float(_713);
    float _717 = 1.0 / _691;
    bool _719 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _721 = isnan(_677);
    bool _723 = _719 || _721;
    bool _725 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _727 = _723 || _725;
    float _729 = float(_727);
    bool _731 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _733 = isnan(_677);
    bool _735 = _731 || _733;
    bool _737 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _739 = _735 || _737;
    float _741 = float(_739);
    float _743 = 1.0 / _695;
    bool _745 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _747 = 1.0 / _703;
    float _749 = _681 * _717;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _753 = _677 + _751;
    float _755 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _757 = _677 + _755;
    float _759 = 1.0 / _699;
    float _761 = _753 * _743;
    float _763 = _685 * _747;
    bool _765 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _767 = isnan(_677);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = -_775;
    float _779 = _777 + 1.0;
    float _781 = _757 * _759;
    bool _783 = _677 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _785 = isnan(_677);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -_715;
    float _797 = _795 + 1.0;
    float _799 = -_793;
    float _801 = _799 + 1.0;
    float _803 = _775 * _797;
    float _805 = _793 * _779;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _807;
    float _811 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _813 = _811 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _817 = _815 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _819 = _729 * _801;
    float _821 = -_729;
    float _823 = _821 + 1.0;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _827 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _825;
    float _829 = fma(_813, _761, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _831 = fma(_817, _761, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _833 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _835 = fma(_809, _749, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _837 = _741 * _823;
    float _839 = fma(_827, _749, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _841 = -_741;
    float _843 = _841 + 1.0;
    float _845 = _833 * _687;
    float _847 = _835 * _837;
    float _849 = _839 * _837;
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _857 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _855;
    float _859 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[143].x, _847);
    float _861 = fma(_843, (*spvDescriptorSet0.vp_c9)._m0[143].y, _849);
    float _863 = trunc(_845);
    int _865 = int(_863);
    float _867 = fma(_853, _781, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _869 = fma(_857, _781, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _871 = fma(_829, _819, _859);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _877 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _879 = _877 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _881 = fma(_831, _819, _861);
    float _883 = fma(_867, _805, _871);
    float _885 = fma(_875, _763, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _887 = fma(_879, _763, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _889 = fma(_869, _805, _881);
    float _891 = fma(_885, _803, _883);
    float _893 = fma(_887, _803, _889);
    float _895 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[147].x, _891);
    int _897 = _865 << 4;
    int _899 = _897 + 1712;
    float _901 = fma(_715, (*spvDescriptorSet0.vp_c9)._m0[147].y, _893);
    bool _903 = !_745;
    float _919;
    if (!_903)
    {
        float _905 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _907 = _687 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
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
    float _933 = _687 * 2.0;
    float _935 = _635 * _635;
    float _937 = in.m_57.y;
    float _939 = _687 + (-0.5);
    float _941 = floor(_933);
    float _943 = as_type<float>(int(gl_VertexIndex));
    float _945 = fma(_637, _637, _935);
    bool _947 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _949 = isnan(_929);
    bool _951 = _947 || _949;
    bool _953 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _955 = _951 || _953;
    float _957 = float(_955);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _963 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _965 = _963 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _967 = 1.0 / _961;
    bool _969 = _941 > 0.0;
    float _971 = _931 * 2.0;
    bool _973 = _941 >= 0.0;
    bool _975 = isnan(_941);
    bool _977 = _973 || _975;
    bool _979 = isnan(0.0);
    bool _981 = _977 || _979;
    float _983 = _937 * 2.0;
    int _985 = _981 ? 0 : 1;
    float _987 = floor(_971);
    int _989 = ~_985;
    int _991 = _989 + 1;
    int _993 = _991 + 1;
    int _995 = _993;
    if (!_969)
    {
        int _997 = ~_985;
        int _999 = _997 + 1;
        _995 = _999;
    }
    int _1001 = _995;
    float _1003 = floor(_983);
    bool _1005 = _987 >= 0.0;
    bool _1007 = isnan(_987);
    bool _1009 = _1005 || _1007;
    bool _1011 = isnan(0.0);
    bool _1013 = _1009 || _1011;
    float _1015 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1017 = log2(_1015);
    bool _1019 = _987 > 0.0;
    int _1021 = _1013 ? 0 : 1;
    bool _1023 = _1003 > 0.0;
    float _1025 = 1.0 / _965;
    bool _1027 = _1003 >= 0.0;
    bool _1029 = isnan(_1003);
    bool _1031 = _1027 || _1029;
    bool _1033 = isnan(0.0);
    bool _1035 = _1031 || _1033;
    int _1037 = ~_1021;
    int _1039 = _1037 + 1;
    int _1041 = _1039 + 1;
    int _1043 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1045 = _1043 != 0;
    int _1047 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1049 = _1047 != 0;
    int _1051 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1053 = _1051 != 0;
    int _1055 = _1035 ? 0 : 1;
    int _1057 = _1041;
    if (!_1019)
    {
        int _1059 = ~_1021;
        int _1061 = _1059 + 1;
        _1057 = _1061;
    }
    int _1063 = _1057;
    bool _1065 = !_1049;
    int _1067 = _1065 ? 0 : 1;
    int _1069 = ~_1055;
    int _1071 = _1069 + 1;
    int _1073 = _1071 + 1;
    int _1075 = _1073;
    if (!_1023)
    {
        int _1077 = ~_1055;
        int _1079 = _1077 + 1;
        _1075 = _1079;
    }
    int _1081 = _1075;
    int _1083 = abs(_1067);
    float _1085 = _937 + _931;
    int _1087 = as_type<int>(_943) & 1;
    bool _1089 = _1087 != 0;
    int _1091 = as_type<int>(_943) & 2;
    bool _1093 = _1091 != 0;
    float _1095 = _125 * _1017;
    float _1097 = float(_1001);
    float _1099 = _1085 + (-1.0);
    float _1101 = float(_1083);
    float _1103 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _1105 = !_1045;
    int _1107 = _1105 ? 0 : 1;
    float _1109 = exp2(_1095);
    float _1111 = _1101 * _1097;
    bool _1113 = !_1053;
    int _1115 = _1113 ? 0 : 1;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1119 = 1.0 + _1117;
    int _1121 = abs(_1107);
    float _1123 = in.m_62.x;
    float _1125 = in.m_62.y;
    float _1127 = in.m_62.z;
    int _1129 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1131 = _1129 != 0;
    float _1133 = 1.0 / _1119;
    int _1135 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1137 = _1135 != 0;
    float _1139 = fma(_639, _639, _945);
    int _1141 = abs(_1115);
    float _1143 = _687 + _937;
    float _1145 = _1111 * (-2.0);
    float _1147 = float(_1063);
    float _1149 = rsqrt(_1139);
    float _1151 = float(_1121);
    float _1153 = -_1109;
    float _1155 = _1153 + 1.0;
    bool _1157 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1159 = isnan(0.0);
    bool _1161 = _1157 || _1159;
    bool _1163 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1165 = _1161 || _1163;
    float _1167 = _1143 + (-1.0);
    float _1169 = float(_1141);
    float _1171 = _1151 * _1147;
    float _1173 = _1165 ? _1155 : 0.0;
    float _1175 = fma(_1167, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1177 = float(_1081);
    float _1179 = _1171 * (-2.0);
    bool _1181 = _937 > 0.5;
    float _1183 = _1173 * _1133;
    bool _1185 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1187 = isnan(1.0);
    bool _1189 = _1185 || _1187;
    bool _1191 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1193 = _1189 || _1191;
    float _1195 = _1169 * _1177;
    float _1197 = fma(_1175, _1179, _1175);
    float _1199 = _1149 * _639;
    float _1201 = _1149 * _637;
    float _1203 = fma(_1145, _1125, _1125);
    float _1205 = _1149 * _635;
    float _1207 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1209 = _1199 * _1207;
    float _1211 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1213 = _1201 * _1211;
    float _1215 = fma(_1103, _1145, _1103);
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1219 = _1205 * _1217;
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1223 = -_1209;
    float _1225 = fma(_1201, _1221, _1223);
    float _1227 = _937 + (-0.5);
    float _1229 = fma(_1179, _1123, _1123);
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1233 = -_1213;
    float _1235 = fma(_1205, _1231, _1233);
    bool _1237 = !_1193;
    float _1239 = _1237 ? _125 : _1183;
    float _1241 = in.m_55.x;
    float _1243 = in.m_55.y;
    float _1245 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1247 = -_1219;
    float _1249 = fma(_1199, _1245, _1247);
    float _1251 = _1225 * _1225;
    float _1253 = fma(_1227, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1203);
    bool _1255 = _687 > 0.5;
    float _1257 = _687 + _931;
    float _1259 = fma(_1249, _1249, _1251);
    float _1261 = fma(_1239, _1215, _1253);
    float _1263 = _459 * _363;
    float _1265 = fma(_1235, _1235, _1259);
    float _1267 = _1261 * 0.15915493667125701904296875;
    float _1269 = _459 * _375;
    float _1271 = _459 * _379;
    float _1273 = _1257 + (-1.0);
    float _1275 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1229);
    float _1277 = _1195 * (-2.0);
    float _1279 = fma(_457, _383, _1269);
    float _1281 = fma(_457, _385, _1263);
    float _1283 = fma(_457, _389, _1271);
    float _1285 = fma(_1273, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1287 = fma(_1239, _1197, _1275);
    float _1289 = fma(_1277, _1127, _1127);
    float _1291 = in.m_51.w;
    float _1293 = _931 + (-0.5);
    float _1295 = _1287 * 0.15915493667125701904296875;
    float _1297 = fma(_1285, _1277, _1285);
    float _1299 = _895 * _1241;
    float _1301 = fma(_1293, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1289);
    float _1303 = _901 * _1243;
    float _1305 = in.m_53.w;
    float _1307 = rsqrt(_1265);
    float _1309 = fma(_1239, _1297, _1301);
    float _1311 = in.m_49.w;
    float _1313 = fma(_461, _391, _1279);
    float _1315 = _1309 * 0.15915493667125701904296875;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1317;
    float _1321 = _1267 * 6.283185482025146484375;
    float _1323 = sin(_1321);
    float _1325 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1327 = _1325 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1329 = fma(_461, _395, _1281);
    float _1331 = _1319 * _967;
    float _1333 = fma(_461, _415, _1283);
    float _1335 = _1327 * _1025;
    bool _1337 = !_1089;
    float _1339 = _1337 ? (-0.5) : 0.5;
    float _1341 = _1299 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1343 = _1267 * 6.283185482025146484375;
    float _1345 = cos(_1343);
    float _1347 = _1313 + _1291;
    float _1349 = _1249 * _1307;
    float _1351 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1339);
    float _1353 = _1225 * _1307;
    float _1355 = _1235 * _1307;
    bool _1357 = !_1093;
    float _1359 = _1357 ? (-0.5) : 0.5;
    float _1361 = _1333 + _1305;
    float _1363 = _1295 * 6.283185482025146484375;
    float _1365 = sin(_1363);
    float _1367 = _1341 * _1351;
    float _1369 = _1303 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1371 = _1329 + _1311;
    float _1373 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1359);
    float _1375 = _1205 * _1355;
    float _1377 = -_1339;
    int _1379 = _1255 ? as_type<int>(_1377) : as_type<int>(_1339);
    float _1381 = _1315 * 6.283185482025146484375;
    float _1383 = cos(_1381);
    float _1385 = _1369 * _1373;
    float _1387 = -_1375;
    float _1389 = fma(_1199, _1353, _1387);
    bool _1391 = !_1131;
    float _1393 = _1391 ? _1339 : as_type<float>(_1379);
    float _1395 = _1295 * 6.283185482025146484375;
    float _1397 = cos(_1395);
    float _1399 = _1365 * _1323;
    float _1401 = _1365 * _1345;
    float _1403 = _1393 + 0.5;
    float _1405 = _1315 * 6.283185482025146484375;
    float _1407 = sin(_1405);
    float _1409 = _1365 * _1383;
    float _1411 = _1397 * _1345;
    float _1413 = _1397 * _1323;
    float _1415 = _1397 * _1383;
    float _1417 = _1345 * _1383;
    float _1419 = _1323 * _1383;
    float _1421 = _1201 * _1353;
    float _1423 = _1415 * _1201;
    float _1425 = fma(_1407, _1411, _1399);
    float _1427 = fma(_1407, _1399, _1411);
    float _1429 = -_1413;
    float _1431 = fma(_1407, _1401, _1429);
    float _1433 = -_1401;
    float _1435 = fma(_1407, _1413, _1433);
    float _1437 = _1415 * _1199;
    float _1439 = -_1407;
    float _1441 = fma(_1439, _1349, _1423);
    float _1443 = _1425 * _1201;
    float _1445 = -_1421;
    float _1447 = fma(_1205, _1349, _1445);
    float _1449 = -_1407;
    float _1451 = fma(_1449, _1355, _1437);
    float _1453 = _1425 * _1199;
    float _1455 = fma(_1417, _1349, _1443);
    float _1457 = _1435 * _1201;
    float _1459 = fma(_1409, _1447, _1451);
    float _1461 = fma(_1417, _1355, _1453);
    float _1463 = _1435 * _1199;
    float _1465 = fma(_1409, _1389, _1441);
    float _1467 = _1385 * _1459;
    float _1469 = fma(_1431, _1447, _1461);
    float _1471 = fma(_1419, _1349, _1457);
    float _1473 = fma(_1419, _1355, _1463);
    float _1475 = fma(_1431, _1389, _1455);
    float _1477 = fma(_1367, _1469, _1467);
    float _1479 = fma(_1427, _1389, _1471);
    float _1481 = _1385 * _1465;
    float _1483 = fma(_1427, _1447, _1473);
    float _1485 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1489 = _929 + _1487;
    float _1491 = fma(_1367, _1475, _1481);
    float _1493 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1495 = _929 + _1493;
    float _1497 = fma(_1485, _1483, _1477);
    float _1499 = fma(_1331, _1489, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1501 = fma(_1485, _1479, _1491);
    float _1503 = fma(_1335, _1495, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1505 = _1361 + _1497;
    int _1507 = _899 + 8;
    uint _1510 = uint(int(uint(_1507) >> uint(2)));
    uint _1512 = uint(int(uint(int(_1510)) >> uint(2)));
    int _1514 = int(_1510) & 3;
    float _1516 = (*spvDescriptorSet0.vp_c9)._m0[int(_1512)][_1514];
    float _1518 = _1347 + _1501;
    float _1520 = _1199 * _1349;
    float _1522 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1524 = _1505 + _1522;
    bool _1526 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1528 = isnan(_929);
    bool _1530 = _1526 || _1528;
    bool _1532 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1534 = _1530 || _1532;
    float _1536 = float(_1534);
    float _1538 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1540 = _1518 + _1538;
    bool _1542 = _929 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1544 = isnan(_929);
    bool _1546 = _1542 || _1544;
    bool _1548 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1550 = _1546 || _1548;
    float _1552 = float(_1550);
    float _1554 = _1524 * _1524;
    uint _1556 = uint(int(uint(_899) >> uint(2)));
    uint _1558 = uint(int(uint(int(_1556)) >> uint(2)));
    int _1560 = int(_1556) & 3;
    float _1562 = (*spvDescriptorSet0.vp_c9)._m0[int(_1558)][_1560];
    int _1564 = int(_1556) + 1;
    uint _1566 = uint(int(uint(_1564) >> uint(2)));
    int _1568 = _1564 & 3;
    float _1570 = (*spvDescriptorSet0.vp_c9)._m0[int(_1566)][_1568];
    float _1572 = _1415 * _1205;
    float _1574 = -_1536;
    float _1576 = _1574 + 1.0;
    float _1578 = fma(_1540, _1540, _1554);
    float _1580 = -_1520;
    float _1582 = fma(_1201, _1355, _1580);
    float _1584 = _1425 * _1205;
    float _1586 = -_1407;
    float _1588 = fma(_1586, _1353, _1572);
    float _1590 = sqrt(_1578);
    float _1592 = _957 * _1576;
    float _1594 = _1435 * _1205;
    float _1596 = fma(_1417, _1353, _1584);
    float _1598 = fma(_1409, _1582, _1588);
    float _1600 = -_957;
    float _1602 = _1600 + 1.0;
    float _1604 = fma(_1419, _1353, _1594);
    float _1606 = fma(_1431, _1582, _1596);
    float _1608 = _1385 * _1598;
    float _1610 = _1552 * _1602;
    float _1612 = fma(_1427, _1582, _1604);
    float _1614 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1616 = fma(_1367, _1606, _1608);
    float _1618 = _1499 * _1610;
    float _1620 = -_1552;
    float _1622 = _1620 + 1.0;
    bool _1624 = _1590 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1626 = fma(_1485, _1612, _1616);
    float _1628 = fma(_1622, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1618);
    float _1630 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1632 = -_1359;
    int _1634 = _1181 ? as_type<int>(_1632) : as_type<int>(_1359);
    float _1636 = _1371 + _1626;
    float _1638 = fma(_1503, _1592, _1628);
    bool _1640 = !_1137;
    float _1642 = _1640 ? _1359 : as_type<float>(_1634);
    float _1644 = fma(_1536, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1638);
    float _1646 = _1626;
    float _1648 = _1518;
    float _1650 = _1505;
    float _1652 = _1139;
    if (!_1624)
    {
        _1646 = _1636;
    }
    float _1654 = _1646;
    bool _1656 = !_1624;
    float _1658 = _1654;
    if (!_1656)
    {
        float _1660 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1662 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1664 = _1590 + _1662;
        float _1666 = rsqrt(_1578);
        float _1668 = _1664 * _1660;
        float _1670 = _1636 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1672 = _1668 * 0.15915493667125701904296875;
        float _1674 = _1672 * 6.283185482025146484375;
        float _1676 = sin(_1674);
        float _1678 = _1672 * 6.283185482025146484375;
        float _1680 = cos(_1678);
        float _1682 = fma(_1676, _1670, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1684 = _1666 * _1682;
        float _1686 = _1680 + (-1.0);
        float _1688 = fma(_1540, _1684, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1690 = fma(_1524, _1684, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1692 = _1686 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1694 = fma(_1636, _1680, _1692);
        _1658 = _1694;
        _1648 = _1688;
        _1650 = _1690;
    }
    float _1696 = _1658;
    float _1698 = _1648;
    float _1700 = _1650;
    float _1702 = _1403 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1704 = -_1371;
    float _1706 = _1704 + _1696;
    float _1708 = -_1642;
    float _1710 = _1708 + 0.5;
    float _1712 = -_1347;
    float _1714 = _1712 + _1698;
    float _1716 = _1702 * _1614;
    float _1718 = _1706 * _1706;
    float _1720 = _1710 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1722 = -_1361;
    float _1724 = _1722 + _1700;
    float _1726 = fma(_1714, _1714, _1718);
    float _1728 = _1720 * _1630;
    float _1730 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1732 = fma(_1724, _1724, _1726);
    float _1734 = _1562 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1736 = _1570 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1738 = sqrt(_1732);
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1742 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1744 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1746 = _1734 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1748 = _1736 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1750 = _1740 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1752 = _1742 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1754 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1756 = _1744 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1758 = _1730 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1760 = _1644 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _1716;
    out.m_64.y = _1728;
    bool _1762 = _1738 > 0.0;
    out.m_66.x = _1750;
    out.m_66.y = _1752;
    out.m_66.z = _1756;
    out.m_66.w = _1754;
    out.m_68.x = _1746;
    out.m_68.y = _1748;
    out.m_68.z = _1758;
    out.m_68.w = _1760;
    bool _1764 = !_1762;
    float _1766 = _1750;
    float _1768 = _1754;
    float _1770 = _1696;
    float _1772 = _1698;
    float _1774 = _1700;
    float _1776 = _1752;
    float _1778 = _1750;
    if (!_1764)
    {
        bool _1780 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _1782 = _1752;
        if (_1780)
        {
            float _1784 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _1782 = _1784;
        }
        float _1786 = _1782;
        float _1788 = _1786;
        if (_1780)
        {
            float _1790 = _1786 * _637;
            _1766 = _1790;
        }
        float _1792 = _1766;
        float _1794 = _1792;
        float _1796 = _1792;
        if (_1780)
        {
            float _1798 = _1786 * _635;
            _1768 = _1798;
        }
        float _1800 = _1768;
        float _1802 = _1800;
        if (_1780)
        {
            float _1804 = _1786 * _639;
            _1788 = _1804;
        }
        float _1806 = _1788;
        float _1808 = _1806;
        if (!_1780)
        {
            float _1810 = _125 + 1.0;
            float _1812 = _1810;
            if (!_167)
            {
                float _1814 = _1810 * _1810;
                float _1816 = _1814 * 0.5;
                _1794 = _1816;
            }
            float _1818 = _1794;
            float _1820 = _1818;
            if (!_167)
            {
                float _1822 = _1818 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1820 = _1822;
            }
            float _1824 = _1820;
            bool _1826 = !_167;
            float _1828 = _1824;
            if (!_1826)
            {
                float _1830 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1832 = log2(_1830);
                float _1834 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1836 = _1832 * _1810;
                float _1838 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1840 = 1.0 + _1838;
                float _1842 = 1.0 / _1840;
                float _1844 = _1834 * 0.693147182464599609375;
                float _1846 = exp2(_1836);
                float _1848 = 1.0 / _1844;
                float _1850 = _1846 + (-1.0);
                float _1852 = -_1850;
                float _1854 = fma(_1852, _1848, _1810);
                float _1856 = _1854 * _1842;
                float _1858 = _1856 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _1828 = _1858;
            }
            float _1860 = _1828;
            float _1862 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _1864 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _1866 = !_167;
            if (!_1866)
            {
                float _1868 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _1870 = log2(_1868);
                float _1872 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _1874 = 1.0 + _1872;
                float _1876 = 1.0 / _1874;
                float _1878 = _1870 * _1810;
                float _1880 = exp2(_1878);
                float _1882 = -_1880;
                float _1884 = _1882 + 1.0;
                float _1886 = _1884 * _1876;
                _1812 = _1886;
            }
            float _1888 = _1812;
            float _1890 = fma(_1888, _153, _1864);
            float _1892 = _1860 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _1894 = fma(_1888, _151, _1862);
            float _1896 = -_347;
            float _1898 = _1896 + _1890;
            float _1900 = fma(_1888, _155, _1892);
            float _1902 = -_355;
            float _1904 = _1902 + _1894;
            float _1906 = _1898 * _363;
            float _1908 = -_361;
            float _1910 = _1908 + _1900;
            float _1912 = _1898 * _375;
            float _1914 = _1898 * _379;
            float _1916 = fma(_1904, _385, _1906);
            float _1918 = fma(_1904, _383, _1912);
            float _1920 = fma(_1904, _389, _1914);
            float _1922 = fma(_1910, _395, _1916);
            float _1924 = fma(_1910, _391, _1918);
            float _1926 = fma(_1910, _415, _1920);
            float _1928 = _1922 * _1922;
            float _1930 = fma(_1924, _1924, _1928);
            float _1932 = fma(_1926, _1926, _1930);
            _1652 = _1932;
            _645 = _1922;
            _647 = _1924;
            _649 = _1926;
            _1796 = _1924;
            _1802 = _1922;
            _1808 = _1926;
        }
        float _1934 = _1652;
        float _1936 = _645;
        float _1938 = _647;
        float _1940 = _649;
        float _1942 = _1796;
        float _1944 = _1802;
        float _1946 = _1808;
        float _1948 = sqrt(_1934);
        float _1950 = rsqrt(_1732);
        bool _1952 = _1948 > 0.0;
        float _1954 = _1714 * _1950;
        float _1956 = _1706 * _1950;
        float _1958 = _1724 * _1950;
        bool _1960 = !_1952;
        _1776 = _1946;
        _1778 = _1942;
        if (!_1960)
        {
            float _1962 = rsqrt(_1934);
            float _1964 = _1962 * _1936;
            float _1966 = _1962 * _1938;
            float _1968 = _1962 * _1940;
            float _1970 = _1956 * _1964;
            float _1972 = fma(_1954, _1966, _1970);
            float _1974 = fma(_1958, _1968, _1972);
            float _1976 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1978 = fma(_1942, _1976, _1698);
            float _1980 = fma(_1944, _1976, _1696);
            float _1982 = fma(_1946, _1976, _1700);
            _1770 = _1980;
            _1772 = _1978;
            _1774 = _1982;
        }
    }
    float _1984 = _1770;
    float _1986 = _1772;
    float _1988 = _1774;
    float _1990 = _1776;
    float _1992 = _1778;
    float _1994 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1996 = _1984 + _1994;
    float _1998 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2000 = _1986 + _1998;
    float _2002 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2004 = _1988 + _2002;
    float _2006 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2008 = _1996 * _1996;
    float _2010 = fma(_2000, _2000, _2008);
    float _2012 = fma(_2004, _2004, _2010);
    float _2014 = rsqrt(_2012);
    float _2016 = sqrt(_2012);
    float _2018 = _2014 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2020 = _2000 * _2018;
    float _2022 = _2004 * _2018;
    float _2024 = _2020 * _2020;
    float _2026 = _2022 * _2022;
    float _2028 = _2024 + _2026;
    float _2030 = sqrt(_2028);
    bool _2032 = _2030 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2034 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2036 = _2030 + _2034;
    float _2038 = _2014;
    float _2040 = _2036;
    float _2042 = _1990;
    float _2044 = _1996;
    float _2046 = _2018;
    if (_2032)
    {
        float _2048 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2038 = _2048;
    }
    float _2050 = _2038;
    float _2052 = _2050;
    if (_2032)
    {
        float _2054 = _2036 * _2050;
        _2040 = _2054;
    }
    float _2056 = _2040;
    if (_2032)
    {
        float _2058 = rsqrt(_2028);
        _2052 = _2058;
    }
    float _2060 = _2052;
    float _2062 = _2060;
    if (_2032)
    {
        float _2064 = _2056 * 0.15915493667125701904296875;
        _2042 = _2064;
    }
    float _2066 = _2042;
    float _2068 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2070 = _2004;
    float _2072 = _2066;
    if (_2032)
    {
        float _2074 = _2066 * 6.283185482025146484375;
        float _2076 = sin(_2074);
        _2070 = _2076;
    }
    float _2078 = _2070;
    float _2080 = precise::max(0.0, _2068);
    float _2082 = _1992;
    float _2084 = _2080;
    if (_2032)
    {
        float _2086 = _2066 * 6.283185482025146484375;
        float _2088 = cos(_2086);
        _2082 = _2088;
    }
    float _2090 = _2082;
    float _2092 = -_2018;
    float _2094 = -_2080;
    float _2096 = fma(_1996, _2092, _2094);
    if (_2032)
    {
        float _2098 = _2096 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2044 = _2098;
    }
    float _2100 = _2044;
    float _2102 = _2078;
    float _2104 = _2100;
    if (_2032)
    {
        float _2106 = fma(_2078, _2100, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2102 = _2106;
    }
    float _2108 = _2102;
    float _2110 = _2108;
    if (!_2032)
    {
        _2104 = _2096;
    }
    float _2112 = _2104;
    float _2114 = _2112;
    if (_2032)
    {
        float _2116 = _2060 * _2108;
        _2046 = _2116;
    }
    float _2118 = _2046;
    if (!_2032)
    {
        _2062 = _2020;
    }
    float _2120 = _2062;
    float _2122 = _2120;
    float _2124 = _2090;
    if (_2032)
    {
        float _2126 = _2090 + (-1.0);
        _2084 = _2126;
    }
    float _2128 = _2084;
    float _2130 = _2128;
    if (_2032)
    {
        float _2132 = _2020 * _2118;
        _2122 = _2132;
    }
    float _2134 = _2122;
    if (!_2032)
    {
        _2110 = _2024;
    }
    float _2136 = _2110;
    float _2138 = _2136;
    if (_2032)
    {
        float _2140 = _2128 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2072 = _2140;
    }
    float _2142 = _2072;
    if (!_2032)
    {
        _2130 = _2022;
    }
    float _2144 = _2130;
    float _2146 = _2144;
    if (_2032)
    {
        float _2148 = _2022 * _2118;
        _2146 = _2148;
    }
    float _2150 = _2146;
    if (_2032)
    {
        float _2152 = _2134 * _2134;
        _2138 = _2152;
    }
    float _2154 = _2138;
    if (_2032)
    {
        float _2156 = fma(_2096, _2090, _2142);
        _2114 = _2156;
    }
    float _2158 = _2114;
    if (!_2032)
    {
        _2124 = _2026;
    }
    float _2160 = _2124;
    float _2162 = _2160;
    if (_2032)
    {
        float _2164 = _2150 * _2150;
        _2162 = _2164;
    }
    float _2166 = _2162;
    float _2168 = fma(_2158, _2158, _2154);
    float _2170 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2172 = _2168 + _2166;
    float _2174 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2176 = fma(_2016, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2174);
    float _2178 = precise::clamp(_2176, 0.0, 1.0);
    float _2180 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2170);
    float _2182 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2184 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2186 = -_2178;
    float _2188 = _2186 + 1.0;
    float _2190 = rsqrt(_2172);
    float _2192 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2180);
    float _2194 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2182);
    float _2196 = _1984 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2198 = _2192 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2200 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2184);
    float _2202 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2194);
    float _2204 = abs(_2188);
    float _2206 = log2(_2204);
    float _2208 = _2198 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2210 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2200);
    float _2212 = _2202 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2214 = fma(_1986, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2196);
    float _2216 = -_2208;
    float _2218 = fma(_2216, _2006, 1.0);
    float _2220 = _2210 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2222 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2224 = _2190 * _2134;
    float _2226 = _2190 * _2158;
    float _2228 = fma(_1988, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2214);
    float _2230 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2222);
    float _2232 = _2224 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2234 = _2190 * _2150;
    float _2236 = _2228 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2238 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2230);
    float _2240 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2242 = -_2232;
    float _2244 = fma(_2226, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2242);
    float _2246 = log2(_2218);
    float _2248 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2238);
    float _2250 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2252 = -_2234;
    float _2254 = fma(_2252, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2244);
    float _2256 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2258 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2250);
    float _2260 = fma(_2254, -0.5, 0.5);
    float _2262 = exp2(_2240);
    float _2264 = fma(_2254, 0.5, 0.5);
    float _2266 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2256);
    float _2268 = _2226 + 1.0;
    float _2270 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2258);
    float _2272 = fma(_2264, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2274 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2266);
    float _2276 = 1.0 / _2248;
    float _2278 = fma(_2264, _2272, -0.212114393711090087890625);
    float _2280 = _2246 * 0.693147182464599609375;
    float _2282 = fma(_2264, _2278, 1.570728778839111328125);
    float _2284 = _2280 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2286 = sqrt(_2260);
    float _2288 = -_2226;
    float _2290 = fma(_2262, _2268, _2288);
    float _2292 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2274);
    float _2294 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2270);
    float _2296 = fma(_2290, 0.5, 0.5);
    float _2298 = _2292 * _2276;
    float _2300 = _2294 * _2276;
    float _2302 = fma(_2298, 0.5, 0.5);
    float _2304 = fma(_2300, -0.5, 0.5);
    float _2306 = _2286 * 0.636619746685028076171875;
    float3 _5950 = float3(_2302, _2304, _2284);
    float _2308 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5950, float3(0.0), isnan(_5950)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5950, float3(0.0), isnan(_5950)), level(0.0)).x;
    float3 _5961 = float3(_2302, _2304, _2284);
    float4 _2311 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5961, float3(0.0), isnan(_5961)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5961, float3(0.0), isnan(_5961)), level(0.0)).xyzw;
    float _2313 = _2311.x;
    float _2315 = _2311.y;
    float _2317 = _2311.z;
    float _2319 = _2311.w;
    float _2321 = -_2282;
    float _2323 = fma(_2306, _2321, 1.0);
    float2 _5983 = float2(_2323, _2296);
    float3 _2327 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5983, float2(0.0), isnan(_5983)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5983, float2(0.0), isnan(_5983)), level(0.0)).xyz;
    float _2329 = _2327.x;
    float _2331 = _2327.y;
    float _2333 = _2327.z;
    float _2335 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2337 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2339 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2341 = isnan(0.5);
    bool _2343 = _2339 || _2341;
    bool _2345 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2347 = _2343 || _2345;
    float _2349 = _2206 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2351 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2335);
    float _2353 = fma(_1347, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2337);
    float _2355 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2351);
    float _2357 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2353);
    float _2359 = exp2(_2349);
    float _2361 = _2355 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2363 = _2357 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2365 = _2355;
    float _2367 = _2302;
    float _2369 = _2206;
    float _2371 = _2212;
    if (!_2347)
    {
        _2365 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _2373 = _2365;
    float _2375 = _2363 + _2361;
    float _2377 = 1.0 / _2361;
    float _2379 = _2373;
    if (!_2347)
    {
        _2367 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2381 = _2367;
    if (_2347)
    {
        _2369 = 1.0;
    }
    float _2383 = _2369;
    float _2385 = -_2359;
    float _2387 = _2385 + 1.0;
    float _2389 = _2212 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2391 = _2387 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2393 = fma(_2220, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2389);
    float _2395 = _2375 * _2377;
    float _2397 = _2395 * 0.5;
    float _2399 = fma(_2198, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2393);
    float _2401 = _2397;
    float _2403 = _2383;
    if (!_2347)
    {
        float _2405 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2407 = fma(_2397, _2373, _2405);
        _2379 = _2407;
    }
    float _2409 = _2379;
    if (!_2347)
    {
        float _2411 = -_2381;
        float _2413 = _2411 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2401 = _2413;
    }
    float _2415 = _2401;
    float _2417 = fma(_2236, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2399);
    float _2419 = _2292 + _2248;
    float _2421 = _2409;
    if (!_2347)
    {
        float _2423 = 1.0 / _2409;
        _2421 = _2423;
    }
    float _2425 = _2421;
    float _2427 = _2417 + _2248;
    out.gl_Position.x = _2292;
    out.gl_Position.y = _2294;
    out.gl_Position.z = _2417;
    out.gl_Position.w = _2248;
    float _2429 = _2419 * 0.5;
    float _2431 = _2427 * 0.5;
    float _2433 = _2415;
    if (!_2347)
    {
        float _2435 = 1.0 / _2415;
        _2433 = _2435;
    }
    float _2437 = _2433;
    if (!_2347)
    {
        float _2439 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2441 = -_2381;
        float _2443 = fma(_2425, _2439, _2441);
        _2371 = _2443;
    }
    float _2445 = _2371;
    if (!_2347)
    {
        float _2447 = _2445 * _2437;
        float _2449 = precise::clamp(_2447, 0.0, 1.0);
        _2403 = _2449;
    }
    float _2451 = _2403;
    float _2453 = _2248 * 0.5;
    bool _2455 = _2451 > 0.0;
    bool _2457 = isnan(_2451);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan(0.0);
    bool _2463 = _2459 || _2461;
    float _2465 = fma(_2294, -0.5, _2453);
    float _2467 = _2451 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2469 = _2467 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_70.x = _2429;
    out.m_70.y = _2465;
    out.m_70.z = _2431;
    out.m_70.w = _2248;
    out.m_45.x = _2469;
    float _2471 = _2391 * _2308;
    float _2473 = -_2391;
    float _2475 = _2473 + 1.0;
    float _2477 = _2319 * _2471;
    float _2479 = _2333 * _2471;
    float _2481 = fma(_2329, _2477, _2313);
    float _2483 = fma(_2331, _2477, _2315);
    float _2485 = _2319 * _2475;
    float _2487 = fma(_2319, _2479, _2317);
    out.m_72.x = _2481;
    out.m_72.y = _2483;
    out.m_72.z = _2487;
    out.m_72.w = _2485;
    if (_2463)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2489 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2489;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

