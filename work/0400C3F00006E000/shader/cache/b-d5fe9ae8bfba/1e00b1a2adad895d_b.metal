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
    constant _16* vp_c8 [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
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
    float4 m_62 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_72 [[user(locn7)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_52 [[attribute(1)]];
    float4 m_54 [[attribute(2)]];
    float4 m_56 [[attribute(3)]];
    float4 m_42 [[attribute(5)]];
    float4 m_47 [[attribute(6)]];
    float4 m_60 [[attribute(7)]];
    float4 m_58 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1235 = false;
    bool _1085 = false;
    bool _971 = false;
    bool _677 = false;
    bool _513 = false;
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
        float _2911 = as_type<float>(_107);
        out.gl_Position.z = _2911;
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
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2980 = as_type<float>(_145);
        out.gl_Position.z = _2980;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = 0.0;
    float _169 = _149;
    if (!_165)
    {
        float _171 = _125 * _125;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    int _177 = as_type<int>(_147) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_147) & 2;
    bool _183 = _181 != 0;
    float _185 = _147;
    if (!_165)
    {
        float _187 = _149 * _149;
        float _189 = _187 * 0.5;
        _185 = _189;
    }
    float _191 = _185;
    bool _193 = !_179;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _191;
    if (!_165)
    {
        float _199 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_183;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_165;
    float _209 = _201;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _149 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _149);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
        _127 = _229;
    }
    float _241 = _209;
    float _243 = _127;
    bool _245 = !_165;
    float _247 = _243;
    float _249 = _241;
    if (!_245)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _149 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _169 = _269;
        _247 = _257;
    }
    float _271 = _169;
    float _273 = _247;
    float _275 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _277 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _281 = _273;
    if (!_165)
    {
        _281 = _125;
    }
    float _283 = _281;
    float _285 = fma(_271, _151, _275);
    float _287 = _283;
    if (!_165)
    {
        float _289 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _289;
    }
    float _291 = _249;
    bool _293 = !_165;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = _125 * _299;
        float _309 = 1.0 / _303;
        float _311 = _305 * 0.693147182464599609375;
        float _313 = exp2(_307);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _125);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
    }
    float _327 = _295;
    bool _329 = !_165;
    if (!_329)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = 1.0 / _337;
        float _341 = _125 * _333;
        float _343 = exp2(_341);
        float _345 = -_343;
        float _347 = _345 + 1.0;
        float _349 = _347 * _339;
        _287 = _349;
    }
    float _351 = _287;
    float _353 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _355 = fma(_271, _153, _277);
    float _357 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _361 = fma(_351, _153, _353);
    float _363 = fma(_271, _155, _279);
    float _365 = fma(_351, _151, _357);
    float _367 = fma(_351, _155, _359);
    float _369 = -_361;
    float _371 = _355 + _369;
    float _373 = in.m_52.y;
    float _375 = -_365;
    float _377 = _285 + _375;
    float _379 = -_367;
    float _381 = _363 + _379;
    float _383 = _371 * _371;
    float _385 = in.m_54.y;
    float _387 = fma(_377, _377, _383);
    float _389 = in.m_56.y;
    float _391 = fma(_381, _381, _387);
    float _393 = in.m_52.x;
    float _395 = in.m_54.x;
    float _397 = sqrt(_391);
    float _399 = in.m_56.x;
    float _401 = in.m_52.z;
    float _403 = _371 * _373;
    float _405 = in.m_54.z;
    float _407 = _371 * _385;
    float _409 = in.m_56.z;
    bool _411 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _413 = isnan(_397);
    bool _415 = _411 || _413;
    bool _417 = isnan(9.9999999747524270787835121154785e-07);
    bool _419 = _415 || _417;
    float _421 = _371 * _389;
    float _423 = _385 * _385;
    float _425 = in.m_58.w;
    float _427 = fma(_377, _393, _403);
    float _429 = fma(_373, _373, _423);
    float _431 = in.m_42.x;
    float _433 = in.m_42.y;
    float _435 = in.m_42.z;
    float _437 = fma(_377, _395, _407);
    float _439 = fma(_389, _389, _429);
    float _441 = fma(_377, _399, _421);
    float _443 = fma(_381, _401, _427);
    float _445 = fma(_381, _405, _437);
    float _447 = fma(_381, _409, _441);
    float _449 = _381;
    float _451 = _425;
    float _453 = _445;
    float _455 = _447;
    float _457 = _445;
    float _459 = _447;
    float _461 = _361;
    if (_419)
    {
        _449 = _443;
    }
    float _463 = _449;
    float _465 = fma(_285, _425, _431);
    float _467 = fma(_355, _425, _433);
    float _469 = fma(_363, _425, _435);
    float _471 = _463;
    float _473 = _463;
    if (!_419)
    {
        bool _475 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _477 = !_475;
        if (!_477)
        {
            float _479 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _481 = _373 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _483 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _485 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].x, _479);
            float _487 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[16].x, _481);
            float _489 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[16].x, _483);
            float _491 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[16].z, _485);
            float _493 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[16].z, _487);
            float _495 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[16].z, _489);
            float _497 = _491 * _491;
            float _499 = fma(_493, _493, _497);
            float _501 = fma(_495, _495, _499);
            float _503 = rsqrt(_501);
            float _505 = _503 * 9.9999999747524270787835121154785e-07;
            float _507 = _493 * _505;
            float _509 = _491 * _505;
            float _511 = _495 * _505;
            _457 = _509;
            _473 = _507;
            _459 = _511;
            _513 = true;
        }
        else
        {
            float _515 = _153 * _153;
            float _517 = fma(_151, _151, _515);
            float _519 = fma(_155, _155, _517);
            float _521 = sqrt(_519);
            bool _523 = _521 >= 9.9999999747524270787835121154785e-07;
            bool _525 = isnan(_521);
            bool _527 = _523 || _525;
            bool _529 = isnan(9.9999999747524270787835121154785e-07);
            bool _531 = _527 || _529;
            if (!_531)
            {
                float _533 = _433 * _433;
                float _535 = fma(_431, _431, _533);
                float _537 = fma(_435, _435, _535);
                float _539 = sqrt(_537);
                bool _541 = _539 >= 9.9999999747524270787835121154785e-07;
                bool _543 = isnan(_539);
                bool _545 = _541 || _543;
                bool _547 = isnan(9.9999999747524270787835121154785e-07);
                bool _549 = _545 || _547;
                float _551 = _439;
                if (!_549)
                {
                    float _553 = rsqrt(_439);
                    _551 = _553;
                }
                float _555 = _551;
                if (!_549)
                {
                    float _557 = _555 * 9.9999999747524270787835121154785e-07;
                    _451 = _557;
                }
                float _559 = _451;
                if (!_549)
                {
                    float _561 = _373 * _559;
                    _471 = _561;
                }
                float _563 = _471;
                _473 = _563;
                if (!_549)
                {
                    float _565 = _385 * _559;
                    _453 = _565;
                }
                float _567 = _453;
                _457 = _567;
                if (!_549)
                {
                    float _569 = _389 * _559;
                    _455 = _569;
                }
                float _571 = _455;
                bool _573 = !_549;
                _459 = _571;
                _513 = _573;
                if (!_513)
                {
                    float _575 = _385 * _433;
                    float _577 = _373 * _433;
                    float _579 = _389 * _433;
                    float _581 = fma(_431, _395, _575);
                    float _583 = fma(_431, _393, _577);
                    float _585 = fma(_431, _399, _579);
                    float _587 = fma(_435, _405, _581);
                    float _589 = fma(_435, _401, _583);
                    float _591 = fma(_435, _409, _585);
                    float _593 = _587 * _587;
                    float _595 = fma(_589, _589, _593);
                    float _597 = fma(_591, _591, _595);
                    float _599 = rsqrt(_597);
                    float _601 = _599 * 9.9999999747524270787835121154785e-07;
                    float _603 = _589 * _601;
                    float _605 = _587 * _601;
                    float _607 = _591 * _601;
                    _457 = _605;
                    _473 = _603;
                    _459 = _607;
                    _513 = true;
                }
            }
            else
            {
                float _609 = _385 * _153;
                float _611 = _373 * _153;
                float _613 = _389 * _153;
                float _615 = fma(_151, _395, _609);
                float _617 = fma(_151, _393, _611);
                float _619 = fma(_151, _399, _613);
                float _621 = fma(_155, _405, _615);
                float _623 = fma(_155, _401, _617);
                float _625 = fma(_155, _409, _619);
                float _627 = _621 * _621;
                float _629 = fma(_623, _623, _627);
                float _631 = fma(_625, _625, _629);
                float _633 = rsqrt(_631);
                float _635 = _633 * 9.9999999747524270787835121154785e-07;
                float _637 = _623 * _635;
                float _639 = _621 * _635;
                float _641 = _625 * _635;
                _457 = _639;
                _473 = _637;
                _459 = _641;
            }
        }
    }
    _513 = false;
    float _643 = _457;
    float _645 = _473;
    float _647 = _459;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _651 = !_649;
    float _653 = _643;
    float _655 = _645;
    float _657 = _647;
    float _675;
    if (!_651)
    {
        float _659 = in.m_60.x;
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _663 = _659 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        float _679 = float(_91);
        float _681 = 1.0 / _679;
        float _683 = _125 * _681;
        _675 = _683;
    }
    _677 = false;
    float _685 = _675;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _689 = _685 + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _693 = _685 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _711 = 1.0 / _697;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _713;
    bool _717 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _719 = isnan(_685);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = 1.0 / _701;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _733 = _685 + _731;
    float _735 = -_727;
    float _737 = _735 + 1.0;
    bool _739 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _741 = 1.0 / _705;
    float _743 = _733 * _711;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _747 = _685 + _745;
    bool _749 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _751 = isnan(_685);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = 1.0 / _709;
    float _763 = _689 * _729;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _767 = _685 + _765;
    bool _769 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _771 = isnan(_685);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = 1.0 / _715;
    float _783 = _747 * _741;
    bool _785 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _787 = isnan(_685);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = -_759;
    float _799 = _797 + 1.0;
    float _801 = -_795;
    float _803 = _801 + 1.0;
    float _805 = _693 * _761;
    float _807 = _727 * _799;
    float _809 = _759 * _803;
    bool _811 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _813 = isnan(_685);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _827 = _767 * _781;
    float _829 = -_779;
    float _831 = _829 + 1.0;
    float _833 = -_821;
    float _835 = _833 + 1.0;
    float _837 = _821 * _737;
    float _839 = fma(_825, _763, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _841 = _795 * _831;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _847;
    float _851 = fma(_845, _743, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _853 = fma(_849, _743, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _855 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _857 = isnan(_685);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _871 = _865 * _835;
    float _873 = fma(_869, _763, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _875;
    float _879 = -_865;
    float _881 = _879 + 1.0;
    float _883 = _851 * _871;
    float _885 = _853 * _871;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _887;
    float _891 = fma(_877, _783, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _893 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[143].x, _883);
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[143].y, _885);
    float _897 = in.m_58.x;
    float _899 = in.m_58.y;
    float _901 = fma(_889, _783, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _907 = fma(_873, _837, _893);
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _913 = fma(_839, _837, _895);
    float _915 = fma(_905, _805, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _917;
    float _921 = fma(_891, _807, _907);
    float _923 = fma(_911, _805, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _925;
    float _929 = fma(_901, _807, _913);
    float _931 = fma(_919, _827, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _933 = fma(_915, _809, _921);
    float _935 = fma(_927, _827, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _937 = fma(_923, _809, _929);
    float _939 = fma(_931, _841, _933);
    float _941 = fma(_935, _841, _937);
    float _943 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[148].x, _939);
    float _945 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[148].y, _941);
    float _947 = _943 * _897;
    float _949 = _945 * _899;
    bool _951 = !_739;
    float _969;
    if (!_951)
    {
        float _953 = in.m_60.x;
        float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _957 = _953 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _961 = _959 * _955;
        float _963 = floor(_961);
        float _965 = -_963;
        float _967 = _961 + _965;
        _969 = _967;
        _971 = true;
    }
    else
    {
        float _973 = float(_91);
        float _975 = 1.0 / _973;
        float _977 = _125 * _975;
        _969 = _977;
    }
    _971 = false;
    float _979 = _969;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _983 = _979 + _981;
    bool _985 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _987 = isnan(_979);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _997;
    bool _1001 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1003 = isnan(_979);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1009 = _1005 || _1007;
    float _1011 = float(_1009);
    float _1013 = -_995;
    float _1015 = _1013 + 1.0;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1017;
    float _1021 = 1.0 / _999;
    bool _1023 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1025 = _1011 * _1015;
    float _1027 = -_1011;
    float _1029 = _1027 + 1.0;
    float _1031 = _983 * _1021;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1033;
    float _1037 = fma(_1019, _1031, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1039;
    float _1043 = fma(_1035, _1031, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1045 = _1037 * _1025;
    float _1047 = fma(_1041, _1031, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1049 = _1043 * _1025;
    float _1051 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1045);
    float _1053 = _1047 * _1025;
    float _1055 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1049);
    float _1057 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1051);
    float _1059 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1053);
    float _1061 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1055);
    float _1063 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1059);
    bool _1065 = !_1023;
    float _1083;
    if (!_1065)
    {
        float _1067 = in.m_60.x;
        float _1069 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1071 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1073 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _1075 = _1073 * _1069;
        float _1077 = floor(_1075);
        float _1079 = -_1077;
        float _1081 = _1075 + _1079;
        _1083 = _1081;
        _1085 = true;
    }
    else
    {
        float _1087 = float(_91);
        float _1089 = 1.0 / _1087;
        float _1091 = _125 * _1089;
        _1083 = _1091;
    }
    _1085 = false;
    float _1093 = _1083;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1097 = _1093 + _1095;
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1103 = _1093 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1105 = isnan(_1093);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1111 = _1107 || _1109;
    float _1113 = float(_1111);
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1119 = _1093 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1121 = isnan(_1093);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1131;
    bool _1135 = _1093 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1137 = isnan(_1093);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1143 = _1139 || _1141;
    float _1145 = float(_1143);
    float _1147 = 1.0 / _1101;
    float _1149 = -_1113;
    float _1151 = _1149 + 1.0;
    bool _1153 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1155 = _1129 * _1151;
    float _1157 = -_1129;
    float _1159 = _1157 + 1.0;
    float _1161 = 1.0 / _1117;
    float _1163 = _1133 * _1147;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1167 = _1165 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1169 = fma(_1163, _1097, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1171 = -_1145;
    float _1173 = _1171 + 1.0;
    float _1175 = _1169 * _1155;
    float _1177 = _1167 * _1161;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1181 = _1093 + _1179;
    float _1183 = _1113 * _1173;
    float _1185 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1175);
    float _1187 = _1057 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1189 = fma(_1177, _1181, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1191 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1193 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1195 = fma(_1189, _1183, _1185);
    float _1197 = _1063 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1199 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1201 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1195);
    float _1203 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1205 = _1201 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _1193;
    out.m_62.y = _1203;
    out.m_62.z = _1199;
    out.m_62.w = _1205;
    bool _1207 = !_1153;
    float _1231;
    float _1233;
    if (!_1207)
    {
        float _1209 = in.m_60.x;
        float _1211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1213 = float(_91);
        float _1215 = 1.0 / _1213;
        float _1217 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1219 = _125 * _1215;
        float _1221 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _1223 = _1221 * _1211;
        float _1225 = floor(_1223);
        float _1227 = -_1225;
        float _1229 = _1223 + _1227;
        _1231 = _1229;
        _1233 = _1219;
        _1235 = true;
    }
    else
    {
        float _1237 = float(_91);
        float _1239 = 1.0 / _1237;
        float _1241 = _125 * _1239;
        _1231 = _1241;
        _1233 = _1241;
    }
    _1235 = false;
    float _1243 = _1231;
    float _1245 = _1233;
    float _1247 = in.m_60.x;
    float _1249 = in.m_60.y;
    float _1251 = in.m_60.z;
    float _1253 = in.m_60.w;
    float _1255 = _467 * _389;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1259 = _1243 + _1257;
    float _1261 = fma(_465, _399, _1255);
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1265 = _1263 != 0;
    float _1267 = _643 * _643;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1271 = _1269 != 0;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1277 = _1275 != 0;
    float _1279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1283 = _1281 != 0;
    float _1285 = _467 * _373;
    float _1287 = fma(_465, _393, _1285);
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1293;
    bool _1297 = _1247 > 0.5;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1301 = _1299 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1303 = _1253 > 0.5;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1309 = -_195;
    int _1311 = _1297 ? as_type<int>(_1309) : as_type<int>(_195);
    float _1313 = 1.0 / _1291;
    int _1315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1317 = _1315 != 0;
    float _1319 = _467 * _385;
    float _1321 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1323 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1325 = fma(_465, _395, _1319);
    float _1327 = fma(_1321, -2.0, _1273);
    float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1331 = _1329 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1333 = fma(_469, _401, _1287);
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1339 = 1.0 / _1295;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1345 = fma(_469, _405, _1325);
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1349 = fma(_469, _409, _1261);
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1351;
    float _1355 = 1.0 / _1343;
    float _1357 = _1333 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1359;
    float _1363 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1365 = _1363 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1367 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1369 = isnan(_1245);
    bool _1371 = _1367 || _1369;
    bool _1373 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1375 = _1371 || _1373;
    float _1377 = float(_1375);
    float _1379 = 1.0 / _1337;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1381;
    float _1385 = _1259 * _1339;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1391 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1393 = isnan(_1245);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1399 = _1395 || _1397;
    float _1401 = float(_1399);
    float _1403 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1327);
    bool _1405 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1407 = isnan(_1245);
    bool _1409 = _1405 || _1407;
    bool _1411 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1413 = _1409 || _1411;
    float _1415 = float(_1413);
    float _1417 = 1.0 / _1301;
    float _1419 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1421 = _1353 * _1355;
    float _1423 = _1345 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1427 = -_1347;
    float _1429 = fma(_1419, 2.0, _1427);
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1433 = _1423 + _1431;
    float _1435 = 1.0 / _1307;
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1439 = _1245 + _1437;
    float _1441 = _1361 * _1379;
    float _1443 = -_125;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1429);
    bool _1447 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1449 = isnan(_1245);
    bool _1451 = _1447 || _1449;
    bool _1453 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1455 = _1451 || _1453;
    float _1457 = float(_1455);
    float _1459 = 1.0 / _1331;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1461;
    float _1465 = fma(_1463, _1385, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1467 = 1.0 / _1365;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1471 = _1389 * _1459;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1479 = _1477 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1483 = _1357 + _1481;
    float _1485 = _1475 * _1313;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1489 = _1487 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1491 = _1479 * _1417;
    float _1493 = _1479;
    if (!_1317)
    {
        _1493 = _1249;
    }
    float _1495 = _1493;
    float _1497 = _1383 * _1467;
    float _1499 = _1489 * _1435;
    float _1501 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1469);
    float _1503 = _1495;
    if (_1317)
    {
        _1503 = _1247;
    }
    float _1505 = _1503;
    float _1507 = _1433 * _1433;
    bool _1509 = !_1265;
    float _1511 = _1509 ? _195 : as_type<float>(_1311);
    float _1513 = _1349 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1515 = _1249 > 0.5;
    float _1517 = fma(_1483, _1483, _1507);
    float _1519 = _1507;
    float _1521 = _1517;
    if (!_1317)
    {
        _1519 = _1251;
    }
    float _1523 = _1519;
    float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1527 = _1513 + _1525;
    float _1529 = -_205;
    int _1531 = _1515 ? as_type<int>(_1529) : as_type<int>(_205);
    float _1533 = fma(_1485, _1439, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1535 = _1251 > 0.5;
    float _1537 = fma(_1527, _1527, _1517);
    float _1539 = _1523;
    if (!_1317)
    {
        _1521 = _1251;
    }
    float _1541 = _1521;
    float _1543 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1425);
    float _1545 = rsqrt(_1537);
    float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1549 = _1245 + _1547;
    float _1551 = _1541;
    if (_1317)
    {
        _1539 = _1249;
    }
    float _1553 = _1539;
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1555;
    if (_1317)
    {
        _1551 = _1249;
    }
    float _1559 = _1551;
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1563 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1561;
    float _1565 = fma(_1499, _1549, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1567 = fma(_1557, _1385, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1571 = _1245 + _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1575 = _1245 + _1573;
    float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1579 = _1245 + _1577;
    float _1581 = fma(_1563, _1385, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1583 = fma(_1441, _1571, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1587 = _1245 + _1585;
    float _1589 = fma(_1471, _1575, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1593 = _1433 * _1545;
    float _1595 = fma(_1491, _1579, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1599 = _1245 + _1597;
    float _1601 = fma(_1421, _1587, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1603 = _1483 * _1545;
    float _1605 = -_1593;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1433);
    float _1609 = fma(_1497, _1599, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1613 = -_1603;
    float _1615 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1483);
    float _1617 = _1607 * _1607;
    bool _1619 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1621 = isnan(_1245);
    bool _1623 = _1619 || _1621;
    bool _1625 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1627 = _1623 || _1625;
    float _1629 = float(_1627);
    float _1631 = fma(_1559, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1611);
    float _1633 = _1511 + 0.5;
    float _1635 = fma(_1615, _1615, _1617);
    float _1637 = fma(_645, _645, _1267);
    float _1639 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1641 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1643 = isnan(_1245);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1649 = _1645 || _1647;
    float _1651 = float(_1649);
    float _1653 = -_1629;
    float _1655 = _1653 + 1.0;
    float _1657 = fma(_647, _647, _1637);
    float _1659 = fma(_1639, _1633, _1445);
    float _1661 = _1527 * _1545;
    bool _1663 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1665 = isnan(_1245);
    bool _1667 = _1663 || _1665;
    bool _1669 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1671 = _1667 || _1669;
    float _1673 = float(_1671);
    float _1675 = rsqrt(_1657);
    float _1677 = -_1651;
    float _1679 = _1677 + 1.0;
    float _1681 = -_1661;
    float _1683 = fma(_1681, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1527);
    float _1685 = _1651 * _1655;
    bool _1687 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1689 = isnan(_1243);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    float _1699 = _1673 * _1679;
    float _1701 = fma(_1683, _1683, _1635);
    float _1703 = -_1673;
    float _1705 = _1703 + 1.0;
    bool _1707 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1709 = isnan(_1245);
    bool _1711 = _1707 || _1709;
    bool _1713 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1715 = _1711 || _1713;
    float _1717 = float(_1715);
    float _1719 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1721 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1723 = isnan(_1243);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1729 = _1725 || _1727;
    float _1731 = float(_1729);
    float _1733 = _1377 * _1705;
    float _1735 = -_1377;
    float _1737 = _1735 + 1.0;
    float _1739 = -_1717;
    float _1741 = _1739 + 1.0;
    float _1743 = sqrt(_1701);
    float _1745 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1501);
    float _1747 = _1675 * _647;
    float _1749 = _1717 * _1737;
    float _1751 = _1675 * _645;
    float _1753 = _1675 * _643;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1757 = _1747 * _1755;
    float _1759 = _1457 * _1741;
    float _1761 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1763 = _1751 * _1761;
    float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1767 = _1753 * _1765;
    float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1771 = -_1757;
    float _1773 = fma(_1751, _1769, _1771);
    float _1775 = -_1457;
    float _1777 = _1775 + 1.0;
    float _1779 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1781 = -_1763;
    float _1783 = fma(_1753, _1779, _1781);
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1787 = -_1767;
    float _1789 = fma(_1747, _1785, _1787);
    float _1791 = _1773 * _1773;
    bool _1793 = !_1271;
    float _1795 = _1793 ? _205 : as_type<float>(_1531);
    float _1797 = _1415 * _1777;
    float _1799 = _1545 * _1743;
    float _1801 = fma(_1789, _1789, _1791);
    float _1803 = -_1731;
    float _1805 = _1803 + 1.0;
    float _1807 = _1795 + (-0.5);
    float _1809 = -_195;
    int _1811 = _1535 ? as_type<int>(_1809) : as_type<int>(_195);
    float _1813 = fma(_1783, _1783, _1801);
    float _1815 = -_1415;
    float _1817 = _1815 + 1.0;
    float _1819 = _1697 * _1805;
    float _1821 = -_1323;
    float _1823 = -_1403;
    float _1825 = fma(_1821, _1807, _1823);
    float _1827 = rsqrt(_1813);
    float _1829 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1831 = _1567 * _1819;
    float _1833 = _1465 * _1819;
    float _1835 = _1581 * _1819;
    float _1837 = -_205;
    int _1839 = _1303 ? as_type<int>(_1837) : as_type<int>(_205);
    float _1841 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1843 = !_1277;
    float _1845 = _1843 ? _195 : as_type<float>(_1811);
    float _1847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    bool _1849 = !_1283;
    float _1851 = _1849 ? _205 : as_type<float>(_1839);
    float _1853 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1855 = _1829 * _1799;
    float _1857 = _1401 * _1817;
    float _1859 = -_1745;
    float _1861 = _1859 + 1.0;
    float _1863 = _1789 * _1827;
    float _1865 = _1841 * _1799;
    float _1867 = _1783 * _1827;
    float _1869 = _1773 * _1827;
    float _1871 = _1855 * _1853;
    float _1873 = _1865 * _1847;
    float _1875 = _1533 * _1857;
    float _1877 = _1753 * _1867;
    float _1879 = _1751 * _1869;
    float _1881 = _1873 * _1751;
    float _1883 = _1873 * _1747;
    float _1885 = -_1401;
    float _1887 = _1885 + 1.0;
    float _1889 = -_1877;
    float _1891 = fma(_1747, _1869, _1889);
    float _1893 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1895 = _1893 * 0.5;
    float _1897 = fma(_1871, _1863, _1881);
    float _1899 = -_1879;
    float _1901 = fma(_1753, _1863, _1899);
    float _1903 = fma(_1871, _1867, _1883);
    float _1905 = fma(_1887, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1875);
    float _1907 = fma(_1895, _1891, _1897);
    float _1909 = fma(_1895, _1901, _1903);
    float _1911 = fma(_1595, _1797, _1905);
    float _1913 = _1357 + _1907;
    float _1915 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1917 = _1513 + _1909;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1923 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1925 = _1917 + _1923;
    float _1927 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1919);
    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1931 = _1913 + _1929;
    float _1933 = _1925 * _1925;
    float _1935 = _1747 * _1863;
    float _1937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1939 = _1873 * _1753;
    float _1941 = fma(_1931, _1931, _1933);
    float _1943 = fma(_1583, _1759, _1911);
    float _1945 = -_1935;
    float _1947 = fma(_1751, _1867, _1945);
    float _1949 = fma(_1871, _1869, _1939);
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1955 = sqrt(_1941);
    float _1957 = fma(_1565, _1749, _1943);
    float _1959 = fma(_1895, _1947, _1949);
    float _1961 = -_1951;
    float _1963 = fma(_1719, 2.0, _1961);
    float _1965 = -_1697;
    float _1967 = _1965 + 1.0;
    float _1969 = fma(_1915, -2.0, _1953);
    float _1971 = fma(_1609, _1733, _1957);
    float _1973 = _1423 + _1959;
    float _1975 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1831);
    float _1977 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1833);
    float _1979 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1835);
    float _1981 = _1921 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1983 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1985 = _1845 + 0.5;
    float _1987 = _1851 + (-0.5);
    float _1989 = -_125;
    float _1991 = fma(_1989, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1963);
    bool _1993 = _1955 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1995 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1969);
    float _1997 = fma(_1589, _1699, _1971);
    float _1999 = fma(_1981, _1985, _1991);
    float _2001 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1975);
    float _2003 = -_1983;
    float _2005 = -_1995;
    float _2007 = fma(_2003, _1987, _2005);
    float _2009 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1977);
    float _2011 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1979);
    float _2013 = fma(_1601, _1685, _1997);
    float _2015 = _1969;
    float _2017 = _1913;
    float _2019 = _1917;
    float _2021 = _1657;
    if (!_1993)
    {
        _2015 = _1973;
    }
    float _2023 = _2015;
    bool _2025 = !_1993;
    float _2027 = _2023;
    if (!_2025)
    {
        float _2029 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2033 = _1955 + _2031;
        float _2035 = _1973 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2037 = rsqrt(_1941);
        float _2039 = _2033 * _2029;
        float _2041 = _2039 * 0.15915493667125701904296875;
        float _2043 = _2041 * 6.283185482025146484375;
        float _2045 = sin(_2043);
        float _2047 = _2041 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        float _2051 = fma(_2045, _2035, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2053 = _2037 * _2051;
        float _2055 = _2049 + (-1.0);
        float _2057 = fma(_1931, _2053, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2059 = fma(_1925, _2053, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2061 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2063 = fma(_1973, _2049, _2061);
        _2027 = _2063;
        _2017 = _2057;
        _2019 = _2059;
    }
    float _2065 = _2027;
    float _2067 = _2017;
    float _2069 = _2019;
    float _2071 = -_1423;
    float _2073 = _2071 + _2065;
    float _2075 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1543);
    float _2077 = -_1861;
    float _2079 = fma(_1511, _2077, _1659);
    float _2081 = -_1357;
    float _2083 = _2081 + _2067;
    float _2085 = _2073 * _2073;
    float _2087 = -_2075;
    float _2089 = _2087 + 1.0;
    float _2091 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1927);
    float _2093 = -_1513;
    float _2095 = _2093 + _2069;
    float _2097 = fma(_2083, _2083, _2085);
    float _2099 = fma(_1795, _2089, _1825);
    float _2101 = -_2091;
    float _2103 = _2101 + 1.0;
    float _2105 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1631);
    float _2107 = fma(_2095, _2095, _2097);
    float _2109 = _2001 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2111 = -_2103;
    float _2113 = fma(_1845, _2111, _1999);
    float _2115 = -_2105;
    float _2117 = _2115 + 1.0;
    float _2119 = sqrt(_2107);
    float _2121 = _2009 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2123 = _2011 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2125 = fma(_1851, _2117, _2007);
    float _2127 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2131 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2133 = _2123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2135 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2013);
    out.m_64.x = _2079;
    out.m_64.y = _2099;
    out.m_64.z = _2113;
    out.m_64.w = _2125;
    out.m_66.x = _2127;
    out.m_66.y = _2131;
    out.m_66.z = _2133;
    out.m_66.w = _2129;
    bool _2137 = _2119 > 0.0;
    out.m_68.x = _2135;
    bool _2139 = !_2137;
    float _2141 = _2079;
    float _2143 = _2125;
    float _2145 = _2127;
    float _2147 = _2127;
    float _2149 = _2067;
    float _2151 = _2065;
    float _2153 = _2069;
    float _2155 = _2127;
    if (!_2139)
    {
        bool _2157 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2159 = _2099;
        if (_2157)
        {
            float _2161 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2159 = _2161;
        }
        float _2163 = _2159;
        float _2165 = _2163;
        if (_2157)
        {
            float _2167 = _2163 * _645;
            _2141 = _2167;
        }
        float _2169 = _2141;
        float _2171 = _2169;
        float _2173 = _2169;
        if (_2157)
        {
            float _2175 = _2163 * _643;
            _2143 = _2175;
        }
        float _2177 = _2143;
        float _2179 = _2177;
        if (_2157)
        {
            float _2181 = _2163 * _647;
            _2165 = _2181;
        }
        float _2183 = _2165;
        float _2185 = _2183;
        if (!_2157)
        {
            float _2187 = _125 + 1.0;
            float _2189 = _2187;
            if (!_165)
            {
                float _2191 = _2187 * _2187;
                float _2193 = _2191 * 0.5;
                _2171 = _2193;
            }
            float _2195 = _2171;
            float _2197 = _2195;
            if (!_165)
            {
                float _2199 = _2195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2197 = _2199;
            }
            float _2201 = _2197;
            bool _2203 = !_165;
            float _2205 = _2201;
            if (!_2203)
            {
                float _2207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2209 = log2(_2207);
                float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2213 = _2211 + 1.0;
                float _2215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2217 = _2209 * _2187;
                float _2219 = 1.0 / _2213;
                float _2221 = _2215 * 0.693147182464599609375;
                float _2223 = exp2(_2217);
                float _2225 = 1.0 / _2221;
                float _2227 = _2223 + (-1.0);
                float _2229 = -_2227;
                float _2231 = fma(_2229, _2225, _2187);
                float _2233 = _2231 * _2219;
                float _2235 = _2233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2205 = _2235;
            }
            float _2237 = _2205;
            float _2239 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2241 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2243 = !_165;
            if (!_2243)
            {
                float _2245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2247 = log2(_2245);
                float _2249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2251 = _2249 + 1.0;
                float _2253 = 1.0 / _2251;
                float _2255 = _2247 * _2187;
                float _2257 = exp2(_2255);
                float _2259 = -_2257;
                float _2261 = _2259 + 1.0;
                float _2263 = _2261 * _2253;
                _2189 = _2263;
                _2145 = _2255;
            }
            float _2265 = _2189;
            float _2267 = _2145;
            float _2269 = fma(_2265, _153, _2241);
            float _2271 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2273 = fma(_2265, _151, _2239);
            float _2275 = -_361;
            float _2277 = _2275 + _2269;
            float _2279 = fma(_2265, _155, _2271);
            float _2281 = -_365;
            float _2283 = _2281 + _2273;
            float _2285 = _2277 * _385;
            float _2287 = -_367;
            float _2289 = _2287 + _2279;
            float _2291 = _2277 * _373;
            float _2293 = _2277 * _389;
            float _2295 = fma(_2283, _395, _2285);
            float _2297 = fma(_2283, _393, _2291);
            float _2299 = fma(_2283, _399, _2293);
            float _2301 = fma(_2289, _405, _2295);
            float _2303 = fma(_2289, _401, _2297);
            float _2305 = fma(_2289, _409, _2299);
            float _2307 = _2301 * _2301;
            float _2309 = fma(_2303, _2303, _2307);
            float _2311 = fma(_2305, _2305, _2309);
            _2021 = _2311;
            _653 = _2301;
            _655 = _2303;
            _657 = _2305;
            _2173 = _2303;
            _2179 = _2301;
            _2185 = _2305;
            _2147 = _2267;
        }
        float _2313 = _2021;
        float _2315 = _653;
        float _2317 = _655;
        float _2319 = _657;
        float _2321 = _2173;
        float _2323 = _2179;
        float _2325 = _2185;
        float _2327 = _2147;
        float _2329 = sqrt(_2313);
        float _2331 = rsqrt(_2107);
        bool _2333 = _2329 > 0.0;
        float _2335 = _2083 * _2331;
        float _2337 = _2073 * _2331;
        float _2339 = _2095 * _2331;
        bool _2341 = !_2333;
        _2155 = _2327;
        if (!_2341)
        {
            float _2343 = rsqrt(_2313);
            float _2345 = _2343 * _2315;
            float _2347 = _2343 * _2317;
            float _2349 = _2337 * _2345;
            float _2351 = _2343 * _2319;
            float _2353 = fma(_2335, _2347, _2349);
            float _2355 = fma(_2339, _2351, _2353);
            float _2357 = _2355 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2359 = fma(_2321, _2357, _2067);
            float _2361 = fma(_2323, _2357, _2065);
            float _2363 = fma(_2325, _2357, _2069);
            _2149 = _2359;
            _2151 = _2361;
            _2153 = _2363;
        }
    }
    float _2365 = _2149;
    float _2367 = _2151;
    float _2369 = _2153;
    float _2371 = _2155;
    bool _2373 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2375 = isnan(0.5);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2381 = _2377 || _2379;
    float _2383 = -_1603;
    float _2385 = fma(_2383, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2365);
    float _2387 = -_1593;
    float _2389 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2367);
    float _2391 = -_1661;
    float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2369);
    float _2395 = _2389;
    float _2397 = _2385;
    float _2399 = _2393;
    float _2401 = _2371;
    if (!_2381)
    {
        float _2403 = -_1593;
        float _2405 = fma(_2403, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1423);
        float _2407 = -_1603;
        float _2409 = fma(_2407, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
        float _2411 = -_1661;
        float _2413 = fma(_2411, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1513);
        float _2415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2419 = _2405 + _2417;
        float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2423 = _2409 + _2421;
        float _2425 = -_1513;
        float _2427 = _2425 + _2369;
        float _2429 = -_1357;
        float _2431 = _2429 + _2365;
        float _2433 = _2419 * _2419;
        float _2435 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2437 = _2413 + _2435;
        float _2439 = -_1423;
        float _2441 = _2439 + _2367;
        float _2443 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2445 = fma(_2423, _2423, _2433);
        float _2447 = fma(_2437, _2437, _2445);
        float _2449 = 1.0 / _1799;
        float _2451 = sqrt(_2447);
        float _2453 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2455 = precise::min(_2451, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2457 = _2455 * _2415;
        float _2459 = _2457 * _2449;
        float _2461 = _2453 * _2459;
        float _2463 = _2427 * _2459;
        float _2465 = fma(_2431, _2461, _2409);
        float _2467 = fma(_2441, _2461, _2405);
        float _2469 = fma(_2453, _2463, _2413);
        _2395 = _2467;
        _2397 = _2465;
        _2399 = _2469;
    }
    float _2471 = _2395;
    float _2473 = _2397;
    float _2475 = _2399;
    float _2477 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2479 = _2471 + _2477;
    float _2481 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2483 = _2473 + _2481;
    float _2485 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2487 = _2475 + _2485;
    float _2489 = _2479 * _2479;
    float _2491 = fma(_2483, _2483, _2489);
    float _2493 = fma(_2487, _2487, _2491);
    float _2495 = rsqrt(_2493);
    float _2497 = sqrt(_2493);
    float _2499 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2501 = _2483 * _2499;
    float _2503 = _2487 * _2499;
    float _2505 = _2501 * _2501;
    float _2507 = _2503 * _2503;
    float _2509 = _2505 + _2507;
    float _2511 = sqrt(_2509);
    bool _2513 = _2511 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2517 = _2511 + _2515;
    float _2519 = _2495;
    float _2521 = _2509;
    float _2523 = _2517;
    float _2525 = _2479;
    if (_2513)
    {
        float _2527 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2519 = _2527;
    }
    float _2529 = _2519;
    if (_2513)
    {
        float _2531 = rsqrt(_2509);
        _2521 = _2531;
    }
    float _2533 = _2521;
    float _2535 = _2533;
    if (_2513)
    {
        float _2537 = _2517 * _2529;
        _2523 = _2537;
    }
    float _2539 = _2523;
    if (_2513)
    {
        float _2541 = _2539 * 0.15915493667125701904296875;
        _2401 = _2541;
    }
    float _2543 = _2401;
    float _2545 = _2487;
    float _2547 = _2543;
    if (_2513)
    {
        float _2549 = _2543 * 6.283185482025146484375;
        float _2551 = sin(_2549);
        _2545 = _2551;
    }
    float _2553 = _2545;
    float _2555 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2557 = precise::max(0.0, _2555);
    float _2559 = _2529;
    float _2561 = _2557;
    if (_2513)
    {
        float _2563 = _2543 * 6.283185482025146484375;
        float _2565 = cos(_2563);
        _2559 = _2565;
    }
    float _2567 = _2559;
    float _2569 = -_2499;
    float _2571 = -_2557;
    float _2573 = fma(_2479, _2569, _2571);
    if (_2513)
    {
        float _2575 = _2573 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2525 = _2575;
    }
    float _2577 = _2525;
    float _2579 = _2577;
    float _2581 = _2553;
    if (_2513)
    {
        float _2583 = fma(_2553, _2577, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2579 = _2583;
    }
    float _2585 = _2579;
    float _2587 = _2585;
    if (!_2513)
    {
        _2581 = _2501;
    }
    float _2589 = _2581;
    float _2591 = _2589;
    float _2593 = _2567;
    if (_2513)
    {
        float _2595 = _2567 + (-1.0);
        _2561 = _2595;
    }
    float _2597 = _2561;
    float _2599 = _2597;
    if (_2513)
    {
        float _2601 = _2533 * _2585;
        _461 = _2601;
    }
    float _2603 = _461;
    if (!_2513)
    {
        _2587 = _2573;
    }
    float _2605 = _2587;
    float _2607 = _2605;
    if (_2513)
    {
        float _2609 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2547 = _2609;
    }
    float _2611 = _2547;
    if (_2513)
    {
        float _2613 = _2501 * _2603;
        _2591 = _2613;
    }
    float _2615 = _2591;
    if (!_2513)
    {
        _2599 = _2503;
    }
    float _2617 = _2599;
    float _2619 = _2617;
    if (_2513)
    {
        float _2621 = _2503 * _2603;
        _2619 = _2621;
    }
    float _2623 = _2619;
    if (!_2513)
    {
        _2535 = _2505;
    }
    float _2625 = _2535;
    float _2627 = _2625;
    if (_2513)
    {
        float _2629 = fma(_2573, _2567, _2611);
        _2607 = _2629;
    }
    float _2631 = _2607;
    if (_2513)
    {
        float _2633 = _2615 * _2615;
        _2627 = _2633;
    }
    float _2635 = _2627;
    if (!_2513)
    {
        _2593 = _2507;
    }
    float _2637 = _2593;
    float _2639 = _2637;
    if (_2513)
    {
        float _2641 = _2623 * _2623;
        _2639 = _2641;
    }
    float _2643 = _2639;
    float _2645 = fma(_2631, _2631, _2635);
    float _2647 = _2645 + _2643;
    float _2649 = _2471 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2653 = fma(_2497, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2651);
    float _2655 = precise::clamp(_2653, 0.0, 1.0);
    float _2657 = _2471 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2659 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2661 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2649);
    float _2663 = rsqrt(_2647);
    float _2665 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2657);
    float _2667 = -_2655;
    float _2669 = _2667 + 1.0;
    float _2671 = fma(_2475, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2661);
    float _2673 = _2471 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2675 = _2471 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2677 = fma(_2475, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2665);
    float _2679 = _2671 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2681 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2673);
    float _2683 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2675);
    float _2685 = _2677 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2687 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2689 = fma(_2475, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2681);
    float _2691 = fma(_2475, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2683);
    float _2693 = abs(_2669);
    float _2695 = log2(_2693);
    float _2697 = -_2687;
    float _2699 = fma(_2697, _2659, 1.0);
    float _2701 = _2663 * _2615;
    float _2703 = _2689 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2705 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2707 = _2663 * _2631;
    float _2709 = _2663 * _2623;
    float _2711 = _2691 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2713 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2705);
    float _2715 = _2701 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2717 = log2(_2699);
    float _2719 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2721 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2713);
    float _2723 = -_2715;
    float _2725 = fma(_2707, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2723);
    float _2727 = _2707 + 1.0;
    float _2729 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2721);
    float _2731 = -_2709;
    float _2733 = fma(_2731, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2725);
    float _2735 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2737 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2739 = 1.0 / _2729;
    float _2741 = fma(_2733, -0.5, 0.5);
    float _2743 = fma(_2733, 0.5, 0.5);
    float _2745 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2737);
    float _2747 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2719);
    float _2749 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2745);
    float _2751 = exp2(_2735);
    float _2753 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2747);
    float _2755 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2749);
    float _2757 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2753);
    float _2759 = _2717 * 0.693147182464599609375;
    float _2761 = sqrt(_2741);
    float _2763 = fma(_2743, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2765 = _2755 * _2739;
    float _2767 = _2757 * _2739;
    float _2769 = fma(_2743, _2763, -0.212114393711090087890625);
    float _2771 = fma(_2765, 0.5, 0.5);
    float _2773 = fma(_2767, -0.5, 0.5);
    float _2775 = -_2707;
    float _2777 = fma(_2751, _2727, _2775);
    float _2779 = fma(_2743, _2769, 1.570728778839111328125);
    float _2781 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2783 = fma(_2777, 0.5, 0.5);
    float _2785 = _2761 * 0.636619746685028076171875;
    float3 _7182 = float3(_2771, _2773, _2781);
    float _2787 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7182, float3(0.0), isnan(_7182)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7182, float3(0.0), isnan(_7182)), level(0.0)).x;
    float _2789 = -_2779;
    float _2791 = fma(_2785, _2789, 1.0);
    float3 _7198 = float3(_2771, _2773, _2781);
    float4 _2794 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7198, float3(0.0), isnan(_7198)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7198, float3(0.0), isnan(_7198)), level(0.0)).xyzw;
    float _2796 = _2794.x;
    float _2798 = _2794.y;
    float _2800 = _2794.z;
    float _2802 = _2794.w;
    float2 _7215 = float2(_2791, _2783);
    float3 _2806 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7215, float2(0.0), isnan(_7215)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7215, float2(0.0), isnan(_7215)), level(0.0)).xyz;
    float _2808 = _2806.x;
    float _2810 = _2806.y;
    float _2812 = _2806.z;
    float _2814 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2816 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2818 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2816);
    float _2820 = exp2(_2814);
    float _2822 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2824 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2818);
    float _2826 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2824);
    out.m_45.x = _2822;
    float _2828 = _2826 + _2729;
    out.gl_Position.x = _2755;
    out.gl_Position.y = _2757;
    out.gl_Position.z = _2826;
    out.gl_Position.w = _2729;
    float _2830 = _2828 * 0.5;
    float _2832 = -_2820;
    float _2834 = _2832 + 1.0;
    float _2836 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _2830;
    out.m_70.w = _2729;
    float _2838 = _2836 * _2787;
    float _2840 = -_2836;
    float _2842 = _2840 + 1.0;
    float _2844 = _2802 * _2838;
    float _2846 = _2802 * _2842;
    float _2848 = _2812 * _2838;
    float _2850 = fma(_2808, _2844, _2796);
    float _2852 = fma(_2810, _2844, _2798);
    float _2854 = fma(_2802, _2848, _2800);
    out.m_72.x = _2850;
    out.m_72.y = _2852;
    out.m_72.z = _2854;
    out.m_72.w = _2846;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1235 = false;
    bool _1085 = false;
    bool _971 = false;
    bool _677 = false;
    bool _513 = false;
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
        float _2911 = as_type<float>(_107);
        out.gl_Position.z = _2911;
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
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2980 = as_type<float>(_145);
        out.gl_Position.z = _2980;
    }
    if (_137)
    {
        return out;
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = 0.0;
    float _169 = _149;
    if (!_165)
    {
        float _171 = _125 * _125;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    int _177 = as_type<int>(_147) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_147) & 2;
    bool _183 = _181 != 0;
    float _185 = _147;
    if (!_165)
    {
        float _187 = _149 * _149;
        float _189 = _187 * 0.5;
        _185 = _189;
    }
    float _191 = _185;
    bool _193 = !_179;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _191;
    if (!_165)
    {
        float _199 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_183;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_165;
    float _209 = _201;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _149 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _149);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
        _127 = _229;
    }
    float _241 = _209;
    float _243 = _127;
    bool _245 = !_165;
    float _247 = _243;
    float _249 = _241;
    if (!_245)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _149 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _169 = _269;
        _247 = _257;
    }
    float _271 = _169;
    float _273 = _247;
    float _275 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _277 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _281 = _273;
    if (!_165)
    {
        _281 = _125;
    }
    float _283 = _281;
    float _285 = fma(_271, _151, _275);
    float _287 = _283;
    if (!_165)
    {
        float _289 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _289;
    }
    float _291 = _249;
    bool _293 = !_165;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = _125 * _299;
        float _309 = 1.0 / _303;
        float _311 = _305 * 0.693147182464599609375;
        float _313 = exp2(_307);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _125);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
    }
    float _327 = _295;
    bool _329 = !_165;
    if (!_329)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = 1.0 / _337;
        float _341 = _125 * _333;
        float _343 = exp2(_341);
        float _345 = -_343;
        float _347 = _345 + 1.0;
        float _349 = _347 * _339;
        _287 = _349;
    }
    float _351 = _287;
    float _353 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _355 = fma(_271, _153, _277);
    float _357 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _361 = fma(_351, _153, _353);
    float _363 = fma(_271, _155, _279);
    float _365 = fma(_351, _151, _357);
    float _367 = fma(_351, _155, _359);
    float _369 = -_361;
    float _371 = _355 + _369;
    float _373 = in.m_52.y;
    float _375 = -_365;
    float _377 = _285 + _375;
    float _379 = -_367;
    float _381 = _363 + _379;
    float _383 = _371 * _371;
    float _385 = in.m_54.y;
    float _387 = fma(_377, _377, _383);
    float _389 = in.m_56.y;
    float _391 = fma(_381, _381, _387);
    float _393 = in.m_52.x;
    float _395 = in.m_54.x;
    float _397 = sqrt(_391);
    float _399 = in.m_56.x;
    float _401 = in.m_52.z;
    float _403 = _371 * _373;
    float _405 = in.m_54.z;
    float _407 = _371 * _385;
    float _409 = in.m_56.z;
    bool _411 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _413 = isnan(_397);
    bool _415 = _411 || _413;
    bool _417 = isnan(9.9999999747524270787835121154785e-07);
    bool _419 = _415 || _417;
    float _421 = _371 * _389;
    float _423 = _385 * _385;
    float _425 = in.m_58.w;
    float _427 = fma(_377, _393, _403);
    float _429 = fma(_373, _373, _423);
    float _431 = in.m_42.x;
    float _433 = in.m_42.y;
    float _435 = in.m_42.z;
    float _437 = fma(_377, _395, _407);
    float _439 = fma(_389, _389, _429);
    float _441 = fma(_377, _399, _421);
    float _443 = fma(_381, _401, _427);
    float _445 = fma(_381, _405, _437);
    float _447 = fma(_381, _409, _441);
    float _449 = _381;
    float _451 = _425;
    float _453 = _445;
    float _455 = _447;
    float _457 = _445;
    float _459 = _447;
    float _461 = _361;
    if (_419)
    {
        _449 = _443;
    }
    float _463 = _449;
    float _465 = fma(_285, _425, _431);
    float _467 = fma(_355, _425, _433);
    float _469 = fma(_363, _425, _435);
    float _471 = _463;
    float _473 = _463;
    if (!_419)
    {
        bool _475 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _477 = !_475;
        if (!_477)
        {
            float _479 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _481 = _373 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _483 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _485 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].x, _479);
            float _487 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[16].x, _481);
            float _489 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[16].x, _483);
            float _491 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[16].z, _485);
            float _493 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[16].z, _487);
            float _495 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[16].z, _489);
            float _497 = _491 * _491;
            float _499 = fma(_493, _493, _497);
            float _501 = fma(_495, _495, _499);
            float _503 = rsqrt(_501);
            float _505 = _503 * 9.9999999747524270787835121154785e-07;
            float _507 = _493 * _505;
            float _509 = _491 * _505;
            float _511 = _495 * _505;
            _457 = _509;
            _473 = _507;
            _459 = _511;
            _513 = true;
        }
        else
        {
            float _515 = _153 * _153;
            float _517 = fma(_151, _151, _515);
            float _519 = fma(_155, _155, _517);
            float _521 = sqrt(_519);
            bool _523 = _521 >= 9.9999999747524270787835121154785e-07;
            bool _525 = isnan(_521);
            bool _527 = _523 || _525;
            bool _529 = isnan(9.9999999747524270787835121154785e-07);
            bool _531 = _527 || _529;
            if (!_531)
            {
                float _533 = _433 * _433;
                float _535 = fma(_431, _431, _533);
                float _537 = fma(_435, _435, _535);
                float _539 = sqrt(_537);
                bool _541 = _539 >= 9.9999999747524270787835121154785e-07;
                bool _543 = isnan(_539);
                bool _545 = _541 || _543;
                bool _547 = isnan(9.9999999747524270787835121154785e-07);
                bool _549 = _545 || _547;
                float _551 = _439;
                if (!_549)
                {
                    float _553 = rsqrt(_439);
                    _551 = _553;
                }
                float _555 = _551;
                if (!_549)
                {
                    float _557 = _555 * 9.9999999747524270787835121154785e-07;
                    _451 = _557;
                }
                float _559 = _451;
                if (!_549)
                {
                    float _561 = _373 * _559;
                    _471 = _561;
                }
                float _563 = _471;
                _473 = _563;
                if (!_549)
                {
                    float _565 = _385 * _559;
                    _453 = _565;
                }
                float _567 = _453;
                _457 = _567;
                if (!_549)
                {
                    float _569 = _389 * _559;
                    _455 = _569;
                }
                float _571 = _455;
                bool _573 = !_549;
                _459 = _571;
                _513 = _573;
                if (!_513)
                {
                    float _575 = _385 * _433;
                    float _577 = _373 * _433;
                    float _579 = _389 * _433;
                    float _581 = fma(_431, _395, _575);
                    float _583 = fma(_431, _393, _577);
                    float _585 = fma(_431, _399, _579);
                    float _587 = fma(_435, _405, _581);
                    float _589 = fma(_435, _401, _583);
                    float _591 = fma(_435, _409, _585);
                    float _593 = _587 * _587;
                    float _595 = fma(_589, _589, _593);
                    float _597 = fma(_591, _591, _595);
                    float _599 = rsqrt(_597);
                    float _601 = _599 * 9.9999999747524270787835121154785e-07;
                    float _603 = _589 * _601;
                    float _605 = _587 * _601;
                    float _607 = _591 * _601;
                    _457 = _605;
                    _473 = _603;
                    _459 = _607;
                    _513 = true;
                }
            }
            else
            {
                float _609 = _385 * _153;
                float _611 = _373 * _153;
                float _613 = _389 * _153;
                float _615 = fma(_151, _395, _609);
                float _617 = fma(_151, _393, _611);
                float _619 = fma(_151, _399, _613);
                float _621 = fma(_155, _405, _615);
                float _623 = fma(_155, _401, _617);
                float _625 = fma(_155, _409, _619);
                float _627 = _621 * _621;
                float _629 = fma(_623, _623, _627);
                float _631 = fma(_625, _625, _629);
                float _633 = rsqrt(_631);
                float _635 = _633 * 9.9999999747524270787835121154785e-07;
                float _637 = _623 * _635;
                float _639 = _621 * _635;
                float _641 = _625 * _635;
                _457 = _639;
                _473 = _637;
                _459 = _641;
            }
        }
    }
    _513 = false;
    float _643 = _457;
    float _645 = _473;
    float _647 = _459;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _651 = !_649;
    float _653 = _643;
    float _655 = _645;
    float _657 = _647;
    float _675;
    if (!_651)
    {
        float _659 = in.m_60.x;
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _663 = _659 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        float _679 = float(_91);
        float _681 = 1.0 / _679;
        float _683 = _125 * _681;
        _675 = _683;
    }
    _677 = false;
    float _685 = _675;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _689 = _685 + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _693 = _685 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _711 = 1.0 / _697;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _713;
    bool _717 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _719 = isnan(_685);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = 1.0 / _701;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _733 = _685 + _731;
    float _735 = -_727;
    float _737 = _735 + 1.0;
    bool _739 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _741 = 1.0 / _705;
    float _743 = _733 * _711;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _747 = _685 + _745;
    bool _749 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _751 = isnan(_685);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = 1.0 / _709;
    float _763 = _689 * _729;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _767 = _685 + _765;
    bool _769 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _771 = isnan(_685);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = 1.0 / _715;
    float _783 = _747 * _741;
    bool _785 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _787 = isnan(_685);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = -_759;
    float _799 = _797 + 1.0;
    float _801 = -_795;
    float _803 = _801 + 1.0;
    float _805 = _693 * _761;
    float _807 = _727 * _799;
    float _809 = _759 * _803;
    bool _811 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _813 = isnan(_685);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _827 = _767 * _781;
    float _829 = -_779;
    float _831 = _829 + 1.0;
    float _833 = -_821;
    float _835 = _833 + 1.0;
    float _837 = _821 * _737;
    float _839 = fma(_825, _763, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _841 = _795 * _831;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _847;
    float _851 = fma(_845, _743, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _853 = fma(_849, _743, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _855 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _857 = isnan(_685);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _871 = _865 * _835;
    float _873 = fma(_869, _763, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _875;
    float _879 = -_865;
    float _881 = _879 + 1.0;
    float _883 = _851 * _871;
    float _885 = _853 * _871;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _887;
    float _891 = fma(_877, _783, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _893 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[143].x, _883);
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[143].y, _885);
    float _897 = in.m_58.x;
    float _899 = in.m_58.y;
    float _901 = fma(_889, _783, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _907 = fma(_873, _837, _893);
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _913 = fma(_839, _837, _895);
    float _915 = fma(_905, _805, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _917;
    float _921 = fma(_891, _807, _907);
    float _923 = fma(_911, _805, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _925;
    float _929 = fma(_901, _807, _913);
    float _931 = fma(_919, _827, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _933 = fma(_915, _809, _921);
    float _935 = fma(_927, _827, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _937 = fma(_923, _809, _929);
    float _939 = fma(_931, _841, _933);
    float _941 = fma(_935, _841, _937);
    float _943 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[148].x, _939);
    float _945 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[148].y, _941);
    float _947 = _943 * _897;
    float _949 = _945 * _899;
    bool _951 = !_739;
    float _969;
    if (!_951)
    {
        float _953 = in.m_60.x;
        float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _957 = _953 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _961 = _959 * _955;
        float _963 = floor(_961);
        float _965 = -_963;
        float _967 = _961 + _965;
        _969 = _967;
        _971 = true;
    }
    else
    {
        float _973 = float(_91);
        float _975 = 1.0 / _973;
        float _977 = _125 * _975;
        _969 = _977;
    }
    _971 = false;
    float _979 = _969;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _983 = _979 + _981;
    bool _985 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _987 = isnan(_979);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _997;
    bool _1001 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1003 = isnan(_979);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1009 = _1005 || _1007;
    float _1011 = float(_1009);
    float _1013 = -_995;
    float _1015 = _1013 + 1.0;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1017;
    float _1021 = 1.0 / _999;
    bool _1023 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1025 = _1011 * _1015;
    float _1027 = -_1011;
    float _1029 = _1027 + 1.0;
    float _1031 = _983 * _1021;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1033;
    float _1037 = fma(_1019, _1031, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1039;
    float _1043 = fma(_1035, _1031, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1045 = _1037 * _1025;
    float _1047 = fma(_1041, _1031, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1049 = _1043 * _1025;
    float _1051 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1045);
    float _1053 = _1047 * _1025;
    float _1055 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1049);
    float _1057 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1051);
    float _1059 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1053);
    float _1061 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1055);
    float _1063 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1059);
    bool _1065 = !_1023;
    float _1083;
    if (!_1065)
    {
        float _1067 = in.m_60.x;
        float _1069 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1071 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1073 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _1075 = _1073 * _1069;
        float _1077 = floor(_1075);
        float _1079 = -_1077;
        float _1081 = _1075 + _1079;
        _1083 = _1081;
        _1085 = true;
    }
    else
    {
        float _1087 = float(_91);
        float _1089 = 1.0 / _1087;
        float _1091 = _125 * _1089;
        _1083 = _1091;
    }
    _1085 = false;
    float _1093 = _1083;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1097 = _1093 + _1095;
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1103 = _1093 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1105 = isnan(_1093);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1111 = _1107 || _1109;
    float _1113 = float(_1111);
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1119 = _1093 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1121 = isnan(_1093);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1131;
    bool _1135 = _1093 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1137 = isnan(_1093);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1143 = _1139 || _1141;
    float _1145 = float(_1143);
    float _1147 = 1.0 / _1101;
    float _1149 = -_1113;
    float _1151 = _1149 + 1.0;
    bool _1153 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1155 = _1129 * _1151;
    float _1157 = -_1129;
    float _1159 = _1157 + 1.0;
    float _1161 = 1.0 / _1117;
    float _1163 = _1133 * _1147;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1167 = _1165 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1169 = fma(_1163, _1097, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1171 = -_1145;
    float _1173 = _1171 + 1.0;
    float _1175 = _1169 * _1155;
    float _1177 = _1167 * _1161;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1181 = _1093 + _1179;
    float _1183 = _1113 * _1173;
    float _1185 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1175);
    float _1187 = _1057 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1189 = fma(_1177, _1181, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1191 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1193 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1195 = fma(_1189, _1183, _1185);
    float _1197 = _1063 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1199 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1201 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1195);
    float _1203 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1205 = _1201 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _1193;
    out.m_62.y = _1203;
    out.m_62.z = _1199;
    out.m_62.w = _1205;
    bool _1207 = !_1153;
    float _1231;
    float _1233;
    if (!_1207)
    {
        float _1209 = in.m_60.x;
        float _1211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1213 = float(_91);
        float _1215 = 1.0 / _1213;
        float _1217 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1219 = _125 * _1215;
        float _1221 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _1223 = _1221 * _1211;
        float _1225 = floor(_1223);
        float _1227 = -_1225;
        float _1229 = _1223 + _1227;
        _1231 = _1229;
        _1233 = _1219;
        _1235 = true;
    }
    else
    {
        float _1237 = float(_91);
        float _1239 = 1.0 / _1237;
        float _1241 = _125 * _1239;
        _1231 = _1241;
        _1233 = _1241;
    }
    _1235 = false;
    float _1243 = _1231;
    float _1245 = _1233;
    float _1247 = in.m_60.x;
    float _1249 = in.m_60.y;
    float _1251 = in.m_60.z;
    float _1253 = in.m_60.w;
    float _1255 = _467 * _389;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1259 = _1243 + _1257;
    float _1261 = fma(_465, _399, _1255);
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1265 = _1263 != 0;
    float _1267 = _643 * _643;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1271 = _1269 != 0;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1277 = _1275 != 0;
    float _1279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1283 = _1281 != 0;
    float _1285 = _467 * _373;
    float _1287 = fma(_465, _393, _1285);
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1293;
    bool _1297 = _1247 > 0.5;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1301 = _1299 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1303 = _1253 > 0.5;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1309 = -_195;
    int _1311 = _1297 ? as_type<int>(_1309) : as_type<int>(_195);
    float _1313 = 1.0 / _1291;
    int _1315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1317 = _1315 != 0;
    float _1319 = _467 * _385;
    float _1321 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1323 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1325 = fma(_465, _395, _1319);
    float _1327 = fma(_1321, -2.0, _1273);
    float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1331 = _1329 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1333 = fma(_469, _401, _1287);
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1339 = 1.0 / _1295;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1345 = fma(_469, _405, _1325);
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1349 = fma(_469, _409, _1261);
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1351;
    float _1355 = 1.0 / _1343;
    float _1357 = _1333 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1359;
    float _1363 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1365 = _1363 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1367 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1369 = isnan(_1245);
    bool _1371 = _1367 || _1369;
    bool _1373 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1375 = _1371 || _1373;
    float _1377 = float(_1375);
    float _1379 = 1.0 / _1337;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1381;
    float _1385 = _1259 * _1339;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1391 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1393 = isnan(_1245);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1399 = _1395 || _1397;
    float _1401 = float(_1399);
    float _1403 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1327);
    bool _1405 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1407 = isnan(_1245);
    bool _1409 = _1405 || _1407;
    bool _1411 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1413 = _1409 || _1411;
    float _1415 = float(_1413);
    float _1417 = 1.0 / _1301;
    float _1419 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1421 = _1353 * _1355;
    float _1423 = _1345 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1427 = -_1347;
    float _1429 = fma(_1419, 2.0, _1427);
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1433 = _1423 + _1431;
    float _1435 = 1.0 / _1307;
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1439 = _1245 + _1437;
    float _1441 = _1361 * _1379;
    float _1443 = -_125;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1429);
    bool _1447 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1449 = isnan(_1245);
    bool _1451 = _1447 || _1449;
    bool _1453 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1455 = _1451 || _1453;
    float _1457 = float(_1455);
    float _1459 = 1.0 / _1331;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1461;
    float _1465 = fma(_1463, _1385, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1467 = 1.0 / _1365;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1471 = _1389 * _1459;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1479 = _1477 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1483 = _1357 + _1481;
    float _1485 = _1475 * _1313;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1489 = _1487 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1491 = _1479 * _1417;
    float _1493 = _1479;
    if (!_1317)
    {
        _1493 = _1249;
    }
    float _1495 = _1493;
    float _1497 = _1383 * _1467;
    float _1499 = _1489 * _1435;
    float _1501 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1469);
    float _1503 = _1495;
    if (_1317)
    {
        _1503 = _1247;
    }
    float _1505 = _1503;
    float _1507 = _1433 * _1433;
    bool _1509 = !_1265;
    float _1511 = _1509 ? _195 : as_type<float>(_1311);
    float _1513 = _1349 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1515 = _1249 > 0.5;
    float _1517 = fma(_1483, _1483, _1507);
    float _1519 = _1507;
    float _1521 = _1517;
    if (!_1317)
    {
        _1519 = _1251;
    }
    float _1523 = _1519;
    float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1527 = _1513 + _1525;
    float _1529 = -_205;
    int _1531 = _1515 ? as_type<int>(_1529) : as_type<int>(_205);
    float _1533 = fma(_1485, _1439, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1535 = _1251 > 0.5;
    float _1537 = fma(_1527, _1527, _1517);
    float _1539 = _1523;
    if (!_1317)
    {
        _1521 = _1251;
    }
    float _1541 = _1521;
    float _1543 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1425);
    float _1545 = rsqrt(_1537);
    float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1549 = _1245 + _1547;
    float _1551 = _1541;
    if (_1317)
    {
        _1539 = _1249;
    }
    float _1553 = _1539;
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1555;
    if (_1317)
    {
        _1551 = _1249;
    }
    float _1559 = _1551;
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1563 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1561;
    float _1565 = fma(_1499, _1549, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1567 = fma(_1557, _1385, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1571 = _1245 + _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1575 = _1245 + _1573;
    float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1579 = _1245 + _1577;
    float _1581 = fma(_1563, _1385, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1583 = fma(_1441, _1571, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1587 = _1245 + _1585;
    float _1589 = fma(_1471, _1575, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1593 = _1433 * _1545;
    float _1595 = fma(_1491, _1579, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1599 = _1245 + _1597;
    float _1601 = fma(_1421, _1587, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1603 = _1483 * _1545;
    float _1605 = -_1593;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1433);
    float _1609 = fma(_1497, _1599, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1613 = -_1603;
    float _1615 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1483);
    float _1617 = _1607 * _1607;
    bool _1619 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1621 = isnan(_1245);
    bool _1623 = _1619 || _1621;
    bool _1625 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1627 = _1623 || _1625;
    float _1629 = float(_1627);
    float _1631 = fma(_1559, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1611);
    float _1633 = _1511 + 0.5;
    float _1635 = fma(_1615, _1615, _1617);
    float _1637 = fma(_645, _645, _1267);
    float _1639 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1641 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1643 = isnan(_1245);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1649 = _1645 || _1647;
    float _1651 = float(_1649);
    float _1653 = -_1629;
    float _1655 = _1653 + 1.0;
    float _1657 = fma(_647, _647, _1637);
    float _1659 = fma(_1639, _1633, _1445);
    float _1661 = _1527 * _1545;
    bool _1663 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1665 = isnan(_1245);
    bool _1667 = _1663 || _1665;
    bool _1669 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1671 = _1667 || _1669;
    float _1673 = float(_1671);
    float _1675 = rsqrt(_1657);
    float _1677 = -_1651;
    float _1679 = _1677 + 1.0;
    float _1681 = -_1661;
    float _1683 = fma(_1681, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1527);
    float _1685 = _1651 * _1655;
    bool _1687 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1689 = isnan(_1243);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    float _1699 = _1673 * _1679;
    float _1701 = fma(_1683, _1683, _1635);
    float _1703 = -_1673;
    float _1705 = _1703 + 1.0;
    bool _1707 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1709 = isnan(_1245);
    bool _1711 = _1707 || _1709;
    bool _1713 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1715 = _1711 || _1713;
    float _1717 = float(_1715);
    float _1719 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1721 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1723 = isnan(_1243);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1729 = _1725 || _1727;
    float _1731 = float(_1729);
    float _1733 = _1377 * _1705;
    float _1735 = -_1377;
    float _1737 = _1735 + 1.0;
    float _1739 = -_1717;
    float _1741 = _1739 + 1.0;
    float _1743 = sqrt(_1701);
    float _1745 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1501);
    float _1747 = _1675 * _647;
    float _1749 = _1717 * _1737;
    float _1751 = _1675 * _645;
    float _1753 = _1675 * _643;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1757 = _1747 * _1755;
    float _1759 = _1457 * _1741;
    float _1761 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1763 = _1751 * _1761;
    float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1767 = _1753 * _1765;
    float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1771 = -_1757;
    float _1773 = fma(_1751, _1769, _1771);
    float _1775 = -_1457;
    float _1777 = _1775 + 1.0;
    float _1779 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1781 = -_1763;
    float _1783 = fma(_1753, _1779, _1781);
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1787 = -_1767;
    float _1789 = fma(_1747, _1785, _1787);
    float _1791 = _1773 * _1773;
    bool _1793 = !_1271;
    float _1795 = _1793 ? _205 : as_type<float>(_1531);
    float _1797 = _1415 * _1777;
    float _1799 = _1545 * _1743;
    float _1801 = fma(_1789, _1789, _1791);
    float _1803 = -_1731;
    float _1805 = _1803 + 1.0;
    float _1807 = _1795 + (-0.5);
    float _1809 = -_195;
    int _1811 = _1535 ? as_type<int>(_1809) : as_type<int>(_195);
    float _1813 = fma(_1783, _1783, _1801);
    float _1815 = -_1415;
    float _1817 = _1815 + 1.0;
    float _1819 = _1697 * _1805;
    float _1821 = -_1323;
    float _1823 = -_1403;
    float _1825 = fma(_1821, _1807, _1823);
    float _1827 = rsqrt(_1813);
    float _1829 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1831 = _1567 * _1819;
    float _1833 = _1465 * _1819;
    float _1835 = _1581 * _1819;
    float _1837 = -_205;
    int _1839 = _1303 ? as_type<int>(_1837) : as_type<int>(_205);
    float _1841 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1843 = !_1277;
    float _1845 = _1843 ? _195 : as_type<float>(_1811);
    float _1847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    bool _1849 = !_1283;
    float _1851 = _1849 ? _205 : as_type<float>(_1839);
    float _1853 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1855 = _1829 * _1799;
    float _1857 = _1401 * _1817;
    float _1859 = -_1745;
    float _1861 = _1859 + 1.0;
    float _1863 = _1789 * _1827;
    float _1865 = _1841 * _1799;
    float _1867 = _1783 * _1827;
    float _1869 = _1773 * _1827;
    float _1871 = _1855 * _1853;
    float _1873 = _1865 * _1847;
    float _1875 = _1533 * _1857;
    float _1877 = _1753 * _1867;
    float _1879 = _1751 * _1869;
    float _1881 = _1873 * _1751;
    float _1883 = _1873 * _1747;
    float _1885 = -_1401;
    float _1887 = _1885 + 1.0;
    float _1889 = -_1877;
    float _1891 = fma(_1747, _1869, _1889);
    float _1893 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1895 = _1893 * 0.5;
    float _1897 = fma(_1871, _1863, _1881);
    float _1899 = -_1879;
    float _1901 = fma(_1753, _1863, _1899);
    float _1903 = fma(_1871, _1867, _1883);
    float _1905 = fma(_1887, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1875);
    float _1907 = fma(_1895, _1891, _1897);
    float _1909 = fma(_1895, _1901, _1903);
    float _1911 = fma(_1595, _1797, _1905);
    float _1913 = _1357 + _1907;
    float _1915 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1917 = _1513 + _1909;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1923 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1925 = _1917 + _1923;
    float _1927 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1919);
    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1931 = _1913 + _1929;
    float _1933 = _1925 * _1925;
    float _1935 = _1747 * _1863;
    float _1937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1939 = _1873 * _1753;
    float _1941 = fma(_1931, _1931, _1933);
    float _1943 = fma(_1583, _1759, _1911);
    float _1945 = -_1935;
    float _1947 = fma(_1751, _1867, _1945);
    float _1949 = fma(_1871, _1869, _1939);
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1955 = sqrt(_1941);
    float _1957 = fma(_1565, _1749, _1943);
    float _1959 = fma(_1895, _1947, _1949);
    float _1961 = -_1951;
    float _1963 = fma(_1719, 2.0, _1961);
    float _1965 = -_1697;
    float _1967 = _1965 + 1.0;
    float _1969 = fma(_1915, -2.0, _1953);
    float _1971 = fma(_1609, _1733, _1957);
    float _1973 = _1423 + _1959;
    float _1975 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1831);
    float _1977 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1833);
    float _1979 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1835);
    float _1981 = _1921 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1983 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1985 = _1845 + 0.5;
    float _1987 = _1851 + (-0.5);
    float _1989 = -_125;
    float _1991 = fma(_1989, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1963);
    bool _1993 = _1955 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1995 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1969);
    float _1997 = fma(_1589, _1699, _1971);
    float _1999 = fma(_1981, _1985, _1991);
    float _2001 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1975);
    float _2003 = -_1983;
    float _2005 = -_1995;
    float _2007 = fma(_2003, _1987, _2005);
    float _2009 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1977);
    float _2011 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1979);
    float _2013 = fma(_1601, _1685, _1997);
    float _2015 = _1969;
    float _2017 = _1913;
    float _2019 = _1917;
    float _2021 = _1657;
    if (!_1993)
    {
        _2015 = _1973;
    }
    float _2023 = _2015;
    bool _2025 = !_1993;
    float _2027 = _2023;
    if (!_2025)
    {
        float _2029 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2033 = _1955 + _2031;
        float _2035 = _1973 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2037 = rsqrt(_1941);
        float _2039 = _2033 * _2029;
        float _2041 = _2039 * 0.15915493667125701904296875;
        float _2043 = _2041 * 6.283185482025146484375;
        float _2045 = sin(_2043);
        float _2047 = _2041 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        float _2051 = fma(_2045, _2035, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2053 = _2037 * _2051;
        float _2055 = _2049 + (-1.0);
        float _2057 = fma(_1931, _2053, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2059 = fma(_1925, _2053, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2061 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2063 = fma(_1973, _2049, _2061);
        _2027 = _2063;
        _2017 = _2057;
        _2019 = _2059;
    }
    float _2065 = _2027;
    float _2067 = _2017;
    float _2069 = _2019;
    float _2071 = -_1423;
    float _2073 = _2071 + _2065;
    float _2075 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1543);
    float _2077 = -_1861;
    float _2079 = fma(_1511, _2077, _1659);
    float _2081 = -_1357;
    float _2083 = _2081 + _2067;
    float _2085 = _2073 * _2073;
    float _2087 = -_2075;
    float _2089 = _2087 + 1.0;
    float _2091 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1927);
    float _2093 = -_1513;
    float _2095 = _2093 + _2069;
    float _2097 = fma(_2083, _2083, _2085);
    float _2099 = fma(_1795, _2089, _1825);
    float _2101 = -_2091;
    float _2103 = _2101 + 1.0;
    float _2105 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1631);
    float _2107 = fma(_2095, _2095, _2097);
    float _2109 = _2001 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2111 = -_2103;
    float _2113 = fma(_1845, _2111, _1999);
    float _2115 = -_2105;
    float _2117 = _2115 + 1.0;
    float _2119 = sqrt(_2107);
    float _2121 = _2009 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2123 = _2011 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2125 = fma(_1851, _2117, _2007);
    float _2127 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2131 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2133 = _2123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2135 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2013);
    out.m_64.x = _2079;
    out.m_64.y = _2099;
    out.m_64.z = _2113;
    out.m_64.w = _2125;
    out.m_66.x = _2127;
    out.m_66.y = _2131;
    out.m_66.z = _2133;
    out.m_66.w = _2129;
    bool _2137 = _2119 > 0.0;
    out.m_68.x = _2135;
    bool _2139 = !_2137;
    float _2141 = _2079;
    float _2143 = _2125;
    float _2145 = _2127;
    float _2147 = _2127;
    float _2149 = _2067;
    float _2151 = _2065;
    float _2153 = _2069;
    float _2155 = _2127;
    if (!_2139)
    {
        bool _2157 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2159 = _2099;
        if (_2157)
        {
            float _2161 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2159 = _2161;
        }
        float _2163 = _2159;
        float _2165 = _2163;
        if (_2157)
        {
            float _2167 = _2163 * _645;
            _2141 = _2167;
        }
        float _2169 = _2141;
        float _2171 = _2169;
        float _2173 = _2169;
        if (_2157)
        {
            float _2175 = _2163 * _643;
            _2143 = _2175;
        }
        float _2177 = _2143;
        float _2179 = _2177;
        if (_2157)
        {
            float _2181 = _2163 * _647;
            _2165 = _2181;
        }
        float _2183 = _2165;
        float _2185 = _2183;
        if (!_2157)
        {
            float _2187 = _125 + 1.0;
            float _2189 = _2187;
            if (!_165)
            {
                float _2191 = _2187 * _2187;
                float _2193 = _2191 * 0.5;
                _2171 = _2193;
            }
            float _2195 = _2171;
            float _2197 = _2195;
            if (!_165)
            {
                float _2199 = _2195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2197 = _2199;
            }
            float _2201 = _2197;
            bool _2203 = !_165;
            float _2205 = _2201;
            if (!_2203)
            {
                float _2207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2209 = log2(_2207);
                float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2213 = _2211 + 1.0;
                float _2215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2217 = _2209 * _2187;
                float _2219 = 1.0 / _2213;
                float _2221 = _2215 * 0.693147182464599609375;
                float _2223 = exp2(_2217);
                float _2225 = 1.0 / _2221;
                float _2227 = _2223 + (-1.0);
                float _2229 = -_2227;
                float _2231 = fma(_2229, _2225, _2187);
                float _2233 = _2231 * _2219;
                float _2235 = _2233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2205 = _2235;
            }
            float _2237 = _2205;
            float _2239 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2241 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2243 = !_165;
            if (!_2243)
            {
                float _2245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2247 = log2(_2245);
                float _2249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2251 = _2249 + 1.0;
                float _2253 = 1.0 / _2251;
                float _2255 = _2247 * _2187;
                float _2257 = exp2(_2255);
                float _2259 = -_2257;
                float _2261 = _2259 + 1.0;
                float _2263 = _2261 * _2253;
                _2189 = _2263;
                _2145 = _2255;
            }
            float _2265 = _2189;
            float _2267 = _2145;
            float _2269 = fma(_2265, _153, _2241);
            float _2271 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2273 = fma(_2265, _151, _2239);
            float _2275 = -_361;
            float _2277 = _2275 + _2269;
            float _2279 = fma(_2265, _155, _2271);
            float _2281 = -_365;
            float _2283 = _2281 + _2273;
            float _2285 = _2277 * _385;
            float _2287 = -_367;
            float _2289 = _2287 + _2279;
            float _2291 = _2277 * _373;
            float _2293 = _2277 * _389;
            float _2295 = fma(_2283, _395, _2285);
            float _2297 = fma(_2283, _393, _2291);
            float _2299 = fma(_2283, _399, _2293);
            float _2301 = fma(_2289, _405, _2295);
            float _2303 = fma(_2289, _401, _2297);
            float _2305 = fma(_2289, _409, _2299);
            float _2307 = _2301 * _2301;
            float _2309 = fma(_2303, _2303, _2307);
            float _2311 = fma(_2305, _2305, _2309);
            _2021 = _2311;
            _653 = _2301;
            _655 = _2303;
            _657 = _2305;
            _2173 = _2303;
            _2179 = _2301;
            _2185 = _2305;
            _2147 = _2267;
        }
        float _2313 = _2021;
        float _2315 = _653;
        float _2317 = _655;
        float _2319 = _657;
        float _2321 = _2173;
        float _2323 = _2179;
        float _2325 = _2185;
        float _2327 = _2147;
        float _2329 = sqrt(_2313);
        float _2331 = rsqrt(_2107);
        bool _2333 = _2329 > 0.0;
        float _2335 = _2083 * _2331;
        float _2337 = _2073 * _2331;
        float _2339 = _2095 * _2331;
        bool _2341 = !_2333;
        _2155 = _2327;
        if (!_2341)
        {
            float _2343 = rsqrt(_2313);
            float _2345 = _2343 * _2315;
            float _2347 = _2343 * _2317;
            float _2349 = _2337 * _2345;
            float _2351 = _2343 * _2319;
            float _2353 = fma(_2335, _2347, _2349);
            float _2355 = fma(_2339, _2351, _2353);
            float _2357 = _2355 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2359 = fma(_2321, _2357, _2067);
            float _2361 = fma(_2323, _2357, _2065);
            float _2363 = fma(_2325, _2357, _2069);
            _2149 = _2359;
            _2151 = _2361;
            _2153 = _2363;
        }
    }
    float _2365 = _2149;
    float _2367 = _2151;
    float _2369 = _2153;
    float _2371 = _2155;
    bool _2373 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2375 = isnan(0.5);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2381 = _2377 || _2379;
    float _2383 = -_1603;
    float _2385 = fma(_2383, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2365);
    float _2387 = -_1593;
    float _2389 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2367);
    float _2391 = -_1661;
    float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2369);
    float _2395 = _2389;
    float _2397 = _2385;
    float _2399 = _2393;
    float _2401 = _2371;
    if (!_2381)
    {
        float _2403 = -_1593;
        float _2405 = fma(_2403, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1423);
        float _2407 = -_1603;
        float _2409 = fma(_2407, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
        float _2411 = -_1661;
        float _2413 = fma(_2411, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1513);
        float _2415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2419 = _2405 + _2417;
        float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2423 = _2409 + _2421;
        float _2425 = -_1513;
        float _2427 = _2425 + _2369;
        float _2429 = -_1357;
        float _2431 = _2429 + _2365;
        float _2433 = _2419 * _2419;
        float _2435 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2437 = _2413 + _2435;
        float _2439 = -_1423;
        float _2441 = _2439 + _2367;
        float _2443 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2445 = fma(_2423, _2423, _2433);
        float _2447 = fma(_2437, _2437, _2445);
        float _2449 = 1.0 / _1799;
        float _2451 = sqrt(_2447);
        float _2453 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2455 = precise::min(_2451, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2457 = _2455 * _2415;
        float _2459 = _2457 * _2449;
        float _2461 = _2453 * _2459;
        float _2463 = _2427 * _2459;
        float _2465 = fma(_2431, _2461, _2409);
        float _2467 = fma(_2441, _2461, _2405);
        float _2469 = fma(_2453, _2463, _2413);
        _2395 = _2467;
        _2397 = _2465;
        _2399 = _2469;
    }
    float _2471 = _2395;
    float _2473 = _2397;
    float _2475 = _2399;
    float _2477 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2479 = _2471 + _2477;
    float _2481 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2483 = _2473 + _2481;
    float _2485 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2487 = _2475 + _2485;
    float _2489 = _2479 * _2479;
    float _2491 = fma(_2483, _2483, _2489);
    float _2493 = fma(_2487, _2487, _2491);
    float _2495 = rsqrt(_2493);
    float _2497 = sqrt(_2493);
    float _2499 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2501 = _2483 * _2499;
    float _2503 = _2487 * _2499;
    float _2505 = _2501 * _2501;
    float _2507 = _2503 * _2503;
    float _2509 = _2505 + _2507;
    float _2511 = sqrt(_2509);
    bool _2513 = _2511 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2517 = _2511 + _2515;
    float _2519 = _2495;
    float _2521 = _2509;
    float _2523 = _2517;
    float _2525 = _2479;
    if (_2513)
    {
        float _2527 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2519 = _2527;
    }
    float _2529 = _2519;
    if (_2513)
    {
        float _2531 = rsqrt(_2509);
        _2521 = _2531;
    }
    float _2533 = _2521;
    float _2535 = _2533;
    if (_2513)
    {
        float _2537 = _2517 * _2529;
        _2523 = _2537;
    }
    float _2539 = _2523;
    if (_2513)
    {
        float _2541 = _2539 * 0.15915493667125701904296875;
        _2401 = _2541;
    }
    float _2543 = _2401;
    float _2545 = _2487;
    float _2547 = _2543;
    if (_2513)
    {
        float _2549 = _2543 * 6.283185482025146484375;
        float _2551 = sin(_2549);
        _2545 = _2551;
    }
    float _2553 = _2545;
    float _2555 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2557 = precise::max(0.0, _2555);
    float _2559 = _2529;
    float _2561 = _2557;
    if (_2513)
    {
        float _2563 = _2543 * 6.283185482025146484375;
        float _2565 = cos(_2563);
        _2559 = _2565;
    }
    float _2567 = _2559;
    float _2569 = -_2499;
    float _2571 = -_2557;
    float _2573 = fma(_2479, _2569, _2571);
    if (_2513)
    {
        float _2575 = _2573 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2525 = _2575;
    }
    float _2577 = _2525;
    float _2579 = _2577;
    float _2581 = _2553;
    if (_2513)
    {
        float _2583 = fma(_2553, _2577, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2579 = _2583;
    }
    float _2585 = _2579;
    float _2587 = _2585;
    if (!_2513)
    {
        _2581 = _2501;
    }
    float _2589 = _2581;
    float _2591 = _2589;
    float _2593 = _2567;
    if (_2513)
    {
        float _2595 = _2567 + (-1.0);
        _2561 = _2595;
    }
    float _2597 = _2561;
    float _2599 = _2597;
    if (_2513)
    {
        float _2601 = _2533 * _2585;
        _461 = _2601;
    }
    float _2603 = _461;
    if (!_2513)
    {
        _2587 = _2573;
    }
    float _2605 = _2587;
    float _2607 = _2605;
    if (_2513)
    {
        float _2609 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2547 = _2609;
    }
    float _2611 = _2547;
    if (_2513)
    {
        float _2613 = _2501 * _2603;
        _2591 = _2613;
    }
    float _2615 = _2591;
    if (!_2513)
    {
        _2599 = _2503;
    }
    float _2617 = _2599;
    float _2619 = _2617;
    if (_2513)
    {
        float _2621 = _2503 * _2603;
        _2619 = _2621;
    }
    float _2623 = _2619;
    if (!_2513)
    {
        _2535 = _2505;
    }
    float _2625 = _2535;
    float _2627 = _2625;
    if (_2513)
    {
        float _2629 = fma(_2573, _2567, _2611);
        _2607 = _2629;
    }
    float _2631 = _2607;
    if (_2513)
    {
        float _2633 = _2615 * _2615;
        _2627 = _2633;
    }
    float _2635 = _2627;
    if (!_2513)
    {
        _2593 = _2507;
    }
    float _2637 = _2593;
    float _2639 = _2637;
    if (_2513)
    {
        float _2641 = _2623 * _2623;
        _2639 = _2641;
    }
    float _2643 = _2639;
    float _2645 = fma(_2631, _2631, _2635);
    float _2647 = _2645 + _2643;
    float _2649 = _2471 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2653 = fma(_2497, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2651);
    float _2655 = precise::clamp(_2653, 0.0, 1.0);
    float _2657 = _2471 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2659 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2661 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2649);
    float _2663 = rsqrt(_2647);
    float _2665 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2657);
    float _2667 = -_2655;
    float _2669 = _2667 + 1.0;
    float _2671 = fma(_2475, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2661);
    float _2673 = _2471 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2675 = _2471 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2677 = fma(_2475, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2665);
    float _2679 = _2671 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2681 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2673);
    float _2683 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2675);
    float _2685 = _2677 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2687 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2689 = fma(_2475, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2681);
    float _2691 = fma(_2475, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2683);
    float _2693 = abs(_2669);
    float _2695 = log2(_2693);
    float _2697 = -_2687;
    float _2699 = fma(_2697, _2659, 1.0);
    float _2701 = _2663 * _2615;
    float _2703 = _2689 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2705 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2707 = _2663 * _2631;
    float _2709 = _2663 * _2623;
    float _2711 = _2691 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2713 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2705);
    float _2715 = _2701 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2717 = log2(_2699);
    float _2719 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2721 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2713);
    float _2723 = -_2715;
    float _2725 = fma(_2707, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2723);
    float _2727 = _2707 + 1.0;
    float _2729 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2721);
    float _2731 = -_2709;
    float _2733 = fma(_2731, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2725);
    float _2735 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2737 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2739 = 1.0 / _2729;
    float _2741 = fma(_2733, -0.5, 0.5);
    float _2743 = fma(_2733, 0.5, 0.5);
    float _2745 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2737);
    float _2747 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2719);
    float _2749 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2745);
    float _2751 = exp2(_2735);
    float _2753 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2747);
    float _2755 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2749);
    float _2757 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2753);
    float _2759 = _2717 * 0.693147182464599609375;
    float _2761 = sqrt(_2741);
    float _2763 = fma(_2743, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2765 = _2755 * _2739;
    float _2767 = _2757 * _2739;
    float _2769 = fma(_2743, _2763, -0.212114393711090087890625);
    float _2771 = fma(_2765, 0.5, 0.5);
    float _2773 = fma(_2767, -0.5, 0.5);
    float _2775 = -_2707;
    float _2777 = fma(_2751, _2727, _2775);
    float _2779 = fma(_2743, _2769, 1.570728778839111328125);
    float _2781 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2783 = fma(_2777, 0.5, 0.5);
    float _2785 = _2761 * 0.636619746685028076171875;
    float3 _7182 = float3(_2771, _2773, _2781);
    float _2787 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7182, float3(0.0), isnan(_7182)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7182, float3(0.0), isnan(_7182)), level(0.0)).x;
    float _2789 = -_2779;
    float _2791 = fma(_2785, _2789, 1.0);
    float3 _7198 = float3(_2771, _2773, _2781);
    float4 _2794 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7198, float3(0.0), isnan(_7198)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7198, float3(0.0), isnan(_7198)), level(0.0)).xyzw;
    float _2796 = _2794.x;
    float _2798 = _2794.y;
    float _2800 = _2794.z;
    float _2802 = _2794.w;
    float2 _7215 = float2(_2791, _2783);
    float3 _2806 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7215, float2(0.0), isnan(_7215)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7215, float2(0.0), isnan(_7215)), level(0.0)).xyz;
    float _2808 = _2806.x;
    float _2810 = _2806.y;
    float _2812 = _2806.z;
    float _2814 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2816 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2818 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2816);
    float _2820 = exp2(_2814);
    float _2822 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2824 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2818);
    float _2826 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2824);
    out.m_45.x = _2822;
    float _2828 = _2826 + _2729;
    out.gl_Position.x = _2755;
    out.gl_Position.y = _2757;
    out.gl_Position.z = _2826;
    out.gl_Position.w = _2729;
    float _2830 = _2828 * 0.5;
    float _2832 = -_2820;
    float _2834 = _2832 + 1.0;
    float _2836 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _2830;
    out.m_70.w = _2729;
    float _2838 = _2836 * _2787;
    float _2840 = -_2836;
    float _2842 = _2840 + 1.0;
    float _2844 = _2802 * _2838;
    float _2846 = _2802 * _2842;
    float _2848 = _2812 * _2838;
    float _2850 = fma(_2808, _2844, _2796);
    float _2852 = fma(_2810, _2844, _2798);
    float _2854 = fma(_2802, _2848, _2800);
    out.m_72.x = _2850;
    out.m_72.y = _2852;
    out.m_72.z = _2854;
    out.m_72.w = _2846;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1235 = false;
    bool _1085 = false;
    bool _971 = false;
    bool _677 = false;
    bool _513 = false;
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
        float _2911 = as_type<float>(_107);
        out.gl_Position.z = _2911;
    }
    if (!_95)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    if (_121)
    {
        float _129 = float(_91);
        _101 = _129;
    }
    float _131 = _101;
    bool _133 = _125 >= _131;
    bool _135 = !_121;
    bool _137 = _133 || _135;
    float _139 = _131;
    if (_137)
    {
        _139 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _141 = _139;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _143 = _141 * 5.0;
        _109 = as_type<int>(_143);
    }
    int _145 = _109;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2980 = as_type<float>(_145);
        out.gl_Position.z = _2980;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _147 = as_type<float>(int(gl_VertexIndex));
    float _149 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _151 = in.m_47.x;
    float _153 = in.m_47.y;
    float _155 = in.m_47.z;
    bool _157 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _159 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _161 = _157 || _159;
    bool _163 = isnan(1.0);
    bool _165 = _161 || _163;
    float _167 = 0.0;
    float _169 = _149;
    if (!_165)
    {
        float _171 = _125 * _125;
        float _173 = _171 * 0.5;
        _167 = _173;
    }
    float _175 = _167;
    int _177 = as_type<int>(_147) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_147) & 2;
    bool _183 = _181 != 0;
    float _185 = _147;
    if (!_165)
    {
        float _187 = _149 * _149;
        float _189 = _187 * 0.5;
        _185 = _189;
    }
    float _191 = _185;
    bool _193 = !_179;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = _191;
    if (!_165)
    {
        float _199 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _197 = _199;
    }
    float _201 = _197;
    bool _203 = !_183;
    float _205 = _203 ? (-0.5) : 0.5;
    bool _207 = !_165;
    float _209 = _201;
    if (!_207)
    {
        float _211 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _213 = log2(_211);
        float _215 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _217 = _215 + 1.0;
        float _219 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = _149 * _213;
        float _223 = 1.0 / _217;
        float _225 = _219 * 0.693147182464599609375;
        float _227 = exp2(_221);
        float _229 = 1.0 / _225;
        float _231 = _227 + (-1.0);
        float _233 = -_231;
        float _235 = fma(_233, _229, _149);
        float _237 = _235 * _223;
        float _239 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _209 = _239;
        _127 = _229;
    }
    float _241 = _209;
    float _243 = _127;
    bool _245 = !_165;
    float _247 = _243;
    float _249 = _241;
    if (!_245)
    {
        float _251 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _253 = log2(_251);
        float _255 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _257 = _255 + 1.0;
        float _259 = 1.0 / _257;
        float _261 = _149 * _253;
        float _263 = exp2(_261);
        float _265 = -_263;
        float _267 = _265 + 1.0;
        float _269 = _267 * _259;
        _169 = _269;
        _247 = _257;
    }
    float _271 = _169;
    float _273 = _247;
    float _275 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _277 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _279 = _241 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _281 = _273;
    if (!_165)
    {
        _281 = _125;
    }
    float _283 = _281;
    float _285 = fma(_271, _151, _275);
    float _287 = _283;
    if (!_165)
    {
        float _289 = _175 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _249 = _289;
    }
    float _291 = _249;
    bool _293 = !_165;
    float _295 = _291;
    if (!_293)
    {
        float _297 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _299 = log2(_297);
        float _301 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _303 = _301 + 1.0;
        float _305 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = _125 * _299;
        float _309 = 1.0 / _303;
        float _311 = _305 * 0.693147182464599609375;
        float _313 = exp2(_307);
        float _315 = 1.0 / _311;
        float _317 = _313 + (-1.0);
        float _319 = -_317;
        float _321 = fma(_319, _315, _125);
        float _323 = _321 * _309;
        float _325 = _323 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _295 = _325;
    }
    float _327 = _295;
    bool _329 = !_165;
    if (!_329)
    {
        float _331 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _333 = log2(_331);
        float _335 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _337 = _335 + 1.0;
        float _339 = 1.0 / _337;
        float _341 = _125 * _333;
        float _343 = exp2(_341);
        float _345 = -_343;
        float _347 = _345 + 1.0;
        float _349 = _347 * _339;
        _287 = _349;
    }
    float _351 = _287;
    float _353 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _355 = fma(_271, _153, _277);
    float _357 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = _327 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _361 = fma(_351, _153, _353);
    float _363 = fma(_271, _155, _279);
    float _365 = fma(_351, _151, _357);
    float _367 = fma(_351, _155, _359);
    float _369 = -_361;
    float _371 = _355 + _369;
    float _373 = in.m_52.y;
    float _375 = -_365;
    float _377 = _285 + _375;
    float _379 = -_367;
    float _381 = _363 + _379;
    float _383 = _371 * _371;
    float _385 = in.m_54.y;
    float _387 = fma(_377, _377, _383);
    float _389 = in.m_56.y;
    float _391 = fma(_381, _381, _387);
    float _393 = in.m_52.x;
    float _395 = in.m_54.x;
    float _397 = sqrt(_391);
    float _399 = in.m_56.x;
    float _401 = in.m_52.z;
    float _403 = _371 * _373;
    float _405 = in.m_54.z;
    float _407 = _371 * _385;
    float _409 = in.m_56.z;
    bool _411 = _397 >= 9.9999999747524270787835121154785e-07;
    bool _413 = isnan(_397);
    bool _415 = _411 || _413;
    bool _417 = isnan(9.9999999747524270787835121154785e-07);
    bool _419 = _415 || _417;
    float _421 = _371 * _389;
    float _423 = _385 * _385;
    float _425 = in.m_58.w;
    float _427 = fma(_377, _393, _403);
    float _429 = fma(_373, _373, _423);
    float _431 = in.m_42.x;
    float _433 = in.m_42.y;
    float _435 = in.m_42.z;
    float _437 = fma(_377, _395, _407);
    float _439 = fma(_389, _389, _429);
    float _441 = fma(_377, _399, _421);
    float _443 = fma(_381, _401, _427);
    float _445 = fma(_381, _405, _437);
    float _447 = fma(_381, _409, _441);
    float _449 = _381;
    float _451 = _425;
    float _453 = _445;
    float _455 = _447;
    float _457 = _445;
    float _459 = _447;
    float _461 = _361;
    if (_419)
    {
        _449 = _443;
    }
    float _463 = _449;
    float _465 = fma(_285, _425, _431);
    float _467 = fma(_355, _425, _433);
    float _469 = fma(_363, _425, _435);
    float _471 = _463;
    float _473 = _463;
    if (!_419)
    {
        bool _475 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _477 = !_475;
        if (!_477)
        {
            float _479 = _385 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _481 = _373 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _483 = _389 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _485 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].x, _479);
            float _487 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[16].x, _481);
            float _489 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[16].x, _483);
            float _491 = fma(_405, (*spvDescriptorSet0.vp_c9)._m0[16].z, _485);
            float _493 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[16].z, _487);
            float _495 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[16].z, _489);
            float _497 = _491 * _491;
            float _499 = fma(_493, _493, _497);
            float _501 = fma(_495, _495, _499);
            float _503 = rsqrt(_501);
            float _505 = _503 * 9.9999999747524270787835121154785e-07;
            float _507 = _493 * _505;
            float _509 = _491 * _505;
            float _511 = _495 * _505;
            _457 = _509;
            _473 = _507;
            _459 = _511;
            _513 = true;
        }
        else
        {
            float _515 = _153 * _153;
            float _517 = fma(_151, _151, _515);
            float _519 = fma(_155, _155, _517);
            float _521 = sqrt(_519);
            bool _523 = _521 >= 9.9999999747524270787835121154785e-07;
            bool _525 = isnan(_521);
            bool _527 = _523 || _525;
            bool _529 = isnan(9.9999999747524270787835121154785e-07);
            bool _531 = _527 || _529;
            if (!_531)
            {
                float _533 = _433 * _433;
                float _535 = fma(_431, _431, _533);
                float _537 = fma(_435, _435, _535);
                float _539 = sqrt(_537);
                bool _541 = _539 >= 9.9999999747524270787835121154785e-07;
                bool _543 = isnan(_539);
                bool _545 = _541 || _543;
                bool _547 = isnan(9.9999999747524270787835121154785e-07);
                bool _549 = _545 || _547;
                float _551 = _439;
                if (!_549)
                {
                    float _553 = rsqrt(_439);
                    _551 = _553;
                }
                float _555 = _551;
                if (!_549)
                {
                    float _557 = _555 * 9.9999999747524270787835121154785e-07;
                    _451 = _557;
                }
                float _559 = _451;
                if (!_549)
                {
                    float _561 = _373 * _559;
                    _471 = _561;
                }
                float _563 = _471;
                _473 = _563;
                if (!_549)
                {
                    float _565 = _385 * _559;
                    _453 = _565;
                }
                float _567 = _453;
                _457 = _567;
                if (!_549)
                {
                    float _569 = _389 * _559;
                    _455 = _569;
                }
                float _571 = _455;
                bool _573 = !_549;
                _459 = _571;
                _513 = _573;
                if (!_513)
                {
                    float _575 = _385 * _433;
                    float _577 = _373 * _433;
                    float _579 = _389 * _433;
                    float _581 = fma(_431, _395, _575);
                    float _583 = fma(_431, _393, _577);
                    float _585 = fma(_431, _399, _579);
                    float _587 = fma(_435, _405, _581);
                    float _589 = fma(_435, _401, _583);
                    float _591 = fma(_435, _409, _585);
                    float _593 = _587 * _587;
                    float _595 = fma(_589, _589, _593);
                    float _597 = fma(_591, _591, _595);
                    float _599 = rsqrt(_597);
                    float _601 = _599 * 9.9999999747524270787835121154785e-07;
                    float _603 = _589 * _601;
                    float _605 = _587 * _601;
                    float _607 = _591 * _601;
                    _457 = _605;
                    _473 = _603;
                    _459 = _607;
                    _513 = true;
                }
            }
            else
            {
                float _609 = _385 * _153;
                float _611 = _373 * _153;
                float _613 = _389 * _153;
                float _615 = fma(_151, _395, _609);
                float _617 = fma(_151, _393, _611);
                float _619 = fma(_151, _399, _613);
                float _621 = fma(_155, _405, _615);
                float _623 = fma(_155, _401, _617);
                float _625 = fma(_155, _409, _619);
                float _627 = _621 * _621;
                float _629 = fma(_623, _623, _627);
                float _631 = fma(_625, _625, _629);
                float _633 = rsqrt(_631);
                float _635 = _633 * 9.9999999747524270787835121154785e-07;
                float _637 = _623 * _635;
                float _639 = _621 * _635;
                float _641 = _625 * _635;
                _457 = _639;
                _473 = _637;
                _459 = _641;
            }
        }
    }
    _513 = false;
    float _643 = _457;
    float _645 = _473;
    float _647 = _459;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _651 = !_649;
    float _653 = _643;
    float _655 = _645;
    float _657 = _647;
    float _675;
    if (!_651)
    {
        float _659 = in.m_60.x;
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _663 = _659 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[12].x, _125);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        float _679 = float(_91);
        float _681 = 1.0 / _679;
        float _683 = _125 * _681;
        _675 = _683;
    }
    _677 = false;
    float _685 = _675;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _689 = _685 + _687;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _693 = _685 + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _697 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _695;
    float _699 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _701 = _699 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _703 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _703;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _709 = _707 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _711 = 1.0 / _697;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _713;
    bool _717 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _719 = isnan(_685);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = 1.0 / _701;
    float _731 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _733 = _685 + _731;
    float _735 = -_727;
    float _737 = _735 + 1.0;
    bool _739 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _741 = 1.0 / _705;
    float _743 = _733 * _711;
    float _745 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _747 = _685 + _745;
    bool _749 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _751 = isnan(_685);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = 1.0 / _709;
    float _763 = _689 * _729;
    float _765 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _767 = _685 + _765;
    bool _769 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _771 = isnan(_685);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = 1.0 / _715;
    float _783 = _747 * _741;
    bool _785 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _787 = isnan(_685);
    bool _789 = _785 || _787;
    bool _791 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _793 = _789 || _791;
    float _795 = float(_793);
    float _797 = -_759;
    float _799 = _797 + 1.0;
    float _801 = -_795;
    float _803 = _801 + 1.0;
    float _805 = _693 * _761;
    float _807 = _727 * _799;
    float _809 = _759 * _803;
    bool _811 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _813 = isnan(_685);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _825 = _823 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _827 = _767 * _781;
    float _829 = -_779;
    float _831 = _829 + 1.0;
    float _833 = -_821;
    float _835 = _833 + 1.0;
    float _837 = _821 * _737;
    float _839 = fma(_825, _763, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _841 = _795 * _831;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _843;
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _847;
    float _851 = fma(_845, _743, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _853 = fma(_849, _743, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _855 = _685 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _857 = isnan(_685);
    bool _859 = _855 || _857;
    bool _861 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _863 = _859 || _861;
    float _865 = float(_863);
    float _867 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _869 = _867 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _871 = _865 * _835;
    float _873 = fma(_869, _763, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _875;
    float _879 = -_865;
    float _881 = _879 + 1.0;
    float _883 = _851 * _871;
    float _885 = _853 * _871;
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _887;
    float _891 = fma(_877, _783, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _893 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[143].x, _883);
    float _895 = fma(_881, (*spvDescriptorSet0.vp_c9)._m0[143].y, _885);
    float _897 = in.m_58.x;
    float _899 = in.m_58.y;
    float _901 = fma(_889, _783, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _903 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _905 = _903 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _907 = fma(_873, _837, _893);
    float _909 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _911 = _909 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _913 = fma(_839, _837, _895);
    float _915 = fma(_905, _805, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _917 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _919 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _917;
    float _921 = fma(_891, _807, _907);
    float _923 = fma(_911, _805, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _925;
    float _929 = fma(_901, _807, _913);
    float _931 = fma(_919, _827, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _933 = fma(_915, _809, _921);
    float _935 = fma(_927, _827, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _937 = fma(_923, _809, _929);
    float _939 = fma(_931, _841, _933);
    float _941 = fma(_935, _841, _937);
    float _943 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[148].x, _939);
    float _945 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[148].y, _941);
    float _947 = _943 * _897;
    float _949 = _945 * _899;
    bool _951 = !_739;
    float _969;
    if (!_951)
    {
        float _953 = in.m_60.x;
        float _955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _957 = _953 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _959 = fma(_957, (*spvDescriptorSet0.vp_c9)._m0[11].x, _125);
        float _961 = _959 * _955;
        float _963 = floor(_961);
        float _965 = -_963;
        float _967 = _961 + _965;
        _969 = _967;
        _971 = true;
    }
    else
    {
        float _973 = float(_91);
        float _975 = 1.0 / _973;
        float _977 = _125 * _975;
        _969 = _977;
    }
    _971 = false;
    float _979 = _969;
    float _981 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _983 = _979 + _981;
    bool _985 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _987 = isnan(_979);
    bool _989 = _985 || _987;
    bool _991 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _993 = _989 || _991;
    float _995 = float(_993);
    float _997 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _999 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _997;
    bool _1001 = _979 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _1003 = isnan(_979);
    bool _1005 = _1001 || _1003;
    bool _1007 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _1009 = _1005 || _1007;
    float _1011 = float(_1009);
    float _1013 = -_995;
    float _1015 = _1013 + 1.0;
    float _1017 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _1019 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _1017;
    float _1021 = 1.0 / _999;
    bool _1023 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _1025 = _1011 * _1015;
    float _1027 = -_1011;
    float _1029 = _1027 + 1.0;
    float _1031 = _983 * _1021;
    float _1033 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _1035 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _1033;
    float _1037 = fma(_1019, _1031, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _1039 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _1041 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _1039;
    float _1043 = fma(_1035, _1031, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _1045 = _1037 * _1025;
    float _1047 = fma(_1041, _1031, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _1049 = _1043 * _1025;
    float _1051 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].x, _1045);
    float _1053 = _1047 * _1025;
    float _1055 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].z, _1049);
    float _1057 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[108].x, _1051);
    float _1059 = fma(_1029, (*spvDescriptorSet0.vp_c9)._m0[107].y, _1053);
    float _1061 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[108].z, _1055);
    float _1063 = fma(_995, (*spvDescriptorSet0.vp_c9)._m0[108].y, _1059);
    bool _1065 = !_1023;
    float _1083;
    if (!_1065)
    {
        float _1067 = in.m_60.x;
        float _1069 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _1071 = _1067 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _1073 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[11].y, _125);
        float _1075 = _1073 * _1069;
        float _1077 = floor(_1075);
        float _1079 = -_1077;
        float _1081 = _1075 + _1079;
        _1083 = _1081;
        _1085 = true;
    }
    else
    {
        float _1087 = float(_91);
        float _1089 = 1.0 / _1087;
        float _1091 = _125 * _1089;
        _1083 = _1091;
    }
    _1085 = false;
    float _1093 = _1083;
    float _1095 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1097 = _1093 + _1095;
    float _1099 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1101 = _1099 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1103 = _1093 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1105 = isnan(_1093);
    bool _1107 = _1103 || _1105;
    bool _1109 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1111 = _1107 || _1109;
    float _1113 = float(_1111);
    float _1115 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1117 = _1115 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1119 = _1093 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1121 = isnan(_1093);
    bool _1123 = _1119 || _1121;
    bool _1125 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1127 = _1123 || _1125;
    float _1129 = float(_1127);
    float _1131 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1131;
    bool _1135 = _1093 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1137 = isnan(_1093);
    bool _1139 = _1135 || _1137;
    bool _1141 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1143 = _1139 || _1141;
    float _1145 = float(_1143);
    float _1147 = 1.0 / _1101;
    float _1149 = -_1113;
    float _1151 = _1149 + 1.0;
    bool _1153 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1155 = _1129 * _1151;
    float _1157 = -_1129;
    float _1159 = _1157 + 1.0;
    float _1161 = 1.0 / _1117;
    float _1163 = _1133 * _1147;
    float _1165 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1167 = _1165 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1169 = fma(_1163, _1097, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1171 = -_1145;
    float _1173 = _1171 + 1.0;
    float _1175 = _1169 * _1155;
    float _1177 = _1167 * _1161;
    float _1179 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1181 = _1093 + _1179;
    float _1183 = _1113 * _1173;
    float _1185 = fma(_1159, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1175);
    float _1187 = _1057 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1189 = fma(_1177, _1181, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1191 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1193 = _1187 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1195 = fma(_1189, _1183, _1185);
    float _1197 = _1063 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1199 = _1191 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1201 = fma(_1145, (*spvDescriptorSet0.vp_c9)._m0[117].x, _1195);
    float _1203 = _1197 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1205 = _1201 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_62.x = _1193;
    out.m_62.y = _1203;
    out.m_62.z = _1199;
    out.m_62.w = _1205;
    bool _1207 = !_1153;
    float _1231;
    float _1233;
    if (!_1207)
    {
        float _1209 = in.m_60.x;
        float _1211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1213 = float(_91);
        float _1215 = 1.0 / _1213;
        float _1217 = _1209 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1219 = _125 * _1215;
        float _1221 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[11].z, _125);
        float _1223 = _1221 * _1211;
        float _1225 = floor(_1223);
        float _1227 = -_1225;
        float _1229 = _1223 + _1227;
        _1231 = _1229;
        _1233 = _1219;
        _1235 = true;
    }
    else
    {
        float _1237 = float(_91);
        float _1239 = 1.0 / _1237;
        float _1241 = _125 * _1239;
        _1231 = _1241;
        _1233 = _1241;
    }
    _1235 = false;
    float _1243 = _1231;
    float _1245 = _1233;
    float _1247 = in.m_60.x;
    float _1249 = in.m_60.y;
    float _1251 = in.m_60.z;
    float _1253 = in.m_60.w;
    float _1255 = _467 * _389;
    float _1257 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1259 = _1243 + _1257;
    float _1261 = fma(_465, _399, _1255);
    int _1263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1265 = _1263 != 0;
    float _1267 = _643 * _643;
    int _1269 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1271 = _1269 != 0;
    float _1273 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _1275 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1277 = _1275 != 0;
    float _1279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1281 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1283 = _1281 != 0;
    float _1285 = _467 * _373;
    float _1287 = fma(_465, _393, _1285);
    float _1289 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1291 = _1289 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1293 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1295 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1293;
    bool _1297 = _1247 > 0.5;
    float _1299 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1301 = _1299 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1303 = _1253 > 0.5;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1309 = -_195;
    int _1311 = _1297 ? as_type<int>(_1309) : as_type<int>(_195);
    float _1313 = 1.0 / _1291;
    int _1315 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1317 = _1315 != 0;
    float _1319 = _467 * _385;
    float _1321 = _1249 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _1323 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1325 = fma(_465, _395, _1319);
    float _1327 = fma(_1321, -2.0, _1273);
    float _1329 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1331 = _1329 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1333 = fma(_469, _401, _1287);
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1339 = 1.0 / _1295;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1345 = fma(_469, _405, _1325);
    float _1347 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1349 = fma(_469, _409, _1261);
    float _1351 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1353 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1351;
    float _1355 = 1.0 / _1343;
    float _1357 = _1333 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1359 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1361 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1359;
    float _1363 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1365 = _1363 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1367 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1369 = isnan(_1245);
    bool _1371 = _1367 || _1369;
    bool _1373 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1375 = _1371 || _1373;
    float _1377 = float(_1375);
    float _1379 = 1.0 / _1337;
    float _1381 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1383 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1381;
    float _1385 = _1259 * _1339;
    float _1387 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1389 = _1387 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    bool _1391 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1393 = isnan(_1245);
    bool _1395 = _1391 || _1393;
    bool _1397 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1399 = _1395 || _1397;
    float _1401 = float(_1399);
    float _1403 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1327);
    bool _1405 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1407 = isnan(_1245);
    bool _1409 = _1405 || _1407;
    bool _1411 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1413 = _1409 || _1411;
    float _1415 = float(_1413);
    float _1417 = 1.0 / _1301;
    float _1419 = _1247 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1421 = _1353 * _1355;
    float _1423 = _1345 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1427 = -_1347;
    float _1429 = fma(_1419, 2.0, _1427);
    float _1431 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1433 = _1423 + _1431;
    float _1435 = 1.0 / _1307;
    float _1437 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1439 = _1245 + _1437;
    float _1441 = _1361 * _1379;
    float _1443 = -_125;
    float _1445 = fma(_1443, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1429);
    bool _1447 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1449 = isnan(_1245);
    bool _1451 = _1447 || _1449;
    bool _1453 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1455 = _1451 || _1453;
    float _1457 = float(_1455);
    float _1459 = 1.0 / _1331;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1461;
    float _1465 = fma(_1463, _1385, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1467 = 1.0 / _1365;
    float _1469 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1471 = _1389 * _1459;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1473;
    float _1477 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1479 = _1477 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1481 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1483 = _1357 + _1481;
    float _1485 = _1475 * _1313;
    float _1487 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1489 = _1487 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1491 = _1479 * _1417;
    float _1493 = _1479;
    if (!_1317)
    {
        _1493 = _1249;
    }
    float _1495 = _1493;
    float _1497 = _1383 * _1467;
    float _1499 = _1489 * _1435;
    float _1501 = fma(_1247, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1469);
    float _1503 = _1495;
    if (_1317)
    {
        _1503 = _1247;
    }
    float _1505 = _1503;
    float _1507 = _1433 * _1433;
    bool _1509 = !_1265;
    float _1511 = _1509 ? _195 : as_type<float>(_1311);
    float _1513 = _1349 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1515 = _1249 > 0.5;
    float _1517 = fma(_1483, _1483, _1507);
    float _1519 = _1507;
    float _1521 = _1517;
    if (!_1317)
    {
        _1519 = _1251;
    }
    float _1523 = _1519;
    float _1525 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1527 = _1513 + _1525;
    float _1529 = -_205;
    int _1531 = _1515 ? as_type<int>(_1529) : as_type<int>(_205);
    float _1533 = fma(_1485, _1439, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1535 = _1251 > 0.5;
    float _1537 = fma(_1527, _1527, _1517);
    float _1539 = _1523;
    if (!_1317)
    {
        _1521 = _1251;
    }
    float _1541 = _1521;
    float _1543 = fma(_1249, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1425);
    float _1545 = rsqrt(_1537);
    float _1547 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1549 = _1245 + _1547;
    float _1551 = _1541;
    if (_1317)
    {
        _1539 = _1249;
    }
    float _1553 = _1539;
    float _1555 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1557 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1555;
    if (_1317)
    {
        _1551 = _1249;
    }
    float _1559 = _1551;
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1563 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1561;
    float _1565 = fma(_1499, _1549, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1567 = fma(_1557, _1385, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1571 = _1245 + _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1575 = _1245 + _1573;
    float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1579 = _1245 + _1577;
    float _1581 = fma(_1563, _1385, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1583 = fma(_1441, _1571, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1585 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1587 = _1245 + _1585;
    float _1589 = fma(_1471, _1575, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    float _1591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1593 = _1433 * _1545;
    float _1595 = fma(_1491, _1579, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1599 = _1245 + _1597;
    float _1601 = fma(_1421, _1587, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1603 = _1483 * _1545;
    float _1605 = -_1593;
    float _1607 = fma(_1605, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1433);
    float _1609 = fma(_1497, _1599, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1611 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1613 = -_1603;
    float _1615 = fma(_1613, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1483);
    float _1617 = _1607 * _1607;
    bool _1619 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1621 = isnan(_1245);
    bool _1623 = _1619 || _1621;
    bool _1625 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1627 = _1623 || _1625;
    float _1629 = float(_1627);
    float _1631 = fma(_1559, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1611);
    float _1633 = _1511 + 0.5;
    float _1635 = fma(_1615, _1615, _1617);
    float _1637 = fma(_645, _645, _1267);
    float _1639 = _1591 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _1641 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1643 = isnan(_1245);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1649 = _1645 || _1647;
    float _1651 = float(_1649);
    float _1653 = -_1629;
    float _1655 = _1653 + 1.0;
    float _1657 = fma(_647, _647, _1637);
    float _1659 = fma(_1639, _1633, _1445);
    float _1661 = _1527 * _1545;
    bool _1663 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1665 = isnan(_1245);
    bool _1667 = _1663 || _1665;
    bool _1669 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1671 = _1667 || _1669;
    float _1673 = float(_1671);
    float _1675 = rsqrt(_1657);
    float _1677 = -_1651;
    float _1679 = _1677 + 1.0;
    float _1681 = -_1661;
    float _1683 = fma(_1681, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1527);
    float _1685 = _1651 * _1655;
    bool _1687 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1689 = isnan(_1243);
    bool _1691 = _1687 || _1689;
    bool _1693 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1695 = _1691 || _1693;
    float _1697 = float(_1695);
    float _1699 = _1673 * _1679;
    float _1701 = fma(_1683, _1683, _1635);
    float _1703 = -_1673;
    float _1705 = _1703 + 1.0;
    bool _1707 = _1245 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1709 = isnan(_1245);
    bool _1711 = _1707 || _1709;
    bool _1713 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1715 = _1711 || _1713;
    float _1717 = float(_1715);
    float _1719 = _1505 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    bool _1721 = _1243 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1723 = isnan(_1243);
    bool _1725 = _1721 || _1723;
    bool _1727 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1729 = _1725 || _1727;
    float _1731 = float(_1729);
    float _1733 = _1377 * _1705;
    float _1735 = -_1377;
    float _1737 = _1735 + 1.0;
    float _1739 = -_1717;
    float _1741 = _1739 + 1.0;
    float _1743 = sqrt(_1701);
    float _1745 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1501);
    float _1747 = _1675 * _647;
    float _1749 = _1717 * _1737;
    float _1751 = _1675 * _645;
    float _1753 = _1675 * _643;
    float _1755 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1757 = _1747 * _1755;
    float _1759 = _1457 * _1741;
    float _1761 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1763 = _1751 * _1761;
    float _1765 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1767 = _1753 * _1765;
    float _1769 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1771 = -_1757;
    float _1773 = fma(_1751, _1769, _1771);
    float _1775 = -_1457;
    float _1777 = _1775 + 1.0;
    float _1779 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1781 = -_1763;
    float _1783 = fma(_1753, _1779, _1781);
    float _1785 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1787 = -_1767;
    float _1789 = fma(_1747, _1785, _1787);
    float _1791 = _1773 * _1773;
    bool _1793 = !_1271;
    float _1795 = _1793 ? _205 : as_type<float>(_1531);
    float _1797 = _1415 * _1777;
    float _1799 = _1545 * _1743;
    float _1801 = fma(_1789, _1789, _1791);
    float _1803 = -_1731;
    float _1805 = _1803 + 1.0;
    float _1807 = _1795 + (-0.5);
    float _1809 = -_195;
    int _1811 = _1535 ? as_type<int>(_1809) : as_type<int>(_195);
    float _1813 = fma(_1783, _1783, _1801);
    float _1815 = -_1415;
    float _1817 = _1815 + 1.0;
    float _1819 = _1697 * _1805;
    float _1821 = -_1323;
    float _1823 = -_1403;
    float _1825 = fma(_1821, _1807, _1823);
    float _1827 = rsqrt(_1813);
    float _1829 = _947 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1831 = _1567 * _1819;
    float _1833 = _1465 * _1819;
    float _1835 = _1581 * _1819;
    float _1837 = -_205;
    int _1839 = _1303 ? as_type<int>(_1837) : as_type<int>(_205);
    float _1841 = _949 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _1843 = !_1277;
    float _1845 = _1843 ? _195 : as_type<float>(_1811);
    float _1847 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    bool _1849 = !_1283;
    float _1851 = _1849 ? _205 : as_type<float>(_1839);
    float _1853 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1855 = _1829 * _1799;
    float _1857 = _1401 * _1817;
    float _1859 = -_1745;
    float _1861 = _1859 + 1.0;
    float _1863 = _1789 * _1827;
    float _1865 = _1841 * _1799;
    float _1867 = _1783 * _1827;
    float _1869 = _1773 * _1827;
    float _1871 = _1855 * _1853;
    float _1873 = _1865 * _1847;
    float _1875 = _1533 * _1857;
    float _1877 = _1753 * _1867;
    float _1879 = _1751 * _1869;
    float _1881 = _1873 * _1751;
    float _1883 = _1873 * _1747;
    float _1885 = -_1401;
    float _1887 = _1885 + 1.0;
    float _1889 = -_1877;
    float _1891 = fma(_1747, _1869, _1889);
    float _1893 = _1799 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1895 = _1893 * 0.5;
    float _1897 = fma(_1871, _1863, _1881);
    float _1899 = -_1879;
    float _1901 = fma(_1753, _1863, _1899);
    float _1903 = fma(_1871, _1867, _1883);
    float _1905 = fma(_1887, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1875);
    float _1907 = fma(_1895, _1891, _1897);
    float _1909 = fma(_1895, _1901, _1903);
    float _1911 = fma(_1595, _1797, _1905);
    float _1913 = _1357 + _1907;
    float _1915 = _1553 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1917 = _1513 + _1909;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1921 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1923 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1925 = _1917 + _1923;
    float _1927 = fma(_1505, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1919);
    float _1929 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1931 = _1913 + _1929;
    float _1933 = _1925 * _1925;
    float _1935 = _1747 * _1863;
    float _1937 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _1939 = _1873 * _1753;
    float _1941 = fma(_1931, _1931, _1933);
    float _1943 = fma(_1583, _1759, _1911);
    float _1945 = -_1935;
    float _1947 = fma(_1751, _1867, _1945);
    float _1949 = fma(_1871, _1869, _1939);
    float _1951 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1953 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1955 = sqrt(_1941);
    float _1957 = fma(_1565, _1749, _1943);
    float _1959 = fma(_1895, _1947, _1949);
    float _1961 = -_1951;
    float _1963 = fma(_1719, 2.0, _1961);
    float _1965 = -_1697;
    float _1967 = _1965 + 1.0;
    float _1969 = fma(_1915, -2.0, _1953);
    float _1971 = fma(_1609, _1733, _1957);
    float _1973 = _1423 + _1959;
    float _1975 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1831);
    float _1977 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1833);
    float _1979 = fma(_1967, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1835);
    float _1981 = _1921 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1983 = _1937 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1985 = _1845 + 0.5;
    float _1987 = _1851 + (-0.5);
    float _1989 = -_125;
    float _1991 = fma(_1989, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1963);
    bool _1993 = _1955 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1995 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1969);
    float _1997 = fma(_1589, _1699, _1971);
    float _1999 = fma(_1981, _1985, _1991);
    float _2001 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1975);
    float _2003 = -_1983;
    float _2005 = -_1995;
    float _2007 = fma(_2003, _1987, _2005);
    float _2009 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1977);
    float _2011 = fma(_1731, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1979);
    float _2013 = fma(_1601, _1685, _1997);
    float _2015 = _1969;
    float _2017 = _1913;
    float _2019 = _1917;
    float _2021 = _1657;
    if (!_1993)
    {
        _2015 = _1973;
    }
    float _2023 = _2015;
    bool _2025 = !_1993;
    float _2027 = _2023;
    if (!_2025)
    {
        float _2029 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2031 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2033 = _1955 + _2031;
        float _2035 = _1973 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2037 = rsqrt(_1941);
        float _2039 = _2033 * _2029;
        float _2041 = _2039 * 0.15915493667125701904296875;
        float _2043 = _2041 * 6.283185482025146484375;
        float _2045 = sin(_2043);
        float _2047 = _2041 * 6.283185482025146484375;
        float _2049 = cos(_2047);
        float _2051 = fma(_2045, _2035, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2053 = _2037 * _2051;
        float _2055 = _2049 + (-1.0);
        float _2057 = fma(_1931, _2053, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2059 = fma(_1925, _2053, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _2061 = _2055 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2063 = fma(_1973, _2049, _2061);
        _2027 = _2063;
        _2017 = _2057;
        _2019 = _2059;
    }
    float _2065 = _2027;
    float _2067 = _2017;
    float _2069 = _2019;
    float _2071 = -_1423;
    float _2073 = _2071 + _2065;
    float _2075 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1543);
    float _2077 = -_1861;
    float _2079 = fma(_1511, _2077, _1659);
    float _2081 = -_1357;
    float _2083 = _2081 + _2067;
    float _2085 = _2073 * _2073;
    float _2087 = -_2075;
    float _2089 = _2087 + 1.0;
    float _2091 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1927);
    float _2093 = -_1513;
    float _2095 = _2093 + _2069;
    float _2097 = fma(_2083, _2083, _2085);
    float _2099 = fma(_1795, _2089, _1825);
    float _2101 = -_2091;
    float _2103 = _2101 + 1.0;
    float _2105 = fma(_125, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1631);
    float _2107 = fma(_2095, _2095, _2097);
    float _2109 = _2001 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2111 = -_2103;
    float _2113 = fma(_1845, _2111, _1999);
    float _2115 = -_2105;
    float _2117 = _2115 + 1.0;
    float _2119 = sqrt(_2107);
    float _2121 = _2009 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2123 = _2011 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2125 = fma(_1851, _2117, _2007);
    float _2127 = _2109 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2131 = _2121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2133 = _2123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2135 = fma(_1629, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2013);
    out.m_64.x = _2079;
    out.m_64.y = _2099;
    out.m_64.z = _2113;
    out.m_64.w = _2125;
    out.m_66.x = _2127;
    out.m_66.y = _2131;
    out.m_66.z = _2133;
    out.m_66.w = _2129;
    bool _2137 = _2119 > 0.0;
    out.m_68.x = _2135;
    bool _2139 = !_2137;
    float _2141 = _2079;
    float _2143 = _2125;
    float _2145 = _2127;
    float _2147 = _2127;
    float _2149 = _2067;
    float _2151 = _2065;
    float _2153 = _2069;
    float _2155 = _2127;
    if (!_2139)
    {
        bool _2157 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2159 = _2099;
        if (_2157)
        {
            float _2161 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2159 = _2161;
        }
        float _2163 = _2159;
        float _2165 = _2163;
        if (_2157)
        {
            float _2167 = _2163 * _645;
            _2141 = _2167;
        }
        float _2169 = _2141;
        float _2171 = _2169;
        float _2173 = _2169;
        if (_2157)
        {
            float _2175 = _2163 * _643;
            _2143 = _2175;
        }
        float _2177 = _2143;
        float _2179 = _2177;
        if (_2157)
        {
            float _2181 = _2163 * _647;
            _2165 = _2181;
        }
        float _2183 = _2165;
        float _2185 = _2183;
        if (!_2157)
        {
            float _2187 = _125 + 1.0;
            float _2189 = _2187;
            if (!_165)
            {
                float _2191 = _2187 * _2187;
                float _2193 = _2191 * 0.5;
                _2171 = _2193;
            }
            float _2195 = _2171;
            float _2197 = _2195;
            if (!_165)
            {
                float _2199 = _2195 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2197 = _2199;
            }
            float _2201 = _2197;
            bool _2203 = !_165;
            float _2205 = _2201;
            if (!_2203)
            {
                float _2207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2209 = log2(_2207);
                float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2213 = _2211 + 1.0;
                float _2215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2217 = _2209 * _2187;
                float _2219 = 1.0 / _2213;
                float _2221 = _2215 * 0.693147182464599609375;
                float _2223 = exp2(_2217);
                float _2225 = 1.0 / _2221;
                float _2227 = _2223 + (-1.0);
                float _2229 = -_2227;
                float _2231 = fma(_2229, _2225, _2187);
                float _2233 = _2231 * _2219;
                float _2235 = _2233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2205 = _2235;
            }
            float _2237 = _2205;
            float _2239 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2241 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            bool _2243 = !_165;
            if (!_2243)
            {
                float _2245 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2247 = log2(_2245);
                float _2249 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2251 = _2249 + 1.0;
                float _2253 = 1.0 / _2251;
                float _2255 = _2247 * _2187;
                float _2257 = exp2(_2255);
                float _2259 = -_2257;
                float _2261 = _2259 + 1.0;
                float _2263 = _2261 * _2253;
                _2189 = _2263;
                _2145 = _2255;
            }
            float _2265 = _2189;
            float _2267 = _2145;
            float _2269 = fma(_2265, _153, _2241);
            float _2271 = _2237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2273 = fma(_2265, _151, _2239);
            float _2275 = -_361;
            float _2277 = _2275 + _2269;
            float _2279 = fma(_2265, _155, _2271);
            float _2281 = -_365;
            float _2283 = _2281 + _2273;
            float _2285 = _2277 * _385;
            float _2287 = -_367;
            float _2289 = _2287 + _2279;
            float _2291 = _2277 * _373;
            float _2293 = _2277 * _389;
            float _2295 = fma(_2283, _395, _2285);
            float _2297 = fma(_2283, _393, _2291);
            float _2299 = fma(_2283, _399, _2293);
            float _2301 = fma(_2289, _405, _2295);
            float _2303 = fma(_2289, _401, _2297);
            float _2305 = fma(_2289, _409, _2299);
            float _2307 = _2301 * _2301;
            float _2309 = fma(_2303, _2303, _2307);
            float _2311 = fma(_2305, _2305, _2309);
            _2021 = _2311;
            _653 = _2301;
            _655 = _2303;
            _657 = _2305;
            _2173 = _2303;
            _2179 = _2301;
            _2185 = _2305;
            _2147 = _2267;
        }
        float _2313 = _2021;
        float _2315 = _653;
        float _2317 = _655;
        float _2319 = _657;
        float _2321 = _2173;
        float _2323 = _2179;
        float _2325 = _2185;
        float _2327 = _2147;
        float _2329 = sqrt(_2313);
        float _2331 = rsqrt(_2107);
        bool _2333 = _2329 > 0.0;
        float _2335 = _2083 * _2331;
        float _2337 = _2073 * _2331;
        float _2339 = _2095 * _2331;
        bool _2341 = !_2333;
        _2155 = _2327;
        if (!_2341)
        {
            float _2343 = rsqrt(_2313);
            float _2345 = _2343 * _2315;
            float _2347 = _2343 * _2317;
            float _2349 = _2337 * _2345;
            float _2351 = _2343 * _2319;
            float _2353 = fma(_2335, _2347, _2349);
            float _2355 = fma(_2339, _2351, _2353);
            float _2357 = _2355 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2359 = fma(_2321, _2357, _2067);
            float _2361 = fma(_2323, _2357, _2065);
            float _2363 = fma(_2325, _2357, _2069);
            _2149 = _2359;
            _2151 = _2361;
            _2153 = _2363;
        }
    }
    float _2365 = _2149;
    float _2367 = _2151;
    float _2369 = _2153;
    float _2371 = _2155;
    bool _2373 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2375 = isnan(0.5);
    bool _2377 = _2373 || _2375;
    bool _2379 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2381 = _2377 || _2379;
    float _2383 = -_1603;
    float _2385 = fma(_2383, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2365);
    float _2387 = -_1593;
    float _2389 = fma(_2387, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2367);
    float _2391 = -_1661;
    float _2393 = fma(_2391, (*spvDescriptorSet0.vp_c9)._m0[18].w, _2369);
    float _2395 = _2389;
    float _2397 = _2385;
    float _2399 = _2393;
    float _2401 = _2371;
    if (!_2381)
    {
        float _2403 = -_1593;
        float _2405 = fma(_2403, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1423);
        float _2407 = -_1603;
        float _2409 = fma(_2407, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1357);
        float _2411 = -_1661;
        float _2413 = fma(_2411, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1513);
        float _2415 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2417 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2419 = _2405 + _2417;
        float _2421 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2423 = _2409 + _2421;
        float _2425 = -_1513;
        float _2427 = _2425 + _2369;
        float _2429 = -_1357;
        float _2431 = _2429 + _2365;
        float _2433 = _2419 * _2419;
        float _2435 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2437 = _2413 + _2435;
        float _2439 = -_1423;
        float _2441 = _2439 + _2367;
        float _2443 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2445 = fma(_2423, _2423, _2433);
        float _2447 = fma(_2437, _2437, _2445);
        float _2449 = 1.0 / _1799;
        float _2451 = sqrt(_2447);
        float _2453 = _2443 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2455 = precise::min(_2451, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2457 = _2455 * _2415;
        float _2459 = _2457 * _2449;
        float _2461 = _2453 * _2459;
        float _2463 = _2427 * _2459;
        float _2465 = fma(_2431, _2461, _2409);
        float _2467 = fma(_2441, _2461, _2405);
        float _2469 = fma(_2453, _2463, _2413);
        _2395 = _2467;
        _2397 = _2465;
        _2399 = _2469;
    }
    float _2471 = _2395;
    float _2473 = _2397;
    float _2475 = _2399;
    float _2477 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2479 = _2471 + _2477;
    float _2481 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2483 = _2473 + _2481;
    float _2485 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2487 = _2475 + _2485;
    float _2489 = _2479 * _2479;
    float _2491 = fma(_2483, _2483, _2489);
    float _2493 = fma(_2487, _2487, _2491);
    float _2495 = rsqrt(_2493);
    float _2497 = sqrt(_2493);
    float _2499 = _2495 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2501 = _2483 * _2499;
    float _2503 = _2487 * _2499;
    float _2505 = _2501 * _2501;
    float _2507 = _2503 * _2503;
    float _2509 = _2505 + _2507;
    float _2511 = sqrt(_2509);
    bool _2513 = _2511 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2515 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2517 = _2511 + _2515;
    float _2519 = _2495;
    float _2521 = _2509;
    float _2523 = _2517;
    float _2525 = _2479;
    if (_2513)
    {
        float _2527 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2519 = _2527;
    }
    float _2529 = _2519;
    if (_2513)
    {
        float _2531 = rsqrt(_2509);
        _2521 = _2531;
    }
    float _2533 = _2521;
    float _2535 = _2533;
    if (_2513)
    {
        float _2537 = _2517 * _2529;
        _2523 = _2537;
    }
    float _2539 = _2523;
    if (_2513)
    {
        float _2541 = _2539 * 0.15915493667125701904296875;
        _2401 = _2541;
    }
    float _2543 = _2401;
    float _2545 = _2487;
    float _2547 = _2543;
    if (_2513)
    {
        float _2549 = _2543 * 6.283185482025146484375;
        float _2551 = sin(_2549);
        _2545 = _2551;
    }
    float _2553 = _2545;
    float _2555 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2557 = precise::max(0.0, _2555);
    float _2559 = _2529;
    float _2561 = _2557;
    if (_2513)
    {
        float _2563 = _2543 * 6.283185482025146484375;
        float _2565 = cos(_2563);
        _2559 = _2565;
    }
    float _2567 = _2559;
    float _2569 = -_2499;
    float _2571 = -_2557;
    float _2573 = fma(_2479, _2569, _2571);
    if (_2513)
    {
        float _2575 = _2573 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2525 = _2575;
    }
    float _2577 = _2525;
    float _2579 = _2577;
    float _2581 = _2553;
    if (_2513)
    {
        float _2583 = fma(_2553, _2577, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2579 = _2583;
    }
    float _2585 = _2579;
    float _2587 = _2585;
    if (!_2513)
    {
        _2581 = _2501;
    }
    float _2589 = _2581;
    float _2591 = _2589;
    float _2593 = _2567;
    if (_2513)
    {
        float _2595 = _2567 + (-1.0);
        _2561 = _2595;
    }
    float _2597 = _2561;
    float _2599 = _2597;
    if (_2513)
    {
        float _2601 = _2533 * _2585;
        _461 = _2601;
    }
    float _2603 = _461;
    if (!_2513)
    {
        _2587 = _2573;
    }
    float _2605 = _2587;
    float _2607 = _2605;
    if (_2513)
    {
        float _2609 = _2597 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2547 = _2609;
    }
    float _2611 = _2547;
    if (_2513)
    {
        float _2613 = _2501 * _2603;
        _2591 = _2613;
    }
    float _2615 = _2591;
    if (!_2513)
    {
        _2599 = _2503;
    }
    float _2617 = _2599;
    float _2619 = _2617;
    if (_2513)
    {
        float _2621 = _2503 * _2603;
        _2619 = _2621;
    }
    float _2623 = _2619;
    if (!_2513)
    {
        _2535 = _2505;
    }
    float _2625 = _2535;
    float _2627 = _2625;
    if (_2513)
    {
        float _2629 = fma(_2573, _2567, _2611);
        _2607 = _2629;
    }
    float _2631 = _2607;
    if (_2513)
    {
        float _2633 = _2615 * _2615;
        _2627 = _2633;
    }
    float _2635 = _2627;
    if (!_2513)
    {
        _2593 = _2507;
    }
    float _2637 = _2593;
    float _2639 = _2637;
    if (_2513)
    {
        float _2641 = _2623 * _2623;
        _2639 = _2641;
    }
    float _2643 = _2639;
    float _2645 = fma(_2631, _2631, _2635);
    float _2647 = _2645 + _2643;
    float _2649 = _2471 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2651 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2653 = fma(_2497, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2651);
    float _2655 = precise::clamp(_2653, 0.0, 1.0);
    float _2657 = _2471 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2659 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2661 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2649);
    float _2663 = rsqrt(_2647);
    float _2665 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2657);
    float _2667 = -_2655;
    float _2669 = _2667 + 1.0;
    float _2671 = fma(_2475, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2661);
    float _2673 = _2471 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2675 = _2471 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2677 = fma(_2475, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2665);
    float _2679 = _2671 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2681 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2673);
    float _2683 = fma(_2473, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2675);
    float _2685 = _2677 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2687 = _2679 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2689 = fma(_2475, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2681);
    float _2691 = fma(_2475, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2683);
    float _2693 = abs(_2669);
    float _2695 = log2(_2693);
    float _2697 = -_2687;
    float _2699 = fma(_2697, _2659, 1.0);
    float _2701 = _2663 * _2615;
    float _2703 = _2689 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2705 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2707 = _2663 * _2631;
    float _2709 = _2663 * _2623;
    float _2711 = _2691 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2713 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2705);
    float _2715 = _2701 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2717 = log2(_2699);
    float _2719 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2721 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2713);
    float _2723 = -_2715;
    float _2725 = fma(_2707, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2723);
    float _2727 = _2707 + 1.0;
    float _2729 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2721);
    float _2731 = -_2709;
    float _2733 = fma(_2731, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2725);
    float _2735 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2737 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2739 = 1.0 / _2729;
    float _2741 = fma(_2733, -0.5, 0.5);
    float _2743 = fma(_2733, 0.5, 0.5);
    float _2745 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2737);
    float _2747 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2719);
    float _2749 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2745);
    float _2751 = exp2(_2735);
    float _2753 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2747);
    float _2755 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2749);
    float _2757 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2753);
    float _2759 = _2717 * 0.693147182464599609375;
    float _2761 = sqrt(_2741);
    float _2763 = fma(_2743, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2765 = _2755 * _2739;
    float _2767 = _2757 * _2739;
    float _2769 = fma(_2743, _2763, -0.212114393711090087890625);
    float _2771 = fma(_2765, 0.5, 0.5);
    float _2773 = fma(_2767, -0.5, 0.5);
    float _2775 = -_2707;
    float _2777 = fma(_2751, _2727, _2775);
    float _2779 = fma(_2743, _2769, 1.570728778839111328125);
    float _2781 = _2759 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2783 = fma(_2777, 0.5, 0.5);
    float _2785 = _2761 * 0.636619746685028076171875;
    float3 _7182 = float3(_2771, _2773, _2781);
    float _2787 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_7182, float3(0.0), isnan(_7182)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_7182, float3(0.0), isnan(_7182)), level(0.0)).x;
    float _2789 = -_2779;
    float _2791 = fma(_2785, _2789, 1.0);
    float3 _7198 = float3(_2771, _2773, _2781);
    float4 _2794 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7198, float3(0.0), isnan(_7198)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7198, float3(0.0), isnan(_7198)), level(0.0)).xyzw;
    float _2796 = _2794.x;
    float _2798 = _2794.y;
    float _2800 = _2794.z;
    float _2802 = _2794.w;
    float2 _7215 = float2(_2791, _2783);
    float3 _2806 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7215, float2(0.0), isnan(_7215)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7215, float2(0.0), isnan(_7215)), level(0.0)).xyz;
    float _2808 = _2806.x;
    float _2810 = _2806.y;
    float _2812 = _2806.z;
    float _2814 = _2695 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2816 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2818 = fma(_2703, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2816);
    float _2820 = exp2(_2814);
    float _2822 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2824 = fma(_2679, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2818);
    float _2826 = fma(_2711, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2824);
    out.m_45.x = _2822;
    float _2828 = _2826 + _2729;
    out.gl_Position.x = _2755;
    out.gl_Position.y = _2757;
    out.gl_Position.z = _2826;
    out.gl_Position.w = _2729;
    float _2830 = _2828 * 0.5;
    float _2832 = -_2820;
    float _2834 = _2832 + 1.0;
    float _2836 = _2834 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_70.z = _2830;
    out.m_70.w = _2729;
    float _2838 = _2836 * _2787;
    float _2840 = -_2836;
    float _2842 = _2840 + 1.0;
    float _2844 = _2802 * _2838;
    float _2846 = _2802 * _2842;
    float _2848 = _2812 * _2838;
    float _2850 = fma(_2808, _2844, _2796);
    float _2852 = fma(_2810, _2844, _2798);
    float _2854 = fma(_2802, _2848, _2800);
    out.m_72.x = _2850;
    out.m_72.y = _2852;
    out.m_72.z = _2854;
    out.m_72.w = _2846;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

