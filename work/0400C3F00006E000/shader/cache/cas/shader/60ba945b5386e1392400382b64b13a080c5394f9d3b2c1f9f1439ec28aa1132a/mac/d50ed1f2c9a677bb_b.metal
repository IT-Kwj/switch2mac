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
    float4 m_62 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_58 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_51 [[attribute(4)]];
    float4 m_53 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1030 = false;
    bool _559 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _1510 = as_type<float>(_101);
        out.gl_Position.z = _1510;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _1579 = as_type<float>(_137);
        out.gl_Position.z = _1579;
    }
    if (_129)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _143 * _141;
    float _163 = 0.0;
    float _165 = _145;
    if (!_155)
    {
        float _167 = _145 * _145;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _175 = _171;
    if (!_155)
    {
        float _177 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = _173 * 6.283185482025146484375;
    float _189 = floor(_173);
    float _191 = _187 * 0.15915493667125701904296875;
    float _193 = _191 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = -_189;
    float _199 = _173 + _197;
    bool _201 = !_155;
    float _203 = _179;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _145 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _145);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_155;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _145 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _165 = _257;
    }
    float _259 = _165;
    float _261 = in.m_53.w;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _269 = _267 != 0;
    float _271 = in.m_44.x;
    float _273 = in.m_44.y;
    float _275 = in.m_44.z;
    bool _277 = _199 < 0.5;
    float _279 = float(_277);
    float _281 = -_199;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = fma(_195, 0.5, 0.5);
    bool _287 = !_265;
    int _289 = _287 ? 0 : 1;
    float _291 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = -_279;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = -_285;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _301 = abs(_289);
    float _303 = fma(_259, _181, _291);
    bool _305 = !_159;
    int _307 = _305 ? 0 : 1;
    float _309 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _311 = !_269;
    int _313 = _311 ? 0 : 1;
    float _315 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _319 = fma(_259, _183, _309);
    int _321 = abs(_307);
    float _323 = fma(_259, _185, _315);
    int _325 = abs(_313);
    float _327 = float(_301);
    float _329 = float(_321);
    float _331 = abs(_283);
    float _333 = _327 * _331;
    float _335 = fma(_319, _261, _273);
    float _337 = fma(_303, _261, _271);
    float _339 = float(_325);
    float _341 = fma(_329, _299, _333);
    float _343 = fma(_323, _261, _275);
    float _345 = abs(_295);
    float _347 = fma(_339, _345, _341);
    bool _349 = !_317;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_85);
        float _371 = 1.0 / _369;
        float _373 = _119 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _379 = _375 + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = _375 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _375 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _397;
    float _401 = 1.0 / _391;
    bool _403 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _405 = 1.0 / _399;
    bool _407 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _409 = isnan(_375);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = 1.0 / _395;
    float _421 = _379 * _401;
    bool _423 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _425 = isnan(_375);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = _383 * _405;
    bool _437 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _439 = isnan(_375);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -_417;
    float _451 = _449 + 1.0;
    float _453 = _447 * _451;
    float _455 = -_447;
    float _457 = _455 + 1.0;
    float _459 = _387 * _419;
    float _461 = -_433;
    float _463 = _461 + 1.0;
    bool _465 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _467 = isnan(_375);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _485 = _417 * _463;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _495 = fma(_479, _421, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _497 = _475 * _457;
    float _499 = fma(_489, _421, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _501 = fma(_483, _459, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _503 = fma(_493, _459, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _505 = -_475;
    float _507 = _505 + 1.0;
    float _509 = _495 * _497;
    float _511 = _499 * _497;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _513;
    float _517 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[143].x, _509);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _519;
    float _523 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[143].y, _511);
    float _525 = fma(_515, _435, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _527 = fma(_501, _453, _517);
    float _529 = fma(_521, _435, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _531 = fma(_503, _453, _523);
    float _533 = fma(_525, _485, _527);
    float _535 = fma(_529, _485, _531);
    float _537 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[146].x, _533);
    float _539 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[146].y, _535);
    bool _541 = !_403;
    float _557;
    if (!_541)
    {
        float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _545 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _549 = _547 * _543;
        float _551 = floor(_549);
        float _553 = -_551;
        float _555 = _549 + _553;
        _557 = _555;
        _559 = true;
    }
    else
    {
        float _561 = float(_85);
        float _563 = 1.0 / _561;
        float _565 = _119 * _563;
        _557 = _565;
    }
    _559 = false;
    float _567 = _557;
    float _569 = in.m_53.x;
    float _571 = in.m_53.y;
    float _573 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _575 = as_type<float>(int(gl_VertexIndex));
    float _577 = in.m_51.y;
    float _579 = _539 * _571;
    float _581 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _583 = as_type<int>(_575) & 1;
    bool _585 = _583 != 0;
    int _587 = as_type<int>(_575) & 2;
    bool _589 = _587 != 0;
    float _591 = _347 * _579;
    float _593 = _537 * _569;
    float _595 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].x, _581);
    float _597 = _591 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _599 = !_589;
    float _601 = _599 ? (-0.5) : 0.5;
    float _603 = _347 * _593;
    bool _605 = _139 > 0.5;
    float _607 = _573 * _139;
    bool _609 = !_585;
    float _611 = _609 ? (-0.5) : 0.5;
    float _613 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _601);
    float _615 = _603 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _617 = _577 > 0.5;
    float _619 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _611);
    float _621 = _597 * _613;
    float _623 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _625 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _627 = _615 * _619;
    float _629 = _621 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _631 = _621 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _633 = trunc(_607);
    int _635 = int(_633);
    float _637 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].x, _623);
    float _639 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].x, _625);
    float _641 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _643 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[24].x, _629);
    float _645 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[26].x, _631);
    float _647 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _637);
    float _649 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _639);
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[24].z, _643);
    float _653 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[26].z, _645);
    float _655 = _647 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _657 = _649 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _659 = _651 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _661 = _653 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _663;
    float _667 = _655 + _659;
    float _669 = _657 + _661;
    int _671 = _635 << 4;
    int _673 = _671 + 1968;
    float _675 = 1.0 / _665;
    float _677 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _679 = _667 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _683 = _669 + _681;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _687 = _685 != 0;
    int _689 = _673 + 8;
    uint _692 = uint(int(uint(_689) >> uint(2)));
    uint _694 = uint(int(uint(int(_692)) >> uint(2)));
    int _696 = int(_692) & 3;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[int(_694)][_696];
    float _700 = _679 * _679;
    float _702 = _683 * _683;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _706 = _704 != 0;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _710 = _567 + _708;
    float _712 = _700 + _702;
    uint _714 = uint(int(uint(_673) >> uint(2)));
    uint _716 = uint(int(uint(int(_714)) >> uint(2)));
    int _718 = int(_714) & 3;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[int(_716)][_718];
    int _722 = int(_714) + 1;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    int _726 = _722 & 3;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[int(_724)][_726];
    float _730 = sqrt(_712);
    float _732 = _710 * _675;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _734;
    float _738 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _595);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _744;
    float _748 = fma(_736, _732, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _750 = _621 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _752 = -_601;
    int _754 = _617 ? as_type<int>(_752) : as_type<int>(_601);
    float _756 = fma(_742, _732, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _758 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _760 = isnan(_567);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[25].x, _750);
    float _772 = -_611;
    int _774 = _605 ? as_type<int>(_772) : as_type<int>(_611);
    float _776 = fma(_746, _732, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _778 = !_706;
    float _780 = _778 ? _601 : as_type<float>(_754);
    float _782 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[25].z, _770);
    bool _784 = _730 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _788 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _790 = isnan(_567);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = -_768;
    float _802 = _800 + 1.0;
    bool _804 = !_687;
    float _806 = _804 ? _611 : as_type<float>(_774);
    float _808 = _738 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _810 = _782 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _812 = _798 * _802;
    float _814 = _808 + _810;
    float _816 = _748 * _812;
    float _818 = _756 * _812;
    float _820 = _776 * _812;
    float _822 = -_798;
    float _824 = _822 + 1.0;
    float _826 = _748;
    float _828 = _776;
    float _830 = _798;
    float _832 = _808;
    float _834 = _641;
    if (!_784)
    {
        _826 = _702;
    }
    float _836 = _826;
    float _838 = _836;
    if (!_784)
    {
        _828 = _700;
    }
    float _840 = _828;
    float _842 = _840;
    if (!_784)
    {
        _830 = _667;
    }
    float _844 = _830;
    float _846 = _844;
    if (!_784)
    {
        _832 = _669;
    }
    float _848 = _832;
    float _850 = _848;
    if (!_784)
    {
        _834 = _814;
    }
    float _852 = _834;
    bool _854 = !_784;
    float _856 = _852;
    if (!_854)
    {
        float _858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _862 = _730 + _860;
        float _864 = rsqrt(_712);
        float _866 = _862 * _858;
        float _868 = _814 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _870 = _866 * 0.15915493667125701904296875;
        float _872 = _870 * 6.283185482025146484375;
        float _874 = sin(_872);
        float _876 = _870 * 6.283185482025146484375;
        float _878 = cos(_876);
        float _880 = fma(_874, _868, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _882 = _864 * _880;
        float _884 = _878 + (-1.0);
        float _886 = fma(_679, _882, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _888 = fma(_683, _882, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _890 = _884 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _894 = _886 + _892;
        float _896 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _898 = _888 + _896;
        float _900 = fma(_814, _878, _890);
        float _902 = _894 * _894;
        float _904 = _898 * _898;
        _856 = _900;
        _842 = _902;
        _838 = _904;
        _846 = _886;
        _850 = _888;
    }
    float _906 = _856;
    float _908 = _842;
    float _910 = _838;
    float _912 = _846;
    float _914 = _850;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _918 = _906 + _916;
    float _920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _922 = _806 + 0.5;
    float _924 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].x, _816);
    float _926 = fma(_918, _918, _908);
    float _928 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].y, _818);
    float _930 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].z, _820);
    float _932 = _922 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _934 = _926 + _910;
    float _936 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[108].x, _924);
    float _938 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[108].y, _928);
    float _940 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[108].z, _930);
    float _942 = -_780;
    float _944 = _942 + 0.5;
    float _946 = _932 * _786;
    float _948 = sqrt(_934);
    float _950 = _698 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _952 = _944 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _954 = _720 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _956 = _728 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _958 = _936 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _960 = _938 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _962 = _940 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _964 = _952 * _920;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _968 = _954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _946;
    out.m_58.y = _964;
    bool _980 = _948 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _982 = isnan(_948);
    bool _984 = _980 || _982;
    bool _986 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _988 = _984 || _986;
    out.m_60.x = _968;
    out.m_60.y = _970;
    out.m_60.z = _972;
    out.m_62.x = _974;
    out.m_62.y = _976;
    out.m_62.z = _978;
    out.m_62.w = _966;
    float _990 = _932;
    float _992 = _912;
    float _994 = _946;
    if (!_988)
    {
        _990 = 1.0;
    }
    float _996 = _990;
    bool _998 = !_988;
    float _1000 = _996;
    if (!_998)
    {
        bool _1002 = _948 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1004 = isnan(_948);
        bool _1006 = _1002 || _1004;
        bool _1008 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1010 = _1006 || _1008;
        if (!_1010)
        {
            float _1012 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1014 = _948 + _1012;
            float _1016 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1018 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1016;
            float _1020 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1022 = _1020 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1024 = 1.0 / _1018;
            float _1026 = _1014 * _1024;
            float _1028 = fma(_1026, _1022, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1000 = _1028;
            _1030 = true;
        }
        else
        {
            bool _1032 = _948 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1034 = isnan(_948);
            bool _1036 = _1032 || _1034;
            bool _1038 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1040 = _1036 || _1038;
            if (!_1040)
            {
                float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1044 = _948 + _1042;
                float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1048 = _1046 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1050 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1052 = _1050 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1054 = 1.0 / _1048;
                float _1056 = _1044 * _1054;
                float _1058 = fma(_1056, _1052, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1000 = _1058;
                _1030 = true;
            }
            else
            {
                _1000 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1030 = false;
    float _1060 = _1000;
    float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1064 = _906 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1068 = _912 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1072 = _914 + _1070;
    float _1074 = fma(_1064, _1060, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1076 = fma(_1068, _1060, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1078 = fma(_1072, _1060, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1082 = _1074 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1076 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1090 = _1078 + _1088;
    float _1092 = _1082 * _1082;
    float _1094 = fma(_1086, _1086, _1092);
    float _1096 = fma(_1090, _1090, _1094);
    float _1098 = rsqrt(_1096);
    float _1100 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1102 = _1086 * _1100;
    float _1104 = _1090 * _1100;
    float _1106 = _1102 * _1102;
    float _1108 = _1104 * _1104;
    float _1110 = _1106 + _1108;
    float _1112 = sqrt(_1110);
    bool _1114 = _1112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1116 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1118 = _1112 + _1116;
    float _1120 = _1090;
    float _1122 = _1092;
    float _1124 = _1118;
    float _1126 = _1082;
    float _1128 = _1102;
    if (_1114)
    {
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1120 = _1130;
    }
    float _1132 = _1120;
    if (_1114)
    {
        float _1134 = rsqrt(_1110);
        _1122 = _1134;
    }
    float _1136 = _1122;
    float _1138 = _1136;
    if (_1114)
    {
        float _1140 = _1118 * _1132;
        _1124 = _1140;
    }
    float _1142 = _1124;
    if (_1114)
    {
        float _1144 = _1142 * 0.15915493667125701904296875;
        _992 = _1144;
    }
    float _1146 = _992;
    float _1148 = _1132;
    if (_1114)
    {
        float _1150 = _1146 * 6.283185482025146484375;
        float _1152 = sin(_1150);
        _1148 = _1152;
    }
    float _1154 = _1148;
    float _1156 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1158 = precise::max(0.0, _1156);
    float _1160 = _1098;
    float _1162 = _1158;
    if (_1114)
    {
        float _1164 = _1146 * 6.283185482025146484375;
        float _1166 = cos(_1164);
        _1160 = _1166;
    }
    float _1168 = _1160;
    float _1170 = -_1100;
    float _1172 = -_1158;
    float _1174 = fma(_1082, _1170, _1172);
    if (_1114)
    {
        float _1176 = _1174 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1162 = _1176;
    }
    float _1178 = _1162;
    float _1180 = sqrt(_1096);
    float _1182 = _1154;
    float _1184 = _1178;
    if (_1114)
    {
        float _1186 = fma(_1154, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _994 = _1186;
    }
    float _1188 = _994;
    float _1190 = _1188;
    if (!_1114)
    {
        _1182 = _1104;
    }
    float _1192 = _1182;
    float _1194 = _1192;
    if (_1114)
    {
        float _1196 = _1168 + (-1.0);
        _1184 = _1196;
    }
    float _1198 = _1184;
    float _1200 = _1198;
    if (_1114)
    {
        float _1202 = _1136 * _1188;
        _1190 = _1202;
    }
    float _1204 = _1190;
    if (!_1114)
    {
        _1138 = _1174;
    }
    float _1206 = _1138;
    float _1208 = _1206;
    if (_1114)
    {
        float _1210 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1126 = _1210;
    }
    float _1212 = _1126;
    float _1214 = _1212;
    if (_1114)
    {
        float _1216 = _1102 * _1204;
        _1128 = _1216;
    }
    float _1218 = _1128;
    if (!_1114)
    {
        _1200 = _1106;
    }
    float _1220 = _1200;
    float _1222 = _1220;
    if (_1114)
    {
        float _1224 = _1104 * _1204;
        _1194 = _1224;
    }
    float _1226 = _1194;
    if (_1114)
    {
        float _1228 = fma(_1174, _1168, _1212);
        _1208 = _1228;
    }
    float _1230 = _1208;
    if (_1114)
    {
        float _1232 = _1218 * _1218;
        _1222 = _1232;
    }
    float _1234 = _1222;
    if (!_1114)
    {
        _1214 = _1108;
    }
    float _1236 = _1214;
    float _1238 = _1236;
    if (_1114)
    {
        float _1240 = _1226 * _1226;
        _1238 = _1240;
    }
    float _1242 = _1238;
    float _1244 = fma(_1230, _1230, _1234);
    float _1246 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1248 = _1244 + _1242;
    float _1250 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1252 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1254 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1252);
    float _1256 = precise::clamp(_1254, 0.0, 1.0);
    float _1258 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1260 = rsqrt(_1248);
    float _1262 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1250);
    float _1264 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1266 = -_1256;
    float _1268 = _1266 + 1.0;
    float _1270 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1246);
    float _1272 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1262);
    float _1274 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1276 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1264);
    float _1278 = abs(_1268);
    float _1280 = log2(_1278);
    float _1282 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1284 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1274);
    float _1286 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1276);
    float _1288 = _1282 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1290 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1284);
    float _1292 = _1286 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1294 = _1260 * _1218;
    float _1296 = -_1288;
    float _1298 = fma(_1296, _1258, 1.0);
    float _1300 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1270);
    float _1302 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1304 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1306 = _1260 * _1230;
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1310 = _1300 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1312 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1304);
    float _1314 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1316 = _1260 * _1226;
    float _1318 = -_1308;
    float _1320 = fma(_1306, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1318);
    float _1322 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1312);
    float _1324 = log2(_1298);
    float _1326 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1328 = -_1316;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1320);
    float _1332 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1322);
    float _1334 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1336 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1326);
    float _1338 = fma(_1330, -0.5, 0.5);
    float _1340 = fma(_1330, 0.5, 0.5);
    float _1342 = exp2(_1314);
    float _1344 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1334);
    float _1346 = _1306 + 1.0;
    float _1348 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1350 = fma(_1340, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1352 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1344);
    float _1354 = 1.0 / _1332;
    float _1356 = fma(_1340, _1350, -0.212114393711090087890625);
    float _1358 = _1324 * 0.693147182464599609375;
    float _1360 = fma(_1340, _1356, 1.570728778839111328125);
    float _1362 = sqrt(_1338);
    float _1364 = -_1306;
    float _1366 = fma(_1342, _1346, _1364);
    float _1368 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1352);
    float _1370 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1348);
    float _1372 = fma(_1366, 0.5, 0.5);
    float _1374 = _1368 * _1354;
    float _1376 = _1370 * _1354;
    float _1378 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1380 = fma(_1374, 0.5, 0.5);
    float _1382 = fma(_1376, -0.5, 0.5);
    float _1384 = _1362 * 0.636619746685028076171875;
    float3 _3617 = float3(_1380, _1382, _1378);
    float _1386 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3617, float3(0.0), isnan(_3617)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3617, float3(0.0), isnan(_3617)), level(0.0)).x;
    float3 _3628 = float3(_1380, _1382, _1378);
    float4 _1389 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3628, float3(0.0), isnan(_3628)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3628, float3(0.0), isnan(_3628)), level(0.0)).xyzw;
    float _1391 = _1389.x;
    float _1393 = _1389.y;
    float _1395 = _1389.z;
    float _1397 = _1389.w;
    float _1399 = -_1360;
    float _1401 = fma(_1384, _1399, 1.0);
    float2 _3650 = float2(_1401, _1372);
    float3 _1405 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3650, float2(0.0), isnan(_3650)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3650, float2(0.0), isnan(_3650)), level(0.0)).xyz;
    float _1407 = _1405.x;
    float _1409 = _1405.y;
    float _1411 = _1405.z;
    float _1413 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1415 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1417 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1415);
    float _1419 = exp2(_1413);
    float _1421 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1417);
    float _1423 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1421);
    float _1425 = _1423 + _1332;
    out.gl_Position.x = _1368;
    out.gl_Position.y = _1370;
    out.gl_Position.z = _1423;
    out.gl_Position.w = _1332;
    float _1427 = -_1419;
    float _1429 = _1427 + 1.0;
    float _1431 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1433 = _1425 * 0.5;
    float _1435 = _1429 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_47.x = _1431;
    out.m_64.z = _1433;
    out.m_64.w = _1332;
    float _1437 = _1435 * _1386;
    float _1439 = -_1435;
    float _1441 = _1439 + 1.0;
    float _1443 = _1397 * _1437;
    float _1445 = _1411 * _1437;
    float _1447 = fma(_1407, _1443, _1391);
    float _1449 = fma(_1409, _1443, _1393);
    float _1451 = _1397 * _1441;
    float _1453 = fma(_1397, _1445, _1395);
    out.m_66.x = _1447;
    out.m_66.y = _1449;
    out.m_66.z = _1453;
    out.m_66.w = _1451;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1030 = false;
    bool _559 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _1510 = as_type<float>(_101);
        out.gl_Position.z = _1510;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _1579 = as_type<float>(_137);
        out.gl_Position.z = _1579;
    }
    if (_129)
    {
        return out;
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _143 * _141;
    float _163 = 0.0;
    float _165 = _145;
    if (!_155)
    {
        float _167 = _145 * _145;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _175 = _171;
    if (!_155)
    {
        float _177 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = _173 * 6.283185482025146484375;
    float _189 = floor(_173);
    float _191 = _187 * 0.15915493667125701904296875;
    float _193 = _191 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = -_189;
    float _199 = _173 + _197;
    bool _201 = !_155;
    float _203 = _179;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _145 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _145);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_155;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _145 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _165 = _257;
    }
    float _259 = _165;
    float _261 = in.m_53.w;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _269 = _267 != 0;
    float _271 = in.m_44.x;
    float _273 = in.m_44.y;
    float _275 = in.m_44.z;
    bool _277 = _199 < 0.5;
    float _279 = float(_277);
    float _281 = -_199;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = fma(_195, 0.5, 0.5);
    bool _287 = !_265;
    int _289 = _287 ? 0 : 1;
    float _291 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = -_279;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = -_285;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _301 = abs(_289);
    float _303 = fma(_259, _181, _291);
    bool _305 = !_159;
    int _307 = _305 ? 0 : 1;
    float _309 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _311 = !_269;
    int _313 = _311 ? 0 : 1;
    float _315 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _319 = fma(_259, _183, _309);
    int _321 = abs(_307);
    float _323 = fma(_259, _185, _315);
    int _325 = abs(_313);
    float _327 = float(_301);
    float _329 = float(_321);
    float _331 = abs(_283);
    float _333 = _327 * _331;
    float _335 = fma(_319, _261, _273);
    float _337 = fma(_303, _261, _271);
    float _339 = float(_325);
    float _341 = fma(_329, _299, _333);
    float _343 = fma(_323, _261, _275);
    float _345 = abs(_295);
    float _347 = fma(_339, _345, _341);
    bool _349 = !_317;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_85);
        float _371 = 1.0 / _369;
        float _373 = _119 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _379 = _375 + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = _375 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _375 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _397;
    float _401 = 1.0 / _391;
    bool _403 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _405 = 1.0 / _399;
    bool _407 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _409 = isnan(_375);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = 1.0 / _395;
    float _421 = _379 * _401;
    bool _423 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _425 = isnan(_375);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = _383 * _405;
    bool _437 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _439 = isnan(_375);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -_417;
    float _451 = _449 + 1.0;
    float _453 = _447 * _451;
    float _455 = -_447;
    float _457 = _455 + 1.0;
    float _459 = _387 * _419;
    float _461 = -_433;
    float _463 = _461 + 1.0;
    bool _465 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _467 = isnan(_375);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _485 = _417 * _463;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _495 = fma(_479, _421, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _497 = _475 * _457;
    float _499 = fma(_489, _421, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _501 = fma(_483, _459, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _503 = fma(_493, _459, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _505 = -_475;
    float _507 = _505 + 1.0;
    float _509 = _495 * _497;
    float _511 = _499 * _497;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _513;
    float _517 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[143].x, _509);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _519;
    float _523 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[143].y, _511);
    float _525 = fma(_515, _435, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _527 = fma(_501, _453, _517);
    float _529 = fma(_521, _435, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _531 = fma(_503, _453, _523);
    float _533 = fma(_525, _485, _527);
    float _535 = fma(_529, _485, _531);
    float _537 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[146].x, _533);
    float _539 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[146].y, _535);
    bool _541 = !_403;
    float _557;
    if (!_541)
    {
        float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _545 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _549 = _547 * _543;
        float _551 = floor(_549);
        float _553 = -_551;
        float _555 = _549 + _553;
        _557 = _555;
        _559 = true;
    }
    else
    {
        float _561 = float(_85);
        float _563 = 1.0 / _561;
        float _565 = _119 * _563;
        _557 = _565;
    }
    _559 = false;
    float _567 = _557;
    float _569 = in.m_53.x;
    float _571 = in.m_53.y;
    float _573 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _575 = as_type<float>(int(gl_VertexIndex));
    float _577 = in.m_51.y;
    float _579 = _539 * _571;
    float _581 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _583 = as_type<int>(_575) & 1;
    bool _585 = _583 != 0;
    int _587 = as_type<int>(_575) & 2;
    bool _589 = _587 != 0;
    float _591 = _347 * _579;
    float _593 = _537 * _569;
    float _595 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].x, _581);
    float _597 = _591 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _599 = !_589;
    float _601 = _599 ? (-0.5) : 0.5;
    float _603 = _347 * _593;
    bool _605 = _139 > 0.5;
    float _607 = _573 * _139;
    bool _609 = !_585;
    float _611 = _609 ? (-0.5) : 0.5;
    float _613 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _601);
    float _615 = _603 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _617 = _577 > 0.5;
    float _619 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _611);
    float _621 = _597 * _613;
    float _623 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _625 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _627 = _615 * _619;
    float _629 = _621 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _631 = _621 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _633 = trunc(_607);
    int _635 = int(_633);
    float _637 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].x, _623);
    float _639 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].x, _625);
    float _641 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _643 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[24].x, _629);
    float _645 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[26].x, _631);
    float _647 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _637);
    float _649 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _639);
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[24].z, _643);
    float _653 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[26].z, _645);
    float _655 = _647 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _657 = _649 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _659 = _651 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _661 = _653 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _663;
    float _667 = _655 + _659;
    float _669 = _657 + _661;
    int _671 = _635 << 4;
    int _673 = _671 + 1968;
    float _675 = 1.0 / _665;
    float _677 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _679 = _667 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _683 = _669 + _681;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _687 = _685 != 0;
    int _689 = _673 + 8;
    uint _692 = uint(int(uint(_689) >> uint(2)));
    uint _694 = uint(int(uint(int(_692)) >> uint(2)));
    int _696 = int(_692) & 3;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[int(_694)][_696];
    float _700 = _679 * _679;
    float _702 = _683 * _683;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _706 = _704 != 0;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _710 = _567 + _708;
    float _712 = _700 + _702;
    uint _714 = uint(int(uint(_673) >> uint(2)));
    uint _716 = uint(int(uint(int(_714)) >> uint(2)));
    int _718 = int(_714) & 3;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[int(_716)][_718];
    int _722 = int(_714) + 1;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    int _726 = _722 & 3;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[int(_724)][_726];
    float _730 = sqrt(_712);
    float _732 = _710 * _675;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _734;
    float _738 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _595);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _744;
    float _748 = fma(_736, _732, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _750 = _621 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _752 = -_601;
    int _754 = _617 ? as_type<int>(_752) : as_type<int>(_601);
    float _756 = fma(_742, _732, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _758 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _760 = isnan(_567);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[25].x, _750);
    float _772 = -_611;
    int _774 = _605 ? as_type<int>(_772) : as_type<int>(_611);
    float _776 = fma(_746, _732, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _778 = !_706;
    float _780 = _778 ? _601 : as_type<float>(_754);
    float _782 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[25].z, _770);
    bool _784 = _730 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _788 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _790 = isnan(_567);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = -_768;
    float _802 = _800 + 1.0;
    bool _804 = !_687;
    float _806 = _804 ? _611 : as_type<float>(_774);
    float _808 = _738 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _810 = _782 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _812 = _798 * _802;
    float _814 = _808 + _810;
    float _816 = _748 * _812;
    float _818 = _756 * _812;
    float _820 = _776 * _812;
    float _822 = -_798;
    float _824 = _822 + 1.0;
    float _826 = _748;
    float _828 = _776;
    float _830 = _798;
    float _832 = _808;
    float _834 = _641;
    if (!_784)
    {
        _826 = _702;
    }
    float _836 = _826;
    float _838 = _836;
    if (!_784)
    {
        _828 = _700;
    }
    float _840 = _828;
    float _842 = _840;
    if (!_784)
    {
        _830 = _667;
    }
    float _844 = _830;
    float _846 = _844;
    if (!_784)
    {
        _832 = _669;
    }
    float _848 = _832;
    float _850 = _848;
    if (!_784)
    {
        _834 = _814;
    }
    float _852 = _834;
    bool _854 = !_784;
    float _856 = _852;
    if (!_854)
    {
        float _858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _862 = _730 + _860;
        float _864 = rsqrt(_712);
        float _866 = _862 * _858;
        float _868 = _814 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _870 = _866 * 0.15915493667125701904296875;
        float _872 = _870 * 6.283185482025146484375;
        float _874 = sin(_872);
        float _876 = _870 * 6.283185482025146484375;
        float _878 = cos(_876);
        float _880 = fma(_874, _868, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _882 = _864 * _880;
        float _884 = _878 + (-1.0);
        float _886 = fma(_679, _882, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _888 = fma(_683, _882, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _890 = _884 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _894 = _886 + _892;
        float _896 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _898 = _888 + _896;
        float _900 = fma(_814, _878, _890);
        float _902 = _894 * _894;
        float _904 = _898 * _898;
        _856 = _900;
        _842 = _902;
        _838 = _904;
        _846 = _886;
        _850 = _888;
    }
    float _906 = _856;
    float _908 = _842;
    float _910 = _838;
    float _912 = _846;
    float _914 = _850;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _918 = _906 + _916;
    float _920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _922 = _806 + 0.5;
    float _924 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].x, _816);
    float _926 = fma(_918, _918, _908);
    float _928 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].y, _818);
    float _930 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].z, _820);
    float _932 = _922 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _934 = _926 + _910;
    float _936 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[108].x, _924);
    float _938 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[108].y, _928);
    float _940 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[108].z, _930);
    float _942 = -_780;
    float _944 = _942 + 0.5;
    float _946 = _932 * _786;
    float _948 = sqrt(_934);
    float _950 = _698 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _952 = _944 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _954 = _720 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _956 = _728 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _958 = _936 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _960 = _938 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _962 = _940 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _964 = _952 * _920;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _968 = _954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _946;
    out.m_58.y = _964;
    bool _980 = _948 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _982 = isnan(_948);
    bool _984 = _980 || _982;
    bool _986 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _988 = _984 || _986;
    out.m_60.x = _968;
    out.m_60.y = _970;
    out.m_60.z = _972;
    out.m_62.x = _974;
    out.m_62.y = _976;
    out.m_62.z = _978;
    out.m_62.w = _966;
    float _990 = _932;
    float _992 = _912;
    float _994 = _946;
    if (!_988)
    {
        _990 = 1.0;
    }
    float _996 = _990;
    bool _998 = !_988;
    float _1000 = _996;
    if (!_998)
    {
        bool _1002 = _948 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1004 = isnan(_948);
        bool _1006 = _1002 || _1004;
        bool _1008 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1010 = _1006 || _1008;
        if (!_1010)
        {
            float _1012 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1014 = _948 + _1012;
            float _1016 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1018 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1016;
            float _1020 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1022 = _1020 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1024 = 1.0 / _1018;
            float _1026 = _1014 * _1024;
            float _1028 = fma(_1026, _1022, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1000 = _1028;
            _1030 = true;
        }
        else
        {
            bool _1032 = _948 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1034 = isnan(_948);
            bool _1036 = _1032 || _1034;
            bool _1038 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1040 = _1036 || _1038;
            if (!_1040)
            {
                float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1044 = _948 + _1042;
                float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1048 = _1046 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1050 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1052 = _1050 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1054 = 1.0 / _1048;
                float _1056 = _1044 * _1054;
                float _1058 = fma(_1056, _1052, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1000 = _1058;
                _1030 = true;
            }
            else
            {
                _1000 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1030 = false;
    float _1060 = _1000;
    float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1064 = _906 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1068 = _912 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1072 = _914 + _1070;
    float _1074 = fma(_1064, _1060, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1076 = fma(_1068, _1060, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1078 = fma(_1072, _1060, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1082 = _1074 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1076 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1090 = _1078 + _1088;
    float _1092 = _1082 * _1082;
    float _1094 = fma(_1086, _1086, _1092);
    float _1096 = fma(_1090, _1090, _1094);
    float _1098 = rsqrt(_1096);
    float _1100 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1102 = _1086 * _1100;
    float _1104 = _1090 * _1100;
    float _1106 = _1102 * _1102;
    float _1108 = _1104 * _1104;
    float _1110 = _1106 + _1108;
    float _1112 = sqrt(_1110);
    bool _1114 = _1112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1116 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1118 = _1112 + _1116;
    float _1120 = _1090;
    float _1122 = _1092;
    float _1124 = _1118;
    float _1126 = _1082;
    float _1128 = _1102;
    if (_1114)
    {
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1120 = _1130;
    }
    float _1132 = _1120;
    if (_1114)
    {
        float _1134 = rsqrt(_1110);
        _1122 = _1134;
    }
    float _1136 = _1122;
    float _1138 = _1136;
    if (_1114)
    {
        float _1140 = _1118 * _1132;
        _1124 = _1140;
    }
    float _1142 = _1124;
    if (_1114)
    {
        float _1144 = _1142 * 0.15915493667125701904296875;
        _992 = _1144;
    }
    float _1146 = _992;
    float _1148 = _1132;
    if (_1114)
    {
        float _1150 = _1146 * 6.283185482025146484375;
        float _1152 = sin(_1150);
        _1148 = _1152;
    }
    float _1154 = _1148;
    float _1156 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1158 = precise::max(0.0, _1156);
    float _1160 = _1098;
    float _1162 = _1158;
    if (_1114)
    {
        float _1164 = _1146 * 6.283185482025146484375;
        float _1166 = cos(_1164);
        _1160 = _1166;
    }
    float _1168 = _1160;
    float _1170 = -_1100;
    float _1172 = -_1158;
    float _1174 = fma(_1082, _1170, _1172);
    if (_1114)
    {
        float _1176 = _1174 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1162 = _1176;
    }
    float _1178 = _1162;
    float _1180 = sqrt(_1096);
    float _1182 = _1154;
    float _1184 = _1178;
    if (_1114)
    {
        float _1186 = fma(_1154, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _994 = _1186;
    }
    float _1188 = _994;
    float _1190 = _1188;
    if (!_1114)
    {
        _1182 = _1104;
    }
    float _1192 = _1182;
    float _1194 = _1192;
    if (_1114)
    {
        float _1196 = _1168 + (-1.0);
        _1184 = _1196;
    }
    float _1198 = _1184;
    float _1200 = _1198;
    if (_1114)
    {
        float _1202 = _1136 * _1188;
        _1190 = _1202;
    }
    float _1204 = _1190;
    if (!_1114)
    {
        _1138 = _1174;
    }
    float _1206 = _1138;
    float _1208 = _1206;
    if (_1114)
    {
        float _1210 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1126 = _1210;
    }
    float _1212 = _1126;
    float _1214 = _1212;
    if (_1114)
    {
        float _1216 = _1102 * _1204;
        _1128 = _1216;
    }
    float _1218 = _1128;
    if (!_1114)
    {
        _1200 = _1106;
    }
    float _1220 = _1200;
    float _1222 = _1220;
    if (_1114)
    {
        float _1224 = _1104 * _1204;
        _1194 = _1224;
    }
    float _1226 = _1194;
    if (_1114)
    {
        float _1228 = fma(_1174, _1168, _1212);
        _1208 = _1228;
    }
    float _1230 = _1208;
    if (_1114)
    {
        float _1232 = _1218 * _1218;
        _1222 = _1232;
    }
    float _1234 = _1222;
    if (!_1114)
    {
        _1214 = _1108;
    }
    float _1236 = _1214;
    float _1238 = _1236;
    if (_1114)
    {
        float _1240 = _1226 * _1226;
        _1238 = _1240;
    }
    float _1242 = _1238;
    float _1244 = fma(_1230, _1230, _1234);
    float _1246 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1248 = _1244 + _1242;
    float _1250 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1252 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1254 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1252);
    float _1256 = precise::clamp(_1254, 0.0, 1.0);
    float _1258 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1260 = rsqrt(_1248);
    float _1262 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1250);
    float _1264 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1266 = -_1256;
    float _1268 = _1266 + 1.0;
    float _1270 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1246);
    float _1272 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1262);
    float _1274 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1276 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1264);
    float _1278 = abs(_1268);
    float _1280 = log2(_1278);
    float _1282 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1284 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1274);
    float _1286 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1276);
    float _1288 = _1282 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1290 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1284);
    float _1292 = _1286 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1294 = _1260 * _1218;
    float _1296 = -_1288;
    float _1298 = fma(_1296, _1258, 1.0);
    float _1300 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1270);
    float _1302 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1304 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1306 = _1260 * _1230;
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1310 = _1300 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1312 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1304);
    float _1314 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1316 = _1260 * _1226;
    float _1318 = -_1308;
    float _1320 = fma(_1306, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1318);
    float _1322 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1312);
    float _1324 = log2(_1298);
    float _1326 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1328 = -_1316;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1320);
    float _1332 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1322);
    float _1334 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1336 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1326);
    float _1338 = fma(_1330, -0.5, 0.5);
    float _1340 = fma(_1330, 0.5, 0.5);
    float _1342 = exp2(_1314);
    float _1344 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1334);
    float _1346 = _1306 + 1.0;
    float _1348 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1350 = fma(_1340, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1352 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1344);
    float _1354 = 1.0 / _1332;
    float _1356 = fma(_1340, _1350, -0.212114393711090087890625);
    float _1358 = _1324 * 0.693147182464599609375;
    float _1360 = fma(_1340, _1356, 1.570728778839111328125);
    float _1362 = sqrt(_1338);
    float _1364 = -_1306;
    float _1366 = fma(_1342, _1346, _1364);
    float _1368 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1352);
    float _1370 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1348);
    float _1372 = fma(_1366, 0.5, 0.5);
    float _1374 = _1368 * _1354;
    float _1376 = _1370 * _1354;
    float _1378 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1380 = fma(_1374, 0.5, 0.5);
    float _1382 = fma(_1376, -0.5, 0.5);
    float _1384 = _1362 * 0.636619746685028076171875;
    float3 _3617 = float3(_1380, _1382, _1378);
    float _1386 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3617, float3(0.0), isnan(_3617)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3617, float3(0.0), isnan(_3617)), level(0.0)).x;
    float3 _3628 = float3(_1380, _1382, _1378);
    float4 _1389 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3628, float3(0.0), isnan(_3628)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3628, float3(0.0), isnan(_3628)), level(0.0)).xyzw;
    float _1391 = _1389.x;
    float _1393 = _1389.y;
    float _1395 = _1389.z;
    float _1397 = _1389.w;
    float _1399 = -_1360;
    float _1401 = fma(_1384, _1399, 1.0);
    float2 _3650 = float2(_1401, _1372);
    float3 _1405 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3650, float2(0.0), isnan(_3650)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3650, float2(0.0), isnan(_3650)), level(0.0)).xyz;
    float _1407 = _1405.x;
    float _1409 = _1405.y;
    float _1411 = _1405.z;
    float _1413 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1415 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1417 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1415);
    float _1419 = exp2(_1413);
    float _1421 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1417);
    float _1423 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1421);
    float _1425 = _1423 + _1332;
    out.gl_Position.x = _1368;
    out.gl_Position.y = _1370;
    out.gl_Position.z = _1423;
    out.gl_Position.w = _1332;
    float _1427 = -_1419;
    float _1429 = _1427 + 1.0;
    float _1431 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1433 = _1425 * 0.5;
    float _1435 = _1429 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_47.x = _1431;
    out.m_64.z = _1433;
    out.m_64.w = _1332;
    float _1437 = _1435 * _1386;
    float _1439 = -_1435;
    float _1441 = _1439 + 1.0;
    float _1443 = _1397 * _1437;
    float _1445 = _1411 * _1437;
    float _1447 = fma(_1407, _1443, _1391);
    float _1449 = fma(_1409, _1443, _1393);
    float _1451 = _1397 * _1441;
    float _1453 = fma(_1397, _1445, _1395);
    out.m_66.x = _1447;
    out.m_66.y = _1449;
    out.m_66.z = _1453;
    out.m_66.w = _1451;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1030 = false;
    bool _559 = false;
    bool _367 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
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
        out.m_47.x = 0.0;
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
        float _1510 = as_type<float>(_101);
        out.gl_Position.z = _1510;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
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
        out.m_47.x = 0.0;
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
        float _1579 = as_type<float>(_137);
        out.gl_Position.z = _1579;
    }
    if (_129)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = in.m_51.x;
    float _141 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _143 = _119 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _145 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _147 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _149 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _151 = _147 || _149;
    bool _153 = isnan(1.0);
    bool _155 = _151 || _153;
    int _157 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _159 = _157 != 0;
    float _161 = _143 * _141;
    float _163 = 0.0;
    float _165 = _145;
    if (!_155)
    {
        float _167 = _145 * _145;
        float _169 = _167 * 0.5;
        _163 = _169;
    }
    float _171 = _163;
    float _173 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[20].x, _161);
    float _175 = _171;
    if (!_155)
    {
        float _177 = _171 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _175 = _177;
    }
    float _179 = _175;
    float _181 = in.m_49.x;
    float _183 = in.m_49.y;
    float _185 = in.m_49.z;
    float _187 = _173 * 6.283185482025146484375;
    float _189 = floor(_173);
    float _191 = _187 * 0.15915493667125701904296875;
    float _193 = _191 * 6.283185482025146484375;
    float _195 = cos(_193);
    float _197 = -_189;
    float _199 = _173 + _197;
    bool _201 = !_155;
    float _203 = _179;
    if (!_201)
    {
        float _205 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _207 = log2(_205);
        float _209 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _211 = _209 + 1.0;
        float _213 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _215 = _145 * _207;
        float _217 = 1.0 / _211;
        float _219 = _213 * 0.693147182464599609375;
        float _221 = exp2(_215);
        float _223 = 1.0 / _219;
        float _225 = _221 + (-1.0);
        float _227 = -_225;
        float _229 = fma(_227, _223, _145);
        float _231 = _229 * _217;
        float _233 = _231 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _203 = _233;
    }
    float _235 = _203;
    bool _237 = !_155;
    if (!_237)
    {
        float _239 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _241 = log2(_239);
        float _243 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _245 = _243 + 1.0;
        float _247 = 1.0 / _245;
        float _249 = _145 * _241;
        float _251 = exp2(_249);
        float _253 = -_251;
        float _255 = _253 + 1.0;
        float _257 = _255 * _247;
        _165 = _257;
    }
    float _259 = _165;
    float _261 = in.m_53.w;
    int _263 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _265 = _263 != 0;
    int _267 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _269 = _267 != 0;
    float _271 = in.m_44.x;
    float _273 = in.m_44.y;
    float _275 = in.m_44.z;
    bool _277 = _199 < 0.5;
    float _279 = float(_277);
    float _281 = -_199;
    float _283 = fma(_281, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _285 = fma(_195, 0.5, 0.5);
    bool _287 = !_265;
    int _289 = _287 ? 0 : 1;
    float _291 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _293 = -_279;
    float _295 = fma(_293, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _297 = -_285;
    float _299 = fma(_297, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _301 = abs(_289);
    float _303 = fma(_259, _181, _291);
    bool _305 = !_159;
    int _307 = _305 ? 0 : 1;
    float _309 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _311 = !_269;
    int _313 = _311 ? 0 : 1;
    float _315 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    bool _317 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _319 = fma(_259, _183, _309);
    int _321 = abs(_307);
    float _323 = fma(_259, _185, _315);
    int _325 = abs(_313);
    float _327 = float(_301);
    float _329 = float(_321);
    float _331 = abs(_283);
    float _333 = _327 * _331;
    float _335 = fma(_319, _261, _273);
    float _337 = fma(_303, _261, _271);
    float _339 = float(_325);
    float _341 = fma(_329, _299, _333);
    float _343 = fma(_323, _261, _275);
    float _345 = abs(_295);
    float _347 = fma(_339, _345, _341);
    bool _349 = !_317;
    float _365;
    if (!_349)
    {
        float _351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _353 = _139 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _355 = fma(_353, (*spvDescriptorSet0.vp_c9)._m0[12].x, _119);
        float _357 = _355 * _351;
        float _359 = floor(_357);
        float _361 = -_359;
        float _363 = _357 + _361;
        _365 = _363;
        _367 = true;
    }
    else
    {
        float _369 = float(_85);
        float _371 = 1.0 / _369;
        float _373 = _119 * _371;
        _365 = _373;
    }
    _367 = false;
    float _375 = _365;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _379 = _375 + _377;
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _383 = _375 + _381;
    float _385 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _387 = _375 + _385;
    float _389 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _389;
    float _393 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _395 = _393 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _397 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _399 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _397;
    float _401 = 1.0 / _391;
    bool _403 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _405 = 1.0 / _399;
    bool _407 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _409 = isnan(_375);
    bool _411 = _407 || _409;
    bool _413 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _415 = _411 || _413;
    float _417 = float(_415);
    float _419 = 1.0 / _395;
    float _421 = _379 * _401;
    bool _423 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _425 = isnan(_375);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = _383 * _405;
    bool _437 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _439 = isnan(_375);
    bool _441 = _437 || _439;
    bool _443 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _445 = _441 || _443;
    float _447 = float(_445);
    float _449 = -_417;
    float _451 = _449 + 1.0;
    float _453 = _447 * _451;
    float _455 = -_447;
    float _457 = _455 + 1.0;
    float _459 = _387 * _419;
    float _461 = -_433;
    float _463 = _461 + 1.0;
    bool _465 = _375 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _467 = isnan(_375);
    bool _469 = _465 || _467;
    bool _471 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _473 = _469 || _471;
    float _475 = float(_473);
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _479 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _477;
    float _481 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _483 = _481 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _485 = _417 * _463;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _487;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _495 = fma(_479, _421, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _497 = _475 * _457;
    float _499 = fma(_489, _421, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _501 = fma(_483, _459, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _503 = fma(_493, _459, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _505 = -_475;
    float _507 = _505 + 1.0;
    float _509 = _495 * _497;
    float _511 = _499 * _497;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _513;
    float _517 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[143].x, _509);
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _519;
    float _523 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[143].y, _511);
    float _525 = fma(_515, _435, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _527 = fma(_501, _453, _517);
    float _529 = fma(_521, _435, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _531 = fma(_503, _453, _523);
    float _533 = fma(_525, _485, _527);
    float _535 = fma(_529, _485, _531);
    float _537 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[146].x, _533);
    float _539 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[146].y, _535);
    bool _541 = !_403;
    float _557;
    if (!_541)
    {
        float _543 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _545 = _139 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _547 = fma(_545, (*spvDescriptorSet0.vp_c9)._m0[11].x, _119);
        float _549 = _547 * _543;
        float _551 = floor(_549);
        float _553 = -_551;
        float _555 = _549 + _553;
        _557 = _555;
        _559 = true;
    }
    else
    {
        float _561 = float(_85);
        float _563 = 1.0 / _561;
        float _565 = _119 * _563;
        _557 = _565;
    }
    _559 = false;
    float _567 = _557;
    float _569 = in.m_53.x;
    float _571 = in.m_53.y;
    float _573 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].z));
    float _575 = as_type<float>(int(gl_VertexIndex));
    float _577 = in.m_51.y;
    float _579 = _539 * _571;
    float _581 = _335 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _583 = as_type<int>(_575) & 1;
    bool _585 = _583 != 0;
    int _587 = as_type<int>(_575) & 2;
    bool _589 = _587 != 0;
    float _591 = _347 * _579;
    float _593 = _537 * _569;
    float _595 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[5].x, _581);
    float _597 = _591 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    bool _599 = !_589;
    float _601 = _599 ? (-0.5) : 0.5;
    float _603 = _347 * _593;
    bool _605 = _139 > 0.5;
    float _607 = _573 * _139;
    bool _609 = !_585;
    float _611 = _609 ? (-0.5) : 0.5;
    float _613 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _601);
    float _615 = _603 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _617 = _577 > 0.5;
    float _619 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _611);
    float _621 = _597 * _613;
    float _623 = _335 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _625 = _335 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _627 = _615 * _619;
    float _629 = _621 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _631 = _621 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _633 = trunc(_607);
    int _635 = int(_633);
    float _637 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[4].x, _623);
    float _639 = fma(_337, (*spvDescriptorSet0.vp_c10)._m0[6].x, _625);
    float _641 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _643 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[24].x, _629);
    float _645 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[26].x, _631);
    float _647 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[4].z, _637);
    float _649 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[6].z, _639);
    float _651 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[24].z, _643);
    float _653 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[26].z, _645);
    float _655 = _647 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _657 = _649 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _659 = _651 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _661 = _653 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _663 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _663;
    float _667 = _655 + _659;
    float _669 = _657 + _661;
    int _671 = _635 << 4;
    int _673 = _671 + 1968;
    float _675 = 1.0 / _665;
    float _677 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _679 = _667 + _677;
    float _681 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _683 = _669 + _681;
    int _685 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _687 = _685 != 0;
    int _689 = _673 + 8;
    uint _692 = uint(int(uint(_689) >> uint(2)));
    uint _694 = uint(int(uint(int(_692)) >> uint(2)));
    int _696 = int(_692) & 3;
    float _698 = (*spvDescriptorSet0.vp_c9)._m0[int(_694)][_696];
    float _700 = _679 * _679;
    float _702 = _683 * _683;
    int _704 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _706 = _704 != 0;
    float _708 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _710 = _567 + _708;
    float _712 = _700 + _702;
    uint _714 = uint(int(uint(_673) >> uint(2)));
    uint _716 = uint(int(uint(int(_714)) >> uint(2)));
    int _718 = int(_714) & 3;
    float _720 = (*spvDescriptorSet0.vp_c9)._m0[int(_716)][_718];
    int _722 = int(_714) + 1;
    uint _724 = uint(int(uint(_722) >> uint(2)));
    int _726 = _722 & 3;
    float _728 = (*spvDescriptorSet0.vp_c9)._m0[int(_724)][_726];
    float _730 = sqrt(_712);
    float _732 = _710 * _675;
    float _734 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _736 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _734;
    float _738 = fma(_343, (*spvDescriptorSet0.vp_c10)._m0[5].z, _595);
    float _740 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _742 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _740;
    float _744 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _746 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _744;
    float _748 = fma(_736, _732, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _750 = _621 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _752 = -_601;
    int _754 = _617 ? as_type<int>(_752) : as_type<int>(_601);
    float _756 = fma(_742, _732, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    bool _758 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _760 = isnan(_567);
    bool _762 = _758 || _760;
    bool _764 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _766 = _762 || _764;
    float _768 = float(_766);
    float _770 = fma(_627, (*spvDescriptorSet0.vp_c8)._m0[25].x, _750);
    float _772 = -_611;
    int _774 = _605 ? as_type<int>(_772) : as_type<int>(_611);
    float _776 = fma(_746, _732, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    bool _778 = !_706;
    float _780 = _778 ? _601 : as_type<float>(_754);
    float _782 = fma(_641, (*spvDescriptorSet0.vp_c8)._m0[25].z, _770);
    bool _784 = _730 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _786 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _788 = _567 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _790 = isnan(_567);
    bool _792 = _788 || _790;
    bool _794 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _796 = _792 || _794;
    float _798 = float(_796);
    float _800 = -_768;
    float _802 = _800 + 1.0;
    bool _804 = !_687;
    float _806 = _804 ? _611 : as_type<float>(_774);
    float _808 = _738 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _810 = _782 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _812 = _798 * _802;
    float _814 = _808 + _810;
    float _816 = _748 * _812;
    float _818 = _756 * _812;
    float _820 = _776 * _812;
    float _822 = -_798;
    float _824 = _822 + 1.0;
    float _826 = _748;
    float _828 = _776;
    float _830 = _798;
    float _832 = _808;
    float _834 = _641;
    if (!_784)
    {
        _826 = _702;
    }
    float _836 = _826;
    float _838 = _836;
    if (!_784)
    {
        _828 = _700;
    }
    float _840 = _828;
    float _842 = _840;
    if (!_784)
    {
        _830 = _667;
    }
    float _844 = _830;
    float _846 = _844;
    if (!_784)
    {
        _832 = _669;
    }
    float _848 = _832;
    float _850 = _848;
    if (!_784)
    {
        _834 = _814;
    }
    float _852 = _834;
    bool _854 = !_784;
    float _856 = _852;
    if (!_854)
    {
        float _858 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _860 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _862 = _730 + _860;
        float _864 = rsqrt(_712);
        float _866 = _862 * _858;
        float _868 = _814 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _870 = _866 * 0.15915493667125701904296875;
        float _872 = _870 * 6.283185482025146484375;
        float _874 = sin(_872);
        float _876 = _870 * 6.283185482025146484375;
        float _878 = cos(_876);
        float _880 = fma(_874, _868, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _882 = _864 * _880;
        float _884 = _878 + (-1.0);
        float _886 = fma(_679, _882, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _888 = fma(_683, _882, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _890 = _884 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _892 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _894 = _886 + _892;
        float _896 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _898 = _888 + _896;
        float _900 = fma(_814, _878, _890);
        float _902 = _894 * _894;
        float _904 = _898 * _898;
        _856 = _900;
        _842 = _902;
        _838 = _904;
        _846 = _886;
        _850 = _888;
    }
    float _906 = _856;
    float _908 = _842;
    float _910 = _838;
    float _912 = _846;
    float _914 = _850;
    float _916 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _918 = _906 + _916;
    float _920 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _922 = _806 + 0.5;
    float _924 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].x, _816);
    float _926 = fma(_918, _918, _908);
    float _928 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].y, _818);
    float _930 = fma(_824, (*spvDescriptorSet0.vp_c9)._m0[107].z, _820);
    float _932 = _922 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _934 = _926 + _910;
    float _936 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[108].x, _924);
    float _938 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[108].y, _928);
    float _940 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[108].z, _930);
    float _942 = -_780;
    float _944 = _942 + 0.5;
    float _946 = _932 * _786;
    float _948 = sqrt(_934);
    float _950 = _698 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _952 = _944 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _954 = _720 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _956 = _728 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _958 = _936 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _960 = _938 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _962 = _940 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _964 = _952 * _920;
    float _966 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _968 = _954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _970 = _956 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _972 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _974 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _976 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _978 = _962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_58.x = _946;
    out.m_58.y = _964;
    bool _980 = _948 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _982 = isnan(_948);
    bool _984 = _980 || _982;
    bool _986 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _988 = _984 || _986;
    out.m_60.x = _968;
    out.m_60.y = _970;
    out.m_60.z = _972;
    out.m_62.x = _974;
    out.m_62.y = _976;
    out.m_62.z = _978;
    out.m_62.w = _966;
    float _990 = _932;
    float _992 = _912;
    float _994 = _946;
    if (!_988)
    {
        _990 = 1.0;
    }
    float _996 = _990;
    bool _998 = !_988;
    float _1000 = _996;
    if (!_998)
    {
        bool _1002 = _948 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1004 = isnan(_948);
        bool _1006 = _1002 || _1004;
        bool _1008 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1010 = _1006 || _1008;
        if (!_1010)
        {
            float _1012 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1014 = _948 + _1012;
            float _1016 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1018 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1016;
            float _1020 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1022 = _1020 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1024 = 1.0 / _1018;
            float _1026 = _1014 * _1024;
            float _1028 = fma(_1026, _1022, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1000 = _1028;
            _1030 = true;
        }
        else
        {
            bool _1032 = _948 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1034 = isnan(_948);
            bool _1036 = _1032 || _1034;
            bool _1038 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1040 = _1036 || _1038;
            if (!_1040)
            {
                float _1042 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1044 = _948 + _1042;
                float _1046 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1048 = _1046 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1050 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1052 = _1050 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1054 = 1.0 / _1048;
                float _1056 = _1044 * _1054;
                float _1058 = fma(_1056, _1052, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1000 = _1058;
                _1030 = true;
            }
            else
            {
                _1000 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1030 = false;
    float _1060 = _1000;
    float _1062 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1064 = _906 + _1062;
    float _1066 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1068 = _912 + _1066;
    float _1070 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1072 = _914 + _1070;
    float _1074 = fma(_1064, _1060, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1076 = fma(_1068, _1060, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1078 = fma(_1072, _1060, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1080 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1082 = _1074 + _1080;
    float _1084 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1086 = _1076 + _1084;
    float _1088 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1090 = _1078 + _1088;
    float _1092 = _1082 * _1082;
    float _1094 = fma(_1086, _1086, _1092);
    float _1096 = fma(_1090, _1090, _1094);
    float _1098 = rsqrt(_1096);
    float _1100 = _1098 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1102 = _1086 * _1100;
    float _1104 = _1090 * _1100;
    float _1106 = _1102 * _1102;
    float _1108 = _1104 * _1104;
    float _1110 = _1106 + _1108;
    float _1112 = sqrt(_1110);
    bool _1114 = _1112 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1116 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1118 = _1112 + _1116;
    float _1120 = _1090;
    float _1122 = _1092;
    float _1124 = _1118;
    float _1126 = _1082;
    float _1128 = _1102;
    if (_1114)
    {
        float _1130 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1120 = _1130;
    }
    float _1132 = _1120;
    if (_1114)
    {
        float _1134 = rsqrt(_1110);
        _1122 = _1134;
    }
    float _1136 = _1122;
    float _1138 = _1136;
    if (_1114)
    {
        float _1140 = _1118 * _1132;
        _1124 = _1140;
    }
    float _1142 = _1124;
    if (_1114)
    {
        float _1144 = _1142 * 0.15915493667125701904296875;
        _992 = _1144;
    }
    float _1146 = _992;
    float _1148 = _1132;
    if (_1114)
    {
        float _1150 = _1146 * 6.283185482025146484375;
        float _1152 = sin(_1150);
        _1148 = _1152;
    }
    float _1154 = _1148;
    float _1156 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1158 = precise::max(0.0, _1156);
    float _1160 = _1098;
    float _1162 = _1158;
    if (_1114)
    {
        float _1164 = _1146 * 6.283185482025146484375;
        float _1166 = cos(_1164);
        _1160 = _1166;
    }
    float _1168 = _1160;
    float _1170 = -_1100;
    float _1172 = -_1158;
    float _1174 = fma(_1082, _1170, _1172);
    if (_1114)
    {
        float _1176 = _1174 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1162 = _1176;
    }
    float _1178 = _1162;
    float _1180 = sqrt(_1096);
    float _1182 = _1154;
    float _1184 = _1178;
    if (_1114)
    {
        float _1186 = fma(_1154, _1178, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _994 = _1186;
    }
    float _1188 = _994;
    float _1190 = _1188;
    if (!_1114)
    {
        _1182 = _1104;
    }
    float _1192 = _1182;
    float _1194 = _1192;
    if (_1114)
    {
        float _1196 = _1168 + (-1.0);
        _1184 = _1196;
    }
    float _1198 = _1184;
    float _1200 = _1198;
    if (_1114)
    {
        float _1202 = _1136 * _1188;
        _1190 = _1202;
    }
    float _1204 = _1190;
    if (!_1114)
    {
        _1138 = _1174;
    }
    float _1206 = _1138;
    float _1208 = _1206;
    if (_1114)
    {
        float _1210 = _1198 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1126 = _1210;
    }
    float _1212 = _1126;
    float _1214 = _1212;
    if (_1114)
    {
        float _1216 = _1102 * _1204;
        _1128 = _1216;
    }
    float _1218 = _1128;
    if (!_1114)
    {
        _1200 = _1106;
    }
    float _1220 = _1200;
    float _1222 = _1220;
    if (_1114)
    {
        float _1224 = _1104 * _1204;
        _1194 = _1224;
    }
    float _1226 = _1194;
    if (_1114)
    {
        float _1228 = fma(_1174, _1168, _1212);
        _1208 = _1228;
    }
    float _1230 = _1208;
    if (_1114)
    {
        float _1232 = _1218 * _1218;
        _1222 = _1232;
    }
    float _1234 = _1222;
    if (!_1114)
    {
        _1214 = _1108;
    }
    float _1236 = _1214;
    float _1238 = _1236;
    if (_1114)
    {
        float _1240 = _1226 * _1226;
        _1238 = _1240;
    }
    float _1242 = _1238;
    float _1244 = fma(_1230, _1230, _1234);
    float _1246 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1248 = _1244 + _1242;
    float _1250 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1252 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1254 = fma(_1180, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1252);
    float _1256 = precise::clamp(_1254, 0.0, 1.0);
    float _1258 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1260 = rsqrt(_1248);
    float _1262 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1250);
    float _1264 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1266 = -_1256;
    float _1268 = _1266 + 1.0;
    float _1270 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1246);
    float _1272 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1262);
    float _1274 = _1074 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1276 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1264);
    float _1278 = abs(_1268);
    float _1280 = log2(_1278);
    float _1282 = _1272 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1284 = fma(_1076, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1274);
    float _1286 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1276);
    float _1288 = _1282 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1290 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1284);
    float _1292 = _1286 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1294 = _1260 * _1218;
    float _1296 = -_1288;
    float _1298 = fma(_1296, _1258, 1.0);
    float _1300 = fma(_1078, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1270);
    float _1302 = _1290 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1304 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1306 = _1260 * _1230;
    float _1308 = _1294 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1310 = _1300 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1312 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1304);
    float _1314 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1316 = _1260 * _1226;
    float _1318 = -_1308;
    float _1320 = fma(_1306, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1318);
    float _1322 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1312);
    float _1324 = log2(_1298);
    float _1326 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1328 = -_1316;
    float _1330 = fma(_1328, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1320);
    float _1332 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1322);
    float _1334 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1336 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1326);
    float _1338 = fma(_1330, -0.5, 0.5);
    float _1340 = fma(_1330, 0.5, 0.5);
    float _1342 = exp2(_1314);
    float _1344 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1334);
    float _1346 = _1306 + 1.0;
    float _1348 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1336);
    float _1350 = fma(_1340, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1352 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1344);
    float _1354 = 1.0 / _1332;
    float _1356 = fma(_1340, _1350, -0.212114393711090087890625);
    float _1358 = _1324 * 0.693147182464599609375;
    float _1360 = fma(_1340, _1356, 1.570728778839111328125);
    float _1362 = sqrt(_1338);
    float _1364 = -_1306;
    float _1366 = fma(_1342, _1346, _1364);
    float _1368 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1352);
    float _1370 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1348);
    float _1372 = fma(_1366, 0.5, 0.5);
    float _1374 = _1368 * _1354;
    float _1376 = _1370 * _1354;
    float _1378 = _1358 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1380 = fma(_1374, 0.5, 0.5);
    float _1382 = fma(_1376, -0.5, 0.5);
    float _1384 = _1362 * 0.636619746685028076171875;
    float3 _3617 = float3(_1380, _1382, _1378);
    float _1386 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_3617, float3(0.0), isnan(_3617)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_3617, float3(0.0), isnan(_3617)), level(0.0)).x;
    float3 _3628 = float3(_1380, _1382, _1378);
    float4 _1389 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_3628, float3(0.0), isnan(_3628)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_3628, float3(0.0), isnan(_3628)), level(0.0)).xyzw;
    float _1391 = _1389.x;
    float _1393 = _1389.y;
    float _1395 = _1389.z;
    float _1397 = _1389.w;
    float _1399 = -_1360;
    float _1401 = fma(_1384, _1399, 1.0);
    float2 _3650 = float2(_1401, _1372);
    float3 _1405 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_3650, float2(0.0), isnan(_3650)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_3650, float2(0.0), isnan(_3650)), level(0.0)).xyz;
    float _1407 = _1405.x;
    float _1409 = _1405.y;
    float _1411 = _1405.z;
    float _1413 = _1280 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1415 = _1292 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1417 = fma(_1302, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1415);
    float _1419 = exp2(_1413);
    float _1421 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1417);
    float _1423 = fma(_1310, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1421);
    float _1425 = _1423 + _1332;
    out.gl_Position.x = _1368;
    out.gl_Position.y = _1370;
    out.gl_Position.z = _1423;
    out.gl_Position.w = _1332;
    float _1427 = -_1419;
    float _1429 = _1427 + 1.0;
    float _1431 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1433 = _1425 * 0.5;
    float _1435 = _1429 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_47.x = _1431;
    out.m_64.z = _1433;
    out.m_64.w = _1332;
    float _1437 = _1435 * _1386;
    float _1439 = -_1435;
    float _1441 = _1439 + 1.0;
    float _1443 = _1397 * _1437;
    float _1445 = _1411 * _1437;
    float _1447 = fma(_1407, _1443, _1391);
    float _1449 = fma(_1409, _1443, _1393);
    float _1451 = _1397 * _1441;
    float _1453 = fma(_1397, _1445, _1395);
    out.m_66.x = _1447;
    out.m_66.y = _1449;
    out.m_66.z = _1453;
    out.m_66.w = _1451;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

