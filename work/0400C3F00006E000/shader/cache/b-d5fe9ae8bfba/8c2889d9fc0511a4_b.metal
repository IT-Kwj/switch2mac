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
    constant _16* vp_c16 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_70 [[user(locn0)]];
    float4 m_66 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_68 [[user(locn4)]];
    float4 m_74 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_53 [[attribute(1)]];
    float4 m_51 [[attribute(2)]];
    float4 m_55 [[attribute(3)]];
    float4 m_64 [[attribute(4)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_59 [[attribute(7)]];
    float4 m_57 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1583 = false;
    bool _671 = false;
    bool _509 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2303 = as_type<float>(_109);
        out.gl_Position.z = _2303;
    }
    if (!_97)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    float _131 = 0.0;
    float _133 = _127;
    if (_123)
    {
        float _135 = float(_93);
        _129 = _135;
    }
    float _137 = _129;
    bool _139 = _127 >= _137;
    bool _141 = !_123;
    bool _143 = _139 || _141;
    if (_143)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _103;
    if (_143)
    {
        out.m_47.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _111 = as_type<int>(_147);
    }
    int _149 = _111;
    float _151 = as_type<float>(_149);
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2374 = as_type<float>(_149);
        out.gl_Position.z = _2374;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = _159;
    if (!_169)
    {
        float _173 = _159 * _159;
        float _175 = _173 * 0.5;
        _151 = _175;
    }
    float _177 = _151;
    float _179 = 0.0;
    float _181 = _177;
    if (!_169)
    {
        float _183 = _127 * _127;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    if (!_169)
    {
        float _189 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _189;
    }
    float _191 = _181;
    bool _193 = !_169;
    float _195 = _191;
    float _197 = 0.0;
    if (!_193)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _159 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _159);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _131 = _215;
        _195 = _227;
        _197 = _217;
    }
    float _229 = _131;
    float _231 = _195;
    float _233 = _197;
    bool _235 = !_169;
    float _237 = _229;
    float _239 = _233;
    if (!_235)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _159 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _237 = _253;
        _239 = _247;
        _171 = _259;
    }
    float _261 = _237;
    float _263 = _239;
    float _265 = _171;
    float _267 = _263;
    float _269 = _261;
    if (!_169)
    {
        _267 = _127;
    }
    float _271 = _267;
    float _273 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _271;
    if (!_169)
    {
        float _277 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _277;
    }
    float _279 = _269;
    bool _281 = !_169;
    float _283 = _279;
    if (!_281)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = _127 * _287;
        float _297 = exp2(_295);
        float _299 = _293 * 0.693147182464599609375;
        float _301 = 1.0 / _299;
        float _303 = 1.0 / _291;
        float _305 = _297 + (-1.0);
        float _307 = -_305;
        float _309 = fma(_307, _301, _127);
        float _311 = _309 * _303;
        float _313 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _283 = _313;
    }
    float _315 = _283;
    bool _317 = !_169;
    if (!_317)
    {
        float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _321 = log2(_319);
        float _323 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _325 = _323 + 1.0;
        float _327 = 1.0 / _325;
        float _329 = _127 * _321;
        float _331 = exp2(_329);
        float _333 = -_331;
        float _335 = _333 + 1.0;
        float _337 = _335 * _327;
        _275 = _337;
    }
    float _339 = _275;
    float _341 = fma(_265, _153, _273);
    float _343 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _345 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _347 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _349 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_265, _155, _343);
    float _353 = fma(_339, _155, _345);
    float _355 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _357 = fma(_339, _153, _347);
    float _359 = fma(_339, _157, _349);
    float _361 = -_353;
    float _363 = _351 + _361;
    float _365 = fma(_265, _157, _355);
    float _367 = -_357;
    float _369 = _341 + _367;
    float _371 = in.m_51.y;
    float _373 = _363 * _363;
    float _375 = -_359;
    float _377 = _365 + _375;
    float _379 = in.m_53.y;
    float _381 = fma(_369, _369, _373);
    float _383 = in.m_55.y;
    float _385 = fma(_377, _377, _381);
    float _387 = in.m_51.x;
    float _389 = sqrt(_385);
    float _391 = in.m_53.x;
    float _393 = in.m_55.x;
    float _395 = in.m_51.z;
    float _397 = _363 * _371;
    float _399 = in.m_53.z;
    float _401 = _363 * _379;
    bool _403 = _389 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_389);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = in.m_55.z;
    float _415 = _363 * _383;
    float _417 = _371 * _371;
    float _419 = in.m_57.w;
    float _421 = fma(_369, _387, _397);
    float _423 = in.m_44.x;
    float _425 = in.m_44.y;
    float _427 = in.m_44.z;
    float _429 = fma(_369, _391, _401);
    float _431 = fma(_369, _393, _415);
    float _433 = fma(_377, _395, _421);
    float _435 = fma(_377, _399, _429);
    float _437 = fma(_379, _379, _417);
    float _439 = fma(_377, _413, _431);
    float _441 = _431;
    float _443 = _421;
    float _445 = _433;
    if (_411)
    {
        _441 = _433;
    }
    float _447 = _441;
    float _449 = fma(_383, _383, _437);
    float _451 = _447;
    float _453 = _447;
    if (_411)
    {
        _443 = _435;
    }
    float _455 = _443;
    float _457 = _455;
    float _459 = _455;
    if (_411)
    {
        _445 = _439;
    }
    float _461 = _445;
    float _463 = fma(_341, _419, _423);
    float _465 = fma(_351, _419, _425);
    float _467 = fma(_365, _419, _427);
    float _469 = _461;
    if (!_411)
    {
        bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _473 = !_471;
        if (!_473)
        {
            float _475 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _477 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _479 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _481 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[16].x, _475);
            float _483 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[16].x, _477);
            float _485 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[16].x, _479);
            float _487 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].z, _481);
            float _489 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[16].z, _483);
            float _491 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[16].z, _485);
            float _493 = _487 * _487;
            float _495 = fma(_489, _489, _493);
            float _497 = fma(_491, _491, _495);
            float _499 = rsqrt(_497);
            float _501 = _499 * 9.9999999747524270787835121154785e-07;
            float _503 = _489 * _501;
            float _505 = _487 * _501;
            float _507 = _491 * _501;
            _453 = _505;
            _459 = _503;
            _469 = _507;
            _509 = true;
        }
        else
        {
            float _511 = _155 * _155;
            float _513 = fma(_153, _153, _511);
            float _515 = fma(_157, _157, _513);
            float _517 = sqrt(_515);
            bool _519 = _517 >= 9.9999999747524270787835121154785e-07;
            bool _521 = isnan(_517);
            bool _523 = _519 || _521;
            bool _525 = isnan(9.9999999747524270787835121154785e-07);
            bool _527 = _523 || _525;
            float _529 = _517;
            if (!_527)
            {
                float _531 = _425 * _425;
                float _533 = fma(_423, _423, _531);
                float _535 = fma(_427, _427, _533);
                float _537 = sqrt(_535);
                bool _539 = _537 >= 9.9999999747524270787835121154785e-07;
                bool _541 = isnan(_537);
                bool _543 = _539 || _541;
                bool _545 = isnan(9.9999999747524270787835121154785e-07);
                bool _547 = _543 || _545;
                float _549 = _449;
                if (!_547)
                {
                    float _551 = rsqrt(_449);
                    _549 = _551;
                }
                float _553 = _549;
                if (!_547)
                {
                    float _555 = _553 * 9.9999999747524270787835121154785e-07;
                    _529 = _555;
                }
                float _557 = _529;
                float _559 = _557;
                if (!_547)
                {
                    float _561 = _379 * _557;
                    _457 = _561;
                }
                float _563 = _457;
                _459 = _563;
                if (!_547)
                {
                    float _565 = _371 * _557;
                    _451 = _565;
                }
                float _567 = _451;
                _453 = _567;
                if (!_547)
                {
                    float _569 = _383 * _557;
                    _559 = _569;
                }
                float _571 = _559;
                bool _573 = !_547;
                _469 = _571;
                _509 = _573;
                if (!_509)
                {
                    float _575 = _371 * _425;
                    float _577 = _379 * _425;
                    float _579 = _383 * _425;
                    float _581 = fma(_423, _387, _575);
                    float _583 = fma(_423, _391, _577);
                    float _585 = fma(_423, _393, _579);
                    float _587 = fma(_427, _395, _581);
                    float _589 = fma(_427, _399, _583);
                    float _591 = fma(_427, _413, _585);
                    float _593 = _587 * _587;
                    float _595 = fma(_589, _589, _593);
                    float _597 = fma(_591, _591, _595);
                    float _599 = rsqrt(_597);
                    float _601 = _599 * 9.9999999747524270787835121154785e-07;
                    float _603 = _589 * _601;
                    float _605 = _587 * _601;
                    float _607 = _591 * _601;
                    _453 = _605;
                    _459 = _603;
                    _469 = _607;
                    _509 = true;
                }
            }
            else
            {
                float _609 = _371 * _155;
                float _611 = _379 * _155;
                float _613 = _383 * _155;
                float _615 = fma(_153, _387, _609);
                float _617 = fma(_153, _391, _611);
                float _619 = fma(_153, _393, _613);
                float _621 = fma(_157, _395, _615);
                float _623 = fma(_157, _399, _617);
                float _625 = fma(_157, _413, _619);
                float _627 = _621 * _621;
                float _629 = fma(_623, _623, _627);
                float _631 = fma(_625, _625, _629);
                float _633 = rsqrt(_631);
                float _635 = _633 * 9.9999999747524270787835121154785e-07;
                float _637 = _623 * _635;
                float _639 = _621 * _635;
                float _641 = _625 * _635;
                _453 = _639;
                _459 = _637;
                _469 = _641;
            }
        }
    }
    _509 = false;
    float _643 = _453;
    float _645 = _459;
    float _647 = _469;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _651 = !_649;
    float _669;
    if (!_651)
    {
        float _653 = in.m_59.x;
        float _655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _657 = _653 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _661 = _659 * _655;
        float _663 = floor(_661);
        float _665 = -_663;
        float _667 = _661 + _665;
        _669 = _667;
        _671 = true;
    }
    else
    {
        float _673 = float(_93);
        float _675 = 1.0 / _673;
        float _677 = _127 * _675;
        _669 = _677;
    }
    _671 = false;
    float _679 = _669;
    float _681 = in.m_59.z;
    float _683 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _685 = log2(_683);
    float _687 = as_type<float>(int(gl_VertexIndex));
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _697 = in.m_59.x;
    float _699 = in.m_59.y;
    float _701 = _465 * _383;
    float _703 = 1.0 / _691;
    float _705 = _465 * _379;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _709 = _679 + _707;
    float _711 = fma(_463, _391, _705);
    float _713 = _465 * _371;
    float _715 = 1.0 / _695;
    float _717 = _685 * _127;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _719;
    float _723 = _681 * 2.0;
    float _725 = exp2(_717);
    float _727 = _709 * _703;
    int _729 = as_type<int>(_687) & 1;
    bool _731 = _729 != 0;
    int _733 = as_type<int>(_687) & 2;
    bool _735 = _733 != 0;
    float _737 = fma(_463, _393, _701);
    float _739 = fma(_721, _727, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _741 = _699 + _681;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _745 = _743 != 0;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _749 = _747 != 0;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _753 = _751 != 0;
    float _755 = floor(_723);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _759 = _679 + _757;
    float _761 = _741 + (-1.0);
    float _763 = _681 + _697;
    float _765 = _759 * _715;
    float _767 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _769 = _699 + _697;
    float _771 = _643 * _643;
    float _773 = _763 + (-1.0);
    float _775 = -_725;
    float _777 = _775 + 1.0;
    float _779 = _769 + (-1.0);
    float _781 = fma(_645, _645, _771);
    float _783 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _785 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _787 = _755 > 0.0;
    float _789 = _699 * 2.0;
    bool _791 = _755 >= 0.0;
    bool _793 = isnan(_755);
    bool _795 = _791 || _793;
    bool _797 = isnan(0.0);
    bool _799 = _795 || _797;
    float _801 = _697 * 2.0;
    float _803 = fma(_647, _647, _781);
    float _805 = floor(_789);
    int _807 = _799 ? 0 : 1;
    float _809 = fma(_463, _387, _713);
    bool _811 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _819 = _815 || _817;
    int _821 = ~_807;
    int _823 = _821 + 1;
    int _825 = _823 + 1;
    float _827 = fma(_467, _395, _809);
    float _829 = _819 ? _777 : 0.0;
    float _831 = floor(_801);
    int _833 = _825;
    float _835 = _713;
    if (!_787)
    {
        int _837 = ~_807;
        int _839 = _837 + 1;
        _833 = _839;
    }
    int _841 = _833;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _843;
    bool _847 = !_745;
    int _849 = _847 ? 0 : 1;
    float _851 = _827 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _853 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _855 = isnan(1.0);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _861 = _857 || _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _865 = 1.0 + _863;
    int _867 = abs(_849);
    float _869 = rsqrt(_803);
    bool _871 = !_749;
    int _873 = _871 ? 0 : 1;
    float _875 = fma(_845, _727, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _877 = _805 >= 0.0;
    bool _879 = isnan(_805);
    bool _881 = _877 || _879;
    bool _883 = isnan(0.0);
    bool _885 = _881 || _883;
    bool _887 = _831 > 0.0;
    float _889 = 1.0 / _865;
    bool _891 = _831 >= 0.0;
    bool _893 = isnan(_831);
    bool _895 = _891 || _893;
    bool _897 = isnan(0.0);
    bool _899 = _895 || _897;
    float _901 = in.m_64.x;
    float _903 = in.m_64.y;
    float _905 = in.m_64.z;
    int _907 = _899 ? 0 : 1;
    bool _909 = _805 > 0.0;
    float _911 = _869 * _645;
    float _913 = float(_867);
    float _915 = _869 * _647;
    float _917 = float(_841);
    float _919 = _869 * _643;
    int _921 = abs(_873);
    int _923 = ~_907;
    int _925 = _923 + 1;
    int _927 = _925 + 1;
    float _929 = _913 * _917;
    int _931 = _927;
    if (_861)
    {
        float _933 = _829 * _889;
        _133 = _933;
    }
    float _935 = _133;
    float _937 = _697 + (-0.5);
    if (!_887)
    {
        int _939 = ~_907;
        int _941 = _939 + 1;
        _931 = _941;
    }
    int _943 = _931;
    float _945 = _929 * (-2.0);
    float _947 = float(_921);
    float _949 = float(_943);
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _953 = _919 * _951;
    int _955 = _885 ? 0 : 1;
    float _957 = fma(_945, _901, _901);
    float _959 = fma(_785, _945, _785);
    float _961 = _947 * _949;
    float _963 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _965 = _911 * _963;
    float _967 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[196].x, _957);
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _971 = _915 * _969;
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _975 = -_953;
    float _977 = fma(_915, _973, _975);
    bool _979 = !_753;
    int _981 = _979 ? 0 : 1;
    float _983 = fma(_959, _935, _967);
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _987 = -_971;
    float _989 = fma(_911, _985, _987);
    int _991 = ~_955;
    int _993 = _991 + 1;
    int _995 = _993 + 1;
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _999 = -_965;
    float _1001 = fma(_919, _997, _999);
    int _1003 = _995;
    if (!_909)
    {
        int _1005 = ~_955;
        int _1007 = _1005 + 1;
        _1003 = _1007;
    }
    int _1009 = _1003;
    float _1011 = _989 * _989;
    bool _1013 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1015 = isnan(_679);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = _983 * 0.15915493667125701904296875;
    int _1027 = abs(_981);
    float _1029 = fma(_977, _977, _1011);
    bool _1031 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1033 = isnan(_679);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1039 = _1035 || _1037;
    float _1041 = float(_1039);
    float _1043 = -_1023;
    float _1045 = _1043 + 1.0;
    float _1047 = float(_1027);
    float _1049 = fma(_1001, _1001, _1029);
    float _1051 = float(_1009);
    float _1053 = _961 * (-2.0);
    bool _1055 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1057 = isnan(_679);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1063 = _1059 || _1061;
    float _1065 = float(_1063);
    float _1067 = _1041 * _1045;
    float _1069 = _699 + (-0.5);
    float _1071 = fma(_1053, _903, _903);
    float _1073 = -_1041;
    float _1075 = _1073 + 1.0;
    float _1077 = _1047 * _1051;
    float _1079 = fma(_767, _1053, _767);
    float _1081 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1071);
    float _1083 = _1065 * _1075;
    float _1085 = _1077 * (-2.0);
    float _1087 = -_1065;
    float _1089 = _1087 + 1.0;
    float _1091 = fma(_1079, _935, _1081);
    float _1093 = _875 * _1083;
    float _1095 = _739 * _1083;
    float _1097 = fma(_783, _1085, _783);
    float _1099 = fma(_1085, _905, _905);
    float _1101 = _1091 * 0.15915493667125701904296875;
    float _1103 = in.m_57.x;
    float _1105 = in.m_57.y;
    float _1107 = _681 + (-0.5);
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1117 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1095);
    float _1119 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1099);
    float _1121 = fma(_1111, _765, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1123 = fma(_1115, _765, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1125 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1093);
    float _1127 = fma(_1097, _935, _1119);
    float _1129 = fma(_1121, _1067, _1117);
    float _1131 = rsqrt(_1049);
    float _1133 = fma(_1123, _1067, _1125);
    float _1135 = _1127 * 0.15915493667125701904296875;
    float _1137 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1129);
    float _1139 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1133);
    float _1141 = fma(_467, _399, _711);
    float _1143 = fma(_467, _413, _737);
    float _1145 = _1025 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    bool _1149 = !_735;
    float _1151 = _1149 ? (-0.5) : 0.5;
    bool _1153 = !_731;
    float _1155 = _1153 ? (-0.5) : 0.5;
    float _1157 = _1137 * _1103;
    float _1159 = _1139 * _1105;
    float _1161 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1151);
    float _1163 = _1025 * 6.283185482025146484375;
    float _1165 = cos(_1163);
    float _1167 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1155);
    float _1169 = _1159 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1171 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1173 = _1001 * _1131;
    float _1175 = _989 * _1131;
    float _1177 = _1169 * _1161;
    float _1179 = _1171 * _1167;
    float _1181 = _1101 * 6.283185482025146484375;
    float _1183 = sin(_1181);
    float _1185 = _977 * _1131;
    float _1187 = _911 * _1175;
    bool _1189 = _697 > 0.5;
    float _1191 = _915 * _1185;
    float _1193 = -_1187;
    float _1195 = fma(_919, _1185, _1193);
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1199 = _1197 != 0;
    float _1201 = _1101 * 6.283185482025146484375;
    float _1203 = cos(_1201);
    float _1205 = -_1155;
    int _1207 = _1189 ? as_type<int>(_1205) : as_type<int>(_1155);
    bool _1209 = !_1199;
    float _1211 = _1209 ? _1155 : as_type<float>(_1207);
    float _1213 = _1135 * 6.283185482025146484375;
    float _1215 = cos(_1213);
    float _1217 = _1165 * _1183;
    float _1219 = _1147 * _1183;
    float _1221 = _1135 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = _1147 * _1203;
    float _1227 = _1165 * _1203;
    float _1229 = _1165 * _1215;
    float _1231 = _1203 * _1215;
    float _1233 = _1147 * _1215;
    float _1235 = _1183 * _1215;
    float _1237 = _1229 * _915;
    float _1239 = _1229 * _919;
    float _1241 = -_1217;
    float _1243 = fma(_1223, _1225, _1241);
    float _1245 = fma(_1223, _1227, _1219);
    float _1247 = -_1225;
    float _1249 = fma(_1223, _1217, _1247);
    float _1251 = fma(_1223, _1219, _1227);
    float _1253 = _1229 * _911;
    float _1255 = _919 * _1173;
    float _1257 = _1249 * _911;
    float _1259 = -_1223;
    float _1261 = fma(_1259, _1173, _1237);
    float _1263 = -_1223;
    float _1265 = fma(_1263, _1185, _1253);
    float _1267 = -_1255;
    float _1269 = fma(_915, _1175, _1267);
    float _1271 = _1245 * _911;
    float _1273 = _1245 * _915;
    float _1275 = fma(_1235, _1185, _1257);
    float _1277 = fma(_1233, _1269, _1265);
    float _1279 = fma(_1231, _1185, _1271);
    float _1281 = _1249 * _915;
    float _1283 = fma(_1231, _1173, _1273);
    float _1285 = fma(_1233, _1195, _1261);
    float _1287 = fma(_1251, _1269, _1275);
    float _1289 = fma(_1243, _1269, _1279);
    float _1291 = _1177 * _1277;
    float _1293 = fma(_1235, _1173, _1281);
    float _1295 = fma(_1243, _1195, _1283);
    float _1297 = _1177 * _1285;
    float _1299 = fma(_1179, _1289, _1291);
    float _1301 = fma(_1251, _1195, _1293);
    float _1303 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1305 = fma(_1179, _1295, _1297);
    float _1307 = _1141 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1309 = _1143 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1311 = fma(_1303, _1287, _1299);
    float _1313 = fma(_1303, _1301, _1305);
    float _1315 = -_1191;
    float _1317 = fma(_911, _1173, _1315);
    float _1319 = _1245 * _919;
    float _1321 = _1307 + _1311;
    float _1323 = _1309 + _1313;
    float _1325 = -_1223;
    float _1327 = fma(_1325, _1175, _1239);
    float _1329 = _1249 * _919;
    float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1333 = _1321 + _1331;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1337 = _1323 + _1335;
    float _1339 = fma(_1231, _1175, _1319);
    float _1341 = fma(_1233, _1317, _1327);
    float _1343 = _1333 * _1333;
    float _1345 = _1337 * _1337;
    float _1347 = fma(_1235, _1175, _1329);
    float _1349 = fma(_1243, _1317, _1339);
    float _1351 = _1177 * _1341;
    float _1353 = _1343 + _1345;
    float _1355 = fma(_1251, _1317, _1347);
    float _1357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1359 = fma(_1179, _1349, _1351);
    float _1361 = fma(_1303, _1355, _1359);
    float _1363 = sqrt(_1353);
    float _1365 = _851 + _1361;
    bool _1367 = _1363 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1369 = _1343;
    float _1371 = _1345;
    float _1373 = _1321;
    float _1375 = _1323;
    float _1377 = _1337;
    if (!_1367)
    {
        _835 = _1365;
    }
    float _1379 = _835;
    bool _1381 = !_1367;
    float _1383 = _1379;
    if (!_1381)
    {
        float _1385 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1389 = _1363 + _1387;
        float _1391 = _1365 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1393 = rsqrt(_1353);
        float _1395 = _1389 * _1385;
        float _1397 = _1395 * 0.15915493667125701904296875;
        float _1399 = _1397 * 6.283185482025146484375;
        float _1401 = sin(_1399);
        float _1403 = _1397 * 6.283185482025146484375;
        float _1405 = cos(_1403);
        float _1407 = fma(_1401, _1391, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1409 = _1393 * _1407;
        float _1411 = _1405 + (-1.0);
        float _1413 = fma(_1333, _1409, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1415 = fma(_1337, _1409, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1417 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1421 = _1413 + _1419;
        float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1425 = _1415 + _1423;
        float _1427 = fma(_1365, _1405, _1417);
        float _1429 = _1421 * _1421;
        float _1431 = _1425 * _1425;
        _1383 = _1427;
        _1369 = _1429;
        _1371 = _1431;
        _1373 = _1413;
        _1375 = _1415;
    }
    float _1433 = _1383;
    float _1435 = _1369;
    float _1437 = _1371;
    float _1439 = _1373;
    float _1441 = _1375;
    bool _1443 = _699 > 0.5;
    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1447 = _1433 + _1445;
    float _1449 = _1211 + 0.5;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1453 = _1451 != 0;
    float _1455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1457 = -_1151;
    int _1459 = _1443 ? as_type<int>(_1457) : as_type<int>(_1151);
    float _1461 = fma(_1447, _1447, _1435);
    float _1463 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1465 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1467 = !_1453;
    float _1469 = _1467 ? _1151 : as_type<float>(_1459);
    float _1471 = _1461 + _1437;
    float _1473 = _1463 * _1357;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1477 = -_1469;
    float _1479 = _1477 + 0.5;
    float _1481 = sqrt(_1471);
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1485 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1489 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1491 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1493 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1495 = _1489 * _1455;
    float _1497 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_66.x = _1485;
    out.m_66.y = _1491;
    out.m_66.z = _1493;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1501 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_68.x = _1473;
    out.m_68.y = _1495;
    bool _1503 = _1481 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1505 = isnan(_1481);
    bool _1507 = _1503 || _1505;
    bool _1509 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1511 = _1507 || _1509;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1515 = _1277 * _1497;
    float _1517 = _1341 * _1497;
    float _1519 = _1285 * _1497;
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1523 = _1499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1525 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1527 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1529 = fma(_1289, _1465, _1515);
    float _1531 = fma(_1349, _1465, _1517);
    float _1533 = fma(_1295, _1465, _1519);
    out.m_70.x = _1523;
    out.m_70.y = _1525;
    out.m_70.z = _1527;
    out.m_70.w = _1521;
    float _1535 = _1287 + _1529;
    float _1537 = _1355 + _1531;
    float _1539 = _1301 + _1533;
    float _1541 = _1523;
    float _1543 = _1521;
    float _1545 = _1531;
    float _1547 = _1517;
    if (!_1511)
    {
        _1541 = 1.0;
    }
    float _1549 = _1541;
    bool _1551 = !_1511;
    float _1553 = _1549;
    if (!_1551)
    {
        bool _1555 = _1481 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1557 = isnan(_1481);
        bool _1559 = _1555 || _1557;
        bool _1561 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1563 = _1559 || _1561;
        if (!_1563)
        {
            float _1565 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1567 = _1481 + _1565;
            float _1569 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1571 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1569;
            float _1573 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1575 = _1573 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1577 = 1.0 / _1571;
            float _1579 = _1567 * _1577;
            float _1581 = fma(_1579, _1575, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1553 = _1581;
            _1543 = _1575;
            _1583 = true;
        }
        else
        {
            bool _1585 = _1481 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1587 = isnan(_1481);
            bool _1589 = _1585 || _1587;
            bool _1591 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1593 = _1589 || _1591;
            if (!_1593)
            {
                float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1597 = _1481 + _1595;
                float _1599 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1601 = _1599 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1603 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1605 = _1603 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1607 = 1.0 / _1601;
                float _1609 = _1597 * _1607;
                float _1611 = fma(_1609, _1605, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1553 = _1611;
                _1543 = _1605;
                _1583 = true;
            }
            else
            {
                _1553 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1583 = false;
    float _1613 = _1553;
    float _1615 = _1543;
    float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1619 = _1439 + _1617;
    float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1623 = _1441 + _1621;
    bool _1625 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1629 = _1625 || _1627;
    bool _1631 = isnan(0.5);
    bool _1633 = _1629 || _1631;
    float _1635 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1637 = _1433 + _1635;
    float _1639 = fma(_1619, _1613, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1641 = fma(_1623, _1613, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1643 = fma(_1637, _1613, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1645 = _1637;
    float _1647 = _1615;
    float _1649 = _1613;
    if (_1633)
    {
        _1645 = _1639;
    }
    float _1651 = _1645;
    float _1653 = _1651;
    if (_1633)
    {
        _1647 = _1643;
    }
    float _1655 = _1647;
    float _1657 = _1655;
    if (_1633)
    {
        _1649 = _1641;
    }
    float _1659 = _1649;
    float _1661 = _1659;
    if (!_1633)
    {
        float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1665 = _851 + _1663;
        float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1669 = _1307 + _1667;
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1673 = -_1309;
        float _1675 = _1673 + _1641;
        float _1677 = _1665 * _1665;
        float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1681 = _1309 + _1679;
        float _1683 = fma(_1669, _1669, _1677);
        float _1685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1687 = fma(_1681, _1681, _1683);
        float _1689 = sqrt(_1687);
        float _1691 = _1671 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1693 = precise::min(_1689, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1695 = _1693 * _1685;
        float _1697 = -_1307;
        float _1699 = _1697 + _1639;
        float _1701 = _1691 * _1695;
        float _1703 = -_851;
        float _1705 = _1703 + _1643;
        float _1707 = fma(_1699, _1701, _1307);
        float _1709 = fma(_1705, _1701, _851);
        float _1711 = fma(_1675, _1701, _1309);
        _1657 = _1709;
        _1653 = _1707;
        _1661 = _1711;
    }
    float _1713 = _1657;
    float _1715 = _1653;
    float _1717 = _1661;
    float _1719 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1721 = _1713 + _1719;
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1725 = _1715 + _1723;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1729 = _1717 + _1727;
    float _1731 = _1721 * _1721;
    float _1733 = fma(_1725, _1725, _1731);
    float _1735 = fma(_1729, _1729, _1733);
    float _1737 = rsqrt(_1735);
    float _1739 = _1725 * _1737;
    float _1741 = _1729 * _1737;
    float _1743 = _1721 * _1737;
    float _1745 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1747 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1749 = _1745 * _1745;
    float _1751 = _1747 * _1747;
    float _1753 = _1749 + _1751;
    float _1755 = sqrt(_1753);
    bool _1757 = _1755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1761 = _1755 + _1759;
    float _1763 = _1495;
    float _1765 = _1761;
    float _1767 = _1745;
    if (_1757)
    {
        float _1769 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1763 = _1769;
    }
    float _1771 = _1763;
    if (_1757)
    {
        float _1773 = rsqrt(_1753);
        _1545 = _1773;
    }
    float _1775 = _1545;
    float _1777 = _1775;
    if (_1757)
    {
        float _1779 = _1761 * _1771;
        _1765 = _1779;
    }
    float _1781 = _1765;
    if (_1757)
    {
        float _1783 = _1781 * 0.15915493667125701904296875;
        _1547 = _1783;
    }
    float _1785 = _1547;
    float _1787 = _1643;
    if (_1757)
    {
        float _1789 = _1785 * 6.283185482025146484375;
        float _1791 = sin(_1789);
        _1787 = _1791;
    }
    float _1793 = _1787;
    float _1795 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1797 = precise::max(0.0, _1795);
    float _1799 = _1771;
    float _1801 = _1797;
    float _1803 = _1795;
    if (_1757)
    {
        float _1805 = _1785 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        _1799 = _1807;
    }
    float _1809 = _1799;
    float _1811 = -_1743;
    float _1813 = -_1797;
    float _1815 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1813);
    if (_1757)
    {
        float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1801 = _1817;
    }
    float _1819 = _1801;
    float _1821 = sqrt(_1735);
    float _1823 = _1819;
    float _1825 = _1793;
    if (_1757)
    {
        float _1827 = fma(_1793, _1819, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1823 = _1827;
    }
    float _1829 = _1823;
    float _1831 = _1829;
    if (!_1757)
    {
        _1825 = _1749;
    }
    float _1833 = _1825;
    float _1835 = _1833;
    float _1837 = _1809;
    if (_1757)
    {
        float _1839 = _1809 + (-1.0);
        _1803 = _1839;
    }
    float _1841 = _1803;
    float _1843 = _1841;
    if (_1757)
    {
        float _1845 = _1775 * _1829;
        _1377 = _1845;
    }
    float _1847 = _1377;
    if (!_1757)
    {
        _1831 = _1815;
    }
    float _1849 = _1831;
    float _1851 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1853 = _1849;
    if (_1757)
    {
        float _1855 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1777 = _1855;
    }
    float _1857 = _1777;
    if (_1757)
    {
        float _1859 = _1745 * _1847;
        _1767 = _1859;
    }
    float _1861 = _1767;
    if (!_1757)
    {
        _1843 = _1747;
    }
    float _1863 = _1843;
    float _1865 = _1863;
    if (_1757)
    {
        float _1867 = _1747 * _1847;
        _1865 = _1867;
    }
    float _1869 = _1865;
    if (_1757)
    {
        float _1871 = fma(_1815, _1809, _1857);
        _1853 = _1871;
    }
    float _1873 = _1853;
    if (_1757)
    {
        float _1875 = _1861 * _1861;
        _1835 = _1875;
    }
    float _1877 = _1835;
    if (!_1757)
    {
        _1837 = _1751;
    }
    float _1879 = _1837;
    float _1881 = _1879;
    if (_1757)
    {
        float _1883 = _1869 * _1869;
        _1881 = _1883;
    }
    float _1885 = _1881;
    float _1887 = fma(_1873, _1873, _1877);
    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1891 = _1887 + _1885;
    float _1893 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1897 = fma(_1821, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1895);
    float _1899 = precise::clamp(_1897, 0.0, 1.0);
    float _1901 = rsqrt(_1891);
    float _1903 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1893);
    float _1905 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1907 = -_1899;
    float _1909 = _1907 + 1.0;
    float _1911 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1913 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1903);
    float _1915 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1905);
    float _1917 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1911);
    float _1919 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1921 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1915);
    float _1923 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1851);
    float _1925 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1917);
    float _1927 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1929 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1931 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1923);
    float _1933 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1935 = _1901 * _1861;
    float _1937 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1939 = abs(_1909);
    float _1941 = log2(_1939);
    float _1943 = -_1927;
    float _1945 = fma(_1943, _1889, 1.0);
    float _1947 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1949 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1937);
    float _1951 = _1901 * _1873;
    float _1953 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1955 = _1901 * _1869;
    float _1957 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1949);
    float _1959 = log2(_1945);
    float _1961 = -_1953;
    float _1963 = fma(_1951, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1961);
    float _1965 = _1951 + 1.0;
    float _1967 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1957);
    float _1969 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1971 = -_1955;
    float _1973 = fma(_1971, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1963);
    float _1975 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1977 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1979 = fma(_1973, -0.5, 0.5);
    float _1981 = 1.0 / _1967;
    float _1983 = fma(_1973, 0.5, 0.5);
    float _1985 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1969);
    float _1987 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1975);
    float _1989 = fma(_1983, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1991 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1985);
    float _1993 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1987);
    float _1995 = exp2(_1977);
    float _1997 = fma(_1983, _1989, -0.212114393711090087890625);
    float _1999 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1991);
    float _2001 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1993);
    float _2003 = _1959 * 0.693147182464599609375;
    float _2005 = fma(_1983, _1997, 1.570728778839111328125);
    float _2007 = sqrt(_1979);
    float _2009 = _1999 * _1981;
    float _2011 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2013 = fma(_2009, 0.5, 0.5);
    float _2015 = -_1951;
    float _2017 = fma(_1995, _1965, _2015);
    float _2019 = _2001 * _1981;
    float _2021 = fma(_2017, 0.5, 0.5);
    float _2023 = fma(_2019, -0.5, 0.5);
    float _2025 = _2007 * 0.636619746685028076171875;
    float _2027 = -_2005;
    float _2029 = fma(_2025, _2027, 1.0);
    float3 _5320 = float3(_2013, _2023, _2011);
    float _2031 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5320, float3(0.0), isnan(_5320)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5320, float3(0.0), isnan(_5320)), level(0.0)).x;
    float3 _5331 = float3(_2013, _2023, _2011);
    float4 _2034 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5331, float3(0.0), isnan(_5331)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5331, float3(0.0), isnan(_5331)), level(0.0)).xyzw;
    float _2036 = _2034.x;
    float _2038 = _2034.y;
    float _2040 = _2034.z;
    float _2042 = _2034.w;
    float2 _5348 = float2(_2029, _2021);
    float3 _2046 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5348, float2(0.0), isnan(_5348)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5348, float2(0.0), isnan(_5348)), level(0.0)).xyz;
    float _2048 = _2046.x;
    float _2050 = _2046.y;
    float _2052 = _2046.z;
    float _2054 = _851 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2056 = _1537 * _1743;
    float _2058 = _851 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2060 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2054);
    float _2062 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2064 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2064;
    float _2068 = fma(_1535, _1739, _2056);
    float _2070 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2060);
    float _2072 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2058);
    float _2074 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2076 = fma(_1539, _1741, _2068);
    float _2078 = 1.0 / _2066;
    float _2080 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2082 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2072);
    float _2084 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2074);
    float _2086 = abs(_2076);
    float _2088 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2090 = _2086 + _2088;
    bool _2092 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2094 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2096 = _2092 || _2094;
    bool _2098 = isnan(0.5);
    bool _2100 = _2096 || _2098;
    float _2102 = _2082 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2104 = 1.0 / _2080;
    float _2106 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2084);
    float _2108 = _2102 + _2080;
    float _2110 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2106);
    float _2112 = exp2(_2062);
    float _2114 = _2090 * _2078;
    float _2116 = precise::clamp(_2114, 0.0, 1.0);
    float _2118 = fma(_2116, -2.0, 3.0);
    float _2120 = _2116 * _2116;
    float _2122 = 2.0;
    if (_2100)
    {
        _2122 = 1.0;
    }
    float _2124 = _2122;
    float _2126 = _2108 * _2104;
    float _2128 = _2126 * 0.5;
    float _2130 = _2124;
    if (!_2100)
    {
        float _2132 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2134 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2136 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2134);
        float _2138 = _2132 * 0.15915493667125701904296875;
        float _2140 = _2138 * 6.283185482025146484375;
        float _2142 = cos(_2140);
        float _2144 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2146 = _2144 * 0.15915493667125701904296875;
        float _2148 = _2138 * 6.283185482025146484375;
        float _2150 = sin(_2148);
        float _2152 = 1.0 / _2142;
        float _2154 = _2146 * 6.283185482025146484375;
        float _2156 = cos(_2154);
        float _2158 = _2150 * _2152;
        float _2160 = 1.0 / _2136;
        float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2164 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2162;
        float _2166 = _2156 * _2158;
        float _2168 = _2146 * 6.283185482025146484375;
        float _2170 = sin(_2168);
        float _2172 = 1.0 / _2166;
        float _2174 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2176 = _2160 * _2174;
        float _2178 = 1.0 / _2164;
        float _2180 = _2170 * _2172;
        float _2182 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2184 = fma(_2180, _2176, _2182);
        float _2186 = _2184 * _2178;
        float _2188 = precise::clamp(_2186, 0.0, 1.0);
        _2130 = _2188;
    }
    float _2190 = _2130;
    float _2192 = _2120 * _2118;
    float _2194 = -_2112;
    float _2196 = _2194 + 1.0;
    bool _2198 = _2190 > 0.0;
    bool _2200 = isnan(_2190);
    bool _2202 = _2198 || _2200;
    bool _2204 = isnan(0.0);
    bool _2206 = _2202 || _2204;
    float _2208 = _2110 + _1967;
    float _2210 = _2192 * _2190;
    float _2212 = _1999 + _1967;
    float _2214 = _1967 * 0.5;
    out.gl_Position.x = _1999;
    out.gl_Position.y = _2001;
    out.gl_Position.z = _2110;
    out.gl_Position.w = _1967;
    float _2216 = _2210 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2218 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2220 = _2208 * 0.5;
    float _2222 = _2212 * 0.5;
    float _2224 = _2218 * _2031;
    float _2226 = -_2218;
    float _2228 = _2226 + 1.0;
    float _2230 = fma(_2001, -0.5, _2214);
    float _2232 = _2216 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2234 = _2042 * _2224;
    float _2236 = _2052 * _2224;
    float _2238 = _2042 * _2228;
    out.m_72.x = _2222;
    out.m_72.y = _2230;
    out.m_72.z = _2220;
    out.m_72.w = _1967;
    float _2240 = fma(_2048, _2234, _2036);
    float _2242 = fma(_2050, _2234, _2038);
    float _2244 = fma(_2042, _2236, _2040);
    out.m_47.x = _2232;
    out.m_74.x = _2240;
    out.m_74.y = _2242;
    out.m_74.z = _2244;
    out.m_74.w = _2238;
    if (_2206)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _2246 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2246;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1583 = false;
    bool _671 = false;
    bool _509 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2303 = as_type<float>(_109);
        out.gl_Position.z = _2303;
    }
    if (!_97)
    {
        return out;
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    float _131 = 0.0;
    float _133 = _127;
    if (_123)
    {
        float _135 = float(_93);
        _129 = _135;
    }
    float _137 = _129;
    bool _139 = _127 >= _137;
    bool _141 = !_123;
    bool _143 = _139 || _141;
    if (_143)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _103;
    if (_143)
    {
        out.m_47.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _111 = as_type<int>(_147);
    }
    int _149 = _111;
    float _151 = as_type<float>(_149);
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2374 = as_type<float>(_149);
        out.gl_Position.z = _2374;
    }
    if (_143)
    {
        return out;
    }
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = _159;
    if (!_169)
    {
        float _173 = _159 * _159;
        float _175 = _173 * 0.5;
        _151 = _175;
    }
    float _177 = _151;
    float _179 = 0.0;
    float _181 = _177;
    if (!_169)
    {
        float _183 = _127 * _127;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    if (!_169)
    {
        float _189 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _189;
    }
    float _191 = _181;
    bool _193 = !_169;
    float _195 = _191;
    float _197 = 0.0;
    if (!_193)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _159 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _159);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _131 = _215;
        _195 = _227;
        _197 = _217;
    }
    float _229 = _131;
    float _231 = _195;
    float _233 = _197;
    bool _235 = !_169;
    float _237 = _229;
    float _239 = _233;
    if (!_235)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _159 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _237 = _253;
        _239 = _247;
        _171 = _259;
    }
    float _261 = _237;
    float _263 = _239;
    float _265 = _171;
    float _267 = _263;
    float _269 = _261;
    if (!_169)
    {
        _267 = _127;
    }
    float _271 = _267;
    float _273 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _271;
    if (!_169)
    {
        float _277 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _277;
    }
    float _279 = _269;
    bool _281 = !_169;
    float _283 = _279;
    if (!_281)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = _127 * _287;
        float _297 = exp2(_295);
        float _299 = _293 * 0.693147182464599609375;
        float _301 = 1.0 / _299;
        float _303 = 1.0 / _291;
        float _305 = _297 + (-1.0);
        float _307 = -_305;
        float _309 = fma(_307, _301, _127);
        float _311 = _309 * _303;
        float _313 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _283 = _313;
    }
    float _315 = _283;
    bool _317 = !_169;
    if (!_317)
    {
        float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _321 = log2(_319);
        float _323 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _325 = _323 + 1.0;
        float _327 = 1.0 / _325;
        float _329 = _127 * _321;
        float _331 = exp2(_329);
        float _333 = -_331;
        float _335 = _333 + 1.0;
        float _337 = _335 * _327;
        _275 = _337;
    }
    float _339 = _275;
    float _341 = fma(_265, _153, _273);
    float _343 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _345 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _347 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _349 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_265, _155, _343);
    float _353 = fma(_339, _155, _345);
    float _355 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _357 = fma(_339, _153, _347);
    float _359 = fma(_339, _157, _349);
    float _361 = -_353;
    float _363 = _351 + _361;
    float _365 = fma(_265, _157, _355);
    float _367 = -_357;
    float _369 = _341 + _367;
    float _371 = in.m_51.y;
    float _373 = _363 * _363;
    float _375 = -_359;
    float _377 = _365 + _375;
    float _379 = in.m_53.y;
    float _381 = fma(_369, _369, _373);
    float _383 = in.m_55.y;
    float _385 = fma(_377, _377, _381);
    float _387 = in.m_51.x;
    float _389 = sqrt(_385);
    float _391 = in.m_53.x;
    float _393 = in.m_55.x;
    float _395 = in.m_51.z;
    float _397 = _363 * _371;
    float _399 = in.m_53.z;
    float _401 = _363 * _379;
    bool _403 = _389 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_389);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = in.m_55.z;
    float _415 = _363 * _383;
    float _417 = _371 * _371;
    float _419 = in.m_57.w;
    float _421 = fma(_369, _387, _397);
    float _423 = in.m_44.x;
    float _425 = in.m_44.y;
    float _427 = in.m_44.z;
    float _429 = fma(_369, _391, _401);
    float _431 = fma(_369, _393, _415);
    float _433 = fma(_377, _395, _421);
    float _435 = fma(_377, _399, _429);
    float _437 = fma(_379, _379, _417);
    float _439 = fma(_377, _413, _431);
    float _441 = _431;
    float _443 = _421;
    float _445 = _433;
    if (_411)
    {
        _441 = _433;
    }
    float _447 = _441;
    float _449 = fma(_383, _383, _437);
    float _451 = _447;
    float _453 = _447;
    if (_411)
    {
        _443 = _435;
    }
    float _455 = _443;
    float _457 = _455;
    float _459 = _455;
    if (_411)
    {
        _445 = _439;
    }
    float _461 = _445;
    float _463 = fma(_341, _419, _423);
    float _465 = fma(_351, _419, _425);
    float _467 = fma(_365, _419, _427);
    float _469 = _461;
    if (!_411)
    {
        bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _473 = !_471;
        if (!_473)
        {
            float _475 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _477 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _479 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _481 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[16].x, _475);
            float _483 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[16].x, _477);
            float _485 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[16].x, _479);
            float _487 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].z, _481);
            float _489 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[16].z, _483);
            float _491 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[16].z, _485);
            float _493 = _487 * _487;
            float _495 = fma(_489, _489, _493);
            float _497 = fma(_491, _491, _495);
            float _499 = rsqrt(_497);
            float _501 = _499 * 9.9999999747524270787835121154785e-07;
            float _503 = _489 * _501;
            float _505 = _487 * _501;
            float _507 = _491 * _501;
            _453 = _505;
            _459 = _503;
            _469 = _507;
            _509 = true;
        }
        else
        {
            float _511 = _155 * _155;
            float _513 = fma(_153, _153, _511);
            float _515 = fma(_157, _157, _513);
            float _517 = sqrt(_515);
            bool _519 = _517 >= 9.9999999747524270787835121154785e-07;
            bool _521 = isnan(_517);
            bool _523 = _519 || _521;
            bool _525 = isnan(9.9999999747524270787835121154785e-07);
            bool _527 = _523 || _525;
            float _529 = _517;
            if (!_527)
            {
                float _531 = _425 * _425;
                float _533 = fma(_423, _423, _531);
                float _535 = fma(_427, _427, _533);
                float _537 = sqrt(_535);
                bool _539 = _537 >= 9.9999999747524270787835121154785e-07;
                bool _541 = isnan(_537);
                bool _543 = _539 || _541;
                bool _545 = isnan(9.9999999747524270787835121154785e-07);
                bool _547 = _543 || _545;
                float _549 = _449;
                if (!_547)
                {
                    float _551 = rsqrt(_449);
                    _549 = _551;
                }
                float _553 = _549;
                if (!_547)
                {
                    float _555 = _553 * 9.9999999747524270787835121154785e-07;
                    _529 = _555;
                }
                float _557 = _529;
                float _559 = _557;
                if (!_547)
                {
                    float _561 = _379 * _557;
                    _457 = _561;
                }
                float _563 = _457;
                _459 = _563;
                if (!_547)
                {
                    float _565 = _371 * _557;
                    _451 = _565;
                }
                float _567 = _451;
                _453 = _567;
                if (!_547)
                {
                    float _569 = _383 * _557;
                    _559 = _569;
                }
                float _571 = _559;
                bool _573 = !_547;
                _469 = _571;
                _509 = _573;
                if (!_509)
                {
                    float _575 = _371 * _425;
                    float _577 = _379 * _425;
                    float _579 = _383 * _425;
                    float _581 = fma(_423, _387, _575);
                    float _583 = fma(_423, _391, _577);
                    float _585 = fma(_423, _393, _579);
                    float _587 = fma(_427, _395, _581);
                    float _589 = fma(_427, _399, _583);
                    float _591 = fma(_427, _413, _585);
                    float _593 = _587 * _587;
                    float _595 = fma(_589, _589, _593);
                    float _597 = fma(_591, _591, _595);
                    float _599 = rsqrt(_597);
                    float _601 = _599 * 9.9999999747524270787835121154785e-07;
                    float _603 = _589 * _601;
                    float _605 = _587 * _601;
                    float _607 = _591 * _601;
                    _453 = _605;
                    _459 = _603;
                    _469 = _607;
                    _509 = true;
                }
            }
            else
            {
                float _609 = _371 * _155;
                float _611 = _379 * _155;
                float _613 = _383 * _155;
                float _615 = fma(_153, _387, _609);
                float _617 = fma(_153, _391, _611);
                float _619 = fma(_153, _393, _613);
                float _621 = fma(_157, _395, _615);
                float _623 = fma(_157, _399, _617);
                float _625 = fma(_157, _413, _619);
                float _627 = _621 * _621;
                float _629 = fma(_623, _623, _627);
                float _631 = fma(_625, _625, _629);
                float _633 = rsqrt(_631);
                float _635 = _633 * 9.9999999747524270787835121154785e-07;
                float _637 = _623 * _635;
                float _639 = _621 * _635;
                float _641 = _625 * _635;
                _453 = _639;
                _459 = _637;
                _469 = _641;
            }
        }
    }
    _509 = false;
    float _643 = _453;
    float _645 = _459;
    float _647 = _469;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _651 = !_649;
    float _669;
    if (!_651)
    {
        float _653 = in.m_59.x;
        float _655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _657 = _653 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _661 = _659 * _655;
        float _663 = floor(_661);
        float _665 = -_663;
        float _667 = _661 + _665;
        _669 = _667;
        _671 = true;
    }
    else
    {
        float _673 = float(_93);
        float _675 = 1.0 / _673;
        float _677 = _127 * _675;
        _669 = _677;
    }
    _671 = false;
    float _679 = _669;
    float _681 = in.m_59.z;
    float _683 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _685 = log2(_683);
    float _687 = as_type<float>(int(gl_VertexIndex));
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _697 = in.m_59.x;
    float _699 = in.m_59.y;
    float _701 = _465 * _383;
    float _703 = 1.0 / _691;
    float _705 = _465 * _379;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _709 = _679 + _707;
    float _711 = fma(_463, _391, _705);
    float _713 = _465 * _371;
    float _715 = 1.0 / _695;
    float _717 = _685 * _127;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _719;
    float _723 = _681 * 2.0;
    float _725 = exp2(_717);
    float _727 = _709 * _703;
    int _729 = as_type<int>(_687) & 1;
    bool _731 = _729 != 0;
    int _733 = as_type<int>(_687) & 2;
    bool _735 = _733 != 0;
    float _737 = fma(_463, _393, _701);
    float _739 = fma(_721, _727, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _741 = _699 + _681;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _745 = _743 != 0;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _749 = _747 != 0;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _753 = _751 != 0;
    float _755 = floor(_723);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _759 = _679 + _757;
    float _761 = _741 + (-1.0);
    float _763 = _681 + _697;
    float _765 = _759 * _715;
    float _767 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _769 = _699 + _697;
    float _771 = _643 * _643;
    float _773 = _763 + (-1.0);
    float _775 = -_725;
    float _777 = _775 + 1.0;
    float _779 = _769 + (-1.0);
    float _781 = fma(_645, _645, _771);
    float _783 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _785 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _787 = _755 > 0.0;
    float _789 = _699 * 2.0;
    bool _791 = _755 >= 0.0;
    bool _793 = isnan(_755);
    bool _795 = _791 || _793;
    bool _797 = isnan(0.0);
    bool _799 = _795 || _797;
    float _801 = _697 * 2.0;
    float _803 = fma(_647, _647, _781);
    float _805 = floor(_789);
    int _807 = _799 ? 0 : 1;
    float _809 = fma(_463, _387, _713);
    bool _811 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _819 = _815 || _817;
    int _821 = ~_807;
    int _823 = _821 + 1;
    int _825 = _823 + 1;
    float _827 = fma(_467, _395, _809);
    float _829 = _819 ? _777 : 0.0;
    float _831 = floor(_801);
    int _833 = _825;
    float _835 = _713;
    if (!_787)
    {
        int _837 = ~_807;
        int _839 = _837 + 1;
        _833 = _839;
    }
    int _841 = _833;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _843;
    bool _847 = !_745;
    int _849 = _847 ? 0 : 1;
    float _851 = _827 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _853 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _855 = isnan(1.0);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _861 = _857 || _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _865 = 1.0 + _863;
    int _867 = abs(_849);
    float _869 = rsqrt(_803);
    bool _871 = !_749;
    int _873 = _871 ? 0 : 1;
    float _875 = fma(_845, _727, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _877 = _805 >= 0.0;
    bool _879 = isnan(_805);
    bool _881 = _877 || _879;
    bool _883 = isnan(0.0);
    bool _885 = _881 || _883;
    bool _887 = _831 > 0.0;
    float _889 = 1.0 / _865;
    bool _891 = _831 >= 0.0;
    bool _893 = isnan(_831);
    bool _895 = _891 || _893;
    bool _897 = isnan(0.0);
    bool _899 = _895 || _897;
    float _901 = in.m_64.x;
    float _903 = in.m_64.y;
    float _905 = in.m_64.z;
    int _907 = _899 ? 0 : 1;
    bool _909 = _805 > 0.0;
    float _911 = _869 * _645;
    float _913 = float(_867);
    float _915 = _869 * _647;
    float _917 = float(_841);
    float _919 = _869 * _643;
    int _921 = abs(_873);
    int _923 = ~_907;
    int _925 = _923 + 1;
    int _927 = _925 + 1;
    float _929 = _913 * _917;
    int _931 = _927;
    if (_861)
    {
        float _933 = _829 * _889;
        _133 = _933;
    }
    float _935 = _133;
    float _937 = _697 + (-0.5);
    if (!_887)
    {
        int _939 = ~_907;
        int _941 = _939 + 1;
        _931 = _941;
    }
    int _943 = _931;
    float _945 = _929 * (-2.0);
    float _947 = float(_921);
    float _949 = float(_943);
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _953 = _919 * _951;
    int _955 = _885 ? 0 : 1;
    float _957 = fma(_945, _901, _901);
    float _959 = fma(_785, _945, _785);
    float _961 = _947 * _949;
    float _963 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _965 = _911 * _963;
    float _967 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[196].x, _957);
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _971 = _915 * _969;
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _975 = -_953;
    float _977 = fma(_915, _973, _975);
    bool _979 = !_753;
    int _981 = _979 ? 0 : 1;
    float _983 = fma(_959, _935, _967);
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _987 = -_971;
    float _989 = fma(_911, _985, _987);
    int _991 = ~_955;
    int _993 = _991 + 1;
    int _995 = _993 + 1;
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _999 = -_965;
    float _1001 = fma(_919, _997, _999);
    int _1003 = _995;
    if (!_909)
    {
        int _1005 = ~_955;
        int _1007 = _1005 + 1;
        _1003 = _1007;
    }
    int _1009 = _1003;
    float _1011 = _989 * _989;
    bool _1013 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1015 = isnan(_679);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = _983 * 0.15915493667125701904296875;
    int _1027 = abs(_981);
    float _1029 = fma(_977, _977, _1011);
    bool _1031 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1033 = isnan(_679);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1039 = _1035 || _1037;
    float _1041 = float(_1039);
    float _1043 = -_1023;
    float _1045 = _1043 + 1.0;
    float _1047 = float(_1027);
    float _1049 = fma(_1001, _1001, _1029);
    float _1051 = float(_1009);
    float _1053 = _961 * (-2.0);
    bool _1055 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1057 = isnan(_679);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1063 = _1059 || _1061;
    float _1065 = float(_1063);
    float _1067 = _1041 * _1045;
    float _1069 = _699 + (-0.5);
    float _1071 = fma(_1053, _903, _903);
    float _1073 = -_1041;
    float _1075 = _1073 + 1.0;
    float _1077 = _1047 * _1051;
    float _1079 = fma(_767, _1053, _767);
    float _1081 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1071);
    float _1083 = _1065 * _1075;
    float _1085 = _1077 * (-2.0);
    float _1087 = -_1065;
    float _1089 = _1087 + 1.0;
    float _1091 = fma(_1079, _935, _1081);
    float _1093 = _875 * _1083;
    float _1095 = _739 * _1083;
    float _1097 = fma(_783, _1085, _783);
    float _1099 = fma(_1085, _905, _905);
    float _1101 = _1091 * 0.15915493667125701904296875;
    float _1103 = in.m_57.x;
    float _1105 = in.m_57.y;
    float _1107 = _681 + (-0.5);
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1117 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1095);
    float _1119 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1099);
    float _1121 = fma(_1111, _765, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1123 = fma(_1115, _765, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1125 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1093);
    float _1127 = fma(_1097, _935, _1119);
    float _1129 = fma(_1121, _1067, _1117);
    float _1131 = rsqrt(_1049);
    float _1133 = fma(_1123, _1067, _1125);
    float _1135 = _1127 * 0.15915493667125701904296875;
    float _1137 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1129);
    float _1139 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1133);
    float _1141 = fma(_467, _399, _711);
    float _1143 = fma(_467, _413, _737);
    float _1145 = _1025 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    bool _1149 = !_735;
    float _1151 = _1149 ? (-0.5) : 0.5;
    bool _1153 = !_731;
    float _1155 = _1153 ? (-0.5) : 0.5;
    float _1157 = _1137 * _1103;
    float _1159 = _1139 * _1105;
    float _1161 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1151);
    float _1163 = _1025 * 6.283185482025146484375;
    float _1165 = cos(_1163);
    float _1167 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1155);
    float _1169 = _1159 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1171 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1173 = _1001 * _1131;
    float _1175 = _989 * _1131;
    float _1177 = _1169 * _1161;
    float _1179 = _1171 * _1167;
    float _1181 = _1101 * 6.283185482025146484375;
    float _1183 = sin(_1181);
    float _1185 = _977 * _1131;
    float _1187 = _911 * _1175;
    bool _1189 = _697 > 0.5;
    float _1191 = _915 * _1185;
    float _1193 = -_1187;
    float _1195 = fma(_919, _1185, _1193);
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1199 = _1197 != 0;
    float _1201 = _1101 * 6.283185482025146484375;
    float _1203 = cos(_1201);
    float _1205 = -_1155;
    int _1207 = _1189 ? as_type<int>(_1205) : as_type<int>(_1155);
    bool _1209 = !_1199;
    float _1211 = _1209 ? _1155 : as_type<float>(_1207);
    float _1213 = _1135 * 6.283185482025146484375;
    float _1215 = cos(_1213);
    float _1217 = _1165 * _1183;
    float _1219 = _1147 * _1183;
    float _1221 = _1135 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = _1147 * _1203;
    float _1227 = _1165 * _1203;
    float _1229 = _1165 * _1215;
    float _1231 = _1203 * _1215;
    float _1233 = _1147 * _1215;
    float _1235 = _1183 * _1215;
    float _1237 = _1229 * _915;
    float _1239 = _1229 * _919;
    float _1241 = -_1217;
    float _1243 = fma(_1223, _1225, _1241);
    float _1245 = fma(_1223, _1227, _1219);
    float _1247 = -_1225;
    float _1249 = fma(_1223, _1217, _1247);
    float _1251 = fma(_1223, _1219, _1227);
    float _1253 = _1229 * _911;
    float _1255 = _919 * _1173;
    float _1257 = _1249 * _911;
    float _1259 = -_1223;
    float _1261 = fma(_1259, _1173, _1237);
    float _1263 = -_1223;
    float _1265 = fma(_1263, _1185, _1253);
    float _1267 = -_1255;
    float _1269 = fma(_915, _1175, _1267);
    float _1271 = _1245 * _911;
    float _1273 = _1245 * _915;
    float _1275 = fma(_1235, _1185, _1257);
    float _1277 = fma(_1233, _1269, _1265);
    float _1279 = fma(_1231, _1185, _1271);
    float _1281 = _1249 * _915;
    float _1283 = fma(_1231, _1173, _1273);
    float _1285 = fma(_1233, _1195, _1261);
    float _1287 = fma(_1251, _1269, _1275);
    float _1289 = fma(_1243, _1269, _1279);
    float _1291 = _1177 * _1277;
    float _1293 = fma(_1235, _1173, _1281);
    float _1295 = fma(_1243, _1195, _1283);
    float _1297 = _1177 * _1285;
    float _1299 = fma(_1179, _1289, _1291);
    float _1301 = fma(_1251, _1195, _1293);
    float _1303 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1305 = fma(_1179, _1295, _1297);
    float _1307 = _1141 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1309 = _1143 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1311 = fma(_1303, _1287, _1299);
    float _1313 = fma(_1303, _1301, _1305);
    float _1315 = -_1191;
    float _1317 = fma(_911, _1173, _1315);
    float _1319 = _1245 * _919;
    float _1321 = _1307 + _1311;
    float _1323 = _1309 + _1313;
    float _1325 = -_1223;
    float _1327 = fma(_1325, _1175, _1239);
    float _1329 = _1249 * _919;
    float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1333 = _1321 + _1331;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1337 = _1323 + _1335;
    float _1339 = fma(_1231, _1175, _1319);
    float _1341 = fma(_1233, _1317, _1327);
    float _1343 = _1333 * _1333;
    float _1345 = _1337 * _1337;
    float _1347 = fma(_1235, _1175, _1329);
    float _1349 = fma(_1243, _1317, _1339);
    float _1351 = _1177 * _1341;
    float _1353 = _1343 + _1345;
    float _1355 = fma(_1251, _1317, _1347);
    float _1357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1359 = fma(_1179, _1349, _1351);
    float _1361 = fma(_1303, _1355, _1359);
    float _1363 = sqrt(_1353);
    float _1365 = _851 + _1361;
    bool _1367 = _1363 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1369 = _1343;
    float _1371 = _1345;
    float _1373 = _1321;
    float _1375 = _1323;
    float _1377 = _1337;
    if (!_1367)
    {
        _835 = _1365;
    }
    float _1379 = _835;
    bool _1381 = !_1367;
    float _1383 = _1379;
    if (!_1381)
    {
        float _1385 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1389 = _1363 + _1387;
        float _1391 = _1365 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1393 = rsqrt(_1353);
        float _1395 = _1389 * _1385;
        float _1397 = _1395 * 0.15915493667125701904296875;
        float _1399 = _1397 * 6.283185482025146484375;
        float _1401 = sin(_1399);
        float _1403 = _1397 * 6.283185482025146484375;
        float _1405 = cos(_1403);
        float _1407 = fma(_1401, _1391, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1409 = _1393 * _1407;
        float _1411 = _1405 + (-1.0);
        float _1413 = fma(_1333, _1409, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1415 = fma(_1337, _1409, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1417 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1421 = _1413 + _1419;
        float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1425 = _1415 + _1423;
        float _1427 = fma(_1365, _1405, _1417);
        float _1429 = _1421 * _1421;
        float _1431 = _1425 * _1425;
        _1383 = _1427;
        _1369 = _1429;
        _1371 = _1431;
        _1373 = _1413;
        _1375 = _1415;
    }
    float _1433 = _1383;
    float _1435 = _1369;
    float _1437 = _1371;
    float _1439 = _1373;
    float _1441 = _1375;
    bool _1443 = _699 > 0.5;
    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1447 = _1433 + _1445;
    float _1449 = _1211 + 0.5;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1453 = _1451 != 0;
    float _1455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1457 = -_1151;
    int _1459 = _1443 ? as_type<int>(_1457) : as_type<int>(_1151);
    float _1461 = fma(_1447, _1447, _1435);
    float _1463 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1465 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1467 = !_1453;
    float _1469 = _1467 ? _1151 : as_type<float>(_1459);
    float _1471 = _1461 + _1437;
    float _1473 = _1463 * _1357;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1477 = -_1469;
    float _1479 = _1477 + 0.5;
    float _1481 = sqrt(_1471);
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1485 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1489 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1491 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1493 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1495 = _1489 * _1455;
    float _1497 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_66.x = _1485;
    out.m_66.y = _1491;
    out.m_66.z = _1493;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1501 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_68.x = _1473;
    out.m_68.y = _1495;
    bool _1503 = _1481 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1505 = isnan(_1481);
    bool _1507 = _1503 || _1505;
    bool _1509 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1511 = _1507 || _1509;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1515 = _1277 * _1497;
    float _1517 = _1341 * _1497;
    float _1519 = _1285 * _1497;
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1523 = _1499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1525 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1527 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1529 = fma(_1289, _1465, _1515);
    float _1531 = fma(_1349, _1465, _1517);
    float _1533 = fma(_1295, _1465, _1519);
    out.m_70.x = _1523;
    out.m_70.y = _1525;
    out.m_70.z = _1527;
    out.m_70.w = _1521;
    float _1535 = _1287 + _1529;
    float _1537 = _1355 + _1531;
    float _1539 = _1301 + _1533;
    float _1541 = _1523;
    float _1543 = _1521;
    float _1545 = _1531;
    float _1547 = _1517;
    if (!_1511)
    {
        _1541 = 1.0;
    }
    float _1549 = _1541;
    bool _1551 = !_1511;
    float _1553 = _1549;
    if (!_1551)
    {
        bool _1555 = _1481 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1557 = isnan(_1481);
        bool _1559 = _1555 || _1557;
        bool _1561 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1563 = _1559 || _1561;
        if (!_1563)
        {
            float _1565 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1567 = _1481 + _1565;
            float _1569 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1571 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1569;
            float _1573 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1575 = _1573 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1577 = 1.0 / _1571;
            float _1579 = _1567 * _1577;
            float _1581 = fma(_1579, _1575, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1553 = _1581;
            _1543 = _1575;
            _1583 = true;
        }
        else
        {
            bool _1585 = _1481 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1587 = isnan(_1481);
            bool _1589 = _1585 || _1587;
            bool _1591 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1593 = _1589 || _1591;
            if (!_1593)
            {
                float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1597 = _1481 + _1595;
                float _1599 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1601 = _1599 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1603 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1605 = _1603 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1607 = 1.0 / _1601;
                float _1609 = _1597 * _1607;
                float _1611 = fma(_1609, _1605, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1553 = _1611;
                _1543 = _1605;
                _1583 = true;
            }
            else
            {
                _1553 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1583 = false;
    float _1613 = _1553;
    float _1615 = _1543;
    float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1619 = _1439 + _1617;
    float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1623 = _1441 + _1621;
    bool _1625 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1629 = _1625 || _1627;
    bool _1631 = isnan(0.5);
    bool _1633 = _1629 || _1631;
    float _1635 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1637 = _1433 + _1635;
    float _1639 = fma(_1619, _1613, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1641 = fma(_1623, _1613, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1643 = fma(_1637, _1613, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1645 = _1637;
    float _1647 = _1615;
    float _1649 = _1613;
    if (_1633)
    {
        _1645 = _1639;
    }
    float _1651 = _1645;
    float _1653 = _1651;
    if (_1633)
    {
        _1647 = _1643;
    }
    float _1655 = _1647;
    float _1657 = _1655;
    if (_1633)
    {
        _1649 = _1641;
    }
    float _1659 = _1649;
    float _1661 = _1659;
    if (!_1633)
    {
        float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1665 = _851 + _1663;
        float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1669 = _1307 + _1667;
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1673 = -_1309;
        float _1675 = _1673 + _1641;
        float _1677 = _1665 * _1665;
        float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1681 = _1309 + _1679;
        float _1683 = fma(_1669, _1669, _1677);
        float _1685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1687 = fma(_1681, _1681, _1683);
        float _1689 = sqrt(_1687);
        float _1691 = _1671 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1693 = precise::min(_1689, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1695 = _1693 * _1685;
        float _1697 = -_1307;
        float _1699 = _1697 + _1639;
        float _1701 = _1691 * _1695;
        float _1703 = -_851;
        float _1705 = _1703 + _1643;
        float _1707 = fma(_1699, _1701, _1307);
        float _1709 = fma(_1705, _1701, _851);
        float _1711 = fma(_1675, _1701, _1309);
        _1657 = _1709;
        _1653 = _1707;
        _1661 = _1711;
    }
    float _1713 = _1657;
    float _1715 = _1653;
    float _1717 = _1661;
    float _1719 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1721 = _1713 + _1719;
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1725 = _1715 + _1723;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1729 = _1717 + _1727;
    float _1731 = _1721 * _1721;
    float _1733 = fma(_1725, _1725, _1731);
    float _1735 = fma(_1729, _1729, _1733);
    float _1737 = rsqrt(_1735);
    float _1739 = _1725 * _1737;
    float _1741 = _1729 * _1737;
    float _1743 = _1721 * _1737;
    float _1745 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1747 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1749 = _1745 * _1745;
    float _1751 = _1747 * _1747;
    float _1753 = _1749 + _1751;
    float _1755 = sqrt(_1753);
    bool _1757 = _1755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1761 = _1755 + _1759;
    float _1763 = _1495;
    float _1765 = _1761;
    float _1767 = _1745;
    if (_1757)
    {
        float _1769 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1763 = _1769;
    }
    float _1771 = _1763;
    if (_1757)
    {
        float _1773 = rsqrt(_1753);
        _1545 = _1773;
    }
    float _1775 = _1545;
    float _1777 = _1775;
    if (_1757)
    {
        float _1779 = _1761 * _1771;
        _1765 = _1779;
    }
    float _1781 = _1765;
    if (_1757)
    {
        float _1783 = _1781 * 0.15915493667125701904296875;
        _1547 = _1783;
    }
    float _1785 = _1547;
    float _1787 = _1643;
    if (_1757)
    {
        float _1789 = _1785 * 6.283185482025146484375;
        float _1791 = sin(_1789);
        _1787 = _1791;
    }
    float _1793 = _1787;
    float _1795 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1797 = precise::max(0.0, _1795);
    float _1799 = _1771;
    float _1801 = _1797;
    float _1803 = _1795;
    if (_1757)
    {
        float _1805 = _1785 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        _1799 = _1807;
    }
    float _1809 = _1799;
    float _1811 = -_1743;
    float _1813 = -_1797;
    float _1815 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1813);
    if (_1757)
    {
        float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1801 = _1817;
    }
    float _1819 = _1801;
    float _1821 = sqrt(_1735);
    float _1823 = _1819;
    float _1825 = _1793;
    if (_1757)
    {
        float _1827 = fma(_1793, _1819, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1823 = _1827;
    }
    float _1829 = _1823;
    float _1831 = _1829;
    if (!_1757)
    {
        _1825 = _1749;
    }
    float _1833 = _1825;
    float _1835 = _1833;
    float _1837 = _1809;
    if (_1757)
    {
        float _1839 = _1809 + (-1.0);
        _1803 = _1839;
    }
    float _1841 = _1803;
    float _1843 = _1841;
    if (_1757)
    {
        float _1845 = _1775 * _1829;
        _1377 = _1845;
    }
    float _1847 = _1377;
    if (!_1757)
    {
        _1831 = _1815;
    }
    float _1849 = _1831;
    float _1851 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1853 = _1849;
    if (_1757)
    {
        float _1855 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1777 = _1855;
    }
    float _1857 = _1777;
    if (_1757)
    {
        float _1859 = _1745 * _1847;
        _1767 = _1859;
    }
    float _1861 = _1767;
    if (!_1757)
    {
        _1843 = _1747;
    }
    float _1863 = _1843;
    float _1865 = _1863;
    if (_1757)
    {
        float _1867 = _1747 * _1847;
        _1865 = _1867;
    }
    float _1869 = _1865;
    if (_1757)
    {
        float _1871 = fma(_1815, _1809, _1857);
        _1853 = _1871;
    }
    float _1873 = _1853;
    if (_1757)
    {
        float _1875 = _1861 * _1861;
        _1835 = _1875;
    }
    float _1877 = _1835;
    if (!_1757)
    {
        _1837 = _1751;
    }
    float _1879 = _1837;
    float _1881 = _1879;
    if (_1757)
    {
        float _1883 = _1869 * _1869;
        _1881 = _1883;
    }
    float _1885 = _1881;
    float _1887 = fma(_1873, _1873, _1877);
    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1891 = _1887 + _1885;
    float _1893 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1897 = fma(_1821, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1895);
    float _1899 = precise::clamp(_1897, 0.0, 1.0);
    float _1901 = rsqrt(_1891);
    float _1903 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1893);
    float _1905 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1907 = -_1899;
    float _1909 = _1907 + 1.0;
    float _1911 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1913 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1903);
    float _1915 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1905);
    float _1917 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1911);
    float _1919 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1921 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1915);
    float _1923 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1851);
    float _1925 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1917);
    float _1927 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1929 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1931 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1923);
    float _1933 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1935 = _1901 * _1861;
    float _1937 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1939 = abs(_1909);
    float _1941 = log2(_1939);
    float _1943 = -_1927;
    float _1945 = fma(_1943, _1889, 1.0);
    float _1947 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1949 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1937);
    float _1951 = _1901 * _1873;
    float _1953 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1955 = _1901 * _1869;
    float _1957 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1949);
    float _1959 = log2(_1945);
    float _1961 = -_1953;
    float _1963 = fma(_1951, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1961);
    float _1965 = _1951 + 1.0;
    float _1967 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1957);
    float _1969 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1971 = -_1955;
    float _1973 = fma(_1971, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1963);
    float _1975 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1977 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1979 = fma(_1973, -0.5, 0.5);
    float _1981 = 1.0 / _1967;
    float _1983 = fma(_1973, 0.5, 0.5);
    float _1985 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1969);
    float _1987 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1975);
    float _1989 = fma(_1983, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1991 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1985);
    float _1993 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1987);
    float _1995 = exp2(_1977);
    float _1997 = fma(_1983, _1989, -0.212114393711090087890625);
    float _1999 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1991);
    float _2001 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1993);
    float _2003 = _1959 * 0.693147182464599609375;
    float _2005 = fma(_1983, _1997, 1.570728778839111328125);
    float _2007 = sqrt(_1979);
    float _2009 = _1999 * _1981;
    float _2011 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2013 = fma(_2009, 0.5, 0.5);
    float _2015 = -_1951;
    float _2017 = fma(_1995, _1965, _2015);
    float _2019 = _2001 * _1981;
    float _2021 = fma(_2017, 0.5, 0.5);
    float _2023 = fma(_2019, -0.5, 0.5);
    float _2025 = _2007 * 0.636619746685028076171875;
    float _2027 = -_2005;
    float _2029 = fma(_2025, _2027, 1.0);
    float3 _5320 = float3(_2013, _2023, _2011);
    float _2031 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5320, float3(0.0), isnan(_5320)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5320, float3(0.0), isnan(_5320)), level(0.0)).x;
    float3 _5331 = float3(_2013, _2023, _2011);
    float4 _2034 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5331, float3(0.0), isnan(_5331)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5331, float3(0.0), isnan(_5331)), level(0.0)).xyzw;
    float _2036 = _2034.x;
    float _2038 = _2034.y;
    float _2040 = _2034.z;
    float _2042 = _2034.w;
    float2 _5348 = float2(_2029, _2021);
    float3 _2046 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5348, float2(0.0), isnan(_5348)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5348, float2(0.0), isnan(_5348)), level(0.0)).xyz;
    float _2048 = _2046.x;
    float _2050 = _2046.y;
    float _2052 = _2046.z;
    float _2054 = _851 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2056 = _1537 * _1743;
    float _2058 = _851 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2060 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2054);
    float _2062 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2064 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2064;
    float _2068 = fma(_1535, _1739, _2056);
    float _2070 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2060);
    float _2072 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2058);
    float _2074 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2076 = fma(_1539, _1741, _2068);
    float _2078 = 1.0 / _2066;
    float _2080 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2082 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2072);
    float _2084 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2074);
    float _2086 = abs(_2076);
    float _2088 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2090 = _2086 + _2088;
    bool _2092 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2094 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2096 = _2092 || _2094;
    bool _2098 = isnan(0.5);
    bool _2100 = _2096 || _2098;
    float _2102 = _2082 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2104 = 1.0 / _2080;
    float _2106 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2084);
    float _2108 = _2102 + _2080;
    float _2110 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2106);
    float _2112 = exp2(_2062);
    float _2114 = _2090 * _2078;
    float _2116 = precise::clamp(_2114, 0.0, 1.0);
    float _2118 = fma(_2116, -2.0, 3.0);
    float _2120 = _2116 * _2116;
    float _2122 = 2.0;
    if (_2100)
    {
        _2122 = 1.0;
    }
    float _2124 = _2122;
    float _2126 = _2108 * _2104;
    float _2128 = _2126 * 0.5;
    float _2130 = _2124;
    if (!_2100)
    {
        float _2132 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2134 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2136 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2134);
        float _2138 = _2132 * 0.15915493667125701904296875;
        float _2140 = _2138 * 6.283185482025146484375;
        float _2142 = cos(_2140);
        float _2144 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2146 = _2144 * 0.15915493667125701904296875;
        float _2148 = _2138 * 6.283185482025146484375;
        float _2150 = sin(_2148);
        float _2152 = 1.0 / _2142;
        float _2154 = _2146 * 6.283185482025146484375;
        float _2156 = cos(_2154);
        float _2158 = _2150 * _2152;
        float _2160 = 1.0 / _2136;
        float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2164 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2162;
        float _2166 = _2156 * _2158;
        float _2168 = _2146 * 6.283185482025146484375;
        float _2170 = sin(_2168);
        float _2172 = 1.0 / _2166;
        float _2174 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2176 = _2160 * _2174;
        float _2178 = 1.0 / _2164;
        float _2180 = _2170 * _2172;
        float _2182 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2184 = fma(_2180, _2176, _2182);
        float _2186 = _2184 * _2178;
        float _2188 = precise::clamp(_2186, 0.0, 1.0);
        _2130 = _2188;
    }
    float _2190 = _2130;
    float _2192 = _2120 * _2118;
    float _2194 = -_2112;
    float _2196 = _2194 + 1.0;
    bool _2198 = _2190 > 0.0;
    bool _2200 = isnan(_2190);
    bool _2202 = _2198 || _2200;
    bool _2204 = isnan(0.0);
    bool _2206 = _2202 || _2204;
    float _2208 = _2110 + _1967;
    float _2210 = _2192 * _2190;
    float _2212 = _1999 + _1967;
    float _2214 = _1967 * 0.5;
    out.gl_Position.x = _1999;
    out.gl_Position.y = _2001;
    out.gl_Position.z = _2110;
    out.gl_Position.w = _1967;
    float _2216 = _2210 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2218 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2220 = _2208 * 0.5;
    float _2222 = _2212 * 0.5;
    float _2224 = _2218 * _2031;
    float _2226 = -_2218;
    float _2228 = _2226 + 1.0;
    float _2230 = fma(_2001, -0.5, _2214);
    float _2232 = _2216 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2234 = _2042 * _2224;
    float _2236 = _2052 * _2224;
    float _2238 = _2042 * _2228;
    out.m_72.x = _2222;
    out.m_72.y = _2230;
    out.m_72.z = _2220;
    out.m_72.w = _1967;
    float _2240 = fma(_2048, _2234, _2036);
    float _2242 = fma(_2050, _2234, _2038);
    float _2244 = fma(_2042, _2236, _2040);
    out.m_47.x = _2232;
    out.m_74.x = _2240;
    out.m_74.y = _2242;
    out.m_74.z = _2244;
    out.m_74.w = _2238;
    if (_2206)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _2246 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2246;
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
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1583 = false;
    bool _671 = false;
    bool _509 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _88 = in.m_44.w;
    float _90 = trunc(_88);
    int _93 = int(_90);
    bool _97 = _93 >= 1;
    float _99 = 0.0;
    if (!_97)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _101 = _99;
    float _103 = _101;
    if (!_97)
    {
        out.m_47.x = 0.0;
    }
    int _105 = 0;
    if (!_97)
    {
        float _107 = _101 * 5.0;
        _105 = as_type<int>(_107);
    }
    int _109 = _105;
    int _111 = _109;
    if (!_97)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2303 = as_type<float>(_109);
        out.gl_Position.z = _2303;
    }
    if (!_97)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _113 = in.m_49.w;
    bool _115 = _113 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _117 = isnan(_113);
    bool _119 = _115 || _117;
    bool _121 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _123 = _119 || _121;
    float _125 = -_113;
    float _127 = _125 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _129 = 0.0;
    float _131 = 0.0;
    float _133 = _127;
    if (_123)
    {
        float _135 = float(_93);
        _129 = _135;
    }
    float _137 = _129;
    bool _139 = _127 >= _137;
    bool _141 = !_123;
    bool _143 = _139 || _141;
    if (_143)
    {
        _103 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _103;
    if (_143)
    {
        out.m_47.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _111 = as_type<int>(_147);
    }
    int _149 = _111;
    float _151 = as_type<float>(_149);
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2374 = as_type<float>(_149);
        out.gl_Position.z = _2374;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _153 = in.m_49.x;
    float _155 = in.m_49.y;
    float _157 = in.m_49.z;
    float _159 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = _159;
    if (!_169)
    {
        float _173 = _159 * _159;
        float _175 = _173 * 0.5;
        _151 = _175;
    }
    float _177 = _151;
    float _179 = 0.0;
    float _181 = _177;
    if (!_169)
    {
        float _183 = _127 * _127;
        float _185 = _183 * 0.5;
        _179 = _185;
    }
    float _187 = _179;
    if (!_169)
    {
        float _189 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _189;
    }
    float _191 = _181;
    bool _193 = !_169;
    float _195 = _191;
    float _197 = 0.0;
    if (!_193)
    {
        float _199 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _201 = log2(_199);
        float _203 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _205 = _203 + 1.0;
        float _207 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = _159 * _201;
        float _211 = 1.0 / _205;
        float _213 = _207 * 0.693147182464599609375;
        float _215 = exp2(_209);
        float _217 = 1.0 / _213;
        float _219 = _215 + (-1.0);
        float _221 = -_219;
        float _223 = fma(_221, _217, _159);
        float _225 = _223 * _211;
        float _227 = _225 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _131 = _215;
        _195 = _227;
        _197 = _217;
    }
    float _229 = _131;
    float _231 = _195;
    float _233 = _197;
    bool _235 = !_169;
    float _237 = _229;
    float _239 = _233;
    if (!_235)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _159 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _237 = _253;
        _239 = _247;
        _171 = _259;
    }
    float _261 = _237;
    float _263 = _239;
    float _265 = _171;
    float _267 = _263;
    float _269 = _261;
    if (!_169)
    {
        _267 = _127;
    }
    float _271 = _267;
    float _273 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _275 = _271;
    if (!_169)
    {
        float _277 = _187 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _269 = _277;
    }
    float _279 = _269;
    bool _281 = !_169;
    float _283 = _279;
    if (!_281)
    {
        float _285 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _287 = log2(_285);
        float _289 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _291 = _289 + 1.0;
        float _293 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _295 = _127 * _287;
        float _297 = exp2(_295);
        float _299 = _293 * 0.693147182464599609375;
        float _301 = 1.0 / _299;
        float _303 = 1.0 / _291;
        float _305 = _297 + (-1.0);
        float _307 = -_305;
        float _309 = fma(_307, _301, _127);
        float _311 = _309 * _303;
        float _313 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _283 = _313;
    }
    float _315 = _283;
    bool _317 = !_169;
    if (!_317)
    {
        float _319 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _321 = log2(_319);
        float _323 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _325 = _323 + 1.0;
        float _327 = 1.0 / _325;
        float _329 = _127 * _321;
        float _331 = exp2(_329);
        float _333 = -_331;
        float _335 = _333 + 1.0;
        float _337 = _335 * _327;
        _275 = _337;
    }
    float _339 = _275;
    float _341 = fma(_265, _153, _273);
    float _343 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _345 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _347 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _349 = _315 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _351 = fma(_265, _155, _343);
    float _353 = fma(_339, _155, _345);
    float _355 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _357 = fma(_339, _153, _347);
    float _359 = fma(_339, _157, _349);
    float _361 = -_353;
    float _363 = _351 + _361;
    float _365 = fma(_265, _157, _355);
    float _367 = -_357;
    float _369 = _341 + _367;
    float _371 = in.m_51.y;
    float _373 = _363 * _363;
    float _375 = -_359;
    float _377 = _365 + _375;
    float _379 = in.m_53.y;
    float _381 = fma(_369, _369, _373);
    float _383 = in.m_55.y;
    float _385 = fma(_377, _377, _381);
    float _387 = in.m_51.x;
    float _389 = sqrt(_385);
    float _391 = in.m_53.x;
    float _393 = in.m_55.x;
    float _395 = in.m_51.z;
    float _397 = _363 * _371;
    float _399 = in.m_53.z;
    float _401 = _363 * _379;
    bool _403 = _389 >= 9.9999999747524270787835121154785e-07;
    bool _405 = isnan(_389);
    bool _407 = _403 || _405;
    bool _409 = isnan(9.9999999747524270787835121154785e-07);
    bool _411 = _407 || _409;
    float _413 = in.m_55.z;
    float _415 = _363 * _383;
    float _417 = _371 * _371;
    float _419 = in.m_57.w;
    float _421 = fma(_369, _387, _397);
    float _423 = in.m_44.x;
    float _425 = in.m_44.y;
    float _427 = in.m_44.z;
    float _429 = fma(_369, _391, _401);
    float _431 = fma(_369, _393, _415);
    float _433 = fma(_377, _395, _421);
    float _435 = fma(_377, _399, _429);
    float _437 = fma(_379, _379, _417);
    float _439 = fma(_377, _413, _431);
    float _441 = _431;
    float _443 = _421;
    float _445 = _433;
    if (_411)
    {
        _441 = _433;
    }
    float _447 = _441;
    float _449 = fma(_383, _383, _437);
    float _451 = _447;
    float _453 = _447;
    if (_411)
    {
        _443 = _435;
    }
    float _455 = _443;
    float _457 = _455;
    float _459 = _455;
    if (_411)
    {
        _445 = _439;
    }
    float _461 = _445;
    float _463 = fma(_341, _419, _423);
    float _465 = fma(_351, _419, _425);
    float _467 = fma(_365, _419, _427);
    float _469 = _461;
    if (!_411)
    {
        bool _471 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _473 = !_471;
        if (!_473)
        {
            float _475 = _371 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _477 = _379 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _479 = _383 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _481 = fma(_387, (*spvDescriptorSet0.vp_c9)._m0[16].x, _475);
            float _483 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[16].x, _477);
            float _485 = fma(_393, (*spvDescriptorSet0.vp_c9)._m0[16].x, _479);
            float _487 = fma(_395, (*spvDescriptorSet0.vp_c9)._m0[16].z, _481);
            float _489 = fma(_399, (*spvDescriptorSet0.vp_c9)._m0[16].z, _483);
            float _491 = fma(_413, (*spvDescriptorSet0.vp_c9)._m0[16].z, _485);
            float _493 = _487 * _487;
            float _495 = fma(_489, _489, _493);
            float _497 = fma(_491, _491, _495);
            float _499 = rsqrt(_497);
            float _501 = _499 * 9.9999999747524270787835121154785e-07;
            float _503 = _489 * _501;
            float _505 = _487 * _501;
            float _507 = _491 * _501;
            _453 = _505;
            _459 = _503;
            _469 = _507;
            _509 = true;
        }
        else
        {
            float _511 = _155 * _155;
            float _513 = fma(_153, _153, _511);
            float _515 = fma(_157, _157, _513);
            float _517 = sqrt(_515);
            bool _519 = _517 >= 9.9999999747524270787835121154785e-07;
            bool _521 = isnan(_517);
            bool _523 = _519 || _521;
            bool _525 = isnan(9.9999999747524270787835121154785e-07);
            bool _527 = _523 || _525;
            float _529 = _517;
            if (!_527)
            {
                float _531 = _425 * _425;
                float _533 = fma(_423, _423, _531);
                float _535 = fma(_427, _427, _533);
                float _537 = sqrt(_535);
                bool _539 = _537 >= 9.9999999747524270787835121154785e-07;
                bool _541 = isnan(_537);
                bool _543 = _539 || _541;
                bool _545 = isnan(9.9999999747524270787835121154785e-07);
                bool _547 = _543 || _545;
                float _549 = _449;
                if (!_547)
                {
                    float _551 = rsqrt(_449);
                    _549 = _551;
                }
                float _553 = _549;
                if (!_547)
                {
                    float _555 = _553 * 9.9999999747524270787835121154785e-07;
                    _529 = _555;
                }
                float _557 = _529;
                float _559 = _557;
                if (!_547)
                {
                    float _561 = _379 * _557;
                    _457 = _561;
                }
                float _563 = _457;
                _459 = _563;
                if (!_547)
                {
                    float _565 = _371 * _557;
                    _451 = _565;
                }
                float _567 = _451;
                _453 = _567;
                if (!_547)
                {
                    float _569 = _383 * _557;
                    _559 = _569;
                }
                float _571 = _559;
                bool _573 = !_547;
                _469 = _571;
                _509 = _573;
                if (!_509)
                {
                    float _575 = _371 * _425;
                    float _577 = _379 * _425;
                    float _579 = _383 * _425;
                    float _581 = fma(_423, _387, _575);
                    float _583 = fma(_423, _391, _577);
                    float _585 = fma(_423, _393, _579);
                    float _587 = fma(_427, _395, _581);
                    float _589 = fma(_427, _399, _583);
                    float _591 = fma(_427, _413, _585);
                    float _593 = _587 * _587;
                    float _595 = fma(_589, _589, _593);
                    float _597 = fma(_591, _591, _595);
                    float _599 = rsqrt(_597);
                    float _601 = _599 * 9.9999999747524270787835121154785e-07;
                    float _603 = _589 * _601;
                    float _605 = _587 * _601;
                    float _607 = _591 * _601;
                    _453 = _605;
                    _459 = _603;
                    _469 = _607;
                    _509 = true;
                }
            }
            else
            {
                float _609 = _371 * _155;
                float _611 = _379 * _155;
                float _613 = _383 * _155;
                float _615 = fma(_153, _387, _609);
                float _617 = fma(_153, _391, _611);
                float _619 = fma(_153, _393, _613);
                float _621 = fma(_157, _395, _615);
                float _623 = fma(_157, _399, _617);
                float _625 = fma(_157, _413, _619);
                float _627 = _621 * _621;
                float _629 = fma(_623, _623, _627);
                float _631 = fma(_625, _625, _629);
                float _633 = rsqrt(_631);
                float _635 = _633 * 9.9999999747524270787835121154785e-07;
                float _637 = _623 * _635;
                float _639 = _621 * _635;
                float _641 = _625 * _635;
                _453 = _639;
                _459 = _637;
                _469 = _641;
            }
        }
    }
    _509 = false;
    float _643 = _453;
    float _645 = _459;
    float _647 = _469;
    bool _649 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    bool _651 = !_649;
    float _669;
    if (!_651)
    {
        float _653 = in.m_59.x;
        float _655 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _657 = _653 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _659 = fma(_657, (*spvDescriptorSet0.vp_c9)._m0[12].x, _127);
        float _661 = _659 * _655;
        float _663 = floor(_661);
        float _665 = -_663;
        float _667 = _661 + _665;
        _669 = _667;
        _671 = true;
    }
    else
    {
        float _673 = float(_93);
        float _675 = 1.0 / _673;
        float _677 = _127 * _675;
        _669 = _677;
    }
    _671 = false;
    float _679 = _669;
    float _681 = in.m_59.z;
    float _683 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _685 = log2(_683);
    float _687 = as_type<float>(int(gl_VertexIndex));
    float _689 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _689;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _697 = in.m_59.x;
    float _699 = in.m_59.y;
    float _701 = _465 * _383;
    float _703 = 1.0 / _691;
    float _705 = _465 * _379;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _709 = _679 + _707;
    float _711 = fma(_463, _391, _705);
    float _713 = _465 * _371;
    float _715 = 1.0 / _695;
    float _717 = _685 * _127;
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _719;
    float _723 = _681 * 2.0;
    float _725 = exp2(_717);
    float _727 = _709 * _703;
    int _729 = as_type<int>(_687) & 1;
    bool _731 = _729 != 0;
    int _733 = as_type<int>(_687) & 2;
    bool _735 = _733 != 0;
    float _737 = fma(_463, _393, _701);
    float _739 = fma(_721, _727, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _741 = _699 + _681;
    int _743 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _745 = _743 != 0;
    int _747 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _749 = _747 != 0;
    int _751 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _753 = _751 != 0;
    float _755 = floor(_723);
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _759 = _679 + _757;
    float _761 = _741 + (-1.0);
    float _763 = _681 + _697;
    float _765 = _759 * _715;
    float _767 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _769 = _699 + _697;
    float _771 = _643 * _643;
    float _773 = _763 + (-1.0);
    float _775 = -_725;
    float _777 = _775 + 1.0;
    float _779 = _769 + (-1.0);
    float _781 = fma(_645, _645, _771);
    float _783 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _785 = fma(_779, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _787 = _755 > 0.0;
    float _789 = _699 * 2.0;
    bool _791 = _755 >= 0.0;
    bool _793 = isnan(_755);
    bool _795 = _791 || _793;
    bool _797 = isnan(0.0);
    bool _799 = _795 || _797;
    float _801 = _697 * 2.0;
    float _803 = fma(_647, _647, _781);
    float _805 = floor(_789);
    int _807 = _799 ? 0 : 1;
    float _809 = fma(_463, _387, _713);
    bool _811 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _813 = isnan(0.0);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _819 = _815 || _817;
    int _821 = ~_807;
    int _823 = _821 + 1;
    int _825 = _823 + 1;
    float _827 = fma(_467, _395, _809);
    float _829 = _819 ? _777 : 0.0;
    float _831 = floor(_801);
    int _833 = _825;
    float _835 = _713;
    if (!_787)
    {
        int _837 = ~_807;
        int _839 = _837 + 1;
        _833 = _839;
    }
    int _841 = _833;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _843;
    bool _847 = !_745;
    int _849 = _847 ? 0 : 1;
    float _851 = _827 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _853 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _855 = isnan(1.0);
    bool _857 = _853 || _855;
    bool _859 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _861 = _857 || _859;
    float _863 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _865 = 1.0 + _863;
    int _867 = abs(_849);
    float _869 = rsqrt(_803);
    bool _871 = !_749;
    int _873 = _871 ? 0 : 1;
    float _875 = fma(_845, _727, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _877 = _805 >= 0.0;
    bool _879 = isnan(_805);
    bool _881 = _877 || _879;
    bool _883 = isnan(0.0);
    bool _885 = _881 || _883;
    bool _887 = _831 > 0.0;
    float _889 = 1.0 / _865;
    bool _891 = _831 >= 0.0;
    bool _893 = isnan(_831);
    bool _895 = _891 || _893;
    bool _897 = isnan(0.0);
    bool _899 = _895 || _897;
    float _901 = in.m_64.x;
    float _903 = in.m_64.y;
    float _905 = in.m_64.z;
    int _907 = _899 ? 0 : 1;
    bool _909 = _805 > 0.0;
    float _911 = _869 * _645;
    float _913 = float(_867);
    float _915 = _869 * _647;
    float _917 = float(_841);
    float _919 = _869 * _643;
    int _921 = abs(_873);
    int _923 = ~_907;
    int _925 = _923 + 1;
    int _927 = _925 + 1;
    float _929 = _913 * _917;
    int _931 = _927;
    if (_861)
    {
        float _933 = _829 * _889;
        _133 = _933;
    }
    float _935 = _133;
    float _937 = _697 + (-0.5);
    if (!_887)
    {
        int _939 = ~_907;
        int _941 = _939 + 1;
        _931 = _941;
    }
    int _943 = _931;
    float _945 = _929 * (-2.0);
    float _947 = float(_921);
    float _949 = float(_943);
    float _951 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _953 = _919 * _951;
    int _955 = _885 ? 0 : 1;
    float _957 = fma(_945, _901, _901);
    float _959 = fma(_785, _945, _785);
    float _961 = _947 * _949;
    float _963 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _965 = _911 * _963;
    float _967 = fma(_937, (*spvDescriptorSet0.vp_c9)._m0[196].x, _957);
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _971 = _915 * _969;
    float _973 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _975 = -_953;
    float _977 = fma(_915, _973, _975);
    bool _979 = !_753;
    int _981 = _979 ? 0 : 1;
    float _983 = fma(_959, _935, _967);
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _987 = -_971;
    float _989 = fma(_911, _985, _987);
    int _991 = ~_955;
    int _993 = _991 + 1;
    int _995 = _993 + 1;
    float _997 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _999 = -_965;
    float _1001 = fma(_919, _997, _999);
    int _1003 = _995;
    if (!_909)
    {
        int _1005 = ~_955;
        int _1007 = _1005 + 1;
        _1003 = _1007;
    }
    int _1009 = _1003;
    float _1011 = _989 * _989;
    bool _1013 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _1015 = isnan(_679);
    bool _1017 = _1013 || _1015;
    bool _1019 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _1021 = _1017 || _1019;
    float _1023 = float(_1021);
    float _1025 = _983 * 0.15915493667125701904296875;
    int _1027 = abs(_981);
    float _1029 = fma(_977, _977, _1011);
    bool _1031 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _1033 = isnan(_679);
    bool _1035 = _1031 || _1033;
    bool _1037 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _1039 = _1035 || _1037;
    float _1041 = float(_1039);
    float _1043 = -_1023;
    float _1045 = _1043 + 1.0;
    float _1047 = float(_1027);
    float _1049 = fma(_1001, _1001, _1029);
    float _1051 = float(_1009);
    float _1053 = _961 * (-2.0);
    bool _1055 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _1057 = isnan(_679);
    bool _1059 = _1055 || _1057;
    bool _1061 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _1063 = _1059 || _1061;
    float _1065 = float(_1063);
    float _1067 = _1041 * _1045;
    float _1069 = _699 + (-0.5);
    float _1071 = fma(_1053, _903, _903);
    float _1073 = -_1041;
    float _1075 = _1073 + 1.0;
    float _1077 = _1047 * _1051;
    float _1079 = fma(_767, _1053, _767);
    float _1081 = fma(_1069, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1071);
    float _1083 = _1065 * _1075;
    float _1085 = _1077 * (-2.0);
    float _1087 = -_1065;
    float _1089 = _1087 + 1.0;
    float _1091 = fma(_1079, _935, _1081);
    float _1093 = _875 * _1083;
    float _1095 = _739 * _1083;
    float _1097 = fma(_783, _1085, _783);
    float _1099 = fma(_1085, _905, _905);
    float _1101 = _1091 * 0.15915493667125701904296875;
    float _1103 = in.m_57.x;
    float _1105 = in.m_57.y;
    float _1107 = _681 + (-0.5);
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _1115 = _1113 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _1117 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[143].x, _1095);
    float _1119 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1099);
    float _1121 = fma(_1111, _765, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _1123 = fma(_1115, _765, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _1125 = fma(_1089, (*spvDescriptorSet0.vp_c9)._m0[143].y, _1093);
    float _1127 = fma(_1097, _935, _1119);
    float _1129 = fma(_1121, _1067, _1117);
    float _1131 = rsqrt(_1049);
    float _1133 = fma(_1123, _1067, _1125);
    float _1135 = _1127 * 0.15915493667125701904296875;
    float _1137 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[145].x, _1129);
    float _1139 = fma(_1023, (*spvDescriptorSet0.vp_c9)._m0[145].y, _1133);
    float _1141 = fma(_467, _399, _711);
    float _1143 = fma(_467, _413, _737);
    float _1145 = _1025 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    bool _1149 = !_735;
    float _1151 = _1149 ? (-0.5) : 0.5;
    bool _1153 = !_731;
    float _1155 = _1153 ? (-0.5) : 0.5;
    float _1157 = _1137 * _1103;
    float _1159 = _1139 * _1105;
    float _1161 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1151);
    float _1163 = _1025 * 6.283185482025146484375;
    float _1165 = cos(_1163);
    float _1167 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1155);
    float _1169 = _1159 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1171 = _1157 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1173 = _1001 * _1131;
    float _1175 = _989 * _1131;
    float _1177 = _1169 * _1161;
    float _1179 = _1171 * _1167;
    float _1181 = _1101 * 6.283185482025146484375;
    float _1183 = sin(_1181);
    float _1185 = _977 * _1131;
    float _1187 = _911 * _1175;
    bool _1189 = _697 > 0.5;
    float _1191 = _915 * _1185;
    float _1193 = -_1187;
    float _1195 = fma(_919, _1185, _1193);
    int _1197 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1199 = _1197 != 0;
    float _1201 = _1101 * 6.283185482025146484375;
    float _1203 = cos(_1201);
    float _1205 = -_1155;
    int _1207 = _1189 ? as_type<int>(_1205) : as_type<int>(_1155);
    bool _1209 = !_1199;
    float _1211 = _1209 ? _1155 : as_type<float>(_1207);
    float _1213 = _1135 * 6.283185482025146484375;
    float _1215 = cos(_1213);
    float _1217 = _1165 * _1183;
    float _1219 = _1147 * _1183;
    float _1221 = _1135 * 6.283185482025146484375;
    float _1223 = sin(_1221);
    float _1225 = _1147 * _1203;
    float _1227 = _1165 * _1203;
    float _1229 = _1165 * _1215;
    float _1231 = _1203 * _1215;
    float _1233 = _1147 * _1215;
    float _1235 = _1183 * _1215;
    float _1237 = _1229 * _915;
    float _1239 = _1229 * _919;
    float _1241 = -_1217;
    float _1243 = fma(_1223, _1225, _1241);
    float _1245 = fma(_1223, _1227, _1219);
    float _1247 = -_1225;
    float _1249 = fma(_1223, _1217, _1247);
    float _1251 = fma(_1223, _1219, _1227);
    float _1253 = _1229 * _911;
    float _1255 = _919 * _1173;
    float _1257 = _1249 * _911;
    float _1259 = -_1223;
    float _1261 = fma(_1259, _1173, _1237);
    float _1263 = -_1223;
    float _1265 = fma(_1263, _1185, _1253);
    float _1267 = -_1255;
    float _1269 = fma(_915, _1175, _1267);
    float _1271 = _1245 * _911;
    float _1273 = _1245 * _915;
    float _1275 = fma(_1235, _1185, _1257);
    float _1277 = fma(_1233, _1269, _1265);
    float _1279 = fma(_1231, _1185, _1271);
    float _1281 = _1249 * _915;
    float _1283 = fma(_1231, _1173, _1273);
    float _1285 = fma(_1233, _1195, _1261);
    float _1287 = fma(_1251, _1269, _1275);
    float _1289 = fma(_1243, _1269, _1279);
    float _1291 = _1177 * _1277;
    float _1293 = fma(_1235, _1173, _1281);
    float _1295 = fma(_1243, _1195, _1283);
    float _1297 = _1177 * _1285;
    float _1299 = fma(_1179, _1289, _1291);
    float _1301 = fma(_1251, _1195, _1293);
    float _1303 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1305 = fma(_1179, _1295, _1297);
    float _1307 = _1141 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1309 = _1143 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1311 = fma(_1303, _1287, _1299);
    float _1313 = fma(_1303, _1301, _1305);
    float _1315 = -_1191;
    float _1317 = fma(_911, _1173, _1315);
    float _1319 = _1245 * _919;
    float _1321 = _1307 + _1311;
    float _1323 = _1309 + _1313;
    float _1325 = -_1223;
    float _1327 = fma(_1325, _1175, _1239);
    float _1329 = _1249 * _919;
    float _1331 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1333 = _1321 + _1331;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1337 = _1323 + _1335;
    float _1339 = fma(_1231, _1175, _1319);
    float _1341 = fma(_1233, _1317, _1327);
    float _1343 = _1333 * _1333;
    float _1345 = _1337 * _1337;
    float _1347 = fma(_1235, _1175, _1329);
    float _1349 = fma(_1243, _1317, _1339);
    float _1351 = _1177 * _1341;
    float _1353 = _1343 + _1345;
    float _1355 = fma(_1251, _1317, _1347);
    float _1357 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1359 = fma(_1179, _1349, _1351);
    float _1361 = fma(_1303, _1355, _1359);
    float _1363 = sqrt(_1353);
    float _1365 = _851 + _1361;
    bool _1367 = _1363 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1369 = _1343;
    float _1371 = _1345;
    float _1373 = _1321;
    float _1375 = _1323;
    float _1377 = _1337;
    if (!_1367)
    {
        _835 = _1365;
    }
    float _1379 = _835;
    bool _1381 = !_1367;
    float _1383 = _1379;
    if (!_1381)
    {
        float _1385 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1387 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1389 = _1363 + _1387;
        float _1391 = _1365 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1393 = rsqrt(_1353);
        float _1395 = _1389 * _1385;
        float _1397 = _1395 * 0.15915493667125701904296875;
        float _1399 = _1397 * 6.283185482025146484375;
        float _1401 = sin(_1399);
        float _1403 = _1397 * 6.283185482025146484375;
        float _1405 = cos(_1403);
        float _1407 = fma(_1401, _1391, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1409 = _1393 * _1407;
        float _1411 = _1405 + (-1.0);
        float _1413 = fma(_1333, _1409, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1415 = fma(_1337, _1409, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1417 = _1411 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1421 = _1413 + _1419;
        float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1425 = _1415 + _1423;
        float _1427 = fma(_1365, _1405, _1417);
        float _1429 = _1421 * _1421;
        float _1431 = _1425 * _1425;
        _1383 = _1427;
        _1369 = _1429;
        _1371 = _1431;
        _1373 = _1413;
        _1375 = _1415;
    }
    float _1433 = _1383;
    float _1435 = _1369;
    float _1437 = _1371;
    float _1439 = _1373;
    float _1441 = _1375;
    bool _1443 = _699 > 0.5;
    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1447 = _1433 + _1445;
    float _1449 = _1211 + 0.5;
    int _1451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1453 = _1451 != 0;
    float _1455 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1457 = -_1151;
    int _1459 = _1443 ? as_type<int>(_1457) : as_type<int>(_1151);
    float _1461 = fma(_1447, _1447, _1435);
    float _1463 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1465 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _1467 = !_1453;
    float _1469 = _1467 ? _1151 : as_type<float>(_1459);
    float _1471 = _1461 + _1437;
    float _1473 = _1463 * _1357;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1477 = -_1469;
    float _1479 = _1477 + 0.5;
    float _1481 = sqrt(_1471);
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1485 = _1475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1487 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1489 = _1479 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1491 = _1483 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1493 = _1487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1495 = _1489 * _1455;
    float _1497 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    out.m_66.x = _1485;
    out.m_66.y = _1491;
    out.m_66.z = _1493;
    float _1499 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1501 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    out.m_68.x = _1473;
    out.m_68.y = _1495;
    bool _1503 = _1481 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1505 = isnan(_1481);
    bool _1507 = _1503 || _1505;
    bool _1509 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1511 = _1507 || _1509;
    float _1513 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1515 = _1277 * _1497;
    float _1517 = _1341 * _1497;
    float _1519 = _1285 * _1497;
    float _1521 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1523 = _1499 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1525 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1527 = _1513 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1529 = fma(_1289, _1465, _1515);
    float _1531 = fma(_1349, _1465, _1517);
    float _1533 = fma(_1295, _1465, _1519);
    out.m_70.x = _1523;
    out.m_70.y = _1525;
    out.m_70.z = _1527;
    out.m_70.w = _1521;
    float _1535 = _1287 + _1529;
    float _1537 = _1355 + _1531;
    float _1539 = _1301 + _1533;
    float _1541 = _1523;
    float _1543 = _1521;
    float _1545 = _1531;
    float _1547 = _1517;
    if (!_1511)
    {
        _1541 = 1.0;
    }
    float _1549 = _1541;
    bool _1551 = !_1511;
    float _1553 = _1549;
    if (!_1551)
    {
        bool _1555 = _1481 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1557 = isnan(_1481);
        bool _1559 = _1555 || _1557;
        bool _1561 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1563 = _1559 || _1561;
        if (!_1563)
        {
            float _1565 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1567 = _1481 + _1565;
            float _1569 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1571 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1569;
            float _1573 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1575 = _1573 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1577 = 1.0 / _1571;
            float _1579 = _1567 * _1577;
            float _1581 = fma(_1579, _1575, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1553 = _1581;
            _1543 = _1575;
            _1583 = true;
        }
        else
        {
            bool _1585 = _1481 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1587 = isnan(_1481);
            bool _1589 = _1585 || _1587;
            bool _1591 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1593 = _1589 || _1591;
            if (!_1593)
            {
                float _1595 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1597 = _1481 + _1595;
                float _1599 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1601 = _1599 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1603 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1605 = _1603 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1607 = 1.0 / _1601;
                float _1609 = _1597 * _1607;
                float _1611 = fma(_1609, _1605, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1553 = _1611;
                _1543 = _1605;
                _1583 = true;
            }
            else
            {
                _1553 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1583 = false;
    float _1613 = _1553;
    float _1615 = _1543;
    float _1617 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1619 = _1439 + _1617;
    float _1621 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1623 = _1441 + _1621;
    bool _1625 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1627 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1629 = _1625 || _1627;
    bool _1631 = isnan(0.5);
    bool _1633 = _1629 || _1631;
    float _1635 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1637 = _1433 + _1635;
    float _1639 = fma(_1619, _1613, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1641 = fma(_1623, _1613, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1643 = fma(_1637, _1613, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1645 = _1637;
    float _1647 = _1615;
    float _1649 = _1613;
    if (_1633)
    {
        _1645 = _1639;
    }
    float _1651 = _1645;
    float _1653 = _1651;
    if (_1633)
    {
        _1647 = _1643;
    }
    float _1655 = _1647;
    float _1657 = _1655;
    if (_1633)
    {
        _1649 = _1641;
    }
    float _1659 = _1649;
    float _1661 = _1659;
    if (!_1633)
    {
        float _1663 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1665 = _851 + _1663;
        float _1667 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1669 = _1307 + _1667;
        float _1671 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1673 = -_1309;
        float _1675 = _1673 + _1641;
        float _1677 = _1665 * _1665;
        float _1679 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1681 = _1309 + _1679;
        float _1683 = fma(_1669, _1669, _1677);
        float _1685 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1687 = fma(_1681, _1681, _1683);
        float _1689 = sqrt(_1687);
        float _1691 = _1671 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1693 = precise::min(_1689, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1695 = _1693 * _1685;
        float _1697 = -_1307;
        float _1699 = _1697 + _1639;
        float _1701 = _1691 * _1695;
        float _1703 = -_851;
        float _1705 = _1703 + _1643;
        float _1707 = fma(_1699, _1701, _1307);
        float _1709 = fma(_1705, _1701, _851);
        float _1711 = fma(_1675, _1701, _1309);
        _1657 = _1709;
        _1653 = _1707;
        _1661 = _1711;
    }
    float _1713 = _1657;
    float _1715 = _1653;
    float _1717 = _1661;
    float _1719 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1721 = _1713 + _1719;
    float _1723 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1725 = _1715 + _1723;
    float _1727 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1729 = _1717 + _1727;
    float _1731 = _1721 * _1721;
    float _1733 = fma(_1725, _1725, _1731);
    float _1735 = fma(_1729, _1729, _1733);
    float _1737 = rsqrt(_1735);
    float _1739 = _1725 * _1737;
    float _1741 = _1729 * _1737;
    float _1743 = _1721 * _1737;
    float _1745 = _1739 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1747 = _1741 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1749 = _1745 * _1745;
    float _1751 = _1747 * _1747;
    float _1753 = _1749 + _1751;
    float _1755 = sqrt(_1753);
    bool _1757 = _1755 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1759 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1761 = _1755 + _1759;
    float _1763 = _1495;
    float _1765 = _1761;
    float _1767 = _1745;
    if (_1757)
    {
        float _1769 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1763 = _1769;
    }
    float _1771 = _1763;
    if (_1757)
    {
        float _1773 = rsqrt(_1753);
        _1545 = _1773;
    }
    float _1775 = _1545;
    float _1777 = _1775;
    if (_1757)
    {
        float _1779 = _1761 * _1771;
        _1765 = _1779;
    }
    float _1781 = _1765;
    if (_1757)
    {
        float _1783 = _1781 * 0.15915493667125701904296875;
        _1547 = _1783;
    }
    float _1785 = _1547;
    float _1787 = _1643;
    if (_1757)
    {
        float _1789 = _1785 * 6.283185482025146484375;
        float _1791 = sin(_1789);
        _1787 = _1791;
    }
    float _1793 = _1787;
    float _1795 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1797 = precise::max(0.0, _1795);
    float _1799 = _1771;
    float _1801 = _1797;
    float _1803 = _1795;
    if (_1757)
    {
        float _1805 = _1785 * 6.283185482025146484375;
        float _1807 = cos(_1805);
        _1799 = _1807;
    }
    float _1809 = _1799;
    float _1811 = -_1743;
    float _1813 = -_1797;
    float _1815 = fma(_1811, (*spvDescriptorSet0.vp_c15)._m0[24].y, _1813);
    if (_1757)
    {
        float _1817 = _1815 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1801 = _1817;
    }
    float _1819 = _1801;
    float _1821 = sqrt(_1735);
    float _1823 = _1819;
    float _1825 = _1793;
    if (_1757)
    {
        float _1827 = fma(_1793, _1819, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1823 = _1827;
    }
    float _1829 = _1823;
    float _1831 = _1829;
    if (!_1757)
    {
        _1825 = _1749;
    }
    float _1833 = _1825;
    float _1835 = _1833;
    float _1837 = _1809;
    if (_1757)
    {
        float _1839 = _1809 + (-1.0);
        _1803 = _1839;
    }
    float _1841 = _1803;
    float _1843 = _1841;
    if (_1757)
    {
        float _1845 = _1775 * _1829;
        _1377 = _1845;
    }
    float _1847 = _1377;
    if (!_1757)
    {
        _1831 = _1815;
    }
    float _1849 = _1831;
    float _1851 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1853 = _1849;
    if (_1757)
    {
        float _1855 = _1841 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1777 = _1855;
    }
    float _1857 = _1777;
    if (_1757)
    {
        float _1859 = _1745 * _1847;
        _1767 = _1859;
    }
    float _1861 = _1767;
    if (!_1757)
    {
        _1843 = _1747;
    }
    float _1863 = _1843;
    float _1865 = _1863;
    if (_1757)
    {
        float _1867 = _1747 * _1847;
        _1865 = _1867;
    }
    float _1869 = _1865;
    if (_1757)
    {
        float _1871 = fma(_1815, _1809, _1857);
        _1853 = _1871;
    }
    float _1873 = _1853;
    if (_1757)
    {
        float _1875 = _1861 * _1861;
        _1835 = _1875;
    }
    float _1877 = _1835;
    if (!_1757)
    {
        _1837 = _1751;
    }
    float _1879 = _1837;
    float _1881 = _1879;
    if (_1757)
    {
        float _1883 = _1869 * _1869;
        _1881 = _1883;
    }
    float _1885 = _1881;
    float _1887 = fma(_1873, _1873, _1877);
    float _1889 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1891 = _1887 + _1885;
    float _1893 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1895 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1897 = fma(_1821, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1895);
    float _1899 = precise::clamp(_1897, 0.0, 1.0);
    float _1901 = rsqrt(_1891);
    float _1903 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1893);
    float _1905 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1907 = -_1899;
    float _1909 = _1907 + 1.0;
    float _1911 = _1713 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1913 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1903);
    float _1915 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1905);
    float _1917 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1911);
    float _1919 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1921 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1915);
    float _1923 = fma(_1715, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1851);
    float _1925 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1917);
    float _1927 = _1919 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1929 = _1921 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1931 = fma(_1717, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1923);
    float _1933 = _1925 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1935 = _1901 * _1861;
    float _1937 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1939 = abs(_1909);
    float _1941 = log2(_1939);
    float _1943 = -_1927;
    float _1945 = fma(_1943, _1889, 1.0);
    float _1947 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1949 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1937);
    float _1951 = _1901 * _1873;
    float _1953 = _1935 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1955 = _1901 * _1869;
    float _1957 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1949);
    float _1959 = log2(_1945);
    float _1961 = -_1953;
    float _1963 = fma(_1951, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1961);
    float _1965 = _1951 + 1.0;
    float _1967 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1957);
    float _1969 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1971 = -_1955;
    float _1973 = fma(_1971, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1963);
    float _1975 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1977 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1979 = fma(_1973, -0.5, 0.5);
    float _1981 = 1.0 / _1967;
    float _1983 = fma(_1973, 0.5, 0.5);
    float _1985 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1969);
    float _1987 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1975);
    float _1989 = fma(_1983, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1991 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1985);
    float _1993 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1987);
    float _1995 = exp2(_1977);
    float _1997 = fma(_1983, _1989, -0.212114393711090087890625);
    float _1999 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1991);
    float _2001 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1993);
    float _2003 = _1959 * 0.693147182464599609375;
    float _2005 = fma(_1983, _1997, 1.570728778839111328125);
    float _2007 = sqrt(_1979);
    float _2009 = _1999 * _1981;
    float _2011 = _2003 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2013 = fma(_2009, 0.5, 0.5);
    float _2015 = -_1951;
    float _2017 = fma(_1995, _1965, _2015);
    float _2019 = _2001 * _1981;
    float _2021 = fma(_2017, 0.5, 0.5);
    float _2023 = fma(_2019, -0.5, 0.5);
    float _2025 = _2007 * 0.636619746685028076171875;
    float _2027 = -_2005;
    float _2029 = fma(_2025, _2027, 1.0);
    float3 _5320 = float3(_2013, _2023, _2011);
    float _2031 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5320, float3(0.0), isnan(_5320)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5320, float3(0.0), isnan(_5320)), level(0.0)).x;
    float3 _5331 = float3(_2013, _2023, _2011);
    float4 _2034 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5331, float3(0.0), isnan(_5331)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5331, float3(0.0), isnan(_5331)), level(0.0)).xyzw;
    float _2036 = _2034.x;
    float _2038 = _2034.y;
    float _2040 = _2034.z;
    float _2042 = _2034.w;
    float2 _5348 = float2(_2029, _2021);
    float3 _2046 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5348, float2(0.0), isnan(_5348)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5348, float2(0.0), isnan(_5348)), level(0.0)).xyz;
    float _2048 = _2046.x;
    float _2050 = _2046.y;
    float _2052 = _2046.z;
    float _2054 = _851 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2056 = _1537 * _1743;
    float _2058 = _851 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2060 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2054);
    float _2062 = _1941 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2064 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2066 = (*spvDescriptorSet0.vp_c9)._m0[139].w + _2064;
    float _2068 = fma(_1535, _1739, _2056);
    float _2070 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2060);
    float _2072 = fma(_1307, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2058);
    float _2074 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2076 = fma(_1539, _1741, _2068);
    float _2078 = 1.0 / _2066;
    float _2080 = _2070 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2082 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2072);
    float _2084 = fma(_1933, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2074);
    float _2086 = abs(_2076);
    float _2088 = -(*spvDescriptorSet0.vp_c9)._m0[139].z;
    float _2090 = _2086 + _2088;
    bool _2092 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2094 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2096 = _2092 || _2094;
    bool _2098 = isnan(0.5);
    bool _2100 = _2096 || _2098;
    float _2102 = _2082 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2104 = 1.0 / _2080;
    float _2106 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2084);
    float _2108 = _2102 + _2080;
    float _2110 = fma(_1947, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2106);
    float _2112 = exp2(_2062);
    float _2114 = _2090 * _2078;
    float _2116 = precise::clamp(_2114, 0.0, 1.0);
    float _2118 = fma(_2116, -2.0, 3.0);
    float _2120 = _2116 * _2116;
    float _2122 = 2.0;
    if (_2100)
    {
        _2122 = 1.0;
    }
    float _2124 = _2122;
    float _2126 = _2108 * _2104;
    float _2128 = _2126 * 0.5;
    float _2130 = _2124;
    if (!_2100)
    {
        float _2132 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2134 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2136 = fma(_2128, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2134);
        float _2138 = _2132 * 0.15915493667125701904296875;
        float _2140 = _2138 * 6.283185482025146484375;
        float _2142 = cos(_2140);
        float _2144 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2146 = _2144 * 0.15915493667125701904296875;
        float _2148 = _2138 * 6.283185482025146484375;
        float _2150 = sin(_2148);
        float _2152 = 1.0 / _2142;
        float _2154 = _2146 * 6.283185482025146484375;
        float _2156 = cos(_2154);
        float _2158 = _2150 * _2152;
        float _2160 = 1.0 / _2136;
        float _2162 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2164 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2162;
        float _2166 = _2156 * _2158;
        float _2168 = _2146 * 6.283185482025146484375;
        float _2170 = sin(_2168);
        float _2172 = 1.0 / _2166;
        float _2174 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2176 = _2160 * _2174;
        float _2178 = 1.0 / _2164;
        float _2180 = _2170 * _2172;
        float _2182 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2184 = fma(_2180, _2176, _2182);
        float _2186 = _2184 * _2178;
        float _2188 = precise::clamp(_2186, 0.0, 1.0);
        _2130 = _2188;
    }
    float _2190 = _2130;
    float _2192 = _2120 * _2118;
    float _2194 = -_2112;
    float _2196 = _2194 + 1.0;
    bool _2198 = _2190 > 0.0;
    bool _2200 = isnan(_2190);
    bool _2202 = _2198 || _2200;
    bool _2204 = isnan(0.0);
    bool _2206 = _2202 || _2204;
    float _2208 = _2110 + _1967;
    float _2210 = _2192 * _2190;
    float _2212 = _1999 + _1967;
    float _2214 = _1967 * 0.5;
    out.gl_Position.x = _1999;
    out.gl_Position.y = _2001;
    out.gl_Position.z = _2110;
    out.gl_Position.w = _1967;
    float _2216 = _2210 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2218 = _2196 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2220 = _2208 * 0.5;
    float _2222 = _2212 * 0.5;
    float _2224 = _2218 * _2031;
    float _2226 = -_2218;
    float _2228 = _2226 + 1.0;
    float _2230 = fma(_2001, -0.5, _2214);
    float _2232 = _2216 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2234 = _2042 * _2224;
    float _2236 = _2052 * _2224;
    float _2238 = _2042 * _2228;
    out.m_72.x = _2222;
    out.m_72.y = _2230;
    out.m_72.z = _2220;
    out.m_72.w = _1967;
    float _2240 = fma(_2048, _2234, _2036);
    float _2242 = fma(_2050, _2234, _2038);
    float _2244 = fma(_2042, _2236, _2040);
    out.m_47.x = _2232;
    out.m_74.x = _2240;
    out.m_74.y = _2242;
    out.m_74.z = _2244;
    out.m_74.w = _2238;
    if (_2206)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _2246 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2246;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

