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
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c13 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
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
    float4 m_66 [[user(locn0)]];
    float4 m_62 [[user(locn1)]];
    float4 m_68 [[user(locn2)]];
    float4 m_70 [[user(locn3)]];
    float4 m_76 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_86 [[user(locn7)]];
    float4 m_64 [[user(locn8)]];
    float4 m_49 [[user(locn9)]];
    float4 m_72 [[user(locn10)]];
    float4 m_80 [[user(locn11)]];
    float4 m_51 [[user(locn12)]];
    float4 m_84 [[user(locn13)]];
    float4 m_78 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_58 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3491 = false;
    bool _677 = false;
    bool _575 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = in.m_46.w;
    float _104 = trunc(_100);
    int _107 = int(_104);
    float _109 = -_102;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = _102;
    float _121 = _111;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _117;
    if (!_115)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_115)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3807 = as_type<float>(_129);
        out.gl_Position.z = _3807;
    }
    if (!_115)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _133 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_102);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = float(_107);
    bool _145 = _111 >= _143;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    if (_149)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _119;
    if (_149)
    {
        out.m_51.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _131 = as_type<int>(_153);
    }
    int _155 = _131;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3862 = as_type<float>(_155);
        out.gl_Position.z = _3862;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = in.m_53.x;
    float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _161 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = _161 * _159;
    float _179 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    float _181 = in.m_46.x;
    float _183 = in.m_46.y;
    float _185 = in.m_46.z;
    float _187 = floor(_179);
    float _189 = _179 * 6.283185482025146484375;
    int _191 = as_type<int>(_163) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_163) & 2;
    bool _197 = _195 != 0;
    float _199 = _189 * 0.15915493667125701904296875;
    int _201 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _203 = _201 != 0;
    bool _205 = !_193;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = _199 * 6.283185482025146484375;
    float _211 = cos(_209);
    bool _213 = !_197;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = -_187;
    float _219 = _179 + _217;
    float _221 = _187;
    float _223 = _165;
    if (!_175)
    {
        float _225 = _165 * _165;
        float _227 = _225 * 0.5;
        _221 = _227;
    }
    float _229 = _221;
    float _231 = _229;
    if (!_175)
    {
        float _233 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _233;
    }
    float _235 = _231;
    bool _237 = !_175;
    float _239 = _235;
    if (!_237)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _165 * _243;
        float _253 = 1.0 / _247;
        float _255 = _249 * 0.693147182464599609375;
        float _257 = exp2(_251);
        float _259 = 1.0 / _255;
        float _261 = _257 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _259, _165);
        float _267 = _265 * _253;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _239 = _269;
    }
    float _271 = _239;
    bool _273 = !_175;
    if (!_273)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = 1.0 / _281;
        float _285 = _165 * _277;
        float _287 = exp2(_285);
        float _289 = -_287;
        float _291 = _289 + 1.0;
        float _293 = _291 * _283;
        _223 = _293;
    }
    float _295 = _223;
    float _297 = in.m_58.w;
    float _299 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _301 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    float _309 = _299 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _311 = _299 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _313 = _299 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _315 = _219 < 0.5;
    float _317 = float(_315);
    float _319 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].x, _309);
    float _321 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].y, _311);
    float _323 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].z, _313);
    float _325 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = -_219;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = fma(_211, 0.5, 0.5);
    float _333 = -_317;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _337 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[10].x, _319);
    float _339 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[10].y, _321);
    float _341 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[10].z, _323);
    float _343 = _325;
    float _345 = _319;
    if (!_175)
    {
        float _347 = _111 * _111;
        float _349 = _347 * 0.5;
        _343 = _349;
    }
    float _351 = _343;
    float _353 = fma(_295, _181, _337);
    float _355 = fma(_295, _183, _339);
    float _357 = -_331;
    float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _361 = fma(_295, _185, _341);
    float _363 = _351;
    if (!_175)
    {
        _345 = _111;
    }
    float _365 = _345;
    float _367 = _365;
    if (!_175)
    {
        float _369 = _351 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _363 = _369;
    }
    float _371 = _363;
    bool _373 = !_175;
    float _375 = _371;
    if (!_373)
    {
        float _377 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _379 = log2(_377);
        float _381 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _383 = _381 + 1.0;
        float _385 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _387 = _111 * _379;
        float _389 = 1.0 / _383;
        float _391 = _385 * 0.693147182464599609375;
        float _393 = exp2(_387);
        float _395 = 1.0 / _391;
        float _397 = _393 + (-1.0);
        float _399 = -_397;
        float _401 = fma(_399, _395, _111);
        float _403 = _401 * _389;
        float _405 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _375 = _405;
    }
    float _407 = _375;
    bool _409 = !_175;
    if (!_409)
    {
        float _411 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _413 = log2(_411);
        float _415 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _417 = _415 + 1.0;
        float _419 = 1.0 / _417;
        float _421 = _111 * _413;
        float _423 = exp2(_421);
        float _425 = -_423;
        float _427 = _425 + 1.0;
        float _429 = _427 * _419;
        _367 = _429;
    }
    float _431 = _367;
    float _433 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _435 = fma(_353, _297, _303);
    float _437 = fma(_355, _297, _305);
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _445 = _443 != 0;
    float _447 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _449 = _433 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _451 = fma(_361, _297, _307);
    float _453 = _433 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    bool _455 = !_441;
    int _457 = _455 ? 0 : 1;
    float _459 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[8].y, _449);
    float _463 = _433 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    int _465 = abs(_457);
    float _467 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[8].x, _453);
    float _469 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[10].y, _461);
    float _471 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[8].z, _463);
    bool _473 = !_203;
    int _475 = _473 ? 0 : 1;
    float _477 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[10].x, _467);
    float _479 = float(_465);
    float _481 = fma(_431, _183, _469);
    float _483 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[10].z, _471);
    int _485 = abs(_475);
    float _487 = 1.0 / _143;
    float _489 = abs(_329);
    float _491 = _479 * _489;
    bool _493 = !_445;
    int _495 = _493 ? 0 : 1;
    float _497 = fma(_431, _181, _477);
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _501 = -_481;
    float _503 = _355 + _501;
    float _505 = fma(_431, _185, _483);
    int _507 = abs(_495);
    float _509 = -_497;
    float _511 = _353 + _509;
    float _513 = _503 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _515 = float(_485);
    float _517 = _503 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _519 = _503 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _521 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[4].x, _513);
    float _523 = float(_507);
    float _525 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[5].x, _517);
    float _527 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[6].x, _519);
    float _529 = -_505;
    float _531 = _361 + _529;
    float _533 = fma(_515, _359, _491);
    float _535 = _111 * _487;
    float _537 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[4].z, _521);
    float _539 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[5].z, _525);
    float _541 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[6].z, _527);
    float _543 = abs(_335);
    float _545 = fma(_523, _543, _533);
    bool _547 = !_499;
    float _549 = _539;
    float _551 = _537;
    float _553 = _541;
    float _555 = _539;
    float _557 = _497;
    float _573;
    if (!_547)
    {
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _561 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        _573 = _535;
    }
    _575 = false;
    float _577 = _573;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _581 = _577 + _579;
    float _583 = in.m_58.x;
    float _585 = in.m_58.y;
    bool _587 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _589 = isnan(_577);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _599;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _605 = 1.0 / _601;
    float _607 = -_597;
    float _609 = _607 + 1.0;
    float _611 = _581 * _605;
    bool _613 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _615 = isnan(_577);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _629;
    float _633 = _623 * _609;
    float _635 = fma(_627, _611, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _637 = fma(_631, _611, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _639 = -_623;
    float _641 = _639 + 1.0;
    float _643 = _635 * _633;
    float _645 = _637 * _633;
    float _647 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].x, _643);
    float _649 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].y, _645);
    float _651 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[144].x, _647);
    float _653 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[144].y, _649);
    float _655 = _651 * _583;
    float _657 = _653 * _585;
    bool _659 = !_603;
    float _675;
    if (!_659)
    {
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _663 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        _675 = _535;
    }
    _677 = false;
    float _679 = _675;
    float _681 = in.m_53.y;
    float _683 = _157 * 2.0;
    float _685 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _687 = in.m_53.w;
    float _689 = _437 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _691 = floor(_683);
    float _693 = in.m_53.z;
    float _695 = _207 * _685;
    bool _697 = _157 > 0.5;
    float _699 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _705 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].x, _689);
    float _707 = _437 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _709 = _437 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _713 = _711 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _715 = 1.0 / _703;
    float _717 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].x, _707);
    bool _719 = _691 > 0.0;
    float _721 = _681 * 2.0;
    bool _723 = _691 >= 0.0;
    bool _725 = isnan(_691);
    bool _727 = _723 || _725;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    float _733 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].x, _709);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _741 = _731 ? 0 : 1;
    float _743 = floor(_721);
    bool _745 = _687 > 0.5;
    float _747 = _215 * _699;
    int _749 = ~_741;
    int _751 = _749 + 1;
    int _753 = _751 + 1;
    float _755 = _681 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _761 = _753;
    float _763 = _695;
    float _765 = _747;
    if (!_719)
    {
        int _767 = ~_741;
        int _769 = _767 + 1;
        _761 = _769;
    }
    int _771 = _761;
    float _773 = 1.0 / _713;
    float _775 = -_215;
    int _777 = _745 ? as_type<int>(_775) : as_type<int>(_215);
    float _779 = fma(_755, -2.0, _739);
    float _781 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _783 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].z, _705);
    float _785 = 1.0 / _737;
    bool _787 = _743 >= 0.0;
    bool _789 = isnan(_743);
    bool _791 = _787 || _789;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _801 = _743 > 0.0;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _805 = _795 ? 0 : 1;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _813 = _811 != 0;
    float _815 = 1.0 / _759;
    float _817 = -_803;
    float _819 = fma(_781, 2.0, _817);
    int _821 = ~_805;
    int _823 = _821 + 1;
    int _825 = _823 + 1;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _829 = _827 != 0;
    float _831 = -_111;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[76].x, _819);
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _837 = _835 != 0;
    float _839 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _841 = int(_839);
    int _843 = _825;
    float _845 = as_type<float>(_841);
    if (!_801)
    {
        int _847 = ~_805;
        int _849 = _847 + 1;
        _843 = _849;
    }
    int _851 = _843;
    bool _853 = _681 > 0.5;
    float _855 = 0.0;
    if (!_813)
    {
        _855 = _681;
    }
    float _857 = _855;
    float _859 = 0.0;
    float _861 = _857;
    if (!_813)
    {
        _859 = _693;
    }
    float _863 = _859;
    float _865 = 1.0 / _799;
    float _867 = 0.0;
    float _869 = _863;
    if (!_813)
    {
        _867 = _693;
    }
    float _871 = _867;
    float _873 = _871;
    if (_829)
    {
        float _875 = -_695;
        float _877 = _697 ? _875 : _695;
        _763 = _877;
    }
    float _879 = _763;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _883 = _881 != 0;
    bool _885 = _693 > 0.5;
    float _887 = 1.0 / _809;
    bool _889 = !_883;
    int _891 = _889 ? 0 : 1;
    float _893 = -_207;
    int _895 = _885 ? as_type<int>(_893) : as_type<int>(_207);
    if (_837)
    {
        float _897 = -_747;
        float _899 = _853 ? _897 : _747;
        _765 = _899;
    }
    float _901 = _765;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _905 = _903 != 0;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _909 = _907 != 0;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _913 = _911 != 0;
    float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _919 = _917 != 0;
    float _921 = _901 + (-0.5);
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _925 = _923 != 0;
    bool _927 = !_813;
    float _929 = _927 ? 1.2345600128173828125 : 1.0;
    bool _931 = !_813;
    float _933 = _931 ? _681 : _157;
    bool _935 = !_919;
    float _937 = _935 ? _207 : as_type<float>(_895);
    if (_813)
    {
        _861 = _157;
    }
    float _939 = _861;
    float _941 = _929 * _933;
    bool _943 = !_925;
    float _945 = _943 ? _215 : as_type<float>(_777);
    float _947 = _681 + _693;
    if (_813)
    {
        _869 = _681;
    }
    float _949 = _869;
    float _951 = _915 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_813)
    {
        _873 = _681;
    }
    float _953 = _873;
    bool _955 = !_909;
    int _957 = _955 ? 0 : 1;
    float _959 = _949 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _963 = _961 != 0;
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _967 = _965 != 0;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _971 = _969 != 0;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _975 = _973 != 0;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _979 = _977 != 0;
    float _981 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].z, _717);
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _983;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _991 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].z, _733);
    float _993 = _985 * _715;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _999;
    float _1003 = 1.0 / _989;
    float _1005 = _997 * _773;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1011 = _1001 * _785;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1017 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1019 = log2(_1017);
    float _1021 = _1009 * _815;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1035;
    float _1039 = float(_841);
    float _1041 = _1029 * _865;
    float _1043 = 1.0 / _1015;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1045;
    float _1049 = _157 + _681;
    float _1051 = _1037 * _887;
    float _1053 = _111 * _1039;
    float _1055 = _1047 * _1003;
    float _1057 = _1049 + (-1.0);
    float _1059 = _693 * 2.0;
    float _1061 = 1.0 / _1025;
    float _1063 = _1053 * _487;
    float _1065 = _111 * _1019;
    float _1067 = _991 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1069;
    bool _1073 = !_905;
    int _1075 = _1073 ? 0 : 1;
    float _1077 = 1.0 / _1033;
    float _1079 = float(uint(_841));
    float _1081 = _1071 * _1043;
    bool _1083 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1085 = isnan(_679);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    bool _1095 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1097 = isnan(_535);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    float _1107 = floor(_1059);
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1113;
    bool _1117 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1119 = isnan(_535);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = _1111 * _1061;
    float _1131 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1133 = _157 + _693;
    float _1135 = exp2(_1065);
    float _1137 = _1115 * _1077;
    float _1139 = _1133 + (-1.0);
    float _1141 = _947 + (-1.0);
    int _1143 = ~_841;
    int _1145 = _1143 + 1;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1149 = _1107 >= 0.0;
    bool _1151 = isnan(_1107);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.0);
    bool _1157 = _1153 || _1155;
    float _1159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1161 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1163 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1165 = _1157 ? 0 : 1;
    float _1167 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _779);
    bool _1169 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1171 = isnan(0.0);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1177 = _1173 || _1175;
    float _1179 = _879 + 0.5;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1183 = _679 + _1181;
    float _1185 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1187 = int(_1185);
    float _1189 = -_1135;
    float _1191 = _1189 + 1.0;
    float _1193 = fma(_951, _1179, _833);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1197 = _679 + _1195;
    float _1199 = fma(_993, _1183, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1203 = _679 + _1201;
    float _1205 = _1177 ? _1191 : 0.0;
    float _1207 = fma(_1005, _1197, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1209 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1211 = _1107 > 0.0;
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1215 = _535 + _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1219 = _535 + _1217;
    float _1221 = -_1209;
    float _1223 = -_1167;
    float _1225 = fma(_1221, _921, _1223);
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1229 = _535 + _1227;
    float _1231 = fma(_1081, _1203, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1233 = fma(_1055, _1215, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1235 = float(_1187);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1239 = _535 + _1237;
    float _1241 = fma(_1011, _1219, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1245 = _535 + _1243;
    float _1247 = 1.0 / _1235;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1251 = _535 + _1249;
    float _1253 = fma(_1129, _1229, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1255 = fma(_1021, _1239, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1257 = fma(_1051, _1245, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1261 = _535 + _1259;
    float _1263 = fma(_1137, _1251, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1265 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1267 = isnan(_535);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = 1.0 / _1079;
    float _1279 = fma(_1041, _1261, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1281 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1283 = isnan(_535);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1147);
    float _1295 = -_1275;
    float _1297 = _1295 + 1.0;
    bool _1299 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1301 = isnan(_679);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1307 = _1303 || _1305;
    float _1309 = float(_1307);
    bool _1311 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1313 = isnan(_679);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1319 = _1315 || _1317;
    float _1321 = float(_1319);
    float _1323 = _111 * _1247;
    bool _1325 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1327 = isnan(_679);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    float _1337 = _1291 * _1297;
    bool _1339 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1341 = isnan(_535);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = -_1291;
    float _1353 = _1351 + 1.0;
    bool _1355 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1357 = isnan(_535);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    float _1367 = trunc(_1323);
    int _1369 = int(_1367);
    bool _1371 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1373 = isnan(_535);
    bool _1375 = _1371 || _1373;
    bool _1377 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1379 = _1375 || _1377;
    float _1381 = float(_1379);
    float _1383 = -_1349;
    float _1385 = _1383 + 1.0;
    int _1387 = as_type<int>(_1277) + (-2);
    float _1389 = -_1365;
    float _1391 = _1389 + 1.0;
    bool _1393 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1395 = isnan(_535);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1401 = _1397 || _1399;
    float _1403 = float(_1401);
    float _1405 = _1349 * _1353;
    float _1407 = _1365 * _1385;
    float _1409 = -_1335;
    float _1411 = _1409 + 1.0;
    float _1413 = -_1321;
    float _1415 = _1413 + 1.0;
    float _1417 = _1403 * _1391;
    float _1419 = -_1403;
    float _1421 = _1419 + 1.0;
    float _1423 = _1321 * _1411;
    float _1425 = _1309 * _1415;
    float _1427 = -_1309;
    float _1429 = _1427 + 1.0;
    float _1431 = _1127 * _1421;
    float _1433 = float(uint(_1369));
    float _1435 = -_1127;
    float _1437 = _1435 + 1.0;
    float _1439 = _1093 * _1429;
    float _1441 = floor(_941);
    float _1443 = as_type<float>(_1387) * _1433;
    float _1445 = _1381 * _1437;
    float _1447 = -_1381;
    float _1449 = _1447 + 1.0;
    float _1451 = _1199 * _1439;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1455 = 1.0 + _1453;
    float _1457 = _1105 * _1449;
    float _1459 = trunc(_1443);
    float _1461 = precise::max(_1459, 0.0);
    uint _1464 = uint(_1461);
    float _1466 = -_1105;
    float _1468 = _1466 + 1.0;
    float _1470 = -_1093;
    float _1472 = _1470 + 1.0;
    float _1474 = _1241 * _1457;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1478 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1451);
    float _1480 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1474);
    float _1482 = 1.0 / _1455;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1486 = -_1441;
    float _1488 = _941 + _1486;
    float _1490 = fma(_1207, _1425, _1478);
    float _1492 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1484);
    float _1494 = _939 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1496 = _1488 * _1039;
    int _1498 = _1145 * int(_1464);
    int _1500 = _1498 + _1369;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1504 = -_1476;
    float _1506 = fma(_1494, 2.0, _1504);
    bool _1508 = !_913;
    int _1510 = _1508 ? 0 : 1;
    float _1512 = fma(_1255, _1445, _1480);
    float _1514 = float(uint(_1500));
    float _1516 = fma(_959, -2.0, _1502);
    int _1518 = abs(_957);
    float _1520 = _1205 * _1482;
    float _1522 = float(_1369);
    float _1524 = as_type<float>(_1387) * _1514;
    int _1526 = ~_841;
    int _1528 = _1526 + 1;
    float _1530 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1516);
    bool _1532 = _1522 >= _1039;
    bool _1534 = isnan(_1522);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan(_1039);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = trunc(_1524);
    float _1546 = precise::max(_1544, 0.0);
    uint _1548 = uint(_1546);
    float _1550 = fma(_1231, _1423, _1490);
    int _1552 = abs(_1510);
    float _1554 = fma(_1233, _1431, _1512);
    float _1556 = float(_1518);
    float _1558 = _945 + (-0.5);
    int _1560 = ~_1165;
    int _1562 = _1560 + 1;
    int _1564 = _1562 + 1;
    float _1566 = trunc(_1496);
    int _1568 = int(_1566);
    int _1570 = _1564;
    if (!_1211)
    {
        int _1572 = ~_1165;
        int _1574 = _1572 + 1;
        _1570 = _1574;
    }
    int _1576 = _1570;
    float _1578 = -_1558;
    float _1580 = -_1530;
    float _1582 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1580);
    int _1584 = abs(_1075);
    float _1586 = fma(_1253, _1417, _1554);
    float _1588 = float(_851);
    float _1590 = _937 + 0.5;
    int _1592 = abs(_891);
    float _1594 = trunc(_1542);
    int _1596 = int(_1594);
    int _1598 = int(_1464) + int(_1548);
    float _1600 = -_111;
    float _1602 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1506);
    float _1604 = float(_771);
    float _1606 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1492);
    int _1608 = _1528 * _1598;
    int _1610 = _1608 + _1369;
    float _1612 = float(_1576);
    float _1614 = _1556 * _1604;
    float _1616 = float(_1584);
    float _1618 = trunc(_1063);
    int _1620 = int(_1618);
    bool _1622 = uint(_1610) >= uint(_841);
    float _1624 = _1614 * (-2.0);
    float _1626 = _1616 * _1612;
    float _1628 = in.m_60.x;
    float _1630 = in.m_60.y;
    float _1632 = in.m_60.z;
    bool _1634 = !_1622;
    int _1636 = _1634 ? 0 : (-1);
    float _1638 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1602);
    float _1640 = -_1606;
    float _1642 = _1640 + 1.0;
    int _1644 = ~_1598;
    int _1646 = _1644 + _1636;
    int _1648 = _1646 + 1;
    float _1650 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1550);
    bool _1652 = _841 == 0;
    int _1654 = _1568 * _1592;
    int _1656 = _1654 + _1369;
    float _1658 = _1626 * (-2.0);
    int _1660 = _841 * _1648;
    int _1662 = _1660 + _1369;
    float _1664 = fma(_1161, _1624, _1161);
    int _1666 = ~_1596;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = float(_1552);
    bool _1674 = !_1652;
    int _1676 = _1674 ? _1662 : (-1);
    float _1678 = _1672 * _1588;
    float _1680 = fma(_1624, _1630, _1630);
    float _1682 = fma(_1257, _1407, _1586);
    int _1684 = _1676 * _1670;
    float _1686 = _783 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1688 = fma(_1131, _1658, _1131);
    float _1690 = fma(_1658, _1628, _1628);
    float _1692 = _981 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1696 = _1686 + _1694;
    int _1698 = _841 + (-1);
    float _1700 = _1678 * (-2.0);
    bool _1702 = !_967;
    int _1704 = _1702 ? 0 : 1;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1708 = _1692 + _1706;
    bool _1710 = !_963;
    int _1712 = _1710 ? 0 : 1;
    float _1714 = _1696 * _1696;
    int _1716 = abs(_1704);
    int _1718 = _1596 * _1698;
    int _1720 = _1718 + _1684;
    int _1722 = abs(_1712);
    float _1724 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1726 = _1067 + _1724;
    float _1728 = fma(_1708, _1708, _1714);
    bool _1730 = !_971;
    int _1732 = _1730 ? 0 : 1;
    int _1734 = _1720 * _1716;
    float _1736 = fma(_1163, _1700, _1163);
    float _1738 = fma(_1726, _1726, _1728);
    int _1740 = abs(_1732);
    int _1742 = _1620 * _1722;
    int _1744 = _1742 + _1734;
    float _1746 = sqrt(_1738);
    float _1748 = fma(_1700, _1632, _1632);
    bool _1750 = !_975;
    int _1752 = _1750 ? 0 : 1;
    float _1754 = fma(_1279, _1405, _1682);
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1758 = _157 + (-0.5);
    int _1760 = abs(_1752);
    float _1762 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1756);
    float _1764 = _681 + (-0.5);
    int _1766 = _1656 * _1740;
    int _1768 = _1766 + _1744;
    float _1770 = rsqrt(_1738);
    float _1772 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1680);
    int _1774 = _1568 * _1760;
    int _1776 = _1774 + _1768;
    float _1778 = _685 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1780 = _1746 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1782 = float(uint(_1656));
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1786 = float(uint(_1776));
    float _1788 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1690);
    float _1790 = precise::min(_1778, _1780);
    float _1792 = as_type<float>(_1387) * _1782;
    float _1794 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1784);
    float _1796 = as_type<float>(_1387) * _1786;
    float _1798 = _693 + (-0.5);
    bool _1800 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1802 = isnan(1.0);
    bool _1804 = _1800 || _1802;
    bool _1806 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1808 = _1804 || _1806;
    float _1810 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1762);
    float _1812 = trunc(_1792);
    float _1814 = precise::max(_1812, 0.0);
    uint _1816 = uint(_1814);
    float _1818 = _1770 * _1790;
    bool _1820 = !_1808;
    float _1822 = _1820 ? _111 : _1520;
    float _1824 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1748);
    int _1826 = ~_841;
    int _1828 = _1826 + 1;
    float _1830 = _1696 * _1818;
    int _1832 = ~_841;
    int _1834 = _1832 + 1;
    float _1836 = fma(_1822, _1688, _1788);
    float _1838 = trunc(_1796);
    float _1840 = precise::max(_1838, 0.0);
    uint _1842 = uint(_1840);
    float _1844 = -_1830;
    float _1846 = _1696 + _1844;
    float _1848 = fma(_1822, _1664, _1772);
    float _1850 = _1836 * 0.15915493667125701904296875;
    float _1852 = fma(_1822, _1736, _1824);
    float _1854 = _1846 * _1846;
    float _1856 = _1848 * 0.15915493667125701904296875;
    float _1858 = -_1810;
    float _1860 = _1858 + 1.0;
    int _1862 = _1828 * int(_1816);
    int _1864 = _1862 + _1656;
    float _1866 = _1708 * _1818;
    float _1868 = _1726 * _1818;
    float _1870 = _1856 * 6.283185482025146484375;
    float _1872 = sin(_1870);
    float _1874 = fma(_1263, _1337, _1754);
    float _1876 = -_1866;
    float _1878 = _1708 + _1876;
    float _1880 = float(uint(_1864));
    float _1882 = -_1868;
    float _1884 = _1726 + _1882;
    int _1886 = _1834 * int(_1842);
    int _1888 = _1886 + _1776;
    float _1890 = fma(_1878, _1878, _1854);
    float _1892 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1874);
    float _1894 = _1856 * 6.283185482025146484375;
    float _1896 = cos(_1894);
    float _1898 = as_type<float>(_1387) * _1880;
    float _1900 = float(uint(_1888));
    float _1902 = fma(_1884, _1884, _1890);
    float _1904 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1794);
    float _1906 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1293);
    float _1908 = _1852 * 0.15915493667125701904296875;
    float _1910 = -_1904;
    float _1912 = _1910 + 1.0;
    float _1914 = as_type<float>(_1387) * _1900;
    float _1916 = -_1906;
    float _1918 = _1916 + 1.0;
    float _1920 = fma(_1860, _901, _1225);
    float _1922 = -_1642;
    float _1924 = fma(_937, _1922, _1638);
    float _1926 = -_1912;
    float _1928 = fma(_1926, _879, _1193);
    float _1930 = trunc(_1914);
    float _1932 = precise::max(_1930, 0.0);
    uint _1934 = uint(_1932);
    float _1936 = fma(_945, _1918, _1582);
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1942 = sqrt(_1902);
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1948 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1956 = _1850 * 6.283185482025146484375;
    float _1958 = cos(_1956);
    int _1960 = int(_1842) + int(_1934);
    out.m_62.x = _1948;
    out.m_62.y = _1950;
    out.m_62.z = _1952;
    out.m_62.w = _1946;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1966 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1968 = _1650 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _1928;
    out.m_64.y = _1920;
    out.m_64.z = _1924;
    out.m_64.w = _1936;
    float _1970 = _1908 * 6.283185482025146484375;
    float _1972 = cos(_1970);
    float _1974 = _1770 * _1942;
    float _1976 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1978 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _699 * _1974;
    float _1982 = _685 * _1974;
    float _1984 = _1850 * 6.283185482025146484375;
    float _1986 = sin(_1984);
    int _1988 = ~_841;
    int _1990 = _1988 + 1;
    float _1992 = _1958 * _1896;
    float _1994 = _1958 * _1872;
    out.m_66.x = _1976;
    out.m_66.y = _1978;
    out.m_66.z = _1966;
    out.m_66.w = _1968;
    float _1996 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    int _1998 = _1990 * _1960;
    int _2000 = _1998 + _1776;
    float _2002 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2004 = _2002 * 0.5;
    float _2006 = _1908 * 6.283185482025146484375;
    float _2008 = sin(_2006);
    float _2010 = _1958 * _1972;
    float _2012 = _1980 * _1996;
    bool _2014 = uint(_2000) >= uint(_841);
    float _2016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2018 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2020 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2022 = trunc(_1898);
    float _2024 = precise::max(_2022, 0.0);
    uint _2026 = uint(_2024);
    float _2028 = _1986 * _1872;
    float _2030 = _1986 * _1896;
    float _2032 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2034 = _1986 * _1972;
    float _2036 = _1982 * _2016;
    float _2038 = _1896 * _1972;
    float _2040 = _1872 * _1972;
    float _2042 = fma(_2008, _1992, _2028);
    float _2044 = fma(_2008, _2028, _1992);
    float _2046 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2048 = -_2008;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2018);
    float _2052 = -_1994;
    float _2054 = fma(_2008, _2030, _2052);
    float _2056 = _2010 * _2012;
    float _2058 = -_2030;
    float _2060 = fma(_2008, _1994, _2058);
    float _2062 = -_2008;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2032);
    float _2066 = -_2008;
    float _2068 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2046);
    float _2070 = -_2012;
    float _2072 = _2008 * _2070;
    float _2074 = _2034 * _2012;
    float _2076 = fma(_2042, _2036, _2056);
    int _2078 = int(_1816) + int(_2026);
    float _2080 = fma(_2038, _2036, _2072);
    bool _2082 = !_2014;
    int _2084 = _2082 ? 0 : (-1);
    float _2086 = fma(_2054, _2036, _2074);
    float _2088 = fma(_2060, _2004, _2076);
    float _2090 = fma(_2040, _2004, _2080);
    int _2092 = ~_1960;
    int _2094 = _2092 + _2084;
    int _2096 = _2094 + 1;
    float _2098 = fma(_2044, _2004, _2086);
    float _2100 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2102 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2104 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2050);
    int _2106 = _841 * _2096;
    int _2108 = _2106 + _1776;
    float _2110 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2100);
    float _2112 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2102);
    float _2114 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2064);
    float _2116 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2068);
    float _2118 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2110);
    bool _2120 = !_1652;
    int _2122 = _2120 ? _2108 : (-1);
    float _2124 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2112);
    float _2126 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2128 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2130 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2132 = _2124 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2134 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2136 = _1067 + _2128;
    float _2138 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2126);
    float _2140 = _1692 + _2132;
    float _2142 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2130);
    float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2146 = _2136 + _2144;
    int _2148 = ~_841;
    int _2150 = _2148 + 1;
    float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2154 = _2140 + _2152;
    float _2156 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2134);
    float _2158 = _2146 * _2146;
    float _2160 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2162 = _2122 >> 31;
    float _2164 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2166 = fma(_2154, _2154, _2158);
    int _2168 = _2150 * _2078;
    int _2170 = _2168 + _1656;
    float _2172 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2160);
    int _2174 = _2162 & 3;
    float _2176 = sqrt(_2166);
    float _2178 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2164);
    int _2180 = _2122 & 3;
    bool _2182 = _2180 != 0;
    float _2184 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2186 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2188 = uint(_2170) >= uint(_841);
    float _2190 = _2020 * _2104;
    int _2192 = _2122 + _2174;
    float _2194 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2184);
    bool _2196 = uint(_2180) > 1u;
    float _2198 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2186);
    int _2200 = _2192 >> 2;
    float _2202 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2178);
    bool _2204 = !_2188;
    int _2206 = _2204 ? 0 : (-1);
    float _2208 = _2020 * _2114;
    int _2210 = _2122 & 3;
    bool _2212 = _2210 != 0;
    float _2214 = _2020 * _2116;
    int _2216 = _2200 << 4;
    int _2218 = _2216 + 512;
    float _2220 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2138);
    bool _2222 = _2176 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2224 = _2202 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2226 = ~_2078;
    int _2228 = _2226 + _2206;
    int _2230 = _2228 + 1;
    uint _2232 = uint(int(uint(_2218) >> uint(2)));
    uint _2234 = uint(int(uint(int(_2232)) >> uint(2)));
    int _2236 = int(_2232) & 3;
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[int(_2234)][_2236];
    int _2240 = int(_2232) + 1;
    uint _2242 = uint(int(uint(_2240) >> uint(2)));
    int _2244 = _2240 & 3;
    float _2246 = (*spvDescriptorSet0.vp_c9)._m0[int(_2242)][_2244];
    int _2248 = _2212 ? 0 : 1;
    float _2250 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2142);
    float _2252 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2156);
    bool _2254 = uint(_2180) >= 2u;
    int _2256 = _841 * _2230;
    int _2258 = _2256 + _1656;
    bool _2260 = !_2182;
    float _2262 = _2260 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2264 = _1686 + _2224;
    int _2266 = _2218 + 8;
    uint _2268 = uint(int(uint(_2266) >> uint(2)));
    uint _2270 = uint(int(uint(int(_2268)) >> uint(2)));
    int _2272 = int(_2268) & 3;
    float _2274 = (*spvDescriptorSet0.vp_c9)._m0[int(_2270)][_2272];
    int _2276 = int(_2268) + 1;
    uint _2278 = uint(int(uint(_2276) >> uint(2)));
    int _2280 = _2276 & 3;
    float _2282 = (*spvDescriptorSet0.vp_c9)._m0[int(_2278)][_2280];
    int _2284 = _2254 ? 0 : 1;
    float _2286 = _2262;
    float _2288 = _1982;
    if (!_2222)
    {
        _845 = _2140;
    }
    float _2290 = _845;
    bool _2292 = _2180 != 3;
    int _2294 = ~_2284;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    int _2300 = ~_2248;
    int _2302 = _2300 + 1;
    int _2304 = _2302 + 1;
    int _2306 = _2304;
    float _2308 = _2290;
    int _2310 = _2298;
    if (!_2196)
    {
        int _2312 = ~_2248;
        int _2314 = _2312 + 1;
        _2306 = _2314;
    }
    int _2316 = _2306;
    int _2318 = abs(as_type<int>(_2262));
    int _2320 = abs(_2316);
    float _2322 = as_type<float>(_2320);
    if (!_2222)
    {
        _2286 = _2136;
    }
    float _2324 = _2286;
    int _2326 = ~_2320;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    float _2332 = _2324;
    if (!_2222)
    {
        _2322 = _2264;
    }
    float _2334 = _2322;
    bool _2336 = !_2222;
    float _2338 = _2334;
    if (!_2336)
    {
        float _2340 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2344 = _2176 + _2342;
        float _2346 = _2264 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2348 = rsqrt(_2166);
        float _2350 = _2344 * _2340;
        float _2352 = _2350 * 0.15915493667125701904296875;
        float _2354 = _2352 * 6.283185482025146484375;
        float _2356 = cos(_2354);
        float _2358 = _2352 * 6.283185482025146484375;
        float _2360 = sin(_2358);
        float _2362 = _2356 + (-1.0);
        float _2364 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2366 = fma(_2360, _2346, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2368 = fma(_2264, _2356, _2364);
        float _2370 = _2348 * _2366;
        float _2372 = fma(_2154, _2370, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2374 = fma(_2146, _2370, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2308 = _2372;
        _2338 = _2368;
        _2332 = _2374;
    }
    float _2376 = _2308;
    float _2378 = _2338;
    float _2380 = _2332;
    float _2382 = _2380;
    if (_2292)
    {
        int _2384 = ~_2284;
        int _2386 = _2384 + 1;
        _2310 = _2386;
    }
    int _2388 = _2310;
    int _2390 = _2330 * as_type<int>(_2246);
    int _2392 = ~_2318;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    float _2398 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2400 = _2180 != 3;
    out.m_68.w = _1790;
    int _2402 = abs(_2388);
    int _2404 = _2396 * as_type<int>(_2238);
    int _2406 = _2404 + _2390;
    bool _2408 = !_2400;
    int _2410 = _2408 ? 0 : (-1);
    float _2412 = -_1692;
    float _2414 = _2412 + _2376;
    bool _2416 = !_979;
    int _2418 = _2416 ? 0 : 1;
    float _2420 = fma(_2398, _2220, _2190);
    float _2422 = fma(_2398, _2250, _2208);
    int _2424 = abs(_2410);
    float _2426 = -_1686;
    float _2428 = _2426 + _2378;
    int _2430 = abs(_2418);
    float _2432 = fma(_2398, _2252, _2214);
    int _2434 = ~_2402;
    int _2436 = _2434 + 1;
    int _2438 = _2436 + 1;
    float _2440 = _2428 * _2428;
    int _2442 = ~_2424;
    int _2444 = _2442 + 1;
    int _2446 = _2444 + 1;
    float _2448 = -_1067;
    float _2450 = _2448 + _2380;
    int _2452 = ~_2430;
    int _2454 = _2452 + 1;
    int _2456 = _2454 + 1;
    int _2458 = _2438 * as_type<int>(_2274);
    int _2460 = _2458 + _2406;
    float _2462 = fma(_2414, _2414, _2440);
    bool _2464 = !_1652;
    int _2466 = _2464 ? _2258 : (-1);
    float _2468 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2198);
    int _2470 = _2446 * as_type<int>(_2282);
    int _2472 = _2470 + _2460;
    float _2474 = fma(_2450, _2450, _2462);
    float _2476 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    float _2478 = _2468 + _2432;
    int _2480 = _2472 * _2456;
    float _2482 = sqrt(_2474);
    float _2484 = _2476 + _2422;
    out.m_70.x = _1892;
    int _2486 = _2466 * _2430;
    int _2488 = _2486 + _2480;
    float _2490 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2194);
    float _2492 = -_1866;
    float _2494 = _2492 + _2376;
    out.m_72.x = _1982;
    float _2496 = _2490 + _2420;
    float _2498 = float(_2488);
    float _2500 = -_1868;
    float _2502 = _2500 + _2380;
    float _2504 = -_1866;
    float _2506 = _1692 + _2504;
    float _2508 = -_1830;
    float _2510 = _2508 + _2378;
    out.m_74.x = _2496;
    out.m_74.y = _2484;
    out.m_74.z = _2478;
    float _2512 = -_1830;
    float _2514 = _1686 + _2512;
    bool _2516 = _2482 > 0.0;
    out.m_76.y = _2498;
    float _2518 = -_1868;
    float _2520 = _1067 + _2518;
    float _2522 = _2432;
    float _2524 = _2498;
    float _2526 = _2510;
    float _2528 = _2502;
    float _2530 = _2498;
    float _2532 = _2398;
    float _2534 = _2514;
    float _2536 = _2506;
    if (!_2516)
    {
        _2382 = _2494;
    }
    float _2538 = _2382;
    bool _2540 = !_2516;
    float _2542 = _2538;
    if (!_2540)
    {
        bool _2544 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2546 = _2538;
        if (_2544)
        {
            float _2548 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2546 = _2548;
        }
        float _2550 = _2546;
        float _2552 = _2550;
        if (_2544)
        {
            float _2554 = _537 * _2550;
            _2522 = _2554;
        }
        float _2556 = _2522;
        float _2558 = _2556;
        if (_2544)
        {
            float _2560 = _539 * _2550;
            _2288 = _2560;
        }
        float _2562 = _2288;
        float _2564 = _2562;
        if (_2544)
        {
            float _2566 = _541 * _2550;
            _2524 = _2566;
        }
        float _2568 = _2524;
        float _2570 = _2568;
        if (!_2544)
        {
            bool _2572 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2574 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2576 = _2572 || _2574;
            bool _2578 = isnan(1.0);
            bool _2580 = _2576 || _2578;
            float _2582 = _111 + 1.0;
            if (!_2580)
            {
                float _2584 = _2582 * _2582;
                float _2586 = _2584 * 0.5;
                _121 = _2586;
            }
            float _2588 = _121;
            float _2590 = _2588;
            if (!_2580)
            {
                float _2592 = _2588 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2590 = _2592;
            }
            float _2594 = _2590;
            bool _2596 = !_2580;
            float _2598 = _2594;
            if (!_2596)
            {
                float _2600 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2602 = log2(_2600);
                float _2604 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2606 = 1.0 + _2604;
                float _2608 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2610 = _2602 * _2582;
                float _2612 = 1.0 / _2606;
                float _2614 = _2608 * 0.693147182464599609375;
                float _2616 = exp2(_2610);
                float _2618 = 1.0 / _2614;
                float _2620 = _2616 + (-1.0);
                float _2622 = -_2620;
                float _2624 = fma(_2622, _2618, _2582);
                float _2626 = _2624 * _2612;
                float _2628 = _2626 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2598 = _2628;
            }
            float _2630 = _2598;
            float _2632 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2634 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2636 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2638 = _2632 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2640 = _2632 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2642 = _2632 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2644 = fma(_2634, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2638);
            float _2646 = fma(_2634, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2640);
            float _2648 = _2640;
            if (!_2580)
            {
                _2648 = _2582;
            }
            float _2650 = _2648;
            float _2652 = fma(_2636, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2644);
            bool _2654 = !_2580;
            float _2656 = _2650;
            if (!_2654)
            {
                float _2658 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2660 = log2(_2658);
                float _2662 = _2660 * _2582;
                float _2664 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2666 = 1.0 + _2664;
                float _2668 = exp2(_2662);
                float _2670 = 1.0 / _2666;
                float _2672 = -_2668;
                float _2674 = _2672 + 1.0;
                float _2676 = _2674 * _2670;
                _2656 = _2676;
            }
            float _2678 = _2656;
            float _2680 = fma(_2634, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2642);
            float _2682 = fma(_2636, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2646);
            float _2684 = fma(_2678, _183, _2652);
            float _2686 = fma(_2636, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2680);
            float _2688 = fma(_2678, _181, _2682);
            float _2690 = -_481;
            float _2692 = _2690 + _2684;
            float _2694 = fma(_2678, _185, _2686);
            float _2696 = -_497;
            float _2698 = _2696 + _2688;
            float _2700 = _2692 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2702 = _2692 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2704 = _2692 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2706 = -_505;
            float _2708 = _2706 + _2694;
            float _2710 = fma(_2698, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2700);
            float _2712 = fma(_2698, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2702);
            float _2714 = fma(_2698, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2704);
            float _2716 = fma(_2708, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2710);
            float _2718 = fma(_2708, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2712);
            float _2720 = fma(_2708, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2714);
            _549 = _2718;
            _551 = _2716;
            _553 = _2720;
            _2558 = _2716;
            _2564 = _2718;
            _2570 = _2720;
            _2552 = _2680;
        }
        float _2722 = _549;
        float _2724 = _551;
        float _2726 = _553;
        float _2728 = _2558;
        float _2730 = _2564;
        float _2732 = _2570;
        float _2734 = _2552;
        float _2736 = _2722 * _2722;
        float _2738 = rsqrt(_2474);
        float _2740 = fma(_2724, _2724, _2736);
        float _2742 = fma(_2726, _2726, _2740);
        float _2744 = sqrt(_2742);
        float _2746 = _2414 * _2738;
        float _2748 = _2428 * _2738;
        float _2750 = _2450 * _2738;
        bool _2752 = _2744 > 0.0;
        float _2754 = _2734;
        _2530 = _2732;
        _2532 = _2742;
        _555 = _2722;
        if (!_2752)
        {
            _2754 = _2494;
        }
        float _2756 = _2754;
        bool _2758 = !_2752;
        _2542 = _2756;
        if (!_2758)
        {
            float _2760 = rsqrt(_2742);
            float _2762 = _2760 * _2722;
            float _2764 = _2760 * _2724;
            float _2766 = _2760 * _2726;
            float _2768 = _2748 * _2762;
            float _2770 = fma(_2746, _2764, _2768);
            float _2772 = fma(_2750, _2766, _2770);
            float _2774 = _2772 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2776 = fma(_2728, _2774, _2494);
            float _2778 = fma(_2730, _2774, _2510);
            float _2780 = fma(_2732, _2774, _2502);
            _2526 = _2778;
            _2542 = _2776;
            _2528 = _2780;
        }
    }
    float _2782 = _2526;
    float _2784 = _2542;
    float _2786 = _2528;
    float _2788 = _2530;
    float _2790 = _2532;
    float _2792 = _555;
    float _2794 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2796 = _2782 + _2794;
    float _2798 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2800 = _2784 + _2798;
    float _2802 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2804 = _2786 + _2802;
    float _2806 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2808 = _2796 * _2796;
    float _2810 = fma(_2800, _2800, _2808);
    float _2812 = fma(_2804, _2804, _2810);
    float _2814 = rsqrt(_2812);
    float _2816 = sqrt(_2812);
    float _2818 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2820 = _2800 * _2818;
    float _2822 = _2804 * _2818;
    float _2824 = _2820 * _2820;
    float _2826 = _2822 * _2822;
    float _2828 = _2824 + _2826;
    float _2830 = sqrt(_2828);
    bool _2832 = _2830 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2834 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2836 = _2830 + _2834;
    float _2838 = _2788;
    float _2840 = _2828;
    float _2842 = _2836;
    float _2844 = _2790;
    float _2846 = _2796;
    float _2848 = _2792;
    float _2850 = _2820;
    if (_2832)
    {
        float _2852 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2838 = _2852;
    }
    float _2854 = _2838;
    if (_2832)
    {
        float _2856 = rsqrt(_2828);
        _2840 = _2856;
    }
    float _2858 = _2840;
    if (_2832)
    {
        float _2860 = _2836 * _2854;
        _2842 = _2860;
    }
    float _2862 = _2842;
    if (_2832)
    {
        float _2864 = _2862 * 0.15915493667125701904296875;
        _2844 = _2864;
    }
    float _2866 = _2844;
    float _2868 = _2804;
    if (_2832)
    {
        float _2870 = _2866 * 6.283185482025146484375;
        float _2872 = sin(_2870);
        _2868 = _2872;
    }
    float _2874 = _2868;
    float _2876 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2878 = precise::max(0.0, _2876);
    float _2880 = _2854;
    float _2882 = _2878;
    if (_2832)
    {
        float _2884 = _2866 * 6.283185482025146484375;
        float _2886 = cos(_2884);
        _2880 = _2886;
    }
    float _2888 = _2880;
    float _2890 = -_2818;
    float _2892 = -_2878;
    float _2894 = fma(_2796, _2890, _2892);
    if (_2832)
    {
        float _2896 = _2894 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2846 = _2896;
    }
    float _2898 = _2846;
    float _2900 = _2782 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2902 = _2874;
    float _2904 = _2898;
    if (_2832)
    {
        float _2906 = fma(_2874, _2898, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2902 = _2906;
    }
    float _2908 = _2902;
    float _2910 = _2908;
    if (!_2832)
    {
        _2904 = _2894;
    }
    float _2912 = _2904;
    float _2914 = fma(_2784, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2900);
    float _2916 = _2912;
    float _2918 = _2888;
    if (_2832)
    {
        float _2920 = _2888 + (-1.0);
        _2882 = _2920;
    }
    float _2922 = _2882;
    float _2924 = _2922;
    if (_2832)
    {
        float _2926 = _2858 * _2908;
        _2848 = _2926;
    }
    float _2928 = _2848;
    if (!_2832)
    {
        _2910 = _2824;
    }
    float _2930 = _2910;
    float _2932 = _2782 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2934 = _2930;
    if (_2832)
    {
        float _2936 = _2922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _557 = _2936;
    }
    float _2938 = _557;
    if (_2832)
    {
        float _2940 = _2820 * _2928;
        _2850 = _2940;
    }
    float _2942 = _2850;
    if (!_2832)
    {
        _2924 = _2822;
    }
    float _2944 = _2924;
    float _2946 = _2944;
    if (_2832)
    {
        float _2948 = _2822 * _2928;
        _2946 = _2948;
    }
    float _2950 = _2946;
    if (_2832)
    {
        float _2952 = fma(_2894, _2888, _2938);
        _2916 = _2952;
    }
    float _2954 = _2916;
    if (_2832)
    {
        float _2956 = _2942 * _2942;
        _2934 = _2956;
    }
    float _2958 = _2934;
    if (!_2832)
    {
        _2918 = _2826;
    }
    float _2960 = _2918;
    float _2962 = _2960;
    if (_2832)
    {
        float _2964 = _2950 * _2950;
        _2962 = _2964;
    }
    float _2966 = _2962;
    float _2968 = fma(_2784, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2932);
    float _2970 = fma(_2954, _2954, _2958);
    float _2972 = _2782 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2974 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2968);
    float _2976 = _2970 + _2966;
    float _2978 = _2782 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2980 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2914);
    float _2982 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2984 = fma(_2816, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2982);
    float _2986 = precise::clamp(_2984, 0.0, 1.0);
    float _2988 = _2974 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2990 = fma(_2784, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2978);
    float _2992 = rsqrt(_2976);
    float _2994 = -_2986;
    float _2996 = _2994 + 1.0;
    float _2998 = fma(_2784, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2972);
    float _3000 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2990);
    float _3002 = _2988 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3004 = _2980 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3006 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2998);
    float _3008 = _3000 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3010 = abs(_2996);
    float _3012 = log2(_3010);
    float _3014 = _3006 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3016 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3002);
    float _3018 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3020 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3016);
    float _3022 = _2992 * _2942;
    float _3024 = _2992 * _2954;
    float _3026 = _2992 * _2950;
    float _3028 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3020);
    float _3030 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3032 = -_3018;
    float _3034 = fma(_3032, _2806, 1.0);
    float _3036 = _3024 + 1.0;
    float _3038 = 1.0 / _3028;
    float _3040 = -_3030;
    float _3042 = fma(_3024, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3040);
    float _3044 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3046 = _2988 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3048 = -_3026;
    float _3050 = fma(_3048, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3042);
    float _3052 = _2988 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3054 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3046);
    float _3056 = exp2(_3044);
    float _3058 = fma(_3050, -0.5, 0.5);
    float _3060 = fma(_3050, 0.5, 0.5);
    float _3062 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3052);
    float _3064 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3054);
    float _3066 = fma(_3060, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3068 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3062);
    float _3070 = log2(_3034);
    float _3072 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3064);
    float _3074 = fma(_3060, _3066, -0.212114393711090087890625);
    float _3076 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3068);
    float _3078 = fma(_3060, _3074, 1.570728778839111328125);
    float _3080 = _3076 * _3038;
    float _3082 = sqrt(_3058);
    float _3084 = -_3024;
    float _3086 = fma(_3056, _3036, _3084);
    float _3088 = _3072 * _3038;
    float _3090 = fma(_3080, 0.5, 0.5);
    float _3092 = fma(_3086, 0.5, 0.5);
    float _3094 = fma(_3088, -0.5, 0.5);
    float _3096 = _3070 * 0.693147182464599609375;
    float _3098 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3100 = _3082 * 0.636619746685028076171875;
    float _3102 = -_3078;
    float _3104 = fma(_3100, _3102, 1.0);
    float3 _8435 = float3(_3090, _3094, _3098);
    float _3106 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8435, float3(0.0), isnan(_8435)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8435, float3(0.0), isnan(_8435)), level(0.0)).x;
    float3 _8446 = float3(_3090, _3094, _3098);
    float4 _3109 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8446, float3(0.0), isnan(_8446)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8446, float3(0.0), isnan(_8446)), level(0.0)).xyzw;
    float _3111 = _3109.x;
    float _3113 = _3109.y;
    float _3115 = _3109.z;
    float _3117 = _3109.w;
    float2 _8463 = float2(_3104, _3092);
    float3 _3121 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8463, float2(0.0), isnan(_8463)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8463, float2(0.0), isnan(_8463)), level(0.0)).xyz;
    float _3123 = _3121.x;
    float _3125 = _3121.y;
    float _3127 = _3121.z;
    float _3129 = _2514 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3131 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_78.x = _2506;
    out.m_78.y = _2514;
    out.m_78.z = _2520;
    bool _3133 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3135 = isnan(0.5);
    bool _3137 = _3133 || _3135;
    bool _3139 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3141 = _3137 || _3139;
    float _3143 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3129);
    float _3145 = exp2(_3131);
    float _3147 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3143);
    float _3149 = _2514 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3151 = _3147 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3153 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3149);
    float _3155 = _2988 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3157 = 1.0 / _3151;
    float _3159 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3153);
    float _3161 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3155);
    float _3163 = _3076 + _3028;
    float _3165 = _3159 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3167 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3161);
    float _3169 = _3163 * 0.5;
    float _3171 = _3165 + _3151;
    float _3173 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3167);
    float _3175 = -_3145;
    float _3177 = _3175 + 1.0;
    float _3179 = _3145;
    float _3181 = _3173;
    float _3183 = _3028;
    if (_3141)
    {
        _3179 = 1.0;
    }
    float _3185 = _3179;
    float _3187 = _3173 + _3028;
    out.gl_Position.x = _3076;
    out.gl_Position.y = _3072;
    out.gl_Position.z = _3173;
    out.gl_Position.w = _3028;
    float _3189 = _3171 * _3157;
    float _3191 = _3189 * 0.5;
    float _3193 = _3028 * 0.5;
    float _3195 = _3187 * 0.5;
    float _3197 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3199 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3197);
    float _3201 = fma(_3072, -0.5, _3193);
    float _3203 = _3177 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3205 = _3193;
    float _3207 = _3185;
    if (_3141)
    {
        _3205 = 1.0;
    }
    float _3209 = _3205;
    out.m_80.x = _3169;
    out.m_80.y = _3201;
    out.m_80.z = _3195;
    out.m_80.w = _3028;
    float _3211 = 1.0 / _3199;
    float _3213 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3215 = _3211 * _3213;
    float _3217 = _3209;
    if (!_3141)
    {
        float _3219 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3221 = _3219 * 0.15915493667125701904296875;
        float _3223 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3225 = _3221 * 6.283185482025146484375;
        float _3227 = cos(_3225);
        float _3229 = _3223 * 0.15915493667125701904296875;
        float _3231 = _3221 * 6.283185482025146484375;
        float _3233 = sin(_3231);
        float _3235 = 1.0 / _3227;
        float _3237 = _3229 * 6.283185482025146484375;
        float _3239 = cos(_3237);
        float _3241 = _3233 * _3235;
        float _3243 = _3229 * 6.283185482025146484375;
        float _3245 = sin(_3243);
        float _3247 = _3239 * _3241;
        float _3249 = 1.0 / _3247;
        float _3251 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3253 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3251;
        float _3255 = 1.0 / _3253;
        float _3257 = _3245 * _3249;
        float _3259 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3261 = fma(_3215, _3257, _3259);
        float _3263 = _3261 * _3255;
        float _3265 = precise::clamp(_3263, 0.0, 1.0);
        _2534 = _3255;
        _3217 = _3265;
        _2536 = _3229;
        _3181 = _3253;
        _3183 = _3235;
    }
    float _3267 = _2534;
    float _3269 = _3217;
    float _3271 = _2536;
    float _3273 = _3181;
    float _3275 = _3183;
    float _3277 = _3271;
    float _3279 = _3267;
    float _3281 = _3273;
    float _3283 = _3275;
    if (!_3141)
    {
        float _3285 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3287 = _3285 * 0.15915493667125701904296875;
        float _3289 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3291 = _3287 * 6.283185482025146484375;
        float _3293 = cos(_3291);
        float _3295 = _3289 * 0.15915493667125701904296875;
        float _3297 = _3287 * 6.283185482025146484375;
        float _3299 = sin(_3297);
        float _3301 = 1.0 / _3293;
        float _3303 = _3295 * 6.283185482025146484375;
        float _3305 = cos(_3303);
        float _3307 = _3299 * _3301;
        float _3309 = _3295 * 6.283185482025146484375;
        float _3311 = sin(_3309);
        float _3313 = _3305 * _3307;
        float _3315 = 1.0 / _3313;
        float _3317 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3319 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3317;
        float _3321 = 1.0 / _3319;
        float _3323 = _3311 * _3315;
        float _3325 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3327 = fma(_3215, _3323, _3325);
        float _3329 = _3327 * _3321;
        float _3331 = precise::clamp(_3329, 0.0, 1.0);
        float _3333 = -_3331;
        float _3335 = _3333 + 1.0;
        _3207 = _3335;
        _3277 = _3313;
        _3279 = _3301;
        _3281 = _3295;
        _3283 = _3287;
    }
    float _3337 = _3207;
    float _3339 = _3277;
    float _3341 = _3279;
    float _3343 = _3281;
    float _3345 = _3283;
    float _3347 = _3203 * _3106;
    float _3349 = -_3203;
    float _3351 = _3349 + 1.0;
    out.m_82.x = _2784;
    out.m_82.y = _2782;
    out.m_82.z = _2786;
    bool _3353 = _2816 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3355 = isnan(_2816);
    bool _3357 = _3353 || _3355;
    bool _3359 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3361 = _3357 || _3359;
    float _3363 = _3117 * _3347;
    float _3365 = _3127 * _3347;
    float _3367 = _3117 * _3351;
    float _3369 = _3269 * _3337;
    float _3371 = fma(_3123, _3363, _3111);
    float _3373 = fma(_3125, _3363, _3113);
    float _3375 = fma(_3117, _3365, _3115);
    float _3377 = _3369 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_84.x = _3371;
    out.m_84.y = _3373;
    out.m_84.z = _3375;
    out.m_84.w = _3367;
    float _3379 = _545 * _3377;
    float _3381 = _3341;
    float _3383 = _3339;
    float _3385 = _3345;
    float _3387 = _3343;
    float _3389 = _3377;
    float _3391 = _3369;
    if (!_3361)
    {
        _3381 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3393 = _3381;
    float _3395 = _3393;
    float _3397 = _3393;
    if (!_3361)
    {
        _3383 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3399 = _3383;
    float _3401 = _3399;
    float _3403 = _3399;
    if (!_3361)
    {
        _3385 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3405 = _3385;
    float _3407 = _3405;
    float _3409 = _3405;
    if (!_3361)
    {
        _3387 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3411 = _3387;
    float _3413 = _3411;
    float _3415 = _3411;
    if (!_3361)
    {
        _3389 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3417 = _3389;
    float _3419 = _3417;
    float _3421 = _3417;
    if (!_3361)
    {
        _3391 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3423 = _3391;
    bool _3425 = !_3361;
    float _3427 = _3423;
    float _3429 = _3423;
    if (!_3425)
    {
        bool _3431 = _2816 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3433 = isnan(_2816);
        bool _3435 = _3431 || _3433;
        bool _3437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3439 = _3435 || _3437;
        if (!_3439)
        {
            float _3441 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3443 = _2816 + _3441;
            float _3445 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3447 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3445;
            float _3449 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3451 = _3449 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3453 = 1.0 / _3447;
            float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3457 = _3455 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3463 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3467 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3471 = _3443 * _3453;
            float _3473 = precise::clamp(_3471, 0.0, 1.0);
            float _3475 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3477 = _3475 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3479 = fma(_3473, _3451, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3481 = fma(_3473, _3477, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3483 = fma(_3473, _3457, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3485 = fma(_3473, _3461, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3487 = fma(_3473, _3465, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3489 = fma(_3473, _3469, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3403 = _3483;
            _3421 = _3487;
            _3397 = _3479;
            _3415 = _3485;
            _3409 = _3481;
            _3429 = _3489;
            _3491 = true;
        }
        else
        {
            bool _3493 = _2816 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3495 = isnan(_2816);
            bool _3497 = _3493 || _3495;
            bool _3499 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3501 = _3497 || _3499;
            if (!_3501)
            {
                _3395 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3503 = _3395;
            _3397 = _3503;
            if (!_3501)
            {
                _3401 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3505 = _3401;
            _3403 = _3505;
            if (!_3501)
            {
                _3407 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3507 = _3407;
            _3409 = _3507;
            if (!_3501)
            {
                _3413 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3509 = _3413;
            _3415 = _3509;
            if (!_3501)
            {
                _3419 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3511 = _3419;
            _3421 = _3511;
            if (!_3501)
            {
                _3427 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3513 = _3427;
            bool _3515 = !_3501;
            _3429 = _3513;
            if (!_3515)
            {
                bool _3517 = _2816 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3519 = isnan(_2816);
                bool _3521 = _3517 || _3519;
                bool _3523 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3525 = _3521 || _3523;
                if (!_3525)
                {
                    float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3529 = _2816 + _3527;
                    float _3531 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3533 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3531;
                    float _3535 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3537 = _3535 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3539 = 1.0 / _3533;
                    float _3541 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3543 = _3541 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3545 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3547 = _3545 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3549 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3551 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3555 = _3553 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3557 = _3529 * _3539;
                    float _3559 = precise::clamp(_3557, 0.0, 1.0);
                    float _3561 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3563 = _3561 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3565 = fma(_3559, _3537, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3567 = fma(_3559, _3563, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3569 = fma(_3559, _3543, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3571 = fma(_3559, _3547, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3573 = fma(_3559, _3551, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3575 = fma(_3559, _3555, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3403 = _3569;
                    _3421 = _3573;
                    _3397 = _3565;
                    _3415 = _3571;
                    _3409 = _3567;
                    _3429 = _3575;
                    _3491 = true;
                }
                else
                {
                    _3403 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3421 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3397 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3415 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3409 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3429 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3491 = false;
    float _3577 = _3403;
    float _3579 = _3421;
    float _3581 = _3397;
    float _3583 = _3415;
    float _3585 = _3409;
    float _3587 = _3429;
    float _3589 = fma(_2484, -0.5, 0.5);
    float _3591 = precise::clamp(_3589, 0.0, 1.0);
    float _3593 = -_3577;
    float _3595 = _3593 + _3579;
    float _3597 = -_3581;
    float _3599 = _3597 + _3583;
    out.m_86.x = 0.0;
    float _3601 = fma(_3591, _3595, _3577);
    float _3603 = -_3585;
    float _3605 = _3603 + _3587;
    float _3607 = fma(_3591, _3599, _3581);
    float _3609 = _3601 * 0.586610972881317138671875;
    bool _3611 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3613 = fma(_3591, _3605, _3585);
    float _3615 = _3379 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3617 = fma(_3607, 0.298911988735198974609375, _3609);
    bool _3619 = _3269 > 0.0;
    bool _3621 = isnan(_3269);
    bool _3623 = _3619 || _3621;
    bool _3625 = isnan(0.0);
    bool _3627 = _3623 || _3625;
    float _3629 = fma(_3613, 0.114477999508380889892578125, _3617);
    out.m_51.x = _3615;
    bool _3631 = _3337 <= 0.0;
    bool _3633 = !_3627;
    bool _3635 = _3631 || _3633;
    float _3637 = -_3629;
    float _3639 = _3607 + _3637;
    float _3641 = -_3629;
    float _3643 = _3601 + _3641;
    float _3645 = -_3629;
    float _3647 = _3613 + _3645;
    float _3649 = fma(_3639, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3629);
    float _3651 = fma(_3643, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3629);
    float _3653 = fma(_3647, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3629);
    bool _3655 = !_3611;
    if (!_3655)
    {
        float _3657 = -_2782;
        float _3659 = _3657 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3661 = -_2784;
        float _3663 = _3661 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3665 = -_2786;
        float _3667 = _3665 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3669 = _3659 * _3659;
        float _3671 = fma(_3663, _3663, _3669);
        float _3673 = fma(_3667, _3667, _3671);
        float _3675 = sqrt(_3673);
        float _3677 = rsqrt(_3673);
        float _3679 = -_3675;
        float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3683 = _3681 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3685 = precise::clamp(_3683, 0.0, 1.0);
        float _3687 = _3663 * _3677;
        float _3689 = _3659 * _3677;
        float _3691 = abs(_3685);
        float _3693 = log2(_3691);
        float _3695 = _3667 * _3677;
        float _3697 = _3687 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3699 = _2484 * _3689;
        float _3701 = -_3689;
        float _3703 = -_3697;
        float _3705 = fma(_3701, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3703);
        float _3707 = fma(_2496, _3687, _3699);
        float _3709 = -_3695;
        float _3711 = fma(_3709, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3705);
        float _3713 = fma(_2478, _3695, _3707);
        float _3715 = precise::clamp(_3713, 0.0, 1.0);
        float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3719 = _3711 + _3717;
        float _3721 = _3693 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3723 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3725 = precise::clamp(_3723, 0.0, 1.0);
        float _3727 = exp2(_3721);
        float _3729 = _3727 * _3725;
        float _3731 = _3715 * _3729;
        float _3733 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3735 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3737 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3733;
        out.m_86.y = _3735;
        out.m_86.z = _3737;
    }
    out.m_68.x = _3649;
    out.m_68.y = _3651;
    out.m_68.z = _3653;
    if (!_3635)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3739 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3739;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3491 = false;
    bool _677 = false;
    bool _575 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = in.m_46.w;
    float _104 = trunc(_100);
    int _107 = int(_104);
    float _109 = -_102;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = _102;
    float _121 = _111;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _117;
    if (!_115)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_115)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3807 = as_type<float>(_129);
        out.gl_Position.z = _3807;
    }
    if (!_115)
    {
        return out;
    }
    bool _133 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_102);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = float(_107);
    bool _145 = _111 >= _143;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    if (_149)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _119;
    if (_149)
    {
        out.m_51.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _131 = as_type<int>(_153);
    }
    int _155 = _131;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3862 = as_type<float>(_155);
        out.gl_Position.z = _3862;
    }
    if (_149)
    {
        return out;
    }
    float _157 = in.m_53.x;
    float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _161 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = _161 * _159;
    float _179 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    float _181 = in.m_46.x;
    float _183 = in.m_46.y;
    float _185 = in.m_46.z;
    float _187 = floor(_179);
    float _189 = _179 * 6.283185482025146484375;
    int _191 = as_type<int>(_163) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_163) & 2;
    bool _197 = _195 != 0;
    float _199 = _189 * 0.15915493667125701904296875;
    int _201 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _203 = _201 != 0;
    bool _205 = !_193;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = _199 * 6.283185482025146484375;
    float _211 = cos(_209);
    bool _213 = !_197;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = -_187;
    float _219 = _179 + _217;
    float _221 = _187;
    float _223 = _165;
    if (!_175)
    {
        float _225 = _165 * _165;
        float _227 = _225 * 0.5;
        _221 = _227;
    }
    float _229 = _221;
    float _231 = _229;
    if (!_175)
    {
        float _233 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _233;
    }
    float _235 = _231;
    bool _237 = !_175;
    float _239 = _235;
    if (!_237)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _165 * _243;
        float _253 = 1.0 / _247;
        float _255 = _249 * 0.693147182464599609375;
        float _257 = exp2(_251);
        float _259 = 1.0 / _255;
        float _261 = _257 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _259, _165);
        float _267 = _265 * _253;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _239 = _269;
    }
    float _271 = _239;
    bool _273 = !_175;
    if (!_273)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = 1.0 / _281;
        float _285 = _165 * _277;
        float _287 = exp2(_285);
        float _289 = -_287;
        float _291 = _289 + 1.0;
        float _293 = _291 * _283;
        _223 = _293;
    }
    float _295 = _223;
    float _297 = in.m_58.w;
    float _299 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _301 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    float _309 = _299 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _311 = _299 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _313 = _299 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _315 = _219 < 0.5;
    float _317 = float(_315);
    float _319 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].x, _309);
    float _321 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].y, _311);
    float _323 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].z, _313);
    float _325 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = -_219;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = fma(_211, 0.5, 0.5);
    float _333 = -_317;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _337 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[10].x, _319);
    float _339 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[10].y, _321);
    float _341 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[10].z, _323);
    float _343 = _325;
    float _345 = _319;
    if (!_175)
    {
        float _347 = _111 * _111;
        float _349 = _347 * 0.5;
        _343 = _349;
    }
    float _351 = _343;
    float _353 = fma(_295, _181, _337);
    float _355 = fma(_295, _183, _339);
    float _357 = -_331;
    float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _361 = fma(_295, _185, _341);
    float _363 = _351;
    if (!_175)
    {
        _345 = _111;
    }
    float _365 = _345;
    float _367 = _365;
    if (!_175)
    {
        float _369 = _351 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _363 = _369;
    }
    float _371 = _363;
    bool _373 = !_175;
    float _375 = _371;
    if (!_373)
    {
        float _377 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _379 = log2(_377);
        float _381 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _383 = _381 + 1.0;
        float _385 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _387 = _111 * _379;
        float _389 = 1.0 / _383;
        float _391 = _385 * 0.693147182464599609375;
        float _393 = exp2(_387);
        float _395 = 1.0 / _391;
        float _397 = _393 + (-1.0);
        float _399 = -_397;
        float _401 = fma(_399, _395, _111);
        float _403 = _401 * _389;
        float _405 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _375 = _405;
    }
    float _407 = _375;
    bool _409 = !_175;
    if (!_409)
    {
        float _411 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _413 = log2(_411);
        float _415 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _417 = _415 + 1.0;
        float _419 = 1.0 / _417;
        float _421 = _111 * _413;
        float _423 = exp2(_421);
        float _425 = -_423;
        float _427 = _425 + 1.0;
        float _429 = _427 * _419;
        _367 = _429;
    }
    float _431 = _367;
    float _433 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _435 = fma(_353, _297, _303);
    float _437 = fma(_355, _297, _305);
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _445 = _443 != 0;
    float _447 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _449 = _433 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _451 = fma(_361, _297, _307);
    float _453 = _433 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    bool _455 = !_441;
    int _457 = _455 ? 0 : 1;
    float _459 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[8].y, _449);
    float _463 = _433 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    int _465 = abs(_457);
    float _467 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[8].x, _453);
    float _469 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[10].y, _461);
    float _471 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[8].z, _463);
    bool _473 = !_203;
    int _475 = _473 ? 0 : 1;
    float _477 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[10].x, _467);
    float _479 = float(_465);
    float _481 = fma(_431, _183, _469);
    float _483 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[10].z, _471);
    int _485 = abs(_475);
    float _487 = 1.0 / _143;
    float _489 = abs(_329);
    float _491 = _479 * _489;
    bool _493 = !_445;
    int _495 = _493 ? 0 : 1;
    float _497 = fma(_431, _181, _477);
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _501 = -_481;
    float _503 = _355 + _501;
    float _505 = fma(_431, _185, _483);
    int _507 = abs(_495);
    float _509 = -_497;
    float _511 = _353 + _509;
    float _513 = _503 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _515 = float(_485);
    float _517 = _503 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _519 = _503 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _521 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[4].x, _513);
    float _523 = float(_507);
    float _525 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[5].x, _517);
    float _527 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[6].x, _519);
    float _529 = -_505;
    float _531 = _361 + _529;
    float _533 = fma(_515, _359, _491);
    float _535 = _111 * _487;
    float _537 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[4].z, _521);
    float _539 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[5].z, _525);
    float _541 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[6].z, _527);
    float _543 = abs(_335);
    float _545 = fma(_523, _543, _533);
    bool _547 = !_499;
    float _549 = _539;
    float _551 = _537;
    float _553 = _541;
    float _555 = _539;
    float _557 = _497;
    float _573;
    if (!_547)
    {
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _561 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        _573 = _535;
    }
    _575 = false;
    float _577 = _573;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _581 = _577 + _579;
    float _583 = in.m_58.x;
    float _585 = in.m_58.y;
    bool _587 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _589 = isnan(_577);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _599;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _605 = 1.0 / _601;
    float _607 = -_597;
    float _609 = _607 + 1.0;
    float _611 = _581 * _605;
    bool _613 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _615 = isnan(_577);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _629;
    float _633 = _623 * _609;
    float _635 = fma(_627, _611, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _637 = fma(_631, _611, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _639 = -_623;
    float _641 = _639 + 1.0;
    float _643 = _635 * _633;
    float _645 = _637 * _633;
    float _647 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].x, _643);
    float _649 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].y, _645);
    float _651 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[144].x, _647);
    float _653 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[144].y, _649);
    float _655 = _651 * _583;
    float _657 = _653 * _585;
    bool _659 = !_603;
    float _675;
    if (!_659)
    {
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _663 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        _675 = _535;
    }
    _677 = false;
    float _679 = _675;
    float _681 = in.m_53.y;
    float _683 = _157 * 2.0;
    float _685 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _687 = in.m_53.w;
    float _689 = _437 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _691 = floor(_683);
    float _693 = in.m_53.z;
    float _695 = _207 * _685;
    bool _697 = _157 > 0.5;
    float _699 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _705 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].x, _689);
    float _707 = _437 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _709 = _437 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _713 = _711 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _715 = 1.0 / _703;
    float _717 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].x, _707);
    bool _719 = _691 > 0.0;
    float _721 = _681 * 2.0;
    bool _723 = _691 >= 0.0;
    bool _725 = isnan(_691);
    bool _727 = _723 || _725;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    float _733 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].x, _709);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _741 = _731 ? 0 : 1;
    float _743 = floor(_721);
    bool _745 = _687 > 0.5;
    float _747 = _215 * _699;
    int _749 = ~_741;
    int _751 = _749 + 1;
    int _753 = _751 + 1;
    float _755 = _681 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _761 = _753;
    float _763 = _695;
    float _765 = _747;
    if (!_719)
    {
        int _767 = ~_741;
        int _769 = _767 + 1;
        _761 = _769;
    }
    int _771 = _761;
    float _773 = 1.0 / _713;
    float _775 = -_215;
    int _777 = _745 ? as_type<int>(_775) : as_type<int>(_215);
    float _779 = fma(_755, -2.0, _739);
    float _781 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _783 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].z, _705);
    float _785 = 1.0 / _737;
    bool _787 = _743 >= 0.0;
    bool _789 = isnan(_743);
    bool _791 = _787 || _789;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _801 = _743 > 0.0;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _805 = _795 ? 0 : 1;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _813 = _811 != 0;
    float _815 = 1.0 / _759;
    float _817 = -_803;
    float _819 = fma(_781, 2.0, _817);
    int _821 = ~_805;
    int _823 = _821 + 1;
    int _825 = _823 + 1;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _829 = _827 != 0;
    float _831 = -_111;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[76].x, _819);
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _837 = _835 != 0;
    float _839 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _841 = int(_839);
    int _843 = _825;
    float _845 = as_type<float>(_841);
    if (!_801)
    {
        int _847 = ~_805;
        int _849 = _847 + 1;
        _843 = _849;
    }
    int _851 = _843;
    bool _853 = _681 > 0.5;
    float _855 = 0.0;
    if (!_813)
    {
        _855 = _681;
    }
    float _857 = _855;
    float _859 = 0.0;
    float _861 = _857;
    if (!_813)
    {
        _859 = _693;
    }
    float _863 = _859;
    float _865 = 1.0 / _799;
    float _867 = 0.0;
    float _869 = _863;
    if (!_813)
    {
        _867 = _693;
    }
    float _871 = _867;
    float _873 = _871;
    if (_829)
    {
        float _875 = -_695;
        float _877 = _697 ? _875 : _695;
        _763 = _877;
    }
    float _879 = _763;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _883 = _881 != 0;
    bool _885 = _693 > 0.5;
    float _887 = 1.0 / _809;
    bool _889 = !_883;
    int _891 = _889 ? 0 : 1;
    float _893 = -_207;
    int _895 = _885 ? as_type<int>(_893) : as_type<int>(_207);
    if (_837)
    {
        float _897 = -_747;
        float _899 = _853 ? _897 : _747;
        _765 = _899;
    }
    float _901 = _765;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _905 = _903 != 0;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _909 = _907 != 0;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _913 = _911 != 0;
    float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _919 = _917 != 0;
    float _921 = _901 + (-0.5);
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _925 = _923 != 0;
    bool _927 = !_813;
    float _929 = _927 ? 1.2345600128173828125 : 1.0;
    bool _931 = !_813;
    float _933 = _931 ? _681 : _157;
    bool _935 = !_919;
    float _937 = _935 ? _207 : as_type<float>(_895);
    if (_813)
    {
        _861 = _157;
    }
    float _939 = _861;
    float _941 = _929 * _933;
    bool _943 = !_925;
    float _945 = _943 ? _215 : as_type<float>(_777);
    float _947 = _681 + _693;
    if (_813)
    {
        _869 = _681;
    }
    float _949 = _869;
    float _951 = _915 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_813)
    {
        _873 = _681;
    }
    float _953 = _873;
    bool _955 = !_909;
    int _957 = _955 ? 0 : 1;
    float _959 = _949 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _963 = _961 != 0;
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _967 = _965 != 0;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _971 = _969 != 0;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _975 = _973 != 0;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _979 = _977 != 0;
    float _981 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].z, _717);
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _983;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _991 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].z, _733);
    float _993 = _985 * _715;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _999;
    float _1003 = 1.0 / _989;
    float _1005 = _997 * _773;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1011 = _1001 * _785;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1017 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1019 = log2(_1017);
    float _1021 = _1009 * _815;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1035;
    float _1039 = float(_841);
    float _1041 = _1029 * _865;
    float _1043 = 1.0 / _1015;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1045;
    float _1049 = _157 + _681;
    float _1051 = _1037 * _887;
    float _1053 = _111 * _1039;
    float _1055 = _1047 * _1003;
    float _1057 = _1049 + (-1.0);
    float _1059 = _693 * 2.0;
    float _1061 = 1.0 / _1025;
    float _1063 = _1053 * _487;
    float _1065 = _111 * _1019;
    float _1067 = _991 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1069;
    bool _1073 = !_905;
    int _1075 = _1073 ? 0 : 1;
    float _1077 = 1.0 / _1033;
    float _1079 = float(uint(_841));
    float _1081 = _1071 * _1043;
    bool _1083 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1085 = isnan(_679);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    bool _1095 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1097 = isnan(_535);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    float _1107 = floor(_1059);
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1113;
    bool _1117 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1119 = isnan(_535);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = _1111 * _1061;
    float _1131 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1133 = _157 + _693;
    float _1135 = exp2(_1065);
    float _1137 = _1115 * _1077;
    float _1139 = _1133 + (-1.0);
    float _1141 = _947 + (-1.0);
    int _1143 = ~_841;
    int _1145 = _1143 + 1;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1149 = _1107 >= 0.0;
    bool _1151 = isnan(_1107);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.0);
    bool _1157 = _1153 || _1155;
    float _1159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1161 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1163 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1165 = _1157 ? 0 : 1;
    float _1167 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _779);
    bool _1169 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1171 = isnan(0.0);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1177 = _1173 || _1175;
    float _1179 = _879 + 0.5;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1183 = _679 + _1181;
    float _1185 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1187 = int(_1185);
    float _1189 = -_1135;
    float _1191 = _1189 + 1.0;
    float _1193 = fma(_951, _1179, _833);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1197 = _679 + _1195;
    float _1199 = fma(_993, _1183, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1203 = _679 + _1201;
    float _1205 = _1177 ? _1191 : 0.0;
    float _1207 = fma(_1005, _1197, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1209 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1211 = _1107 > 0.0;
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1215 = _535 + _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1219 = _535 + _1217;
    float _1221 = -_1209;
    float _1223 = -_1167;
    float _1225 = fma(_1221, _921, _1223);
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1229 = _535 + _1227;
    float _1231 = fma(_1081, _1203, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1233 = fma(_1055, _1215, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1235 = float(_1187);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1239 = _535 + _1237;
    float _1241 = fma(_1011, _1219, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1245 = _535 + _1243;
    float _1247 = 1.0 / _1235;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1251 = _535 + _1249;
    float _1253 = fma(_1129, _1229, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1255 = fma(_1021, _1239, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1257 = fma(_1051, _1245, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1261 = _535 + _1259;
    float _1263 = fma(_1137, _1251, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1265 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1267 = isnan(_535);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = 1.0 / _1079;
    float _1279 = fma(_1041, _1261, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1281 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1283 = isnan(_535);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1147);
    float _1295 = -_1275;
    float _1297 = _1295 + 1.0;
    bool _1299 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1301 = isnan(_679);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1307 = _1303 || _1305;
    float _1309 = float(_1307);
    bool _1311 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1313 = isnan(_679);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1319 = _1315 || _1317;
    float _1321 = float(_1319);
    float _1323 = _111 * _1247;
    bool _1325 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1327 = isnan(_679);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    float _1337 = _1291 * _1297;
    bool _1339 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1341 = isnan(_535);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = -_1291;
    float _1353 = _1351 + 1.0;
    bool _1355 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1357 = isnan(_535);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    float _1367 = trunc(_1323);
    int _1369 = int(_1367);
    bool _1371 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1373 = isnan(_535);
    bool _1375 = _1371 || _1373;
    bool _1377 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1379 = _1375 || _1377;
    float _1381 = float(_1379);
    float _1383 = -_1349;
    float _1385 = _1383 + 1.0;
    int _1387 = as_type<int>(_1277) + (-2);
    float _1389 = -_1365;
    float _1391 = _1389 + 1.0;
    bool _1393 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1395 = isnan(_535);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1401 = _1397 || _1399;
    float _1403 = float(_1401);
    float _1405 = _1349 * _1353;
    float _1407 = _1365 * _1385;
    float _1409 = -_1335;
    float _1411 = _1409 + 1.0;
    float _1413 = -_1321;
    float _1415 = _1413 + 1.0;
    float _1417 = _1403 * _1391;
    float _1419 = -_1403;
    float _1421 = _1419 + 1.0;
    float _1423 = _1321 * _1411;
    float _1425 = _1309 * _1415;
    float _1427 = -_1309;
    float _1429 = _1427 + 1.0;
    float _1431 = _1127 * _1421;
    float _1433 = float(uint(_1369));
    float _1435 = -_1127;
    float _1437 = _1435 + 1.0;
    float _1439 = _1093 * _1429;
    float _1441 = floor(_941);
    float _1443 = as_type<float>(_1387) * _1433;
    float _1445 = _1381 * _1437;
    float _1447 = -_1381;
    float _1449 = _1447 + 1.0;
    float _1451 = _1199 * _1439;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1455 = 1.0 + _1453;
    float _1457 = _1105 * _1449;
    float _1459 = trunc(_1443);
    float _1461 = precise::max(_1459, 0.0);
    uint _1464 = uint(_1461);
    float _1466 = -_1105;
    float _1468 = _1466 + 1.0;
    float _1470 = -_1093;
    float _1472 = _1470 + 1.0;
    float _1474 = _1241 * _1457;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1478 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1451);
    float _1480 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1474);
    float _1482 = 1.0 / _1455;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1486 = -_1441;
    float _1488 = _941 + _1486;
    float _1490 = fma(_1207, _1425, _1478);
    float _1492 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1484);
    float _1494 = _939 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1496 = _1488 * _1039;
    int _1498 = _1145 * int(_1464);
    int _1500 = _1498 + _1369;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1504 = -_1476;
    float _1506 = fma(_1494, 2.0, _1504);
    bool _1508 = !_913;
    int _1510 = _1508 ? 0 : 1;
    float _1512 = fma(_1255, _1445, _1480);
    float _1514 = float(uint(_1500));
    float _1516 = fma(_959, -2.0, _1502);
    int _1518 = abs(_957);
    float _1520 = _1205 * _1482;
    float _1522 = float(_1369);
    float _1524 = as_type<float>(_1387) * _1514;
    int _1526 = ~_841;
    int _1528 = _1526 + 1;
    float _1530 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1516);
    bool _1532 = _1522 >= _1039;
    bool _1534 = isnan(_1522);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan(_1039);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = trunc(_1524);
    float _1546 = precise::max(_1544, 0.0);
    uint _1548 = uint(_1546);
    float _1550 = fma(_1231, _1423, _1490);
    int _1552 = abs(_1510);
    float _1554 = fma(_1233, _1431, _1512);
    float _1556 = float(_1518);
    float _1558 = _945 + (-0.5);
    int _1560 = ~_1165;
    int _1562 = _1560 + 1;
    int _1564 = _1562 + 1;
    float _1566 = trunc(_1496);
    int _1568 = int(_1566);
    int _1570 = _1564;
    if (!_1211)
    {
        int _1572 = ~_1165;
        int _1574 = _1572 + 1;
        _1570 = _1574;
    }
    int _1576 = _1570;
    float _1578 = -_1558;
    float _1580 = -_1530;
    float _1582 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1580);
    int _1584 = abs(_1075);
    float _1586 = fma(_1253, _1417, _1554);
    float _1588 = float(_851);
    float _1590 = _937 + 0.5;
    int _1592 = abs(_891);
    float _1594 = trunc(_1542);
    int _1596 = int(_1594);
    int _1598 = int(_1464) + int(_1548);
    float _1600 = -_111;
    float _1602 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1506);
    float _1604 = float(_771);
    float _1606 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1492);
    int _1608 = _1528 * _1598;
    int _1610 = _1608 + _1369;
    float _1612 = float(_1576);
    float _1614 = _1556 * _1604;
    float _1616 = float(_1584);
    float _1618 = trunc(_1063);
    int _1620 = int(_1618);
    bool _1622 = uint(_1610) >= uint(_841);
    float _1624 = _1614 * (-2.0);
    float _1626 = _1616 * _1612;
    float _1628 = in.m_60.x;
    float _1630 = in.m_60.y;
    float _1632 = in.m_60.z;
    bool _1634 = !_1622;
    int _1636 = _1634 ? 0 : (-1);
    float _1638 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1602);
    float _1640 = -_1606;
    float _1642 = _1640 + 1.0;
    int _1644 = ~_1598;
    int _1646 = _1644 + _1636;
    int _1648 = _1646 + 1;
    float _1650 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1550);
    bool _1652 = _841 == 0;
    int _1654 = _1568 * _1592;
    int _1656 = _1654 + _1369;
    float _1658 = _1626 * (-2.0);
    int _1660 = _841 * _1648;
    int _1662 = _1660 + _1369;
    float _1664 = fma(_1161, _1624, _1161);
    int _1666 = ~_1596;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = float(_1552);
    bool _1674 = !_1652;
    int _1676 = _1674 ? _1662 : (-1);
    float _1678 = _1672 * _1588;
    float _1680 = fma(_1624, _1630, _1630);
    float _1682 = fma(_1257, _1407, _1586);
    int _1684 = _1676 * _1670;
    float _1686 = _783 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1688 = fma(_1131, _1658, _1131);
    float _1690 = fma(_1658, _1628, _1628);
    float _1692 = _981 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1696 = _1686 + _1694;
    int _1698 = _841 + (-1);
    float _1700 = _1678 * (-2.0);
    bool _1702 = !_967;
    int _1704 = _1702 ? 0 : 1;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1708 = _1692 + _1706;
    bool _1710 = !_963;
    int _1712 = _1710 ? 0 : 1;
    float _1714 = _1696 * _1696;
    int _1716 = abs(_1704);
    int _1718 = _1596 * _1698;
    int _1720 = _1718 + _1684;
    int _1722 = abs(_1712);
    float _1724 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1726 = _1067 + _1724;
    float _1728 = fma(_1708, _1708, _1714);
    bool _1730 = !_971;
    int _1732 = _1730 ? 0 : 1;
    int _1734 = _1720 * _1716;
    float _1736 = fma(_1163, _1700, _1163);
    float _1738 = fma(_1726, _1726, _1728);
    int _1740 = abs(_1732);
    int _1742 = _1620 * _1722;
    int _1744 = _1742 + _1734;
    float _1746 = sqrt(_1738);
    float _1748 = fma(_1700, _1632, _1632);
    bool _1750 = !_975;
    int _1752 = _1750 ? 0 : 1;
    float _1754 = fma(_1279, _1405, _1682);
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1758 = _157 + (-0.5);
    int _1760 = abs(_1752);
    float _1762 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1756);
    float _1764 = _681 + (-0.5);
    int _1766 = _1656 * _1740;
    int _1768 = _1766 + _1744;
    float _1770 = rsqrt(_1738);
    float _1772 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1680);
    int _1774 = _1568 * _1760;
    int _1776 = _1774 + _1768;
    float _1778 = _685 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1780 = _1746 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1782 = float(uint(_1656));
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1786 = float(uint(_1776));
    float _1788 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1690);
    float _1790 = precise::min(_1778, _1780);
    float _1792 = as_type<float>(_1387) * _1782;
    float _1794 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1784);
    float _1796 = as_type<float>(_1387) * _1786;
    float _1798 = _693 + (-0.5);
    bool _1800 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1802 = isnan(1.0);
    bool _1804 = _1800 || _1802;
    bool _1806 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1808 = _1804 || _1806;
    float _1810 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1762);
    float _1812 = trunc(_1792);
    float _1814 = precise::max(_1812, 0.0);
    uint _1816 = uint(_1814);
    float _1818 = _1770 * _1790;
    bool _1820 = !_1808;
    float _1822 = _1820 ? _111 : _1520;
    float _1824 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1748);
    int _1826 = ~_841;
    int _1828 = _1826 + 1;
    float _1830 = _1696 * _1818;
    int _1832 = ~_841;
    int _1834 = _1832 + 1;
    float _1836 = fma(_1822, _1688, _1788);
    float _1838 = trunc(_1796);
    float _1840 = precise::max(_1838, 0.0);
    uint _1842 = uint(_1840);
    float _1844 = -_1830;
    float _1846 = _1696 + _1844;
    float _1848 = fma(_1822, _1664, _1772);
    float _1850 = _1836 * 0.15915493667125701904296875;
    float _1852 = fma(_1822, _1736, _1824);
    float _1854 = _1846 * _1846;
    float _1856 = _1848 * 0.15915493667125701904296875;
    float _1858 = -_1810;
    float _1860 = _1858 + 1.0;
    int _1862 = _1828 * int(_1816);
    int _1864 = _1862 + _1656;
    float _1866 = _1708 * _1818;
    float _1868 = _1726 * _1818;
    float _1870 = _1856 * 6.283185482025146484375;
    float _1872 = sin(_1870);
    float _1874 = fma(_1263, _1337, _1754);
    float _1876 = -_1866;
    float _1878 = _1708 + _1876;
    float _1880 = float(uint(_1864));
    float _1882 = -_1868;
    float _1884 = _1726 + _1882;
    int _1886 = _1834 * int(_1842);
    int _1888 = _1886 + _1776;
    float _1890 = fma(_1878, _1878, _1854);
    float _1892 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1874);
    float _1894 = _1856 * 6.283185482025146484375;
    float _1896 = cos(_1894);
    float _1898 = as_type<float>(_1387) * _1880;
    float _1900 = float(uint(_1888));
    float _1902 = fma(_1884, _1884, _1890);
    float _1904 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1794);
    float _1906 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1293);
    float _1908 = _1852 * 0.15915493667125701904296875;
    float _1910 = -_1904;
    float _1912 = _1910 + 1.0;
    float _1914 = as_type<float>(_1387) * _1900;
    float _1916 = -_1906;
    float _1918 = _1916 + 1.0;
    float _1920 = fma(_1860, _901, _1225);
    float _1922 = -_1642;
    float _1924 = fma(_937, _1922, _1638);
    float _1926 = -_1912;
    float _1928 = fma(_1926, _879, _1193);
    float _1930 = trunc(_1914);
    float _1932 = precise::max(_1930, 0.0);
    uint _1934 = uint(_1932);
    float _1936 = fma(_945, _1918, _1582);
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1942 = sqrt(_1902);
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1948 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1956 = _1850 * 6.283185482025146484375;
    float _1958 = cos(_1956);
    int _1960 = int(_1842) + int(_1934);
    out.m_62.x = _1948;
    out.m_62.y = _1950;
    out.m_62.z = _1952;
    out.m_62.w = _1946;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1966 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1968 = _1650 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _1928;
    out.m_64.y = _1920;
    out.m_64.z = _1924;
    out.m_64.w = _1936;
    float _1970 = _1908 * 6.283185482025146484375;
    float _1972 = cos(_1970);
    float _1974 = _1770 * _1942;
    float _1976 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1978 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _699 * _1974;
    float _1982 = _685 * _1974;
    float _1984 = _1850 * 6.283185482025146484375;
    float _1986 = sin(_1984);
    int _1988 = ~_841;
    int _1990 = _1988 + 1;
    float _1992 = _1958 * _1896;
    float _1994 = _1958 * _1872;
    out.m_66.x = _1976;
    out.m_66.y = _1978;
    out.m_66.z = _1966;
    out.m_66.w = _1968;
    float _1996 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    int _1998 = _1990 * _1960;
    int _2000 = _1998 + _1776;
    float _2002 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2004 = _2002 * 0.5;
    float _2006 = _1908 * 6.283185482025146484375;
    float _2008 = sin(_2006);
    float _2010 = _1958 * _1972;
    float _2012 = _1980 * _1996;
    bool _2014 = uint(_2000) >= uint(_841);
    float _2016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2018 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2020 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2022 = trunc(_1898);
    float _2024 = precise::max(_2022, 0.0);
    uint _2026 = uint(_2024);
    float _2028 = _1986 * _1872;
    float _2030 = _1986 * _1896;
    float _2032 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2034 = _1986 * _1972;
    float _2036 = _1982 * _2016;
    float _2038 = _1896 * _1972;
    float _2040 = _1872 * _1972;
    float _2042 = fma(_2008, _1992, _2028);
    float _2044 = fma(_2008, _2028, _1992);
    float _2046 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2048 = -_2008;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2018);
    float _2052 = -_1994;
    float _2054 = fma(_2008, _2030, _2052);
    float _2056 = _2010 * _2012;
    float _2058 = -_2030;
    float _2060 = fma(_2008, _1994, _2058);
    float _2062 = -_2008;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2032);
    float _2066 = -_2008;
    float _2068 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2046);
    float _2070 = -_2012;
    float _2072 = _2008 * _2070;
    float _2074 = _2034 * _2012;
    float _2076 = fma(_2042, _2036, _2056);
    int _2078 = int(_1816) + int(_2026);
    float _2080 = fma(_2038, _2036, _2072);
    bool _2082 = !_2014;
    int _2084 = _2082 ? 0 : (-1);
    float _2086 = fma(_2054, _2036, _2074);
    float _2088 = fma(_2060, _2004, _2076);
    float _2090 = fma(_2040, _2004, _2080);
    int _2092 = ~_1960;
    int _2094 = _2092 + _2084;
    int _2096 = _2094 + 1;
    float _2098 = fma(_2044, _2004, _2086);
    float _2100 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2102 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2104 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2050);
    int _2106 = _841 * _2096;
    int _2108 = _2106 + _1776;
    float _2110 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2100);
    float _2112 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2102);
    float _2114 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2064);
    float _2116 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2068);
    float _2118 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2110);
    bool _2120 = !_1652;
    int _2122 = _2120 ? _2108 : (-1);
    float _2124 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2112);
    float _2126 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2128 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2130 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2132 = _2124 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2134 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2136 = _1067 + _2128;
    float _2138 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2126);
    float _2140 = _1692 + _2132;
    float _2142 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2130);
    float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2146 = _2136 + _2144;
    int _2148 = ~_841;
    int _2150 = _2148 + 1;
    float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2154 = _2140 + _2152;
    float _2156 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2134);
    float _2158 = _2146 * _2146;
    float _2160 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2162 = _2122 >> 31;
    float _2164 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2166 = fma(_2154, _2154, _2158);
    int _2168 = _2150 * _2078;
    int _2170 = _2168 + _1656;
    float _2172 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2160);
    int _2174 = _2162 & 3;
    float _2176 = sqrt(_2166);
    float _2178 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2164);
    int _2180 = _2122 & 3;
    bool _2182 = _2180 != 0;
    float _2184 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2186 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2188 = uint(_2170) >= uint(_841);
    float _2190 = _2020 * _2104;
    int _2192 = _2122 + _2174;
    float _2194 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2184);
    bool _2196 = uint(_2180) > 1u;
    float _2198 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2186);
    int _2200 = _2192 >> 2;
    float _2202 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2178);
    bool _2204 = !_2188;
    int _2206 = _2204 ? 0 : (-1);
    float _2208 = _2020 * _2114;
    int _2210 = _2122 & 3;
    bool _2212 = _2210 != 0;
    float _2214 = _2020 * _2116;
    int _2216 = _2200 << 4;
    int _2218 = _2216 + 512;
    float _2220 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2138);
    bool _2222 = _2176 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2224 = _2202 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2226 = ~_2078;
    int _2228 = _2226 + _2206;
    int _2230 = _2228 + 1;
    uint _2232 = uint(int(uint(_2218) >> uint(2)));
    uint _2234 = uint(int(uint(int(_2232)) >> uint(2)));
    int _2236 = int(_2232) & 3;
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[int(_2234)][_2236];
    int _2240 = int(_2232) + 1;
    uint _2242 = uint(int(uint(_2240) >> uint(2)));
    int _2244 = _2240 & 3;
    float _2246 = (*spvDescriptorSet0.vp_c9)._m0[int(_2242)][_2244];
    int _2248 = _2212 ? 0 : 1;
    float _2250 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2142);
    float _2252 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2156);
    bool _2254 = uint(_2180) >= 2u;
    int _2256 = _841 * _2230;
    int _2258 = _2256 + _1656;
    bool _2260 = !_2182;
    float _2262 = _2260 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2264 = _1686 + _2224;
    int _2266 = _2218 + 8;
    uint _2268 = uint(int(uint(_2266) >> uint(2)));
    uint _2270 = uint(int(uint(int(_2268)) >> uint(2)));
    int _2272 = int(_2268) & 3;
    float _2274 = (*spvDescriptorSet0.vp_c9)._m0[int(_2270)][_2272];
    int _2276 = int(_2268) + 1;
    uint _2278 = uint(int(uint(_2276) >> uint(2)));
    int _2280 = _2276 & 3;
    float _2282 = (*spvDescriptorSet0.vp_c9)._m0[int(_2278)][_2280];
    int _2284 = _2254 ? 0 : 1;
    float _2286 = _2262;
    float _2288 = _1982;
    if (!_2222)
    {
        _845 = _2140;
    }
    float _2290 = _845;
    bool _2292 = _2180 != 3;
    int _2294 = ~_2284;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    int _2300 = ~_2248;
    int _2302 = _2300 + 1;
    int _2304 = _2302 + 1;
    int _2306 = _2304;
    float _2308 = _2290;
    int _2310 = _2298;
    if (!_2196)
    {
        int _2312 = ~_2248;
        int _2314 = _2312 + 1;
        _2306 = _2314;
    }
    int _2316 = _2306;
    int _2318 = abs(as_type<int>(_2262));
    int _2320 = abs(_2316);
    float _2322 = as_type<float>(_2320);
    if (!_2222)
    {
        _2286 = _2136;
    }
    float _2324 = _2286;
    int _2326 = ~_2320;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    float _2332 = _2324;
    if (!_2222)
    {
        _2322 = _2264;
    }
    float _2334 = _2322;
    bool _2336 = !_2222;
    float _2338 = _2334;
    if (!_2336)
    {
        float _2340 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2344 = _2176 + _2342;
        float _2346 = _2264 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2348 = rsqrt(_2166);
        float _2350 = _2344 * _2340;
        float _2352 = _2350 * 0.15915493667125701904296875;
        float _2354 = _2352 * 6.283185482025146484375;
        float _2356 = cos(_2354);
        float _2358 = _2352 * 6.283185482025146484375;
        float _2360 = sin(_2358);
        float _2362 = _2356 + (-1.0);
        float _2364 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2366 = fma(_2360, _2346, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2368 = fma(_2264, _2356, _2364);
        float _2370 = _2348 * _2366;
        float _2372 = fma(_2154, _2370, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2374 = fma(_2146, _2370, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2308 = _2372;
        _2338 = _2368;
        _2332 = _2374;
    }
    float _2376 = _2308;
    float _2378 = _2338;
    float _2380 = _2332;
    float _2382 = _2380;
    if (_2292)
    {
        int _2384 = ~_2284;
        int _2386 = _2384 + 1;
        _2310 = _2386;
    }
    int _2388 = _2310;
    int _2390 = _2330 * as_type<int>(_2246);
    int _2392 = ~_2318;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    float _2398 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2400 = _2180 != 3;
    out.m_68.w = _1790;
    int _2402 = abs(_2388);
    int _2404 = _2396 * as_type<int>(_2238);
    int _2406 = _2404 + _2390;
    bool _2408 = !_2400;
    int _2410 = _2408 ? 0 : (-1);
    float _2412 = -_1692;
    float _2414 = _2412 + _2376;
    bool _2416 = !_979;
    int _2418 = _2416 ? 0 : 1;
    float _2420 = fma(_2398, _2220, _2190);
    float _2422 = fma(_2398, _2250, _2208);
    int _2424 = abs(_2410);
    float _2426 = -_1686;
    float _2428 = _2426 + _2378;
    int _2430 = abs(_2418);
    float _2432 = fma(_2398, _2252, _2214);
    int _2434 = ~_2402;
    int _2436 = _2434 + 1;
    int _2438 = _2436 + 1;
    float _2440 = _2428 * _2428;
    int _2442 = ~_2424;
    int _2444 = _2442 + 1;
    int _2446 = _2444 + 1;
    float _2448 = -_1067;
    float _2450 = _2448 + _2380;
    int _2452 = ~_2430;
    int _2454 = _2452 + 1;
    int _2456 = _2454 + 1;
    int _2458 = _2438 * as_type<int>(_2274);
    int _2460 = _2458 + _2406;
    float _2462 = fma(_2414, _2414, _2440);
    bool _2464 = !_1652;
    int _2466 = _2464 ? _2258 : (-1);
    float _2468 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2198);
    int _2470 = _2446 * as_type<int>(_2282);
    int _2472 = _2470 + _2460;
    float _2474 = fma(_2450, _2450, _2462);
    float _2476 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    float _2478 = _2468 + _2432;
    int _2480 = _2472 * _2456;
    float _2482 = sqrt(_2474);
    float _2484 = _2476 + _2422;
    out.m_70.x = _1892;
    int _2486 = _2466 * _2430;
    int _2488 = _2486 + _2480;
    float _2490 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2194);
    float _2492 = -_1866;
    float _2494 = _2492 + _2376;
    out.m_72.x = _1982;
    float _2496 = _2490 + _2420;
    float _2498 = float(_2488);
    float _2500 = -_1868;
    float _2502 = _2500 + _2380;
    float _2504 = -_1866;
    float _2506 = _1692 + _2504;
    float _2508 = -_1830;
    float _2510 = _2508 + _2378;
    out.m_74.x = _2496;
    out.m_74.y = _2484;
    out.m_74.z = _2478;
    float _2512 = -_1830;
    float _2514 = _1686 + _2512;
    bool _2516 = _2482 > 0.0;
    out.m_76.y = _2498;
    float _2518 = -_1868;
    float _2520 = _1067 + _2518;
    float _2522 = _2432;
    float _2524 = _2498;
    float _2526 = _2510;
    float _2528 = _2502;
    float _2530 = _2498;
    float _2532 = _2398;
    float _2534 = _2514;
    float _2536 = _2506;
    if (!_2516)
    {
        _2382 = _2494;
    }
    float _2538 = _2382;
    bool _2540 = !_2516;
    float _2542 = _2538;
    if (!_2540)
    {
        bool _2544 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2546 = _2538;
        if (_2544)
        {
            float _2548 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2546 = _2548;
        }
        float _2550 = _2546;
        float _2552 = _2550;
        if (_2544)
        {
            float _2554 = _537 * _2550;
            _2522 = _2554;
        }
        float _2556 = _2522;
        float _2558 = _2556;
        if (_2544)
        {
            float _2560 = _539 * _2550;
            _2288 = _2560;
        }
        float _2562 = _2288;
        float _2564 = _2562;
        if (_2544)
        {
            float _2566 = _541 * _2550;
            _2524 = _2566;
        }
        float _2568 = _2524;
        float _2570 = _2568;
        if (!_2544)
        {
            bool _2572 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2574 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2576 = _2572 || _2574;
            bool _2578 = isnan(1.0);
            bool _2580 = _2576 || _2578;
            float _2582 = _111 + 1.0;
            if (!_2580)
            {
                float _2584 = _2582 * _2582;
                float _2586 = _2584 * 0.5;
                _121 = _2586;
            }
            float _2588 = _121;
            float _2590 = _2588;
            if (!_2580)
            {
                float _2592 = _2588 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2590 = _2592;
            }
            float _2594 = _2590;
            bool _2596 = !_2580;
            float _2598 = _2594;
            if (!_2596)
            {
                float _2600 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2602 = log2(_2600);
                float _2604 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2606 = 1.0 + _2604;
                float _2608 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2610 = _2602 * _2582;
                float _2612 = 1.0 / _2606;
                float _2614 = _2608 * 0.693147182464599609375;
                float _2616 = exp2(_2610);
                float _2618 = 1.0 / _2614;
                float _2620 = _2616 + (-1.0);
                float _2622 = -_2620;
                float _2624 = fma(_2622, _2618, _2582);
                float _2626 = _2624 * _2612;
                float _2628 = _2626 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2598 = _2628;
            }
            float _2630 = _2598;
            float _2632 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2634 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2636 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2638 = _2632 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2640 = _2632 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2642 = _2632 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2644 = fma(_2634, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2638);
            float _2646 = fma(_2634, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2640);
            float _2648 = _2640;
            if (!_2580)
            {
                _2648 = _2582;
            }
            float _2650 = _2648;
            float _2652 = fma(_2636, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2644);
            bool _2654 = !_2580;
            float _2656 = _2650;
            if (!_2654)
            {
                float _2658 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2660 = log2(_2658);
                float _2662 = _2660 * _2582;
                float _2664 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2666 = 1.0 + _2664;
                float _2668 = exp2(_2662);
                float _2670 = 1.0 / _2666;
                float _2672 = -_2668;
                float _2674 = _2672 + 1.0;
                float _2676 = _2674 * _2670;
                _2656 = _2676;
            }
            float _2678 = _2656;
            float _2680 = fma(_2634, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2642);
            float _2682 = fma(_2636, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2646);
            float _2684 = fma(_2678, _183, _2652);
            float _2686 = fma(_2636, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2680);
            float _2688 = fma(_2678, _181, _2682);
            float _2690 = -_481;
            float _2692 = _2690 + _2684;
            float _2694 = fma(_2678, _185, _2686);
            float _2696 = -_497;
            float _2698 = _2696 + _2688;
            float _2700 = _2692 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2702 = _2692 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2704 = _2692 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2706 = -_505;
            float _2708 = _2706 + _2694;
            float _2710 = fma(_2698, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2700);
            float _2712 = fma(_2698, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2702);
            float _2714 = fma(_2698, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2704);
            float _2716 = fma(_2708, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2710);
            float _2718 = fma(_2708, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2712);
            float _2720 = fma(_2708, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2714);
            _549 = _2718;
            _551 = _2716;
            _553 = _2720;
            _2558 = _2716;
            _2564 = _2718;
            _2570 = _2720;
            _2552 = _2680;
        }
        float _2722 = _549;
        float _2724 = _551;
        float _2726 = _553;
        float _2728 = _2558;
        float _2730 = _2564;
        float _2732 = _2570;
        float _2734 = _2552;
        float _2736 = _2722 * _2722;
        float _2738 = rsqrt(_2474);
        float _2740 = fma(_2724, _2724, _2736);
        float _2742 = fma(_2726, _2726, _2740);
        float _2744 = sqrt(_2742);
        float _2746 = _2414 * _2738;
        float _2748 = _2428 * _2738;
        float _2750 = _2450 * _2738;
        bool _2752 = _2744 > 0.0;
        float _2754 = _2734;
        _2530 = _2732;
        _2532 = _2742;
        _555 = _2722;
        if (!_2752)
        {
            _2754 = _2494;
        }
        float _2756 = _2754;
        bool _2758 = !_2752;
        _2542 = _2756;
        if (!_2758)
        {
            float _2760 = rsqrt(_2742);
            float _2762 = _2760 * _2722;
            float _2764 = _2760 * _2724;
            float _2766 = _2760 * _2726;
            float _2768 = _2748 * _2762;
            float _2770 = fma(_2746, _2764, _2768);
            float _2772 = fma(_2750, _2766, _2770);
            float _2774 = _2772 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2776 = fma(_2728, _2774, _2494);
            float _2778 = fma(_2730, _2774, _2510);
            float _2780 = fma(_2732, _2774, _2502);
            _2526 = _2778;
            _2542 = _2776;
            _2528 = _2780;
        }
    }
    float _2782 = _2526;
    float _2784 = _2542;
    float _2786 = _2528;
    float _2788 = _2530;
    float _2790 = _2532;
    float _2792 = _555;
    float _2794 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2796 = _2782 + _2794;
    float _2798 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2800 = _2784 + _2798;
    float _2802 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2804 = _2786 + _2802;
    float _2806 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2808 = _2796 * _2796;
    float _2810 = fma(_2800, _2800, _2808);
    float _2812 = fma(_2804, _2804, _2810);
    float _2814 = rsqrt(_2812);
    float _2816 = sqrt(_2812);
    float _2818 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2820 = _2800 * _2818;
    float _2822 = _2804 * _2818;
    float _2824 = _2820 * _2820;
    float _2826 = _2822 * _2822;
    float _2828 = _2824 + _2826;
    float _2830 = sqrt(_2828);
    bool _2832 = _2830 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2834 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2836 = _2830 + _2834;
    float _2838 = _2788;
    float _2840 = _2828;
    float _2842 = _2836;
    float _2844 = _2790;
    float _2846 = _2796;
    float _2848 = _2792;
    float _2850 = _2820;
    if (_2832)
    {
        float _2852 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2838 = _2852;
    }
    float _2854 = _2838;
    if (_2832)
    {
        float _2856 = rsqrt(_2828);
        _2840 = _2856;
    }
    float _2858 = _2840;
    if (_2832)
    {
        float _2860 = _2836 * _2854;
        _2842 = _2860;
    }
    float _2862 = _2842;
    if (_2832)
    {
        float _2864 = _2862 * 0.15915493667125701904296875;
        _2844 = _2864;
    }
    float _2866 = _2844;
    float _2868 = _2804;
    if (_2832)
    {
        float _2870 = _2866 * 6.283185482025146484375;
        float _2872 = sin(_2870);
        _2868 = _2872;
    }
    float _2874 = _2868;
    float _2876 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2878 = precise::max(0.0, _2876);
    float _2880 = _2854;
    float _2882 = _2878;
    if (_2832)
    {
        float _2884 = _2866 * 6.283185482025146484375;
        float _2886 = cos(_2884);
        _2880 = _2886;
    }
    float _2888 = _2880;
    float _2890 = -_2818;
    float _2892 = -_2878;
    float _2894 = fma(_2796, _2890, _2892);
    if (_2832)
    {
        float _2896 = _2894 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2846 = _2896;
    }
    float _2898 = _2846;
    float _2900 = _2782 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2902 = _2874;
    float _2904 = _2898;
    if (_2832)
    {
        float _2906 = fma(_2874, _2898, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2902 = _2906;
    }
    float _2908 = _2902;
    float _2910 = _2908;
    if (!_2832)
    {
        _2904 = _2894;
    }
    float _2912 = _2904;
    float _2914 = fma(_2784, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2900);
    float _2916 = _2912;
    float _2918 = _2888;
    if (_2832)
    {
        float _2920 = _2888 + (-1.0);
        _2882 = _2920;
    }
    float _2922 = _2882;
    float _2924 = _2922;
    if (_2832)
    {
        float _2926 = _2858 * _2908;
        _2848 = _2926;
    }
    float _2928 = _2848;
    if (!_2832)
    {
        _2910 = _2824;
    }
    float _2930 = _2910;
    float _2932 = _2782 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2934 = _2930;
    if (_2832)
    {
        float _2936 = _2922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _557 = _2936;
    }
    float _2938 = _557;
    if (_2832)
    {
        float _2940 = _2820 * _2928;
        _2850 = _2940;
    }
    float _2942 = _2850;
    if (!_2832)
    {
        _2924 = _2822;
    }
    float _2944 = _2924;
    float _2946 = _2944;
    if (_2832)
    {
        float _2948 = _2822 * _2928;
        _2946 = _2948;
    }
    float _2950 = _2946;
    if (_2832)
    {
        float _2952 = fma(_2894, _2888, _2938);
        _2916 = _2952;
    }
    float _2954 = _2916;
    if (_2832)
    {
        float _2956 = _2942 * _2942;
        _2934 = _2956;
    }
    float _2958 = _2934;
    if (!_2832)
    {
        _2918 = _2826;
    }
    float _2960 = _2918;
    float _2962 = _2960;
    if (_2832)
    {
        float _2964 = _2950 * _2950;
        _2962 = _2964;
    }
    float _2966 = _2962;
    float _2968 = fma(_2784, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2932);
    float _2970 = fma(_2954, _2954, _2958);
    float _2972 = _2782 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2974 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2968);
    float _2976 = _2970 + _2966;
    float _2978 = _2782 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2980 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2914);
    float _2982 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2984 = fma(_2816, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2982);
    float _2986 = precise::clamp(_2984, 0.0, 1.0);
    float _2988 = _2974 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2990 = fma(_2784, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2978);
    float _2992 = rsqrt(_2976);
    float _2994 = -_2986;
    float _2996 = _2994 + 1.0;
    float _2998 = fma(_2784, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2972);
    float _3000 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2990);
    float _3002 = _2988 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3004 = _2980 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3006 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2998);
    float _3008 = _3000 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3010 = abs(_2996);
    float _3012 = log2(_3010);
    float _3014 = _3006 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3016 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3002);
    float _3018 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3020 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3016);
    float _3022 = _2992 * _2942;
    float _3024 = _2992 * _2954;
    float _3026 = _2992 * _2950;
    float _3028 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3020);
    float _3030 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3032 = -_3018;
    float _3034 = fma(_3032, _2806, 1.0);
    float _3036 = _3024 + 1.0;
    float _3038 = 1.0 / _3028;
    float _3040 = -_3030;
    float _3042 = fma(_3024, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3040);
    float _3044 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3046 = _2988 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3048 = -_3026;
    float _3050 = fma(_3048, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3042);
    float _3052 = _2988 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3054 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3046);
    float _3056 = exp2(_3044);
    float _3058 = fma(_3050, -0.5, 0.5);
    float _3060 = fma(_3050, 0.5, 0.5);
    float _3062 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3052);
    float _3064 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3054);
    float _3066 = fma(_3060, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3068 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3062);
    float _3070 = log2(_3034);
    float _3072 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3064);
    float _3074 = fma(_3060, _3066, -0.212114393711090087890625);
    float _3076 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3068);
    float _3078 = fma(_3060, _3074, 1.570728778839111328125);
    float _3080 = _3076 * _3038;
    float _3082 = sqrt(_3058);
    float _3084 = -_3024;
    float _3086 = fma(_3056, _3036, _3084);
    float _3088 = _3072 * _3038;
    float _3090 = fma(_3080, 0.5, 0.5);
    float _3092 = fma(_3086, 0.5, 0.5);
    float _3094 = fma(_3088, -0.5, 0.5);
    float _3096 = _3070 * 0.693147182464599609375;
    float _3098 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3100 = _3082 * 0.636619746685028076171875;
    float _3102 = -_3078;
    float _3104 = fma(_3100, _3102, 1.0);
    float3 _8435 = float3(_3090, _3094, _3098);
    float _3106 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8435, float3(0.0), isnan(_8435)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8435, float3(0.0), isnan(_8435)), level(0.0)).x;
    float3 _8446 = float3(_3090, _3094, _3098);
    float4 _3109 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8446, float3(0.0), isnan(_8446)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8446, float3(0.0), isnan(_8446)), level(0.0)).xyzw;
    float _3111 = _3109.x;
    float _3113 = _3109.y;
    float _3115 = _3109.z;
    float _3117 = _3109.w;
    float2 _8463 = float2(_3104, _3092);
    float3 _3121 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8463, float2(0.0), isnan(_8463)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8463, float2(0.0), isnan(_8463)), level(0.0)).xyz;
    float _3123 = _3121.x;
    float _3125 = _3121.y;
    float _3127 = _3121.z;
    float _3129 = _2514 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3131 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_78.x = _2506;
    out.m_78.y = _2514;
    out.m_78.z = _2520;
    bool _3133 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3135 = isnan(0.5);
    bool _3137 = _3133 || _3135;
    bool _3139 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3141 = _3137 || _3139;
    float _3143 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3129);
    float _3145 = exp2(_3131);
    float _3147 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3143);
    float _3149 = _2514 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3151 = _3147 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3153 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3149);
    float _3155 = _2988 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3157 = 1.0 / _3151;
    float _3159 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3153);
    float _3161 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3155);
    float _3163 = _3076 + _3028;
    float _3165 = _3159 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3167 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3161);
    float _3169 = _3163 * 0.5;
    float _3171 = _3165 + _3151;
    float _3173 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3167);
    float _3175 = -_3145;
    float _3177 = _3175 + 1.0;
    float _3179 = _3145;
    float _3181 = _3173;
    float _3183 = _3028;
    if (_3141)
    {
        _3179 = 1.0;
    }
    float _3185 = _3179;
    float _3187 = _3173 + _3028;
    out.gl_Position.x = _3076;
    out.gl_Position.y = _3072;
    out.gl_Position.z = _3173;
    out.gl_Position.w = _3028;
    float _3189 = _3171 * _3157;
    float _3191 = _3189 * 0.5;
    float _3193 = _3028 * 0.5;
    float _3195 = _3187 * 0.5;
    float _3197 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3199 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3197);
    float _3201 = fma(_3072, -0.5, _3193);
    float _3203 = _3177 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3205 = _3193;
    float _3207 = _3185;
    if (_3141)
    {
        _3205 = 1.0;
    }
    float _3209 = _3205;
    out.m_80.x = _3169;
    out.m_80.y = _3201;
    out.m_80.z = _3195;
    out.m_80.w = _3028;
    float _3211 = 1.0 / _3199;
    float _3213 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3215 = _3211 * _3213;
    float _3217 = _3209;
    if (!_3141)
    {
        float _3219 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3221 = _3219 * 0.15915493667125701904296875;
        float _3223 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3225 = _3221 * 6.283185482025146484375;
        float _3227 = cos(_3225);
        float _3229 = _3223 * 0.15915493667125701904296875;
        float _3231 = _3221 * 6.283185482025146484375;
        float _3233 = sin(_3231);
        float _3235 = 1.0 / _3227;
        float _3237 = _3229 * 6.283185482025146484375;
        float _3239 = cos(_3237);
        float _3241 = _3233 * _3235;
        float _3243 = _3229 * 6.283185482025146484375;
        float _3245 = sin(_3243);
        float _3247 = _3239 * _3241;
        float _3249 = 1.0 / _3247;
        float _3251 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3253 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3251;
        float _3255 = 1.0 / _3253;
        float _3257 = _3245 * _3249;
        float _3259 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3261 = fma(_3215, _3257, _3259);
        float _3263 = _3261 * _3255;
        float _3265 = precise::clamp(_3263, 0.0, 1.0);
        _2534 = _3255;
        _3217 = _3265;
        _2536 = _3229;
        _3181 = _3253;
        _3183 = _3235;
    }
    float _3267 = _2534;
    float _3269 = _3217;
    float _3271 = _2536;
    float _3273 = _3181;
    float _3275 = _3183;
    float _3277 = _3271;
    float _3279 = _3267;
    float _3281 = _3273;
    float _3283 = _3275;
    if (!_3141)
    {
        float _3285 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3287 = _3285 * 0.15915493667125701904296875;
        float _3289 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3291 = _3287 * 6.283185482025146484375;
        float _3293 = cos(_3291);
        float _3295 = _3289 * 0.15915493667125701904296875;
        float _3297 = _3287 * 6.283185482025146484375;
        float _3299 = sin(_3297);
        float _3301 = 1.0 / _3293;
        float _3303 = _3295 * 6.283185482025146484375;
        float _3305 = cos(_3303);
        float _3307 = _3299 * _3301;
        float _3309 = _3295 * 6.283185482025146484375;
        float _3311 = sin(_3309);
        float _3313 = _3305 * _3307;
        float _3315 = 1.0 / _3313;
        float _3317 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3319 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3317;
        float _3321 = 1.0 / _3319;
        float _3323 = _3311 * _3315;
        float _3325 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3327 = fma(_3215, _3323, _3325);
        float _3329 = _3327 * _3321;
        float _3331 = precise::clamp(_3329, 0.0, 1.0);
        float _3333 = -_3331;
        float _3335 = _3333 + 1.0;
        _3207 = _3335;
        _3277 = _3313;
        _3279 = _3301;
        _3281 = _3295;
        _3283 = _3287;
    }
    float _3337 = _3207;
    float _3339 = _3277;
    float _3341 = _3279;
    float _3343 = _3281;
    float _3345 = _3283;
    float _3347 = _3203 * _3106;
    float _3349 = -_3203;
    float _3351 = _3349 + 1.0;
    out.m_82.x = _2784;
    out.m_82.y = _2782;
    out.m_82.z = _2786;
    bool _3353 = _2816 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3355 = isnan(_2816);
    bool _3357 = _3353 || _3355;
    bool _3359 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3361 = _3357 || _3359;
    float _3363 = _3117 * _3347;
    float _3365 = _3127 * _3347;
    float _3367 = _3117 * _3351;
    float _3369 = _3269 * _3337;
    float _3371 = fma(_3123, _3363, _3111);
    float _3373 = fma(_3125, _3363, _3113);
    float _3375 = fma(_3117, _3365, _3115);
    float _3377 = _3369 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_84.x = _3371;
    out.m_84.y = _3373;
    out.m_84.z = _3375;
    out.m_84.w = _3367;
    float _3379 = _545 * _3377;
    float _3381 = _3341;
    float _3383 = _3339;
    float _3385 = _3345;
    float _3387 = _3343;
    float _3389 = _3377;
    float _3391 = _3369;
    if (!_3361)
    {
        _3381 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3393 = _3381;
    float _3395 = _3393;
    float _3397 = _3393;
    if (!_3361)
    {
        _3383 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3399 = _3383;
    float _3401 = _3399;
    float _3403 = _3399;
    if (!_3361)
    {
        _3385 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3405 = _3385;
    float _3407 = _3405;
    float _3409 = _3405;
    if (!_3361)
    {
        _3387 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3411 = _3387;
    float _3413 = _3411;
    float _3415 = _3411;
    if (!_3361)
    {
        _3389 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3417 = _3389;
    float _3419 = _3417;
    float _3421 = _3417;
    if (!_3361)
    {
        _3391 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3423 = _3391;
    bool _3425 = !_3361;
    float _3427 = _3423;
    float _3429 = _3423;
    if (!_3425)
    {
        bool _3431 = _2816 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3433 = isnan(_2816);
        bool _3435 = _3431 || _3433;
        bool _3437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3439 = _3435 || _3437;
        if (!_3439)
        {
            float _3441 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3443 = _2816 + _3441;
            float _3445 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3447 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3445;
            float _3449 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3451 = _3449 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3453 = 1.0 / _3447;
            float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3457 = _3455 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3463 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3467 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3471 = _3443 * _3453;
            float _3473 = precise::clamp(_3471, 0.0, 1.0);
            float _3475 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3477 = _3475 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3479 = fma(_3473, _3451, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3481 = fma(_3473, _3477, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3483 = fma(_3473, _3457, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3485 = fma(_3473, _3461, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3487 = fma(_3473, _3465, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3489 = fma(_3473, _3469, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3403 = _3483;
            _3421 = _3487;
            _3397 = _3479;
            _3415 = _3485;
            _3409 = _3481;
            _3429 = _3489;
            _3491 = true;
        }
        else
        {
            bool _3493 = _2816 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3495 = isnan(_2816);
            bool _3497 = _3493 || _3495;
            bool _3499 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3501 = _3497 || _3499;
            if (!_3501)
            {
                _3395 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3503 = _3395;
            _3397 = _3503;
            if (!_3501)
            {
                _3401 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3505 = _3401;
            _3403 = _3505;
            if (!_3501)
            {
                _3407 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3507 = _3407;
            _3409 = _3507;
            if (!_3501)
            {
                _3413 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3509 = _3413;
            _3415 = _3509;
            if (!_3501)
            {
                _3419 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3511 = _3419;
            _3421 = _3511;
            if (!_3501)
            {
                _3427 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3513 = _3427;
            bool _3515 = !_3501;
            _3429 = _3513;
            if (!_3515)
            {
                bool _3517 = _2816 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3519 = isnan(_2816);
                bool _3521 = _3517 || _3519;
                bool _3523 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3525 = _3521 || _3523;
                if (!_3525)
                {
                    float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3529 = _2816 + _3527;
                    float _3531 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3533 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3531;
                    float _3535 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3537 = _3535 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3539 = 1.0 / _3533;
                    float _3541 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3543 = _3541 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3545 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3547 = _3545 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3549 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3551 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3555 = _3553 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3557 = _3529 * _3539;
                    float _3559 = precise::clamp(_3557, 0.0, 1.0);
                    float _3561 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3563 = _3561 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3565 = fma(_3559, _3537, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3567 = fma(_3559, _3563, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3569 = fma(_3559, _3543, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3571 = fma(_3559, _3547, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3573 = fma(_3559, _3551, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3575 = fma(_3559, _3555, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3403 = _3569;
                    _3421 = _3573;
                    _3397 = _3565;
                    _3415 = _3571;
                    _3409 = _3567;
                    _3429 = _3575;
                    _3491 = true;
                }
                else
                {
                    _3403 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3421 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3397 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3415 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3409 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3429 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3491 = false;
    float _3577 = _3403;
    float _3579 = _3421;
    float _3581 = _3397;
    float _3583 = _3415;
    float _3585 = _3409;
    float _3587 = _3429;
    float _3589 = fma(_2484, -0.5, 0.5);
    float _3591 = precise::clamp(_3589, 0.0, 1.0);
    float _3593 = -_3577;
    float _3595 = _3593 + _3579;
    float _3597 = -_3581;
    float _3599 = _3597 + _3583;
    out.m_86.x = 0.0;
    float _3601 = fma(_3591, _3595, _3577);
    float _3603 = -_3585;
    float _3605 = _3603 + _3587;
    float _3607 = fma(_3591, _3599, _3581);
    float _3609 = _3601 * 0.586610972881317138671875;
    bool _3611 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3613 = fma(_3591, _3605, _3585);
    float _3615 = _3379 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3617 = fma(_3607, 0.298911988735198974609375, _3609);
    bool _3619 = _3269 > 0.0;
    bool _3621 = isnan(_3269);
    bool _3623 = _3619 || _3621;
    bool _3625 = isnan(0.0);
    bool _3627 = _3623 || _3625;
    float _3629 = fma(_3613, 0.114477999508380889892578125, _3617);
    out.m_51.x = _3615;
    bool _3631 = _3337 <= 0.0;
    bool _3633 = !_3627;
    bool _3635 = _3631 || _3633;
    float _3637 = -_3629;
    float _3639 = _3607 + _3637;
    float _3641 = -_3629;
    float _3643 = _3601 + _3641;
    float _3645 = -_3629;
    float _3647 = _3613 + _3645;
    float _3649 = fma(_3639, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3629);
    float _3651 = fma(_3643, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3629);
    float _3653 = fma(_3647, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3629);
    bool _3655 = !_3611;
    if (!_3655)
    {
        float _3657 = -_2782;
        float _3659 = _3657 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3661 = -_2784;
        float _3663 = _3661 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3665 = -_2786;
        float _3667 = _3665 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3669 = _3659 * _3659;
        float _3671 = fma(_3663, _3663, _3669);
        float _3673 = fma(_3667, _3667, _3671);
        float _3675 = sqrt(_3673);
        float _3677 = rsqrt(_3673);
        float _3679 = -_3675;
        float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3683 = _3681 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3685 = precise::clamp(_3683, 0.0, 1.0);
        float _3687 = _3663 * _3677;
        float _3689 = _3659 * _3677;
        float _3691 = abs(_3685);
        float _3693 = log2(_3691);
        float _3695 = _3667 * _3677;
        float _3697 = _3687 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3699 = _2484 * _3689;
        float _3701 = -_3689;
        float _3703 = -_3697;
        float _3705 = fma(_3701, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3703);
        float _3707 = fma(_2496, _3687, _3699);
        float _3709 = -_3695;
        float _3711 = fma(_3709, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3705);
        float _3713 = fma(_2478, _3695, _3707);
        float _3715 = precise::clamp(_3713, 0.0, 1.0);
        float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3719 = _3711 + _3717;
        float _3721 = _3693 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3723 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3725 = precise::clamp(_3723, 0.0, 1.0);
        float _3727 = exp2(_3721);
        float _3729 = _3727 * _3725;
        float _3731 = _3715 * _3729;
        float _3733 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3735 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3737 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3733;
        out.m_86.y = _3735;
        out.m_86.z = _3737;
    }
    out.m_68.x = _3649;
    out.m_68.y = _3651;
    out.m_68.z = _3653;
    if (!_3635)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3739 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3739;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3491 = false;
    bool _677 = false;
    bool _575 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_44.w;
    float _102 = in.m_46.w;
    float _104 = trunc(_100);
    int _107 = int(_104);
    float _109 = -_102;
    float _111 = _109 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _111;
    bool _115 = _107 >= 1;
    float _117 = 0.0;
    float _119 = _102;
    float _121 = _111;
    if (!_115)
    {
        _117 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _117;
    if (!_115)
    {
        out.m_51.x = 0.0;
    }
    int _125 = 0;
    if (!_115)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_115)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3807 = as_type<float>(_129);
        out.gl_Position.z = _3807;
    }
    if (!_115)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _133 = _102 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_102);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = float(_107);
    bool _145 = _111 >= _143;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    if (_149)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _119;
    if (_149)
    {
        out.m_51.x = 0.0;
    }
    if (_149)
    {
        float _153 = _151 * 5.0;
        _131 = as_type<int>(_153);
    }
    int _155 = _131;
    if (_149)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3862 = as_type<float>(_155);
        out.gl_Position.z = _3862;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = in.m_53.x;
    float _159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _161 = _111 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _167 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _169 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _171 = _167 || _169;
    bool _173 = isnan(1.0);
    bool _175 = _171 || _173;
    float _177 = _161 * _159;
    float _179 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[20].x, _177);
    float _181 = in.m_46.x;
    float _183 = in.m_46.y;
    float _185 = in.m_46.z;
    float _187 = floor(_179);
    float _189 = _179 * 6.283185482025146484375;
    int _191 = as_type<int>(_163) & 1;
    bool _193 = _191 != 0;
    int _195 = as_type<int>(_163) & 2;
    bool _197 = _195 != 0;
    float _199 = _189 * 0.15915493667125701904296875;
    int _201 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _203 = _201 != 0;
    bool _205 = !_193;
    float _207 = _205 ? (-0.5) : 0.5;
    float _209 = _199 * 6.283185482025146484375;
    float _211 = cos(_209);
    bool _213 = !_197;
    float _215 = _213 ? (-0.5) : 0.5;
    float _217 = -_187;
    float _219 = _179 + _217;
    float _221 = _187;
    float _223 = _165;
    if (!_175)
    {
        float _225 = _165 * _165;
        float _227 = _225 * 0.5;
        _221 = _227;
    }
    float _229 = _221;
    float _231 = _229;
    if (!_175)
    {
        float _233 = _229 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _231 = _233;
    }
    float _235 = _231;
    bool _237 = !_175;
    float _239 = _235;
    if (!_237)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _251 = _165 * _243;
        float _253 = 1.0 / _247;
        float _255 = _249 * 0.693147182464599609375;
        float _257 = exp2(_251);
        float _259 = 1.0 / _255;
        float _261 = _257 + (-1.0);
        float _263 = -_261;
        float _265 = fma(_263, _259, _165);
        float _267 = _265 * _253;
        float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _239 = _269;
    }
    float _271 = _239;
    bool _273 = !_175;
    if (!_273)
    {
        float _275 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _277 = log2(_275);
        float _279 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _281 = _279 + 1.0;
        float _283 = 1.0 / _281;
        float _285 = _165 * _277;
        float _287 = exp2(_285);
        float _289 = -_287;
        float _291 = _289 + 1.0;
        float _293 = _291 * _283;
        _223 = _293;
    }
    float _295 = _223;
    float _297 = in.m_58.w;
    float _299 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _301 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _303 = in.m_44.x;
    float _305 = in.m_44.y;
    float _307 = in.m_44.z;
    float _309 = _299 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _311 = _299 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _313 = _299 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    bool _315 = _219 < 0.5;
    float _317 = float(_315);
    float _319 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].x, _309);
    float _321 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].y, _311);
    float _323 = fma(_301, (*spvDescriptorSet0.vp_c10)._m0[8].z, _313);
    float _325 = _271 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _327 = -_219;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _331 = fma(_211, 0.5, 0.5);
    float _333 = -_317;
    float _335 = fma(_333, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _337 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[10].x, _319);
    float _339 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[10].y, _321);
    float _341 = fma(_325, (*spvDescriptorSet0.vp_c10)._m0[10].z, _323);
    float _343 = _325;
    float _345 = _319;
    if (!_175)
    {
        float _347 = _111 * _111;
        float _349 = _347 * 0.5;
        _343 = _349;
    }
    float _351 = _343;
    float _353 = fma(_295, _181, _337);
    float _355 = fma(_295, _183, _339);
    float _357 = -_331;
    float _359 = fma(_357, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _361 = fma(_295, _185, _341);
    float _363 = _351;
    if (!_175)
    {
        _345 = _111;
    }
    float _365 = _345;
    float _367 = _365;
    if (!_175)
    {
        float _369 = _351 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _363 = _369;
    }
    float _371 = _363;
    bool _373 = !_175;
    float _375 = _371;
    if (!_373)
    {
        float _377 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _379 = log2(_377);
        float _381 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _383 = _381 + 1.0;
        float _385 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _387 = _111 * _379;
        float _389 = 1.0 / _383;
        float _391 = _385 * 0.693147182464599609375;
        float _393 = exp2(_387);
        float _395 = 1.0 / _391;
        float _397 = _393 + (-1.0);
        float _399 = -_397;
        float _401 = fma(_399, _395, _111);
        float _403 = _401 * _389;
        float _405 = _403 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _375 = _405;
    }
    float _407 = _375;
    bool _409 = !_175;
    if (!_409)
    {
        float _411 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _413 = log2(_411);
        float _415 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _417 = _415 + 1.0;
        float _419 = 1.0 / _417;
        float _421 = _111 * _413;
        float _423 = exp2(_421);
        float _425 = -_423;
        float _427 = _425 + 1.0;
        float _429 = _427 * _419;
        _367 = _429;
    }
    float _431 = _367;
    float _433 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _435 = fma(_353, _297, _303);
    float _437 = fma(_355, _297, _305);
    int _439 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _441 = _439 != 0;
    int _443 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _445 = _443 != 0;
    float _447 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _449 = _433 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _451 = fma(_361, _297, _307);
    float _453 = _433 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    bool _455 = !_441;
    int _457 = _455 ? 0 : 1;
    float _459 = _407 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _461 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[8].y, _449);
    float _463 = _433 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    int _465 = abs(_457);
    float _467 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[8].x, _453);
    float _469 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[10].y, _461);
    float _471 = fma(_447, (*spvDescriptorSet0.vp_c10)._m0[8].z, _463);
    bool _473 = !_203;
    int _475 = _473 ? 0 : 1;
    float _477 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[10].x, _467);
    float _479 = float(_465);
    float _481 = fma(_431, _183, _469);
    float _483 = fma(_459, (*spvDescriptorSet0.vp_c10)._m0[10].z, _471);
    int _485 = abs(_475);
    float _487 = 1.0 / _143;
    float _489 = abs(_329);
    float _491 = _479 * _489;
    bool _493 = !_445;
    int _495 = _493 ? 0 : 1;
    float _497 = fma(_431, _181, _477);
    bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _501 = -_481;
    float _503 = _355 + _501;
    float _505 = fma(_431, _185, _483);
    int _507 = abs(_495);
    float _509 = -_497;
    float _511 = _353 + _509;
    float _513 = _503 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _515 = float(_485);
    float _517 = _503 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _519 = _503 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _521 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[4].x, _513);
    float _523 = float(_507);
    float _525 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[5].x, _517);
    float _527 = fma(_511, (*spvDescriptorSet0.vp_c10)._m0[6].x, _519);
    float _529 = -_505;
    float _531 = _361 + _529;
    float _533 = fma(_515, _359, _491);
    float _535 = _111 * _487;
    float _537 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[4].z, _521);
    float _539 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[5].z, _525);
    float _541 = fma(_531, (*spvDescriptorSet0.vp_c10)._m0[6].z, _527);
    float _543 = abs(_335);
    float _545 = fma(_523, _543, _533);
    bool _547 = !_499;
    float _549 = _539;
    float _551 = _537;
    float _553 = _541;
    float _555 = _539;
    float _557 = _497;
    float _573;
    if (!_547)
    {
        float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _561 = _157 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _563 = fma(_561, (*spvDescriptorSet0.vp_c9)._m0[12].x, _111);
        float _565 = _563 * _559;
        float _567 = floor(_565);
        float _569 = -_567;
        float _571 = _565 + _569;
        _573 = _571;
        _575 = true;
    }
    else
    {
        _573 = _535;
    }
    _575 = false;
    float _577 = _573;
    float _579 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _581 = _577 + _579;
    float _583 = in.m_58.x;
    float _585 = in.m_58.y;
    bool _587 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _589 = isnan(_577);
    bool _591 = _587 || _589;
    bool _593 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _595 = _591 || _593;
    float _597 = float(_595);
    float _599 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _601 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _599;
    bool _603 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _605 = 1.0 / _601;
    float _607 = -_597;
    float _609 = _607 + 1.0;
    float _611 = _581 * _605;
    bool _613 = _577 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _615 = isnan(_577);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    float _625 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _627 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _625;
    float _629 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _631 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _629;
    float _633 = _623 * _609;
    float _635 = fma(_627, _611, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _637 = fma(_631, _611, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _639 = -_623;
    float _641 = _639 + 1.0;
    float _643 = _635 * _633;
    float _645 = _637 * _633;
    float _647 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].x, _643);
    float _649 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].y, _645);
    float _651 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[144].x, _647);
    float _653 = fma(_597, (*spvDescriptorSet0.vp_c9)._m0[144].y, _649);
    float _655 = _651 * _583;
    float _657 = _653 * _585;
    bool _659 = !_603;
    float _675;
    if (!_659)
    {
        float _661 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _663 = _157 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _665 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[11].y, _111);
        float _667 = _665 * _661;
        float _669 = floor(_667);
        float _671 = -_669;
        float _673 = _667 + _671;
        _675 = _673;
        _677 = true;
    }
    else
    {
        _675 = _535;
    }
    _677 = false;
    float _679 = _675;
    float _681 = in.m_53.y;
    float _683 = _157 * 2.0;
    float _685 = _655 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _687 = in.m_53.w;
    float _689 = _437 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _691 = floor(_683);
    float _693 = in.m_53.z;
    float _695 = _207 * _685;
    bool _697 = _157 > 0.5;
    float _699 = _657 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _703 = _701 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _705 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[5].x, _689);
    float _707 = _437 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _709 = _437 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _711 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _713 = _711 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _715 = 1.0 / _703;
    float _717 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[4].x, _707);
    bool _719 = _691 > 0.0;
    float _721 = _681 * 2.0;
    bool _723 = _691 >= 0.0;
    bool _725 = isnan(_691);
    bool _727 = _723 || _725;
    bool _729 = isnan(0.0);
    bool _731 = _727 || _729;
    float _733 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[6].x, _709);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    int _741 = _731 ? 0 : 1;
    float _743 = floor(_721);
    bool _745 = _687 > 0.5;
    float _747 = _215 * _699;
    int _749 = ~_741;
    int _751 = _749 + 1;
    int _753 = _751 + 1;
    float _755 = _681 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _757 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _759 = _757 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    int _761 = _753;
    float _763 = _695;
    float _765 = _747;
    if (!_719)
    {
        int _767 = ~_741;
        int _769 = _767 + 1;
        _761 = _769;
    }
    int _771 = _761;
    float _773 = 1.0 / _713;
    float _775 = -_215;
    int _777 = _745 ? as_type<int>(_775) : as_type<int>(_215);
    float _779 = fma(_755, -2.0, _739);
    float _781 = _157 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _783 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[5].z, _705);
    float _785 = 1.0 / _737;
    bool _787 = _743 >= 0.0;
    bool _789 = isnan(_743);
    bool _791 = _787 || _789;
    bool _793 = isnan(0.0);
    bool _795 = _791 || _793;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _801 = _743 > 0.0;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _805 = _795 ? 0 : 1;
    float _807 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _809 = _807 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    int _811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _813 = _811 != 0;
    float _815 = 1.0 / _759;
    float _817 = -_803;
    float _819 = fma(_781, 2.0, _817);
    int _821 = ~_805;
    int _823 = _821 + 1;
    int _825 = _823 + 1;
    int _827 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _829 = _827 != 0;
    float _831 = -_111;
    float _833 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[76].x, _819);
    int _835 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _837 = _835 != 0;
    float _839 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _841 = int(_839);
    int _843 = _825;
    float _845 = as_type<float>(_841);
    if (!_801)
    {
        int _847 = ~_805;
        int _849 = _847 + 1;
        _843 = _849;
    }
    int _851 = _843;
    bool _853 = _681 > 0.5;
    float _855 = 0.0;
    if (!_813)
    {
        _855 = _681;
    }
    float _857 = _855;
    float _859 = 0.0;
    float _861 = _857;
    if (!_813)
    {
        _859 = _693;
    }
    float _863 = _859;
    float _865 = 1.0 / _799;
    float _867 = 0.0;
    float _869 = _863;
    if (!_813)
    {
        _867 = _693;
    }
    float _871 = _867;
    float _873 = _871;
    if (_829)
    {
        float _875 = -_695;
        float _877 = _697 ? _875 : _695;
        _763 = _877;
    }
    float _879 = _763;
    int _881 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _883 = _881 != 0;
    bool _885 = _693 > 0.5;
    float _887 = 1.0 / _809;
    bool _889 = !_883;
    int _891 = _889 ? 0 : 1;
    float _893 = -_207;
    int _895 = _885 ? as_type<int>(_893) : as_type<int>(_207);
    if (_837)
    {
        float _897 = -_747;
        float _899 = _853 ? _897 : _747;
        _765 = _899;
    }
    float _901 = _765;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _905 = _903 != 0;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _909 = _907 != 0;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _913 = _911 != 0;
    float _915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _917 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _919 = _917 != 0;
    float _921 = _901 + (-0.5);
    int _923 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _925 = _923 != 0;
    bool _927 = !_813;
    float _929 = _927 ? 1.2345600128173828125 : 1.0;
    bool _931 = !_813;
    float _933 = _931 ? _681 : _157;
    bool _935 = !_919;
    float _937 = _935 ? _207 : as_type<float>(_895);
    if (_813)
    {
        _861 = _157;
    }
    float _939 = _861;
    float _941 = _929 * _933;
    bool _943 = !_925;
    float _945 = _943 ? _215 : as_type<float>(_777);
    float _947 = _681 + _693;
    if (_813)
    {
        _869 = _681;
    }
    float _949 = _869;
    float _951 = _915 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    if (_813)
    {
        _873 = _681;
    }
    float _953 = _873;
    bool _955 = !_909;
    int _957 = _955 ? 0 : 1;
    float _959 = _949 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    int _961 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _963 = _961 != 0;
    int _965 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _967 = _965 != 0;
    int _969 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _971 = _969 != 0;
    int _973 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _975 = _973 != 0;
    int _977 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _979 = _977 != 0;
    float _981 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[4].z, _717);
    float _983 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _983;
    float _987 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _989 = _987 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _991 = fma(_451, (*spvDescriptorSet0.vp_c10)._m0[6].z, _733);
    float _993 = _985 * _715;
    float _995 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _997 = _995 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _999 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1001 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _999;
    float _1003 = 1.0 / _989;
    float _1005 = _997 * _773;
    float _1007 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1009 = _1007 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1011 = _1001 * _785;
    float _1013 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1015 = _1013 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _1017 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1019 = log2(_1017);
    float _1021 = _1009 * _815;
    float _1023 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1025 = _1023 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1027 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1029 = _1027 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1033 = _1031 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1035;
    float _1039 = float(_841);
    float _1041 = _1029 * _865;
    float _1043 = 1.0 / _1015;
    float _1045 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1047 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1045;
    float _1049 = _157 + _681;
    float _1051 = _1037 * _887;
    float _1053 = _111 * _1039;
    float _1055 = _1047 * _1003;
    float _1057 = _1049 + (-1.0);
    float _1059 = _693 * 2.0;
    float _1061 = 1.0 / _1025;
    float _1063 = _1053 * _487;
    float _1065 = _111 * _1019;
    float _1067 = _991 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1069 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1071 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1069;
    bool _1073 = !_905;
    int _1075 = _1073 ? 0 : 1;
    float _1077 = 1.0 / _1033;
    float _1079 = float(uint(_841));
    float _1081 = _1071 * _1043;
    bool _1083 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1085 = isnan(_679);
    bool _1087 = _1083 || _1085;
    bool _1089 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1091 = _1087 || _1089;
    float _1093 = float(_1091);
    bool _1095 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _1097 = isnan(_535);
    bool _1099 = _1095 || _1097;
    bool _1101 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _1103 = _1099 || _1101;
    float _1105 = float(_1103);
    float _1107 = floor(_1059);
    float _1109 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1111 = _1109 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1113;
    bool _1117 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1119 = isnan(_535);
    bool _1121 = _1117 || _1119;
    bool _1123 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _1125 = _1121 || _1123;
    float _1127 = float(_1125);
    float _1129 = _1111 * _1061;
    float _1131 = fma(_1057, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1133 = _157 + _693;
    float _1135 = exp2(_1065);
    float _1137 = _1115 * _1077;
    float _1139 = _1133 + (-1.0);
    float _1141 = _947 + (-1.0);
    int _1143 = ~_841;
    int _1145 = _1143 + 1;
    float _1147 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _1149 = _1107 >= 0.0;
    bool _1151 = isnan(_1107);
    bool _1153 = _1149 || _1151;
    bool _1155 = isnan(0.0);
    bool _1157 = _1153 || _1155;
    float _1159 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1161 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1163 = fma(_1139, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    int _1165 = _1157 ? 0 : 1;
    float _1167 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[76].y, _779);
    bool _1169 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1171 = isnan(0.0);
    bool _1173 = _1169 || _1171;
    bool _1175 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1177 = _1173 || _1175;
    float _1179 = _879 + 0.5;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1183 = _679 + _1181;
    float _1185 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _1187 = int(_1185);
    float _1189 = -_1135;
    float _1191 = _1189 + 1.0;
    float _1193 = fma(_951, _1179, _833);
    float _1195 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1197 = _679 + _1195;
    float _1199 = fma(_993, _1183, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1203 = _679 + _1201;
    float _1205 = _1177 ? _1191 : 0.0;
    float _1207 = fma(_1005, _1197, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1209 = _1159 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1211 = _1107 > 0.0;
    float _1213 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1215 = _535 + _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1219 = _535 + _1217;
    float _1221 = -_1209;
    float _1223 = -_1167;
    float _1225 = fma(_1221, _921, _1223);
    float _1227 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1229 = _535 + _1227;
    float _1231 = fma(_1081, _1203, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1233 = fma(_1055, _1215, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1235 = float(_1187);
    float _1237 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1239 = _535 + _1237;
    float _1241 = fma(_1011, _1219, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    float _1243 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1245 = _535 + _1243;
    float _1247 = 1.0 / _1235;
    float _1249 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1251 = _535 + _1249;
    float _1253 = fma(_1129, _1229, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1255 = fma(_1021, _1239, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1257 = fma(_1051, _1245, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1259 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1261 = _535 + _1259;
    float _1263 = fma(_1137, _1251, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    bool _1265 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1267 = isnan(_535);
    bool _1269 = _1265 || _1267;
    bool _1271 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1273 = _1269 || _1271;
    float _1275 = float(_1273);
    float _1277 = 1.0 / _1079;
    float _1279 = fma(_1041, _1261, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1281 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1283 = isnan(_535);
    bool _1285 = _1281 || _1283;
    bool _1287 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1289 = _1285 || _1287;
    float _1291 = float(_1289);
    float _1293 = fma(_953, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1147);
    float _1295 = -_1275;
    float _1297 = _1295 + 1.0;
    bool _1299 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1301 = isnan(_679);
    bool _1303 = _1299 || _1301;
    bool _1305 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1307 = _1303 || _1305;
    float _1309 = float(_1307);
    bool _1311 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1313 = isnan(_679);
    bool _1315 = _1311 || _1313;
    bool _1317 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1319 = _1315 || _1317;
    float _1321 = float(_1319);
    float _1323 = _111 * _1247;
    bool _1325 = _679 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1327 = isnan(_679);
    bool _1329 = _1325 || _1327;
    bool _1331 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1333 = _1329 || _1331;
    float _1335 = float(_1333);
    float _1337 = _1291 * _1297;
    bool _1339 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1341 = isnan(_535);
    bool _1343 = _1339 || _1341;
    bool _1345 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1347 = _1343 || _1345;
    float _1349 = float(_1347);
    float _1351 = -_1291;
    float _1353 = _1351 + 1.0;
    bool _1355 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1357 = isnan(_535);
    bool _1359 = _1355 || _1357;
    bool _1361 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1363 = _1359 || _1361;
    float _1365 = float(_1363);
    float _1367 = trunc(_1323);
    int _1369 = int(_1367);
    bool _1371 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _1373 = isnan(_535);
    bool _1375 = _1371 || _1373;
    bool _1377 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _1379 = _1375 || _1377;
    float _1381 = float(_1379);
    float _1383 = -_1349;
    float _1385 = _1383 + 1.0;
    int _1387 = as_type<int>(_1277) + (-2);
    float _1389 = -_1365;
    float _1391 = _1389 + 1.0;
    bool _1393 = _535 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1395 = isnan(_535);
    bool _1397 = _1393 || _1395;
    bool _1399 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1401 = _1397 || _1399;
    float _1403 = float(_1401);
    float _1405 = _1349 * _1353;
    float _1407 = _1365 * _1385;
    float _1409 = -_1335;
    float _1411 = _1409 + 1.0;
    float _1413 = -_1321;
    float _1415 = _1413 + 1.0;
    float _1417 = _1403 * _1391;
    float _1419 = -_1403;
    float _1421 = _1419 + 1.0;
    float _1423 = _1321 * _1411;
    float _1425 = _1309 * _1415;
    float _1427 = -_1309;
    float _1429 = _1427 + 1.0;
    float _1431 = _1127 * _1421;
    float _1433 = float(uint(_1369));
    float _1435 = -_1127;
    float _1437 = _1435 + 1.0;
    float _1439 = _1093 * _1429;
    float _1441 = floor(_941);
    float _1443 = as_type<float>(_1387) * _1433;
    float _1445 = _1381 * _1437;
    float _1447 = -_1381;
    float _1449 = _1447 + 1.0;
    float _1451 = _1199 * _1439;
    float _1453 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1455 = 1.0 + _1453;
    float _1457 = _1105 * _1449;
    float _1459 = trunc(_1443);
    float _1461 = precise::max(_1459, 0.0);
    uint _1464 = uint(_1461);
    float _1466 = -_1105;
    float _1468 = _1466 + 1.0;
    float _1470 = -_1093;
    float _1472 = _1470 + 1.0;
    float _1474 = _1241 * _1457;
    float _1476 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1478 = fma(_1472, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1451);
    float _1480 = fma(_1468, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1474);
    float _1482 = 1.0 / _1455;
    float _1484 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1486 = -_1441;
    float _1488 = _941 + _1486;
    float _1490 = fma(_1207, _1425, _1478);
    float _1492 = fma(_939, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1484);
    float _1494 = _939 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1496 = _1488 * _1039;
    int _1498 = _1145 * int(_1464);
    int _1500 = _1498 + _1369;
    float _1502 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1504 = -_1476;
    float _1506 = fma(_1494, 2.0, _1504);
    bool _1508 = !_913;
    int _1510 = _1508 ? 0 : 1;
    float _1512 = fma(_1255, _1445, _1480);
    float _1514 = float(uint(_1500));
    float _1516 = fma(_959, -2.0, _1502);
    int _1518 = abs(_957);
    float _1520 = _1205 * _1482;
    float _1522 = float(_1369);
    float _1524 = as_type<float>(_1387) * _1514;
    int _1526 = ~_841;
    int _1528 = _1526 + 1;
    float _1530 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1516);
    bool _1532 = _1522 >= _1039;
    bool _1534 = isnan(_1522);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan(_1039);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = trunc(_1524);
    float _1546 = precise::max(_1544, 0.0);
    uint _1548 = uint(_1546);
    float _1550 = fma(_1231, _1423, _1490);
    int _1552 = abs(_1510);
    float _1554 = fma(_1233, _1431, _1512);
    float _1556 = float(_1518);
    float _1558 = _945 + (-0.5);
    int _1560 = ~_1165;
    int _1562 = _1560 + 1;
    int _1564 = _1562 + 1;
    float _1566 = trunc(_1496);
    int _1568 = int(_1566);
    int _1570 = _1564;
    if (!_1211)
    {
        int _1572 = ~_1165;
        int _1574 = _1572 + 1;
        _1570 = _1574;
    }
    int _1576 = _1570;
    float _1578 = -_1558;
    float _1580 = -_1530;
    float _1582 = fma(_1578, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1580);
    int _1584 = abs(_1075);
    float _1586 = fma(_1253, _1417, _1554);
    float _1588 = float(_851);
    float _1590 = _937 + 0.5;
    int _1592 = abs(_891);
    float _1594 = trunc(_1542);
    int _1596 = int(_1594);
    int _1598 = int(_1464) + int(_1548);
    float _1600 = -_111;
    float _1602 = fma(_1600, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1506);
    float _1604 = float(_771);
    float _1606 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1492);
    int _1608 = _1528 * _1598;
    int _1610 = _1608 + _1369;
    float _1612 = float(_1576);
    float _1614 = _1556 * _1604;
    float _1616 = float(_1584);
    float _1618 = trunc(_1063);
    int _1620 = int(_1618);
    bool _1622 = uint(_1610) >= uint(_841);
    float _1624 = _1614 * (-2.0);
    float _1626 = _1616 * _1612;
    float _1628 = in.m_60.x;
    float _1630 = in.m_60.y;
    float _1632 = in.m_60.z;
    bool _1634 = !_1622;
    int _1636 = _1634 ? 0 : (-1);
    float _1638 = fma(_1590, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1602);
    float _1640 = -_1606;
    float _1642 = _1640 + 1.0;
    int _1644 = ~_1598;
    int _1646 = _1644 + _1636;
    int _1648 = _1646 + 1;
    float _1650 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1550);
    bool _1652 = _841 == 0;
    int _1654 = _1568 * _1592;
    int _1656 = _1654 + _1369;
    float _1658 = _1626 * (-2.0);
    int _1660 = _841 * _1648;
    int _1662 = _1660 + _1369;
    float _1664 = fma(_1161, _1624, _1161);
    int _1666 = ~_1596;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = float(_1552);
    bool _1674 = !_1652;
    int _1676 = _1674 ? _1662 : (-1);
    float _1678 = _1672 * _1588;
    float _1680 = fma(_1624, _1630, _1630);
    float _1682 = fma(_1257, _1407, _1586);
    int _1684 = _1676 * _1670;
    float _1686 = _783 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1688 = fma(_1131, _1658, _1131);
    float _1690 = fma(_1658, _1628, _1628);
    float _1692 = _981 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1694 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1696 = _1686 + _1694;
    int _1698 = _841 + (-1);
    float _1700 = _1678 * (-2.0);
    bool _1702 = !_967;
    int _1704 = _1702 ? 0 : 1;
    float _1706 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1708 = _1692 + _1706;
    bool _1710 = !_963;
    int _1712 = _1710 ? 0 : 1;
    float _1714 = _1696 * _1696;
    int _1716 = abs(_1704);
    int _1718 = _1596 * _1698;
    int _1720 = _1718 + _1684;
    int _1722 = abs(_1712);
    float _1724 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1726 = _1067 + _1724;
    float _1728 = fma(_1708, _1708, _1714);
    bool _1730 = !_971;
    int _1732 = _1730 ? 0 : 1;
    int _1734 = _1720 * _1716;
    float _1736 = fma(_1163, _1700, _1163);
    float _1738 = fma(_1726, _1726, _1728);
    int _1740 = abs(_1732);
    int _1742 = _1620 * _1722;
    int _1744 = _1742 + _1734;
    float _1746 = sqrt(_1738);
    float _1748 = fma(_1700, _1632, _1632);
    bool _1750 = !_975;
    int _1752 = _1750 ? 0 : 1;
    float _1754 = fma(_1279, _1405, _1682);
    float _1756 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1758 = _157 + (-0.5);
    int _1760 = abs(_1752);
    float _1762 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1756);
    float _1764 = _681 + (-0.5);
    int _1766 = _1656 * _1740;
    int _1768 = _1766 + _1744;
    float _1770 = rsqrt(_1738);
    float _1772 = fma(_1764, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1680);
    int _1774 = _1568 * _1760;
    int _1776 = _1774 + _1768;
    float _1778 = _685 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    float _1780 = _1746 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    float _1782 = float(uint(_1656));
    float _1784 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1786 = float(uint(_1776));
    float _1788 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1690);
    float _1790 = precise::min(_1778, _1780);
    float _1792 = as_type<float>(_1387) * _1782;
    float _1794 = fma(_157, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1784);
    float _1796 = as_type<float>(_1387) * _1786;
    float _1798 = _693 + (-0.5);
    bool _1800 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1802 = isnan(1.0);
    bool _1804 = _1800 || _1802;
    bool _1806 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1808 = _1804 || _1806;
    float _1810 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1762);
    float _1812 = trunc(_1792);
    float _1814 = precise::max(_1812, 0.0);
    uint _1816 = uint(_1814);
    float _1818 = _1770 * _1790;
    bool _1820 = !_1808;
    float _1822 = _1820 ? _111 : _1520;
    float _1824 = fma(_1798, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1748);
    int _1826 = ~_841;
    int _1828 = _1826 + 1;
    float _1830 = _1696 * _1818;
    int _1832 = ~_841;
    int _1834 = _1832 + 1;
    float _1836 = fma(_1822, _1688, _1788);
    float _1838 = trunc(_1796);
    float _1840 = precise::max(_1838, 0.0);
    uint _1842 = uint(_1840);
    float _1844 = -_1830;
    float _1846 = _1696 + _1844;
    float _1848 = fma(_1822, _1664, _1772);
    float _1850 = _1836 * 0.15915493667125701904296875;
    float _1852 = fma(_1822, _1736, _1824);
    float _1854 = _1846 * _1846;
    float _1856 = _1848 * 0.15915493667125701904296875;
    float _1858 = -_1810;
    float _1860 = _1858 + 1.0;
    int _1862 = _1828 * int(_1816);
    int _1864 = _1862 + _1656;
    float _1866 = _1708 * _1818;
    float _1868 = _1726 * _1818;
    float _1870 = _1856 * 6.283185482025146484375;
    float _1872 = sin(_1870);
    float _1874 = fma(_1263, _1337, _1754);
    float _1876 = -_1866;
    float _1878 = _1708 + _1876;
    float _1880 = float(uint(_1864));
    float _1882 = -_1868;
    float _1884 = _1726 + _1882;
    int _1886 = _1834 * int(_1842);
    int _1888 = _1886 + _1776;
    float _1890 = fma(_1878, _1878, _1854);
    float _1892 = fma(_1275, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1874);
    float _1894 = _1856 * 6.283185482025146484375;
    float _1896 = cos(_1894);
    float _1898 = as_type<float>(_1387) * _1880;
    float _1900 = float(uint(_1888));
    float _1902 = fma(_1884, _1884, _1890);
    float _1904 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1794);
    float _1906 = fma(_111, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1293);
    float _1908 = _1852 * 0.15915493667125701904296875;
    float _1910 = -_1904;
    float _1912 = _1910 + 1.0;
    float _1914 = as_type<float>(_1387) * _1900;
    float _1916 = -_1906;
    float _1918 = _1916 + 1.0;
    float _1920 = fma(_1860, _901, _1225);
    float _1922 = -_1642;
    float _1924 = fma(_937, _1922, _1638);
    float _1926 = -_1912;
    float _1928 = fma(_1926, _879, _1193);
    float _1930 = trunc(_1914);
    float _1932 = precise::max(_1930, 0.0);
    uint _1934 = uint(_1932);
    float _1936 = fma(_945, _1918, _1582);
    float _1938 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1940 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1942 = sqrt(_1902);
    float _1944 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1946 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1948 = _1938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1950 = _1940 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1952 = _1944 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1954 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1956 = _1850 * 6.283185482025146484375;
    float _1958 = cos(_1956);
    int _1960 = int(_1842) + int(_1934);
    out.m_62.x = _1948;
    out.m_62.y = _1950;
    out.m_62.z = _1952;
    out.m_62.w = _1946;
    float _1962 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1964 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1966 = _1954 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1968 = _1650 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_64.x = _1928;
    out.m_64.y = _1920;
    out.m_64.z = _1924;
    out.m_64.w = _1936;
    float _1970 = _1908 * 6.283185482025146484375;
    float _1972 = cos(_1970);
    float _1974 = _1770 * _1942;
    float _1976 = _1962 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1978 = _1964 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1980 = _699 * _1974;
    float _1982 = _685 * _1974;
    float _1984 = _1850 * 6.283185482025146484375;
    float _1986 = sin(_1984);
    int _1988 = ~_841;
    int _1990 = _1988 + 1;
    float _1992 = _1958 * _1896;
    float _1994 = _1958 * _1872;
    out.m_66.x = _1976;
    out.m_66.y = _1978;
    out.m_66.z = _1966;
    out.m_66.w = _1968;
    float _1996 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _215);
    int _1998 = _1990 * _1960;
    int _2000 = _1998 + _1776;
    float _2002 = _1974 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2004 = _2002 * 0.5;
    float _2006 = _1908 * 6.283185482025146484375;
    float _2008 = sin(_2006);
    float _2010 = _1958 * _1972;
    float _2012 = _1980 * _1996;
    bool _2014 = uint(_2000) >= uint(_841);
    float _2016 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _207);
    float _2018 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2020 = _215 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2022 = trunc(_1898);
    float _2024 = precise::max(_2022, 0.0);
    uint _2026 = uint(_2024);
    float _2028 = _1986 * _1872;
    float _2030 = _1986 * _1896;
    float _2032 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2034 = _1986 * _1972;
    float _2036 = _1982 * _2016;
    float _2038 = _1896 * _1972;
    float _2040 = _1872 * _1972;
    float _2042 = fma(_2008, _1992, _2028);
    float _2044 = fma(_2008, _2028, _1992);
    float _2046 = _2010 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2048 = -_2008;
    float _2050 = fma(_2048, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2018);
    float _2052 = -_1994;
    float _2054 = fma(_2008, _2030, _2052);
    float _2056 = _2010 * _2012;
    float _2058 = -_2030;
    float _2060 = fma(_2008, _1994, _2058);
    float _2062 = -_2008;
    float _2064 = fma(_2062, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2032);
    float _2066 = -_2008;
    float _2068 = fma(_2066, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2046);
    float _2070 = -_2012;
    float _2072 = _2008 * _2070;
    float _2074 = _2034 * _2012;
    float _2076 = fma(_2042, _2036, _2056);
    int _2078 = int(_1816) + int(_2026);
    float _2080 = fma(_2038, _2036, _2072);
    bool _2082 = !_2014;
    int _2084 = _2082 ? 0 : (-1);
    float _2086 = fma(_2054, _2036, _2074);
    float _2088 = fma(_2060, _2004, _2076);
    float _2090 = fma(_2040, _2004, _2080);
    int _2092 = ~_1960;
    int _2094 = _2092 + _2084;
    int _2096 = _2094 + 1;
    float _2098 = fma(_2044, _2004, _2086);
    float _2100 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2102 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2104 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2050);
    int _2106 = _841 * _2096;
    int _2108 = _2106 + _1776;
    float _2110 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2100);
    float _2112 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2102);
    float _2114 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2064);
    float _2116 = fma(_2034, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2068);
    float _2118 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2110);
    bool _2120 = !_1652;
    int _2122 = _2120 ? _2108 : (-1);
    float _2124 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2112);
    float _2126 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2128 = _2118 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2130 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2132 = _2124 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2134 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2136 = _1067 + _2128;
    float _2138 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2126);
    float _2140 = _1692 + _2132;
    float _2142 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2130);
    float _2144 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2146 = _2136 + _2144;
    int _2148 = ~_841;
    int _2150 = _2148 + 1;
    float _2152 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2154 = _2140 + _2152;
    float _2156 = fma(_2038, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2134);
    float _2158 = _2146 * _2146;
    float _2160 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2162 = _2122 >> 31;
    float _2164 = _2088 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2166 = fma(_2154, _2154, _2158);
    int _2168 = _2150 * _2078;
    int _2170 = _2168 + _1656;
    float _2172 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2160);
    int _2174 = _2162 & 3;
    float _2176 = sqrt(_2166);
    float _2178 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2164);
    int _2180 = _2122 & 3;
    bool _2182 = _2180 != 0;
    float _2184 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2186 = _2060 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2188 = uint(_2170) >= uint(_841);
    float _2190 = _2020 * _2104;
    int _2192 = _2122 + _2174;
    float _2194 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2184);
    bool _2196 = uint(_2180) > 1u;
    float _2198 = fma(_2040, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2186);
    int _2200 = _2192 >> 2;
    float _2202 = fma(_2098, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2178);
    bool _2204 = !_2188;
    int _2206 = _2204 ? 0 : (-1);
    float _2208 = _2020 * _2114;
    int _2210 = _2122 & 3;
    bool _2212 = _2210 != 0;
    float _2214 = _2020 * _2116;
    int _2216 = _2200 << 4;
    int _2218 = _2216 + 512;
    float _2220 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2138);
    bool _2222 = _2176 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2224 = _2202 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    int _2226 = ~_2078;
    int _2228 = _2226 + _2206;
    int _2230 = _2228 + 1;
    uint _2232 = uint(int(uint(_2218) >> uint(2)));
    uint _2234 = uint(int(uint(int(_2232)) >> uint(2)));
    int _2236 = int(_2232) & 3;
    float _2238 = (*spvDescriptorSet0.vp_c9)._m0[int(_2234)][_2236];
    int _2240 = int(_2232) + 1;
    uint _2242 = uint(int(uint(_2240) >> uint(2)));
    int _2244 = _2240 & 3;
    float _2246 = (*spvDescriptorSet0.vp_c9)._m0[int(_2242)][_2244];
    int _2248 = _2212 ? 0 : 1;
    float _2250 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2142);
    float _2252 = fma(_2054, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2156);
    bool _2254 = uint(_2180) >= 2u;
    int _2256 = _841 * _2230;
    int _2258 = _2256 + _1656;
    bool _2260 = !_2182;
    float _2262 = _2260 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2264 = _1686 + _2224;
    int _2266 = _2218 + 8;
    uint _2268 = uint(int(uint(_2266) >> uint(2)));
    uint _2270 = uint(int(uint(int(_2268)) >> uint(2)));
    int _2272 = int(_2268) & 3;
    float _2274 = (*spvDescriptorSet0.vp_c9)._m0[int(_2270)][_2272];
    int _2276 = int(_2268) + 1;
    uint _2278 = uint(int(uint(_2276) >> uint(2)));
    int _2280 = _2276 & 3;
    float _2282 = (*spvDescriptorSet0.vp_c9)._m0[int(_2278)][_2280];
    int _2284 = _2254 ? 0 : 1;
    float _2286 = _2262;
    float _2288 = _1982;
    if (!_2222)
    {
        _845 = _2140;
    }
    float _2290 = _845;
    bool _2292 = _2180 != 3;
    int _2294 = ~_2284;
    int _2296 = _2294 + 1;
    int _2298 = _2296 + 1;
    int _2300 = ~_2248;
    int _2302 = _2300 + 1;
    int _2304 = _2302 + 1;
    int _2306 = _2304;
    float _2308 = _2290;
    int _2310 = _2298;
    if (!_2196)
    {
        int _2312 = ~_2248;
        int _2314 = _2312 + 1;
        _2306 = _2314;
    }
    int _2316 = _2306;
    int _2318 = abs(as_type<int>(_2262));
    int _2320 = abs(_2316);
    float _2322 = as_type<float>(_2320);
    if (!_2222)
    {
        _2286 = _2136;
    }
    float _2324 = _2286;
    int _2326 = ~_2320;
    int _2328 = _2326 + 1;
    int _2330 = _2328 + 1;
    float _2332 = _2324;
    if (!_2222)
    {
        _2322 = _2264;
    }
    float _2334 = _2322;
    bool _2336 = !_2222;
    float _2338 = _2334;
    if (!_2336)
    {
        float _2340 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2342 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2344 = _2176 + _2342;
        float _2346 = _2264 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2348 = rsqrt(_2166);
        float _2350 = _2344 * _2340;
        float _2352 = _2350 * 0.15915493667125701904296875;
        float _2354 = _2352 * 6.283185482025146484375;
        float _2356 = cos(_2354);
        float _2358 = _2352 * 6.283185482025146484375;
        float _2360 = sin(_2358);
        float _2362 = _2356 + (-1.0);
        float _2364 = _2362 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2366 = fma(_2360, _2346, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2368 = fma(_2264, _2356, _2364);
        float _2370 = _2348 * _2366;
        float _2372 = fma(_2154, _2370, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2374 = fma(_2146, _2370, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2308 = _2372;
        _2338 = _2368;
        _2332 = _2374;
    }
    float _2376 = _2308;
    float _2378 = _2338;
    float _2380 = _2332;
    float _2382 = _2380;
    if (_2292)
    {
        int _2384 = ~_2284;
        int _2386 = _2384 + 1;
        _2310 = _2386;
    }
    int _2388 = _2310;
    int _2390 = _2330 * as_type<int>(_2246);
    int _2392 = ~_2318;
    int _2394 = _2392 + 1;
    int _2396 = _2394 + 1;
    float _2398 = _207 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    bool _2400 = _2180 != 3;
    out.m_68.w = _1790;
    int _2402 = abs(_2388);
    int _2404 = _2396 * as_type<int>(_2238);
    int _2406 = _2404 + _2390;
    bool _2408 = !_2400;
    int _2410 = _2408 ? 0 : (-1);
    float _2412 = -_1692;
    float _2414 = _2412 + _2376;
    bool _2416 = !_979;
    int _2418 = _2416 ? 0 : 1;
    float _2420 = fma(_2398, _2220, _2190);
    float _2422 = fma(_2398, _2250, _2208);
    int _2424 = abs(_2410);
    float _2426 = -_1686;
    float _2428 = _2426 + _2378;
    int _2430 = abs(_2418);
    float _2432 = fma(_2398, _2252, _2214);
    int _2434 = ~_2402;
    int _2436 = _2434 + 1;
    int _2438 = _2436 + 1;
    float _2440 = _2428 * _2428;
    int _2442 = ~_2424;
    int _2444 = _2442 + 1;
    int _2446 = _2444 + 1;
    float _2448 = -_1067;
    float _2450 = _2448 + _2380;
    int _2452 = ~_2430;
    int _2454 = _2452 + 1;
    int _2456 = _2454 + 1;
    int _2458 = _2438 * as_type<int>(_2274);
    int _2460 = _2458 + _2406;
    float _2462 = fma(_2414, _2414, _2440);
    bool _2464 = !_1652;
    int _2466 = _2464 ? _2258 : (-1);
    float _2468 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2198);
    int _2470 = _2446 * as_type<int>(_2282);
    int _2472 = _2470 + _2460;
    float _2474 = fma(_2450, _2450, _2462);
    float _2476 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2172);
    float _2478 = _2468 + _2432;
    int _2480 = _2472 * _2456;
    float _2482 = sqrt(_2474);
    float _2484 = _2476 + _2422;
    out.m_70.x = _1892;
    int _2486 = _2466 * _2430;
    int _2488 = _2486 + _2480;
    float _2490 = fma(_2044, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2194);
    float _2492 = -_1866;
    float _2494 = _2492 + _2376;
    out.m_72.x = _1982;
    float _2496 = _2490 + _2420;
    float _2498 = float(_2488);
    float _2500 = -_1868;
    float _2502 = _2500 + _2380;
    float _2504 = -_1866;
    float _2506 = _1692 + _2504;
    float _2508 = -_1830;
    float _2510 = _2508 + _2378;
    out.m_74.x = _2496;
    out.m_74.y = _2484;
    out.m_74.z = _2478;
    float _2512 = -_1830;
    float _2514 = _1686 + _2512;
    bool _2516 = _2482 > 0.0;
    out.m_76.y = _2498;
    float _2518 = -_1868;
    float _2520 = _1067 + _2518;
    float _2522 = _2432;
    float _2524 = _2498;
    float _2526 = _2510;
    float _2528 = _2502;
    float _2530 = _2498;
    float _2532 = _2398;
    float _2534 = _2514;
    float _2536 = _2506;
    if (!_2516)
    {
        _2382 = _2494;
    }
    float _2538 = _2382;
    bool _2540 = !_2516;
    float _2542 = _2538;
    if (!_2540)
    {
        bool _2544 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2546 = _2538;
        if (_2544)
        {
            float _2548 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2546 = _2548;
        }
        float _2550 = _2546;
        float _2552 = _2550;
        if (_2544)
        {
            float _2554 = _537 * _2550;
            _2522 = _2554;
        }
        float _2556 = _2522;
        float _2558 = _2556;
        if (_2544)
        {
            float _2560 = _539 * _2550;
            _2288 = _2560;
        }
        float _2562 = _2288;
        float _2564 = _2562;
        if (_2544)
        {
            float _2566 = _541 * _2550;
            _2524 = _2566;
        }
        float _2568 = _2524;
        float _2570 = _2568;
        if (!_2544)
        {
            bool _2572 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2574 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2576 = _2572 || _2574;
            bool _2578 = isnan(1.0);
            bool _2580 = _2576 || _2578;
            float _2582 = _111 + 1.0;
            if (!_2580)
            {
                float _2584 = _2582 * _2582;
                float _2586 = _2584 * 0.5;
                _121 = _2586;
            }
            float _2588 = _121;
            float _2590 = _2588;
            if (!_2580)
            {
                float _2592 = _2588 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2590 = _2592;
            }
            float _2594 = _2590;
            bool _2596 = !_2580;
            float _2598 = _2594;
            if (!_2596)
            {
                float _2600 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2602 = log2(_2600);
                float _2604 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2606 = 1.0 + _2604;
                float _2608 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2610 = _2602 * _2582;
                float _2612 = 1.0 / _2606;
                float _2614 = _2608 * 0.693147182464599609375;
                float _2616 = exp2(_2610);
                float _2618 = 1.0 / _2614;
                float _2620 = _2616 + (-1.0);
                float _2622 = -_2620;
                float _2624 = fma(_2622, _2618, _2582);
                float _2626 = _2624 * _2612;
                float _2628 = _2626 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2598 = _2628;
            }
            float _2630 = _2598;
            float _2632 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2634 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2636 = _2630 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2638 = _2632 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2640 = _2632 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2642 = _2632 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2644 = fma(_2634, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2638);
            float _2646 = fma(_2634, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2640);
            float _2648 = _2640;
            if (!_2580)
            {
                _2648 = _2582;
            }
            float _2650 = _2648;
            float _2652 = fma(_2636, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2644);
            bool _2654 = !_2580;
            float _2656 = _2650;
            if (!_2654)
            {
                float _2658 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2660 = log2(_2658);
                float _2662 = _2660 * _2582;
                float _2664 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2666 = 1.0 + _2664;
                float _2668 = exp2(_2662);
                float _2670 = 1.0 / _2666;
                float _2672 = -_2668;
                float _2674 = _2672 + 1.0;
                float _2676 = _2674 * _2670;
                _2656 = _2676;
            }
            float _2678 = _2656;
            float _2680 = fma(_2634, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2642);
            float _2682 = fma(_2636, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2646);
            float _2684 = fma(_2678, _183, _2652);
            float _2686 = fma(_2636, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2680);
            float _2688 = fma(_2678, _181, _2682);
            float _2690 = -_481;
            float _2692 = _2690 + _2684;
            float _2694 = fma(_2678, _185, _2686);
            float _2696 = -_497;
            float _2698 = _2696 + _2688;
            float _2700 = _2692 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2702 = _2692 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2704 = _2692 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2706 = -_505;
            float _2708 = _2706 + _2694;
            float _2710 = fma(_2698, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2700);
            float _2712 = fma(_2698, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2702);
            float _2714 = fma(_2698, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2704);
            float _2716 = fma(_2708, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2710);
            float _2718 = fma(_2708, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2712);
            float _2720 = fma(_2708, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2714);
            _549 = _2718;
            _551 = _2716;
            _553 = _2720;
            _2558 = _2716;
            _2564 = _2718;
            _2570 = _2720;
            _2552 = _2680;
        }
        float _2722 = _549;
        float _2724 = _551;
        float _2726 = _553;
        float _2728 = _2558;
        float _2730 = _2564;
        float _2732 = _2570;
        float _2734 = _2552;
        float _2736 = _2722 * _2722;
        float _2738 = rsqrt(_2474);
        float _2740 = fma(_2724, _2724, _2736);
        float _2742 = fma(_2726, _2726, _2740);
        float _2744 = sqrt(_2742);
        float _2746 = _2414 * _2738;
        float _2748 = _2428 * _2738;
        float _2750 = _2450 * _2738;
        bool _2752 = _2744 > 0.0;
        float _2754 = _2734;
        _2530 = _2732;
        _2532 = _2742;
        _555 = _2722;
        if (!_2752)
        {
            _2754 = _2494;
        }
        float _2756 = _2754;
        bool _2758 = !_2752;
        _2542 = _2756;
        if (!_2758)
        {
            float _2760 = rsqrt(_2742);
            float _2762 = _2760 * _2722;
            float _2764 = _2760 * _2724;
            float _2766 = _2760 * _2726;
            float _2768 = _2748 * _2762;
            float _2770 = fma(_2746, _2764, _2768);
            float _2772 = fma(_2750, _2766, _2770);
            float _2774 = _2772 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2776 = fma(_2728, _2774, _2494);
            float _2778 = fma(_2730, _2774, _2510);
            float _2780 = fma(_2732, _2774, _2502);
            _2526 = _2778;
            _2542 = _2776;
            _2528 = _2780;
        }
    }
    float _2782 = _2526;
    float _2784 = _2542;
    float _2786 = _2528;
    float _2788 = _2530;
    float _2790 = _2532;
    float _2792 = _555;
    float _2794 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2796 = _2782 + _2794;
    float _2798 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2800 = _2784 + _2798;
    float _2802 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2804 = _2786 + _2802;
    float _2806 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2808 = _2796 * _2796;
    float _2810 = fma(_2800, _2800, _2808);
    float _2812 = fma(_2804, _2804, _2810);
    float _2814 = rsqrt(_2812);
    float _2816 = sqrt(_2812);
    float _2818 = _2814 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2820 = _2800 * _2818;
    float _2822 = _2804 * _2818;
    float _2824 = _2820 * _2820;
    float _2826 = _2822 * _2822;
    float _2828 = _2824 + _2826;
    float _2830 = sqrt(_2828);
    bool _2832 = _2830 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2834 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2836 = _2830 + _2834;
    float _2838 = _2788;
    float _2840 = _2828;
    float _2842 = _2836;
    float _2844 = _2790;
    float _2846 = _2796;
    float _2848 = _2792;
    float _2850 = _2820;
    if (_2832)
    {
        float _2852 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2838 = _2852;
    }
    float _2854 = _2838;
    if (_2832)
    {
        float _2856 = rsqrt(_2828);
        _2840 = _2856;
    }
    float _2858 = _2840;
    if (_2832)
    {
        float _2860 = _2836 * _2854;
        _2842 = _2860;
    }
    float _2862 = _2842;
    if (_2832)
    {
        float _2864 = _2862 * 0.15915493667125701904296875;
        _2844 = _2864;
    }
    float _2866 = _2844;
    float _2868 = _2804;
    if (_2832)
    {
        float _2870 = _2866 * 6.283185482025146484375;
        float _2872 = sin(_2870);
        _2868 = _2872;
    }
    float _2874 = _2868;
    float _2876 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2878 = precise::max(0.0, _2876);
    float _2880 = _2854;
    float _2882 = _2878;
    if (_2832)
    {
        float _2884 = _2866 * 6.283185482025146484375;
        float _2886 = cos(_2884);
        _2880 = _2886;
    }
    float _2888 = _2880;
    float _2890 = -_2818;
    float _2892 = -_2878;
    float _2894 = fma(_2796, _2890, _2892);
    if (_2832)
    {
        float _2896 = _2894 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2846 = _2896;
    }
    float _2898 = _2846;
    float _2900 = _2782 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2902 = _2874;
    float _2904 = _2898;
    if (_2832)
    {
        float _2906 = fma(_2874, _2898, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2902 = _2906;
    }
    float _2908 = _2902;
    float _2910 = _2908;
    if (!_2832)
    {
        _2904 = _2894;
    }
    float _2912 = _2904;
    float _2914 = fma(_2784, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2900);
    float _2916 = _2912;
    float _2918 = _2888;
    if (_2832)
    {
        float _2920 = _2888 + (-1.0);
        _2882 = _2920;
    }
    float _2922 = _2882;
    float _2924 = _2922;
    if (_2832)
    {
        float _2926 = _2858 * _2908;
        _2848 = _2926;
    }
    float _2928 = _2848;
    if (!_2832)
    {
        _2910 = _2824;
    }
    float _2930 = _2910;
    float _2932 = _2782 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2934 = _2930;
    if (_2832)
    {
        float _2936 = _2922 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _557 = _2936;
    }
    float _2938 = _557;
    if (_2832)
    {
        float _2940 = _2820 * _2928;
        _2850 = _2940;
    }
    float _2942 = _2850;
    if (!_2832)
    {
        _2924 = _2822;
    }
    float _2944 = _2924;
    float _2946 = _2944;
    if (_2832)
    {
        float _2948 = _2822 * _2928;
        _2946 = _2948;
    }
    float _2950 = _2946;
    if (_2832)
    {
        float _2952 = fma(_2894, _2888, _2938);
        _2916 = _2952;
    }
    float _2954 = _2916;
    if (_2832)
    {
        float _2956 = _2942 * _2942;
        _2934 = _2956;
    }
    float _2958 = _2934;
    if (!_2832)
    {
        _2918 = _2826;
    }
    float _2960 = _2918;
    float _2962 = _2960;
    if (_2832)
    {
        float _2964 = _2950 * _2950;
        _2962 = _2964;
    }
    float _2966 = _2962;
    float _2968 = fma(_2784, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2932);
    float _2970 = fma(_2954, _2954, _2958);
    float _2972 = _2782 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2974 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2968);
    float _2976 = _2970 + _2966;
    float _2978 = _2782 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2980 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2914);
    float _2982 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2984 = fma(_2816, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2982);
    float _2986 = precise::clamp(_2984, 0.0, 1.0);
    float _2988 = _2974 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2990 = fma(_2784, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2978);
    float _2992 = rsqrt(_2976);
    float _2994 = -_2986;
    float _2996 = _2994 + 1.0;
    float _2998 = fma(_2784, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2972);
    float _3000 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2990);
    float _3002 = _2988 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3004 = _2980 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3006 = fma(_2786, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2998);
    float _3008 = _3000 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3010 = abs(_2996);
    float _3012 = log2(_3010);
    float _3014 = _3006 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3016 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3002);
    float _3018 = _3004 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3020 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3016);
    float _3022 = _2992 * _2942;
    float _3024 = _2992 * _2954;
    float _3026 = _2992 * _2950;
    float _3028 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3020);
    float _3030 = _3022 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3032 = -_3018;
    float _3034 = fma(_3032, _2806, 1.0);
    float _3036 = _3024 + 1.0;
    float _3038 = 1.0 / _3028;
    float _3040 = -_3030;
    float _3042 = fma(_3024, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3040);
    float _3044 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3046 = _2988 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3048 = -_3026;
    float _3050 = fma(_3048, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3042);
    float _3052 = _2988 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3054 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3046);
    float _3056 = exp2(_3044);
    float _3058 = fma(_3050, -0.5, 0.5);
    float _3060 = fma(_3050, 0.5, 0.5);
    float _3062 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3052);
    float _3064 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3054);
    float _3066 = fma(_3060, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3068 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3062);
    float _3070 = log2(_3034);
    float _3072 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3064);
    float _3074 = fma(_3060, _3066, -0.212114393711090087890625);
    float _3076 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3068);
    float _3078 = fma(_3060, _3074, 1.570728778839111328125);
    float _3080 = _3076 * _3038;
    float _3082 = sqrt(_3058);
    float _3084 = -_3024;
    float _3086 = fma(_3056, _3036, _3084);
    float _3088 = _3072 * _3038;
    float _3090 = fma(_3080, 0.5, 0.5);
    float _3092 = fma(_3086, 0.5, 0.5);
    float _3094 = fma(_3088, -0.5, 0.5);
    float _3096 = _3070 * 0.693147182464599609375;
    float _3098 = _3096 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3100 = _3082 * 0.636619746685028076171875;
    float _3102 = -_3078;
    float _3104 = fma(_3100, _3102, 1.0);
    float3 _8435 = float3(_3090, _3094, _3098);
    float _3106 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8435, float3(0.0), isnan(_8435)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8435, float3(0.0), isnan(_8435)), level(0.0)).x;
    float3 _8446 = float3(_3090, _3094, _3098);
    float4 _3109 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8446, float3(0.0), isnan(_8446)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8446, float3(0.0), isnan(_8446)), level(0.0)).xyzw;
    float _3111 = _3109.x;
    float _3113 = _3109.y;
    float _3115 = _3109.z;
    float _3117 = _3109.w;
    float2 _8463 = float2(_3104, _3092);
    float3 _3121 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8463, float2(0.0), isnan(_8463)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8463, float2(0.0), isnan(_8463)), level(0.0)).xyz;
    float _3123 = _3121.x;
    float _3125 = _3121.y;
    float _3127 = _3121.z;
    float _3129 = _2514 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3131 = _3012 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_78.x = _2506;
    out.m_78.y = _2514;
    out.m_78.z = _2520;
    bool _3133 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3135 = isnan(0.5);
    bool _3137 = _3133 || _3135;
    bool _3139 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3141 = _3137 || _3139;
    float _3143 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3129);
    float _3145 = exp2(_3131);
    float _3147 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3143);
    float _3149 = _2514 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3151 = _3147 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3153 = fma(_2506, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3149);
    float _3155 = _2988 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3157 = 1.0 / _3151;
    float _3159 = fma(_2520, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3153);
    float _3161 = fma(_3008, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3155);
    float _3163 = _3076 + _3028;
    float _3165 = _3159 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3167 = fma(_3004, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3161);
    float _3169 = _3163 * 0.5;
    float _3171 = _3165 + _3151;
    float _3173 = fma(_3014, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3167);
    float _3175 = -_3145;
    float _3177 = _3175 + 1.0;
    float _3179 = _3145;
    float _3181 = _3173;
    float _3183 = _3028;
    if (_3141)
    {
        _3179 = 1.0;
    }
    float _3185 = _3179;
    float _3187 = _3173 + _3028;
    out.gl_Position.x = _3076;
    out.gl_Position.y = _3072;
    out.gl_Position.z = _3173;
    out.gl_Position.w = _3028;
    float _3189 = _3171 * _3157;
    float _3191 = _3189 * 0.5;
    float _3193 = _3028 * 0.5;
    float _3195 = _3187 * 0.5;
    float _3197 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _3199 = fma(_3191, (*spvDescriptorSet0.vp_c8)._m0[30].w, _3197);
    float _3201 = fma(_3072, -0.5, _3193);
    float _3203 = _3177 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3205 = _3193;
    float _3207 = _3185;
    if (_3141)
    {
        _3205 = 1.0;
    }
    float _3209 = _3205;
    out.m_80.x = _3169;
    out.m_80.y = _3201;
    out.m_80.z = _3195;
    out.m_80.w = _3028;
    float _3211 = 1.0 / _3199;
    float _3213 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _3215 = _3211 * _3213;
    float _3217 = _3209;
    if (!_3141)
    {
        float _3219 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3221 = _3219 * 0.15915493667125701904296875;
        float _3223 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3225 = _3221 * 6.283185482025146484375;
        float _3227 = cos(_3225);
        float _3229 = _3223 * 0.15915493667125701904296875;
        float _3231 = _3221 * 6.283185482025146484375;
        float _3233 = sin(_3231);
        float _3235 = 1.0 / _3227;
        float _3237 = _3229 * 6.283185482025146484375;
        float _3239 = cos(_3237);
        float _3241 = _3233 * _3235;
        float _3243 = _3229 * 6.283185482025146484375;
        float _3245 = sin(_3243);
        float _3247 = _3239 * _3241;
        float _3249 = 1.0 / _3247;
        float _3251 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3253 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3251;
        float _3255 = 1.0 / _3253;
        float _3257 = _3245 * _3249;
        float _3259 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3261 = fma(_3215, _3257, _3259);
        float _3263 = _3261 * _3255;
        float _3265 = precise::clamp(_3263, 0.0, 1.0);
        _2534 = _3255;
        _3217 = _3265;
        _2536 = _3229;
        _3181 = _3253;
        _3183 = _3235;
    }
    float _3267 = _2534;
    float _3269 = _3217;
    float _3271 = _2536;
    float _3273 = _3181;
    float _3275 = _3183;
    float _3277 = _3271;
    float _3279 = _3267;
    float _3281 = _3273;
    float _3283 = _3275;
    if (!_3141)
    {
        float _3285 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3287 = _3285 * 0.15915493667125701904296875;
        float _3289 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3291 = _3287 * 6.283185482025146484375;
        float _3293 = cos(_3291);
        float _3295 = _3289 * 0.15915493667125701904296875;
        float _3297 = _3287 * 6.283185482025146484375;
        float _3299 = sin(_3297);
        float _3301 = 1.0 / _3293;
        float _3303 = _3295 * 6.283185482025146484375;
        float _3305 = cos(_3303);
        float _3307 = _3299 * _3301;
        float _3309 = _3295 * 6.283185482025146484375;
        float _3311 = sin(_3309);
        float _3313 = _3305 * _3307;
        float _3315 = 1.0 / _3313;
        float _3317 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3319 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3317;
        float _3321 = 1.0 / _3319;
        float _3323 = _3311 * _3315;
        float _3325 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3327 = fma(_3215, _3323, _3325);
        float _3329 = _3327 * _3321;
        float _3331 = precise::clamp(_3329, 0.0, 1.0);
        float _3333 = -_3331;
        float _3335 = _3333 + 1.0;
        _3207 = _3335;
        _3277 = _3313;
        _3279 = _3301;
        _3281 = _3295;
        _3283 = _3287;
    }
    float _3337 = _3207;
    float _3339 = _3277;
    float _3341 = _3279;
    float _3343 = _3281;
    float _3345 = _3283;
    float _3347 = _3203 * _3106;
    float _3349 = -_3203;
    float _3351 = _3349 + 1.0;
    out.m_82.x = _2784;
    out.m_82.y = _2782;
    out.m_82.z = _2786;
    bool _3353 = _2816 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3355 = isnan(_2816);
    bool _3357 = _3353 || _3355;
    bool _3359 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3361 = _3357 || _3359;
    float _3363 = _3117 * _3347;
    float _3365 = _3127 * _3347;
    float _3367 = _3117 * _3351;
    float _3369 = _3269 * _3337;
    float _3371 = fma(_3123, _3363, _3111);
    float _3373 = fma(_3125, _3363, _3113);
    float _3375 = fma(_3117, _3365, _3115);
    float _3377 = _3369 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.m_84.x = _3371;
    out.m_84.y = _3373;
    out.m_84.z = _3375;
    out.m_84.w = _3367;
    float _3379 = _545 * _3377;
    float _3381 = _3341;
    float _3383 = _3339;
    float _3385 = _3345;
    float _3387 = _3343;
    float _3389 = _3377;
    float _3391 = _3369;
    if (!_3361)
    {
        _3381 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3393 = _3381;
    float _3395 = _3393;
    float _3397 = _3393;
    if (!_3361)
    {
        _3383 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3399 = _3383;
    float _3401 = _3399;
    float _3403 = _3399;
    if (!_3361)
    {
        _3385 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3405 = _3385;
    float _3407 = _3405;
    float _3409 = _3405;
    if (!_3361)
    {
        _3387 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3411 = _3387;
    float _3413 = _3411;
    float _3415 = _3411;
    if (!_3361)
    {
        _3389 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3417 = _3389;
    float _3419 = _3417;
    float _3421 = _3417;
    if (!_3361)
    {
        _3391 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3423 = _3391;
    bool _3425 = !_3361;
    float _3427 = _3423;
    float _3429 = _3423;
    if (!_3425)
    {
        bool _3431 = _2816 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3433 = isnan(_2816);
        bool _3435 = _3431 || _3433;
        bool _3437 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3439 = _3435 || _3437;
        if (!_3439)
        {
            float _3441 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3443 = _2816 + _3441;
            float _3445 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3447 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3445;
            float _3449 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3451 = _3449 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3453 = 1.0 / _3447;
            float _3455 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3457 = _3455 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3459 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3461 = _3459 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3463 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3465 = _3463 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3467 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3469 = _3467 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3471 = _3443 * _3453;
            float _3473 = precise::clamp(_3471, 0.0, 1.0);
            float _3475 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3477 = _3475 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3479 = fma(_3473, _3451, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3481 = fma(_3473, _3477, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3483 = fma(_3473, _3457, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3485 = fma(_3473, _3461, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3487 = fma(_3473, _3465, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3489 = fma(_3473, _3469, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3403 = _3483;
            _3421 = _3487;
            _3397 = _3479;
            _3415 = _3485;
            _3409 = _3481;
            _3429 = _3489;
            _3491 = true;
        }
        else
        {
            bool _3493 = _2816 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3495 = isnan(_2816);
            bool _3497 = _3493 || _3495;
            bool _3499 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3501 = _3497 || _3499;
            if (!_3501)
            {
                _3395 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3503 = _3395;
            _3397 = _3503;
            if (!_3501)
            {
                _3401 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3505 = _3401;
            _3403 = _3505;
            if (!_3501)
            {
                _3407 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3507 = _3407;
            _3409 = _3507;
            if (!_3501)
            {
                _3413 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3509 = _3413;
            _3415 = _3509;
            if (!_3501)
            {
                _3419 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3511 = _3419;
            _3421 = _3511;
            if (!_3501)
            {
                _3427 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3513 = _3427;
            bool _3515 = !_3501;
            _3429 = _3513;
            if (!_3515)
            {
                bool _3517 = _2816 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3519 = isnan(_2816);
                bool _3521 = _3517 || _3519;
                bool _3523 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3525 = _3521 || _3523;
                if (!_3525)
                {
                    float _3527 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3529 = _2816 + _3527;
                    float _3531 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3533 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3531;
                    float _3535 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3537 = _3535 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3539 = 1.0 / _3533;
                    float _3541 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3543 = _3541 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3545 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3547 = _3545 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3549 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3551 = _3549 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3553 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3555 = _3553 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3557 = _3529 * _3539;
                    float _3559 = precise::clamp(_3557, 0.0, 1.0);
                    float _3561 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3563 = _3561 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3565 = fma(_3559, _3537, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3567 = fma(_3559, _3563, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3569 = fma(_3559, _3543, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3571 = fma(_3559, _3547, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3573 = fma(_3559, _3551, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3575 = fma(_3559, _3555, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3403 = _3569;
                    _3421 = _3573;
                    _3397 = _3565;
                    _3415 = _3571;
                    _3409 = _3567;
                    _3429 = _3575;
                    _3491 = true;
                }
                else
                {
                    _3403 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3421 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3397 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3415 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3409 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3429 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3491 = false;
    float _3577 = _3403;
    float _3579 = _3421;
    float _3581 = _3397;
    float _3583 = _3415;
    float _3585 = _3409;
    float _3587 = _3429;
    float _3589 = fma(_2484, -0.5, 0.5);
    float _3591 = precise::clamp(_3589, 0.0, 1.0);
    float _3593 = -_3577;
    float _3595 = _3593 + _3579;
    float _3597 = -_3581;
    float _3599 = _3597 + _3583;
    out.m_86.x = 0.0;
    float _3601 = fma(_3591, _3595, _3577);
    float _3603 = -_3585;
    float _3605 = _3603 + _3587;
    float _3607 = fma(_3591, _3599, _3581);
    float _3609 = _3601 * 0.586610972881317138671875;
    bool _3611 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3613 = fma(_3591, _3605, _3585);
    float _3615 = _3379 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3617 = fma(_3607, 0.298911988735198974609375, _3609);
    bool _3619 = _3269 > 0.0;
    bool _3621 = isnan(_3269);
    bool _3623 = _3619 || _3621;
    bool _3625 = isnan(0.0);
    bool _3627 = _3623 || _3625;
    float _3629 = fma(_3613, 0.114477999508380889892578125, _3617);
    out.m_51.x = _3615;
    bool _3631 = _3337 <= 0.0;
    bool _3633 = !_3627;
    bool _3635 = _3631 || _3633;
    float _3637 = -_3629;
    float _3639 = _3607 + _3637;
    float _3641 = -_3629;
    float _3643 = _3601 + _3641;
    float _3645 = -_3629;
    float _3647 = _3613 + _3645;
    float _3649 = fma(_3639, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3629);
    float _3651 = fma(_3643, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3629);
    float _3653 = fma(_3647, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3629);
    bool _3655 = !_3611;
    if (!_3655)
    {
        float _3657 = -_2782;
        float _3659 = _3657 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3661 = -_2784;
        float _3663 = _3661 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3665 = -_2786;
        float _3667 = _3665 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3669 = _3659 * _3659;
        float _3671 = fma(_3663, _3663, _3669);
        float _3673 = fma(_3667, _3667, _3671);
        float _3675 = sqrt(_3673);
        float _3677 = rsqrt(_3673);
        float _3679 = -_3675;
        float _3681 = _3679 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3683 = _3681 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3685 = precise::clamp(_3683, 0.0, 1.0);
        float _3687 = _3663 * _3677;
        float _3689 = _3659 * _3677;
        float _3691 = abs(_3685);
        float _3693 = log2(_3691);
        float _3695 = _3667 * _3677;
        float _3697 = _3687 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3699 = _2484 * _3689;
        float _3701 = -_3689;
        float _3703 = -_3697;
        float _3705 = fma(_3701, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3703);
        float _3707 = fma(_2496, _3687, _3699);
        float _3709 = -_3695;
        float _3711 = fma(_3709, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3705);
        float _3713 = fma(_2478, _3695, _3707);
        float _3715 = precise::clamp(_3713, 0.0, 1.0);
        float _3717 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3719 = _3711 + _3717;
        float _3721 = _3693 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3723 = _3719 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3725 = precise::clamp(_3723, 0.0, 1.0);
        float _3727 = exp2(_3721);
        float _3729 = _3727 * _3725;
        float _3731 = _3715 * _3729;
        float _3733 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3735 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3737 = _3731 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _3733;
        out.m_86.y = _3735;
        out.m_86.z = _3737;
    }
    out.m_68.x = _3649;
    out.m_68.y = _3651;
    out.m_68.z = _3653;
    if (!_3635)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3739 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3739;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

