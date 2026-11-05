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
    float4 m_64 [[user(locn0)]];
    float4 m_68 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_66 [[user(locn4)]];
    float4 m_70 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_58 [[attribute(2)]];
    float4 m_62 [[attribute(3)]];
    float4 m_44 [[attribute(5)]];
    float4 m_49 [[attribute(6)]];
    float4 m_56 [[attribute(7)]];
    float4 m_54 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1177 = false;
    bool _597 = false;
    bool _303 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1765 = as_type<float>(_105);
        out.gl_Position.z = _1765;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1834 = as_type<float>(_141);
        out.gl_Position.z = _1834;
    }
    if (_133)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_54.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_49.x;
    float _161 = in.m_49.y;
    float _163 = in.m_49.z;
    float _165 = in.m_44.x;
    float _167 = in.m_44.y;
    float _169 = in.m_44.z;
    float _171 = 0.0;
    float _173 = _145;
    if (!_157)
    {
        float _175 = _145 * _145;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = _179;
    if (!_157)
    {
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_157;
    float _205 = _185;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _145 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _145);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_157;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _145 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _173 = _259;
    }
    float _261 = _173;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _265 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _271 = fma(_261, _159, _265);
    float _273 = fma(_261, _161, _267);
    float _275 = fma(_261, _163, _269);
    float _277 = fma(_271, _147, _165);
    float _279 = fma(_273, _147, _167);
    float _281 = fma(_275, _147, _169);
    bool _283 = !_263;
    float _301;
    if (!_283)
    {
        float _285 = in.m_56.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        float _305 = float(_89);
        float _307 = 1.0 / _305;
        float _309 = _123 * _307;
        _301 = _309;
    }
    _303 = false;
    float _311 = _301;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _333 = 1.0 / _319;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _335;
    float _339 = 1.0 / _327;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = _311 + _341;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _347 = 1.0 / _323;
    float _349 = _343 * _333;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _353 = _311 + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _357 = _311 + _355;
    bool _359 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _361 = isnan(_311);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = 1.0 / _331;
    float _373 = _353 * _339;
    bool _375 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _377 = isnan(_311);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    bool _387 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _389 = isnan(_311);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    bool _399 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _401 = isnan(_311);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = 1.0 / _337;
    float _413 = _315 * _347;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _417 = _311 + _415;
    float _419 = -_385;
    float _421 = _419 + 1.0;
    float _423 = _409 * _421;
    float _425 = _417 * _371;
    float _427 = -_397;
    float _429 = _427 + 1.0;
    float _431 = -_409;
    float _433 = _431 + 1.0;
    bool _435 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _437 = isnan(_311);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    float _451 = _385 * _429;
    bool _453 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _455 = isnan(_311);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = _369 * _433;
    float _467 = _357 * _411;
    float _469 = -_369;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = fma(_449, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _487 = -_445;
    float _489 = _487 + 1.0;
    float _491 = fma(_475, _413, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _493 = fma(_481, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _495 = _445 * _471;
    float _497 = _463 * _489;
    float _499 = fma(_485, _413, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _501 = -_463;
    float _503 = _501 + 1.0;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _505;
    float _509 = _493 * _497;
    float _511 = _477 * _497;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _513;
    float _517 = fma(_507, _373, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[143].x, _509);
    float _521 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[143].y, _511);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _527 = in.m_54.x;
    float _529 = in.m_54.y;
    float _531 = fma(_515, _373, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _537 = fma(_525, _425, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _539 = fma(_499, _495, _519);
    float _541 = fma(_491, _495, _521);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _543;
    float _547 = fma(_535, _425, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _549 = fma(_517, _465, _539);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _551;
    float _555 = fma(_531, _465, _541);
    float _557 = fma(_545, _467, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _559 = fma(_537, _423, _549);
    float _561 = fma(_553, _467, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _563 = fma(_547, _423, _555);
    float _565 = fma(_557, _451, _559);
    float _567 = fma(_561, _451, _563);
    float _569 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[148].x, _565);
    float _571 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[148].y, _567);
    float _573 = _569 * _527;
    float _575 = _571 * _529;
    bool _577 = !_345;
    float _595;
    if (!_577)
    {
        float _579 = in.m_56.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        float _599 = float(_89);
        float _601 = 1.0 / _599;
        float _603 = _123 * _601;
        _595 = _603;
    }
    _597 = false;
    float _605 = _595;
    float _607 = in.m_58.x;
    float _609 = in.m_58.y;
    float _611 = in.m_58.z;
    float _613 = _575 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _615 = in.m_60.x;
    float _617 = in.m_60.y;
    float _619 = in.m_60.z;
    float _621 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _623 = in.m_62.x;
    float _625 = in.m_62.y;
    float _627 = in.m_62.z;
    float _629 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _621);
    float _631 = in.m_56.x;
    float _633 = in.m_56.y;
    float _635 = in.m_56.z;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _639 = _637 != 0;
    float _641 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _629);
    float _643 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _647 = _645 != 0;
    float _649 = _573 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _651 = sqrt(_641);
    float _653 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _643);
    float _655 = _279 * _609;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _661 = _279 * _617;
    float _663 = fma(_277, _607, _655);
    float _665 = 1.0 / _659;
    float _667 = _279 * _625;
    float _669 = fma(_277, _615, _661);
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _673 = fma(_277, _623, _667);
    float _675 = fma(_281, _619, _669);
    float _677 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[79].z, _671);
    float _679 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _681 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _653);
    float _683 = _631 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _685 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _679);
    float _687 = rsqrt(_641);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _691 = _631 > 0.5;
    float _693 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _685);
    float _695 = -_689;
    float _697 = fma(_683, 2.0, _695);
    float _699 = _633 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _701 = sqrt(_681);
    float _703 = fma(_281, _611, _663);
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _707 = fma(_281, _627, _673);
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _711 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[78].z, _705);
    float _713 = sqrt(_693);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _719 = fma(_699, -2.0, _709);
    float _721 = _197 * _687;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _725 = -_197;
    int _727 = _691 ? as_type<int>(_725) : as_type<int>(_197);
    float _729 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _677);
    float _731 = rsqrt(_681);
    float _733 = precise::max(_651, _701);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _739 = _729 * (-0.15915493667125701904296875);
    float _741 = _675 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _743 = _633 > 0.5;
    float _745 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[78].w, _723);
    bool _747 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _749 = isnan(_605);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = 1.0 / _717;
    float _761 = precise::max(_713, _733);
    float _763 = -_123;
    float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[76].x, _697);
    float _767 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _711);
    float _769 = -_201;
    int _771 = _743 ? as_type<int>(_769) : as_type<int>(_201);
    float _773 = _721 * _761;
    bool _775 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _777 = isnan(_605);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _787;
    float _791 = _201 * _731;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _797 = 1.0 / _737;
    float _799 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _773);
    float _801 = _791 * _761;
    float _803 = _789 * _665;
    float _805 = _649 * _799;
    float _807 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _801);
    bool _809 = !_639;
    float _811 = _809 ? _197 : as_type<float>(_727);
    float _813 = _707 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _815;
    float _819 = _613 * _807;
    float _821 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _823 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _825 = isnan(_605);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = _795 * _759;
    float _837 = _819 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _839 = _819 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _841 = _817 * _797;
    bool _843 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _845 = isnan(_605);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].x, _837);
    float _857 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].x, _839);
    bool _859 = !_647;
    float _861 = _859 ? _201 : as_type<float>(_771);
    float _863 = _739 * 6.283185482025146484375;
    float _865 = sin(_863);
    float _867 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _855);
    float _869 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _857);
    float _871 = -_853;
    float _873 = _871 + 1.0;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _877 = _605 + _875;
    float _879 = _867 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _881 = _869 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _883 = -_833;
    float _885 = _883 + 1.0;
    float _887 = _757 * _873;
    float _889 = _741 + _879;
    float _891 = _813 + _881;
    float _893 = _853 * _885;
    float _895 = -_757;
    float _897 = _895 + 1.0;
    float _899 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _901 = _889 + _899;
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _905 = _891 + _903;
    float _907 = _739 * 6.283185482025146484375;
    float _909 = cos(_907);
    float _911 = _819 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _913 = _901 * _901;
    float _915 = _905 * _905;
    float _917 = fma(_803, _877, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _919 = _785 * _897;
    float _921 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].x, _911);
    float _923 = _913 + _915;
    float _925 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _927 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _719);
    float _929 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _745);
    float _931 = _917 * _919;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _935 = _605 + _933;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _939 = _605 + _937;
    float _941 = -_785;
    float _943 = _941 + 1.0;
    float _945 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _921);
    float _947 = sqrt(_923);
    float _949 = fma(_835, _935, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _951 = fma(_841, _939, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _953 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[115].x, _931);
    float _955 = _861 * _865;
    float _957 = _703 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _959 = _945 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _961 = _861 * _909;
    float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _965 = fma(_949, _887, _953);
    float _967 = -_955;
    float _969 = fma(_811, _909, _967);
    float _971 = _957 + _959;
    float _973 = fma(_811, _865, _961);
    float _975 = fma(_951, _893, _965);
    float _977 = _925 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _979 = _969 + 0.5;
    bool _981 = _947 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _983 = _973 + (-0.5);
    float _985 = _963 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _987 = _821;
    float _989 = _915;
    float _991 = _913;
    float _993 = _959;
    float _995 = _955;
    float _997 = _833;
    float _999 = _813;
    if (!_981)
    {
        _987 = _915;
    }
    float _1001 = _987;
    float _1003 = _1001;
    if (!_981)
    {
        _989 = _913;
    }
    float _1005 = _989;
    float _1007 = _1005;
    if (!_981)
    {
        _991 = _889;
    }
    float _1009 = _991;
    float _1011 = _1009;
    if (!_981)
    {
        _993 = _891;
    }
    float _1013 = _993;
    float _1015 = _1013;
    if (!_981)
    {
        _995 = _971;
    }
    float _1017 = _995;
    bool _1019 = !_981;
    float _1021 = _1017;
    if (!_1019)
    {
        float _1023 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1027 = _947 + _1025;
        float _1029 = rsqrt(_923);
        float _1031 = _1027 * _1023;
        float _1033 = _971 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1035 = _1031 * 0.15915493667125701904296875;
        float _1037 = _1035 * 6.283185482025146484375;
        float _1039 = sin(_1037);
        float _1041 = _1035 * 6.283185482025146484375;
        float _1043 = cos(_1041);
        float _1045 = fma(_1039, _1033, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1047 = _1029 * _1045;
        float _1049 = _1043 + (-1.0);
        float _1051 = fma(_901, _1047, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1053 = fma(_905, _1047, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1055 = _1049 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1059 = _1051 + _1057;
        float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1063 = _1053 + _1061;
        float _1065 = fma(_971, _1043, _1055);
        float _1067 = _1059 * _1059;
        float _1069 = _1063 * _1063;
        _1021 = _1065;
        _1007 = _1067;
        _1003 = _1069;
        _1011 = _1051;
        _1015 = _1053;
    }
    float _1071 = _1021;
    float _1073 = _1007;
    float _1075 = _1003;
    float _1077 = _1011;
    float _1079 = _1015;
    float _1081 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1083 = _1071 + _1081;
    float _1085 = fma(_977, _979, _765);
    float _1087 = fma(_1083, _1083, _1073);
    float _1089 = -_985;
    float _1091 = -_927;
    float _1093 = fma(_1089, _983, _1091);
    float _1095 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[118].x, _975);
    float _1097 = _1087 + _1075;
    float _1099 = -_767;
    float _1101 = _1099 + 1.0;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1109 = -_929;
    float _1111 = _1109 + 1.0;
    float _1113 = sqrt(_1097);
    float _1115 = -_1101;
    float _1117 = fma(_969, _1115, _1085);
    float _1119 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1125 = _1095 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1127 = fma(_973, _1111, _1093);
    out.m_64.x = _1119;
    out.m_64.y = _1121;
    out.m_64.z = _1123;
    out.m_64.w = _1125;
    out.m_66.x = _1117;
    out.m_66.y = _1127;
    bool _1129 = _1113 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1131 = isnan(_1113);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1137 = _1133 || _1135;
    float _1139 = _1117;
    float _1141 = _1127;
    if (!_1137)
    {
        _997 = 1.0;
    }
    float _1143 = _997;
    bool _1145 = !_1137;
    float _1147 = _1143;
    if (!_1145)
    {
        bool _1149 = _1113 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1151 = isnan(_1113);
        bool _1153 = _1149 || _1151;
        bool _1155 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1157 = _1153 || _1155;
        if (!_1157)
        {
            float _1159 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1161 = _1113 + _1159;
            float _1163 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1165 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1163;
            float _1167 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1169 = _1167 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1171 = 1.0 / _1165;
            float _1173 = _1161 * _1171;
            float _1175 = fma(_1173, _1169, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1147 = _1175;
            _1177 = true;
        }
        else
        {
            bool _1179 = _1113 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1181 = isnan(_1113);
            bool _1183 = _1179 || _1181;
            bool _1185 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1187 = _1183 || _1185;
            if (!_1187)
            {
                float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1191 = _1113 + _1189;
                float _1193 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1195 = _1193 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1197 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1199 = _1197 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1201 = 1.0 / _1195;
                float _1203 = _1191 * _1201;
                float _1205 = fma(_1203, _1199, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1147 = _1205;
                _1177 = true;
            }
            else
            {
                _1147 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1177 = false;
    float _1207 = _1147;
    float _1209 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1211 = _1071 + _1209;
    float _1213 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1215 = _1077 + _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1219 = _1079 + _1217;
    float _1221 = fma(_1211, _1207, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1223 = fma(_1215, _1207, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1225 = fma(_1219, _1207, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1229 = _1221 + _1227;
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1233 = _1223 + _1231;
    float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1237 = _1225 + _1235;
    float _1239 = _1229 * _1229;
    float _1241 = fma(_1233, _1233, _1239);
    float _1243 = fma(_1237, _1237, _1241);
    float _1245 = rsqrt(_1243);
    float _1247 = _1245 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1249 = _1233 * _1247;
    float _1251 = _1237 * _1247;
    float _1253 = _1249 * _1249;
    float _1255 = _1251 * _1251;
    float _1257 = _1253 + _1255;
    float _1259 = sqrt(_1257);
    bool _1261 = _1259 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1265 = _1259 + _1263;
    float _1267 = _1237;
    float _1269 = _1265;
    float _1271 = _1247;
    float _1273 = _1249;
    if (_1261)
    {
        float _1275 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1267 = _1275;
    }
    float _1277 = _1267;
    if (_1261)
    {
        float _1279 = rsqrt(_1257);
        _1139 = _1279;
    }
    float _1281 = _1139;
    float _1283 = _1281;
    if (_1261)
    {
        float _1285 = _1265 * _1277;
        _1269 = _1285;
    }
    float _1287 = _1269;
    if (_1261)
    {
        float _1289 = _1287 * 0.15915493667125701904296875;
        _1141 = _1289;
    }
    float _1291 = _1141;
    float _1293 = _1277;
    if (_1261)
    {
        float _1295 = _1291 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        _1293 = _1297;
    }
    float _1299 = _1293;
    float _1301 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1303 = precise::max(0.0, _1301);
    float _1305 = _1239;
    float _1307 = _1303;
    if (_1261)
    {
        float _1309 = _1291 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        _1305 = _1311;
    }
    float _1313 = _1305;
    float _1315 = -_1247;
    float _1317 = -_1303;
    float _1319 = fma(_1229, _1315, _1317);
    float _1321 = _1319;
    if (_1261)
    {
        float _1323 = _1319 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1307 = _1323;
    }
    float _1325 = _1307;
    float _1327 = sqrt(_1243);
    float _1329 = _1299;
    float _1331 = _1325;
    if (_1261)
    {
        float _1333 = fma(_1299, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1329 = _1333;
    }
    float _1335 = _1329;
    float _1337 = _1335;
    float _1339 = _1313;
    if (_1261)
    {
        float _1341 = _1313 + (-1.0);
        _1331 = _1341;
    }
    float _1343 = _1331;
    float _1345 = _1343;
    if (_1261)
    {
        float _1347 = _1281 * _1335;
        _1271 = _1347;
    }
    float _1349 = _1271;
    if (!_1261)
    {
        _1337 = _1251;
    }
    float _1351 = _1337;
    float _1353 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1355 = _1351;
    if (_1261)
    {
        float _1357 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1357;
    }
    float _1359 = _1283;
    if (_1261)
    {
        float _1361 = _1249 * _1349;
        _1273 = _1361;
    }
    float _1363 = _1273;
    if (!_1261)
    {
        _1345 = _1253;
    }
    float _1365 = _1345;
    float _1367 = _1365;
    if (_1261)
    {
        float _1369 = _1251 * _1349;
        _1355 = _1369;
    }
    float _1371 = _1355;
    if (_1261)
    {
        float _1373 = fma(_1319, _1313, _1359);
        _1321 = _1373;
    }
    float _1375 = _1321;
    if (_1261)
    {
        float _1377 = _1363 * _1363;
        _1367 = _1377;
    }
    float _1379 = _1367;
    if (!_1261)
    {
        _1339 = _1255;
    }
    float _1381 = _1339;
    float _1383 = _1381;
    if (_1261)
    {
        float _1385 = _1371 * _1371;
        _1383 = _1385;
    }
    float _1387 = _1383;
    float _1389 = fma(_1375, _1375, _1379);
    float _1391 = _1389 + _1387;
    float _1393 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1395 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1397 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1395);
    float _1399 = precise::clamp(_1397, 0.0, 1.0);
    float _1401 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1403 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1393);
    float _1405 = rsqrt(_1391);
    float _1407 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1409 = -_1399;
    float _1411 = _1409 + 1.0;
    float _1413 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1403);
    float _1415 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1417 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1407);
    float _1419 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1421 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1353);
    float _1423 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1417);
    float _1425 = abs(_1411);
    float _1427 = log2(_1425);
    float _1429 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1431 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1415);
    float _1433 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1421);
    float _1435 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1437 = -_1429;
    float _1439 = fma(_1437, _1401, 1.0);
    float _1441 = _1405 * _1363;
    float _1443 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1431);
    float _1445 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1447 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1449 = _1405 * _1375;
    float _1451 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1453 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1455 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1447);
    float _1457 = _1405 * _1371;
    float _1459 = -_1451;
    float _1461 = fma(_1449, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1459);
    float _1463 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1465 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1455);
    float _1467 = log2(_1439);
    float _1469 = -_1457;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1461);
    float _1473 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1475 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1465);
    float _1477 = fma(_1471, -0.5, 0.5);
    float _1479 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1473);
    float _1481 = fma(_1471, 0.5, 0.5);
    float _1483 = exp2(_1463);
    float _1485 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1487 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1479);
    float _1489 = _1449 + 1.0;
    float _1491 = fma(_1481, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1493 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1485);
    float _1495 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1487);
    float _1497 = 1.0 / _1475;
    float _1499 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1493);
    float _1501 = fma(_1481, _1491, -0.212114393711090087890625);
    float _1503 = _1467 * 0.693147182464599609375;
    float _1505 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1499);
    float _1507 = fma(_1481, _1501, 1.570728778839111328125);
    float _1509 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1511 = sqrt(_1477);
    float _1513 = -_1449;
    float _1515 = fma(_1483, _1489, _1513);
    float _1517 = fma(_1515, 0.5, 0.5);
    float _1519 = _1495 * _1497;
    float _1521 = _1505 * _1497;
    float _1523 = fma(_1519, 0.5, 0.5);
    float _1525 = fma(_1521, -0.5, 0.5);
    float _1527 = _1511 * 0.636619746685028076171875;
    float3 _4109 = float3(_1523, _1525, _1509);
    float _1529 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4109, float3(0.0), isnan(_4109)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4109, float3(0.0), isnan(_4109)), level(0.0)).x;
    float3 _4120 = float3(_1523, _1525, _1509);
    float4 _1532 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4120, float3(0.0), isnan(_4120)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4120, float3(0.0), isnan(_4120)), level(0.0)).xyzw;
    float _1534 = _1532.x;
    float _1536 = _1532.y;
    float _1538 = _1532.z;
    float _1540 = _1532.w;
    float _1542 = -_1507;
    float _1544 = fma(_1527, _1542, 1.0);
    float2 _4142 = float2(_1544, _1517);
    float3 _1548 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4142, float2(0.0), isnan(_4142)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4142, float2(0.0), isnan(_4142)), level(0.0)).xyz;
    float _1550 = _1548.x;
    float _1552 = _1548.y;
    float _1554 = _1548.z;
    float _1556 = _957 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1558 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1560 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1556);
    float _1562 = _957 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1564 = exp2(_1558);
    float _1566 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1560);
    float _1568 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1562);
    bool _1570 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan(0.5);
    bool _1578 = _1574 || _1576;
    float _1580 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1582 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1568);
    float _1584 = 1.0 / _1580;
    float _1586 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1588 = _1586 + _1580;
    float _1590 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1592 = _1419;
    if (!_1578)
    {
        _999 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1594 = _999;
    float _1596 = _1594;
    if (!_1578)
    {
        _1590 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1598 = _1590;
    float _1600 = _1588 * _1584;
    float _1602 = _1600 * 0.5;
    float _1604 = _1584;
    float _1606 = _1598;
    if (!_1578)
    {
        float _1608 = -_1598;
        float _1610 = _1608 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1604 = _1610;
    }
    float _1612 = _1604;
    float _1614 = _1612;
    if (!_1578)
    {
        float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1618 = fma(_1602, _1594, _1616);
        _1596 = _1618;
    }
    float _1620 = _1596;
    float _1622 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1624 = _1622;
    if (!_1578)
    {
        float _1626 = 1.0 / _1612;
        _1614 = _1626;
    }
    float _1628 = _1614;
    float _1630 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1622);
    if (_1578)
    {
        _1624 = 1.0;
    }
    float _1632 = _1624;
    float _1634 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1630);
    float _1636 = _1620;
    float _1638 = _1632;
    if (!_1578)
    {
        float _1640 = 1.0 / _1620;
        _1636 = _1640;
    }
    float _1642 = _1636;
    if (!_1578)
    {
        float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1646 = -_1598;
        float _1648 = fma(_1642, _1644, _1646);
        _1606 = _1648;
    }
    float _1650 = _1606;
    if (!_1578)
    {
        float _1652 = _1650 * _1628;
        float _1654 = precise::clamp(_1652, 0.0, 1.0);
        _1592 = _1654;
    }
    float _1656 = _1592;
    float _1658 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1634);
    float _1660 = -_1564;
    float _1662 = _1660 + 1.0;
    if (!_1578)
    {
        float _1664 = -_1656;
        float _1666 = _1664 + 1.0;
        _1638 = _1666;
    }
    float _1668 = _1638;
    float _1670 = _1658 + _1475;
    float _1672 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1674 = _1668 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1676 = _1670 * 0.5;
    bool _1678 = _1668 > 0.0;
    bool _1680 = isnan(_1668);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan(0.0);
    bool _1686 = _1682 || _1684;
    out.gl_Position.x = _1495;
    out.gl_Position.y = _1505;
    out.gl_Position.z = _1658;
    out.gl_Position.w = _1475;
    float _1688 = _1674 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.z = _1676;
    out.m_68.w = _1475;
    out.m_47.x = _1688;
    float _1690 = _1672 * _1529;
    float _1692 = -_1672;
    float _1694 = _1692 + 1.0;
    float _1696 = _1540 * _1690;
    float _1698 = _1554 * _1690;
    float _1700 = fma(_1550, _1696, _1534);
    float _1702 = fma(_1552, _1696, _1536);
    float _1704 = _1540 * _1694;
    float _1706 = fma(_1540, _1698, _1538);
    out.m_70.x = _1700;
    out.m_70.y = _1702;
    out.m_70.z = _1706;
    out.m_70.w = _1704;
    if (_1686)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1708 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1708;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1177 = false;
    bool _597 = false;
    bool _303 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1765 = as_type<float>(_105);
        out.gl_Position.z = _1765;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1834 = as_type<float>(_141);
        out.gl_Position.z = _1834;
    }
    if (_133)
    {
        return out;
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_54.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_49.x;
    float _161 = in.m_49.y;
    float _163 = in.m_49.z;
    float _165 = in.m_44.x;
    float _167 = in.m_44.y;
    float _169 = in.m_44.z;
    float _171 = 0.0;
    float _173 = _145;
    if (!_157)
    {
        float _175 = _145 * _145;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = _179;
    if (!_157)
    {
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_157;
    float _205 = _185;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _145 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _145);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_157;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _145 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _173 = _259;
    }
    float _261 = _173;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _265 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _271 = fma(_261, _159, _265);
    float _273 = fma(_261, _161, _267);
    float _275 = fma(_261, _163, _269);
    float _277 = fma(_271, _147, _165);
    float _279 = fma(_273, _147, _167);
    float _281 = fma(_275, _147, _169);
    bool _283 = !_263;
    float _301;
    if (!_283)
    {
        float _285 = in.m_56.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        float _305 = float(_89);
        float _307 = 1.0 / _305;
        float _309 = _123 * _307;
        _301 = _309;
    }
    _303 = false;
    float _311 = _301;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _333 = 1.0 / _319;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _335;
    float _339 = 1.0 / _327;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = _311 + _341;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _347 = 1.0 / _323;
    float _349 = _343 * _333;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _353 = _311 + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _357 = _311 + _355;
    bool _359 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _361 = isnan(_311);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = 1.0 / _331;
    float _373 = _353 * _339;
    bool _375 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _377 = isnan(_311);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    bool _387 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _389 = isnan(_311);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    bool _399 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _401 = isnan(_311);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = 1.0 / _337;
    float _413 = _315 * _347;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _417 = _311 + _415;
    float _419 = -_385;
    float _421 = _419 + 1.0;
    float _423 = _409 * _421;
    float _425 = _417 * _371;
    float _427 = -_397;
    float _429 = _427 + 1.0;
    float _431 = -_409;
    float _433 = _431 + 1.0;
    bool _435 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _437 = isnan(_311);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    float _451 = _385 * _429;
    bool _453 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _455 = isnan(_311);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = _369 * _433;
    float _467 = _357 * _411;
    float _469 = -_369;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = fma(_449, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _487 = -_445;
    float _489 = _487 + 1.0;
    float _491 = fma(_475, _413, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _493 = fma(_481, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _495 = _445 * _471;
    float _497 = _463 * _489;
    float _499 = fma(_485, _413, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _501 = -_463;
    float _503 = _501 + 1.0;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _505;
    float _509 = _493 * _497;
    float _511 = _477 * _497;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _513;
    float _517 = fma(_507, _373, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[143].x, _509);
    float _521 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[143].y, _511);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _527 = in.m_54.x;
    float _529 = in.m_54.y;
    float _531 = fma(_515, _373, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _537 = fma(_525, _425, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _539 = fma(_499, _495, _519);
    float _541 = fma(_491, _495, _521);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _543;
    float _547 = fma(_535, _425, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _549 = fma(_517, _465, _539);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _551;
    float _555 = fma(_531, _465, _541);
    float _557 = fma(_545, _467, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _559 = fma(_537, _423, _549);
    float _561 = fma(_553, _467, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _563 = fma(_547, _423, _555);
    float _565 = fma(_557, _451, _559);
    float _567 = fma(_561, _451, _563);
    float _569 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[148].x, _565);
    float _571 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[148].y, _567);
    float _573 = _569 * _527;
    float _575 = _571 * _529;
    bool _577 = !_345;
    float _595;
    if (!_577)
    {
        float _579 = in.m_56.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        float _599 = float(_89);
        float _601 = 1.0 / _599;
        float _603 = _123 * _601;
        _595 = _603;
    }
    _597 = false;
    float _605 = _595;
    float _607 = in.m_58.x;
    float _609 = in.m_58.y;
    float _611 = in.m_58.z;
    float _613 = _575 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _615 = in.m_60.x;
    float _617 = in.m_60.y;
    float _619 = in.m_60.z;
    float _621 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _623 = in.m_62.x;
    float _625 = in.m_62.y;
    float _627 = in.m_62.z;
    float _629 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _621);
    float _631 = in.m_56.x;
    float _633 = in.m_56.y;
    float _635 = in.m_56.z;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _639 = _637 != 0;
    float _641 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _629);
    float _643 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _647 = _645 != 0;
    float _649 = _573 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _651 = sqrt(_641);
    float _653 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _643);
    float _655 = _279 * _609;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _661 = _279 * _617;
    float _663 = fma(_277, _607, _655);
    float _665 = 1.0 / _659;
    float _667 = _279 * _625;
    float _669 = fma(_277, _615, _661);
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _673 = fma(_277, _623, _667);
    float _675 = fma(_281, _619, _669);
    float _677 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[79].z, _671);
    float _679 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _681 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _653);
    float _683 = _631 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _685 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _679);
    float _687 = rsqrt(_641);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _691 = _631 > 0.5;
    float _693 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _685);
    float _695 = -_689;
    float _697 = fma(_683, 2.0, _695);
    float _699 = _633 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _701 = sqrt(_681);
    float _703 = fma(_281, _611, _663);
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _707 = fma(_281, _627, _673);
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _711 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[78].z, _705);
    float _713 = sqrt(_693);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _719 = fma(_699, -2.0, _709);
    float _721 = _197 * _687;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _725 = -_197;
    int _727 = _691 ? as_type<int>(_725) : as_type<int>(_197);
    float _729 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _677);
    float _731 = rsqrt(_681);
    float _733 = precise::max(_651, _701);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _739 = _729 * (-0.15915493667125701904296875);
    float _741 = _675 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _743 = _633 > 0.5;
    float _745 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[78].w, _723);
    bool _747 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _749 = isnan(_605);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = 1.0 / _717;
    float _761 = precise::max(_713, _733);
    float _763 = -_123;
    float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[76].x, _697);
    float _767 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _711);
    float _769 = -_201;
    int _771 = _743 ? as_type<int>(_769) : as_type<int>(_201);
    float _773 = _721 * _761;
    bool _775 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _777 = isnan(_605);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _787;
    float _791 = _201 * _731;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _797 = 1.0 / _737;
    float _799 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _773);
    float _801 = _791 * _761;
    float _803 = _789 * _665;
    float _805 = _649 * _799;
    float _807 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _801);
    bool _809 = !_639;
    float _811 = _809 ? _197 : as_type<float>(_727);
    float _813 = _707 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _815;
    float _819 = _613 * _807;
    float _821 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _823 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _825 = isnan(_605);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = _795 * _759;
    float _837 = _819 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _839 = _819 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _841 = _817 * _797;
    bool _843 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _845 = isnan(_605);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].x, _837);
    float _857 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].x, _839);
    bool _859 = !_647;
    float _861 = _859 ? _201 : as_type<float>(_771);
    float _863 = _739 * 6.283185482025146484375;
    float _865 = sin(_863);
    float _867 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _855);
    float _869 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _857);
    float _871 = -_853;
    float _873 = _871 + 1.0;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _877 = _605 + _875;
    float _879 = _867 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _881 = _869 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _883 = -_833;
    float _885 = _883 + 1.0;
    float _887 = _757 * _873;
    float _889 = _741 + _879;
    float _891 = _813 + _881;
    float _893 = _853 * _885;
    float _895 = -_757;
    float _897 = _895 + 1.0;
    float _899 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _901 = _889 + _899;
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _905 = _891 + _903;
    float _907 = _739 * 6.283185482025146484375;
    float _909 = cos(_907);
    float _911 = _819 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _913 = _901 * _901;
    float _915 = _905 * _905;
    float _917 = fma(_803, _877, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _919 = _785 * _897;
    float _921 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].x, _911);
    float _923 = _913 + _915;
    float _925 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _927 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _719);
    float _929 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _745);
    float _931 = _917 * _919;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _935 = _605 + _933;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _939 = _605 + _937;
    float _941 = -_785;
    float _943 = _941 + 1.0;
    float _945 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _921);
    float _947 = sqrt(_923);
    float _949 = fma(_835, _935, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _951 = fma(_841, _939, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _953 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[115].x, _931);
    float _955 = _861 * _865;
    float _957 = _703 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _959 = _945 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _961 = _861 * _909;
    float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _965 = fma(_949, _887, _953);
    float _967 = -_955;
    float _969 = fma(_811, _909, _967);
    float _971 = _957 + _959;
    float _973 = fma(_811, _865, _961);
    float _975 = fma(_951, _893, _965);
    float _977 = _925 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _979 = _969 + 0.5;
    bool _981 = _947 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _983 = _973 + (-0.5);
    float _985 = _963 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _987 = _821;
    float _989 = _915;
    float _991 = _913;
    float _993 = _959;
    float _995 = _955;
    float _997 = _833;
    float _999 = _813;
    if (!_981)
    {
        _987 = _915;
    }
    float _1001 = _987;
    float _1003 = _1001;
    if (!_981)
    {
        _989 = _913;
    }
    float _1005 = _989;
    float _1007 = _1005;
    if (!_981)
    {
        _991 = _889;
    }
    float _1009 = _991;
    float _1011 = _1009;
    if (!_981)
    {
        _993 = _891;
    }
    float _1013 = _993;
    float _1015 = _1013;
    if (!_981)
    {
        _995 = _971;
    }
    float _1017 = _995;
    bool _1019 = !_981;
    float _1021 = _1017;
    if (!_1019)
    {
        float _1023 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1027 = _947 + _1025;
        float _1029 = rsqrt(_923);
        float _1031 = _1027 * _1023;
        float _1033 = _971 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1035 = _1031 * 0.15915493667125701904296875;
        float _1037 = _1035 * 6.283185482025146484375;
        float _1039 = sin(_1037);
        float _1041 = _1035 * 6.283185482025146484375;
        float _1043 = cos(_1041);
        float _1045 = fma(_1039, _1033, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1047 = _1029 * _1045;
        float _1049 = _1043 + (-1.0);
        float _1051 = fma(_901, _1047, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1053 = fma(_905, _1047, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1055 = _1049 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1059 = _1051 + _1057;
        float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1063 = _1053 + _1061;
        float _1065 = fma(_971, _1043, _1055);
        float _1067 = _1059 * _1059;
        float _1069 = _1063 * _1063;
        _1021 = _1065;
        _1007 = _1067;
        _1003 = _1069;
        _1011 = _1051;
        _1015 = _1053;
    }
    float _1071 = _1021;
    float _1073 = _1007;
    float _1075 = _1003;
    float _1077 = _1011;
    float _1079 = _1015;
    float _1081 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1083 = _1071 + _1081;
    float _1085 = fma(_977, _979, _765);
    float _1087 = fma(_1083, _1083, _1073);
    float _1089 = -_985;
    float _1091 = -_927;
    float _1093 = fma(_1089, _983, _1091);
    float _1095 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[118].x, _975);
    float _1097 = _1087 + _1075;
    float _1099 = -_767;
    float _1101 = _1099 + 1.0;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1109 = -_929;
    float _1111 = _1109 + 1.0;
    float _1113 = sqrt(_1097);
    float _1115 = -_1101;
    float _1117 = fma(_969, _1115, _1085);
    float _1119 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1125 = _1095 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1127 = fma(_973, _1111, _1093);
    out.m_64.x = _1119;
    out.m_64.y = _1121;
    out.m_64.z = _1123;
    out.m_64.w = _1125;
    out.m_66.x = _1117;
    out.m_66.y = _1127;
    bool _1129 = _1113 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1131 = isnan(_1113);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1137 = _1133 || _1135;
    float _1139 = _1117;
    float _1141 = _1127;
    if (!_1137)
    {
        _997 = 1.0;
    }
    float _1143 = _997;
    bool _1145 = !_1137;
    float _1147 = _1143;
    if (!_1145)
    {
        bool _1149 = _1113 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1151 = isnan(_1113);
        bool _1153 = _1149 || _1151;
        bool _1155 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1157 = _1153 || _1155;
        if (!_1157)
        {
            float _1159 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1161 = _1113 + _1159;
            float _1163 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1165 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1163;
            float _1167 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1169 = _1167 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1171 = 1.0 / _1165;
            float _1173 = _1161 * _1171;
            float _1175 = fma(_1173, _1169, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1147 = _1175;
            _1177 = true;
        }
        else
        {
            bool _1179 = _1113 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1181 = isnan(_1113);
            bool _1183 = _1179 || _1181;
            bool _1185 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1187 = _1183 || _1185;
            if (!_1187)
            {
                float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1191 = _1113 + _1189;
                float _1193 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1195 = _1193 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1197 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1199 = _1197 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1201 = 1.0 / _1195;
                float _1203 = _1191 * _1201;
                float _1205 = fma(_1203, _1199, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1147 = _1205;
                _1177 = true;
            }
            else
            {
                _1147 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1177 = false;
    float _1207 = _1147;
    float _1209 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1211 = _1071 + _1209;
    float _1213 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1215 = _1077 + _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1219 = _1079 + _1217;
    float _1221 = fma(_1211, _1207, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1223 = fma(_1215, _1207, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1225 = fma(_1219, _1207, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1229 = _1221 + _1227;
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1233 = _1223 + _1231;
    float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1237 = _1225 + _1235;
    float _1239 = _1229 * _1229;
    float _1241 = fma(_1233, _1233, _1239);
    float _1243 = fma(_1237, _1237, _1241);
    float _1245 = rsqrt(_1243);
    float _1247 = _1245 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1249 = _1233 * _1247;
    float _1251 = _1237 * _1247;
    float _1253 = _1249 * _1249;
    float _1255 = _1251 * _1251;
    float _1257 = _1253 + _1255;
    float _1259 = sqrt(_1257);
    bool _1261 = _1259 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1265 = _1259 + _1263;
    float _1267 = _1237;
    float _1269 = _1265;
    float _1271 = _1247;
    float _1273 = _1249;
    if (_1261)
    {
        float _1275 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1267 = _1275;
    }
    float _1277 = _1267;
    if (_1261)
    {
        float _1279 = rsqrt(_1257);
        _1139 = _1279;
    }
    float _1281 = _1139;
    float _1283 = _1281;
    if (_1261)
    {
        float _1285 = _1265 * _1277;
        _1269 = _1285;
    }
    float _1287 = _1269;
    if (_1261)
    {
        float _1289 = _1287 * 0.15915493667125701904296875;
        _1141 = _1289;
    }
    float _1291 = _1141;
    float _1293 = _1277;
    if (_1261)
    {
        float _1295 = _1291 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        _1293 = _1297;
    }
    float _1299 = _1293;
    float _1301 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1303 = precise::max(0.0, _1301);
    float _1305 = _1239;
    float _1307 = _1303;
    if (_1261)
    {
        float _1309 = _1291 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        _1305 = _1311;
    }
    float _1313 = _1305;
    float _1315 = -_1247;
    float _1317 = -_1303;
    float _1319 = fma(_1229, _1315, _1317);
    float _1321 = _1319;
    if (_1261)
    {
        float _1323 = _1319 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1307 = _1323;
    }
    float _1325 = _1307;
    float _1327 = sqrt(_1243);
    float _1329 = _1299;
    float _1331 = _1325;
    if (_1261)
    {
        float _1333 = fma(_1299, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1329 = _1333;
    }
    float _1335 = _1329;
    float _1337 = _1335;
    float _1339 = _1313;
    if (_1261)
    {
        float _1341 = _1313 + (-1.0);
        _1331 = _1341;
    }
    float _1343 = _1331;
    float _1345 = _1343;
    if (_1261)
    {
        float _1347 = _1281 * _1335;
        _1271 = _1347;
    }
    float _1349 = _1271;
    if (!_1261)
    {
        _1337 = _1251;
    }
    float _1351 = _1337;
    float _1353 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1355 = _1351;
    if (_1261)
    {
        float _1357 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1357;
    }
    float _1359 = _1283;
    if (_1261)
    {
        float _1361 = _1249 * _1349;
        _1273 = _1361;
    }
    float _1363 = _1273;
    if (!_1261)
    {
        _1345 = _1253;
    }
    float _1365 = _1345;
    float _1367 = _1365;
    if (_1261)
    {
        float _1369 = _1251 * _1349;
        _1355 = _1369;
    }
    float _1371 = _1355;
    if (_1261)
    {
        float _1373 = fma(_1319, _1313, _1359);
        _1321 = _1373;
    }
    float _1375 = _1321;
    if (_1261)
    {
        float _1377 = _1363 * _1363;
        _1367 = _1377;
    }
    float _1379 = _1367;
    if (!_1261)
    {
        _1339 = _1255;
    }
    float _1381 = _1339;
    float _1383 = _1381;
    if (_1261)
    {
        float _1385 = _1371 * _1371;
        _1383 = _1385;
    }
    float _1387 = _1383;
    float _1389 = fma(_1375, _1375, _1379);
    float _1391 = _1389 + _1387;
    float _1393 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1395 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1397 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1395);
    float _1399 = precise::clamp(_1397, 0.0, 1.0);
    float _1401 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1403 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1393);
    float _1405 = rsqrt(_1391);
    float _1407 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1409 = -_1399;
    float _1411 = _1409 + 1.0;
    float _1413 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1403);
    float _1415 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1417 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1407);
    float _1419 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1421 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1353);
    float _1423 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1417);
    float _1425 = abs(_1411);
    float _1427 = log2(_1425);
    float _1429 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1431 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1415);
    float _1433 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1421);
    float _1435 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1437 = -_1429;
    float _1439 = fma(_1437, _1401, 1.0);
    float _1441 = _1405 * _1363;
    float _1443 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1431);
    float _1445 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1447 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1449 = _1405 * _1375;
    float _1451 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1453 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1455 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1447);
    float _1457 = _1405 * _1371;
    float _1459 = -_1451;
    float _1461 = fma(_1449, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1459);
    float _1463 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1465 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1455);
    float _1467 = log2(_1439);
    float _1469 = -_1457;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1461);
    float _1473 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1475 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1465);
    float _1477 = fma(_1471, -0.5, 0.5);
    float _1479 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1473);
    float _1481 = fma(_1471, 0.5, 0.5);
    float _1483 = exp2(_1463);
    float _1485 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1487 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1479);
    float _1489 = _1449 + 1.0;
    float _1491 = fma(_1481, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1493 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1485);
    float _1495 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1487);
    float _1497 = 1.0 / _1475;
    float _1499 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1493);
    float _1501 = fma(_1481, _1491, -0.212114393711090087890625);
    float _1503 = _1467 * 0.693147182464599609375;
    float _1505 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1499);
    float _1507 = fma(_1481, _1501, 1.570728778839111328125);
    float _1509 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1511 = sqrt(_1477);
    float _1513 = -_1449;
    float _1515 = fma(_1483, _1489, _1513);
    float _1517 = fma(_1515, 0.5, 0.5);
    float _1519 = _1495 * _1497;
    float _1521 = _1505 * _1497;
    float _1523 = fma(_1519, 0.5, 0.5);
    float _1525 = fma(_1521, -0.5, 0.5);
    float _1527 = _1511 * 0.636619746685028076171875;
    float3 _4109 = float3(_1523, _1525, _1509);
    float _1529 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4109, float3(0.0), isnan(_4109)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4109, float3(0.0), isnan(_4109)), level(0.0)).x;
    float3 _4120 = float3(_1523, _1525, _1509);
    float4 _1532 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4120, float3(0.0), isnan(_4120)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4120, float3(0.0), isnan(_4120)), level(0.0)).xyzw;
    float _1534 = _1532.x;
    float _1536 = _1532.y;
    float _1538 = _1532.z;
    float _1540 = _1532.w;
    float _1542 = -_1507;
    float _1544 = fma(_1527, _1542, 1.0);
    float2 _4142 = float2(_1544, _1517);
    float3 _1548 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4142, float2(0.0), isnan(_4142)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4142, float2(0.0), isnan(_4142)), level(0.0)).xyz;
    float _1550 = _1548.x;
    float _1552 = _1548.y;
    float _1554 = _1548.z;
    float _1556 = _957 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1558 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1560 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1556);
    float _1562 = _957 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1564 = exp2(_1558);
    float _1566 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1560);
    float _1568 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1562);
    bool _1570 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan(0.5);
    bool _1578 = _1574 || _1576;
    float _1580 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1582 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1568);
    float _1584 = 1.0 / _1580;
    float _1586 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1588 = _1586 + _1580;
    float _1590 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1592 = _1419;
    if (!_1578)
    {
        _999 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1594 = _999;
    float _1596 = _1594;
    if (!_1578)
    {
        _1590 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1598 = _1590;
    float _1600 = _1588 * _1584;
    float _1602 = _1600 * 0.5;
    float _1604 = _1584;
    float _1606 = _1598;
    if (!_1578)
    {
        float _1608 = -_1598;
        float _1610 = _1608 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1604 = _1610;
    }
    float _1612 = _1604;
    float _1614 = _1612;
    if (!_1578)
    {
        float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1618 = fma(_1602, _1594, _1616);
        _1596 = _1618;
    }
    float _1620 = _1596;
    float _1622 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1624 = _1622;
    if (!_1578)
    {
        float _1626 = 1.0 / _1612;
        _1614 = _1626;
    }
    float _1628 = _1614;
    float _1630 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1622);
    if (_1578)
    {
        _1624 = 1.0;
    }
    float _1632 = _1624;
    float _1634 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1630);
    float _1636 = _1620;
    float _1638 = _1632;
    if (!_1578)
    {
        float _1640 = 1.0 / _1620;
        _1636 = _1640;
    }
    float _1642 = _1636;
    if (!_1578)
    {
        float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1646 = -_1598;
        float _1648 = fma(_1642, _1644, _1646);
        _1606 = _1648;
    }
    float _1650 = _1606;
    if (!_1578)
    {
        float _1652 = _1650 * _1628;
        float _1654 = precise::clamp(_1652, 0.0, 1.0);
        _1592 = _1654;
    }
    float _1656 = _1592;
    float _1658 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1634);
    float _1660 = -_1564;
    float _1662 = _1660 + 1.0;
    if (!_1578)
    {
        float _1664 = -_1656;
        float _1666 = _1664 + 1.0;
        _1638 = _1666;
    }
    float _1668 = _1638;
    float _1670 = _1658 + _1475;
    float _1672 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1674 = _1668 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1676 = _1670 * 0.5;
    bool _1678 = _1668 > 0.0;
    bool _1680 = isnan(_1668);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan(0.0);
    bool _1686 = _1682 || _1684;
    out.gl_Position.x = _1495;
    out.gl_Position.y = _1505;
    out.gl_Position.z = _1658;
    out.gl_Position.w = _1475;
    float _1688 = _1674 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.z = _1676;
    out.m_68.w = _1475;
    out.m_47.x = _1688;
    float _1690 = _1672 * _1529;
    float _1692 = -_1672;
    float _1694 = _1692 + 1.0;
    float _1696 = _1540 * _1690;
    float _1698 = _1554 * _1690;
    float _1700 = fma(_1550, _1696, _1534);
    float _1702 = fma(_1552, _1696, _1536);
    float _1704 = _1540 * _1694;
    float _1706 = fma(_1540, _1698, _1538);
    out.m_70.x = _1700;
    out.m_70.y = _1702;
    out.m_70.z = _1706;
    out.m_70.w = _1704;
    if (_1686)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1708 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1708;
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
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1177 = false;
    bool _597 = false;
    bool _303 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_44.w;
    float _86 = trunc(_84);
    int _89 = int(_86);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1765 = as_type<float>(_105);
        out.gl_Position.z = _1765;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    if (_119)
    {
        float _125 = float(_89);
        _99 = _125;
    }
    float _127 = _99;
    bool _129 = _123 >= _127;
    bool _131 = !_119;
    bool _133 = _129 || _131;
    float _135 = _127;
    if (_133)
    {
        _135 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _135;
    if (_133)
    {
        out.m_47.x = 0.0;
    }
    if (_133)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_133)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1834 = as_type<float>(_141);
        out.gl_Position.z = _1834;
    }
    if (_133)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = as_type<float>(int(gl_VertexIndex));
    float _145 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_54.w;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_49.x;
    float _161 = in.m_49.y;
    float _163 = in.m_49.z;
    float _165 = in.m_44.x;
    float _167 = in.m_44.y;
    float _169 = in.m_44.z;
    float _171 = 0.0;
    float _173 = _145;
    if (!_157)
    {
        float _175 = _145 * _145;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = _179;
    if (!_157)
    {
        float _183 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _181 = _183;
    }
    float _185 = _181;
    int _187 = as_type<int>(_143) & 1;
    bool _189 = _187 != 0;
    int _191 = as_type<int>(_143) & 2;
    bool _193 = _191 != 0;
    bool _195 = !_189;
    float _197 = _195 ? (-0.5) : 0.5;
    bool _199 = !_193;
    float _201 = _199 ? (-0.5) : 0.5;
    bool _203 = !_157;
    float _205 = _185;
    if (!_203)
    {
        float _207 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _209 = log2(_207);
        float _211 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _213 = _211 + 1.0;
        float _215 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _217 = _145 * _209;
        float _219 = 1.0 / _213;
        float _221 = _215 * 0.693147182464599609375;
        float _223 = exp2(_217);
        float _225 = 1.0 / _221;
        float _227 = _223 + (-1.0);
        float _229 = -_227;
        float _231 = fma(_229, _225, _145);
        float _233 = _231 * _219;
        float _235 = _233 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _205 = _235;
    }
    float _237 = _205;
    bool _239 = !_157;
    if (!_239)
    {
        float _241 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _243 = log2(_241);
        float _245 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _247 = _245 + 1.0;
        float _249 = 1.0 / _247;
        float _251 = _145 * _243;
        float _253 = exp2(_251);
        float _255 = -_253;
        float _257 = _255 + 1.0;
        float _259 = _257 * _249;
        _173 = _259;
    }
    float _261 = _173;
    bool _263 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _265 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _267 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _269 = _237 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _271 = fma(_261, _159, _265);
    float _273 = fma(_261, _161, _267);
    float _275 = fma(_261, _163, _269);
    float _277 = fma(_271, _147, _165);
    float _279 = fma(_273, _147, _167);
    float _281 = fma(_275, _147, _169);
    bool _283 = !_263;
    float _301;
    if (!_283)
    {
        float _285 = in.m_56.x;
        float _287 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _289 = _285 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _291 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _293 = _291 * _287;
        float _295 = floor(_293);
        float _297 = -_295;
        float _299 = _293 + _297;
        _301 = _299;
        _303 = true;
    }
    else
    {
        float _305 = float(_89);
        float _307 = 1.0 / _305;
        float _309 = _123 * _307;
        _301 = _309;
    }
    _303 = false;
    float _311 = _301;
    float _313 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _315 = _311 + _313;
    float _317 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _319 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _317;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _325 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _327 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _325;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _333 = 1.0 / _319;
    float _335 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _337 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _335;
    float _339 = 1.0 / _327;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _343 = _311 + _341;
    bool _345 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _347 = 1.0 / _323;
    float _349 = _343 * _333;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _353 = _311 + _351;
    float _355 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _357 = _311 + _355;
    bool _359 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _361 = isnan(_311);
    bool _363 = _359 || _361;
    bool _365 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _367 = _363 || _365;
    float _369 = float(_367);
    float _371 = 1.0 / _331;
    float _373 = _353 * _339;
    bool _375 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _377 = isnan(_311);
    bool _379 = _375 || _377;
    bool _381 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _383 = _379 || _381;
    float _385 = float(_383);
    bool _387 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _389 = isnan(_311);
    bool _391 = _387 || _389;
    bool _393 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _395 = _391 || _393;
    float _397 = float(_395);
    bool _399 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _401 = isnan(_311);
    bool _403 = _399 || _401;
    bool _405 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _407 = _403 || _405;
    float _409 = float(_407);
    float _411 = 1.0 / _337;
    float _413 = _315 * _347;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _417 = _311 + _415;
    float _419 = -_385;
    float _421 = _419 + 1.0;
    float _423 = _409 * _421;
    float _425 = _417 * _371;
    float _427 = -_397;
    float _429 = _427 + 1.0;
    float _431 = -_409;
    float _433 = _431 + 1.0;
    bool _435 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _437 = isnan(_311);
    bool _439 = _435 || _437;
    bool _441 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _443 = _439 || _441;
    float _445 = float(_443);
    float _447 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _449 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _447;
    float _451 = _385 * _429;
    bool _453 = _311 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _455 = isnan(_311);
    bool _457 = _453 || _455;
    bool _459 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _461 = _457 || _459;
    float _463 = float(_461);
    float _465 = _369 * _433;
    float _467 = _357 * _411;
    float _469 = -_369;
    float _471 = _469 + 1.0;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _475 = _473 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _477 = fma(_449, _349, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _479;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _487 = -_445;
    float _489 = _487 + 1.0;
    float _491 = fma(_475, _413, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _493 = fma(_481, _349, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _495 = _445 * _471;
    float _497 = _463 * _489;
    float _499 = fma(_485, _413, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _501 = -_463;
    float _503 = _501 + 1.0;
    float _505 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _507 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _505;
    float _509 = _493 * _497;
    float _511 = _477 * _497;
    float _513 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _513;
    float _517 = fma(_507, _373, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _519 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[143].x, _509);
    float _521 = fma(_503, (*spvDescriptorSet0.vp_c9)._m0[143].y, _511);
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _525 = _523 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _527 = in.m_54.x;
    float _529 = in.m_54.y;
    float _531 = fma(_515, _373, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _533 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _535 = _533 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _537 = fma(_525, _425, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _539 = fma(_499, _495, _519);
    float _541 = fma(_491, _495, _521);
    float _543 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _545 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _543;
    float _547 = fma(_535, _425, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _549 = fma(_517, _465, _539);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _551;
    float _555 = fma(_531, _465, _541);
    float _557 = fma(_545, _467, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _559 = fma(_537, _423, _549);
    float _561 = fma(_553, _467, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _563 = fma(_547, _423, _555);
    float _565 = fma(_557, _451, _559);
    float _567 = fma(_561, _451, _563);
    float _569 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[148].x, _565);
    float _571 = fma(_397, (*spvDescriptorSet0.vp_c9)._m0[148].y, _567);
    float _573 = _569 * _527;
    float _575 = _571 * _529;
    bool _577 = !_345;
    float _595;
    if (!_577)
    {
        float _579 = in.m_56.x;
        float _581 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _583 = _579 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _585 = fma(_583, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _587 = _585 * _581;
        float _589 = floor(_587);
        float _591 = -_589;
        float _593 = _587 + _591;
        _595 = _593;
        _597 = true;
    }
    else
    {
        float _599 = float(_89);
        float _601 = 1.0 / _599;
        float _603 = _123 * _601;
        _595 = _603;
    }
    _597 = false;
    float _605 = _595;
    float _607 = in.m_58.x;
    float _609 = in.m_58.y;
    float _611 = in.m_58.z;
    float _613 = _575 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _615 = in.m_60.x;
    float _617 = in.m_60.y;
    float _619 = in.m_60.z;
    float _621 = (*spvDescriptorSet0.vp_c10)._m0[5].x * (*spvDescriptorSet0.vp_c10)._m0[5].x;
    float _623 = in.m_62.x;
    float _625 = in.m_62.y;
    float _627 = in.m_62.z;
    float _629 = fma((*spvDescriptorSet0.vp_c10)._m0[4].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _621);
    float _631 = in.m_56.x;
    float _633 = in.m_56.y;
    float _635 = in.m_56.z;
    int _637 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _639 = _637 != 0;
    float _641 = fma((*spvDescriptorSet0.vp_c10)._m0[6].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _629);
    float _643 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _645 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _647 = _645 != 0;
    float _649 = _573 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _651 = sqrt(_641);
    float _653 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _643);
    float _655 = _279 * _609;
    float _657 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _659 = _657 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _661 = _279 * _617;
    float _663 = fma(_277, _607, _655);
    float _665 = 1.0 / _659;
    float _667 = _279 * _625;
    float _669 = fma(_277, _615, _661);
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[79].z + (*spvDescriptorSet0.vp_c9)._m0[79].y;
    float _673 = fma(_277, _623, _667);
    float _675 = fma(_281, _619, _669);
    float _677 = fma(_635, (*spvDescriptorSet0.vp_c9)._m0[79].z, _671);
    float _679 = (*spvDescriptorSet0.vp_c10)._m0[5].z * (*spvDescriptorSet0.vp_c10)._m0[5].z;
    float _681 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _653);
    float _683 = _631 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _685 = fma((*spvDescriptorSet0.vp_c10)._m0[4].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _679);
    float _687 = rsqrt(_641);
    float _689 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _691 = _631 > 0.5;
    float _693 = fma((*spvDescriptorSet0.vp_c10)._m0[6].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _685);
    float _695 = -_689;
    float _697 = fma(_683, 2.0, _695);
    float _699 = _633 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _701 = sqrt(_681);
    float _703 = fma(_281, _611, _663);
    float _705 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _707 = fma(_281, _627, _673);
    float _709 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _711 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[78].z, _705);
    float _713 = sqrt(_693);
    float _715 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _717 = _715 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _719 = fma(_699, -2.0, _709);
    float _721 = _197 * _687;
    float _723 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _725 = -_197;
    int _727 = _691 ? as_type<int>(_725) : as_type<int>(_197);
    float _729 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[79].x, _677);
    float _731 = rsqrt(_681);
    float _733 = precise::max(_651, _701);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _737 = _735 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _739 = _729 * (-0.15915493667125701904296875);
    float _741 = _675 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _743 = _633 > 0.5;
    float _745 = fma(_633, (*spvDescriptorSet0.vp_c9)._m0[78].w, _723);
    bool _747 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _749 = isnan(_605);
    bool _751 = _747 || _749;
    bool _753 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _755 = _751 || _753;
    float _757 = float(_755);
    float _759 = 1.0 / _717;
    float _761 = precise::max(_713, _733);
    float _763 = -_123;
    float _765 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[76].x, _697);
    float _767 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].z, _711);
    float _769 = -_201;
    int _771 = _743 ? as_type<int>(_769) : as_type<int>(_201);
    float _773 = _721 * _761;
    bool _775 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _777 = isnan(_605);
    bool _779 = _775 || _777;
    bool _781 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _783 = _779 || _781;
    float _785 = float(_783);
    float _787 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _789 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _787;
    float _791 = _201 * _731;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _797 = 1.0 / _737;
    float _799 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _773);
    float _801 = _791 * _761;
    float _803 = _789 * _665;
    float _805 = _649 * _799;
    float _807 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _801);
    bool _809 = !_639;
    float _811 = _809 ? _197 : as_type<float>(_727);
    float _813 = _707 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _815 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _817 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _815;
    float _819 = _613 * _807;
    float _821 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    bool _823 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _825 = isnan(_605);
    bool _827 = _823 || _825;
    bool _829 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _831 = _827 || _829;
    float _833 = float(_831);
    float _835 = _795 * _759;
    float _837 = _819 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _839 = _819 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _841 = _817 * _797;
    bool _843 = _605 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _845 = isnan(_605);
    bool _847 = _843 || _845;
    bool _849 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _851 = _847 || _849;
    float _853 = float(_851);
    float _855 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[24].x, _837);
    float _857 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[26].x, _839);
    bool _859 = !_647;
    float _861 = _859 ? _201 : as_type<float>(_771);
    float _863 = _739 * 6.283185482025146484375;
    float _865 = sin(_863);
    float _867 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[24].z, _855);
    float _869 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[26].z, _857);
    float _871 = -_853;
    float _873 = _871 + 1.0;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _877 = _605 + _875;
    float _879 = _867 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _881 = _869 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _883 = -_833;
    float _885 = _883 + 1.0;
    float _887 = _757 * _873;
    float _889 = _741 + _879;
    float _891 = _813 + _881;
    float _893 = _853 * _885;
    float _895 = -_757;
    float _897 = _895 + 1.0;
    float _899 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _901 = _889 + _899;
    float _903 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _905 = _891 + _903;
    float _907 = _739 * 6.283185482025146484375;
    float _909 = cos(_907);
    float _911 = _819 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _913 = _901 * _901;
    float _915 = _905 * _905;
    float _917 = fma(_803, _877, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _919 = _785 * _897;
    float _921 = fma(_805, (*spvDescriptorSet0.vp_c8)._m0[25].x, _911);
    float _923 = _913 + _915;
    float _925 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _927 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[76].y, _719);
    float _929 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[77].w, _745);
    float _931 = _917 * _919;
    float _933 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _935 = _605 + _933;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _939 = _605 + _937;
    float _941 = -_785;
    float _943 = _941 + 1.0;
    float _945 = fma(_821, (*spvDescriptorSet0.vp_c8)._m0[25].z, _921);
    float _947 = sqrt(_923);
    float _949 = fma(_835, _935, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _951 = fma(_841, _939, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _953 = fma(_943, (*spvDescriptorSet0.vp_c9)._m0[115].x, _931);
    float _955 = _861 * _865;
    float _957 = _703 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _959 = _945 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _961 = _861 * _909;
    float _963 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _965 = fma(_949, _887, _953);
    float _967 = -_955;
    float _969 = fma(_811, _909, _967);
    float _971 = _957 + _959;
    float _973 = fma(_811, _865, _961);
    float _975 = fma(_951, _893, _965);
    float _977 = _925 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _979 = _969 + 0.5;
    bool _981 = _947 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _983 = _973 + (-0.5);
    float _985 = _963 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _987 = _821;
    float _989 = _915;
    float _991 = _913;
    float _993 = _959;
    float _995 = _955;
    float _997 = _833;
    float _999 = _813;
    if (!_981)
    {
        _987 = _915;
    }
    float _1001 = _987;
    float _1003 = _1001;
    if (!_981)
    {
        _989 = _913;
    }
    float _1005 = _989;
    float _1007 = _1005;
    if (!_981)
    {
        _991 = _889;
    }
    float _1009 = _991;
    float _1011 = _1009;
    if (!_981)
    {
        _993 = _891;
    }
    float _1013 = _993;
    float _1015 = _1013;
    if (!_981)
    {
        _995 = _971;
    }
    float _1017 = _995;
    bool _1019 = !_981;
    float _1021 = _1017;
    if (!_1019)
    {
        float _1023 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1025 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1027 = _947 + _1025;
        float _1029 = rsqrt(_923);
        float _1031 = _1027 * _1023;
        float _1033 = _971 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1035 = _1031 * 0.15915493667125701904296875;
        float _1037 = _1035 * 6.283185482025146484375;
        float _1039 = sin(_1037);
        float _1041 = _1035 * 6.283185482025146484375;
        float _1043 = cos(_1041);
        float _1045 = fma(_1039, _1033, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1047 = _1029 * _1045;
        float _1049 = _1043 + (-1.0);
        float _1051 = fma(_901, _1047, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1053 = fma(_905, _1047, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1055 = _1049 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1057 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1059 = _1051 + _1057;
        float _1061 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1063 = _1053 + _1061;
        float _1065 = fma(_971, _1043, _1055);
        float _1067 = _1059 * _1059;
        float _1069 = _1063 * _1063;
        _1021 = _1065;
        _1007 = _1067;
        _1003 = _1069;
        _1011 = _1051;
        _1015 = _1053;
    }
    float _1071 = _1021;
    float _1073 = _1007;
    float _1075 = _1003;
    float _1077 = _1011;
    float _1079 = _1015;
    float _1081 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1083 = _1071 + _1081;
    float _1085 = fma(_977, _979, _765);
    float _1087 = fma(_1083, _1083, _1073);
    float _1089 = -_985;
    float _1091 = -_927;
    float _1093 = fma(_1089, _983, _1091);
    float _1095 = fma(_833, (*spvDescriptorSet0.vp_c9)._m0[118].x, _975);
    float _1097 = _1087 + _1075;
    float _1099 = -_767;
    float _1101 = _1099 + 1.0;
    float _1103 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1105 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1107 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _1109 = -_929;
    float _1111 = _1109 + 1.0;
    float _1113 = sqrt(_1097);
    float _1115 = -_1101;
    float _1117 = fma(_969, _1115, _1085);
    float _1119 = _1103 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1121 = _1105 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1123 = _1107 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1125 = _1095 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _1127 = fma(_973, _1111, _1093);
    out.m_64.x = _1119;
    out.m_64.y = _1121;
    out.m_64.z = _1123;
    out.m_64.w = _1125;
    out.m_66.x = _1117;
    out.m_66.y = _1127;
    bool _1129 = _1113 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1131 = isnan(_1113);
    bool _1133 = _1129 || _1131;
    bool _1135 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1137 = _1133 || _1135;
    float _1139 = _1117;
    float _1141 = _1127;
    if (!_1137)
    {
        _997 = 1.0;
    }
    float _1143 = _997;
    bool _1145 = !_1137;
    float _1147 = _1143;
    if (!_1145)
    {
        bool _1149 = _1113 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1151 = isnan(_1113);
        bool _1153 = _1149 || _1151;
        bool _1155 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1157 = _1153 || _1155;
        if (!_1157)
        {
            float _1159 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1161 = _1113 + _1159;
            float _1163 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1165 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1163;
            float _1167 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1169 = _1167 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1171 = 1.0 / _1165;
            float _1173 = _1161 * _1171;
            float _1175 = fma(_1173, _1169, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1147 = _1175;
            _1177 = true;
        }
        else
        {
            bool _1179 = _1113 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1181 = isnan(_1113);
            bool _1183 = _1179 || _1181;
            bool _1185 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1187 = _1183 || _1185;
            if (!_1187)
            {
                float _1189 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1191 = _1113 + _1189;
                float _1193 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1195 = _1193 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1197 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1199 = _1197 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1201 = 1.0 / _1195;
                float _1203 = _1191 * _1201;
                float _1205 = fma(_1203, _1199, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1147 = _1205;
                _1177 = true;
            }
            else
            {
                _1147 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1177 = false;
    float _1207 = _1147;
    float _1209 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1211 = _1071 + _1209;
    float _1213 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1215 = _1077 + _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1219 = _1079 + _1217;
    float _1221 = fma(_1211, _1207, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1223 = fma(_1215, _1207, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1225 = fma(_1219, _1207, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1227 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1229 = _1221 + _1227;
    float _1231 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1233 = _1223 + _1231;
    float _1235 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1237 = _1225 + _1235;
    float _1239 = _1229 * _1229;
    float _1241 = fma(_1233, _1233, _1239);
    float _1243 = fma(_1237, _1237, _1241);
    float _1245 = rsqrt(_1243);
    float _1247 = _1245 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1249 = _1233 * _1247;
    float _1251 = _1237 * _1247;
    float _1253 = _1249 * _1249;
    float _1255 = _1251 * _1251;
    float _1257 = _1253 + _1255;
    float _1259 = sqrt(_1257);
    bool _1261 = _1259 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1265 = _1259 + _1263;
    float _1267 = _1237;
    float _1269 = _1265;
    float _1271 = _1247;
    float _1273 = _1249;
    if (_1261)
    {
        float _1275 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1267 = _1275;
    }
    float _1277 = _1267;
    if (_1261)
    {
        float _1279 = rsqrt(_1257);
        _1139 = _1279;
    }
    float _1281 = _1139;
    float _1283 = _1281;
    if (_1261)
    {
        float _1285 = _1265 * _1277;
        _1269 = _1285;
    }
    float _1287 = _1269;
    if (_1261)
    {
        float _1289 = _1287 * 0.15915493667125701904296875;
        _1141 = _1289;
    }
    float _1291 = _1141;
    float _1293 = _1277;
    if (_1261)
    {
        float _1295 = _1291 * 6.283185482025146484375;
        float _1297 = sin(_1295);
        _1293 = _1297;
    }
    float _1299 = _1293;
    float _1301 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1303 = precise::max(0.0, _1301);
    float _1305 = _1239;
    float _1307 = _1303;
    if (_1261)
    {
        float _1309 = _1291 * 6.283185482025146484375;
        float _1311 = cos(_1309);
        _1305 = _1311;
    }
    float _1313 = _1305;
    float _1315 = -_1247;
    float _1317 = -_1303;
    float _1319 = fma(_1229, _1315, _1317);
    float _1321 = _1319;
    if (_1261)
    {
        float _1323 = _1319 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1307 = _1323;
    }
    float _1325 = _1307;
    float _1327 = sqrt(_1243);
    float _1329 = _1299;
    float _1331 = _1325;
    if (_1261)
    {
        float _1333 = fma(_1299, _1325, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1329 = _1333;
    }
    float _1335 = _1329;
    float _1337 = _1335;
    float _1339 = _1313;
    if (_1261)
    {
        float _1341 = _1313 + (-1.0);
        _1331 = _1341;
    }
    float _1343 = _1331;
    float _1345 = _1343;
    if (_1261)
    {
        float _1347 = _1281 * _1335;
        _1271 = _1347;
    }
    float _1349 = _1271;
    if (!_1261)
    {
        _1337 = _1251;
    }
    float _1351 = _1337;
    float _1353 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1355 = _1351;
    if (_1261)
    {
        float _1357 = _1343 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1283 = _1357;
    }
    float _1359 = _1283;
    if (_1261)
    {
        float _1361 = _1249 * _1349;
        _1273 = _1361;
    }
    float _1363 = _1273;
    if (!_1261)
    {
        _1345 = _1253;
    }
    float _1365 = _1345;
    float _1367 = _1365;
    if (_1261)
    {
        float _1369 = _1251 * _1349;
        _1355 = _1369;
    }
    float _1371 = _1355;
    if (_1261)
    {
        float _1373 = fma(_1319, _1313, _1359);
        _1321 = _1373;
    }
    float _1375 = _1321;
    if (_1261)
    {
        float _1377 = _1363 * _1363;
        _1367 = _1377;
    }
    float _1379 = _1367;
    if (!_1261)
    {
        _1339 = _1255;
    }
    float _1381 = _1339;
    float _1383 = _1381;
    if (_1261)
    {
        float _1385 = _1371 * _1371;
        _1383 = _1385;
    }
    float _1387 = _1383;
    float _1389 = fma(_1375, _1375, _1379);
    float _1391 = _1389 + _1387;
    float _1393 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1395 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1397 = fma(_1327, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1395);
    float _1399 = precise::clamp(_1397, 0.0, 1.0);
    float _1401 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1403 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1393);
    float _1405 = rsqrt(_1391);
    float _1407 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1409 = -_1399;
    float _1411 = _1409 + 1.0;
    float _1413 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1403);
    float _1415 = _1221 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1417 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1407);
    float _1419 = _1413 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1421 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1353);
    float _1423 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1417);
    float _1425 = abs(_1411);
    float _1427 = log2(_1425);
    float _1429 = _1419 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1431 = fma(_1223, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1415);
    float _1433 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1421);
    float _1435 = _1423 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1437 = -_1429;
    float _1439 = fma(_1437, _1401, 1.0);
    float _1441 = _1405 * _1363;
    float _1443 = fma(_1225, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1431);
    float _1445 = _1433 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1447 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1449 = _1405 * _1375;
    float _1451 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1453 = _1443 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1455 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1447);
    float _1457 = _1405 * _1371;
    float _1459 = -_1451;
    float _1461 = fma(_1449, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1459);
    float _1463 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1465 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1455);
    float _1467 = log2(_1439);
    float _1469 = -_1457;
    float _1471 = fma(_1469, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1461);
    float _1473 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1475 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1465);
    float _1477 = fma(_1471, -0.5, 0.5);
    float _1479 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1473);
    float _1481 = fma(_1471, 0.5, 0.5);
    float _1483 = exp2(_1463);
    float _1485 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1487 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1479);
    float _1489 = _1449 + 1.0;
    float _1491 = fma(_1481, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1493 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1485);
    float _1495 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1487);
    float _1497 = 1.0 / _1475;
    float _1499 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1493);
    float _1501 = fma(_1481, _1491, -0.212114393711090087890625);
    float _1503 = _1467 * 0.693147182464599609375;
    float _1505 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1499);
    float _1507 = fma(_1481, _1501, 1.570728778839111328125);
    float _1509 = _1503 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1511 = sqrt(_1477);
    float _1513 = -_1449;
    float _1515 = fma(_1483, _1489, _1513);
    float _1517 = fma(_1515, 0.5, 0.5);
    float _1519 = _1495 * _1497;
    float _1521 = _1505 * _1497;
    float _1523 = fma(_1519, 0.5, 0.5);
    float _1525 = fma(_1521, -0.5, 0.5);
    float _1527 = _1511 * 0.636619746685028076171875;
    float3 _4109 = float3(_1523, _1525, _1509);
    float _1529 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4109, float3(0.0), isnan(_4109)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4109, float3(0.0), isnan(_4109)), level(0.0)).x;
    float3 _4120 = float3(_1523, _1525, _1509);
    float4 _1532 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4120, float3(0.0), isnan(_4120)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4120, float3(0.0), isnan(_4120)), level(0.0)).xyzw;
    float _1534 = _1532.x;
    float _1536 = _1532.y;
    float _1538 = _1532.z;
    float _1540 = _1532.w;
    float _1542 = -_1507;
    float _1544 = fma(_1527, _1542, 1.0);
    float2 _4142 = float2(_1544, _1517);
    float3 _1548 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4142, float2(0.0), isnan(_4142)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4142, float2(0.0), isnan(_4142)), level(0.0)).xyz;
    float _1550 = _1548.x;
    float _1552 = _1548.y;
    float _1554 = _1548.z;
    float _1556 = _957 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1558 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1560 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1556);
    float _1562 = _957 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1564 = exp2(_1558);
    float _1566 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1560);
    float _1568 = fma(_741, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1562);
    bool _1570 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1572 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1574 = _1570 || _1572;
    bool _1576 = isnan(0.5);
    bool _1578 = _1574 || _1576;
    float _1580 = _1566 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1582 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1568);
    float _1584 = 1.0 / _1580;
    float _1586 = _1582 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1588 = _1586 + _1580;
    float _1590 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1592 = _1419;
    if (!_1578)
    {
        _999 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _1594 = _999;
    float _1596 = _1594;
    if (!_1578)
    {
        _1590 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _1598 = _1590;
    float _1600 = _1588 * _1584;
    float _1602 = _1600 * 0.5;
    float _1604 = _1584;
    float _1606 = _1598;
    if (!_1578)
    {
        float _1608 = -_1598;
        float _1610 = _1608 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _1604 = _1610;
    }
    float _1612 = _1604;
    float _1614 = _1612;
    if (!_1578)
    {
        float _1616 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1618 = fma(_1602, _1594, _1616);
        _1596 = _1618;
    }
    float _1620 = _1596;
    float _1622 = _1435 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1624 = _1622;
    if (!_1578)
    {
        float _1626 = 1.0 / _1612;
        _1614 = _1626;
    }
    float _1628 = _1614;
    float _1630 = fma(_1445, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1622);
    if (_1578)
    {
        _1624 = 1.0;
    }
    float _1632 = _1624;
    float _1634 = fma(_1419, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1630);
    float _1636 = _1620;
    float _1638 = _1632;
    if (!_1578)
    {
        float _1640 = 1.0 / _1620;
        _1636 = _1640;
    }
    float _1642 = _1636;
    if (!_1578)
    {
        float _1644 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1646 = -_1598;
        float _1648 = fma(_1642, _1644, _1646);
        _1606 = _1648;
    }
    float _1650 = _1606;
    if (!_1578)
    {
        float _1652 = _1650 * _1628;
        float _1654 = precise::clamp(_1652, 0.0, 1.0);
        _1592 = _1654;
    }
    float _1656 = _1592;
    float _1658 = fma(_1453, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1634);
    float _1660 = -_1564;
    float _1662 = _1660 + 1.0;
    if (!_1578)
    {
        float _1664 = -_1656;
        float _1666 = _1664 + 1.0;
        _1638 = _1666;
    }
    float _1668 = _1638;
    float _1670 = _1658 + _1475;
    float _1672 = _1662 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1674 = _1668 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1676 = _1670 * 0.5;
    bool _1678 = _1668 > 0.0;
    bool _1680 = isnan(_1668);
    bool _1682 = _1678 || _1680;
    bool _1684 = isnan(0.0);
    bool _1686 = _1682 || _1684;
    out.gl_Position.x = _1495;
    out.gl_Position.y = _1505;
    out.gl_Position.z = _1658;
    out.gl_Position.w = _1475;
    float _1688 = _1674 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_68.z = _1676;
    out.m_68.w = _1475;
    out.m_47.x = _1688;
    float _1690 = _1672 * _1529;
    float _1692 = -_1672;
    float _1694 = _1692 + 1.0;
    float _1696 = _1540 * _1690;
    float _1698 = _1554 * _1690;
    float _1700 = fma(_1550, _1696, _1534);
    float _1702 = fma(_1552, _1696, _1536);
    float _1704 = _1540 * _1694;
    float _1706 = fma(_1540, _1698, _1538);
    out.m_70.x = _1700;
    out.m_70.y = _1702;
    out.m_70.z = _1706;
    out.m_70.w = _1704;
    if (_1686)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1708 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1708;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

