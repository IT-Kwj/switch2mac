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
    float4 m_58 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_60 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_54 [[attribute(2)]];
    float4 m_42 [[attribute(3)]];
    float4 m_47 [[attribute(4)]];
    float4 m_49 [[attribute(5)]];
    float4 m_56 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _785 = false;
    bool _607 = false;
    bool _487 = false;
    bool _295 = false;
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
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1997 = as_type<float>(_101);
        out.gl_Position.z = _1997;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2066 = as_type<float>(_137);
        out.gl_Position.z = _2066;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_54.x;
    float _149 = in.m_54.y;
    float _151 = in.m_54.z;
    float _153 = _143 * _141;
    float _155 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    int _157 = as_type<int>(_145) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_145) & 2;
    bool _163 = _161 != 0;
    float _165 = _155 * 6.283185482025146484375;
    int _167 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _169 = _167 != 0;
    float _171 = floor(_155);
    float _173 = _165 * 0.15915493667125701904296875;
    bool _175 = !_163;
    float _177 = _175 ? (-0.5) : 0.5;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _183 = _181 != 0;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _187 = _185 != 0;
    float _189 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _191 = !_169;
    int _193 = _191 ? 0 : 1;
    float _195 = _173 * 6.283185482025146484375;
    float _197 = cos(_195);
    float _199 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _201 = !_183;
    int _203 = _201 ? 0 : 1;
    float _205 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _189);
    int _207 = abs(_193);
    float _209 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _179);
    int _211 = abs(_203);
    float _213 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _199);
    float _215 = -_171;
    float _217 = _155 + _215;
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _205);
    float _223 = -_217;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _227 = !_187;
    int _229 = _227 ? 0 : 1;
    float _231 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _209);
    float _233 = float(_211);
    float _235 = fma(_197, 0.5, 0.5);
    int _237 = abs(_229);
    float _239 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _213);
    bool _241 = _217 < 0.5;
    float _243 = float(_241);
    float _245 = abs(_225);
    float _247 = _233 * _245;
    float _249 = float(_207);
    float _251 = -_235;
    float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _255 = -_243;
    float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _259 = fma(_249, _253, _247);
    float _261 = float(_237);
    float _263 = abs(_257);
    float _265 = fma(_261, _263, _259);
    bool _267 = !_159;
    float _269 = _267 ? (-0.5) : 0.5;
    bool _271 = !_219;
    float _273 = _239;
    float _275 = _231;
    float _277 = _221;
    float _293;
    if (!_271)
    {
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _281 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _293 = _291;
        _295 = true;
    }
    else
    {
        float _297 = float(_85);
        float _299 = 1.0 / _297;
        float _301 = _119 * _299;
        _293 = _301;
    }
    _295 = false;
    float _303 = _293;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = _303 + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = _303 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _303 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _325;
    bool _329 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _331 = isnan(_303);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = 1.0 / _319;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _345 = 1.0 / _327;
    float _347 = 1.0 / _323;
    float _349 = _307 * _341;
    bool _351 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _353 = isnan(_303);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -_339;
    float _365 = _363 + 1.0;
    float _367 = _361 * _365;
    float _369 = _311 * _345;
    bool _371 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _373 = isnan(_303);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -_361;
    float _385 = _383 + 1.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = _381 * _385;
    float _393 = -_381;
    float _395 = _393 + 1.0;
    float _397 = _315 * _347;
    bool _399 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _401 = isnan(_303);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _423 = fma(_413, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _425 = _409 * _395;
    float _427 = fma(_417, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _429 = -_409;
    float _431 = _429 + 1.0;
    float _433 = _423 * _425;
    float _435 = _427 * _425;
    float _437 = fma(_389, _397, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _439 = fma(_421, _397, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _441 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[143].x, _433);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _447;
    float _451 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[143].y, _435);
    float _453 = fma(_437, _391, _441);
    float _455 = fma(_445, _369, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _457 = fma(_449, _369, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _459 = fma(_439, _391, _451);
    float _461 = fma(_455, _367, _453);
    float _463 = fma(_457, _367, _459);
    float _465 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].x, _461);
    float _467 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].y, _463);
    bool _469 = !_343;
    float _485;
    if (!_469)
    {
        float _471 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _473 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _477 = _475 * _471;
        float _479 = floor(_477);
        float _481 = -_479;
        float _483 = _477 + _481;
        _485 = _483;
        _487 = true;
    }
    else
    {
        float _489 = float(_85);
        float _491 = 1.0 / _489;
        float _493 = _119 * _491;
        _485 = _493;
    }
    _487 = false;
    float _495 = _485;
    float _497 = in.m_56.x;
    float _499 = in.m_56.y;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _503 = _495 + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _505;
    bool _509 = _495 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _511 = isnan(_495);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    bool _521 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _523 = 1.0 / _507;
    float _525 = _467 * _499;
    bool _527 = _495 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _529 = isnan(_495);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = _503 * _523;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _541;
    float _545 = -_537;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _553;
    float _557 = _519 * _547;
    float _559 = fma(_543, _539, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _561 = fma(_551, _539, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _563 = fma(_555, _539, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _565 = -_519;
    float _567 = _565 + 1.0;
    float _569 = _559 * _557;
    float _571 = _561 * _557;
    float _573 = _563 * _557;
    float _575 = _465 * _497;
    float _577 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].y, _569);
    float _579 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].x, _571);
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].z, _573);
    float _583 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[108].y, _577);
    float _585 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[108].x, _579);
    float _587 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[108].z, _581);
    bool _589 = !_521;
    float _605;
    if (!_589)
    {
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _593 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_85);
        float _611 = 1.0 / _609;
        float _613 = _119 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _615 + _617;
    float _621 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _631 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _633 = isnan(_615);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _647 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _649 = isnan(_615);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = 1.0 / _625;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _661;
    float _665 = -_641;
    float _667 = _665 + 1.0;
    bool _669 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _671 = isnan(_615);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _683 = _587 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _687 = 1.0 / _629;
    float _689 = 1.0 / _645;
    float _691 = _663 * _659;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _697 = _657 * _667;
    float _699 = -_657;
    float _701 = _699 + 1.0;
    float _703 = fma(_691, _619, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _705;
    float _709 = _679 * _701;
    float _711 = _695 * _687;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _715 = _615 + _713;
    bool _717 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _719 = isnan(_615);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = _703 * _709;
    float _731 = -_679;
    float _733 = _731 + 1.0;
    float _735 = fma(_711, _715, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _739 = _615 + _737;
    float _741 = _707 * _689;
    float _743 = -_727;
    float _745 = _743 + 1.0;
    float _747 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[115].x, _729);
    float _749 = fma(_741, _739, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _751 = _641 * _745;
    float _753 = fma(_735, _697, _747);
    float _755 = fma(_749, _751, _753);
    float _757 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[118].x, _755);
    float _763 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _761 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _757;
    out.m_58.y = _763;
    out.m_58.z = _759;
    out.m_58.w = _765;
    bool _767 = !_685;
    float _783;
    if (!_767)
    {
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _771 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _783 = _781;
        _785 = true;
    }
    else
    {
        float _787 = float(_85);
        float _789 = 1.0 / _787;
        float _791 = _119 * _789;
        _783 = _791;
    }
    _785 = false;
    float _793 = _783;
    float _795 = in.m_42.x;
    float _797 = in.m_42.y;
    float _799 = in.m_42.z;
    float _801 = _265 * _525;
    float _803 = _265 * _575;
    float _805 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _807 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _269);
    float _809 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _811 = _803 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _813 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _815 = _809 * _805;
    float _817 = _811 * _807;
    float _819 = _815 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _821 = _815 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _823 = _815 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _825 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _819);
    float _827 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].z, _825);
    float _829 = _797 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _831 = _797 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _833 = _827 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _835 = _797 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _837 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[6].x, _829);
    float _839 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[4].x, _831);
    float _841 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[5].x, _835);
    float _843 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[6].z, _837);
    float _845 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].x, _821);
    float _847 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[4].z, _839);
    float _849 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].x, _823);
    float _851 = _843 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _853 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].z, _845);
    float _855 = _847 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _857 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[5].z, _841);
    float _859 = _851 + _833;
    float _861 = _853 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _863 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].z, _849);
    float _865 = _857 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _869 = _859 + _867;
    float _871 = _855 + _861;
    float _873 = _863 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _875 = _869 * _869;
    float _877 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _879 = _871 + _877;
    float _881 = _865 + _873;
    float _883 = fma(_879, _879, _875);
    float _885 = sqrt(_883);
    bool _887 = _885 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _889 = _873;
    float _891 = _875;
    float _893 = _871;
    float _895 = _883;
    if (!_887)
    {
        _889 = _859;
    }
    float _897 = _889;
    float _899 = _897;
    if (!_887)
    {
        _891 = _881;
    }
    float _901 = _891;
    bool _903 = !_887;
    float _905 = _901;
    if (!_903)
    {
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _909 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _911 = _885 + _909;
        float _913 = _881 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _915 = rsqrt(_883);
        float _917 = _911 * _907;
        float _919 = _917 * 0.15915493667125701904296875;
        float _921 = _919 * 6.283185482025146484375;
        float _923 = sin(_921);
        float _925 = _919 * 6.283185482025146484375;
        float _927 = cos(_925);
        float _929 = fma(_923, _913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _931 = _915 * _929;
        float _933 = _927 + (-1.0);
        float _935 = _933 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = fma(_879, _931, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _939 = fma(_869, _931, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _941 = fma(_881, _927, _935);
        _905 = _941;
        _893 = _937;
        _899 = _939;
    }
    float _943 = _905;
    float _945 = _893;
    float _947 = _899;
    float _949 = -_865;
    float _951 = _949 + _943;
    float _953 = -_855;
    float _955 = _953 + _945;
    float _957 = -_851;
    float _959 = _957 + _947;
    float _961 = _865 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _963 = _951 * _951;
    bool _965 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _967 = isnan(0.5);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _973 = _969 || _971;
    float _975 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[11].x, _961);
    float _977 = fma(_955, _955, _963);
    bool _979 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _981 = isnan(0.5);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _987 = _983 || _985;
    float _989 = fma(_959, _959, _977);
    float _991 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[11].z, _975);
    float _993 = _865 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _995 = sqrt(_989);
    float _997 = _991 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _999 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[10].x, _993);
    float _1001 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[10].z, _999);
    float _1003 = 1.0 / _997;
    float _1005 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1007 = _1005 + _997;
    bool _1009 = _995 > 0.0;
    float _1011 = _1007 * _1003;
    float _1013 = _1011 * 0.5;
    bool _1015 = !_1009;
    float _1017 = _945;
    float _1019 = _947;
    float _1021 = _943;
    float _1023 = _997;
    if (!_1015)
    {
        float _1025 = _231 * _231;
        float _1027 = fma(_221, _221, _1025);
        float _1029 = rsqrt(_989);
        float _1031 = fma(_239, _239, _1027);
        float _1033 = sqrt(_1031);
        float _1035 = _955 * _1029;
        float _1037 = _951 * _1029;
        float _1039 = _959 * _1029;
        bool _1041 = _1033 > 0.0;
        bool _1043 = !_1041;
        _1023 = _1029;
        _895 = _1037;
        if (!_1043)
        {
            float _1045 = rsqrt(_1031);
            float _1047 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1049 = _231 * _1045;
            float _1051 = _221 * _1045;
            float _1053 = _239 * _1045;
            float _1055 = _1037 * _1049;
            float _1057 = fma(_1035, _1051, _1055);
            float _1059 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1061 = fma(_1039, _1053, _1057);
            float _1063 = _1061 * _1059;
            float _1065 = fma(_221, _1063, _945);
            float _1067 = fma(_231, _1063, _943);
            float _1069 = fma(_239, _1063, _947);
            _1017 = _1065;
            _1019 = _1069;
            _1021 = _1067;
            _1023 = _1063;
        }
    }
    float _1071 = _1017;
    float _1073 = _1019;
    float _1075 = _1021;
    float _1077 = _1023;
    float _1079 = _895;
    float _1081 = _1075;
    float _1083 = _1077;
    float _1085 = _1071;
    float _1087 = _1079;
    if (_987)
    {
        _273 = 1.0;
    }
    float _1089 = _273;
    float _1091 = _1089;
    if (_973)
    {
        _275 = _1071;
    }
    float _1093 = _275;
    float _1095 = _1093;
    if (_973)
    {
        _277 = _1073;
    }
    float _1097 = _277;
    float _1099 = _1097;
    if (!_973)
    {
        float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1103 = _865 + _1101;
        float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1107 = _855 + _1105;
        float _1109 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1111 = -_865;
        float _1113 = _1111 + _1075;
        float _1115 = _1103 * _1103;
        float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1119 = _851 + _1117;
        float _1121 = fma(_1107, _1107, _1115);
        float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1125 = fma(_1119, _1119, _1121);
        float _1127 = sqrt(_1125);
        float _1129 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1131 = precise::min(_1127, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1133 = _1131 * _1123;
        float _1135 = -_855;
        float _1137 = _1135 + _1071;
        float _1139 = _1129 * _1133;
        float _1141 = -_851;
        float _1143 = _1141 + _1073;
        float _1145 = fma(_1137, _1139, _855);
        float _1147 = fma(_1113, _1139, _865);
        float _1149 = fma(_1143, _1139, _851);
        _1081 = _1147;
        _1095 = _1145;
        _1099 = _1149;
        _1083 = _1127;
    }
    float _1151 = _1081;
    float _1153 = _1095;
    float _1155 = _1099;
    float _1157 = _1083;
    float _1159 = _1157;
    if (!_987)
    {
        float _1161 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1163 = _1161 * 0.15915493667125701904296875;
        float _1165 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1169 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1167);
        float _1171 = _1163 * 6.283185482025146484375;
        float _1173 = cos(_1171);
        float _1175 = _1165 * 0.15915493667125701904296875;
        float _1177 = _1163 * 6.283185482025146484375;
        float _1179 = sin(_1177);
        float _1181 = 1.0 / _1173;
        float _1183 = _1175 * 6.283185482025146484375;
        float _1185 = cos(_1183);
        float _1187 = _1179 * _1181;
        float _1189 = _1175 * 6.283185482025146484375;
        float _1191 = sin(_1189);
        float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1195 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1193;
        float _1197 = _1185 * _1187;
        float _1199 = 1.0 / _1169;
        float _1201 = 1.0 / _1197;
        float _1203 = 1.0 / _1195;
        float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1207 = _1199 * _1205;
        float _1209 = _1191 * _1201;
        float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1213 = fma(_1209, _1207, _1211);
        float _1215 = _1213 * _1203;
        float _1217 = precise::clamp(_1215, 0.0, 1.0);
        _1159 = _1163;
        _1085 = _1201;
        _1091 = _1217;
    }
    float _1219 = _1159;
    float _1221 = _1085;
    float _1223 = _1091;
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1227 = _1151 + _1225;
    float _1229 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1231 = _1153 + _1229;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1235 = _1155 + _1233;
    float _1237 = _1227 * _1227;
    float _1239 = fma(_1231, _1231, _1237);
    float _1241 = fma(_1235, _1235, _1239);
    float _1243 = rsqrt(_1241);
    float _1245 = _1243 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1247 = _1231 * _1245;
    float _1249 = _1235 * _1245;
    float _1251 = _1247 * _1247;
    float _1253 = _1249 * _1249;
    float _1255 = _1251 + _1253;
    float _1257 = sqrt(_1255);
    bool _1259 = _1257 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1263 = _1257 + _1261;
    float _1265 = _1239;
    float _1267 = _1221;
    float _1269 = _1263;
    float _1271 = _1219;
    float _1273 = _1227;
    if (_1259)
    {
        float _1275 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1265 = _1275;
    }
    float _1277 = _1265;
    if (_1259)
    {
        float _1279 = rsqrt(_1255);
        _1267 = _1279;
    }
    float _1281 = _1267;
    float _1283 = _1281;
    if (_1259)
    {
        float _1285 = _1263 * _1277;
        _1269 = _1285;
    }
    float _1287 = _1269;
    if (_1259)
    {
        float _1289 = _1287 * 0.15915493667125701904296875;
        _1271 = _1289;
    }
    float _1291 = _1271;
    float _1293 = _1235;
    if (_1259)
    {
        float _1295 = _1291 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        _1293 = _1297;
    }
    float _1299 = _1293;
    float _1301 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1303 = precise::max(0.0, _1301);
    float _1305 = _1243;
    float _1307 = _1303;
    float _1309 = _1301;
    if (_1259)
    {
        float _1311 = _1291 * 6.283185482025146484375;
        float _1313 = cos(_1311);
        _1305 = _1313;
    }
    float _1315 = _1305;
    float _1317 = -_1245;
    float _1319 = -_1303;
    float _1321 = fma(_1227, _1317, _1319);
    if (_1259)
    {
        float _1323 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1307 = _1323;
    }
    float _1325 = _1307;
    float _1327 = sqrt(_1241);
    float _1329 = _1299;
    float _1331 = _1325;
    if (_1259)
    {
        float _1333 = fma(_1299, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1273 = _1333;
    }
    float _1335 = _1273;
    float _1337 = _1335;
    if (!_1259)
    {
        _1329 = _1247;
    }
    float _1339 = _1329;
    float _1341 = _1339;
    if (!_1259)
    {
        _1331 = _1251;
    }
    float _1343 = _1331;
    float _1345 = _1343;
    float _1347 = _1315;
    if (_1259)
    {
        float _1349 = _1315 + (-1.0);
        _1309 = _1349;
    }
    float _1351 = _1309;
    float _1353 = _1351;
    if (_1259)
    {
        float _1355 = _1281 * _1335;
        _1087 = _1355;
    }
    float _1357 = _1087;
    if (!_1259)
    {
        _1337 = _1321;
    }
    float _1359 = _1337;
    float _1361 = _1359;
    if (_1259)
    {
        float _1363 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1363;
    }
    float _1365 = _1283;
    if (_1259)
    {
        float _1367 = _1247 * _1357;
        _1341 = _1367;
    }
    float _1369 = _1341;
    if (!_1259)
    {
        _1353 = _1249;
    }
    float _1371 = _1353;
    float _1373 = _1371;
    if (_1259)
    {
        float _1375 = _1249 * _1357;
        _1373 = _1375;
    }
    float _1377 = _1373;
    if (_1259)
    {
        float _1379 = fma(_1321, _1315, _1365);
        _1361 = _1379;
    }
    float _1381 = _1361;
    if (_1259)
    {
        float _1383 = _1369 * _1369;
        _1345 = _1383;
    }
    float _1385 = _1345;
    if (!_1259)
    {
        _1347 = _1253;
    }
    float _1387 = _1347;
    float _1389 = _1387;
    if (_1259)
    {
        float _1391 = _1377 * _1377;
        _1389 = _1391;
    }
    float _1393 = _1389;
    float _1395 = fma(_1381, _1381, _1385);
    float _1397 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1399 = _1395 + _1393;
    float _1401 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1405 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1403);
    float _1407 = precise::clamp(_1405, 0.0, 1.0);
    float _1409 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1411 = rsqrt(_1399);
    float _1413 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1401);
    float _1415 = -_1407;
    float _1417 = _1415 + 1.0;
    float _1419 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1409);
    float _1421 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1397);
    float _1423 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1413);
    float _1425 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1427 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1419);
    float _1429 = abs(_1417);
    float _1431 = log2(_1429);
    float _1433 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1421);
    float _1435 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1425);
    float _1437 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1439 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1441 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1443 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1435);
    float _1445 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1447 = _1411 * _1369;
    float _1449 = _1411 * _1377;
    float _1451 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1453 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1455 = _1447 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1457 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1459 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1453);
    float _1461 = _1411 * _1381;
    float _1463 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1465 = -_1457;
    float _1467 = fma(_1465, _1441, 1.0);
    float _1469 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1459);
    float _1471 = -_1455;
    float _1473 = fma(_1461, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1471);
    float _1475 = exp2(_1463);
    float _1477 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1469);
    float _1479 = -_1449;
    float _1481 = fma(_1479, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1473);
    float _1483 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1485 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1487 = fma(_1481, -0.5, 0.5);
    float _1489 = log2(_1467);
    float _1491 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1483);
    float _1493 = fma(_1481, 0.5, 0.5);
    float _1495 = _1461 + 1.0;
    float _1497 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1491);
    float _1499 = fma(_1493, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1501 = 1.0 / _1477;
    float _1503 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1485);
    float _1505 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1497);
    float _1507 = -_1461;
    float _1509 = fma(_1475, _1495, _1507);
    float _1511 = fma(_1493, _1499, -0.212114393711090087890625);
    float _1513 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1503);
    float _1515 = fma(_1509, 0.5, 0.5);
    float _1517 = sqrt(_1487);
    float _1519 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1513);
    float _1521 = _1489 * 0.693147182464599609375;
    float _1523 = fma(_1493, _1511, 1.570728778839111328125);
    float _1525 = _1505 * _1501;
    float _1527 = _1519 * _1501;
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1531 = fma(_1525, 0.5, 0.5);
    float _1533 = fma(_1527, -0.5, 0.5);
    float _1535 = _1517 * 0.636619746685028076171875;
    float3 _4291 = float3(_1531, _1533, _1529);
    float _1537 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4291, float3(0.0), isnan(_4291)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4291, float3(0.0), isnan(_4291)), level(0.0)).x;
    float3 _4302 = float3(_1531, _1533, _1529);
    float4 _1540 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4302, float3(0.0), isnan(_4302)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4302, float3(0.0), isnan(_4302)), level(0.0)).xyzw;
    float _1542 = _1540.x;
    float _1544 = _1540.y;
    float _1546 = _1540.z;
    float _1548 = _1540.w;
    float _1550 = -_1523;
    float _1552 = fma(_1535, _1550, 1.0);
    float2 _4324 = float2(_1552, _1515);
    float3 _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4324, float2(0.0), isnan(_4324)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4324, float2(0.0), isnan(_4324)), level(0.0)).xyz;
    float _1558 = _1556.x;
    float _1560 = _1556.y;
    float _1562 = _1556.z;
    float _1564 = in.m_49.y;
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1568 = _793 + _1566;
    float _1570 = in.m_49.z;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1574 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1572;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1578 = _1576 != 0;
    float _1580 = in.m_49.w;
    float _1582 = 1.0 / _1574;
    float _1584 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1588 = _1586 != 0;
    float _1590 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1594 = _1592 != 0;
    float _1596 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1600 = _1598 != 0;
    float _1602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1606 = _1604 != 0;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1612 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1596);
    float _1614 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1616 = _139 > 0.5;
    float _1618 = _1568 * _1582;
    float _1620 = fma(_1614, -2.0, _1610);
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1624 = -_269;
    int _1626 = _1616 ? as_type<int>(_1624) : as_type<int>(_269);
    float _1628 = -_1608;
    float _1630 = fma(_1584, 2.0, _1628);
    bool _1632 = _1570 > 0.5;
    float _1634 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1622);
    float _1636 = _1584;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1640 = _1570;
    if (!_1578)
    {
        _1636 = _1564;
    }
    float _1642 = _1636;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1646 = _1642;
    if (_1578)
    {
        _1646 = _139;
    }
    float _1648 = _1646;
    float _1650 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1620);
    float _1652 = -_269;
    int _1654 = _1632 ? as_type<int>(_1652) : as_type<int>(_269);
    float _1656 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1644);
    bool _1658 = _1564 > 0.5;
    float _1660 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1662 = _1580 > 0.5;
    float _1664 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1634);
    if (!_1578)
    {
        _1638 = _1570;
    }
    float _1666 = _1638;
    float _1668 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1656);
    float _1670 = _1666;
    if (_1578)
    {
        _1670 = _1564;
    }
    float _1672 = _1670;
    if (_1578)
    {
        _1640 = _1564;
    }
    float _1674 = _1640;
    float _1676 = exp2(_1590);
    float _1678 = -_177;
    int _1680 = _1658 ? as_type<int>(_1678) : as_type<int>(_177);
    float _1682 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1684 = -_177;
    int _1686 = _1662 ? as_type<int>(_1684) : as_type<int>(_177);
    float _1688 = -_1668;
    float _1690 = _1688 + 1.0;
    bool _1692 = !_1588;
    float _1694 = _1692 ? _269 : as_type<float>(_1626);
    bool _1696 = !_1600;
    float _1698 = _1696 ? _269 : as_type<float>(_1654);
    float _1700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1702 = !_1594;
    float _1704 = _1702 ? _177 : as_type<float>(_1680);
    bool _1706 = !_1606;
    float _1708 = _1706 ? _177 : as_type<float>(_1686);
    float _1710 = _1602 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1712 = -_119;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1630);
    float _1716 = _1694 + 0.5;
    float _1718 = -_1676;
    float _1720 = _1718 + 1.0;
    float _1722 = fma(_1710, _1716, _1714);
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1724;
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1728;
    float _1732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1734;
    float _1738 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1742 = fma(_1726, _1618, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1744 = fma(_1730, _1618, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1746 = _1704 + (-0.5);
    float _1748 = fma(_1736, _1618, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1750 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1752 = isnan(_793);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1740);
    float _1764 = -_1738;
    float _1766 = -_1650;
    float _1768 = fma(_1764, _1746, _1766);
    bool _1770 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1772 = isnan(_793);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1778 = _1774 || _1776;
    float _1780 = float(_1778);
    float _1782 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1784 = -_1760;
    float _1786 = _1784 + 1.0;
    float _1788 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1762);
    float _1790 = _1780 * _1786;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1796 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1800 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1802 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1794);
    float _1804 = -_1792;
    float _1806 = fma(_1796, 2.0, _1804);
    float _1808 = fma(_1682, -2.0, _1798);
    float _1810 = _1698 + 0.5;
    float _1812 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1802);
    float _1814 = -_119;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1806);
    float _1818 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1808);
    float _1820 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1822 = _1708 + (-0.5);
    float _1824 = fma(_1800, _1810, _1816);
    float _1826 = -_1812;
    float _1828 = _1826 + 1.0;
    float _1830 = -_1788;
    float _1832 = _1830 + 1.0;
    float _1834 = -_1820;
    float _1836 = -_1818;
    float _1838 = fma(_1834, _1822, _1836);
    float _1840 = _1742 * _1790;
    float _1842 = _1744 * _1790;
    float _1844 = _1748 * _1790;
    float _1846 = -_1780;
    float _1848 = _1846 + 1.0;
    float _1850 = -_1664;
    float _1852 = _1850 + 1.0;
    float _1854 = -_1828;
    float _1856 = fma(_1698, _1854, _1824);
    float _1858 = fma(_1708, _1832, _1838);
    float _1860 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1840);
    float _1862 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1842);
    float _1864 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1844);
    float _1866 = -_1852;
    float _1868 = fma(_1694, _1866, _1722);
    float _1870 = fma(_1704, _1690, _1768);
    float _1872 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1612);
    float _1874 = _1477 * 0.5;
    float _1876 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1860);
    float _1878 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1862);
    float _1880 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1864);
    float _1882 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1872);
    out.m_60.x = _1868;
    out.m_60.y = _1870;
    out.m_60.z = _1856;
    out.m_60.w = _1858;
    bool _1884 = _1223 > 0.0;
    bool _1886 = isnan(_1223);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan(0.0);
    bool _1892 = _1888 || _1890;
    float _1894 = _1223 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1896 = _1876 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1898 = _1878 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1900 = _1880 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1902 = -_1782;
    float _1904 = _1902 + 1.0;
    out.gl_Position.x = _1505;
    out.gl_Position.y = _1519;
    out.gl_Position.z = _1882;
    out.gl_Position.w = _1477;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1908 = _1896 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1912 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = _1894 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1916 = fma(_1519, -0.5, _1874);
    float _1918 = _1882 + _1477;
    float _1920 = _1505 + _1477;
    out.m_62.x = _1908;
    out.m_62.y = _1910;
    out.m_62.z = _1912;
    out.m_62.w = _1906;
    float _1922 = _1918 * 0.5;
    float _1924 = _1920 * 0.5;
    out.m_45.x = _1914;
    out.m_64.x = _1924;
    out.m_64.y = _1916;
    out.m_64.z = _1922;
    out.m_64.w = _1477;
    float _1926 = _1782 * _1537;
    float _1928 = _1548 * _1904;
    float _1930 = _1548 * _1926;
    float _1932 = _1562 * _1926;
    float _1934 = fma(_1558, _1930, _1542);
    float _1936 = fma(_1560, _1930, _1544);
    float _1938 = fma(_1548, _1932, _1546);
    out.m_66.x = _1934;
    out.m_66.y = _1936;
    out.m_66.z = _1938;
    out.m_66.w = _1928;
    if (_1892)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _1940 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1940;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _785 = false;
    bool _607 = false;
    bool _487 = false;
    bool _295 = false;
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
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1997 = as_type<float>(_101);
        out.gl_Position.z = _1997;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2066 = as_type<float>(_137);
        out.gl_Position.z = _2066;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_54.x;
    float _149 = in.m_54.y;
    float _151 = in.m_54.z;
    float _153 = _143 * _141;
    float _155 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    int _157 = as_type<int>(_145) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_145) & 2;
    bool _163 = _161 != 0;
    float _165 = _155 * 6.283185482025146484375;
    int _167 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _169 = _167 != 0;
    float _171 = floor(_155);
    float _173 = _165 * 0.15915493667125701904296875;
    bool _175 = !_163;
    float _177 = _175 ? (-0.5) : 0.5;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _183 = _181 != 0;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _187 = _185 != 0;
    float _189 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _191 = !_169;
    int _193 = _191 ? 0 : 1;
    float _195 = _173 * 6.283185482025146484375;
    float _197 = cos(_195);
    float _199 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _201 = !_183;
    int _203 = _201 ? 0 : 1;
    float _205 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _189);
    int _207 = abs(_193);
    float _209 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _179);
    int _211 = abs(_203);
    float _213 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _199);
    float _215 = -_171;
    float _217 = _155 + _215;
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _205);
    float _223 = -_217;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _227 = !_187;
    int _229 = _227 ? 0 : 1;
    float _231 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _209);
    float _233 = float(_211);
    float _235 = fma(_197, 0.5, 0.5);
    int _237 = abs(_229);
    float _239 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _213);
    bool _241 = _217 < 0.5;
    float _243 = float(_241);
    float _245 = abs(_225);
    float _247 = _233 * _245;
    float _249 = float(_207);
    float _251 = -_235;
    float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _255 = -_243;
    float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _259 = fma(_249, _253, _247);
    float _261 = float(_237);
    float _263 = abs(_257);
    float _265 = fma(_261, _263, _259);
    bool _267 = !_159;
    float _269 = _267 ? (-0.5) : 0.5;
    bool _271 = !_219;
    float _273 = _239;
    float _275 = _231;
    float _277 = _221;
    float _293;
    if (!_271)
    {
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _281 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _293 = _291;
        _295 = true;
    }
    else
    {
        float _297 = float(_85);
        float _299 = 1.0 / _297;
        float _301 = _119 * _299;
        _293 = _301;
    }
    _295 = false;
    float _303 = _293;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = _303 + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = _303 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _303 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _325;
    bool _329 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _331 = isnan(_303);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = 1.0 / _319;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _345 = 1.0 / _327;
    float _347 = 1.0 / _323;
    float _349 = _307 * _341;
    bool _351 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _353 = isnan(_303);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -_339;
    float _365 = _363 + 1.0;
    float _367 = _361 * _365;
    float _369 = _311 * _345;
    bool _371 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _373 = isnan(_303);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -_361;
    float _385 = _383 + 1.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = _381 * _385;
    float _393 = -_381;
    float _395 = _393 + 1.0;
    float _397 = _315 * _347;
    bool _399 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _401 = isnan(_303);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _423 = fma(_413, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _425 = _409 * _395;
    float _427 = fma(_417, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _429 = -_409;
    float _431 = _429 + 1.0;
    float _433 = _423 * _425;
    float _435 = _427 * _425;
    float _437 = fma(_389, _397, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _439 = fma(_421, _397, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _441 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[143].x, _433);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _447;
    float _451 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[143].y, _435);
    float _453 = fma(_437, _391, _441);
    float _455 = fma(_445, _369, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _457 = fma(_449, _369, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _459 = fma(_439, _391, _451);
    float _461 = fma(_455, _367, _453);
    float _463 = fma(_457, _367, _459);
    float _465 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].x, _461);
    float _467 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].y, _463);
    bool _469 = !_343;
    float _485;
    if (!_469)
    {
        float _471 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _473 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _477 = _475 * _471;
        float _479 = floor(_477);
        float _481 = -_479;
        float _483 = _477 + _481;
        _485 = _483;
        _487 = true;
    }
    else
    {
        float _489 = float(_85);
        float _491 = 1.0 / _489;
        float _493 = _119 * _491;
        _485 = _493;
    }
    _487 = false;
    float _495 = _485;
    float _497 = in.m_56.x;
    float _499 = in.m_56.y;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _503 = _495 + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _505;
    bool _509 = _495 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _511 = isnan(_495);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    bool _521 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _523 = 1.0 / _507;
    float _525 = _467 * _499;
    bool _527 = _495 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _529 = isnan(_495);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = _503 * _523;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _541;
    float _545 = -_537;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _553;
    float _557 = _519 * _547;
    float _559 = fma(_543, _539, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _561 = fma(_551, _539, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _563 = fma(_555, _539, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _565 = -_519;
    float _567 = _565 + 1.0;
    float _569 = _559 * _557;
    float _571 = _561 * _557;
    float _573 = _563 * _557;
    float _575 = _465 * _497;
    float _577 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].y, _569);
    float _579 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].x, _571);
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].z, _573);
    float _583 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[108].y, _577);
    float _585 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[108].x, _579);
    float _587 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[108].z, _581);
    bool _589 = !_521;
    float _605;
    if (!_589)
    {
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _593 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_85);
        float _611 = 1.0 / _609;
        float _613 = _119 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _615 + _617;
    float _621 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _631 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _633 = isnan(_615);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _647 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _649 = isnan(_615);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = 1.0 / _625;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _661;
    float _665 = -_641;
    float _667 = _665 + 1.0;
    bool _669 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _671 = isnan(_615);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _683 = _587 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _687 = 1.0 / _629;
    float _689 = 1.0 / _645;
    float _691 = _663 * _659;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _697 = _657 * _667;
    float _699 = -_657;
    float _701 = _699 + 1.0;
    float _703 = fma(_691, _619, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _705;
    float _709 = _679 * _701;
    float _711 = _695 * _687;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _715 = _615 + _713;
    bool _717 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _719 = isnan(_615);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = _703 * _709;
    float _731 = -_679;
    float _733 = _731 + 1.0;
    float _735 = fma(_711, _715, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _739 = _615 + _737;
    float _741 = _707 * _689;
    float _743 = -_727;
    float _745 = _743 + 1.0;
    float _747 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[115].x, _729);
    float _749 = fma(_741, _739, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _751 = _641 * _745;
    float _753 = fma(_735, _697, _747);
    float _755 = fma(_749, _751, _753);
    float _757 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[118].x, _755);
    float _763 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _761 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _757;
    out.m_58.y = _763;
    out.m_58.z = _759;
    out.m_58.w = _765;
    bool _767 = !_685;
    float _783;
    if (!_767)
    {
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _771 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _783 = _781;
        _785 = true;
    }
    else
    {
        float _787 = float(_85);
        float _789 = 1.0 / _787;
        float _791 = _119 * _789;
        _783 = _791;
    }
    _785 = false;
    float _793 = _783;
    float _795 = in.m_42.x;
    float _797 = in.m_42.y;
    float _799 = in.m_42.z;
    float _801 = _265 * _525;
    float _803 = _265 * _575;
    float _805 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _807 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _269);
    float _809 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _811 = _803 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _813 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _815 = _809 * _805;
    float _817 = _811 * _807;
    float _819 = _815 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _821 = _815 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _823 = _815 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _825 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _819);
    float _827 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].z, _825);
    float _829 = _797 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _831 = _797 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _833 = _827 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _835 = _797 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _837 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[6].x, _829);
    float _839 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[4].x, _831);
    float _841 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[5].x, _835);
    float _843 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[6].z, _837);
    float _845 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].x, _821);
    float _847 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[4].z, _839);
    float _849 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].x, _823);
    float _851 = _843 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _853 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].z, _845);
    float _855 = _847 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _857 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[5].z, _841);
    float _859 = _851 + _833;
    float _861 = _853 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _863 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].z, _849);
    float _865 = _857 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _869 = _859 + _867;
    float _871 = _855 + _861;
    float _873 = _863 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _875 = _869 * _869;
    float _877 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _879 = _871 + _877;
    float _881 = _865 + _873;
    float _883 = fma(_879, _879, _875);
    float _885 = sqrt(_883);
    bool _887 = _885 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _889 = _873;
    float _891 = _875;
    float _893 = _871;
    float _895 = _883;
    if (!_887)
    {
        _889 = _859;
    }
    float _897 = _889;
    float _899 = _897;
    if (!_887)
    {
        _891 = _881;
    }
    float _901 = _891;
    bool _903 = !_887;
    float _905 = _901;
    if (!_903)
    {
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _909 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _911 = _885 + _909;
        float _913 = _881 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _915 = rsqrt(_883);
        float _917 = _911 * _907;
        float _919 = _917 * 0.15915493667125701904296875;
        float _921 = _919 * 6.283185482025146484375;
        float _923 = sin(_921);
        float _925 = _919 * 6.283185482025146484375;
        float _927 = cos(_925);
        float _929 = fma(_923, _913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _931 = _915 * _929;
        float _933 = _927 + (-1.0);
        float _935 = _933 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = fma(_879, _931, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _939 = fma(_869, _931, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _941 = fma(_881, _927, _935);
        _905 = _941;
        _893 = _937;
        _899 = _939;
    }
    float _943 = _905;
    float _945 = _893;
    float _947 = _899;
    float _949 = -_865;
    float _951 = _949 + _943;
    float _953 = -_855;
    float _955 = _953 + _945;
    float _957 = -_851;
    float _959 = _957 + _947;
    float _961 = _865 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _963 = _951 * _951;
    bool _965 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _967 = isnan(0.5);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _973 = _969 || _971;
    float _975 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[11].x, _961);
    float _977 = fma(_955, _955, _963);
    bool _979 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _981 = isnan(0.5);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _987 = _983 || _985;
    float _989 = fma(_959, _959, _977);
    float _991 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[11].z, _975);
    float _993 = _865 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _995 = sqrt(_989);
    float _997 = _991 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _999 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[10].x, _993);
    float _1001 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[10].z, _999);
    float _1003 = 1.0 / _997;
    float _1005 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1007 = _1005 + _997;
    bool _1009 = _995 > 0.0;
    float _1011 = _1007 * _1003;
    float _1013 = _1011 * 0.5;
    bool _1015 = !_1009;
    float _1017 = _945;
    float _1019 = _947;
    float _1021 = _943;
    float _1023 = _997;
    if (!_1015)
    {
        float _1025 = _231 * _231;
        float _1027 = fma(_221, _221, _1025);
        float _1029 = rsqrt(_989);
        float _1031 = fma(_239, _239, _1027);
        float _1033 = sqrt(_1031);
        float _1035 = _955 * _1029;
        float _1037 = _951 * _1029;
        float _1039 = _959 * _1029;
        bool _1041 = _1033 > 0.0;
        bool _1043 = !_1041;
        _1023 = _1029;
        _895 = _1037;
        if (!_1043)
        {
            float _1045 = rsqrt(_1031);
            float _1047 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1049 = _231 * _1045;
            float _1051 = _221 * _1045;
            float _1053 = _239 * _1045;
            float _1055 = _1037 * _1049;
            float _1057 = fma(_1035, _1051, _1055);
            float _1059 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1061 = fma(_1039, _1053, _1057);
            float _1063 = _1061 * _1059;
            float _1065 = fma(_221, _1063, _945);
            float _1067 = fma(_231, _1063, _943);
            float _1069 = fma(_239, _1063, _947);
            _1017 = _1065;
            _1019 = _1069;
            _1021 = _1067;
            _1023 = _1063;
        }
    }
    float _1071 = _1017;
    float _1073 = _1019;
    float _1075 = _1021;
    float _1077 = _1023;
    float _1079 = _895;
    float _1081 = _1075;
    float _1083 = _1077;
    float _1085 = _1071;
    float _1087 = _1079;
    if (_987)
    {
        _273 = 1.0;
    }
    float _1089 = _273;
    float _1091 = _1089;
    if (_973)
    {
        _275 = _1071;
    }
    float _1093 = _275;
    float _1095 = _1093;
    if (_973)
    {
        _277 = _1073;
    }
    float _1097 = _277;
    float _1099 = _1097;
    if (!_973)
    {
        float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1103 = _865 + _1101;
        float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1107 = _855 + _1105;
        float _1109 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1111 = -_865;
        float _1113 = _1111 + _1075;
        float _1115 = _1103 * _1103;
        float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1119 = _851 + _1117;
        float _1121 = fma(_1107, _1107, _1115);
        float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1125 = fma(_1119, _1119, _1121);
        float _1127 = sqrt(_1125);
        float _1129 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1131 = precise::min(_1127, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1133 = _1131 * _1123;
        float _1135 = -_855;
        float _1137 = _1135 + _1071;
        float _1139 = _1129 * _1133;
        float _1141 = -_851;
        float _1143 = _1141 + _1073;
        float _1145 = fma(_1137, _1139, _855);
        float _1147 = fma(_1113, _1139, _865);
        float _1149 = fma(_1143, _1139, _851);
        _1081 = _1147;
        _1095 = _1145;
        _1099 = _1149;
        _1083 = _1127;
    }
    float _1151 = _1081;
    float _1153 = _1095;
    float _1155 = _1099;
    float _1157 = _1083;
    float _1159 = _1157;
    if (!_987)
    {
        float _1161 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1163 = _1161 * 0.15915493667125701904296875;
        float _1165 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1169 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1167);
        float _1171 = _1163 * 6.283185482025146484375;
        float _1173 = cos(_1171);
        float _1175 = _1165 * 0.15915493667125701904296875;
        float _1177 = _1163 * 6.283185482025146484375;
        float _1179 = sin(_1177);
        float _1181 = 1.0 / _1173;
        float _1183 = _1175 * 6.283185482025146484375;
        float _1185 = cos(_1183);
        float _1187 = _1179 * _1181;
        float _1189 = _1175 * 6.283185482025146484375;
        float _1191 = sin(_1189);
        float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1195 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1193;
        float _1197 = _1185 * _1187;
        float _1199 = 1.0 / _1169;
        float _1201 = 1.0 / _1197;
        float _1203 = 1.0 / _1195;
        float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1207 = _1199 * _1205;
        float _1209 = _1191 * _1201;
        float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1213 = fma(_1209, _1207, _1211);
        float _1215 = _1213 * _1203;
        float _1217 = precise::clamp(_1215, 0.0, 1.0);
        _1159 = _1163;
        _1085 = _1201;
        _1091 = _1217;
    }
    float _1219 = _1159;
    float _1221 = _1085;
    float _1223 = _1091;
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1227 = _1151 + _1225;
    float _1229 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1231 = _1153 + _1229;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1235 = _1155 + _1233;
    float _1237 = _1227 * _1227;
    float _1239 = fma(_1231, _1231, _1237);
    float _1241 = fma(_1235, _1235, _1239);
    float _1243 = rsqrt(_1241);
    float _1245 = _1243 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1247 = _1231 * _1245;
    float _1249 = _1235 * _1245;
    float _1251 = _1247 * _1247;
    float _1253 = _1249 * _1249;
    float _1255 = _1251 + _1253;
    float _1257 = sqrt(_1255);
    bool _1259 = _1257 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1263 = _1257 + _1261;
    float _1265 = _1239;
    float _1267 = _1221;
    float _1269 = _1263;
    float _1271 = _1219;
    float _1273 = _1227;
    if (_1259)
    {
        float _1275 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1265 = _1275;
    }
    float _1277 = _1265;
    if (_1259)
    {
        float _1279 = rsqrt(_1255);
        _1267 = _1279;
    }
    float _1281 = _1267;
    float _1283 = _1281;
    if (_1259)
    {
        float _1285 = _1263 * _1277;
        _1269 = _1285;
    }
    float _1287 = _1269;
    if (_1259)
    {
        float _1289 = _1287 * 0.15915493667125701904296875;
        _1271 = _1289;
    }
    float _1291 = _1271;
    float _1293 = _1235;
    if (_1259)
    {
        float _1295 = _1291 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        _1293 = _1297;
    }
    float _1299 = _1293;
    float _1301 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1303 = precise::max(0.0, _1301);
    float _1305 = _1243;
    float _1307 = _1303;
    float _1309 = _1301;
    if (_1259)
    {
        float _1311 = _1291 * 6.283185482025146484375;
        float _1313 = cos(_1311);
        _1305 = _1313;
    }
    float _1315 = _1305;
    float _1317 = -_1245;
    float _1319 = -_1303;
    float _1321 = fma(_1227, _1317, _1319);
    if (_1259)
    {
        float _1323 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1307 = _1323;
    }
    float _1325 = _1307;
    float _1327 = sqrt(_1241);
    float _1329 = _1299;
    float _1331 = _1325;
    if (_1259)
    {
        float _1333 = fma(_1299, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1273 = _1333;
    }
    float _1335 = _1273;
    float _1337 = _1335;
    if (!_1259)
    {
        _1329 = _1247;
    }
    float _1339 = _1329;
    float _1341 = _1339;
    if (!_1259)
    {
        _1331 = _1251;
    }
    float _1343 = _1331;
    float _1345 = _1343;
    float _1347 = _1315;
    if (_1259)
    {
        float _1349 = _1315 + (-1.0);
        _1309 = _1349;
    }
    float _1351 = _1309;
    float _1353 = _1351;
    if (_1259)
    {
        float _1355 = _1281 * _1335;
        _1087 = _1355;
    }
    float _1357 = _1087;
    if (!_1259)
    {
        _1337 = _1321;
    }
    float _1359 = _1337;
    float _1361 = _1359;
    if (_1259)
    {
        float _1363 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1363;
    }
    float _1365 = _1283;
    if (_1259)
    {
        float _1367 = _1247 * _1357;
        _1341 = _1367;
    }
    float _1369 = _1341;
    if (!_1259)
    {
        _1353 = _1249;
    }
    float _1371 = _1353;
    float _1373 = _1371;
    if (_1259)
    {
        float _1375 = _1249 * _1357;
        _1373 = _1375;
    }
    float _1377 = _1373;
    if (_1259)
    {
        float _1379 = fma(_1321, _1315, _1365);
        _1361 = _1379;
    }
    float _1381 = _1361;
    if (_1259)
    {
        float _1383 = _1369 * _1369;
        _1345 = _1383;
    }
    float _1385 = _1345;
    if (!_1259)
    {
        _1347 = _1253;
    }
    float _1387 = _1347;
    float _1389 = _1387;
    if (_1259)
    {
        float _1391 = _1377 * _1377;
        _1389 = _1391;
    }
    float _1393 = _1389;
    float _1395 = fma(_1381, _1381, _1385);
    float _1397 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1399 = _1395 + _1393;
    float _1401 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1405 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1403);
    float _1407 = precise::clamp(_1405, 0.0, 1.0);
    float _1409 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1411 = rsqrt(_1399);
    float _1413 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1401);
    float _1415 = -_1407;
    float _1417 = _1415 + 1.0;
    float _1419 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1409);
    float _1421 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1397);
    float _1423 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1413);
    float _1425 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1427 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1419);
    float _1429 = abs(_1417);
    float _1431 = log2(_1429);
    float _1433 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1421);
    float _1435 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1425);
    float _1437 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1439 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1441 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1443 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1435);
    float _1445 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1447 = _1411 * _1369;
    float _1449 = _1411 * _1377;
    float _1451 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1453 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1455 = _1447 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1457 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1459 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1453);
    float _1461 = _1411 * _1381;
    float _1463 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1465 = -_1457;
    float _1467 = fma(_1465, _1441, 1.0);
    float _1469 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1459);
    float _1471 = -_1455;
    float _1473 = fma(_1461, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1471);
    float _1475 = exp2(_1463);
    float _1477 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1469);
    float _1479 = -_1449;
    float _1481 = fma(_1479, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1473);
    float _1483 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1485 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1487 = fma(_1481, -0.5, 0.5);
    float _1489 = log2(_1467);
    float _1491 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1483);
    float _1493 = fma(_1481, 0.5, 0.5);
    float _1495 = _1461 + 1.0;
    float _1497 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1491);
    float _1499 = fma(_1493, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1501 = 1.0 / _1477;
    float _1503 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1485);
    float _1505 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1497);
    float _1507 = -_1461;
    float _1509 = fma(_1475, _1495, _1507);
    float _1511 = fma(_1493, _1499, -0.212114393711090087890625);
    float _1513 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1503);
    float _1515 = fma(_1509, 0.5, 0.5);
    float _1517 = sqrt(_1487);
    float _1519 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1513);
    float _1521 = _1489 * 0.693147182464599609375;
    float _1523 = fma(_1493, _1511, 1.570728778839111328125);
    float _1525 = _1505 * _1501;
    float _1527 = _1519 * _1501;
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1531 = fma(_1525, 0.5, 0.5);
    float _1533 = fma(_1527, -0.5, 0.5);
    float _1535 = _1517 * 0.636619746685028076171875;
    float3 _4291 = float3(_1531, _1533, _1529);
    float _1537 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4291, float3(0.0), isnan(_4291)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4291, float3(0.0), isnan(_4291)), level(0.0)).x;
    float3 _4302 = float3(_1531, _1533, _1529);
    float4 _1540 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4302, float3(0.0), isnan(_4302)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4302, float3(0.0), isnan(_4302)), level(0.0)).xyzw;
    float _1542 = _1540.x;
    float _1544 = _1540.y;
    float _1546 = _1540.z;
    float _1548 = _1540.w;
    float _1550 = -_1523;
    float _1552 = fma(_1535, _1550, 1.0);
    float2 _4324 = float2(_1552, _1515);
    float3 _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4324, float2(0.0), isnan(_4324)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4324, float2(0.0), isnan(_4324)), level(0.0)).xyz;
    float _1558 = _1556.x;
    float _1560 = _1556.y;
    float _1562 = _1556.z;
    float _1564 = in.m_49.y;
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1568 = _793 + _1566;
    float _1570 = in.m_49.z;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1574 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1572;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1578 = _1576 != 0;
    float _1580 = in.m_49.w;
    float _1582 = 1.0 / _1574;
    float _1584 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1588 = _1586 != 0;
    float _1590 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1594 = _1592 != 0;
    float _1596 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1600 = _1598 != 0;
    float _1602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1606 = _1604 != 0;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1612 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1596);
    float _1614 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1616 = _139 > 0.5;
    float _1618 = _1568 * _1582;
    float _1620 = fma(_1614, -2.0, _1610);
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1624 = -_269;
    int _1626 = _1616 ? as_type<int>(_1624) : as_type<int>(_269);
    float _1628 = -_1608;
    float _1630 = fma(_1584, 2.0, _1628);
    bool _1632 = _1570 > 0.5;
    float _1634 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1622);
    float _1636 = _1584;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1640 = _1570;
    if (!_1578)
    {
        _1636 = _1564;
    }
    float _1642 = _1636;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1646 = _1642;
    if (_1578)
    {
        _1646 = _139;
    }
    float _1648 = _1646;
    float _1650 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1620);
    float _1652 = -_269;
    int _1654 = _1632 ? as_type<int>(_1652) : as_type<int>(_269);
    float _1656 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1644);
    bool _1658 = _1564 > 0.5;
    float _1660 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1662 = _1580 > 0.5;
    float _1664 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1634);
    if (!_1578)
    {
        _1638 = _1570;
    }
    float _1666 = _1638;
    float _1668 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1656);
    float _1670 = _1666;
    if (_1578)
    {
        _1670 = _1564;
    }
    float _1672 = _1670;
    if (_1578)
    {
        _1640 = _1564;
    }
    float _1674 = _1640;
    float _1676 = exp2(_1590);
    float _1678 = -_177;
    int _1680 = _1658 ? as_type<int>(_1678) : as_type<int>(_177);
    float _1682 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1684 = -_177;
    int _1686 = _1662 ? as_type<int>(_1684) : as_type<int>(_177);
    float _1688 = -_1668;
    float _1690 = _1688 + 1.0;
    bool _1692 = !_1588;
    float _1694 = _1692 ? _269 : as_type<float>(_1626);
    bool _1696 = !_1600;
    float _1698 = _1696 ? _269 : as_type<float>(_1654);
    float _1700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1702 = !_1594;
    float _1704 = _1702 ? _177 : as_type<float>(_1680);
    bool _1706 = !_1606;
    float _1708 = _1706 ? _177 : as_type<float>(_1686);
    float _1710 = _1602 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1712 = -_119;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1630);
    float _1716 = _1694 + 0.5;
    float _1718 = -_1676;
    float _1720 = _1718 + 1.0;
    float _1722 = fma(_1710, _1716, _1714);
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1724;
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1728;
    float _1732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1734;
    float _1738 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1742 = fma(_1726, _1618, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1744 = fma(_1730, _1618, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1746 = _1704 + (-0.5);
    float _1748 = fma(_1736, _1618, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1750 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1752 = isnan(_793);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1740);
    float _1764 = -_1738;
    float _1766 = -_1650;
    float _1768 = fma(_1764, _1746, _1766);
    bool _1770 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1772 = isnan(_793);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1778 = _1774 || _1776;
    float _1780 = float(_1778);
    float _1782 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1784 = -_1760;
    float _1786 = _1784 + 1.0;
    float _1788 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1762);
    float _1790 = _1780 * _1786;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1796 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1800 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1802 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1794);
    float _1804 = -_1792;
    float _1806 = fma(_1796, 2.0, _1804);
    float _1808 = fma(_1682, -2.0, _1798);
    float _1810 = _1698 + 0.5;
    float _1812 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1802);
    float _1814 = -_119;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1806);
    float _1818 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1808);
    float _1820 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1822 = _1708 + (-0.5);
    float _1824 = fma(_1800, _1810, _1816);
    float _1826 = -_1812;
    float _1828 = _1826 + 1.0;
    float _1830 = -_1788;
    float _1832 = _1830 + 1.0;
    float _1834 = -_1820;
    float _1836 = -_1818;
    float _1838 = fma(_1834, _1822, _1836);
    float _1840 = _1742 * _1790;
    float _1842 = _1744 * _1790;
    float _1844 = _1748 * _1790;
    float _1846 = -_1780;
    float _1848 = _1846 + 1.0;
    float _1850 = -_1664;
    float _1852 = _1850 + 1.0;
    float _1854 = -_1828;
    float _1856 = fma(_1698, _1854, _1824);
    float _1858 = fma(_1708, _1832, _1838);
    float _1860 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1840);
    float _1862 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1842);
    float _1864 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1844);
    float _1866 = -_1852;
    float _1868 = fma(_1694, _1866, _1722);
    float _1870 = fma(_1704, _1690, _1768);
    float _1872 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1612);
    float _1874 = _1477 * 0.5;
    float _1876 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1860);
    float _1878 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1862);
    float _1880 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1864);
    float _1882 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1872);
    out.m_60.x = _1868;
    out.m_60.y = _1870;
    out.m_60.z = _1856;
    out.m_60.w = _1858;
    bool _1884 = _1223 > 0.0;
    bool _1886 = isnan(_1223);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan(0.0);
    bool _1892 = _1888 || _1890;
    float _1894 = _1223 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1896 = _1876 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1898 = _1878 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1900 = _1880 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1902 = -_1782;
    float _1904 = _1902 + 1.0;
    out.gl_Position.x = _1505;
    out.gl_Position.y = _1519;
    out.gl_Position.z = _1882;
    out.gl_Position.w = _1477;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1908 = _1896 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1912 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = _1894 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1916 = fma(_1519, -0.5, _1874);
    float _1918 = _1882 + _1477;
    float _1920 = _1505 + _1477;
    out.m_62.x = _1908;
    out.m_62.y = _1910;
    out.m_62.z = _1912;
    out.m_62.w = _1906;
    float _1922 = _1918 * 0.5;
    float _1924 = _1920 * 0.5;
    out.m_45.x = _1914;
    out.m_64.x = _1924;
    out.m_64.y = _1916;
    out.m_64.z = _1922;
    out.m_64.w = _1477;
    float _1926 = _1782 * _1537;
    float _1928 = _1548 * _1904;
    float _1930 = _1548 * _1926;
    float _1932 = _1562 * _1926;
    float _1934 = fma(_1558, _1930, _1542);
    float _1936 = fma(_1560, _1930, _1544);
    float _1938 = fma(_1548, _1932, _1546);
    out.m_66.x = _1934;
    out.m_66.y = _1936;
    out.m_66.z = _1938;
    out.m_66.w = _1928;
    if (_1892)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _1940 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1940;
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
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _785 = false;
    bool _607 = false;
    bool _487 = false;
    bool _295 = false;
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
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1997 = as_type<float>(_101);
        out.gl_Position.z = _1997;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_47.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_115)
    {
        float _121 = float(_85);
        _95 = _121;
    }
    float _123 = _95;
    bool _125 = _119 >= _123;
    bool _127 = !_115;
    bool _129 = _125 || _127;
    float _131 = _123;
    if (_129)
    {
        _131 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _131;
    if (_129)
    {
        out.m_45.x = 0.0;
    }
    if (_129)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_129)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2066 = as_type<float>(_137);
        out.gl_Position.z = _2066;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_49.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = in.m_54.x;
    float _149 = in.m_54.y;
    float _151 = in.m_54.z;
    float _153 = _143 * _141;
    float _155 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _153);
    int _157 = as_type<int>(_145) & 1;
    bool _159 = _157 != 0;
    int _161 = as_type<int>(_145) & 2;
    bool _163 = _161 != 0;
    float _165 = _155 * 6.283185482025146484375;
    int _167 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _169 = _167 != 0;
    float _171 = floor(_155);
    float _173 = _165 * 0.15915493667125701904296875;
    bool _175 = !_163;
    float _177 = _175 ? (-0.5) : 0.5;
    float _179 = _149 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _181 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _183 = _181 != 0;
    int _185 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _187 = _185 != 0;
    float _189 = _149 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _191 = !_169;
    int _193 = _191 ? 0 : 1;
    float _195 = _173 * 6.283185482025146484375;
    float _197 = cos(_195);
    float _199 = _149 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _201 = !_183;
    int _203 = _201 ? 0 : 1;
    float _205 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[4].x, _189);
    int _207 = abs(_193);
    float _209 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[5].x, _179);
    int _211 = abs(_203);
    float _213 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[6].x, _199);
    float _215 = -_171;
    float _217 = _155 + _215;
    bool _219 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _221 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[4].z, _205);
    float _223 = -_217;
    float _225 = fma(_223, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _227 = !_187;
    int _229 = _227 ? 0 : 1;
    float _231 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[5].z, _209);
    float _233 = float(_211);
    float _235 = fma(_197, 0.5, 0.5);
    int _237 = abs(_229);
    float _239 = fma(_151, (*spvDescriptorSet0.vp_c10)._m0[6].z, _213);
    bool _241 = _217 < 0.5;
    float _243 = float(_241);
    float _245 = abs(_225);
    float _247 = _233 * _245;
    float _249 = float(_207);
    float _251 = -_235;
    float _253 = fma(_251, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _255 = -_243;
    float _257 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _259 = fma(_249, _253, _247);
    float _261 = float(_237);
    float _263 = abs(_257);
    float _265 = fma(_261, _263, _259);
    bool _267 = !_159;
    float _269 = _267 ? (-0.5) : 0.5;
    bool _271 = !_219;
    float _273 = _239;
    float _275 = _231;
    float _277 = _221;
    float _293;
    if (!_271)
    {
        float _279 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _281 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _285 = _283 * _279;
        float _287 = floor(_285);
        float _289 = -_287;
        float _291 = _285 + _289;
        _293 = _291;
        _295 = true;
    }
    else
    {
        float _297 = float(_85);
        float _299 = 1.0 / _297;
        float _301 = _119 * _299;
        _293 = _301;
    }
    _295 = false;
    float _303 = _293;
    float _305 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _307 = _303 + _305;
    float _309 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _311 = _303 + _309;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _303 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _325;
    bool _329 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _331 = isnan(_303);
    bool _333 = _329 || _331;
    bool _335 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _337 = _333 || _335;
    float _339 = float(_337);
    float _341 = 1.0 / _319;
    bool _343 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _345 = 1.0 / _327;
    float _347 = 1.0 / _323;
    float _349 = _307 * _341;
    bool _351 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _353 = isnan(_303);
    bool _355 = _351 || _353;
    bool _357 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _359 = _355 || _357;
    float _361 = float(_359);
    float _363 = -_339;
    float _365 = _363 + 1.0;
    float _367 = _361 * _365;
    float _369 = _311 * _345;
    bool _371 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _373 = isnan(_303);
    bool _375 = _371 || _373;
    bool _377 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _379 = _375 || _377;
    float _381 = float(_379);
    float _383 = -_361;
    float _385 = _383 + 1.0;
    float _387 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _389 = _387 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _391 = _381 * _385;
    float _393 = -_381;
    float _395 = _393 + 1.0;
    float _397 = _315 * _347;
    bool _399 = _303 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _401 = isnan(_303);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _413 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _423 = fma(_413, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _425 = _409 * _395;
    float _427 = fma(_417, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _429 = -_409;
    float _431 = _429 + 1.0;
    float _433 = _423 * _425;
    float _435 = _427 * _425;
    float _437 = fma(_389, _397, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _439 = fma(_421, _397, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _441 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[143].x, _433);
    float _443 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _445 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _443;
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _447;
    float _451 = fma(_431, (*spvDescriptorSet0.vp_c9)._m0[143].y, _435);
    float _453 = fma(_437, _391, _441);
    float _455 = fma(_445, _369, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _457 = fma(_449, _369, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _459 = fma(_439, _391, _451);
    float _461 = fma(_455, _367, _453);
    float _463 = fma(_457, _367, _459);
    float _465 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].x, _461);
    float _467 = fma(_339, (*spvDescriptorSet0.vp_c9)._m0[146].y, _463);
    bool _469 = !_343;
    float _485;
    if (!_469)
    {
        float _471 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _473 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _475 = fma(_473, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _477 = _475 * _471;
        float _479 = floor(_477);
        float _481 = -_479;
        float _483 = _477 + _481;
        _485 = _483;
        _487 = true;
    }
    else
    {
        float _489 = float(_85);
        float _491 = 1.0 / _489;
        float _493 = _119 * _491;
        _485 = _493;
    }
    _487 = false;
    float _495 = _485;
    float _497 = in.m_56.x;
    float _499 = in.m_56.y;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _503 = _495 + _501;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _505;
    bool _509 = _495 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _511 = isnan(_495);
    bool _513 = _509 || _511;
    bool _515 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _517 = _513 || _515;
    float _519 = float(_517);
    bool _521 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _523 = 1.0 / _507;
    float _525 = _467 * _499;
    bool _527 = _495 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _529 = isnan(_495);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = _503 * _523;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _543 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _541;
    float _545 = -_537;
    float _547 = _545 + 1.0;
    float _549 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _551 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _549;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _555 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _553;
    float _557 = _519 * _547;
    float _559 = fma(_543, _539, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _561 = fma(_551, _539, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _563 = fma(_555, _539, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _565 = -_519;
    float _567 = _565 + 1.0;
    float _569 = _559 * _557;
    float _571 = _561 * _557;
    float _573 = _563 * _557;
    float _575 = _465 * _497;
    float _577 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].y, _569);
    float _579 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].x, _571);
    float _581 = fma(_567, (*spvDescriptorSet0.vp_c9)._m0[107].z, _573);
    float _583 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[108].y, _577);
    float _585 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[108].x, _579);
    float _587 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[108].z, _581);
    bool _589 = !_521;
    float _605;
    if (!_589)
    {
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _593 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[11].y, _119);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_85);
        float _611 = 1.0 / _609;
        float _613 = _119 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _615 + _617;
    float _621 = _585 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _623 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _625 = _623 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _627 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _629 = _627 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _631 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _633 = isnan(_615);
    bool _635 = _631 || _633;
    bool _637 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _639 = _635 || _637;
    float _641 = float(_639);
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _645 = _643 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _647 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _649 = isnan(_615);
    bool _651 = _647 || _649;
    bool _653 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _655 = _651 || _653;
    float _657 = float(_655);
    float _659 = 1.0 / _625;
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _663 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _661;
    float _665 = -_641;
    float _667 = _665 + 1.0;
    bool _669 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _671 = isnan(_615);
    bool _673 = _669 || _671;
    bool _675 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _677 = _673 || _675;
    float _679 = float(_677);
    float _681 = _583 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _683 = _587 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _685 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _687 = 1.0 / _629;
    float _689 = 1.0 / _645;
    float _691 = _663 * _659;
    float _693 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _695 = _693 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _697 = _657 * _667;
    float _699 = -_657;
    float _701 = _699 + 1.0;
    float _703 = fma(_691, _619, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _705;
    float _709 = _679 * _701;
    float _711 = _695 * _687;
    float _713 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _715 = _615 + _713;
    bool _717 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _719 = isnan(_615);
    bool _721 = _717 || _719;
    bool _723 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _725 = _721 || _723;
    float _727 = float(_725);
    float _729 = _703 * _709;
    float _731 = -_679;
    float _733 = _731 + 1.0;
    float _735 = fma(_711, _715, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _739 = _615 + _737;
    float _741 = _707 * _689;
    float _743 = -_727;
    float _745 = _743 + 1.0;
    float _747 = fma(_733, (*spvDescriptorSet0.vp_c9)._m0[115].x, _729);
    float _749 = fma(_741, _739, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _751 = _641 * _745;
    float _753 = fma(_735, _697, _747);
    float _755 = fma(_749, _751, _753);
    float _757 = _621 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _759 = _683 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _761 = fma(_727, (*spvDescriptorSet0.vp_c9)._m0[118].x, _755);
    float _763 = _681 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _765 = _761 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_58.x = _757;
    out.m_58.y = _763;
    out.m_58.z = _759;
    out.m_58.w = _765;
    bool _767 = !_685;
    float _783;
    if (!_767)
    {
        float _769 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _771 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _773 = fma(_771, (*spvDescriptorSet0.vp_c9)._m0[11].z, _119);
        float _775 = _773 * _769;
        float _777 = floor(_775);
        float _779 = -_777;
        float _781 = _775 + _779;
        _783 = _781;
        _785 = true;
    }
    else
    {
        float _787 = float(_85);
        float _789 = 1.0 / _787;
        float _791 = _119 * _789;
        _783 = _791;
    }
    _785 = false;
    float _793 = _783;
    float _795 = in.m_42.x;
    float _797 = in.m_42.y;
    float _799 = in.m_42.z;
    float _801 = _265 * _525;
    float _803 = _265 * _575;
    float _805 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _177);
    float _807 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _269);
    float _809 = _801 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _811 = _803 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _813 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _815 = _809 * _805;
    float _817 = _811 * _807;
    float _819 = _815 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _821 = _815 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _823 = _815 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _825 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[26].x, _819);
    float _827 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[26].z, _825);
    float _829 = _797 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _831 = _797 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _833 = _827 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _835 = _797 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _837 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[6].x, _829);
    float _839 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[4].x, _831);
    float _841 = fma(_795, (*spvDescriptorSet0.vp_c10)._m0[5].x, _835);
    float _843 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[6].z, _837);
    float _845 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[24].x, _821);
    float _847 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[4].z, _839);
    float _849 = fma(_817, (*spvDescriptorSet0.vp_c8)._m0[25].x, _823);
    float _851 = _843 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _853 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[24].z, _845);
    float _855 = _847 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _857 = fma(_799, (*spvDescriptorSet0.vp_c10)._m0[5].z, _841);
    float _859 = _851 + _833;
    float _861 = _853 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _863 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[25].z, _849);
    float _865 = _857 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _867 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _869 = _859 + _867;
    float _871 = _855 + _861;
    float _873 = _863 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _875 = _869 * _869;
    float _877 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _879 = _871 + _877;
    float _881 = _865 + _873;
    float _883 = fma(_879, _879, _875);
    float _885 = sqrt(_883);
    bool _887 = _885 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _889 = _873;
    float _891 = _875;
    float _893 = _871;
    float _895 = _883;
    if (!_887)
    {
        _889 = _859;
    }
    float _897 = _889;
    float _899 = _897;
    if (!_887)
    {
        _891 = _881;
    }
    float _901 = _891;
    bool _903 = !_887;
    float _905 = _901;
    if (!_903)
    {
        float _907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _909 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _911 = _885 + _909;
        float _913 = _881 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _915 = rsqrt(_883);
        float _917 = _911 * _907;
        float _919 = _917 * 0.15915493667125701904296875;
        float _921 = _919 * 6.283185482025146484375;
        float _923 = sin(_921);
        float _925 = _919 * 6.283185482025146484375;
        float _927 = cos(_925);
        float _929 = fma(_923, _913, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _931 = _915 * _929;
        float _933 = _927 + (-1.0);
        float _935 = _933 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _937 = fma(_879, _931, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _939 = fma(_869, _931, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _941 = fma(_881, _927, _935);
        _905 = _941;
        _893 = _937;
        _899 = _939;
    }
    float _943 = _905;
    float _945 = _893;
    float _947 = _899;
    float _949 = -_865;
    float _951 = _949 + _943;
    float _953 = -_855;
    float _955 = _953 + _945;
    float _957 = -_851;
    float _959 = _957 + _947;
    float _961 = _865 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _963 = _951 * _951;
    bool _965 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _967 = isnan(0.5);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _973 = _969 || _971;
    float _975 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[11].x, _961);
    float _977 = fma(_955, _955, _963);
    bool _979 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _981 = isnan(0.5);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _987 = _983 || _985;
    float _989 = fma(_959, _959, _977);
    float _991 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[11].z, _975);
    float _993 = _865 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _995 = sqrt(_989);
    float _997 = _991 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _999 = fma(_855, (*spvDescriptorSet0.vp_c8)._m0[10].x, _993);
    float _1001 = fma(_851, (*spvDescriptorSet0.vp_c8)._m0[10].z, _999);
    float _1003 = 1.0 / _997;
    float _1005 = _1001 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1007 = _1005 + _997;
    bool _1009 = _995 > 0.0;
    float _1011 = _1007 * _1003;
    float _1013 = _1011 * 0.5;
    bool _1015 = !_1009;
    float _1017 = _945;
    float _1019 = _947;
    float _1021 = _943;
    float _1023 = _997;
    if (!_1015)
    {
        float _1025 = _231 * _231;
        float _1027 = fma(_221, _221, _1025);
        float _1029 = rsqrt(_989);
        float _1031 = fma(_239, _239, _1027);
        float _1033 = sqrt(_1031);
        float _1035 = _955 * _1029;
        float _1037 = _951 * _1029;
        float _1039 = _959 * _1029;
        bool _1041 = _1033 > 0.0;
        bool _1043 = !_1041;
        _1023 = _1029;
        _895 = _1037;
        if (!_1043)
        {
            float _1045 = rsqrt(_1031);
            float _1047 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1049 = _231 * _1045;
            float _1051 = _221 * _1045;
            float _1053 = _239 * _1045;
            float _1055 = _1037 * _1049;
            float _1057 = fma(_1035, _1051, _1055);
            float _1059 = _1047 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1061 = fma(_1039, _1053, _1057);
            float _1063 = _1061 * _1059;
            float _1065 = fma(_221, _1063, _945);
            float _1067 = fma(_231, _1063, _943);
            float _1069 = fma(_239, _1063, _947);
            _1017 = _1065;
            _1019 = _1069;
            _1021 = _1067;
            _1023 = _1063;
        }
    }
    float _1071 = _1017;
    float _1073 = _1019;
    float _1075 = _1021;
    float _1077 = _1023;
    float _1079 = _895;
    float _1081 = _1075;
    float _1083 = _1077;
    float _1085 = _1071;
    float _1087 = _1079;
    if (_987)
    {
        _273 = 1.0;
    }
    float _1089 = _273;
    float _1091 = _1089;
    if (_973)
    {
        _275 = _1071;
    }
    float _1093 = _275;
    float _1095 = _1093;
    if (_973)
    {
        _277 = _1073;
    }
    float _1097 = _277;
    float _1099 = _1097;
    if (!_973)
    {
        float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1103 = _865 + _1101;
        float _1105 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1107 = _855 + _1105;
        float _1109 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1111 = -_865;
        float _1113 = _1111 + _1075;
        float _1115 = _1103 * _1103;
        float _1117 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1119 = _851 + _1117;
        float _1121 = fma(_1107, _1107, _1115);
        float _1123 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1125 = fma(_1119, _1119, _1121);
        float _1127 = sqrt(_1125);
        float _1129 = _1109 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1131 = precise::min(_1127, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1133 = _1131 * _1123;
        float _1135 = -_855;
        float _1137 = _1135 + _1071;
        float _1139 = _1129 * _1133;
        float _1141 = -_851;
        float _1143 = _1141 + _1073;
        float _1145 = fma(_1137, _1139, _855);
        float _1147 = fma(_1113, _1139, _865);
        float _1149 = fma(_1143, _1139, _851);
        _1081 = _1147;
        _1095 = _1145;
        _1099 = _1149;
        _1083 = _1127;
    }
    float _1151 = _1081;
    float _1153 = _1095;
    float _1155 = _1099;
    float _1157 = _1083;
    float _1159 = _1157;
    if (!_987)
    {
        float _1161 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1163 = _1161 * 0.15915493667125701904296875;
        float _1165 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1167 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1169 = fma(_1013, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1167);
        float _1171 = _1163 * 6.283185482025146484375;
        float _1173 = cos(_1171);
        float _1175 = _1165 * 0.15915493667125701904296875;
        float _1177 = _1163 * 6.283185482025146484375;
        float _1179 = sin(_1177);
        float _1181 = 1.0 / _1173;
        float _1183 = _1175 * 6.283185482025146484375;
        float _1185 = cos(_1183);
        float _1187 = _1179 * _1181;
        float _1189 = _1175 * 6.283185482025146484375;
        float _1191 = sin(_1189);
        float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1195 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1193;
        float _1197 = _1185 * _1187;
        float _1199 = 1.0 / _1169;
        float _1201 = 1.0 / _1197;
        float _1203 = 1.0 / _1195;
        float _1205 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1207 = _1199 * _1205;
        float _1209 = _1191 * _1201;
        float _1211 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1213 = fma(_1209, _1207, _1211);
        float _1215 = _1213 * _1203;
        float _1217 = precise::clamp(_1215, 0.0, 1.0);
        _1159 = _1163;
        _1085 = _1201;
        _1091 = _1217;
    }
    float _1219 = _1159;
    float _1221 = _1085;
    float _1223 = _1091;
    float _1225 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1227 = _1151 + _1225;
    float _1229 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1231 = _1153 + _1229;
    float _1233 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1235 = _1155 + _1233;
    float _1237 = _1227 * _1227;
    float _1239 = fma(_1231, _1231, _1237);
    float _1241 = fma(_1235, _1235, _1239);
    float _1243 = rsqrt(_1241);
    float _1245 = _1243 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1247 = _1231 * _1245;
    float _1249 = _1235 * _1245;
    float _1251 = _1247 * _1247;
    float _1253 = _1249 * _1249;
    float _1255 = _1251 + _1253;
    float _1257 = sqrt(_1255);
    bool _1259 = _1257 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1261 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1263 = _1257 + _1261;
    float _1265 = _1239;
    float _1267 = _1221;
    float _1269 = _1263;
    float _1271 = _1219;
    float _1273 = _1227;
    if (_1259)
    {
        float _1275 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1265 = _1275;
    }
    float _1277 = _1265;
    if (_1259)
    {
        float _1279 = rsqrt(_1255);
        _1267 = _1279;
    }
    float _1281 = _1267;
    float _1283 = _1281;
    if (_1259)
    {
        float _1285 = _1263 * _1277;
        _1269 = _1285;
    }
    float _1287 = _1269;
    if (_1259)
    {
        float _1289 = _1287 * 0.15915493667125701904296875;
        _1271 = _1289;
    }
    float _1291 = _1271;
    float _1293 = _1235;
    if (_1259)
    {
        float _1295 = _1291 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        _1293 = _1297;
    }
    float _1299 = _1293;
    float _1301 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1303 = precise::max(0.0, _1301);
    float _1305 = _1243;
    float _1307 = _1303;
    float _1309 = _1301;
    if (_1259)
    {
        float _1311 = _1291 * 6.283185482025146484375;
        float _1313 = cos(_1311);
        _1305 = _1313;
    }
    float _1315 = _1305;
    float _1317 = -_1245;
    float _1319 = -_1303;
    float _1321 = fma(_1227, _1317, _1319);
    if (_1259)
    {
        float _1323 = _1321 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1307 = _1323;
    }
    float _1325 = _1307;
    float _1327 = sqrt(_1241);
    float _1329 = _1299;
    float _1331 = _1325;
    if (_1259)
    {
        float _1333 = fma(_1299, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1273 = _1333;
    }
    float _1335 = _1273;
    float _1337 = _1335;
    if (!_1259)
    {
        _1329 = _1247;
    }
    float _1339 = _1329;
    float _1341 = _1339;
    if (!_1259)
    {
        _1331 = _1251;
    }
    float _1343 = _1331;
    float _1345 = _1343;
    float _1347 = _1315;
    if (_1259)
    {
        float _1349 = _1315 + (-1.0);
        _1309 = _1349;
    }
    float _1351 = _1309;
    float _1353 = _1351;
    if (_1259)
    {
        float _1355 = _1281 * _1335;
        _1087 = _1355;
    }
    float _1357 = _1087;
    if (!_1259)
    {
        _1337 = _1321;
    }
    float _1359 = _1337;
    float _1361 = _1359;
    if (_1259)
    {
        float _1363 = _1351 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1363;
    }
    float _1365 = _1283;
    if (_1259)
    {
        float _1367 = _1247 * _1357;
        _1341 = _1367;
    }
    float _1369 = _1341;
    if (!_1259)
    {
        _1353 = _1249;
    }
    float _1371 = _1353;
    float _1373 = _1371;
    if (_1259)
    {
        float _1375 = _1249 * _1357;
        _1373 = _1375;
    }
    float _1377 = _1373;
    if (_1259)
    {
        float _1379 = fma(_1321, _1315, _1365);
        _1361 = _1379;
    }
    float _1381 = _1361;
    if (_1259)
    {
        float _1383 = _1369 * _1369;
        _1345 = _1383;
    }
    float _1385 = _1345;
    if (!_1259)
    {
        _1347 = _1253;
    }
    float _1387 = _1347;
    float _1389 = _1387;
    if (_1259)
    {
        float _1391 = _1377 * _1377;
        _1389 = _1391;
    }
    float _1393 = _1389;
    float _1395 = fma(_1381, _1381, _1385);
    float _1397 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1399 = _1395 + _1393;
    float _1401 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1403 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1405 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1403);
    float _1407 = precise::clamp(_1405, 0.0, 1.0);
    float _1409 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1411 = rsqrt(_1399);
    float _1413 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1401);
    float _1415 = -_1407;
    float _1417 = _1415 + 1.0;
    float _1419 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1409);
    float _1421 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1397);
    float _1423 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1413);
    float _1425 = _1151 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1427 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1419);
    float _1429 = abs(_1417);
    float _1431 = log2(_1429);
    float _1433 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1421);
    float _1435 = fma(_1153, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1425);
    float _1437 = _1427 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1439 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1441 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1443 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1435);
    float _1445 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1447 = _1411 * _1369;
    float _1449 = _1411 * _1377;
    float _1451 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1453 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1455 = _1447 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1457 = _1439 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1459 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1453);
    float _1461 = _1411 * _1381;
    float _1463 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1465 = -_1457;
    float _1467 = fma(_1465, _1441, 1.0);
    float _1469 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1459);
    float _1471 = -_1455;
    float _1473 = fma(_1461, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1471);
    float _1475 = exp2(_1463);
    float _1477 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1469);
    float _1479 = -_1449;
    float _1481 = fma(_1479, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1473);
    float _1483 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1485 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1487 = fma(_1481, -0.5, 0.5);
    float _1489 = log2(_1467);
    float _1491 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1483);
    float _1493 = fma(_1481, 0.5, 0.5);
    float _1495 = _1461 + 1.0;
    float _1497 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1491);
    float _1499 = fma(_1493, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1501 = 1.0 / _1477;
    float _1503 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1485);
    float _1505 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1497);
    float _1507 = -_1461;
    float _1509 = fma(_1475, _1495, _1507);
    float _1511 = fma(_1493, _1499, -0.212114393711090087890625);
    float _1513 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1503);
    float _1515 = fma(_1509, 0.5, 0.5);
    float _1517 = sqrt(_1487);
    float _1519 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1513);
    float _1521 = _1489 * 0.693147182464599609375;
    float _1523 = fma(_1493, _1511, 1.570728778839111328125);
    float _1525 = _1505 * _1501;
    float _1527 = _1519 * _1501;
    float _1529 = _1521 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1531 = fma(_1525, 0.5, 0.5);
    float _1533 = fma(_1527, -0.5, 0.5);
    float _1535 = _1517 * 0.636619746685028076171875;
    float3 _4291 = float3(_1531, _1533, _1529);
    float _1537 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4291, float3(0.0), isnan(_4291)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4291, float3(0.0), isnan(_4291)), level(0.0)).x;
    float3 _4302 = float3(_1531, _1533, _1529);
    float4 _1540 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4302, float3(0.0), isnan(_4302)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4302, float3(0.0), isnan(_4302)), level(0.0)).xyzw;
    float _1542 = _1540.x;
    float _1544 = _1540.y;
    float _1546 = _1540.z;
    float _1548 = _1540.w;
    float _1550 = -_1523;
    float _1552 = fma(_1535, _1550, 1.0);
    float2 _4324 = float2(_1552, _1515);
    float3 _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4324, float2(0.0), isnan(_4324)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4324, float2(0.0), isnan(_4324)), level(0.0)).xyz;
    float _1558 = _1556.x;
    float _1560 = _1556.y;
    float _1562 = _1556.z;
    float _1564 = in.m_49.y;
    float _1566 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1568 = _793 + _1566;
    float _1570 = in.m_49.z;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1574 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1572;
    int _1576 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1578 = _1576 != 0;
    float _1580 = in.m_49.w;
    float _1582 = 1.0 / _1574;
    float _1584 = _139 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1586 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1588 = _1586 != 0;
    float _1590 = _1431 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _1592 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1594 = _1592 != 0;
    float _1596 = _1437 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    int _1598 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1600 = _1598 != 0;
    float _1602 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1604 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1606 = _1604 != 0;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1610 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1612 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1596);
    float _1614 = _1564 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _1616 = _139 > 0.5;
    float _1618 = _1568 * _1582;
    float _1620 = fma(_1614, -2.0, _1610);
    float _1622 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1624 = -_269;
    int _1626 = _1616 ? as_type<int>(_1624) : as_type<int>(_269);
    float _1628 = -_1608;
    float _1630 = fma(_1584, 2.0, _1628);
    bool _1632 = _1570 > 0.5;
    float _1634 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1622);
    float _1636 = _1584;
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[78].z;
    float _1640 = _1570;
    if (!_1578)
    {
        _1636 = _1564;
    }
    float _1642 = _1636;
    float _1644 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1646 = _1642;
    if (_1578)
    {
        _1646 = _139;
    }
    float _1648 = _1646;
    float _1650 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1620);
    float _1652 = -_269;
    int _1654 = _1632 ? as_type<int>(_1652) : as_type<int>(_269);
    float _1656 = fma(_1564, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1644);
    bool _1658 = _1564 > 0.5;
    float _1660 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    bool _1662 = _1580 > 0.5;
    float _1664 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1634);
    if (!_1578)
    {
        _1638 = _1570;
    }
    float _1666 = _1638;
    float _1668 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1656);
    float _1670 = _1666;
    if (_1578)
    {
        _1670 = _1564;
    }
    float _1672 = _1670;
    if (_1578)
    {
        _1640 = _1564;
    }
    float _1674 = _1640;
    float _1676 = exp2(_1590);
    float _1678 = -_177;
    int _1680 = _1658 ? as_type<int>(_1678) : as_type<int>(_177);
    float _1682 = _1672 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1684 = -_177;
    int _1686 = _1662 ? as_type<int>(_1684) : as_type<int>(_177);
    float _1688 = -_1668;
    float _1690 = _1688 + 1.0;
    bool _1692 = !_1588;
    float _1694 = _1692 ? _269 : as_type<float>(_1626);
    bool _1696 = !_1600;
    float _1698 = _1696 ? _269 : as_type<float>(_1654);
    float _1700 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _1702 = !_1594;
    float _1704 = _1702 ? _177 : as_type<float>(_1680);
    bool _1706 = !_1606;
    float _1708 = _1706 ? _177 : as_type<float>(_1686);
    float _1710 = _1602 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1712 = -_119;
    float _1714 = fma(_1712, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1630);
    float _1716 = _1694 + 0.5;
    float _1718 = -_1676;
    float _1720 = _1718 + 1.0;
    float _1722 = fma(_1710, _1716, _1714);
    float _1724 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1726 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1724;
    float _1728 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1730 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1728;
    float _1732 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _1734 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1736 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1734;
    float _1738 = _1700 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1742 = fma(_1726, _1618, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1744 = fma(_1730, _1618, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1746 = _1704 + (-0.5);
    float _1748 = fma(_1736, _1618, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1750 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1752 = isnan(_793);
    bool _1754 = _1750 || _1752;
    bool _1756 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1758 = _1754 || _1756;
    float _1760 = float(_1758);
    float _1762 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1740);
    float _1764 = -_1738;
    float _1766 = -_1650;
    float _1768 = fma(_1764, _1746, _1766);
    bool _1770 = _793 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1772 = isnan(_793);
    bool _1774 = _1770 || _1772;
    bool _1776 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1778 = _1774 || _1776;
    float _1780 = float(_1778);
    float _1782 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1784 = -_1760;
    float _1786 = _1784 + 1.0;
    float _1788 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1762);
    float _1790 = _1780 * _1786;
    float _1792 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1794 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1796 = _1648 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1798 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1800 = _1732 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _1802 = fma(_1648, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1794);
    float _1804 = -_1792;
    float _1806 = fma(_1796, 2.0, _1804);
    float _1808 = fma(_1682, -2.0, _1798);
    float _1810 = _1698 + 0.5;
    float _1812 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1802);
    float _1814 = -_119;
    float _1816 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1806);
    float _1818 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1808);
    float _1820 = _1660 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _1822 = _1708 + (-0.5);
    float _1824 = fma(_1800, _1810, _1816);
    float _1826 = -_1812;
    float _1828 = _1826 + 1.0;
    float _1830 = -_1788;
    float _1832 = _1830 + 1.0;
    float _1834 = -_1820;
    float _1836 = -_1818;
    float _1838 = fma(_1834, _1822, _1836);
    float _1840 = _1742 * _1790;
    float _1842 = _1744 * _1790;
    float _1844 = _1748 * _1790;
    float _1846 = -_1780;
    float _1848 = _1846 + 1.0;
    float _1850 = -_1664;
    float _1852 = _1850 + 1.0;
    float _1854 = -_1828;
    float _1856 = fma(_1698, _1854, _1824);
    float _1858 = fma(_1708, _1832, _1838);
    float _1860 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1840);
    float _1862 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1842);
    float _1864 = fma(_1848, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1844);
    float _1866 = -_1852;
    float _1868 = fma(_1694, _1866, _1722);
    float _1870 = fma(_1704, _1690, _1768);
    float _1872 = fma(_1439, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1612);
    float _1874 = _1477 * 0.5;
    float _1876 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1860);
    float _1878 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1862);
    float _1880 = fma(_1760, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1864);
    float _1882 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1872);
    out.m_60.x = _1868;
    out.m_60.y = _1870;
    out.m_60.z = _1856;
    out.m_60.w = _1858;
    bool _1884 = _1223 > 0.0;
    bool _1886 = isnan(_1223);
    bool _1888 = _1884 || _1886;
    bool _1890 = isnan(0.0);
    bool _1892 = _1888 || _1890;
    float _1894 = _1223 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1896 = _1876 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1898 = _1878 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1900 = _1880 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1902 = -_1782;
    float _1904 = _1902 + 1.0;
    out.gl_Position.x = _1505;
    out.gl_Position.y = _1519;
    out.gl_Position.z = _1882;
    out.gl_Position.w = _1477;
    float _1906 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1908 = _1896 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1910 = _1898 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1912 = _1900 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1914 = _1894 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1916 = fma(_1519, -0.5, _1874);
    float _1918 = _1882 + _1477;
    float _1920 = _1505 + _1477;
    out.m_62.x = _1908;
    out.m_62.y = _1910;
    out.m_62.z = _1912;
    out.m_62.w = _1906;
    float _1922 = _1918 * 0.5;
    float _1924 = _1920 * 0.5;
    out.m_45.x = _1914;
    out.m_64.x = _1924;
    out.m_64.y = _1916;
    out.m_64.z = _1922;
    out.m_64.w = _1477;
    float _1926 = _1782 * _1537;
    float _1928 = _1548 * _1904;
    float _1930 = _1548 * _1926;
    float _1932 = _1562 * _1926;
    float _1934 = fma(_1558, _1930, _1542);
    float _1936 = fma(_1560, _1930, _1544);
    float _1938 = fma(_1548, _1932, _1546);
    out.m_66.x = _1934;
    out.m_66.y = _1936;
    out.m_66.z = _1938;
    out.m_66.w = _1928;
    if (_1892)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _1940 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1940;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

