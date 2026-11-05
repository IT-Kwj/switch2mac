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
    float4 m_55 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_64 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_51 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _739 = false;
    bool _633 = false;
    bool _513 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2643 = as_type<float>(_101);
        out.gl_Position.z = _2643;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _95;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    int _133 = 0;
    if (_129)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2711 = as_type<float>(_137);
        out.gl_Position.z = _2711;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _161 = _159 != 0;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _165 = _163 != 0;
    float _167 = _157 * 6.283185482025146484375;
    float _169 = floor(_157);
    float _171 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _167 * 0.15915493667125701904296875;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_161;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _185 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _187 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_155;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    int _199 = abs(_181);
    bool _201 = !_165;
    int _203 = _201 ? 0 : 1;
    float _205 = -_169;
    float _207 = _157 + _205;
    int _209 = abs(_195);
    float _211 = -_207;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _215 = float(_199);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _219 = abs(_203);
    float _221 = fma(_191, 0.5, 0.5);
    float _223 = abs(_213);
    float _225 = _215 * _223;
    bool _227 = _207 < 0.5;
    float _229 = float(_227);
    float _231 = -_221;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_209);
    float _237 = -_229;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_219);
    float _243 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _187);
    float _245 = fma(_235, _233, _225);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _249 = abs(_239);
    float _251 = fma(_241, _249, _245);
    bool _253 = !_217;
    float _255 = _197;
    float _257 = _247;
    float _273;
    if (!_253)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_85);
        float _279 = 1.0 / _277;
        float _281 = _117 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _283 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _283 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _313 = 1.0 / _299;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _317 = 1.0 / _307;
    float _319 = 1.0 / _303;
    float _321 = _295 * _313;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _325 = _283 + _323;
    float _327 = 1.0 / _311;
    float _329 = _287 * _317;
    bool _331 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _333 = isnan(_283);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -_341;
    float _345 = _343 + 1.0;
    float _347 = _291 * _319;
    bool _349 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _351 = isnan(_283);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    bool _361 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _363 = isnan(_283);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -_359;
    float _375 = _373 + 1.0;
    float _377 = _359 * _345;
    bool _379 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_283);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _325 * _327;
    float _393 = _371 * _375;
    float _395 = -_371;
    float _397 = _395 + 1.0;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _399;
    bool _403 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_283);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _419 = _389 * _397;
    float _421 = -_389;
    float _423 = _421 + 1.0;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _425;
    float _429 = fma(_401, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = _413 * _423;
    float _437 = fma(_427, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _439 = -_413;
    float _441 = _439 + 1.0;
    float _443 = fma(_417, _347, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _445 = _429 * _435;
    float _447 = _437 * _435;
    float _449 = fma(_433, _347, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[143].x, _445);
    float _461 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[143].y, _447);
    float _463 = fma(_453, _329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _475 = fma(_443, _419, _459);
    float _477 = fma(_449, _419, _461);
    float _479 = fma(_469, _391, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_473, _391, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _483 = fma(_463, _393, _475);
    float _485 = fma(_465, _393, _477);
    float _487 = fma(_479, _377, _483);
    float _489 = fma(_481, _377, _485);
    float _491 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[147].x, _487);
    float _493 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[147].y, _489);
    bool _495 = !_315;
    float _511;
    if (!_495)
    {
        float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _499 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _503 = _501 * _497;
        float _505 = floor(_503);
        float _507 = -_505;
        float _509 = _503 + _507;
        _511 = _509;
        _513 = true;
    }
    else
    {
        float _515 = float(_85);
        float _517 = 1.0 / _515;
        float _519 = _117 * _517;
        _511 = _519;
    }
    _513 = false;
    float _521 = _511;
    float _523 = in.m_53.x;
    float _525 = in.m_53.y;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _529 = _521 + _527;
    bool _531 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _533 = isnan(_521);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _543;
    bool _547 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _549 = isnan(_521);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -_541;
    float _561 = _559 + 1.0;
    bool _563 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _565 = 1.0 / _545;
    float _567 = _557 * _561;
    float _569 = -_557;
    float _571 = _569 + 1.0;
    float _573 = _493 * _525;
    float _575 = _529 * _565;
    float _577 = _491 * _523;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _587;
    float _591 = fma(_581, _575, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _593 = fma(_585, _575, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _595 = fma(_589, _575, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _597 = _591 * _567;
    float _599 = _593 * _567;
    float _601 = _595 * _567;
    float _603 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[107].y, _597);
    float _605 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[107].x, _599);
    float _607 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[107].z, _601);
    float _609 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[108].y, _603);
    float _611 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[108].x, _605);
    float _613 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[108].z, _607);
    bool _615 = !_563;
    float _631;
    if (!_615)
    {
        float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _619 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _621 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _623 = _621 * _617;
        float _625 = floor(_623);
        float _627 = -_625;
        float _629 = _623 + _627;
        _631 = _629;
        _633 = true;
    }
    else
    {
        float _635 = float(_85);
        float _637 = 1.0 / _635;
        float _639 = _117 * _637;
        _631 = _639;
    }
    _633 = false;
    float _641 = _631;
    bool _643 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _645 = isnan(_641);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _659 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _661 = isnan(_641);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _677 = _641 + _675;
    float _679 = -_653;
    float _681 = _679 + 1.0;
    bool _683 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _685 = 1.0 / _657;
    float _687 = _669 * _681;
    float _689 = -_669;
    float _691 = _689 + 1.0;
    float _693 = _673 * _685;
    float _695 = _613 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _697 = fma(_693, _677, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _699 = _609 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _701 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _697 * _687;
    float _705 = _611 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[115].x, _703);
    float _711 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[116].x, _709);
    float _715 = _713 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _711;
    out.m_55.y = _707;
    out.m_55.z = _701;
    out.m_55.w = _715;
    bool _717 = !_683;
    float _735;
    float _737;
    if (!_717)
    {
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _721 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _723 = float(_85);
        float _725 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _727 = _725 * _719;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _735 = _723;
        _737 = _733;
        _739 = true;
    }
    else
    {
        float _741 = float(_85);
        float _743 = 1.0 / _741;
        float _745 = _117 * _743;
        _735 = _741;
        _737 = _745;
    }
    _739 = false;
    float _747 = _735;
    float _749 = _737;
    float _751 = _247 * _247;
    float _753 = as_type<float>(int(gl_VertexIndex));
    float _755 = _251 * _573;
    float _757 = fma(_197, _197, _751);
    float _759 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _761 = fma(_243, _243, _757);
    float _763 = rsqrt(_761);
    int _765 = as_type<int>(_753) & 1;
    bool _767 = _765 != 0;
    int _769 = as_type<int>(_753) & 2;
    bool _771 = _769 != 0;
    float _773 = _243 * _763;
    float _775 = _197 * _763;
    float _777 = _247 * _763;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _781 = _773 * _779;
    float _783 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _785 = _775 * _783;
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _789 = _777 * _787;
    float _791 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _793 = -_781;
    float _795 = fma(_775, _791, _793);
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _799 = -_785;
    float _801 = fma(_777, _797, _799);
    float _803 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _805 = -_789;
    float _807 = fma(_773, _803, _805);
    float _809 = _795 * _795;
    float _811 = in.m_42.x;
    float _813 = in.m_42.y;
    float _815 = in.m_42.z;
    float _817 = fma(_807, _807, _809);
    float _819 = fma(_801, _801, _817);
    float _821 = _251 * _577;
    bool _823 = !_767;
    float _825 = _823 ? (-0.5) : 0.5;
    bool _827 = !_771;
    float _829 = _827 ? (-0.5) : 0.5;
    float _831 = _821 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _833 = rsqrt(_819);
    float _835 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _825);
    float _837 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _829);
    float _839 = _831 * _835;
    float _841 = _759 * _837;
    float _843 = _813 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _845 = _841 * _773;
    float _847 = _841 * _775;
    float _849 = _841 * _777;
    float _851 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[6].x, _843);
    float _853 = _795 * _833;
    float _855 = _807 * _833;
    float _857 = _801 * _833;
    float _859 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _861 = _775 * _853;
    float _863 = fma(_839, _857, _845);
    float _865 = _777 * _857;
    float _867 = -_861;
    float _869 = fma(_777, _855, _867);
    float _871 = _813 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _873 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[6].z, _851);
    float _875 = -_865;
    float _877 = fma(_773, _853, _875);
    float _879 = fma(_859, _869, _863);
    float _881 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[4].x, _871);
    float _883 = fma(_839, _855, _847);
    float _885 = _873 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _887 = _813 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _889 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[4].z, _881);
    float _891 = fma(_859, _877, _883);
    float _893 = _885 + _879;
    float _895 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[5].x, _887);
    float _897 = _889 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _899 = _773 * _855;
    float _901 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _903 = _893 + _901;
    float _905 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[5].z, _895);
    float _907 = _897 + _891;
    float _909 = fma(_839, _853, _849);
    float _911 = _903 * _903;
    float _913 = -_899;
    float _915 = fma(_775, _857, _913);
    float _917 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _919 = _907 + _917;
    float _921 = _905 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _923 = fma(_859, _915, _909);
    float _925 = fma(_919, _919, _911);
    float _927 = _921 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _929 = _921 + _923;
    float _931 = sqrt(_925);
    float _933 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[11].x, _927);
    float _935 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[11].z, _933);
    bool _937 = _931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _941 = _939 != 0;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _945 = _943 != 0;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _949 = _947 != 0;
    bool _951 = !_945;
    int _953 = _951 ? 0 : 1;
    bool _955 = !_941;
    int _957 = _955 ? 0 : 1;
    bool _959 = !_949;
    int _961 = _959 ? 0 : 1;
    float _963 = _859;
    float _965 = _923;
    float _967 = _849;
    float _969 = _777;
    float _971 = _775;
    float _973 = _773;
    if (!_937)
    {
        _963 = _907;
    }
    float _975 = _963;
    float _977 = _975;
    if (!_937)
    {
        _965 = _893;
    }
    float _979 = _965;
    float _981 = _979;
    if (!_937)
    {
        _967 = _929;
    }
    float _983 = _967;
    bool _985 = !_937;
    float _987 = _983;
    if (!_985)
    {
        float _989 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _991 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _993 = _931 + _991;
        float _995 = rsqrt(_925);
        float _997 = _993 * _989;
        float _999 = _929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1001 = _997 * 0.15915493667125701904296875;
        float _1003 = _1001 * 6.283185482025146484375;
        float _1005 = cos(_1003);
        float _1007 = _1001 * 6.283185482025146484375;
        float _1009 = sin(_1007);
        float _1011 = _1005 + (-1.0);
        float _1013 = fma(_1009, _999, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1015 = _1011 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1017 = _995 * _1013;
        float _1019 = fma(_929, _1005, _1015);
        float _1021 = fma(_919, _1017, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1023 = fma(_903, _1017, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _987 = _1019;
        _977 = _1021;
        _981 = _1023;
    }
    float _1025 = _987;
    float _1027 = _977;
    float _1029 = _981;
    float _1031 = -_921;
    float _1033 = _1031 + _1025;
    float _1035 = _935 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1037 = -_897;
    float _1039 = _1037 + _1027;
    float _1041 = -_885;
    float _1043 = _1041 + _1029;
    float _1045 = _1033 * _1033;
    float _1047 = _921 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1049 = 1.0 / _1035;
    float _1051 = fma(_1039, _1039, _1045);
    float _1053 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1047);
    float _1055 = fma(_1043, _1043, _1051);
    float _1057 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1053);
    bool _1059 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1061 = isnan(0.5);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1067 = _1063 || _1065;
    float _1069 = sqrt(_1055);
    float _1071 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1073 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1075 = isnan(0.5);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1081 = _1077 || _1079;
    float _1083 = _1071 + _1035;
    float _1085 = _1083 * _1049;
    float _1087 = _1085 * 0.5;
    bool _1089 = _1069 > 0.0;
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1093 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1091);
    float _1095 = 1.0 / _1093;
    float _1097 = _1087;
    float _1099 = _1027;
    float _1101 = _1029;
    float _1103 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1105 = _1043;
    if (!_1089)
    {
        _1097 = _1025;
    }
    float _1107 = _1097;
    bool _1109 = !_1089;
    float _1111 = _1107;
    float _1113 = _1107;
    if (!_1109)
    {
        float _1115 = sqrt(_761);
        float _1117 = rsqrt(_1055);
        bool _1119 = _1115 > 0.0;
        float _1121 = _1039 * _1117;
        float _1123 = _1033 * _1117;
        float _1125 = _1043 * _1117;
        _1103 = _1125;
        if (!_1119)
        {
            _1111 = _1025;
        }
        float _1127 = _1111;
        bool _1129 = !_1119;
        _1113 = _1127;
        if (!_1129)
        {
            float _1131 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1133 = _777 * _1123;
            float _1135 = fma(_775, _1121, _1133);
            float _1137 = fma(_773, _1125, _1135);
            float _1139 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1141 = _1137 * _1139;
            float _1143 = fma(_197, _1141, _1027);
            float _1145 = fma(_247, _1141, _1025);
            float _1147 = fma(_243, _1141, _1029);
            _1099 = _1143;
            _1113 = _1145;
            _1101 = _1147;
            _969 = _1137;
        }
    }
    float _1149 = _1099;
    float _1151 = _1113;
    float _1153 = _1101;
    float _1155 = _969;
    float _1157 = _1103;
    float _1159 = _1155;
    float _1161 = _1153;
    float _1163 = _1157;
    if (_1081)
    {
        _971 = 1.0;
    }
    float _1165 = _971;
    float _1167 = _1165;
    if (_1067)
    {
        _255 = _1149;
    }
    float _1169 = _255;
    float _1171 = _1169;
    if (_1067)
    {
        _257 = _1151;
    }
    float _1173 = _257;
    float _1175 = _1173;
    if (!_1067)
    {
        float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1179 = _921 + _1177;
        float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1183 = _897 + _1181;
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1187 = -_897;
        float _1189 = _1187 + _1149;
        float _1191 = _1179 * _1179;
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1195 = _885 + _1193;
        float _1197 = -_885;
        float _1199 = _1197 + _1153;
        float _1201 = fma(_1183, _1183, _1191);
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1205 = fma(_1195, _1195, _1201);
        float _1207 = sqrt(_1205);
        float _1209 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1211 = precise::min(_1207, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1213 = _1211 * _1203;
        float _1215 = -_921;
        float _1217 = _1215 + _1151;
        float _1219 = _1209 * _1213;
        float _1221 = fma(_1189, _1219, _897);
        float _1223 = fma(_1217, _1219, _921);
        float _1225 = fma(_1199, _1219, _885);
        _1159 = _1219;
        _1175 = _1223;
        _1171 = _1221;
        _1161 = _1225;
    }
    float _1227 = _1159;
    float _1229 = _1175;
    float _1231 = _1171;
    float _1233 = _1161;
    float _1235 = _1227;
    if (_1081)
    {
        _1235 = 1.0;
    }
    float _1237 = _1235;
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1241 = _1095 * _1239;
    float _1243 = _1237;
    if (!_1081)
    {
        float _1245 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1247 = _1245 * 0.15915493667125701904296875;
        float _1249 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1253 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1251;
        float _1255 = _1247 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        float _1259 = _1249 * 0.15915493667125701904296875;
        float _1261 = _1247 * 6.283185482025146484375;
        float _1263 = sin(_1261);
        float _1265 = 1.0 / _1257;
        float _1267 = _1259 * 6.283185482025146484375;
        float _1269 = cos(_1267);
        float _1271 = _1263 * _1265;
        float _1273 = _1259 * 6.283185482025146484375;
        float _1275 = sin(_1273);
        float _1277 = _1269 * _1271;
        float _1279 = 1.0 / _1253;
        float _1281 = 1.0 / _1277;
        float _1283 = _1275 * _1281;
        float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1287 = fma(_1241, _1283, _1285);
        float _1289 = _1287 * _1279;
        float _1291 = precise::clamp(_1289, 0.0, 1.0);
        _1163 = _1279;
        _973 = _1253;
        _1167 = _1291;
    }
    float _1293 = _1163;
    float _1295 = _973;
    float _1297 = _1167;
    float _1299 = _1295;
    float _1301 = _1293;
    if (!_1081)
    {
        float _1303 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1305 = _1303 * 0.15915493667125701904296875;
        float _1307 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1309 = _1305 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        float _1313 = _1307 * 0.15915493667125701904296875;
        float _1315 = _1305 * 6.283185482025146484375;
        float _1317 = sin(_1315);
        float _1319 = 1.0 / _1311;
        float _1321 = _1313 * 6.283185482025146484375;
        float _1323 = cos(_1321);
        float _1325 = _1317 * _1319;
        float _1327 = _1313 * 6.283185482025146484375;
        float _1329 = sin(_1327);
        float _1331 = _1323 * _1325;
        float _1333 = 1.0 / _1331;
        float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1337 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1335;
        float _1339 = 1.0 / _1337;
        float _1341 = _1329 * _1333;
        float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1345 = fma(_1241, _1341, _1343);
        float _1347 = _1345 * _1339;
        float _1349 = precise::clamp(_1347, 0.0, 1.0);
        float _1351 = -_1349;
        float _1353 = _1351 + 1.0;
        _1299 = _1333;
        _1243 = _1353;
    }
    float _1355 = _1299;
    float _1357 = _1243;
    float _1359 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1361 = _1229 + _1359;
    float _1363 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1365 = _1231 + _1363;
    float _1367 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1369 = _1233 + _1367;
    float _1371 = _1361 * _1361;
    float _1373 = fma(_1365, _1365, _1371);
    float _1375 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1377 = fma(_1369, _1369, _1373);
    float _1379 = rsqrt(_1377);
    float _1381 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1383 = _1365 * _1381;
    float _1385 = _1369 * _1381;
    float _1387 = _1383 * _1383;
    float _1389 = _1385 * _1385;
    float _1391 = _1387 + _1389;
    float _1393 = sqrt(_1391);
    bool _1395 = _1393 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1397 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1399 = _1393 + _1397;
    float _1401 = _1379;
    float _1403 = _1391;
    float _1405 = _1399;
    float _1407 = _1361;
    float _1409 = _1383;
    if (_1395)
    {
        float _1411 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1411;
    }
    float _1413 = _1401;
    if (_1395)
    {
        float _1415 = rsqrt(_1391);
        _1403 = _1415;
    }
    float _1417 = _1403;
    if (_1395)
    {
        float _1419 = _1399 * _1413;
        _1405 = _1419;
    }
    float _1421 = _1405;
    if (_1395)
    {
        float _1423 = _1421 * 0.15915493667125701904296875;
        _1301 = _1423;
    }
    float _1425 = _1301;
    float _1427 = _1369;
    if (_1395)
    {
        float _1429 = _1425 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        _1427 = _1431;
    }
    float _1433 = _1427;
    float _1435 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1437 = precise::max(0.0, _1435);
    float _1439 = _1355;
    float _1441 = _1437;
    float _1443 = _1435;
    if (_1395)
    {
        float _1445 = _1425 * 6.283185482025146484375;
        float _1447 = cos(_1445);
        _1439 = _1447;
    }
    float _1449 = _1439;
    float _1451 = -_1381;
    float _1453 = -_1437;
    float _1455 = fma(_1361, _1451, _1453);
    if (_1395)
    {
        float _1457 = _1455 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1441 = _1457;
    }
    float _1459 = _1441;
    float _1461 = _1433;
    float _1463 = _1459;
    if (_1395)
    {
        float _1465 = fma(_1433, _1459, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1461 = _1465;
    }
    float _1467 = _1461;
    float _1469 = _1467;
    if (!_1395)
    {
        _1463 = _1455;
    }
    float _1471 = _1463;
    float _1473 = _1471;
    if (_1395)
    {
        float _1475 = _1449 + (-1.0);
        _1443 = _1475;
    }
    float _1477 = _1443;
    float _1479 = _1477;
    if (_1395)
    {
        float _1481 = _1417 * _1467;
        _1105 = _1481;
    }
    float _1483 = _1105;
    if (!_1395)
    {
        _1469 = _1385;
    }
    float _1485 = _1469;
    float _1487 = sqrt(_1377);
    float _1489 = _1485;
    if (_1395)
    {
        float _1491 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1407 = _1491;
    }
    float _1493 = _1407;
    float _1495 = _1493;
    if (_1395)
    {
        float _1497 = _1383 * _1483;
        _1409 = _1497;
    }
    float _1499 = _1409;
    if (!_1395)
    {
        _1479 = _1387;
    }
    float _1501 = _1479;
    float _1503 = _1501;
    if (_1395)
    {
        float _1505 = _1385 * _1483;
        _1489 = _1505;
    }
    float _1507 = _1489;
    if (_1395)
    {
        float _1509 = fma(_1455, _1449, _1493);
        _1473 = _1509;
    }
    float _1511 = _1473;
    if (_1395)
    {
        float _1513 = _1499 * _1499;
        _1503 = _1513;
    }
    float _1515 = _1503;
    if (!_1395)
    {
        _1495 = _1389;
    }
    float _1517 = _1495;
    float _1519 = _1517;
    if (_1395)
    {
        float _1521 = _1507 * _1507;
        _1519 = _1521;
    }
    float _1523 = _1519;
    float _1525 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1527 = fma(_1511, _1511, _1515);
    float _1529 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1531 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1525);
    float _1533 = _1527 + _1523;
    float _1535 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1529);
    float _1537 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1541 = fma(_1487, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1539);
    float _1543 = precise::clamp(_1541, 0.0, 1.0);
    float _1545 = rsqrt(_1533);
    float _1547 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1549 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1537);
    float _1551 = -_1543;
    float _1553 = _1551 + 1.0;
    float _1555 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1535);
    float _1557 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1547);
    float _1559 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1549);
    float _1561 = abs(_1553);
    float _1563 = log2(_1561);
    float _1565 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1557);
    float _1567 = _1559 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1569 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1571 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1531);
    float _1573 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1575 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1577 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1579 = _1545 * _1499;
    float _1581 = _1545 * _1511;
    float _1583 = _1545 * _1507;
    float _1585 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1575);
    float _1587 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1589 = _1571 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1591 = -_1577;
    float _1593 = fma(_1591, _1375, 1.0);
    float _1595 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1585);
    float _1597 = -_1587;
    float _1599 = fma(_1581, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1597);
    float _1601 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1603 = log2(_1593);
    float _1605 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1595);
    float _1607 = -_1583;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1599);
    float _1611 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1613 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1615 = fma(_1609, -0.5, 0.5);
    float _1617 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1611);
    float _1619 = exp2(_1601);
    float _1621 = fma(_1609, 0.5, 0.5);
    float _1623 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1613);
    float _1625 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1617);
    float _1627 = _1581 + 1.0;
    float _1629 = fma(_1621, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1631 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1623);
    float _1633 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1625);
    float _1635 = 1.0 / _1605;
    float _1637 = fma(_1621, _1629, -0.212114393711090087890625);
    float _1639 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1631);
    float _1641 = _1603 * 0.693147182464599609375;
    float _1643 = fma(_1621, _1637, 1.570728778839111328125);
    float _1645 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1647 = sqrt(_1615);
    float _1649 = -_1581;
    float _1651 = fma(_1619, _1627, _1649);
    float _1653 = fma(_1651, 0.5, 0.5);
    float _1655 = _1633 * _1635;
    float _1657 = _1639 * _1635;
    float _1659 = fma(_1655, 0.5, 0.5);
    float _1661 = fma(_1657, -0.5, 0.5);
    float _1663 = _1647 * 0.636619746685028076171875;
    float _1665 = -_1643;
    float _1667 = fma(_1663, _1665, 1.0);
    float3 _5102 = float3(_1659, _1661, _1645);
    float _1669 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5102, float3(0.0), isnan(_5102)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5102, float3(0.0), isnan(_5102)), level(0.0)).x;
    float3 _5113 = float3(_1659, _1661, _1645);
    float4 _1672 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5113, float3(0.0), isnan(_5113)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5113, float3(0.0), isnan(_5113)), level(0.0)).xyzw;
    float _1674 = _1672.x;
    float _1676 = _1672.y;
    float _1678 = _1672.z;
    float _1680 = _1672.w;
    float2 _5130 = float2(_1667, _1653);
    float3 _1684 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5130, float2(0.0), isnan(_5130)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5130, float2(0.0), isnan(_5130)), level(0.0)).xyz;
    float _1686 = _1684.x;
    float _1688 = _1684.y;
    float _1690 = _1684.z;
    float _1692 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1694 = int(_1692);
    int _1696 = abs(_953);
    float _1698 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1700 = int(_1698);
    float _1702 = float(_1694);
    float _1704 = 1.0 / _747;
    float _1706 = float(uint(_1700));
    float _1708 = 1.0 / _1702;
    int _1710 = ~_1700;
    int _1712 = _1710 + 1;
    int _1714 = ~_1700;
    int _1716 = _1714 + 1;
    int _1718 = _1700 + (-1);
    float _1720 = 1.0 / _1706;
    float _1722 = _117 * _1708;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1726 = _1724 != 0;
    float _1728 = trunc(_1722);
    int _1730 = int(_1728);
    int _1732 = as_type<int>(_1720) + (-2);
    bool _1734 = !_1726;
    float _1736 = _1734 ? 7.345489978790283203125 : 1.0;
    float _1738 = _1736 * _139;
    float _1740 = float(uint(_1730));
    float _1742 = as_type<float>(_1732) * _1740;
    float _1744 = trunc(_1742);
    float _1746 = precise::max(_1744, 0.0);
    uint _1749 = uint(_1746);
    float _1751 = float(_1700);
    int _1753 = _1712 * int(_1749);
    int _1755 = _1753 + _1730;
    float _1757 = float(uint(_1755));
    float _1759 = as_type<float>(_1732) * _1757;
    float _1761 = floor(_1738);
    float _1763 = trunc(_1759);
    float _1765 = precise::max(_1763, 0.0);
    uint _1767 = uint(_1765);
    float _1769 = -_1761;
    float _1771 = _1738 + _1769;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1775 = _1773 != 0;
    int _1777 = int(_1749) + int(_1767);
    float _1779 = float(_1730);
    int _1781 = _1716 * _1777;
    int _1783 = _1781 + _1730;
    bool _1785 = _1779 >= _1751;
    bool _1787 = isnan(_1779);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan(_1751);
    bool _1793 = _1789 || _1791;
    float _1795 = float(_1793);
    bool _1797 = uint(_1783) >= uint(_1700);
    float _1799 = _1771 * _1751;
    float _1801 = trunc(_1795);
    int _1803 = int(_1801);
    float _1805 = _117 * _1751;
    bool _1807 = !_1797;
    int _1809 = _1807 ? 0 : (-1);
    bool _1811 = _1700 == 0;
    float _1813 = _1805 * _1704;
    int _1815 = ~_1777;
    int _1817 = _1815 + _1809;
    int _1819 = _1817 + 1;
    float _1821 = trunc(_1799);
    int _1823 = int(_1821);
    bool _1825 = !_1775;
    int _1827 = _1825 ? 0 : 1;
    int _1829 = _1700 * _1819;
    int _1831 = _1829 + _1730;
    int _1833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1835 = _1833 != 0;
    int _1837 = abs(_1827);
    int _1839 = ~_1803;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    float _1845 = trunc(_1813);
    int _1847 = int(_1845);
    bool _1849 = !_1811;
    int _1851 = _1849 ? _1831 : (-1);
    bool _1853 = !_1835;
    int _1855 = _1853 ? 0 : 1;
    int _1857 = _1851 * _1843;
    int _1859 = ~_1700;
    int _1861 = _1859 + 1;
    int _1863 = _1803 * _1718;
    int _1865 = _1863 + _1857;
    int _1867 = abs(_957);
    int _1869 = _1865 * _1696;
    int _1871 = abs(_961);
    int _1873 = _1823 * _1837;
    int _1875 = _1873 + _1730;
    int _1877 = abs(_1855);
    int _1879 = _1847 * _1867;
    int _1881 = _1879 + _1869;
    int _1883 = ~_1700;
    int _1885 = _1883 + 1;
    int _1887 = _1875 * _1871;
    int _1889 = _1887 + _1881;
    int _1891 = ~_1700;
    int _1893 = _1891 + 1;
    int _1895 = _1823 * _1877;
    int _1897 = _1895 + _1889;
    float _1899 = float(uint(_1897));
    float _1901 = as_type<float>(_1732) * _1899;
    float _1903 = trunc(_1901);
    float _1905 = precise::max(_1903, 0.0);
    uint _1907 = uint(_1905);
    int _1909 = _1893 * int(_1907);
    int _1911 = _1909 + _1897;
    float _1913 = float(uint(_1911));
    int _1915 = ~_1700;
    int _1917 = _1915 + 1;
    float _1919 = as_type<float>(_1732) * _1913;
    float _1921 = trunc(_1919);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    int _1927 = int(_1907) + int(_1925);
    int _1929 = _1885 * _1927;
    int _1931 = _1929 + _1897;
    bool _1933 = uint(_1931) >= uint(_1700);
    float _1935 = float(uint(_1875));
    bool _1937 = !_1933;
    int _1939 = _1937 ? 0 : (-1);
    float _1941 = as_type<float>(_1732) * _1935;
    int _1943 = ~_1927;
    int _1945 = _1943 + _1939;
    int _1947 = _1945 + 1;
    float _1949 = trunc(_1941);
    float _1951 = precise::max(_1949, 0.0);
    uint _1953 = uint(_1951);
    int _1955 = _1700 * _1947;
    int _1957 = _1955 + _1897;
    bool _1959 = !_1811;
    int _1961 = _1959 ? _1957 : (-1);
    int _1963 = _1961 >> 31;
    int _1965 = _1961 & 3;
    bool _1967 = _1965 != 0;
    int _1969 = _1963 & 3;
    int _1971 = _1917 * int(_1953);
    int _1973 = _1971 + _1875;
    int _1975 = _1961 + _1969;
    float _1977 = float(uint(_1973));
    int _1979 = _1975 >> 2;
    float _1981 = as_type<float>(_1732) * _1977;
    int _1983 = _1979 << 4;
    int _1985 = _1983 + 368;
    int _1987 = _1961 & 3;
    bool _1989 = _1987 != 0;
    uint _1991 = uint(int(uint(_1985) >> uint(2)));
    uint _1993 = uint(int(uint(int(_1991)) >> uint(2)));
    int _1995 = int(_1991) & 3;
    float _1997 = (*spvDescriptorSet0.vp_c9)._m0[int(_1993)][_1995];
    int _1999 = int(_1991) + 1;
    uint _2001 = uint(int(uint(_1999) >> uint(2)));
    int _2003 = _1999 & 3;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[int(_2001)][_2003];
    float _2007 = trunc(_1981);
    float _2009 = precise::max(_2007, 0.0);
    uint _2011 = uint(_2009);
    bool _2013 = uint(_1987) > 1u;
    int _2015 = _1967 ? 0 : 1;
    bool _2017 = _1987 != 3;
    int _2019 = _1985 + 8;
    uint _2021 = uint(int(uint(_2019) >> uint(2)));
    uint _2023 = uint(int(uint(int(_2021)) >> uint(2)));
    int _2025 = int(_2021) & 3;
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[int(_2023)][_2025];
    int _2029 = int(_2021) + 1;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    int _2033 = _2029 & 3;
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[int(_2031)][_2033];
    bool _2037 = uint(_1987) >= 2u;
    int _2039 = int(_1953) + int(_2011);
    int _2041 = ~_2015;
    int _2043 = _2041 + 1;
    int _2045 = _2043 + 1;
    int _2047 = _2045;
    if (!_2013)
    {
        int _2049 = ~_2015;
        int _2051 = _2049 + 1;
        _2047 = _2051;
    }
    int _2053 = _2047;
    int _2055 = _1861 * _2039;
    int _2057 = _2055 + _1875;
    bool _2059 = !_1989;
    int _2061 = _2059 ? 0 : 1;
    int _2063 = _2037 ? 0 : 1;
    bool _2065 = uint(_2057) >= uint(_1700);
    bool _2067 = _1987 != 3;
    bool _2069 = !_2065;
    int _2071 = _2069 ? 0 : (-1);
    int _2073 = ~_2063;
    int _2075 = _2073 + 1;
    int _2077 = _2075 + 1;
    int _2079 = ~_2039;
    int _2081 = _2079 + _2071;
    int _2083 = _2081 + 1;
    int _2085 = abs(_2053);
    int _2087 = abs(_2061);
    int _2089 = _1700 * _2083;
    int _2091 = _2089 + _1875;
    float _2093 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2095 = int(_2093);
    int _2097 = _2077;
    if (_2017)
    {
        int _2099 = ~_2063;
        int _2101 = _2099 + 1;
        _2097 = _2101;
    }
    int _2103 = _2097;
    int _2105 = ~_2085;
    int _2107 = _2105 + 1;
    int _2109 = _2107 + 1;
    int _2111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2113 = _2111 != 0;
    bool _2115 = !_2067;
    int _2117 = _2115 ? 0 : (-1);
    int _2119 = _2109 * as_type<int>(_2005);
    int _2121 = ~_2087;
    int _2123 = _2121 + 1;
    int _2125 = _2123 + 1;
    int _2127 = abs(_2103);
    bool _2129 = !_2113;
    int _2131 = _2129 ? 0 : 1;
    int _2133 = _2125 * as_type<int>(_1997);
    int _2135 = _2133 + _2119;
    int _2137 = abs(_2117);
    int _2139 = ~_2127;
    int _2141 = _2139 + 1;
    int _2143 = _2141 + 1;
    int _2145 = abs(_2131);
    float _2147 = in.m_49.y;
    int _2149 = _2143 * as_type<int>(_2027);
    int _2151 = _2149 + _2135;
    float _2153 = float(uint(_2095));
    int _2155 = ~_2137;
    int _2157 = _2155 + 1;
    int _2159 = _2157 + 1;
    float _2161 = 1.0 / _2153;
    int _2163 = abs(_2095);
    int _2165 = ~_2145;
    int _2167 = _2165 + 1;
    int _2169 = _2167 + 1;
    int _2171 = _2159 * as_type<int>(_2035);
    int _2173 = _2171 + _2151;
    float _2175 = float(uint(_2163));
    float _2177 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2179 = !_1811;
    int _2181 = _2179 ? _2091 : (-1);
    int _2183 = _2173 * _2169;
    float _2185 = 1.0 / _2175;
    int _2187 = _2181 * _2145;
    int _2189 = _2187 + _2183;
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2193 = _2191 != 0;
    int _2195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2197 = _2195 != 0;
    int _2199 = as_type<int>(_2161) + (-2);
    float _2201 = float(uint(_2189));
    int _2203 = abs(_2189);
    float _2205 = as_type<float>(_2199) * _2201;
    float _2207 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2209 = as_type<int>(_2185) + (-2);
    float _2211 = -_2207;
    float _2213 = fma(_2177, 2.0, _2211);
    float _2215 = float(uint(_2203));
    float _2217 = trunc(_2205);
    float _2219 = precise::max(_2217, 0.0);
    uint _2221 = uint(_2219);
    float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2223;
    float _2227 = as_type<float>(_2209) * _2215;
    int _2229 = ~_2095;
    int _2231 = _2229 + 1;
    float _2233 = 1.0 / _2225;
    float _2235 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2237 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2239 = _2147 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2241 = _139 > 0.5;
    bool _2243 = _2147 > 0.5;
    float _2245 = fma(_2239, -2.0, _2237);
    float _2247 = trunc(_2227);
    float _2249 = precise::max(_2247, 0.0);
    uint _2251 = uint(_2249);
    float _2253 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2235);
    int _2255 = _2231 * int(_2221);
    int _2257 = _2255 + _2189;
    int _2259 = ~_2163;
    int _2261 = _2259 + 1;
    float _2263 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2265 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2267 = _749 + _2265;
    float _2269 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2253);
    float _2271 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2263);
    float _2273 = float(uint(_2257));
    float _2275 = _2267 * _2233;
    float _2277 = -_117;
    float _2279 = fma(_2277, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2213);
    float _2281 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2245);
    int _2283 = ~_2095;
    int _2285 = _2283 + 1;
    float _2287 = as_type<float>(_2199) * _2273;
    float _2289 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2271);
    int _2291 = _2261 * int(_2251);
    int _2293 = _2291 + _2203;
    float _2295 = trunc(_2287);
    float _2297 = precise::max(_2295, 0.0);
    uint _2299 = uint(_2297);
    bool _2301 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2303 = isnan(_749);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    float _2313 = -_2289;
    float _2315 = _2313 + 1.0;
    float _2317 = float(uint(_2293));
    float _2319 = -_2269;
    float _2321 = _2319 + 1.0;
    bool _2323 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2325 = isnan(_749);
    bool _2327 = _2323 || _2325;
    bool _2329 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2331 = _2327 || _2329;
    float _2333 = float(_2331);
    float _2335 = as_type<float>(_2209) * _2317;
    float _2337 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2339 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2337;
    float _2341 = -_2311;
    float _2343 = _2341 + 1.0;
    float _2345 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2347 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2345;
    float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2351 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2349;
    float _2353 = -_825;
    int _2355 = _2241 ? as_type<int>(_2353) : as_type<int>(_825);
    float _2357 = trunc(_2335);
    float _2359 = precise::max(_2357, 0.0);
    uint _2361 = uint(_2359);
    float _2363 = _2333 * _2343;
    int _2365 = int(_2221) + int(_2299);
    float _2367 = fma(_2339, _2275, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2369 = fma(_2351, _2275, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _2371 = ~_2163;
    int _2373 = _2371 + 1;
    float _2375 = fma(_2347, _2275, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _2377 = !_2193;
    float _2379 = _2377 ? _825 : as_type<float>(_2355);
    int _2381 = _2285 * _2365;
    int _2383 = _2381 + _2189;
    float _2385 = _2367 * _2363;
    float _2387 = _2369 * _2363;
    float _2389 = _2375 * _2363;
    bool _2391 = uint(_2383) >= uint(_2095);
    float _2393 = -_2333;
    float _2395 = _2393 + 1.0;
    int _2397 = int(_2251) + int(_2361);
    float _2399 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2387);
    float _2401 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2389);
    int _2403 = _2373 * _2397;
    int _2405 = _2403 + _2203;
    bool _2407 = !_2391;
    int _2409 = _2407 ? 0 : (-1);
    float _2411 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2385);
    float _2413 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2399);
    float _2415 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2401);
    bool _2417 = uint(_2405) >= uint(_2163);
    float _2419 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2411);
    int _2421 = ~_2365;
    int _2423 = _2421 + _2409;
    int _2425 = _2423 + 1;
    float _2427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2429 = _2189 ^ _2095;
    float _2431 = _2413 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2433 = _2095 * _2425;
    int _2435 = _2433 + _2189;
    bool _2437 = !_2417;
    int _2439 = _2437 ? 0 : (-1);
    float _2441 = _2415 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2443 = _2095 == 0;
    bool _2445 = _2095 == 0;
    uint _2447 = uint(int(uint(_2429) >> uint(31)));
    float _2449 = _2419 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2451 = ~_2439;
    int _2453 = _2397 + _2451;
    int _2455 = _2453 + 1;
    float _2457 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2459 = -_829;
    int _2461 = _2243 ? as_type<int>(_2459) : as_type<int>(_829);
    float _2463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2465 = ~int(_2447);
    int _2467 = _2465 + 1;
    float _2469 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2471 = !_2197;
    float _2473 = _2471 ? _829 : as_type<float>(_2461);
    float _2475 = _2431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2477 = !_2443;
    int _2479 = _2477 ? _2435 : (-1);
    float _2481 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2483 = _2455 ^ _2467;
    float _2485 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2469);
    float _2487 = _2441 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2489 = _2449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2491 = ~_2467;
    int _2493 = _2491 + _2483;
    int _2495 = _2493 + 1;
    float _2497 = exp2(_2481);
    float _2499 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2485);
    float _2501 = float(_2479);
    float _2503 = _2427 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2505 = !_2445;
    int _2507 = _2505 ? _2495 : (-1);
    float _2509 = _2463 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_60.x = _2475;
    out.m_60.y = _2487;
    out.m_60.z = _2489;
    out.m_60.w = _2457;
    float _2511 = fma(_2503, _2501, _2279);
    float _2513 = float(_2507);
    float _2515 = _2379 + 0.5;
    bool _2517 = _1297 > 0.0;
    bool _2519 = isnan(_1297);
    bool _2521 = _2517 || _2519;
    bool _2523 = isnan(0.0);
    bool _2525 = _2521 || _2523;
    float _2527 = -_2281;
    float _2529 = fma(_2509, _2513, _2527);
    float _2531 = _1297 * _1357;
    float _2533 = fma(_2503, _2515, _2511);
    float _2535 = -_2497;
    float _2537 = _2535 + 1.0;
    bool _2539 = _1357 <= 0.0;
    bool _2541 = !_2525;
    bool _2543 = _2539 || _2541;
    float _2545 = _2531 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2547 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2499);
    float _2549 = _2473 + (-0.5);
    float _2551 = -_2321;
    float _2553 = fma(_2379, _2551, _2533);
    float _2555 = _2545 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2557 = -_2509;
    float _2559 = fma(_2557, _2549, _2529);
    float _2561 = _2547 + _1605;
    out.m_45.x = _2555;
    float _2563 = fma(_2473, _2315, _2559);
    float _2565 = _2537 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2567 = _2561 * 0.5;
    out.gl_Position.x = _1633;
    out.gl_Position.y = _1639;
    out.gl_Position.z = _2547;
    out.gl_Position.w = _1605;
    float _2569 = _2565 * _1669;
    float _2571 = -_2565;
    float _2573 = _2571 + 1.0;
    out.m_62.z = _2567;
    out.m_62.w = _1605;
    float _2575 = _1680 * _2569;
    float _2577 = _1690 * _2569;
    float _2579 = _1680 * _2573;
    out.m_64.x = _2553;
    out.m_64.y = _2563;
    float _2581 = fma(_1686, _2575, _1674);
    float _2583 = fma(_1688, _2575, _1676);
    float _2585 = fma(_1680, _2577, _1678);
    out.m_66.x = _2581;
    out.m_66.y = _2583;
    out.m_66.z = _2585;
    out.m_66.w = _2579;
    if (!_2543)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _2587 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2587;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _739 = false;
    bool _633 = false;
    bool _513 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2643 = as_type<float>(_101);
        out.gl_Position.z = _2643;
    }
    if (!_89)
    {
        return out;
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _95;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    int _133 = 0;
    if (_129)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2711 = as_type<float>(_137);
        out.gl_Position.z = _2711;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _161 = _159 != 0;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _165 = _163 != 0;
    float _167 = _157 * 6.283185482025146484375;
    float _169 = floor(_157);
    float _171 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _167 * 0.15915493667125701904296875;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_161;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _185 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _187 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_155;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    int _199 = abs(_181);
    bool _201 = !_165;
    int _203 = _201 ? 0 : 1;
    float _205 = -_169;
    float _207 = _157 + _205;
    int _209 = abs(_195);
    float _211 = -_207;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _215 = float(_199);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _219 = abs(_203);
    float _221 = fma(_191, 0.5, 0.5);
    float _223 = abs(_213);
    float _225 = _215 * _223;
    bool _227 = _207 < 0.5;
    float _229 = float(_227);
    float _231 = -_221;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_209);
    float _237 = -_229;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_219);
    float _243 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _187);
    float _245 = fma(_235, _233, _225);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _249 = abs(_239);
    float _251 = fma(_241, _249, _245);
    bool _253 = !_217;
    float _255 = _197;
    float _257 = _247;
    float _273;
    if (!_253)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_85);
        float _279 = 1.0 / _277;
        float _281 = _117 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _283 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _283 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _313 = 1.0 / _299;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _317 = 1.0 / _307;
    float _319 = 1.0 / _303;
    float _321 = _295 * _313;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _325 = _283 + _323;
    float _327 = 1.0 / _311;
    float _329 = _287 * _317;
    bool _331 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _333 = isnan(_283);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -_341;
    float _345 = _343 + 1.0;
    float _347 = _291 * _319;
    bool _349 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _351 = isnan(_283);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    bool _361 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _363 = isnan(_283);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -_359;
    float _375 = _373 + 1.0;
    float _377 = _359 * _345;
    bool _379 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_283);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _325 * _327;
    float _393 = _371 * _375;
    float _395 = -_371;
    float _397 = _395 + 1.0;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _399;
    bool _403 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_283);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _419 = _389 * _397;
    float _421 = -_389;
    float _423 = _421 + 1.0;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _425;
    float _429 = fma(_401, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = _413 * _423;
    float _437 = fma(_427, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _439 = -_413;
    float _441 = _439 + 1.0;
    float _443 = fma(_417, _347, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _445 = _429 * _435;
    float _447 = _437 * _435;
    float _449 = fma(_433, _347, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[143].x, _445);
    float _461 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[143].y, _447);
    float _463 = fma(_453, _329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _475 = fma(_443, _419, _459);
    float _477 = fma(_449, _419, _461);
    float _479 = fma(_469, _391, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_473, _391, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _483 = fma(_463, _393, _475);
    float _485 = fma(_465, _393, _477);
    float _487 = fma(_479, _377, _483);
    float _489 = fma(_481, _377, _485);
    float _491 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[147].x, _487);
    float _493 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[147].y, _489);
    bool _495 = !_315;
    float _511;
    if (!_495)
    {
        float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _499 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _503 = _501 * _497;
        float _505 = floor(_503);
        float _507 = -_505;
        float _509 = _503 + _507;
        _511 = _509;
        _513 = true;
    }
    else
    {
        float _515 = float(_85);
        float _517 = 1.0 / _515;
        float _519 = _117 * _517;
        _511 = _519;
    }
    _513 = false;
    float _521 = _511;
    float _523 = in.m_53.x;
    float _525 = in.m_53.y;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _529 = _521 + _527;
    bool _531 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _533 = isnan(_521);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _543;
    bool _547 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _549 = isnan(_521);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -_541;
    float _561 = _559 + 1.0;
    bool _563 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _565 = 1.0 / _545;
    float _567 = _557 * _561;
    float _569 = -_557;
    float _571 = _569 + 1.0;
    float _573 = _493 * _525;
    float _575 = _529 * _565;
    float _577 = _491 * _523;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _587;
    float _591 = fma(_581, _575, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _593 = fma(_585, _575, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _595 = fma(_589, _575, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _597 = _591 * _567;
    float _599 = _593 * _567;
    float _601 = _595 * _567;
    float _603 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[107].y, _597);
    float _605 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[107].x, _599);
    float _607 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[107].z, _601);
    float _609 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[108].y, _603);
    float _611 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[108].x, _605);
    float _613 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[108].z, _607);
    bool _615 = !_563;
    float _631;
    if (!_615)
    {
        float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _619 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _621 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _623 = _621 * _617;
        float _625 = floor(_623);
        float _627 = -_625;
        float _629 = _623 + _627;
        _631 = _629;
        _633 = true;
    }
    else
    {
        float _635 = float(_85);
        float _637 = 1.0 / _635;
        float _639 = _117 * _637;
        _631 = _639;
    }
    _633 = false;
    float _641 = _631;
    bool _643 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _645 = isnan(_641);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _659 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _661 = isnan(_641);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _677 = _641 + _675;
    float _679 = -_653;
    float _681 = _679 + 1.0;
    bool _683 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _685 = 1.0 / _657;
    float _687 = _669 * _681;
    float _689 = -_669;
    float _691 = _689 + 1.0;
    float _693 = _673 * _685;
    float _695 = _613 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _697 = fma(_693, _677, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _699 = _609 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _701 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _697 * _687;
    float _705 = _611 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[115].x, _703);
    float _711 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[116].x, _709);
    float _715 = _713 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _711;
    out.m_55.y = _707;
    out.m_55.z = _701;
    out.m_55.w = _715;
    bool _717 = !_683;
    float _735;
    float _737;
    if (!_717)
    {
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _721 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _723 = float(_85);
        float _725 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _727 = _725 * _719;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _735 = _723;
        _737 = _733;
        _739 = true;
    }
    else
    {
        float _741 = float(_85);
        float _743 = 1.0 / _741;
        float _745 = _117 * _743;
        _735 = _741;
        _737 = _745;
    }
    _739 = false;
    float _747 = _735;
    float _749 = _737;
    float _751 = _247 * _247;
    float _753 = as_type<float>(int(gl_VertexIndex));
    float _755 = _251 * _573;
    float _757 = fma(_197, _197, _751);
    float _759 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _761 = fma(_243, _243, _757);
    float _763 = rsqrt(_761);
    int _765 = as_type<int>(_753) & 1;
    bool _767 = _765 != 0;
    int _769 = as_type<int>(_753) & 2;
    bool _771 = _769 != 0;
    float _773 = _243 * _763;
    float _775 = _197 * _763;
    float _777 = _247 * _763;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _781 = _773 * _779;
    float _783 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _785 = _775 * _783;
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _789 = _777 * _787;
    float _791 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _793 = -_781;
    float _795 = fma(_775, _791, _793);
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _799 = -_785;
    float _801 = fma(_777, _797, _799);
    float _803 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _805 = -_789;
    float _807 = fma(_773, _803, _805);
    float _809 = _795 * _795;
    float _811 = in.m_42.x;
    float _813 = in.m_42.y;
    float _815 = in.m_42.z;
    float _817 = fma(_807, _807, _809);
    float _819 = fma(_801, _801, _817);
    float _821 = _251 * _577;
    bool _823 = !_767;
    float _825 = _823 ? (-0.5) : 0.5;
    bool _827 = !_771;
    float _829 = _827 ? (-0.5) : 0.5;
    float _831 = _821 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _833 = rsqrt(_819);
    float _835 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _825);
    float _837 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _829);
    float _839 = _831 * _835;
    float _841 = _759 * _837;
    float _843 = _813 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _845 = _841 * _773;
    float _847 = _841 * _775;
    float _849 = _841 * _777;
    float _851 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[6].x, _843);
    float _853 = _795 * _833;
    float _855 = _807 * _833;
    float _857 = _801 * _833;
    float _859 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _861 = _775 * _853;
    float _863 = fma(_839, _857, _845);
    float _865 = _777 * _857;
    float _867 = -_861;
    float _869 = fma(_777, _855, _867);
    float _871 = _813 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _873 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[6].z, _851);
    float _875 = -_865;
    float _877 = fma(_773, _853, _875);
    float _879 = fma(_859, _869, _863);
    float _881 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[4].x, _871);
    float _883 = fma(_839, _855, _847);
    float _885 = _873 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _887 = _813 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _889 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[4].z, _881);
    float _891 = fma(_859, _877, _883);
    float _893 = _885 + _879;
    float _895 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[5].x, _887);
    float _897 = _889 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _899 = _773 * _855;
    float _901 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _903 = _893 + _901;
    float _905 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[5].z, _895);
    float _907 = _897 + _891;
    float _909 = fma(_839, _853, _849);
    float _911 = _903 * _903;
    float _913 = -_899;
    float _915 = fma(_775, _857, _913);
    float _917 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _919 = _907 + _917;
    float _921 = _905 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _923 = fma(_859, _915, _909);
    float _925 = fma(_919, _919, _911);
    float _927 = _921 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _929 = _921 + _923;
    float _931 = sqrt(_925);
    float _933 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[11].x, _927);
    float _935 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[11].z, _933);
    bool _937 = _931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _941 = _939 != 0;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _945 = _943 != 0;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _949 = _947 != 0;
    bool _951 = !_945;
    int _953 = _951 ? 0 : 1;
    bool _955 = !_941;
    int _957 = _955 ? 0 : 1;
    bool _959 = !_949;
    int _961 = _959 ? 0 : 1;
    float _963 = _859;
    float _965 = _923;
    float _967 = _849;
    float _969 = _777;
    float _971 = _775;
    float _973 = _773;
    if (!_937)
    {
        _963 = _907;
    }
    float _975 = _963;
    float _977 = _975;
    if (!_937)
    {
        _965 = _893;
    }
    float _979 = _965;
    float _981 = _979;
    if (!_937)
    {
        _967 = _929;
    }
    float _983 = _967;
    bool _985 = !_937;
    float _987 = _983;
    if (!_985)
    {
        float _989 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _991 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _993 = _931 + _991;
        float _995 = rsqrt(_925);
        float _997 = _993 * _989;
        float _999 = _929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1001 = _997 * 0.15915493667125701904296875;
        float _1003 = _1001 * 6.283185482025146484375;
        float _1005 = cos(_1003);
        float _1007 = _1001 * 6.283185482025146484375;
        float _1009 = sin(_1007);
        float _1011 = _1005 + (-1.0);
        float _1013 = fma(_1009, _999, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1015 = _1011 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1017 = _995 * _1013;
        float _1019 = fma(_929, _1005, _1015);
        float _1021 = fma(_919, _1017, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1023 = fma(_903, _1017, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _987 = _1019;
        _977 = _1021;
        _981 = _1023;
    }
    float _1025 = _987;
    float _1027 = _977;
    float _1029 = _981;
    float _1031 = -_921;
    float _1033 = _1031 + _1025;
    float _1035 = _935 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1037 = -_897;
    float _1039 = _1037 + _1027;
    float _1041 = -_885;
    float _1043 = _1041 + _1029;
    float _1045 = _1033 * _1033;
    float _1047 = _921 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1049 = 1.0 / _1035;
    float _1051 = fma(_1039, _1039, _1045);
    float _1053 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1047);
    float _1055 = fma(_1043, _1043, _1051);
    float _1057 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1053);
    bool _1059 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1061 = isnan(0.5);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1067 = _1063 || _1065;
    float _1069 = sqrt(_1055);
    float _1071 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1073 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1075 = isnan(0.5);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1081 = _1077 || _1079;
    float _1083 = _1071 + _1035;
    float _1085 = _1083 * _1049;
    float _1087 = _1085 * 0.5;
    bool _1089 = _1069 > 0.0;
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1093 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1091);
    float _1095 = 1.0 / _1093;
    float _1097 = _1087;
    float _1099 = _1027;
    float _1101 = _1029;
    float _1103 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1105 = _1043;
    if (!_1089)
    {
        _1097 = _1025;
    }
    float _1107 = _1097;
    bool _1109 = !_1089;
    float _1111 = _1107;
    float _1113 = _1107;
    if (!_1109)
    {
        float _1115 = sqrt(_761);
        float _1117 = rsqrt(_1055);
        bool _1119 = _1115 > 0.0;
        float _1121 = _1039 * _1117;
        float _1123 = _1033 * _1117;
        float _1125 = _1043 * _1117;
        _1103 = _1125;
        if (!_1119)
        {
            _1111 = _1025;
        }
        float _1127 = _1111;
        bool _1129 = !_1119;
        _1113 = _1127;
        if (!_1129)
        {
            float _1131 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1133 = _777 * _1123;
            float _1135 = fma(_775, _1121, _1133);
            float _1137 = fma(_773, _1125, _1135);
            float _1139 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1141 = _1137 * _1139;
            float _1143 = fma(_197, _1141, _1027);
            float _1145 = fma(_247, _1141, _1025);
            float _1147 = fma(_243, _1141, _1029);
            _1099 = _1143;
            _1113 = _1145;
            _1101 = _1147;
            _969 = _1137;
        }
    }
    float _1149 = _1099;
    float _1151 = _1113;
    float _1153 = _1101;
    float _1155 = _969;
    float _1157 = _1103;
    float _1159 = _1155;
    float _1161 = _1153;
    float _1163 = _1157;
    if (_1081)
    {
        _971 = 1.0;
    }
    float _1165 = _971;
    float _1167 = _1165;
    if (_1067)
    {
        _255 = _1149;
    }
    float _1169 = _255;
    float _1171 = _1169;
    if (_1067)
    {
        _257 = _1151;
    }
    float _1173 = _257;
    float _1175 = _1173;
    if (!_1067)
    {
        float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1179 = _921 + _1177;
        float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1183 = _897 + _1181;
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1187 = -_897;
        float _1189 = _1187 + _1149;
        float _1191 = _1179 * _1179;
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1195 = _885 + _1193;
        float _1197 = -_885;
        float _1199 = _1197 + _1153;
        float _1201 = fma(_1183, _1183, _1191);
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1205 = fma(_1195, _1195, _1201);
        float _1207 = sqrt(_1205);
        float _1209 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1211 = precise::min(_1207, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1213 = _1211 * _1203;
        float _1215 = -_921;
        float _1217 = _1215 + _1151;
        float _1219 = _1209 * _1213;
        float _1221 = fma(_1189, _1219, _897);
        float _1223 = fma(_1217, _1219, _921);
        float _1225 = fma(_1199, _1219, _885);
        _1159 = _1219;
        _1175 = _1223;
        _1171 = _1221;
        _1161 = _1225;
    }
    float _1227 = _1159;
    float _1229 = _1175;
    float _1231 = _1171;
    float _1233 = _1161;
    float _1235 = _1227;
    if (_1081)
    {
        _1235 = 1.0;
    }
    float _1237 = _1235;
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1241 = _1095 * _1239;
    float _1243 = _1237;
    if (!_1081)
    {
        float _1245 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1247 = _1245 * 0.15915493667125701904296875;
        float _1249 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1253 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1251;
        float _1255 = _1247 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        float _1259 = _1249 * 0.15915493667125701904296875;
        float _1261 = _1247 * 6.283185482025146484375;
        float _1263 = sin(_1261);
        float _1265 = 1.0 / _1257;
        float _1267 = _1259 * 6.283185482025146484375;
        float _1269 = cos(_1267);
        float _1271 = _1263 * _1265;
        float _1273 = _1259 * 6.283185482025146484375;
        float _1275 = sin(_1273);
        float _1277 = _1269 * _1271;
        float _1279 = 1.0 / _1253;
        float _1281 = 1.0 / _1277;
        float _1283 = _1275 * _1281;
        float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1287 = fma(_1241, _1283, _1285);
        float _1289 = _1287 * _1279;
        float _1291 = precise::clamp(_1289, 0.0, 1.0);
        _1163 = _1279;
        _973 = _1253;
        _1167 = _1291;
    }
    float _1293 = _1163;
    float _1295 = _973;
    float _1297 = _1167;
    float _1299 = _1295;
    float _1301 = _1293;
    if (!_1081)
    {
        float _1303 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1305 = _1303 * 0.15915493667125701904296875;
        float _1307 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1309 = _1305 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        float _1313 = _1307 * 0.15915493667125701904296875;
        float _1315 = _1305 * 6.283185482025146484375;
        float _1317 = sin(_1315);
        float _1319 = 1.0 / _1311;
        float _1321 = _1313 * 6.283185482025146484375;
        float _1323 = cos(_1321);
        float _1325 = _1317 * _1319;
        float _1327 = _1313 * 6.283185482025146484375;
        float _1329 = sin(_1327);
        float _1331 = _1323 * _1325;
        float _1333 = 1.0 / _1331;
        float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1337 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1335;
        float _1339 = 1.0 / _1337;
        float _1341 = _1329 * _1333;
        float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1345 = fma(_1241, _1341, _1343);
        float _1347 = _1345 * _1339;
        float _1349 = precise::clamp(_1347, 0.0, 1.0);
        float _1351 = -_1349;
        float _1353 = _1351 + 1.0;
        _1299 = _1333;
        _1243 = _1353;
    }
    float _1355 = _1299;
    float _1357 = _1243;
    float _1359 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1361 = _1229 + _1359;
    float _1363 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1365 = _1231 + _1363;
    float _1367 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1369 = _1233 + _1367;
    float _1371 = _1361 * _1361;
    float _1373 = fma(_1365, _1365, _1371);
    float _1375 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1377 = fma(_1369, _1369, _1373);
    float _1379 = rsqrt(_1377);
    float _1381 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1383 = _1365 * _1381;
    float _1385 = _1369 * _1381;
    float _1387 = _1383 * _1383;
    float _1389 = _1385 * _1385;
    float _1391 = _1387 + _1389;
    float _1393 = sqrt(_1391);
    bool _1395 = _1393 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1397 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1399 = _1393 + _1397;
    float _1401 = _1379;
    float _1403 = _1391;
    float _1405 = _1399;
    float _1407 = _1361;
    float _1409 = _1383;
    if (_1395)
    {
        float _1411 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1411;
    }
    float _1413 = _1401;
    if (_1395)
    {
        float _1415 = rsqrt(_1391);
        _1403 = _1415;
    }
    float _1417 = _1403;
    if (_1395)
    {
        float _1419 = _1399 * _1413;
        _1405 = _1419;
    }
    float _1421 = _1405;
    if (_1395)
    {
        float _1423 = _1421 * 0.15915493667125701904296875;
        _1301 = _1423;
    }
    float _1425 = _1301;
    float _1427 = _1369;
    if (_1395)
    {
        float _1429 = _1425 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        _1427 = _1431;
    }
    float _1433 = _1427;
    float _1435 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1437 = precise::max(0.0, _1435);
    float _1439 = _1355;
    float _1441 = _1437;
    float _1443 = _1435;
    if (_1395)
    {
        float _1445 = _1425 * 6.283185482025146484375;
        float _1447 = cos(_1445);
        _1439 = _1447;
    }
    float _1449 = _1439;
    float _1451 = -_1381;
    float _1453 = -_1437;
    float _1455 = fma(_1361, _1451, _1453);
    if (_1395)
    {
        float _1457 = _1455 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1441 = _1457;
    }
    float _1459 = _1441;
    float _1461 = _1433;
    float _1463 = _1459;
    if (_1395)
    {
        float _1465 = fma(_1433, _1459, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1461 = _1465;
    }
    float _1467 = _1461;
    float _1469 = _1467;
    if (!_1395)
    {
        _1463 = _1455;
    }
    float _1471 = _1463;
    float _1473 = _1471;
    if (_1395)
    {
        float _1475 = _1449 + (-1.0);
        _1443 = _1475;
    }
    float _1477 = _1443;
    float _1479 = _1477;
    if (_1395)
    {
        float _1481 = _1417 * _1467;
        _1105 = _1481;
    }
    float _1483 = _1105;
    if (!_1395)
    {
        _1469 = _1385;
    }
    float _1485 = _1469;
    float _1487 = sqrt(_1377);
    float _1489 = _1485;
    if (_1395)
    {
        float _1491 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1407 = _1491;
    }
    float _1493 = _1407;
    float _1495 = _1493;
    if (_1395)
    {
        float _1497 = _1383 * _1483;
        _1409 = _1497;
    }
    float _1499 = _1409;
    if (!_1395)
    {
        _1479 = _1387;
    }
    float _1501 = _1479;
    float _1503 = _1501;
    if (_1395)
    {
        float _1505 = _1385 * _1483;
        _1489 = _1505;
    }
    float _1507 = _1489;
    if (_1395)
    {
        float _1509 = fma(_1455, _1449, _1493);
        _1473 = _1509;
    }
    float _1511 = _1473;
    if (_1395)
    {
        float _1513 = _1499 * _1499;
        _1503 = _1513;
    }
    float _1515 = _1503;
    if (!_1395)
    {
        _1495 = _1389;
    }
    float _1517 = _1495;
    float _1519 = _1517;
    if (_1395)
    {
        float _1521 = _1507 * _1507;
        _1519 = _1521;
    }
    float _1523 = _1519;
    float _1525 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1527 = fma(_1511, _1511, _1515);
    float _1529 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1531 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1525);
    float _1533 = _1527 + _1523;
    float _1535 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1529);
    float _1537 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1541 = fma(_1487, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1539);
    float _1543 = precise::clamp(_1541, 0.0, 1.0);
    float _1545 = rsqrt(_1533);
    float _1547 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1549 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1537);
    float _1551 = -_1543;
    float _1553 = _1551 + 1.0;
    float _1555 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1535);
    float _1557 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1547);
    float _1559 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1549);
    float _1561 = abs(_1553);
    float _1563 = log2(_1561);
    float _1565 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1557);
    float _1567 = _1559 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1569 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1571 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1531);
    float _1573 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1575 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1577 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1579 = _1545 * _1499;
    float _1581 = _1545 * _1511;
    float _1583 = _1545 * _1507;
    float _1585 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1575);
    float _1587 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1589 = _1571 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1591 = -_1577;
    float _1593 = fma(_1591, _1375, 1.0);
    float _1595 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1585);
    float _1597 = -_1587;
    float _1599 = fma(_1581, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1597);
    float _1601 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1603 = log2(_1593);
    float _1605 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1595);
    float _1607 = -_1583;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1599);
    float _1611 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1613 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1615 = fma(_1609, -0.5, 0.5);
    float _1617 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1611);
    float _1619 = exp2(_1601);
    float _1621 = fma(_1609, 0.5, 0.5);
    float _1623 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1613);
    float _1625 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1617);
    float _1627 = _1581 + 1.0;
    float _1629 = fma(_1621, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1631 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1623);
    float _1633 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1625);
    float _1635 = 1.0 / _1605;
    float _1637 = fma(_1621, _1629, -0.212114393711090087890625);
    float _1639 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1631);
    float _1641 = _1603 * 0.693147182464599609375;
    float _1643 = fma(_1621, _1637, 1.570728778839111328125);
    float _1645 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1647 = sqrt(_1615);
    float _1649 = -_1581;
    float _1651 = fma(_1619, _1627, _1649);
    float _1653 = fma(_1651, 0.5, 0.5);
    float _1655 = _1633 * _1635;
    float _1657 = _1639 * _1635;
    float _1659 = fma(_1655, 0.5, 0.5);
    float _1661 = fma(_1657, -0.5, 0.5);
    float _1663 = _1647 * 0.636619746685028076171875;
    float _1665 = -_1643;
    float _1667 = fma(_1663, _1665, 1.0);
    float3 _5102 = float3(_1659, _1661, _1645);
    float _1669 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5102, float3(0.0), isnan(_5102)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5102, float3(0.0), isnan(_5102)), level(0.0)).x;
    float3 _5113 = float3(_1659, _1661, _1645);
    float4 _1672 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5113, float3(0.0), isnan(_5113)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5113, float3(0.0), isnan(_5113)), level(0.0)).xyzw;
    float _1674 = _1672.x;
    float _1676 = _1672.y;
    float _1678 = _1672.z;
    float _1680 = _1672.w;
    float2 _5130 = float2(_1667, _1653);
    float3 _1684 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5130, float2(0.0), isnan(_5130)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5130, float2(0.0), isnan(_5130)), level(0.0)).xyz;
    float _1686 = _1684.x;
    float _1688 = _1684.y;
    float _1690 = _1684.z;
    float _1692 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1694 = int(_1692);
    int _1696 = abs(_953);
    float _1698 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1700 = int(_1698);
    float _1702 = float(_1694);
    float _1704 = 1.0 / _747;
    float _1706 = float(uint(_1700));
    float _1708 = 1.0 / _1702;
    int _1710 = ~_1700;
    int _1712 = _1710 + 1;
    int _1714 = ~_1700;
    int _1716 = _1714 + 1;
    int _1718 = _1700 + (-1);
    float _1720 = 1.0 / _1706;
    float _1722 = _117 * _1708;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1726 = _1724 != 0;
    float _1728 = trunc(_1722);
    int _1730 = int(_1728);
    int _1732 = as_type<int>(_1720) + (-2);
    bool _1734 = !_1726;
    float _1736 = _1734 ? 7.345489978790283203125 : 1.0;
    float _1738 = _1736 * _139;
    float _1740 = float(uint(_1730));
    float _1742 = as_type<float>(_1732) * _1740;
    float _1744 = trunc(_1742);
    float _1746 = precise::max(_1744, 0.0);
    uint _1749 = uint(_1746);
    float _1751 = float(_1700);
    int _1753 = _1712 * int(_1749);
    int _1755 = _1753 + _1730;
    float _1757 = float(uint(_1755));
    float _1759 = as_type<float>(_1732) * _1757;
    float _1761 = floor(_1738);
    float _1763 = trunc(_1759);
    float _1765 = precise::max(_1763, 0.0);
    uint _1767 = uint(_1765);
    float _1769 = -_1761;
    float _1771 = _1738 + _1769;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1775 = _1773 != 0;
    int _1777 = int(_1749) + int(_1767);
    float _1779 = float(_1730);
    int _1781 = _1716 * _1777;
    int _1783 = _1781 + _1730;
    bool _1785 = _1779 >= _1751;
    bool _1787 = isnan(_1779);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan(_1751);
    bool _1793 = _1789 || _1791;
    float _1795 = float(_1793);
    bool _1797 = uint(_1783) >= uint(_1700);
    float _1799 = _1771 * _1751;
    float _1801 = trunc(_1795);
    int _1803 = int(_1801);
    float _1805 = _117 * _1751;
    bool _1807 = !_1797;
    int _1809 = _1807 ? 0 : (-1);
    bool _1811 = _1700 == 0;
    float _1813 = _1805 * _1704;
    int _1815 = ~_1777;
    int _1817 = _1815 + _1809;
    int _1819 = _1817 + 1;
    float _1821 = trunc(_1799);
    int _1823 = int(_1821);
    bool _1825 = !_1775;
    int _1827 = _1825 ? 0 : 1;
    int _1829 = _1700 * _1819;
    int _1831 = _1829 + _1730;
    int _1833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1835 = _1833 != 0;
    int _1837 = abs(_1827);
    int _1839 = ~_1803;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    float _1845 = trunc(_1813);
    int _1847 = int(_1845);
    bool _1849 = !_1811;
    int _1851 = _1849 ? _1831 : (-1);
    bool _1853 = !_1835;
    int _1855 = _1853 ? 0 : 1;
    int _1857 = _1851 * _1843;
    int _1859 = ~_1700;
    int _1861 = _1859 + 1;
    int _1863 = _1803 * _1718;
    int _1865 = _1863 + _1857;
    int _1867 = abs(_957);
    int _1869 = _1865 * _1696;
    int _1871 = abs(_961);
    int _1873 = _1823 * _1837;
    int _1875 = _1873 + _1730;
    int _1877 = abs(_1855);
    int _1879 = _1847 * _1867;
    int _1881 = _1879 + _1869;
    int _1883 = ~_1700;
    int _1885 = _1883 + 1;
    int _1887 = _1875 * _1871;
    int _1889 = _1887 + _1881;
    int _1891 = ~_1700;
    int _1893 = _1891 + 1;
    int _1895 = _1823 * _1877;
    int _1897 = _1895 + _1889;
    float _1899 = float(uint(_1897));
    float _1901 = as_type<float>(_1732) * _1899;
    float _1903 = trunc(_1901);
    float _1905 = precise::max(_1903, 0.0);
    uint _1907 = uint(_1905);
    int _1909 = _1893 * int(_1907);
    int _1911 = _1909 + _1897;
    float _1913 = float(uint(_1911));
    int _1915 = ~_1700;
    int _1917 = _1915 + 1;
    float _1919 = as_type<float>(_1732) * _1913;
    float _1921 = trunc(_1919);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    int _1927 = int(_1907) + int(_1925);
    int _1929 = _1885 * _1927;
    int _1931 = _1929 + _1897;
    bool _1933 = uint(_1931) >= uint(_1700);
    float _1935 = float(uint(_1875));
    bool _1937 = !_1933;
    int _1939 = _1937 ? 0 : (-1);
    float _1941 = as_type<float>(_1732) * _1935;
    int _1943 = ~_1927;
    int _1945 = _1943 + _1939;
    int _1947 = _1945 + 1;
    float _1949 = trunc(_1941);
    float _1951 = precise::max(_1949, 0.0);
    uint _1953 = uint(_1951);
    int _1955 = _1700 * _1947;
    int _1957 = _1955 + _1897;
    bool _1959 = !_1811;
    int _1961 = _1959 ? _1957 : (-1);
    int _1963 = _1961 >> 31;
    int _1965 = _1961 & 3;
    bool _1967 = _1965 != 0;
    int _1969 = _1963 & 3;
    int _1971 = _1917 * int(_1953);
    int _1973 = _1971 + _1875;
    int _1975 = _1961 + _1969;
    float _1977 = float(uint(_1973));
    int _1979 = _1975 >> 2;
    float _1981 = as_type<float>(_1732) * _1977;
    int _1983 = _1979 << 4;
    int _1985 = _1983 + 368;
    int _1987 = _1961 & 3;
    bool _1989 = _1987 != 0;
    uint _1991 = uint(int(uint(_1985) >> uint(2)));
    uint _1993 = uint(int(uint(int(_1991)) >> uint(2)));
    int _1995 = int(_1991) & 3;
    float _1997 = (*spvDescriptorSet0.vp_c9)._m0[int(_1993)][_1995];
    int _1999 = int(_1991) + 1;
    uint _2001 = uint(int(uint(_1999) >> uint(2)));
    int _2003 = _1999 & 3;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[int(_2001)][_2003];
    float _2007 = trunc(_1981);
    float _2009 = precise::max(_2007, 0.0);
    uint _2011 = uint(_2009);
    bool _2013 = uint(_1987) > 1u;
    int _2015 = _1967 ? 0 : 1;
    bool _2017 = _1987 != 3;
    int _2019 = _1985 + 8;
    uint _2021 = uint(int(uint(_2019) >> uint(2)));
    uint _2023 = uint(int(uint(int(_2021)) >> uint(2)));
    int _2025 = int(_2021) & 3;
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[int(_2023)][_2025];
    int _2029 = int(_2021) + 1;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    int _2033 = _2029 & 3;
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[int(_2031)][_2033];
    bool _2037 = uint(_1987) >= 2u;
    int _2039 = int(_1953) + int(_2011);
    int _2041 = ~_2015;
    int _2043 = _2041 + 1;
    int _2045 = _2043 + 1;
    int _2047 = _2045;
    if (!_2013)
    {
        int _2049 = ~_2015;
        int _2051 = _2049 + 1;
        _2047 = _2051;
    }
    int _2053 = _2047;
    int _2055 = _1861 * _2039;
    int _2057 = _2055 + _1875;
    bool _2059 = !_1989;
    int _2061 = _2059 ? 0 : 1;
    int _2063 = _2037 ? 0 : 1;
    bool _2065 = uint(_2057) >= uint(_1700);
    bool _2067 = _1987 != 3;
    bool _2069 = !_2065;
    int _2071 = _2069 ? 0 : (-1);
    int _2073 = ~_2063;
    int _2075 = _2073 + 1;
    int _2077 = _2075 + 1;
    int _2079 = ~_2039;
    int _2081 = _2079 + _2071;
    int _2083 = _2081 + 1;
    int _2085 = abs(_2053);
    int _2087 = abs(_2061);
    int _2089 = _1700 * _2083;
    int _2091 = _2089 + _1875;
    float _2093 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2095 = int(_2093);
    int _2097 = _2077;
    if (_2017)
    {
        int _2099 = ~_2063;
        int _2101 = _2099 + 1;
        _2097 = _2101;
    }
    int _2103 = _2097;
    int _2105 = ~_2085;
    int _2107 = _2105 + 1;
    int _2109 = _2107 + 1;
    int _2111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2113 = _2111 != 0;
    bool _2115 = !_2067;
    int _2117 = _2115 ? 0 : (-1);
    int _2119 = _2109 * as_type<int>(_2005);
    int _2121 = ~_2087;
    int _2123 = _2121 + 1;
    int _2125 = _2123 + 1;
    int _2127 = abs(_2103);
    bool _2129 = !_2113;
    int _2131 = _2129 ? 0 : 1;
    int _2133 = _2125 * as_type<int>(_1997);
    int _2135 = _2133 + _2119;
    int _2137 = abs(_2117);
    int _2139 = ~_2127;
    int _2141 = _2139 + 1;
    int _2143 = _2141 + 1;
    int _2145 = abs(_2131);
    float _2147 = in.m_49.y;
    int _2149 = _2143 * as_type<int>(_2027);
    int _2151 = _2149 + _2135;
    float _2153 = float(uint(_2095));
    int _2155 = ~_2137;
    int _2157 = _2155 + 1;
    int _2159 = _2157 + 1;
    float _2161 = 1.0 / _2153;
    int _2163 = abs(_2095);
    int _2165 = ~_2145;
    int _2167 = _2165 + 1;
    int _2169 = _2167 + 1;
    int _2171 = _2159 * as_type<int>(_2035);
    int _2173 = _2171 + _2151;
    float _2175 = float(uint(_2163));
    float _2177 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2179 = !_1811;
    int _2181 = _2179 ? _2091 : (-1);
    int _2183 = _2173 * _2169;
    float _2185 = 1.0 / _2175;
    int _2187 = _2181 * _2145;
    int _2189 = _2187 + _2183;
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2193 = _2191 != 0;
    int _2195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2197 = _2195 != 0;
    int _2199 = as_type<int>(_2161) + (-2);
    float _2201 = float(uint(_2189));
    int _2203 = abs(_2189);
    float _2205 = as_type<float>(_2199) * _2201;
    float _2207 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2209 = as_type<int>(_2185) + (-2);
    float _2211 = -_2207;
    float _2213 = fma(_2177, 2.0, _2211);
    float _2215 = float(uint(_2203));
    float _2217 = trunc(_2205);
    float _2219 = precise::max(_2217, 0.0);
    uint _2221 = uint(_2219);
    float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2223;
    float _2227 = as_type<float>(_2209) * _2215;
    int _2229 = ~_2095;
    int _2231 = _2229 + 1;
    float _2233 = 1.0 / _2225;
    float _2235 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2237 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2239 = _2147 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2241 = _139 > 0.5;
    bool _2243 = _2147 > 0.5;
    float _2245 = fma(_2239, -2.0, _2237);
    float _2247 = trunc(_2227);
    float _2249 = precise::max(_2247, 0.0);
    uint _2251 = uint(_2249);
    float _2253 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2235);
    int _2255 = _2231 * int(_2221);
    int _2257 = _2255 + _2189;
    int _2259 = ~_2163;
    int _2261 = _2259 + 1;
    float _2263 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2265 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2267 = _749 + _2265;
    float _2269 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2253);
    float _2271 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2263);
    float _2273 = float(uint(_2257));
    float _2275 = _2267 * _2233;
    float _2277 = -_117;
    float _2279 = fma(_2277, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2213);
    float _2281 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2245);
    int _2283 = ~_2095;
    int _2285 = _2283 + 1;
    float _2287 = as_type<float>(_2199) * _2273;
    float _2289 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2271);
    int _2291 = _2261 * int(_2251);
    int _2293 = _2291 + _2203;
    float _2295 = trunc(_2287);
    float _2297 = precise::max(_2295, 0.0);
    uint _2299 = uint(_2297);
    bool _2301 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2303 = isnan(_749);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    float _2313 = -_2289;
    float _2315 = _2313 + 1.0;
    float _2317 = float(uint(_2293));
    float _2319 = -_2269;
    float _2321 = _2319 + 1.0;
    bool _2323 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2325 = isnan(_749);
    bool _2327 = _2323 || _2325;
    bool _2329 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2331 = _2327 || _2329;
    float _2333 = float(_2331);
    float _2335 = as_type<float>(_2209) * _2317;
    float _2337 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2339 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2337;
    float _2341 = -_2311;
    float _2343 = _2341 + 1.0;
    float _2345 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2347 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2345;
    float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2351 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2349;
    float _2353 = -_825;
    int _2355 = _2241 ? as_type<int>(_2353) : as_type<int>(_825);
    float _2357 = trunc(_2335);
    float _2359 = precise::max(_2357, 0.0);
    uint _2361 = uint(_2359);
    float _2363 = _2333 * _2343;
    int _2365 = int(_2221) + int(_2299);
    float _2367 = fma(_2339, _2275, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2369 = fma(_2351, _2275, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _2371 = ~_2163;
    int _2373 = _2371 + 1;
    float _2375 = fma(_2347, _2275, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _2377 = !_2193;
    float _2379 = _2377 ? _825 : as_type<float>(_2355);
    int _2381 = _2285 * _2365;
    int _2383 = _2381 + _2189;
    float _2385 = _2367 * _2363;
    float _2387 = _2369 * _2363;
    float _2389 = _2375 * _2363;
    bool _2391 = uint(_2383) >= uint(_2095);
    float _2393 = -_2333;
    float _2395 = _2393 + 1.0;
    int _2397 = int(_2251) + int(_2361);
    float _2399 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2387);
    float _2401 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2389);
    int _2403 = _2373 * _2397;
    int _2405 = _2403 + _2203;
    bool _2407 = !_2391;
    int _2409 = _2407 ? 0 : (-1);
    float _2411 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2385);
    float _2413 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2399);
    float _2415 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2401);
    bool _2417 = uint(_2405) >= uint(_2163);
    float _2419 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2411);
    int _2421 = ~_2365;
    int _2423 = _2421 + _2409;
    int _2425 = _2423 + 1;
    float _2427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2429 = _2189 ^ _2095;
    float _2431 = _2413 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2433 = _2095 * _2425;
    int _2435 = _2433 + _2189;
    bool _2437 = !_2417;
    int _2439 = _2437 ? 0 : (-1);
    float _2441 = _2415 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2443 = _2095 == 0;
    bool _2445 = _2095 == 0;
    uint _2447 = uint(int(uint(_2429) >> uint(31)));
    float _2449 = _2419 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2451 = ~_2439;
    int _2453 = _2397 + _2451;
    int _2455 = _2453 + 1;
    float _2457 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2459 = -_829;
    int _2461 = _2243 ? as_type<int>(_2459) : as_type<int>(_829);
    float _2463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2465 = ~int(_2447);
    int _2467 = _2465 + 1;
    float _2469 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2471 = !_2197;
    float _2473 = _2471 ? _829 : as_type<float>(_2461);
    float _2475 = _2431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2477 = !_2443;
    int _2479 = _2477 ? _2435 : (-1);
    float _2481 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2483 = _2455 ^ _2467;
    float _2485 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2469);
    float _2487 = _2441 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2489 = _2449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2491 = ~_2467;
    int _2493 = _2491 + _2483;
    int _2495 = _2493 + 1;
    float _2497 = exp2(_2481);
    float _2499 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2485);
    float _2501 = float(_2479);
    float _2503 = _2427 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2505 = !_2445;
    int _2507 = _2505 ? _2495 : (-1);
    float _2509 = _2463 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_60.x = _2475;
    out.m_60.y = _2487;
    out.m_60.z = _2489;
    out.m_60.w = _2457;
    float _2511 = fma(_2503, _2501, _2279);
    float _2513 = float(_2507);
    float _2515 = _2379 + 0.5;
    bool _2517 = _1297 > 0.0;
    bool _2519 = isnan(_1297);
    bool _2521 = _2517 || _2519;
    bool _2523 = isnan(0.0);
    bool _2525 = _2521 || _2523;
    float _2527 = -_2281;
    float _2529 = fma(_2509, _2513, _2527);
    float _2531 = _1297 * _1357;
    float _2533 = fma(_2503, _2515, _2511);
    float _2535 = -_2497;
    float _2537 = _2535 + 1.0;
    bool _2539 = _1357 <= 0.0;
    bool _2541 = !_2525;
    bool _2543 = _2539 || _2541;
    float _2545 = _2531 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2547 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2499);
    float _2549 = _2473 + (-0.5);
    float _2551 = -_2321;
    float _2553 = fma(_2379, _2551, _2533);
    float _2555 = _2545 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2557 = -_2509;
    float _2559 = fma(_2557, _2549, _2529);
    float _2561 = _2547 + _1605;
    out.m_45.x = _2555;
    float _2563 = fma(_2473, _2315, _2559);
    float _2565 = _2537 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2567 = _2561 * 0.5;
    out.gl_Position.x = _1633;
    out.gl_Position.y = _1639;
    out.gl_Position.z = _2547;
    out.gl_Position.w = _1605;
    float _2569 = _2565 * _1669;
    float _2571 = -_2565;
    float _2573 = _2571 + 1.0;
    out.m_62.z = _2567;
    out.m_62.w = _1605;
    float _2575 = _1680 * _2569;
    float _2577 = _1690 * _2569;
    float _2579 = _1680 * _2573;
    out.m_64.x = _2553;
    out.m_64.y = _2563;
    float _2581 = fma(_1686, _2575, _1674);
    float _2583 = fma(_1688, _2575, _1676);
    float _2585 = fma(_1680, _2577, _1678);
    out.m_66.x = _2581;
    out.m_66.y = _2583;
    out.m_66.z = _2585;
    out.m_66.w = _2579;
    if (!_2543)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _2587 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2587;
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
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _739 = false;
    bool _633 = false;
    bool _513 = false;
    bool _275 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_42.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_45.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2643 = as_type<float>(_101);
        out.gl_Position.z = _2643;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _103 = in.m_47.w;
    bool _105 = _103 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _107 = isnan(_103);
    bool _109 = _105 || _107;
    bool _111 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _113 = _109 || _111;
    float _115 = -_103;
    float _117 = _115 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _119 = 0.0;
    if (_113)
    {
        float _121 = float(_85);
        _119 = _121;
    }
    float _123 = _119;
    bool _125 = _117 >= _123;
    bool _127 = !_113;
    bool _129 = _125 || _127;
    if (_129)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _131 = _95;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    int _133 = 0;
    if (_129)
    {
        float _135 = _131 * 5.0;
        _133 = as_type<int>(_135);
    }
    int _137 = _133;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2711 = as_type<float>(_137);
        out.gl_Position.z = _2711;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _117 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = in.m_51.x;
    float _147 = in.m_51.y;
    float _149 = in.m_51.z;
    float _151 = _143 * _141;
    int _153 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _155 = _153 != 0;
    float _157 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _151);
    int _159 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _161 = _159 != 0;
    int _163 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _165 = _163 != 0;
    float _167 = _157 * 6.283185482025146484375;
    float _169 = floor(_157);
    float _171 = _147 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _173 = _147 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _175 = _167 * 0.15915493667125701904296875;
    float _177 = _147 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _179 = !_161;
    int _181 = _179 ? 0 : 1;
    float _183 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[4].x, _171);
    float _185 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[5].x, _173);
    float _187 = fma(_145, (*spvDescriptorSet0.vp_c10)._m0[6].x, _177);
    float _189 = _175 * 6.283185482025146484375;
    float _191 = cos(_189);
    bool _193 = !_155;
    int _195 = _193 ? 0 : 1;
    float _197 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[4].z, _183);
    int _199 = abs(_181);
    bool _201 = !_165;
    int _203 = _201 ? 0 : 1;
    float _205 = -_169;
    float _207 = _157 + _205;
    int _209 = abs(_195);
    float _211 = -_207;
    float _213 = fma(_211, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _215 = float(_199);
    bool _217 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _219 = abs(_203);
    float _221 = fma(_191, 0.5, 0.5);
    float _223 = abs(_213);
    float _225 = _215 * _223;
    bool _227 = _207 < 0.5;
    float _229 = float(_227);
    float _231 = -_221;
    float _233 = fma(_231, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _235 = float(_209);
    float _237 = -_229;
    float _239 = fma(_237, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _241 = float(_219);
    float _243 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[6].z, _187);
    float _245 = fma(_235, _233, _225);
    float _247 = fma(_149, (*spvDescriptorSet0.vp_c10)._m0[5].z, _185);
    float _249 = abs(_239);
    float _251 = fma(_241, _249, _245);
    bool _253 = !_217;
    float _255 = _197;
    float _257 = _247;
    float _273;
    if (!_253)
    {
        float _259 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _261 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _263 = fma(_261, (*spvDescriptorSet0.vp_c9)._m0[12].x, _117);
        float _265 = _263 * _259;
        float _267 = floor(_265);
        float _269 = -_267;
        float _271 = _265 + _269;
        _273 = _271;
        _275 = true;
    }
    else
    {
        float _277 = float(_85);
        float _279 = 1.0 / _277;
        float _281 = _117 * _279;
        _273 = _281;
    }
    _275 = false;
    float _283 = _273;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _287 = _283 + _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _291 = _283 + _289;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _295 = _283 + _293;
    float _297 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _299 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _297;
    float _301 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _303 = _301 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _307 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _311 = _309 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _313 = 1.0 / _299;
    bool _315 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _317 = 1.0 / _307;
    float _319 = 1.0 / _303;
    float _321 = _295 * _313;
    float _323 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _325 = _283 + _323;
    float _327 = 1.0 / _311;
    float _329 = _287 * _317;
    bool _331 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _333 = isnan(_283);
    bool _335 = _331 || _333;
    bool _337 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _339 = _335 || _337;
    float _341 = float(_339);
    float _343 = -_341;
    float _345 = _343 + 1.0;
    float _347 = _291 * _319;
    bool _349 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _351 = isnan(_283);
    bool _353 = _349 || _351;
    bool _355 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _357 = _353 || _355;
    float _359 = float(_357);
    bool _361 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _363 = isnan(_283);
    bool _365 = _361 || _363;
    bool _367 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _369 = _365 || _367;
    float _371 = float(_369);
    float _373 = -_359;
    float _375 = _373 + 1.0;
    float _377 = _359 * _345;
    bool _379 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _381 = isnan(_283);
    bool _383 = _379 || _381;
    bool _385 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _387 = _383 || _385;
    float _389 = float(_387);
    float _391 = _325 * _327;
    float _393 = _371 * _375;
    float _395 = -_371;
    float _397 = _395 + 1.0;
    float _399 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _401 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _399;
    bool _403 = _283 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _405 = isnan(_283);
    bool _407 = _403 || _405;
    bool _409 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _411 = _407 || _409;
    float _413 = float(_411);
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _417 = _415 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _419 = _389 * _397;
    float _421 = -_389;
    float _423 = _421 + 1.0;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _427 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _425;
    float _429 = fma(_401, _321, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _431 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _433 = _431 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _435 = _413 * _423;
    float _437 = fma(_427, _321, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _439 = -_413;
    float _441 = _439 + 1.0;
    float _443 = fma(_417, _347, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _445 = _429 * _435;
    float _447 = _437 * _435;
    float _449 = fma(_433, _347, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _457 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _455;
    float _459 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[143].x, _445);
    float _461 = fma(_441, (*spvDescriptorSet0.vp_c9)._m0[143].y, _447);
    float _463 = fma(_453, _329, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _465 = fma(_457, _329, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _469 = _467 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _471 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _473 = _471 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _475 = fma(_443, _419, _459);
    float _477 = fma(_449, _419, _461);
    float _479 = fma(_469, _391, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _481 = fma(_473, _391, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _483 = fma(_463, _393, _475);
    float _485 = fma(_465, _393, _477);
    float _487 = fma(_479, _377, _483);
    float _489 = fma(_481, _377, _485);
    float _491 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[147].x, _487);
    float _493 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[147].y, _489);
    bool _495 = !_315;
    float _511;
    if (!_495)
    {
        float _497 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _499 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _501 = fma(_499, (*spvDescriptorSet0.vp_c9)._m0[11].x, _117);
        float _503 = _501 * _497;
        float _505 = floor(_503);
        float _507 = -_505;
        float _509 = _503 + _507;
        _511 = _509;
        _513 = true;
    }
    else
    {
        float _515 = float(_85);
        float _517 = 1.0 / _515;
        float _519 = _117 * _517;
        _511 = _519;
    }
    _513 = false;
    float _521 = _511;
    float _523 = in.m_53.x;
    float _525 = in.m_53.y;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _529 = _521 + _527;
    bool _531 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _533 = isnan(_521);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _543;
    bool _547 = _521 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _549 = isnan(_521);
    bool _551 = _547 || _549;
    bool _553 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _555 = _551 || _553;
    float _557 = float(_555);
    float _559 = -_541;
    float _561 = _559 + 1.0;
    bool _563 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _565 = 1.0 / _545;
    float _567 = _557 * _561;
    float _569 = -_557;
    float _571 = _569 + 1.0;
    float _573 = _493 * _525;
    float _575 = _529 * _565;
    float _577 = _491 * _523;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _581 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _579;
    float _583 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _585 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _583;
    float _587 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _589 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _587;
    float _591 = fma(_581, _575, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _593 = fma(_585, _575, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _595 = fma(_589, _575, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _597 = _591 * _567;
    float _599 = _593 * _567;
    float _601 = _595 * _567;
    float _603 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[107].y, _597);
    float _605 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[107].x, _599);
    float _607 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[107].z, _601);
    float _609 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[108].y, _603);
    float _611 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[108].x, _605);
    float _613 = fma(_541, (*spvDescriptorSet0.vp_c9)._m0[108].z, _607);
    bool _615 = !_563;
    float _631;
    if (!_615)
    {
        float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _619 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _621 = fma(_619, (*spvDescriptorSet0.vp_c9)._m0[11].y, _117);
        float _623 = _621 * _617;
        float _625 = floor(_623);
        float _627 = -_625;
        float _629 = _623 + _627;
        _631 = _629;
        _633 = true;
    }
    else
    {
        float _635 = float(_85);
        float _637 = 1.0 / _635;
        float _639 = _117 * _637;
        _631 = _639;
    }
    _633 = false;
    float _641 = _631;
    bool _643 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _645 = isnan(_641);
    bool _647 = _643 || _645;
    bool _649 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _651 = _647 || _649;
    float _653 = float(_651);
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _659 = _641 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _661 = isnan(_641);
    bool _663 = _659 || _661;
    bool _665 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _667 = _663 || _665;
    float _669 = float(_667);
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _677 = _641 + _675;
    float _679 = -_653;
    float _681 = _679 + 1.0;
    bool _683 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _685 = 1.0 / _657;
    float _687 = _669 * _681;
    float _689 = -_669;
    float _691 = _689 + 1.0;
    float _693 = _673 * _685;
    float _695 = _613 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _697 = fma(_693, _677, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _699 = _609 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _701 = _695 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _703 = _697 * _687;
    float _705 = _611 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _707 = _699 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _709 = fma(_691, (*spvDescriptorSet0.vp_c9)._m0[115].x, _703);
    float _711 = _705 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _713 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[116].x, _709);
    float _715 = _713 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_55.x = _711;
    out.m_55.y = _707;
    out.m_55.z = _701;
    out.m_55.w = _715;
    bool _717 = !_683;
    float _735;
    float _737;
    if (!_717)
    {
        float _719 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _721 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _723 = float(_85);
        float _725 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[11].z, _117);
        float _727 = _725 * _719;
        float _729 = floor(_727);
        float _731 = -_729;
        float _733 = _727 + _731;
        _735 = _723;
        _737 = _733;
        _739 = true;
    }
    else
    {
        float _741 = float(_85);
        float _743 = 1.0 / _741;
        float _745 = _117 * _743;
        _735 = _741;
        _737 = _745;
    }
    _739 = false;
    float _747 = _735;
    float _749 = _737;
    float _751 = _247 * _247;
    float _753 = as_type<float>(int(gl_VertexIndex));
    float _755 = _251 * _573;
    float _757 = fma(_197, _197, _751);
    float _759 = _755 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _761 = fma(_243, _243, _757);
    float _763 = rsqrt(_761);
    int _765 = as_type<int>(_753) & 1;
    bool _767 = _765 != 0;
    int _769 = as_type<int>(_753) & 2;
    bool _771 = _769 != 0;
    float _773 = _243 * _763;
    float _775 = _197 * _763;
    float _777 = _247 * _763;
    float _779 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _781 = _773 * _779;
    float _783 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _785 = _775 * _783;
    float _787 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _789 = _777 * _787;
    float _791 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _793 = -_781;
    float _795 = fma(_775, _791, _793);
    float _797 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _799 = -_785;
    float _801 = fma(_777, _797, _799);
    float _803 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _805 = -_789;
    float _807 = fma(_773, _803, _805);
    float _809 = _795 * _795;
    float _811 = in.m_42.x;
    float _813 = in.m_42.y;
    float _815 = in.m_42.z;
    float _817 = fma(_807, _807, _809);
    float _819 = fma(_801, _801, _817);
    float _821 = _251 * _577;
    bool _823 = !_767;
    float _825 = _823 ? (-0.5) : 0.5;
    bool _827 = !_771;
    float _829 = _827 ? (-0.5) : 0.5;
    float _831 = _821 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _833 = rsqrt(_819);
    float _835 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _825);
    float _837 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _829);
    float _839 = _831 * _835;
    float _841 = _759 * _837;
    float _843 = _813 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _845 = _841 * _773;
    float _847 = _841 * _775;
    float _849 = _841 * _777;
    float _851 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[6].x, _843);
    float _853 = _795 * _833;
    float _855 = _807 * _833;
    float _857 = _801 * _833;
    float _859 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _861 = _775 * _853;
    float _863 = fma(_839, _857, _845);
    float _865 = _777 * _857;
    float _867 = -_861;
    float _869 = fma(_777, _855, _867);
    float _871 = _813 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _873 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[6].z, _851);
    float _875 = -_865;
    float _877 = fma(_773, _853, _875);
    float _879 = fma(_859, _869, _863);
    float _881 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[4].x, _871);
    float _883 = fma(_839, _855, _847);
    float _885 = _873 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _887 = _813 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _889 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[4].z, _881);
    float _891 = fma(_859, _877, _883);
    float _893 = _885 + _879;
    float _895 = fma(_811, (*spvDescriptorSet0.vp_c10)._m0[5].x, _887);
    float _897 = _889 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _899 = _773 * _855;
    float _901 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _903 = _893 + _901;
    float _905 = fma(_815, (*spvDescriptorSet0.vp_c10)._m0[5].z, _895);
    float _907 = _897 + _891;
    float _909 = fma(_839, _853, _849);
    float _911 = _903 * _903;
    float _913 = -_899;
    float _915 = fma(_775, _857, _913);
    float _917 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _919 = _907 + _917;
    float _921 = _905 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _923 = fma(_859, _915, _909);
    float _925 = fma(_919, _919, _911);
    float _927 = _921 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _929 = _921 + _923;
    float _931 = sqrt(_925);
    float _933 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[11].x, _927);
    float _935 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[11].z, _933);
    bool _937 = _931 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _939 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _941 = _939 != 0;
    int _943 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _945 = _943 != 0;
    int _947 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _949 = _947 != 0;
    bool _951 = !_945;
    int _953 = _951 ? 0 : 1;
    bool _955 = !_941;
    int _957 = _955 ? 0 : 1;
    bool _959 = !_949;
    int _961 = _959 ? 0 : 1;
    float _963 = _859;
    float _965 = _923;
    float _967 = _849;
    float _969 = _777;
    float _971 = _775;
    float _973 = _773;
    if (!_937)
    {
        _963 = _907;
    }
    float _975 = _963;
    float _977 = _975;
    if (!_937)
    {
        _965 = _893;
    }
    float _979 = _965;
    float _981 = _979;
    if (!_937)
    {
        _967 = _929;
    }
    float _983 = _967;
    bool _985 = !_937;
    float _987 = _983;
    if (!_985)
    {
        float _989 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _991 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _993 = _931 + _991;
        float _995 = rsqrt(_925);
        float _997 = _993 * _989;
        float _999 = _929 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1001 = _997 * 0.15915493667125701904296875;
        float _1003 = _1001 * 6.283185482025146484375;
        float _1005 = cos(_1003);
        float _1007 = _1001 * 6.283185482025146484375;
        float _1009 = sin(_1007);
        float _1011 = _1005 + (-1.0);
        float _1013 = fma(_1009, _999, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1015 = _1011 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1017 = _995 * _1013;
        float _1019 = fma(_929, _1005, _1015);
        float _1021 = fma(_919, _1017, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1023 = fma(_903, _1017, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _987 = _1019;
        _977 = _1021;
        _981 = _1023;
    }
    float _1025 = _987;
    float _1027 = _977;
    float _1029 = _981;
    float _1031 = -_921;
    float _1033 = _1031 + _1025;
    float _1035 = _935 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1037 = -_897;
    float _1039 = _1037 + _1027;
    float _1041 = -_885;
    float _1043 = _1041 + _1029;
    float _1045 = _1033 * _1033;
    float _1047 = _921 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1049 = 1.0 / _1035;
    float _1051 = fma(_1039, _1039, _1045);
    float _1053 = fma(_897, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1047);
    float _1055 = fma(_1043, _1043, _1051);
    float _1057 = fma(_885, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1053);
    bool _1059 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1061 = isnan(0.5);
    bool _1063 = _1059 || _1061;
    bool _1065 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1067 = _1063 || _1065;
    float _1069 = sqrt(_1055);
    float _1071 = _1057 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    bool _1073 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1075 = isnan(0.5);
    bool _1077 = _1073 || _1075;
    bool _1079 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1081 = _1077 || _1079;
    float _1083 = _1071 + _1035;
    float _1085 = _1083 * _1049;
    float _1087 = _1085 * 0.5;
    bool _1089 = _1069 > 0.0;
    float _1091 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1093 = fma(_1087, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1091);
    float _1095 = 1.0 / _1093;
    float _1097 = _1087;
    float _1099 = _1027;
    float _1101 = _1029;
    float _1103 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1105 = _1043;
    if (!_1089)
    {
        _1097 = _1025;
    }
    float _1107 = _1097;
    bool _1109 = !_1089;
    float _1111 = _1107;
    float _1113 = _1107;
    if (!_1109)
    {
        float _1115 = sqrt(_761);
        float _1117 = rsqrt(_1055);
        bool _1119 = _1115 > 0.0;
        float _1121 = _1039 * _1117;
        float _1123 = _1033 * _1117;
        float _1125 = _1043 * _1117;
        _1103 = _1125;
        if (!_1119)
        {
            _1111 = _1025;
        }
        float _1127 = _1111;
        bool _1129 = !_1119;
        _1113 = _1127;
        if (!_1129)
        {
            float _1131 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1133 = _777 * _1123;
            float _1135 = fma(_775, _1121, _1133);
            float _1137 = fma(_773, _1125, _1135);
            float _1139 = _1131 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1141 = _1137 * _1139;
            float _1143 = fma(_197, _1141, _1027);
            float _1145 = fma(_247, _1141, _1025);
            float _1147 = fma(_243, _1141, _1029);
            _1099 = _1143;
            _1113 = _1145;
            _1101 = _1147;
            _969 = _1137;
        }
    }
    float _1149 = _1099;
    float _1151 = _1113;
    float _1153 = _1101;
    float _1155 = _969;
    float _1157 = _1103;
    float _1159 = _1155;
    float _1161 = _1153;
    float _1163 = _1157;
    if (_1081)
    {
        _971 = 1.0;
    }
    float _1165 = _971;
    float _1167 = _1165;
    if (_1067)
    {
        _255 = _1149;
    }
    float _1169 = _255;
    float _1171 = _1169;
    if (_1067)
    {
        _257 = _1151;
    }
    float _1173 = _257;
    float _1175 = _1173;
    if (!_1067)
    {
        float _1177 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1179 = _921 + _1177;
        float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1183 = _897 + _1181;
        float _1185 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1187 = -_897;
        float _1189 = _1187 + _1149;
        float _1191 = _1179 * _1179;
        float _1193 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1195 = _885 + _1193;
        float _1197 = -_885;
        float _1199 = _1197 + _1153;
        float _1201 = fma(_1183, _1183, _1191);
        float _1203 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1205 = fma(_1195, _1195, _1201);
        float _1207 = sqrt(_1205);
        float _1209 = _1185 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1211 = precise::min(_1207, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1213 = _1211 * _1203;
        float _1215 = -_921;
        float _1217 = _1215 + _1151;
        float _1219 = _1209 * _1213;
        float _1221 = fma(_1189, _1219, _897);
        float _1223 = fma(_1217, _1219, _921);
        float _1225 = fma(_1199, _1219, _885);
        _1159 = _1219;
        _1175 = _1223;
        _1171 = _1221;
        _1161 = _1225;
    }
    float _1227 = _1159;
    float _1229 = _1175;
    float _1231 = _1171;
    float _1233 = _1161;
    float _1235 = _1227;
    if (_1081)
    {
        _1235 = 1.0;
    }
    float _1237 = _1235;
    float _1239 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1241 = _1095 * _1239;
    float _1243 = _1237;
    if (!_1081)
    {
        float _1245 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1247 = _1245 * 0.15915493667125701904296875;
        float _1249 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1251 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1253 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1251;
        float _1255 = _1247 * 6.283185482025146484375;
        float _1257 = cos(_1255);
        float _1259 = _1249 * 0.15915493667125701904296875;
        float _1261 = _1247 * 6.283185482025146484375;
        float _1263 = sin(_1261);
        float _1265 = 1.0 / _1257;
        float _1267 = _1259 * 6.283185482025146484375;
        float _1269 = cos(_1267);
        float _1271 = _1263 * _1265;
        float _1273 = _1259 * 6.283185482025146484375;
        float _1275 = sin(_1273);
        float _1277 = _1269 * _1271;
        float _1279 = 1.0 / _1253;
        float _1281 = 1.0 / _1277;
        float _1283 = _1275 * _1281;
        float _1285 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1287 = fma(_1241, _1283, _1285);
        float _1289 = _1287 * _1279;
        float _1291 = precise::clamp(_1289, 0.0, 1.0);
        _1163 = _1279;
        _973 = _1253;
        _1167 = _1291;
    }
    float _1293 = _1163;
    float _1295 = _973;
    float _1297 = _1167;
    float _1299 = _1295;
    float _1301 = _1293;
    if (!_1081)
    {
        float _1303 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1305 = _1303 * 0.15915493667125701904296875;
        float _1307 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1309 = _1305 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        float _1313 = _1307 * 0.15915493667125701904296875;
        float _1315 = _1305 * 6.283185482025146484375;
        float _1317 = sin(_1315);
        float _1319 = 1.0 / _1311;
        float _1321 = _1313 * 6.283185482025146484375;
        float _1323 = cos(_1321);
        float _1325 = _1317 * _1319;
        float _1327 = _1313 * 6.283185482025146484375;
        float _1329 = sin(_1327);
        float _1331 = _1323 * _1325;
        float _1333 = 1.0 / _1331;
        float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1337 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1335;
        float _1339 = 1.0 / _1337;
        float _1341 = _1329 * _1333;
        float _1343 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1345 = fma(_1241, _1341, _1343);
        float _1347 = _1345 * _1339;
        float _1349 = precise::clamp(_1347, 0.0, 1.0);
        float _1351 = -_1349;
        float _1353 = _1351 + 1.0;
        _1299 = _1333;
        _1243 = _1353;
    }
    float _1355 = _1299;
    float _1357 = _1243;
    float _1359 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1361 = _1229 + _1359;
    float _1363 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1365 = _1231 + _1363;
    float _1367 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1369 = _1233 + _1367;
    float _1371 = _1361 * _1361;
    float _1373 = fma(_1365, _1365, _1371);
    float _1375 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1377 = fma(_1369, _1369, _1373);
    float _1379 = rsqrt(_1377);
    float _1381 = _1379 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1383 = _1365 * _1381;
    float _1385 = _1369 * _1381;
    float _1387 = _1383 * _1383;
    float _1389 = _1385 * _1385;
    float _1391 = _1387 + _1389;
    float _1393 = sqrt(_1391);
    bool _1395 = _1393 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1397 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1399 = _1393 + _1397;
    float _1401 = _1379;
    float _1403 = _1391;
    float _1405 = _1399;
    float _1407 = _1361;
    float _1409 = _1383;
    if (_1395)
    {
        float _1411 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1401 = _1411;
    }
    float _1413 = _1401;
    if (_1395)
    {
        float _1415 = rsqrt(_1391);
        _1403 = _1415;
    }
    float _1417 = _1403;
    if (_1395)
    {
        float _1419 = _1399 * _1413;
        _1405 = _1419;
    }
    float _1421 = _1405;
    if (_1395)
    {
        float _1423 = _1421 * 0.15915493667125701904296875;
        _1301 = _1423;
    }
    float _1425 = _1301;
    float _1427 = _1369;
    if (_1395)
    {
        float _1429 = _1425 * 6.283185482025146484375;
        float _1431 = sin(_1429);
        _1427 = _1431;
    }
    float _1433 = _1427;
    float _1435 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1437 = precise::max(0.0, _1435);
    float _1439 = _1355;
    float _1441 = _1437;
    float _1443 = _1435;
    if (_1395)
    {
        float _1445 = _1425 * 6.283185482025146484375;
        float _1447 = cos(_1445);
        _1439 = _1447;
    }
    float _1449 = _1439;
    float _1451 = -_1381;
    float _1453 = -_1437;
    float _1455 = fma(_1361, _1451, _1453);
    if (_1395)
    {
        float _1457 = _1455 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1441 = _1457;
    }
    float _1459 = _1441;
    float _1461 = _1433;
    float _1463 = _1459;
    if (_1395)
    {
        float _1465 = fma(_1433, _1459, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1461 = _1465;
    }
    float _1467 = _1461;
    float _1469 = _1467;
    if (!_1395)
    {
        _1463 = _1455;
    }
    float _1471 = _1463;
    float _1473 = _1471;
    if (_1395)
    {
        float _1475 = _1449 + (-1.0);
        _1443 = _1475;
    }
    float _1477 = _1443;
    float _1479 = _1477;
    if (_1395)
    {
        float _1481 = _1417 * _1467;
        _1105 = _1481;
    }
    float _1483 = _1105;
    if (!_1395)
    {
        _1469 = _1385;
    }
    float _1485 = _1469;
    float _1487 = sqrt(_1377);
    float _1489 = _1485;
    if (_1395)
    {
        float _1491 = _1477 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1407 = _1491;
    }
    float _1493 = _1407;
    float _1495 = _1493;
    if (_1395)
    {
        float _1497 = _1383 * _1483;
        _1409 = _1497;
    }
    float _1499 = _1409;
    if (!_1395)
    {
        _1479 = _1387;
    }
    float _1501 = _1479;
    float _1503 = _1501;
    if (_1395)
    {
        float _1505 = _1385 * _1483;
        _1489 = _1505;
    }
    float _1507 = _1489;
    if (_1395)
    {
        float _1509 = fma(_1455, _1449, _1493);
        _1473 = _1509;
    }
    float _1511 = _1473;
    if (_1395)
    {
        float _1513 = _1499 * _1499;
        _1503 = _1513;
    }
    float _1515 = _1503;
    if (!_1395)
    {
        _1495 = _1389;
    }
    float _1517 = _1495;
    float _1519 = _1517;
    if (_1395)
    {
        float _1521 = _1507 * _1507;
        _1519 = _1521;
    }
    float _1523 = _1519;
    float _1525 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1527 = fma(_1511, _1511, _1515);
    float _1529 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1531 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1525);
    float _1533 = _1527 + _1523;
    float _1535 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1529);
    float _1537 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1539 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1541 = fma(_1487, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1539);
    float _1543 = precise::clamp(_1541, 0.0, 1.0);
    float _1545 = rsqrt(_1533);
    float _1547 = _1229 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1549 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1537);
    float _1551 = -_1543;
    float _1553 = _1551 + 1.0;
    float _1555 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1535);
    float _1557 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1547);
    float _1559 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1549);
    float _1561 = abs(_1553);
    float _1563 = log2(_1561);
    float _1565 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1557);
    float _1567 = _1559 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1569 = _1555 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1571 = fma(_1233, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1531);
    float _1573 = _1565 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1575 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1577 = _1569 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1579 = _1545 * _1499;
    float _1581 = _1545 * _1511;
    float _1583 = _1545 * _1507;
    float _1585 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1575);
    float _1587 = _1579 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1589 = _1571 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1591 = -_1577;
    float _1593 = fma(_1591, _1375, 1.0);
    float _1595 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1585);
    float _1597 = -_1587;
    float _1599 = fma(_1581, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1597);
    float _1601 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1603 = log2(_1593);
    float _1605 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1595);
    float _1607 = -_1583;
    float _1609 = fma(_1607, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1599);
    float _1611 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1613 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1615 = fma(_1609, -0.5, 0.5);
    float _1617 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1611);
    float _1619 = exp2(_1601);
    float _1621 = fma(_1609, 0.5, 0.5);
    float _1623 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1613);
    float _1625 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1617);
    float _1627 = _1581 + 1.0;
    float _1629 = fma(_1621, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1631 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1623);
    float _1633 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1625);
    float _1635 = 1.0 / _1605;
    float _1637 = fma(_1621, _1629, -0.212114393711090087890625);
    float _1639 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1631);
    float _1641 = _1603 * 0.693147182464599609375;
    float _1643 = fma(_1621, _1637, 1.570728778839111328125);
    float _1645 = _1641 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1647 = sqrt(_1615);
    float _1649 = -_1581;
    float _1651 = fma(_1619, _1627, _1649);
    float _1653 = fma(_1651, 0.5, 0.5);
    float _1655 = _1633 * _1635;
    float _1657 = _1639 * _1635;
    float _1659 = fma(_1655, 0.5, 0.5);
    float _1661 = fma(_1657, -0.5, 0.5);
    float _1663 = _1647 * 0.636619746685028076171875;
    float _1665 = -_1643;
    float _1667 = fma(_1663, _1665, 1.0);
    float3 _5102 = float3(_1659, _1661, _1645);
    float _1669 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5102, float3(0.0), isnan(_5102)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5102, float3(0.0), isnan(_5102)), level(0.0)).x;
    float3 _5113 = float3(_1659, _1661, _1645);
    float4 _1672 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5113, float3(0.0), isnan(_5113)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5113, float3(0.0), isnan(_5113)), level(0.0)).xyzw;
    float _1674 = _1672.x;
    float _1676 = _1672.y;
    float _1678 = _1672.z;
    float _1680 = _1672.w;
    float2 _5130 = float2(_1667, _1653);
    float3 _1684 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5130, float2(0.0), isnan(_5130)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5130, float2(0.0), isnan(_5130)), level(0.0)).xyz;
    float _1686 = _1684.x;
    float _1688 = _1684.y;
    float _1690 = _1684.z;
    float _1692 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1694 = int(_1692);
    int _1696 = abs(_953);
    float _1698 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1700 = int(_1698);
    float _1702 = float(_1694);
    float _1704 = 1.0 / _747;
    float _1706 = float(uint(_1700));
    float _1708 = 1.0 / _1702;
    int _1710 = ~_1700;
    int _1712 = _1710 + 1;
    int _1714 = ~_1700;
    int _1716 = _1714 + 1;
    int _1718 = _1700 + (-1);
    float _1720 = 1.0 / _1706;
    float _1722 = _117 * _1708;
    int _1724 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1726 = _1724 != 0;
    float _1728 = trunc(_1722);
    int _1730 = int(_1728);
    int _1732 = as_type<int>(_1720) + (-2);
    bool _1734 = !_1726;
    float _1736 = _1734 ? 7.345489978790283203125 : 1.0;
    float _1738 = _1736 * _139;
    float _1740 = float(uint(_1730));
    float _1742 = as_type<float>(_1732) * _1740;
    float _1744 = trunc(_1742);
    float _1746 = precise::max(_1744, 0.0);
    uint _1749 = uint(_1746);
    float _1751 = float(_1700);
    int _1753 = _1712 * int(_1749);
    int _1755 = _1753 + _1730;
    float _1757 = float(uint(_1755));
    float _1759 = as_type<float>(_1732) * _1757;
    float _1761 = floor(_1738);
    float _1763 = trunc(_1759);
    float _1765 = precise::max(_1763, 0.0);
    uint _1767 = uint(_1765);
    float _1769 = -_1761;
    float _1771 = _1738 + _1769;
    int _1773 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1775 = _1773 != 0;
    int _1777 = int(_1749) + int(_1767);
    float _1779 = float(_1730);
    int _1781 = _1716 * _1777;
    int _1783 = _1781 + _1730;
    bool _1785 = _1779 >= _1751;
    bool _1787 = isnan(_1779);
    bool _1789 = _1785 || _1787;
    bool _1791 = isnan(_1751);
    bool _1793 = _1789 || _1791;
    float _1795 = float(_1793);
    bool _1797 = uint(_1783) >= uint(_1700);
    float _1799 = _1771 * _1751;
    float _1801 = trunc(_1795);
    int _1803 = int(_1801);
    float _1805 = _117 * _1751;
    bool _1807 = !_1797;
    int _1809 = _1807 ? 0 : (-1);
    bool _1811 = _1700 == 0;
    float _1813 = _1805 * _1704;
    int _1815 = ~_1777;
    int _1817 = _1815 + _1809;
    int _1819 = _1817 + 1;
    float _1821 = trunc(_1799);
    int _1823 = int(_1821);
    bool _1825 = !_1775;
    int _1827 = _1825 ? 0 : 1;
    int _1829 = _1700 * _1819;
    int _1831 = _1829 + _1730;
    int _1833 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1835 = _1833 != 0;
    int _1837 = abs(_1827);
    int _1839 = ~_1803;
    int _1841 = _1839 + 1;
    int _1843 = _1841 + 1;
    float _1845 = trunc(_1813);
    int _1847 = int(_1845);
    bool _1849 = !_1811;
    int _1851 = _1849 ? _1831 : (-1);
    bool _1853 = !_1835;
    int _1855 = _1853 ? 0 : 1;
    int _1857 = _1851 * _1843;
    int _1859 = ~_1700;
    int _1861 = _1859 + 1;
    int _1863 = _1803 * _1718;
    int _1865 = _1863 + _1857;
    int _1867 = abs(_957);
    int _1869 = _1865 * _1696;
    int _1871 = abs(_961);
    int _1873 = _1823 * _1837;
    int _1875 = _1873 + _1730;
    int _1877 = abs(_1855);
    int _1879 = _1847 * _1867;
    int _1881 = _1879 + _1869;
    int _1883 = ~_1700;
    int _1885 = _1883 + 1;
    int _1887 = _1875 * _1871;
    int _1889 = _1887 + _1881;
    int _1891 = ~_1700;
    int _1893 = _1891 + 1;
    int _1895 = _1823 * _1877;
    int _1897 = _1895 + _1889;
    float _1899 = float(uint(_1897));
    float _1901 = as_type<float>(_1732) * _1899;
    float _1903 = trunc(_1901);
    float _1905 = precise::max(_1903, 0.0);
    uint _1907 = uint(_1905);
    int _1909 = _1893 * int(_1907);
    int _1911 = _1909 + _1897;
    float _1913 = float(uint(_1911));
    int _1915 = ~_1700;
    int _1917 = _1915 + 1;
    float _1919 = as_type<float>(_1732) * _1913;
    float _1921 = trunc(_1919);
    float _1923 = precise::max(_1921, 0.0);
    uint _1925 = uint(_1923);
    int _1927 = int(_1907) + int(_1925);
    int _1929 = _1885 * _1927;
    int _1931 = _1929 + _1897;
    bool _1933 = uint(_1931) >= uint(_1700);
    float _1935 = float(uint(_1875));
    bool _1937 = !_1933;
    int _1939 = _1937 ? 0 : (-1);
    float _1941 = as_type<float>(_1732) * _1935;
    int _1943 = ~_1927;
    int _1945 = _1943 + _1939;
    int _1947 = _1945 + 1;
    float _1949 = trunc(_1941);
    float _1951 = precise::max(_1949, 0.0);
    uint _1953 = uint(_1951);
    int _1955 = _1700 * _1947;
    int _1957 = _1955 + _1897;
    bool _1959 = !_1811;
    int _1961 = _1959 ? _1957 : (-1);
    int _1963 = _1961 >> 31;
    int _1965 = _1961 & 3;
    bool _1967 = _1965 != 0;
    int _1969 = _1963 & 3;
    int _1971 = _1917 * int(_1953);
    int _1973 = _1971 + _1875;
    int _1975 = _1961 + _1969;
    float _1977 = float(uint(_1973));
    int _1979 = _1975 >> 2;
    float _1981 = as_type<float>(_1732) * _1977;
    int _1983 = _1979 << 4;
    int _1985 = _1983 + 368;
    int _1987 = _1961 & 3;
    bool _1989 = _1987 != 0;
    uint _1991 = uint(int(uint(_1985) >> uint(2)));
    uint _1993 = uint(int(uint(int(_1991)) >> uint(2)));
    int _1995 = int(_1991) & 3;
    float _1997 = (*spvDescriptorSet0.vp_c9)._m0[int(_1993)][_1995];
    int _1999 = int(_1991) + 1;
    uint _2001 = uint(int(uint(_1999) >> uint(2)));
    int _2003 = _1999 & 3;
    float _2005 = (*spvDescriptorSet0.vp_c9)._m0[int(_2001)][_2003];
    float _2007 = trunc(_1981);
    float _2009 = precise::max(_2007, 0.0);
    uint _2011 = uint(_2009);
    bool _2013 = uint(_1987) > 1u;
    int _2015 = _1967 ? 0 : 1;
    bool _2017 = _1987 != 3;
    int _2019 = _1985 + 8;
    uint _2021 = uint(int(uint(_2019) >> uint(2)));
    uint _2023 = uint(int(uint(int(_2021)) >> uint(2)));
    int _2025 = int(_2021) & 3;
    float _2027 = (*spvDescriptorSet0.vp_c9)._m0[int(_2023)][_2025];
    int _2029 = int(_2021) + 1;
    uint _2031 = uint(int(uint(_2029) >> uint(2)));
    int _2033 = _2029 & 3;
    float _2035 = (*spvDescriptorSet0.vp_c9)._m0[int(_2031)][_2033];
    bool _2037 = uint(_1987) >= 2u;
    int _2039 = int(_1953) + int(_2011);
    int _2041 = ~_2015;
    int _2043 = _2041 + 1;
    int _2045 = _2043 + 1;
    int _2047 = _2045;
    if (!_2013)
    {
        int _2049 = ~_2015;
        int _2051 = _2049 + 1;
        _2047 = _2051;
    }
    int _2053 = _2047;
    int _2055 = _1861 * _2039;
    int _2057 = _2055 + _1875;
    bool _2059 = !_1989;
    int _2061 = _2059 ? 0 : 1;
    int _2063 = _2037 ? 0 : 1;
    bool _2065 = uint(_2057) >= uint(_1700);
    bool _2067 = _1987 != 3;
    bool _2069 = !_2065;
    int _2071 = _2069 ? 0 : (-1);
    int _2073 = ~_2063;
    int _2075 = _2073 + 1;
    int _2077 = _2075 + 1;
    int _2079 = ~_2039;
    int _2081 = _2079 + _2071;
    int _2083 = _2081 + 1;
    int _2085 = abs(_2053);
    int _2087 = abs(_2061);
    int _2089 = _1700 * _2083;
    int _2091 = _2089 + _1875;
    float _2093 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _2095 = int(_2093);
    int _2097 = _2077;
    if (_2017)
    {
        int _2099 = ~_2063;
        int _2101 = _2099 + 1;
        _2097 = _2101;
    }
    int _2103 = _2097;
    int _2105 = ~_2085;
    int _2107 = _2105 + 1;
    int _2109 = _2107 + 1;
    int _2111 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2113 = _2111 != 0;
    bool _2115 = !_2067;
    int _2117 = _2115 ? 0 : (-1);
    int _2119 = _2109 * as_type<int>(_2005);
    int _2121 = ~_2087;
    int _2123 = _2121 + 1;
    int _2125 = _2123 + 1;
    int _2127 = abs(_2103);
    bool _2129 = !_2113;
    int _2131 = _2129 ? 0 : 1;
    int _2133 = _2125 * as_type<int>(_1997);
    int _2135 = _2133 + _2119;
    int _2137 = abs(_2117);
    int _2139 = ~_2127;
    int _2141 = _2139 + 1;
    int _2143 = _2141 + 1;
    int _2145 = abs(_2131);
    float _2147 = in.m_49.y;
    int _2149 = _2143 * as_type<int>(_2027);
    int _2151 = _2149 + _2135;
    float _2153 = float(uint(_2095));
    int _2155 = ~_2137;
    int _2157 = _2155 + 1;
    int _2159 = _2157 + 1;
    float _2161 = 1.0 / _2153;
    int _2163 = abs(_2095);
    int _2165 = ~_2145;
    int _2167 = _2165 + 1;
    int _2169 = _2167 + 1;
    int _2171 = _2159 * as_type<int>(_2035);
    int _2173 = _2171 + _2151;
    float _2175 = float(uint(_2163));
    float _2177 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2179 = !_1811;
    int _2181 = _2179 ? _2091 : (-1);
    int _2183 = _2173 * _2169;
    float _2185 = 1.0 / _2175;
    int _2187 = _2181 * _2145;
    int _2189 = _2187 + _2183;
    int _2191 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2193 = _2191 != 0;
    int _2195 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2197 = _2195 != 0;
    int _2199 = as_type<int>(_2161) + (-2);
    float _2201 = float(uint(_2189));
    int _2203 = abs(_2189);
    float _2205 = as_type<float>(_2199) * _2201;
    float _2207 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _2209 = as_type<int>(_2185) + (-2);
    float _2211 = -_2207;
    float _2213 = fma(_2177, 2.0, _2211);
    float _2215 = float(uint(_2203));
    float _2217 = trunc(_2205);
    float _2219 = precise::max(_2217, 0.0);
    uint _2221 = uint(_2219);
    float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _2223;
    float _2227 = as_type<float>(_2209) * _2215;
    int _2229 = ~_2095;
    int _2231 = _2229 + 1;
    float _2233 = 1.0 / _2225;
    float _2235 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2237 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2239 = _2147 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _2241 = _139 > 0.5;
    bool _2243 = _2147 > 0.5;
    float _2245 = fma(_2239, -2.0, _2237);
    float _2247 = trunc(_2227);
    float _2249 = precise::max(_2247, 0.0);
    uint _2251 = uint(_2249);
    float _2253 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2235);
    int _2255 = _2231 * int(_2221);
    int _2257 = _2255 + _2189;
    int _2259 = ~_2163;
    int _2261 = _2259 + 1;
    float _2263 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2265 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _2267 = _749 + _2265;
    float _2269 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2253);
    float _2271 = fma(_2147, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2263);
    float _2273 = float(uint(_2257));
    float _2275 = _2267 * _2233;
    float _2277 = -_117;
    float _2279 = fma(_2277, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2213);
    float _2281 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2245);
    int _2283 = ~_2095;
    int _2285 = _2283 + 1;
    float _2287 = as_type<float>(_2199) * _2273;
    float _2289 = fma(_117, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2271);
    int _2291 = _2261 * int(_2251);
    int _2293 = _2291 + _2203;
    float _2295 = trunc(_2287);
    float _2297 = precise::max(_2295, 0.0);
    uint _2299 = uint(_2297);
    bool _2301 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _2303 = isnan(_749);
    bool _2305 = _2301 || _2303;
    bool _2307 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _2309 = _2305 || _2307;
    float _2311 = float(_2309);
    float _2313 = -_2289;
    float _2315 = _2313 + 1.0;
    float _2317 = float(uint(_2293));
    float _2319 = -_2269;
    float _2321 = _2319 + 1.0;
    bool _2323 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2325 = isnan(_749);
    bool _2327 = _2323 || _2325;
    bool _2329 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2331 = _2327 || _2329;
    float _2333 = float(_2331);
    float _2335 = as_type<float>(_2209) * _2317;
    float _2337 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _2339 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _2337;
    float _2341 = -_2311;
    float _2343 = _2341 + 1.0;
    float _2345 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _2347 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _2345;
    float _2349 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _2351 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _2349;
    float _2353 = -_825;
    int _2355 = _2241 ? as_type<int>(_2353) : as_type<int>(_825);
    float _2357 = trunc(_2335);
    float _2359 = precise::max(_2357, 0.0);
    uint _2361 = uint(_2359);
    float _2363 = _2333 * _2343;
    int _2365 = int(_2221) + int(_2299);
    float _2367 = fma(_2339, _2275, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _2369 = fma(_2351, _2275, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    int _2371 = ~_2163;
    int _2373 = _2371 + 1;
    float _2375 = fma(_2347, _2275, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    bool _2377 = !_2193;
    float _2379 = _2377 ? _825 : as_type<float>(_2355);
    int _2381 = _2285 * _2365;
    int _2383 = _2381 + _2189;
    float _2385 = _2367 * _2363;
    float _2387 = _2369 * _2363;
    float _2389 = _2375 * _2363;
    bool _2391 = uint(_2383) >= uint(_2095);
    float _2393 = -_2333;
    float _2395 = _2393 + 1.0;
    int _2397 = int(_2251) + int(_2361);
    float _2399 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2387);
    float _2401 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2389);
    int _2403 = _2373 * _2397;
    int _2405 = _2403 + _2203;
    bool _2407 = !_2391;
    int _2409 = _2407 ? 0 : (-1);
    float _2411 = fma(_2395, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2385);
    float _2413 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[124].x, _2399);
    float _2415 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[124].y, _2401);
    bool _2417 = uint(_2405) >= uint(_2163);
    float _2419 = fma(_2311, (*spvDescriptorSet0.vp_c9)._m0[124].z, _2411);
    int _2421 = ~_2365;
    int _2423 = _2421 + _2409;
    int _2425 = _2423 + 1;
    float _2427 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _2429 = _2189 ^ _2095;
    float _2431 = _2413 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _2433 = _2095 * _2425;
    int _2435 = _2433 + _2189;
    bool _2437 = !_2417;
    int _2439 = _2437 ? 0 : (-1);
    float _2441 = _2415 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2443 = _2095 == 0;
    bool _2445 = _2095 == 0;
    uint _2447 = uint(int(uint(_2429) >> uint(31)));
    float _2449 = _2419 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2451 = ~_2439;
    int _2453 = _2397 + _2451;
    int _2455 = _2453 + 1;
    float _2457 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2459 = -_829;
    int _2461 = _2243 ? as_type<int>(_2459) : as_type<int>(_829);
    float _2463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _2465 = ~int(_2447);
    int _2467 = _2465 + 1;
    float _2469 = _1567 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2471 = !_2197;
    float _2473 = _2471 ? _829 : as_type<float>(_2461);
    float _2475 = _2431 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _2477 = !_2443;
    int _2479 = _2477 ? _2435 : (-1);
    float _2481 = _1563 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2483 = _2455 ^ _2467;
    float _2485 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2469);
    float _2487 = _2441 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2489 = _2449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2491 = ~_2467;
    int _2493 = _2491 + _2483;
    int _2495 = _2493 + 1;
    float _2497 = exp2(_2481);
    float _2499 = fma(_1569, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2485);
    float _2501 = float(_2479);
    float _2503 = _2427 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2505 = !_2445;
    int _2507 = _2505 ? _2495 : (-1);
    float _2509 = _2463 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    out.m_60.x = _2475;
    out.m_60.y = _2487;
    out.m_60.z = _2489;
    out.m_60.w = _2457;
    float _2511 = fma(_2503, _2501, _2279);
    float _2513 = float(_2507);
    float _2515 = _2379 + 0.5;
    bool _2517 = _1297 > 0.0;
    bool _2519 = isnan(_1297);
    bool _2521 = _2517 || _2519;
    bool _2523 = isnan(0.0);
    bool _2525 = _2521 || _2523;
    float _2527 = -_2281;
    float _2529 = fma(_2509, _2513, _2527);
    float _2531 = _1297 * _1357;
    float _2533 = fma(_2503, _2515, _2511);
    float _2535 = -_2497;
    float _2537 = _2535 + 1.0;
    bool _2539 = _1357 <= 0.0;
    bool _2541 = !_2525;
    bool _2543 = _2539 || _2541;
    float _2545 = _2531 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2547 = fma(_1589, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2499);
    float _2549 = _2473 + (-0.5);
    float _2551 = -_2321;
    float _2553 = fma(_2379, _2551, _2533);
    float _2555 = _2545 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2557 = -_2509;
    float _2559 = fma(_2557, _2549, _2529);
    float _2561 = _2547 + _1605;
    out.m_45.x = _2555;
    float _2563 = fma(_2473, _2315, _2559);
    float _2565 = _2537 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2567 = _2561 * 0.5;
    out.gl_Position.x = _1633;
    out.gl_Position.y = _1639;
    out.gl_Position.z = _2547;
    out.gl_Position.w = _1605;
    float _2569 = _2565 * _1669;
    float _2571 = -_2565;
    float _2573 = _2571 + 1.0;
    out.m_62.z = _2567;
    out.m_62.w = _1605;
    float _2575 = _1680 * _2569;
    float _2577 = _1690 * _2569;
    float _2579 = _1680 * _2573;
    out.m_64.x = _2553;
    out.m_64.y = _2563;
    float _2581 = fma(_1686, _2575, _1674);
    float _2583 = fma(_1688, _2575, _1676);
    float _2585 = fma(_1680, _2577, _1678);
    out.m_66.x = _2581;
    out.m_66.y = _2583;
    out.m_66.z = _2585;
    out.m_66.w = _2579;
    if (!_2543)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _2587 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2587;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

