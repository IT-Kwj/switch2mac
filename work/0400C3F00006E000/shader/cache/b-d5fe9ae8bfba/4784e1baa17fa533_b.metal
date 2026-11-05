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
    float4 m_56 [[user(locn0)]];
    float4 m_58 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_68 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_64 [[user(locn5)]];
    float4 m_66 [[user(locn6)]];
    float4 m_70 [[user(locn8)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_60 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _759 = false;
    bool _607 = false;
    bool _497 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3448 = as_type<float>(_105);
        out.gl_Position.z = _3448;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3517 = as_type<float>(_143);
        out.gl_Position.z = _3517;
    }
    if (_137)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    int _173 = as_type<int>(_145) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_145) & 2;
    bool _179 = _177 != 0;
    int _181 = int(_175);
    int _183 = _179 ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _159 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = as_type<float>(_207);
    float _211 = _147;
    if (!_159)
    {
        float _213 = _147 * _147;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_175;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_179;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_159)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_159;
    float _235 = _231;
    if (!_233)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _147 * _239;
        float _249 = 1.0 / _243;
        float _251 = _245 * 0.693147182464599609375;
        float _253 = exp2(_247);
        float _255 = 1.0 / _251;
        float _257 = _253 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _255, _147);
        float _263 = _261 * _249;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _265;
    }
    float _267 = _235;
    float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _271 = !_159;
    float _273 = _269;
    float _275 = _267;
    if (!_271)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _147 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _211 = _295;
    }
    float _297 = _211;
    float _299 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _303 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _305 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_159)
    {
        float _307 = _123 * _123;
        float _309 = _307 * 0.5;
        _273 = _309;
    }
    float _311 = _273;
    float _313 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _301);
    float _315 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].y, _303);
    float _317 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].z, _305);
    float _319 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _321 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _321;
    }
    float _323 = _275;
    bool _325 = !_159;
    float _327 = _323;
    if (!_325)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = _123 * _331;
        float _341 = 1.0 / _335;
        float _343 = _337 * 0.693147182464599609375;
        float _345 = exp2(_339);
        float _347 = 1.0 / _343;
        float _349 = _345 + (-1.0);
        float _351 = -_349;
        float _353 = fma(_351, _347, _123);
        float _355 = _353 * _341;
        float _357 = _355 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _357;
    }
    float _359 = _327;
    float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _363 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].x, _313);
    float _365 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].y, _315);
    float _367 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _371 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _373 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _375 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].z, _317);
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].x, _369);
    float _379 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].y, _371);
    float _381 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].z, _373);
    float _383 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _385 = fma(_297, _161, _363);
    float _387 = fma(_297, _163, _365);
    float _389 = fma(_297, _165, _375);
    float _391 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].x, _377);
    float _393 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].y, _379);
    float _395 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].z, _381);
    float _397 = _383;
    if (!_159)
    {
        _397 = _123;
    }
    float _399 = _397;
    bool _401 = !_159;
    float _403 = _399;
    if (!_401)
    {
        float _405 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _407 = log2(_405);
        float _409 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _411 = _409 + 1.0;
        float _413 = 1.0 / _411;
        float _415 = _123 * _407;
        float _417 = exp2(_415);
        float _419 = -_417;
        float _421 = _419 + 1.0;
        float _423 = _421 * _413;
        _403 = _423;
    }
    float _425 = _403;
    float _427 = fma(_425, _163, _393);
    float _429 = fma(_425, _165, _395);
    bool _431 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _433 = fma(_425, _161, _391);
    float _435 = fma(_387, _149, _169);
    float _437 = -_427;
    float _439 = _387 + _437;
    float _441 = fma(_385, _149, _167);
    float _443 = -_433;
    float _445 = _385 + _443;
    float _447 = -_429;
    float _449 = _389 + _447;
    float _451 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _453 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _455 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _457 = fma(_389, _149, _171);
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].x, _453);
    float _463 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
    float _467 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].z, _461);
    float _469 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].z, _463);
    bool _471 = !_431;
    float _473 = _467;
    float _475 = _465;
    float _477 = _469;
    float _495;
    if (!_471)
    {
        float _479 = in.m_54.x;
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _483 = _479 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = _493;
        _497 = true;
    }
    else
    {
        float _499 = float(_89);
        float _501 = 1.0 / _499;
        float _503 = _123 * _501;
        _495 = _503;
    }
    _497 = false;
    float _505 = _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _509 = _505 + _507;
    float _511 = in.m_52.x;
    float _513 = in.m_52.y;
    bool _515 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _517 = isnan(_505);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _527;
    bool _531 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _533 = isnan(_505);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -_525;
    float _545 = _543 + 1.0;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _547;
    float _551 = 1.0 / _529;
    bool _553 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _555 = _541 * _545;
    float _557 = -_541;
    float _559 = _557 + 1.0;
    float _561 = _509 * _551;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _563;
    float _567 = fma(_549, _561, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _569 = fma(_565, _561, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _571 = _567 * _555;
    float _573 = _569 * _555;
    float _575 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[143].x, _571);
    float _577 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[143].y, _573);
    float _579 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[144].x, _575);
    float _581 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[144].y, _577);
    float _583 = _579 * _511;
    float _585 = _581 * _513;
    bool _587 = !_553;
    float _605;
    if (!_587)
    {
        float _589 = in.m_54.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_89);
        float _611 = 1.0 / _609;
        float _613 = _123 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _615 + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _625 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _627 = isnan(_615);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _641 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _643 = isnan(_615);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _653;
    bool _657 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _659 = isnan(_615);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = 1.0 / _623;
    float _671 = -_635;
    float _673 = _671 + 1.0;
    bool _675 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _677 = _651 * _673;
    float _679 = -_651;
    float _681 = _679 + 1.0;
    float _683 = 1.0 / _639;
    float _685 = _655 * _669;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _691 = fma(_685, _619, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _693 = _689 * _683;
    float _695 = _691 * _677;
    float _697 = -_667;
    float _699 = _697 + 1.0;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _615 + _701;
    float _705 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[115].x, _695);
    float _707 = _635 * _699;
    float _709 = fma(_693, _703, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _713 = fma(_709, _707, _705);
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _719 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[117].x, _713);
    float _721 = _711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _723 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _725 = _717 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _727 = _719 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _721;
    out.m_56.y = _723;
    out.m_56.z = _725;
    out.m_56.w = _727;
    bool _729 = !_675;
    float _753;
    float _755;
    float _757;
    if (!_729)
    {
        float _731 = in.m_54.x;
        float _733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _735 = float(_89);
        float _737 = 1.0 / _735;
        float _739 = _731 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _741 = _123 * _737;
        float _743 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _745 = _743 * _733;
        float _747 = floor(_745);
        float _749 = -_747;
        float _751 = _745 + _749;
        _753 = _741;
        _755 = _735;
        _757 = _751;
        _759 = true;
    }
    else
    {
        float _761 = float(_89);
        float _763 = 1.0 / _761;
        float _765 = _123 * _763;
        _753 = _765;
        _755 = _761;
        _757 = _765;
    }
    _759 = false;
    float _767 = _753;
    float _769 = _755;
    float _771 = _757;
    float _773 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _775 = int(_773);
    float _777 = in.m_54.x;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _781 = _767 + _779;
    float _783 = _583 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _785;
    float _789 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _791 = int(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _805 = float(_775);
    float _807 = 1.0 / _769;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _815 = _813 != 0;
    float _817 = float(uint(_791));
    float _819 = 1.0 / _805;
    int _821 = ~_791;
    int _823 = _821 + 1;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _829 = float(_791);
    bool _831 = _791 == 0;
    float _833 = 1.0 / _817;
    bool _835 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _837 = isnan(_767);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _847;
    bool _851 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _853 = isnan(_771);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = _123 * _819;
    float _865 = 1.0 / _787;
    float _867 = _819;
    float _869 = _805;
    if (!_815)
    {
        float _871 = in.m_54.y;
        _867 = _871;
    }
    float _873 = _867;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _875;
    bool _879 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _881 = isnan(_767);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = -_845;
    float _893 = _891 + 1.0;
    bool _895 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _897 = isnan(_767);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    int _907 = as_type<int>(_833) + (-2);
    float _909 = trunc(_863);
    int _911 = int(_909);
    int _913 = ~_791;
    int _915 = _913 + 1;
    float _917 = 1.0 / _795;
    float _919 = float(uint(_911));
    float _921 = 1.0 / _799;
    if (!_815)
    {
        _869 = _873;
    }
    float _923 = _869;
    float _925 = as_type<float>(_907) * _919;
    float _927 = _923;
    int _929 = as_type<int>(_873);
    if (_815)
    {
        float _931 = in.m_54.x;
        float _933 = in.m_54.y;
        _927 = _931;
        _929 = as_type<int>(_933);
    }
    float _935 = _927;
    int _937 = _929;
    float _939 = trunc(_925);
    float _941 = precise::max(_939, 0.0);
    uint _944 = uint(_941);
    float _946 = 1.0 / _803;
    float _948 = float(_911);
    bool _950 = _948 >= _829;
    bool _952 = isnan(_948);
    bool _954 = _950 || _952;
    bool _956 = isnan(_829);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    int _962 = _915 * int(_944);
    int _964 = _962 + _911;
    float _966 = 1.0 / _811;
    float _968 = float(uint(_964));
    bool _970 = !_815;
    float _972 = _970 ? as_type<float>(_937) : _777;
    float _974 = trunc(_960);
    int _976 = int(_974);
    float _978 = as_type<float>(_907) * _968;
    bool _980 = !_815;
    float _982 = _980 ? 1.2345600128173828125 : 1.0;
    float _984 = trunc(_978);
    float _986 = precise::max(_984, 0.0);
    uint _988 = uint(_986);
    float _990 = _982 * _972;
    float _992 = floor(_990);
    int _994 = int(_944) + int(_988);
    float _996 = 1.0 / _827;
    int _998 = _823 * _994;
    int _1000 = _998 + _911;
    float _1002 = -_992;
    float _1004 = _990 + _1002;
    int _1006 = ~_976;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = _829 * _1004;
    bool _1014 = uint(_1000) >= uint(_791);
    float _1016 = _123 * _829;
    float _1018 = trunc(_1012);
    int _1020 = int(_1018);
    bool _1022 = !_1014;
    int _1024 = _1022 ? 0 : (-1);
    float _1026 = _1016 * _807;
    int _1028 = ~_994;
    int _1030 = _1028 + _1024;
    int _1032 = _1030 + 1;
    float _1034 = trunc(_1026);
    int _1036 = int(_1034);
    int _1038 = _791 * _1032;
    int _1040 = _1038 + _911;
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1044 = _1042 != 0;
    bool _1046 = !_831;
    int _1048 = _1046 ? _1040 : (-1);
    int _1050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1052 = _1050 != 0;
    int _1054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1056 = _1054 != 0;
    int _1058 = _791 + (-1);
    int _1060 = _1010 * _1048;
    bool _1062 = !_1044;
    int _1064 = _1062 ? 0 : 1;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1072 = _1070 != 0;
    int _1074 = _976 * _1058;
    int _1076 = _1074 + _1060;
    bool _1078 = !_1056;
    int _1080 = _1078 ? 0 : 1;
    bool _1082 = !_1052;
    int _1084 = _1082 ? 0 : 1;
    int _1086 = abs(_1064);
    bool _1088 = !_1068;
    int _1090 = _1088 ? 0 : 1;
    int _1092 = abs(_1080);
    int _1094 = _1020 * _1086;
    int _1096 = _1094 + _911;
    int _1098 = abs(_1084);
    bool _1100 = !_1072;
    int _1102 = _1100 ? 0 : 1;
    int _1104 = _1076 * _1092;
    int _1106 = abs(_1090);
    int _1108 = abs(_1102);
    float _1110 = in.m_54.z;
    int _1112 = _1036 * _1098;
    int _1114 = _1112 + _1104;
    int _1116 = ~_791;
    int _1118 = _1116 + 1;
    int _1120 = _1096 * _1106;
    int _1122 = _1120 + _1114;
    int _1124 = _1020 * _1108;
    int _1126 = _1124 + _1122;
    int _1128 = ~_791;
    int _1130 = _1128 + 1;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1136 = float(uint(_1126));
    float _1138 = as_type<float>(_907) * _1136;
    float _1140 = trunc(_1138);
    float _1142 = precise::max(_1140, 0.0);
    uint _1144 = uint(_1142);
    int _1146 = _1130 * int(_1144);
    int _1148 = _1146 + _1126;
    float _1150 = float(uint(_1148));
    float _1152 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1154 = log2(_1152);
    float _1156 = as_type<float>(_907) * _1150;
    float _1158 = trunc(_1156);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    int _1164 = int(_1144) + int(_1162);
    int _1166 = _1118 * _1164;
    int _1168 = _1166 + _1126;
    bool _1170 = uint(_1168) >= uint(_791);
    bool _1172 = !_1170;
    int _1174 = _1172 ? 0 : (-1);
    int _1176 = ~_1164;
    int _1178 = _1176 + _1174;
    int _1180 = _1178 + 1;
    float _1182 = in.m_54.w;
    int _1184 = _791 * _1180;
    int _1186 = _1184 + _1126;
    float _1188 = _777 * 2.0;
    bool _1190 = !_831;
    int _1192 = _1190 ? _1186 : (-1);
    float _1194 = floor(_1188);
    int _1196 = _1192 & 3;
    bool _1198 = _1196 != 0;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1204 = uint(_1196) > 1u;
    float _1206 = 1.0 / _1202;
    bool _1208 = _1182 > 0.5;
    int _1210 = _1198 ? 0 : 1;
    bool _1212 = _1110 > 0.5;
    bool _1214 = _1194 >= 0.0;
    bool _1216 = isnan(_1194);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan(0.0);
    bool _1222 = _1218 || _1220;
    float _1224 = -_221;
    int _1226 = _1212 ? as_type<int>(_1224) : as_type<int>(_221);
    int _1228 = ~_1210;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    bool _1234 = _1194 > 0.0;
    int _1236 = _1232;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_1204)
    {
        int _1240 = ~_1210;
        int _1242 = _1240 + 1;
        _1236 = _1242;
    }
    int _1244 = _1236;
    float _1246 = -_225;
    int _1248 = _1208 ? as_type<int>(_1246) : as_type<int>(_225);
    int _1250 = _1222 ? 0 : 1;
    bool _1252 = _777 > 0.5;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1260 = _1258 != 0;
    float _1262 = -_221;
    int _1264 = _1252 ? as_type<int>(_1262) : as_type<int>(_221);
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1280 = _1278 != 0;
    bool _1282 = !_1256;
    float _1284 = _1282 ? _221 : as_type<float>(_1226);
    float _1286 = 1.0 / _1134;
    float _1288 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1290 = ~_1250;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    bool _1296 = !_1260;
    float _1298 = _1296 ? _225 : as_type<float>(_1248);
    float _1300 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1288);
    float _1302 = _123 * _1154;
    int _1304 = _1294;
    if (!_1234)
    {
        int _1306 = ~_1250;
        int _1308 = _1306 + 1;
        _1304 = _1308;
    }
    int _1310 = _1304;
    float _1312 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1314 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1318 = _1316 != 0;
    float _1320 = exp2(_1302);
    float _1322 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1312);
    float _1324 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1314);
    float _1326 = _1110 * 2.0;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1330 = _1328 != 0;
    float _1332 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1322);
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1336 = _1334 != 0;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1340 = _771 + _1338;
    float _1342 = floor(_1326);
    float _1344 = _1340 * _865;
    float _1346 = 0.0;
    if (!_1280)
    {
        _1346 = _1110;
    }
    float _1348 = _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1356 = _1354 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1358 = _1348;
    if (!_1280)
    {
        _1238 = _1110;
    }
    float _1360 = _1238;
    float _1362 = -_1320;
    float _1364 = _1362 + 1.0;
    float _1366 = _1352 * _917;
    float _1368 = _1356 * _1206;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1374;
    float _1378 = _1360;
    if (_1280)
    {
        _1358 = as_type<float>(_937);
    }
    float _1380 = _1358;
    float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1382;
    if (_1280)
    {
        _1378 = as_type<float>(_937);
    }
    float _1386 = _1378;
    float _1388 = _1372 * _921;
    float _1390 = _1376 * _1286;
    bool _1392 = _1342 >= 0.0;
    bool _1394 = isnan(_1342);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan(0.0);
    bool _1400 = _1396 || _1398;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1408 = _1406 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1410 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1300);
    int _1412 = _1400 ? 0 : 1;
    float _1414 = _1404 * _946;
    bool _1416 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1418 = isnan(0.0);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1424 = _1420 || _1422;
    float _1426 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1324);
    float _1428 = _1408 * _966;
    float _1430 = _1424 ? _1364 : 0.0;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1434 = _767 + _1432;
    bool _1436 = _1342 > 0.0;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1438;
    bool _1442 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1444 = isnan(_767);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1450 = _1446 || _1448;
    float _1452 = float(_1450);
    float _1454 = fma(_849, _1344, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1456 = fma(_877, _1344, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1458 = fma(_1440, _1344, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1462 = _767 + _1460;
    float _1464 = fma(_1366, _1434, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1466 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1468 = isnan(_767);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    float _1478 = -_1452;
    float _1480 = _1478 + 1.0;
    float _1482 = _1384 * _996;
    float _1484 = fma(_1368, _1462, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1488 = _767 + _1486;
    bool _1490 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1492 = isnan(_767);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = _1476 * _1480;
    float _1504 = -_1476;
    float _1506 = _1504 + 1.0;
    float _1508 = fma(_1388, _1488, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1510 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1512 = isnan(_767);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1524 = _767 + _1522;
    float _1526 = _1500 * _1506;
    float _1528 = -_1500;
    float _1530 = _1528 + 1.0;
    bool _1532 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1534 = isnan(_767);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = -_1520;
    float _1546 = _1544 + 1.0;
    float _1548 = fma(_1482, _1524, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1550 = _1520 * _1530;
    bool _1552 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1554 = isnan(_771);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1560 = _1556 || _1558;
    float _1562 = float(_1560);
    float _1564 = _1542 * _1546;
    float _1566 = -_1542;
    float _1568 = _1566 + 1.0;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1572 = _767 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1576 = _767 + _1574;
    float _1578 = -_1562;
    float _1580 = _1578 + 1.0;
    float _1582 = _845 * _1568;
    float _1584 = _889 * _893;
    float _1586 = -_889;
    float _1588 = _1586 + 1.0;
    float _1590 = _861 * _1580;
    float _1592 = fma(_1390, _1572, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1594 = -_861;
    float _1596 = _1594 + 1.0;
    float _1598 = _1454 * _1590;
    float _1600 = _1458 * _1590;
    float _1602 = _905 * _1588;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1606 = 1.0 + _1604;
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1600);
    float _1610 = fma(_1414, _1576, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1614 = _1464 * _1602;
    float _1616 = -_905;
    float _1618 = _1616 + 1.0;
    float _1620 = _1456 * _1590;
    float _1622 = 1.0 / _1606;
    float _1624 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1614);
    float _1626 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1598);
    float _1628 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1620);
    float _1630 = fma(_1484, _1584, _1624);
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1634 = _935 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1636 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1628);
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1640 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1612);
    float _1642 = -_1632;
    float _1644 = fma(_1634, 2.0, _1642);
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1648 = as_type<float>(_937) * 2.0;
    bool _1650 = !_1330;
    float _1652 = _1650 ? _221 : as_type<float>(_1264);
    float _1654 = _777 + as_type<float>(_937);
    int _1656 = ~_1412;
    int _1658 = _1656 + 1;
    int _1660 = _1658 + 1;
    float _1662 = _1110 + as_type<float>(_937);
    int _1664 = _1660;
    if (!_1436)
    {
        int _1666 = ~_1412;
        int _1668 = _1666 + 1;
        _1664 = _1668;
    }
    int _1670 = _1664;
    float _1672 = _1654 + (-1.0);
    float _1674 = _1662 + (-1.0);
    float _1676 = floor(_1648);
    bool _1678 = !_1272;
    int _1680 = _1678 ? 0 : 1;
    float _1682 = _1430 * _1622;
    float _1684 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1686 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1688 = abs(_1680);
    float _1690 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1638);
    float _1692 = float(uint(_1096));
    float _1694 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1626);
    bool _1696 = as_type<float>(_937) > 0.5;
    float _1698 = fma(_1428, _781, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1700 = !_1268;
    int _1702 = _1700 ? 0 : 1;
    float _1704 = as_type<float>(_907) * _1692;
    float _1706 = -_225;
    int _1708 = _1696 ? as_type<int>(_1706) : as_type<int>(_225);
    float _1710 = _1332 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1712 = uint(_1196) >= 2u;
    float _1714 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1608);
    bool _1716 = _1676 >= 0.0;
    bool _1718 = isnan(_1676);
    bool _1720 = _1716 || _1718;
    bool _1722 = isnan(0.0);
    bool _1724 = _1720 || _1722;
    float _1726 = trunc(_1704);
    float _1728 = precise::max(_1726, 0.0);
    uint _1730 = uint(_1728);
    int _1732 = _1712 ? 0 : 1;
    float _1734 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1736 = _1676 > 0.0;
    float _1738 = fma(_1548, _1582, _1630);
    int _1740 = abs(_1702);
    float _1742 = _1410 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1744 = ~_791;
    int _1746 = _1744 + 1;
    float _1748 = _1284 + 0.5;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1752 = _1742 + _1750;
    float _1754 = float(_1688);
    float _1756 = -_123;
    float _1758 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1644);
    float _1760 = float(_1310);
    float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1764 = _1710 + _1762;
    float _1766 = float(_1740);
    float _1768 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1770 = float(_1670);
    float _1772 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1758);
    float _1774 = _1754 * _1760;
    int _1776 = _1192 >> 31;
    float _1778 = _1766 * _1770;
    float _1780 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1768);
    int _1782 = _1746 * int(_1730);
    int _1784 = _1782 + _1096;
    int _1786 = _1776 & 3;
    float _1788 = fma(_1734, -2.0, _1646);
    bool _1790 = !_1336;
    float _1792 = _1790 ? _225 : as_type<float>(_1708);
    float _1794 = fma(_1508, _1564, _1738);
    float _1796 = float(uint(_1784));
    float _1798 = _1298 + (-0.5);
    float _1800 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1788);
    int _1802 = _1192 + _1786;
    float _1804 = as_type<float>(_907) * _1796;
    float _1806 = fma(_1592, _1550, _1794);
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1810 = _1802 >> 2;
    float _1812 = -_1798;
    float _1814 = -_1800;
    float _1816 = fma(_1812, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1814);
    float _1818 = _1426 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1820 = trunc(_1804);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    int _1826 = _1810 << 4;
    int _1828 = _1826 + 512;
    float _1830 = _1694 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1832 = _1636 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1834 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    uint _1836 = uint(int(uint(_1828) >> uint(2)));
    uint _1838 = uint(int(uint(int(_1836)) >> uint(2)));
    int _1840 = int(_1836) & 3;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[int(_1838)][_1840];
    int _1844 = int(_1836) + 1;
    uint _1846 = uint(int(uint(_1844) >> uint(2)));
    int _1848 = _1844 & 3;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[int(_1846)][_1848];
    float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1854 = _1818 + _1852;
    float _1856 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1858 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1860 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1862 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1780);
    float _1864 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1690);
    float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1868 = _1828 + 8;
    uint _1870 = uint(int(uint(_1868) >> uint(2)));
    uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
    int _1874 = int(_1870) & 3;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[int(_1872)][_1874];
    int _1878 = int(_1870) + 1;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    int _1882 = _1878 & 3;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[int(_1880)][_1882];
    out.m_58.x = _1856;
    out.m_58.y = _1858;
    out.m_58.z = _1860;
    out.m_58.w = _1808;
    bool _1886 = _1862 >= 0.0;
    float _1888 = _1778 * (-2.0);
    int _1890 = _1724 ? 0 : 1;
    float _1892 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1640);
    int _1894 = int(_1730) + int(_1824);
    float _1896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1898 = ~_1890;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    float _1904 = -_1792;
    float _1906 = _1904 + 0.5;
    bool _1908 = _1196 != 3;
    float _1910 = in.m_60.x;
    float _1912 = in.m_60.y;
    float _1914 = in.m_60.z;
    int _1916 = _1902;
    if (!_1736)
    {
        int _1918 = ~_1890;
        int _1920 = _1918 + 1;
        _1916 = _1920;
    }
    int _1922 = _1916;
    float _1924 = _1652 + 0.5;
    int _1926 = _1192 & 3;
    bool _1928 = _1926 != 0;
    float _1930 = -_1864;
    float _1932 = _1930 + 1.0;
    int _1934 = ~_791;
    int _1936 = _1934 + 1;
    float _1938 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1940 = -_1892;
    float _1942 = _1940 + 1.0;
    float _1944 = fma(_1298, _1932, _1816);
    float _1946 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1948 = !_1928;
    int _1950 = _1948 ? 0 : 1;
    float _1952 = _1938 * _1866;
    int _1954 = abs(_1244);
    int _1956 = _1936 * _1894;
    int _1958 = _1956 + _1096;
    float _1960 = -_1942;
    float _1962 = fma(_1284, _1960, _1772);
    float _1964 = _1946 * _1896;
    float _1966 = fma(_1698, _1526, _1806);
    int _1968 = ~_1732;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    float _1974 = fma(_1684, _1888, _1684);
    bool _1976 = uint(_1958) >= uint(_791);
    out.m_62.x = _1952;
    out.m_62.y = _1964;
    out.m_62.z = _1962;
    out.m_62.w = _1944;
    int _1978 = _1972;
    if (_1908)
    {
        int _1980 = ~_1732;
        int _1982 = _1980 + 1;
        _1978 = _1982;
    }
    int _1984 = _1978;
    float _1986 = fma(_1610, _1502, _1966);
    bool _1988 = !_1976;
    int _1990 = _1988 ? 0 : (-1);
    float _1992 = fma(_1888, _1910, _1910);
    bool _1994 = _1196 != 3;
    float _1996 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1986);
    int _1998 = abs(_1950);
    float _2000 = _1774 * (-2.0);
    int _2002 = ~_1954;
    int _2004 = _2002 + 1;
    int _2006 = _2004 + 1;
    if (_1886)
    {
        out.m_45.x = 0.0;
    }
    int _2008 = abs(_1984);
    float _2010 = fma(_1686, _2000, _1686);
    int _2012 = ~_1894;
    int _2014 = _2012 + _1990;
    int _2016 = _2014 + 1;
    int _2018 = _2006 * as_type<int>(_1850);
    bool _2020 = !_1994;
    int _2022 = _2020 ? 0 : (-1);
    out.m_64.x = _1996;
    int _2024 = ~_1998;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    float _2030 = fma(_2000, _1912, _1912);
    bool _2032 = !_1318;
    int _2034 = _2032 ? 0 : 1;
    float _2036 = as_type<float>(_937) + (-0.5);
    int _2038 = abs(_2022);
    int _2040 = _2028 * as_type<int>(_1842);
    int _2042 = _2040 + _2018;
    float _2044 = _1752 * _1752;
    int _2046 = abs(_2034);
    float _2048 = _777 + (-0.5);
    int _2050 = ~_2008;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    float _2056 = fma(_1764, _1764, _2044);
    int _2058 = ~_2038;
    int _2060 = _2058 + 1;
    int _2062 = _2060 + 1;
    float _2064 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1992);
    int _2066 = _791 * _2016;
    int _2068 = _2066 + _1096;
    float _2070 = fma(_1854, _1854, _2056);
    int _2072 = _2054 * as_type<int>(_1876);
    int _2074 = _2072 + _2042;
    int _2076 = ~_2046;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    float _2082 = _783 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2084 = _791 == 0;
    int _2086 = _2062 * as_type<int>(_1884);
    int _2088 = _2086 + _2074;
    float _2090 = rsqrt(_2070);
    float _2092 = as_type<float>(_2042);
    if (_1886)
    {
        _2092 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2094 = _2092;
    bool _2096 = !_2084;
    int _2098 = _2096 ? _2068 : (-1);
    int _2100 = _2080 * _2088;
    bool _2102 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2104 = isnan(1.0);
    bool _2106 = _2102 || _2104;
    bool _2108 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2110 = _2106 || _2108;
    int _2112 = as_type<int>(_2094);
    if (_1886)
    {
        float _2114 = _2094 * 5.0;
        _2112 = as_type<int>(_2114);
    }
    int _2116 = _2112;
    int _2118 = _2098 * _2046;
    int _2120 = _2118 + _2100;
    bool _2122 = !_2110;
    float _2124 = _2122 ? _123 : _1682;
    bool _2126 = !_1276;
    int _2128 = _2126 ? 0 : 1;
    if (_1886)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6530 = as_type<float>(_2116);
        out.gl_Position.z = _6530;
    }
    float _2130 = float(_2120);
    float _2132 = fma(_2124, _1974, _2064);
    float _2134 = _2082 * _2090;
    out.m_66.y = _2130;
    float _2136 = _1764 * _2134;
    float _2138 = _1752 * _2134;
    int _2140 = abs(_2128);
    if (_1886)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2142 = -_2138;
    float _2144 = _1742 + _2142;
    float _2146 = _1854 * _2134;
    float _2148 = -_2136;
    float _2150 = _1710 + _2148;
    float _2152 = _2132 * 0.15915493667125701904296875;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2156 = _2144 + _2154;
    float _2158 = -_2146;
    float _2160 = _1818 + _2158;
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2164 = _2150 + _2162;
    float _2166 = float(_2140);
    float _2168 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2170 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2172 = _2160 + _2170;
    float _2174 = float(_1922);
    float _2176 = -_2138;
    float _2178 = _1752 + _2176;
    float _2180 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2168);
    float _2182 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2030);
    float _2184 = -_2136;
    float _2186 = _1764 + _2184;
    float _2188 = _2166 * _2174;
    float _2190 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2180);
    float _2192 = _2178 * _2178;
    float _2194 = _777 + _1110;
    float _2196 = _2188 * (-2.0);
    float _2198 = fma(_2124, _2010, _2182);
    bool _2200 = _2190 >= 0.0;
    float _2202 = fma(_2186, _2186, _2192);
    float _2204 = -_2146;
    float _2206 = _1854 + _2204;
    float _2208 = _1110 + (-0.5);
    float _2210 = _2194 + (-1.0);
    float _2212 = fma(_2196, _1914, _1914);
    float _2214 = _2198 * 0.15915493667125701904296875;
    float _2216 = fma(_2206, _2206, _2202);
    float _2218 = fma(_2210, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2220 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2212);
    float _2222 = _2152 * 6.283185482025146484375;
    float _2224 = sin(_2222);
    float _2226 = _2168;
    int _2228 = as_type<int>(_2212);
    float _2230 = _2164;
    float _2232 = _2160;
    if (_2200)
    {
        _2226 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2234 = _2226;
    float _2236 = fma(_2218, _2196, _2218);
    if (_2200)
    {
        out.m_45.x = 0.0;
    }
    if (_2200)
    {
        float _2238 = _2234 * 5.0;
        _2228 = as_type<int>(_2238);
    }
    int _2240 = _2228;
    float _2242 = _2152 * 6.283185482025146484375;
    float _2244 = cos(_2242);
    float _2246 = fma(_2124, _2236, _2220);
    if (_2200)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6723 = as_type<float>(_2240);
        out.gl_Position.z = _6723;
    }
    float _2248 = _2246 * 0.15915493667125701904296875;
    float _2250 = _2214 * 6.283185482025146484375;
    float _2252 = sin(_2250);
    float _2254 = sqrt(_2216);
    float _2256 = _2214 * 6.283185482025146484375;
    float _2258 = cos(_2256);
    if (_2200)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2260 = _2248 * 6.283185482025146484375;
    float _2262 = cos(_2260);
    float _2264 = _2090 * _2254;
    float _2266 = _585 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2272 = _783 * _2264;
    float _2274 = _2264 * _2266;
    float _2276 = _2244 * _2258;
    float _2278 = _2248 * 6.283185482025146484375;
    float _2280 = sin(_2278);
    float _2282 = _2270 * _2272;
    float _2284 = _2268 * _2274;
    float _2286 = _2224 * _2252;
    float _2288 = _2244 * _2252;
    float _2290 = _2264 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2292 = _2290 * 0.5;
    float _2294 = _2262 * _2284;
    float _2296 = _2252 * _2262;
    float _2298 = _2258 * _2262;
    float _2300 = _2224 * _2258;
    float _2302 = _2244 * _2294;
    float _2304 = fma(_2280, _2276, _2286);
    float _2306 = -_2284;
    float _2308 = _2280 * _2306;
    float _2310 = -_2300;
    float _2312 = fma(_2280, _2288, _2310);
    float _2314 = -_2288;
    float _2316 = fma(_2280, _2300, _2314);
    float _2318 = fma(_2304, _2282, _2302);
    float _2320 = _2224 * _2294;
    float _2322 = fma(_2298, _2282, _2308);
    float _2324 = fma(_2280, _2286, _2276);
    float _2326 = fma(_2312, _2292, _2318);
    float _2328 = fma(_2316, _2282, _2320);
    float _2330 = fma(_2296, _2292, _2322);
    float _2332 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2334 = fma(_2324, _2292, _2328);
    float _2336 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2338 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2332);
    float _2340 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2336);
    float _2342 = fma(_2334, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2338);
    float _2344 = fma(_2334, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2340);
    float _2346 = _2342 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2348 = _2344 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2350 = _1818 + _2346;
    float _2352 = _1710 + _2348;
    float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2356 = _2350 + _2354;
    float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2360 = _2352 + _2358;
    float _2362 = _2356 * _2356;
    float _2364 = fma(_2360, _2360, _2362);
    float _2366 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2368 = sqrt(_2364);
    float _2370 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2366);
    float _2372 = fma(_2334, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2370);
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2376 = _1742 + _2374;
    bool _2378 = _2368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2380 = _2374;
    float _2382 = _2352;
    float _2384 = _2350;
    float _2386 = _2376;
    float _2388 = _2296;
    float _2390 = _2356;
    float _2392 = _2364;
    if (!_2378)
    {
        _2380 = _2376;
    }
    float _2394 = _2380;
    bool _2396 = !_2378;
    float _2398 = _2394;
    if (!_2396)
    {
        float _2400 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2404 = _2368 + _2402;
        float _2406 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2408 = rsqrt(_2364);
        float _2410 = _2404 * _2400;
        float _2412 = _2410 * 0.15915493667125701904296875;
        float _2414 = _2412 * 6.283185482025146484375;
        float _2416 = cos(_2414);
        float _2418 = _2412 * 6.283185482025146484375;
        float _2420 = sin(_2418);
        float _2422 = _2416 + (-1.0);
        float _2424 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2426 = fma(_2420, _2406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2428 = fma(_2376, _2416, _2424);
        float _2430 = _2408 * _2426;
        float _2432 = fma(_2360, _2430, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2434 = fma(_2356, _2430, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2398 = _2428;
        _2382 = _2432;
        _2384 = _2434;
    }
    float _2436 = _2398;
    float _2438 = _2382;
    float _2440 = _2384;
    float _2442 = -_1742;
    float _2444 = _2442 + _2436;
    float _2446 = -_1710;
    float _2448 = _2446 + _2438;
    float _2450 = -_1818;
    float _2452 = _2450 + _2440;
    float _2454 = _2444 * _2444;
    float _2456 = fma(_2448, _2448, _2454);
    float _2458 = fma(_2452, _2452, _2456);
    float _2460 = sqrt(_2458);
    bool _2462 = _2460 > 0.0;
    float _2464 = _2460;
    float _2466 = _2440;
    if (!_2462)
    {
        _2386 = _2438;
    }
    float _2468 = _2386;
    float _2470 = _2468;
    float _2472 = _2468;
    if (!_2462)
    {
        _2464 = _2436;
    }
    float _2474 = _2464;
    bool _2476 = !_2462;
    float _2478 = _2474;
    if (!_2476)
    {
        bool _2480 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2482 = _2474;
        if (_2480)
        {
            float _2484 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2482 = _2484;
        }
        float _2486 = _2482;
        float _2488 = _2486;
        if (_2480)
        {
            float _2490 = _465 * _2486;
            _2388 = _2490;
        }
        float _2492 = _2388;
        float _2494 = _2492;
        if (_2480)
        {
            float _2496 = _467 * _2486;
            _2390 = _2496;
        }
        float _2498 = _2390;
        float _2500 = _2498;
        if (_2480)
        {
            float _2502 = _469 * _2486;
            _2392 = _2502;
        }
        float _2504 = _2392;
        float _2506 = _2504;
        if (!_2480)
        {
            bool _2508 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2510 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2512 = _2508 || _2510;
            bool _2514 = isnan(1.0);
            bool _2516 = _2512 || _2514;
            float _2518 = _123 + 1.0;
            float _2520 = _2518;
            if (!_2516)
            {
                float _2522 = _2518 * _2518;
                float _2524 = _2522 * 0.5;
                _127 = _2524;
            }
            float _2526 = _127;
            float _2528 = _2526;
            if (!_2516)
            {
                float _2530 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2528 = _2530;
            }
            float _2532 = _2528;
            bool _2534 = !_2516;
            float _2536 = _2532;
            if (!_2534)
            {
                float _2538 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2540 = log2(_2538);
                float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2544 = 1.0 + _2542;
                float _2546 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2548 = _2540 * _2518;
                float _2550 = 1.0 / _2544;
                float _2552 = _2546 * 0.693147182464599609375;
                float _2554 = exp2(_2548);
                float _2556 = 1.0 / _2552;
                float _2558 = _2554 + (-1.0);
                float _2560 = -_2558;
                float _2562 = fma(_2560, _2556, _2518);
                float _2564 = _2562 * _2550;
                float _2566 = _2564 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2536 = _2566;
            }
            float _2568 = _2536;
            float _2570 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2572 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2574 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2576 = _2570 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2578 = _2570 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2580 = _2570 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2582 = fma(_2572, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2576);
            float _2584 = fma(_2572, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2578);
            float _2586 = fma(_2574, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2582);
            bool _2588 = !_2516;
            _2488 = _2586;
            if (!_2588)
            {
                float _2590 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2592 = log2(_2590);
                float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2596 = 1.0 + _2594;
                float _2598 = 1.0 / _2596;
                float _2600 = _2592 * _2518;
                float _2602 = exp2(_2600);
                float _2604 = -_2602;
                float _2606 = _2604 + 1.0;
                float _2608 = _2606 * _2598;
                _2520 = _2608;
            }
            float _2610 = _2520;
            float _2612 = fma(_2572, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2580);
            float _2614 = fma(_2574, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2584);
            float _2616 = fma(_2610, _163, _2586);
            float _2618 = fma(_2574, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2612);
            float _2620 = fma(_2610, _161, _2614);
            float _2622 = -_427;
            float _2624 = _2622 + _2616;
            float _2626 = fma(_2610, _165, _2618);
            float _2628 = -_433;
            float _2630 = _2628 + _2620;
            float _2632 = _2624 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2634 = _2624 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2636 = _2624 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2638 = -_429;
            float _2640 = _2638 + _2626;
            float _2642 = fma(_2630, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2632);
            float _2644 = fma(_2630, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2634);
            float _2646 = fma(_2630, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2636);
            float _2648 = fma(_2640, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2642);
            float _2650 = fma(_2640, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2644);
            float _2652 = fma(_2640, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2646);
            _473 = _2650;
            _475 = _2648;
            _477 = _2652;
            _2494 = _2648;
            _2500 = _2650;
            _2506 = _2652;
            _2470 = _2614;
        }
        float _2654 = _473;
        float _2656 = _475;
        float _2658 = _477;
        float _2660 = _2494;
        float _2662 = _2500;
        float _2664 = _2506;
        float _2666 = _2488;
        float _2668 = _2470;
        float _2670 = _2654 * _2654;
        float _2672 = rsqrt(_2458);
        float _2674 = fma(_2656, _2656, _2670);
        float _2676 = fma(_2658, _2658, _2674);
        float _2678 = sqrt(_2676);
        float _2680 = _2448 * _2672;
        float _2682 = _2444 * _2672;
        float _2684 = _2452 * _2672;
        bool _2686 = _2678 > 0.0;
        float _2688 = _2668;
        float _2690 = _2666;
        if (!_2686)
        {
            _2688 = _2438;
        }
        float _2692 = _2688;
        _2472 = _2692;
        if (!_2686)
        {
            _2690 = _2436;
        }
        float _2694 = _2690;
        bool _2696 = !_2686;
        _2478 = _2694;
        if (!_2696)
        {
            float _2698 = rsqrt(_2676);
            float _2700 = _2698 * _2654;
            float _2702 = _2698 * _2656;
            float _2704 = _2698 * _2658;
            float _2706 = _2682 * _2700;
            float _2708 = fma(_2680, _2702, _2706);
            float _2710 = fma(_2684, _2704, _2708);
            float _2712 = _2710 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2714 = fma(_2660, _2712, _2438);
            float _2716 = fma(_2662, _2712, _2436);
            float _2718 = fma(_2664, _2712, _2440);
            _2478 = _2716;
            _2466 = _2718;
            _2472 = _2714;
        }
    }
    float _2720 = _2478;
    float _2722 = _2466;
    float _2724 = _2472;
    float _2726 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2728 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2730 = isnan(0.5);
    bool _2732 = _2728 || _2730;
    bool _2734 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2736 = _2732 || _2734;
    float _2738 = -_2138;
    float _2740 = _2738 + _2720;
    bool _2742 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2744 = isnan(0.5);
    bool _2746 = _2742 || _2744;
    bool _2748 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2750 = _2746 || _2748;
    float _2752 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2726);
    float _2754 = -_2146;
    float _2756 = _2754 + _2722;
    float _2758 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2752);
    float _2760 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2762 = _2758 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2764 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2760);
    float _2766 = 1.0 / _2762;
    float _2768 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2764);
    float _2770 = _2768 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2772 = _2770 + _2762;
    float _2774 = _2772 * _2766;
    float _2776 = _2774 * 0.5;
    float _2778 = -_2136;
    float _2780 = _2778 + _2724;
    float _2782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2784 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2782);
    float _2786 = _2776;
    float _2788 = _2740;
    float _2790 = _2780;
    float _2792 = _2756;
    float _2794 = _2762;
    if (_2750)
    {
        _2786 = 1.0;
    }
    float _2796 = _2786;
    float _2798 = 1.0 / _2784;
    float _2800 = _2796;
    if (!_2736)
    {
        float _2802 = _2156 * _2156;
        float _2804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2806 = -_1818;
        float _2808 = _2806 + _2722;
        float _2810 = -_1710;
        float _2812 = _2810 + _2724;
        float _2814 = fma(_2164, _2164, _2802);
        float _2816 = -_1742;
        float _2818 = _2816 + _2720;
        float _2820 = fma(_2172, _2172, _2814);
        float _2822 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2824 = sqrt(_2820);
        float _2826 = 1.0 / _2264;
        float _2828 = _2822 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2830 = precise::min(_2824, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2832 = _2830 * _2804;
        float _2834 = _2832 * _2826;
        float _2836 = _2828 * _2834;
        float _2838 = _2808 * _2834;
        float _2840 = fma(_2812, _2836, _2150);
        float _2842 = fma(_2818, _2836, _2144);
        float _2844 = fma(_2828, _2838, _2160);
        _2788 = _2842;
        _2790 = _2840;
        _2792 = _2844;
        _2230 = _2824;
        _2794 = _2834;
    }
    float _2846 = _2788;
    float _2848 = _2790;
    float _2850 = _2792;
    float _2852 = _2230;
    float _2854 = _2794;
    float _2856 = _2854;
    float _2858 = _2852;
    if (_2750)
    {
        _2856 = 1.0;
    }
    float _2860 = _2856;
    float _2862 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2864 = _2798 * _2862;
    float _2866 = _2860;
    if (!_2750)
    {
        float _2868 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2870 = _2868 * 0.15915493667125701904296875;
        float _2872 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2874 = _2870 * 6.283185482025146484375;
        float _2876 = cos(_2874);
        float _2878 = _2872 * 0.15915493667125701904296875;
        float _2880 = _2870 * 6.283185482025146484375;
        float _2882 = sin(_2880);
        float _2884 = 1.0 / _2876;
        float _2886 = _2878 * 6.283185482025146484375;
        float _2888 = cos(_2886);
        float _2890 = _2882 * _2884;
        float _2892 = _2878 * 6.283185482025146484375;
        float _2894 = sin(_2892);
        float _2896 = _2888 * _2890;
        float _2898 = 1.0 / _2896;
        float _2900 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2902 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2900;
        float _2904 = 1.0 / _2902;
        float _2906 = _2894 * _2898;
        float _2908 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2910 = fma(_2864, _2906, _2908);
        float _2912 = _2910 * _2904;
        float _2914 = precise::clamp(_2912, 0.0, 1.0);
        _2232 = _2904;
        _2800 = _2914;
    }
    float _2916 = _2232;
    float _2918 = _2800;
    float _2920 = _2916;
    if (!_2750)
    {
        float _2922 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2924 = _2922 * 0.15915493667125701904296875;
        float _2926 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2928 = _2924 * 6.283185482025146484375;
        float _2930 = cos(_2928);
        float _2932 = _2926 * 0.15915493667125701904296875;
        float _2934 = _2924 * 6.283185482025146484375;
        float _2936 = sin(_2934);
        float _2938 = 1.0 / _2930;
        float _2940 = _2932 * 6.283185482025146484375;
        float _2942 = cos(_2940);
        float _2944 = _2936 * _2938;
        float _2946 = _2932 * 6.283185482025146484375;
        float _2948 = sin(_2946);
        float _2950 = _2942 * _2944;
        float _2952 = 1.0 / _2950;
        float _2954 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2956 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2954;
        float _2958 = 1.0 / _2956;
        float _2960 = _2948 * _2952;
        float _2962 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2964 = fma(_2864, _2960, _2962);
        float _2966 = _2964 * _2958;
        float _2968 = precise::clamp(_2966, 0.0, 1.0);
        float _2970 = -_2968;
        float _2972 = _2970 + 1.0;
        _2858 = _2960;
        _2920 = _2938;
        _2866 = _2972;
    }
    float _2974 = _2858;
    float _2976 = _2920;
    float _2978 = _2866;
    float _2980 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2982 = _2846 + _2980;
    float _2984 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2986 = _2848 + _2984;
    float _2988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2990 = _2850 + _2988;
    float _2992 = _2982 * _2982;
    float _2994 = fma(_2986, _2986, _2992);
    float _2996 = fma(_2990, _2990, _2994);
    float _2998 = rsqrt(_2996);
    float _3000 = sqrt(_2996);
    float _3002 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3004 = _2986 * _3002;
    float _3006 = _2990 * _3002;
    float _3008 = _3004 * _3004;
    float _3010 = _3006 * _3006;
    float _3012 = _3008 + _3010;
    float _3014 = sqrt(_3012);
    bool _3016 = _3014 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3020 = _3014 + _3018;
    float _3022 = _2998;
    float _3024 = _3020;
    float _3026 = _2974;
    float _3028 = _2982;
    float _3030 = _3002;
    if (_3016)
    {
        float _3032 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3022 = _3032;
    }
    float _3034 = _3022;
    float _3036 = _3034;
    if (_3016)
    {
        float _3038 = _3020 * _3034;
        _3024 = _3038;
    }
    float _3040 = _3024;
    if (_3016)
    {
        float _3042 = rsqrt(_3012);
        _3036 = _3042;
    }
    float _3044 = _3036;
    float _3046 = _3044;
    if (_3016)
    {
        float _3048 = _3040 * 0.15915493667125701904296875;
        _3026 = _3048;
    }
    float _3050 = _3026;
    float _3052 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3054 = _2990;
    float _3056 = _3050;
    if (_3016)
    {
        float _3058 = _3050 * 6.283185482025146484375;
        float _3060 = sin(_3058);
        _3054 = _3060;
    }
    float _3062 = _3054;
    float _3064 = precise::max(0.0, _3052);
    float _3066 = _2976;
    float _3068 = _3064;
    if (_3016)
    {
        float _3070 = _3050 * 6.283185482025146484375;
        float _3072 = cos(_3070);
        _3066 = _3072;
    }
    float _3074 = _3066;
    float _3076 = -_3002;
    float _3078 = -_3064;
    float _3080 = fma(_2982, _3076, _3078);
    if (_3016)
    {
        float _3082 = _3080 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3028 = _3082;
    }
    float _3084 = _3028;
    float _3086 = _3062;
    float _3088 = _3084;
    if (_3016)
    {
        float _3090 = fma(_3062, _3084, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3086 = _3090;
    }
    float _3092 = _3086;
    float _3094 = _3092;
    if (!_3016)
    {
        _3088 = _3080;
    }
    float _3096 = _3088;
    float _3098 = _3096;
    if (_3016)
    {
        float _3100 = _3044 * _3092;
        _3030 = _3100;
    }
    float _3102 = _3030;
    if (!_3016)
    {
        _3046 = _3004;
    }
    float _3104 = _3046;
    float _3106 = _3104;
    float _3108 = _3074;
    if (_3016)
    {
        float _3110 = _3074 + (-1.0);
        _3068 = _3110;
    }
    float _3112 = _3068;
    float _3114 = _3112;
    if (_3016)
    {
        float _3116 = _3004 * _3102;
        _3106 = _3116;
    }
    float _3118 = _3106;
    if (!_3016)
    {
        _3094 = _3008;
    }
    float _3120 = _3094;
    float _3122 = _3120;
    if (_3016)
    {
        float _3124 = _3112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3056 = _3124;
    }
    float _3126 = _3056;
    if (!_3016)
    {
        _3114 = _3006;
    }
    float _3128 = _3114;
    float _3130 = _3128;
    if (_3016)
    {
        float _3132 = _3006 * _3102;
        _3130 = _3132;
    }
    float _3134 = _3130;
    if (_3016)
    {
        float _3136 = _3118 * _3118;
        _3122 = _3136;
    }
    float _3138 = _3122;
    if (_3016)
    {
        float _3140 = fma(_3080, _3074, _3126);
        _3098 = _3140;
    }
    float _3142 = _3098;
    if (!_3016)
    {
        _3108 = _3010;
    }
    float _3144 = _3108;
    float _3146 = _3144;
    if (_3016)
    {
        float _3148 = _3134 * _3134;
        _3146 = _3148;
    }
    float _3150 = _3146;
    float _3152 = fma(_3142, _3142, _3138);
    float _3154 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3156 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3158 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3160 = _3152 + _3150;
    float _3162 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3164 = fma(_3000, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3162);
    float _3166 = precise::clamp(_3164, 0.0, 1.0);
    float _3168 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3154);
    float _3170 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3172 = rsqrt(_3160);
    float _3174 = -_3166;
    float _3176 = _3174 + 1.0;
    float _3178 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3158);
    float _3180 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3168);
    float _3182 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3184 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3170);
    float _3186 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3178);
    float _3188 = _3180 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3190 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3182);
    float _3192 = abs(_3176);
    float _3194 = log2(_3192);
    float _3196 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3184);
    float _3198 = _3186 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3200 = _3188 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3202 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3190);
    float _3204 = _3196 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3206 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3208 = _3172 * _3118;
    float _3210 = -_3200;
    float _3212 = fma(_3210, _3156, 1.0);
    float _3214 = _3202 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3216 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3206);
    float _3218 = _3172 * _3142;
    float _3220 = _3208 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3222 = _3172 * _3134;
    float _3224 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3216);
    float _3226 = log2(_3212);
    float _3228 = -_3220;
    float _3230 = fma(_3218, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3228);
    float _3232 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3234 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3224);
    float _3236 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3238 = -_3222;
    float _3240 = fma(_3238, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3230);
    float _3242 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3244 = exp2(_3232);
    float _3246 = fma(_3240, -0.5, 0.5);
    float _3248 = fma(_3240, 0.5, 0.5);
    float _3250 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3242);
    float _3252 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3236);
    float _3254 = _3218 + 1.0;
    float _3256 = fma(_3248, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3258 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3250);
    float _3260 = 1.0 / _3234;
    float _3262 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3252);
    float _3264 = fma(_3248, _3256, -0.212114393711090087890625);
    float _3266 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3258);
    float _3268 = _3226 * 0.693147182464599609375;
    float _3270 = fma(_3248, _3264, 1.570728778839111328125);
    float _3272 = sqrt(_3246);
    float _3274 = -_3218;
    float _3276 = fma(_3244, _3254, _3274);
    float _3278 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3262);
    float _3280 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3282 = fma(_3276, 0.5, 0.5);
    float _3284 = _3266 * _3260;
    float _3286 = _3278 * _3260;
    float _3288 = fma(_3284, 0.5, 0.5);
    float _3290 = fma(_3286, -0.5, 0.5);
    float _3292 = _3272 * 0.636619746685028076171875;
    float _3294 = -_3270;
    float _3296 = fma(_3292, _3294, 1.0);
    float3 _8352 = float3(_3288, _3290, _3280);
    float _3298 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8352, float3(0.0), isnan(_8352)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8352, float3(0.0), isnan(_8352)), level(0.0)).x;
    float3 _8363 = float3(_3288, _3290, _3280);
    float4 _3301 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8363, float3(0.0), isnan(_8363)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8363, float3(0.0), isnan(_8363)), level(0.0)).xyzw;
    float _3303 = _3301.x;
    float _3305 = _3301.y;
    float _3307 = _3301.z;
    float _3309 = _3301.w;
    float2 _8380 = float2(_3296, _3282);
    float3 _3313 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8380, float2(0.0), isnan(_8380)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8380, float2(0.0), isnan(_8380)), level(0.0)).xyz;
    float _3315 = _3313.x;
    float _3317 = _3313.y;
    float _3319 = _3313.z;
    float _3321 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3323 = _2918 > 0.0;
    bool _3325 = isnan(_2918);
    bool _3327 = _3323 || _3325;
    bool _3329 = isnan(0.0);
    bool _3331 = _3327 || _3329;
    float _3333 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3321);
    float _3335 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3337 = _2978 <= 0.0;
    bool _3339 = !_3331;
    bool _3341 = _3337 || _3339;
    float _3343 = _3266 + _3234;
    float _3345 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3333);
    float _3347 = _2918 * _2978;
    float _3349 = exp2(_3335);
    float _3351 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3345);
    float _3353 = _3347 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3355 = _3234 * 0.5;
    float _3357 = _3351 + _3234;
    float _3359 = _3343 * 0.5;
    out.gl_Position.x = _3266;
    out.gl_Position.y = _3278;
    out.gl_Position.z = _3351;
    out.gl_Position.w = _3234;
    float _3361 = _3357 * 0.5;
    float _3363 = -_3349;
    float _3365 = _3363 + 1.0;
    float _3367 = fma(_3278, -0.5, _3355);
    float _3369 = _3353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3371 = _3365 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3359;
    out.m_68.y = _3367;
    out.m_68.z = _3361;
    out.m_68.w = _3234;
    float _3373 = -_3371;
    float _3375 = _3373 + 1.0;
    out.m_45.x = _3369;
    float _3377 = _3371 * _3298;
    float _3379 = _3309 * _3375;
    float _3381 = _3309 * _3377;
    float _3383 = _3319 * _3377;
    float _3385 = fma(_3315, _3381, _3303);
    float _3387 = fma(_3317, _3381, _3305);
    float _3389 = fma(_3309, _3383, _3307);
    out.m_70.x = _3385;
    out.m_70.y = _3387;
    out.m_70.z = _3389;
    out.m_70.w = _3379;
    if (!_3341)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3391 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3391;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _759 = false;
    bool _607 = false;
    bool _497 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3448 = as_type<float>(_105);
        out.gl_Position.z = _3448;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3517 = as_type<float>(_143);
        out.gl_Position.z = _3517;
    }
    if (_137)
    {
        return out;
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    int _173 = as_type<int>(_145) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_145) & 2;
    bool _179 = _177 != 0;
    int _181 = int(_175);
    int _183 = _179 ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _159 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = as_type<float>(_207);
    float _211 = _147;
    if (!_159)
    {
        float _213 = _147 * _147;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_175;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_179;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_159)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_159;
    float _235 = _231;
    if (!_233)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _147 * _239;
        float _249 = 1.0 / _243;
        float _251 = _245 * 0.693147182464599609375;
        float _253 = exp2(_247);
        float _255 = 1.0 / _251;
        float _257 = _253 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _255, _147);
        float _263 = _261 * _249;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _265;
    }
    float _267 = _235;
    float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _271 = !_159;
    float _273 = _269;
    float _275 = _267;
    if (!_271)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _147 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _211 = _295;
    }
    float _297 = _211;
    float _299 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _303 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _305 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_159)
    {
        float _307 = _123 * _123;
        float _309 = _307 * 0.5;
        _273 = _309;
    }
    float _311 = _273;
    float _313 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _301);
    float _315 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].y, _303);
    float _317 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].z, _305);
    float _319 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _321 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _321;
    }
    float _323 = _275;
    bool _325 = !_159;
    float _327 = _323;
    if (!_325)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = _123 * _331;
        float _341 = 1.0 / _335;
        float _343 = _337 * 0.693147182464599609375;
        float _345 = exp2(_339);
        float _347 = 1.0 / _343;
        float _349 = _345 + (-1.0);
        float _351 = -_349;
        float _353 = fma(_351, _347, _123);
        float _355 = _353 * _341;
        float _357 = _355 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _357;
    }
    float _359 = _327;
    float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _363 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].x, _313);
    float _365 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].y, _315);
    float _367 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _371 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _373 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _375 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].z, _317);
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].x, _369);
    float _379 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].y, _371);
    float _381 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].z, _373);
    float _383 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _385 = fma(_297, _161, _363);
    float _387 = fma(_297, _163, _365);
    float _389 = fma(_297, _165, _375);
    float _391 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].x, _377);
    float _393 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].y, _379);
    float _395 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].z, _381);
    float _397 = _383;
    if (!_159)
    {
        _397 = _123;
    }
    float _399 = _397;
    bool _401 = !_159;
    float _403 = _399;
    if (!_401)
    {
        float _405 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _407 = log2(_405);
        float _409 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _411 = _409 + 1.0;
        float _413 = 1.0 / _411;
        float _415 = _123 * _407;
        float _417 = exp2(_415);
        float _419 = -_417;
        float _421 = _419 + 1.0;
        float _423 = _421 * _413;
        _403 = _423;
    }
    float _425 = _403;
    float _427 = fma(_425, _163, _393);
    float _429 = fma(_425, _165, _395);
    bool _431 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _433 = fma(_425, _161, _391);
    float _435 = fma(_387, _149, _169);
    float _437 = -_427;
    float _439 = _387 + _437;
    float _441 = fma(_385, _149, _167);
    float _443 = -_433;
    float _445 = _385 + _443;
    float _447 = -_429;
    float _449 = _389 + _447;
    float _451 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _453 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _455 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _457 = fma(_389, _149, _171);
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].x, _453);
    float _463 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
    float _467 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].z, _461);
    float _469 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].z, _463);
    bool _471 = !_431;
    float _473 = _467;
    float _475 = _465;
    float _477 = _469;
    float _495;
    if (!_471)
    {
        float _479 = in.m_54.x;
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _483 = _479 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = _493;
        _497 = true;
    }
    else
    {
        float _499 = float(_89);
        float _501 = 1.0 / _499;
        float _503 = _123 * _501;
        _495 = _503;
    }
    _497 = false;
    float _505 = _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _509 = _505 + _507;
    float _511 = in.m_52.x;
    float _513 = in.m_52.y;
    bool _515 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _517 = isnan(_505);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _527;
    bool _531 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _533 = isnan(_505);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -_525;
    float _545 = _543 + 1.0;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _547;
    float _551 = 1.0 / _529;
    bool _553 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _555 = _541 * _545;
    float _557 = -_541;
    float _559 = _557 + 1.0;
    float _561 = _509 * _551;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _563;
    float _567 = fma(_549, _561, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _569 = fma(_565, _561, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _571 = _567 * _555;
    float _573 = _569 * _555;
    float _575 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[143].x, _571);
    float _577 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[143].y, _573);
    float _579 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[144].x, _575);
    float _581 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[144].y, _577);
    float _583 = _579 * _511;
    float _585 = _581 * _513;
    bool _587 = !_553;
    float _605;
    if (!_587)
    {
        float _589 = in.m_54.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_89);
        float _611 = 1.0 / _609;
        float _613 = _123 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _615 + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _625 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _627 = isnan(_615);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _641 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _643 = isnan(_615);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _653;
    bool _657 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _659 = isnan(_615);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = 1.0 / _623;
    float _671 = -_635;
    float _673 = _671 + 1.0;
    bool _675 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _677 = _651 * _673;
    float _679 = -_651;
    float _681 = _679 + 1.0;
    float _683 = 1.0 / _639;
    float _685 = _655 * _669;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _691 = fma(_685, _619, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _693 = _689 * _683;
    float _695 = _691 * _677;
    float _697 = -_667;
    float _699 = _697 + 1.0;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _615 + _701;
    float _705 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[115].x, _695);
    float _707 = _635 * _699;
    float _709 = fma(_693, _703, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _713 = fma(_709, _707, _705);
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _719 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[117].x, _713);
    float _721 = _711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _723 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _725 = _717 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _727 = _719 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _721;
    out.m_56.y = _723;
    out.m_56.z = _725;
    out.m_56.w = _727;
    bool _729 = !_675;
    float _753;
    float _755;
    float _757;
    if (!_729)
    {
        float _731 = in.m_54.x;
        float _733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _735 = float(_89);
        float _737 = 1.0 / _735;
        float _739 = _731 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _741 = _123 * _737;
        float _743 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _745 = _743 * _733;
        float _747 = floor(_745);
        float _749 = -_747;
        float _751 = _745 + _749;
        _753 = _741;
        _755 = _735;
        _757 = _751;
        _759 = true;
    }
    else
    {
        float _761 = float(_89);
        float _763 = 1.0 / _761;
        float _765 = _123 * _763;
        _753 = _765;
        _755 = _761;
        _757 = _765;
    }
    _759 = false;
    float _767 = _753;
    float _769 = _755;
    float _771 = _757;
    float _773 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _775 = int(_773);
    float _777 = in.m_54.x;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _781 = _767 + _779;
    float _783 = _583 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _785;
    float _789 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _791 = int(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _805 = float(_775);
    float _807 = 1.0 / _769;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _815 = _813 != 0;
    float _817 = float(uint(_791));
    float _819 = 1.0 / _805;
    int _821 = ~_791;
    int _823 = _821 + 1;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _829 = float(_791);
    bool _831 = _791 == 0;
    float _833 = 1.0 / _817;
    bool _835 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _837 = isnan(_767);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _847;
    bool _851 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _853 = isnan(_771);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = _123 * _819;
    float _865 = 1.0 / _787;
    float _867 = _819;
    float _869 = _805;
    if (!_815)
    {
        float _871 = in.m_54.y;
        _867 = _871;
    }
    float _873 = _867;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _875;
    bool _879 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _881 = isnan(_767);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = -_845;
    float _893 = _891 + 1.0;
    bool _895 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _897 = isnan(_767);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    int _907 = as_type<int>(_833) + (-2);
    float _909 = trunc(_863);
    int _911 = int(_909);
    int _913 = ~_791;
    int _915 = _913 + 1;
    float _917 = 1.0 / _795;
    float _919 = float(uint(_911));
    float _921 = 1.0 / _799;
    if (!_815)
    {
        _869 = _873;
    }
    float _923 = _869;
    float _925 = as_type<float>(_907) * _919;
    float _927 = _923;
    int _929 = as_type<int>(_873);
    if (_815)
    {
        float _931 = in.m_54.x;
        float _933 = in.m_54.y;
        _927 = _931;
        _929 = as_type<int>(_933);
    }
    float _935 = _927;
    int _937 = _929;
    float _939 = trunc(_925);
    float _941 = precise::max(_939, 0.0);
    uint _944 = uint(_941);
    float _946 = 1.0 / _803;
    float _948 = float(_911);
    bool _950 = _948 >= _829;
    bool _952 = isnan(_948);
    bool _954 = _950 || _952;
    bool _956 = isnan(_829);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    int _962 = _915 * int(_944);
    int _964 = _962 + _911;
    float _966 = 1.0 / _811;
    float _968 = float(uint(_964));
    bool _970 = !_815;
    float _972 = _970 ? as_type<float>(_937) : _777;
    float _974 = trunc(_960);
    int _976 = int(_974);
    float _978 = as_type<float>(_907) * _968;
    bool _980 = !_815;
    float _982 = _980 ? 1.2345600128173828125 : 1.0;
    float _984 = trunc(_978);
    float _986 = precise::max(_984, 0.0);
    uint _988 = uint(_986);
    float _990 = _982 * _972;
    float _992 = floor(_990);
    int _994 = int(_944) + int(_988);
    float _996 = 1.0 / _827;
    int _998 = _823 * _994;
    int _1000 = _998 + _911;
    float _1002 = -_992;
    float _1004 = _990 + _1002;
    int _1006 = ~_976;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = _829 * _1004;
    bool _1014 = uint(_1000) >= uint(_791);
    float _1016 = _123 * _829;
    float _1018 = trunc(_1012);
    int _1020 = int(_1018);
    bool _1022 = !_1014;
    int _1024 = _1022 ? 0 : (-1);
    float _1026 = _1016 * _807;
    int _1028 = ~_994;
    int _1030 = _1028 + _1024;
    int _1032 = _1030 + 1;
    float _1034 = trunc(_1026);
    int _1036 = int(_1034);
    int _1038 = _791 * _1032;
    int _1040 = _1038 + _911;
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1044 = _1042 != 0;
    bool _1046 = !_831;
    int _1048 = _1046 ? _1040 : (-1);
    int _1050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1052 = _1050 != 0;
    int _1054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1056 = _1054 != 0;
    int _1058 = _791 + (-1);
    int _1060 = _1010 * _1048;
    bool _1062 = !_1044;
    int _1064 = _1062 ? 0 : 1;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1072 = _1070 != 0;
    int _1074 = _976 * _1058;
    int _1076 = _1074 + _1060;
    bool _1078 = !_1056;
    int _1080 = _1078 ? 0 : 1;
    bool _1082 = !_1052;
    int _1084 = _1082 ? 0 : 1;
    int _1086 = abs(_1064);
    bool _1088 = !_1068;
    int _1090 = _1088 ? 0 : 1;
    int _1092 = abs(_1080);
    int _1094 = _1020 * _1086;
    int _1096 = _1094 + _911;
    int _1098 = abs(_1084);
    bool _1100 = !_1072;
    int _1102 = _1100 ? 0 : 1;
    int _1104 = _1076 * _1092;
    int _1106 = abs(_1090);
    int _1108 = abs(_1102);
    float _1110 = in.m_54.z;
    int _1112 = _1036 * _1098;
    int _1114 = _1112 + _1104;
    int _1116 = ~_791;
    int _1118 = _1116 + 1;
    int _1120 = _1096 * _1106;
    int _1122 = _1120 + _1114;
    int _1124 = _1020 * _1108;
    int _1126 = _1124 + _1122;
    int _1128 = ~_791;
    int _1130 = _1128 + 1;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1136 = float(uint(_1126));
    float _1138 = as_type<float>(_907) * _1136;
    float _1140 = trunc(_1138);
    float _1142 = precise::max(_1140, 0.0);
    uint _1144 = uint(_1142);
    int _1146 = _1130 * int(_1144);
    int _1148 = _1146 + _1126;
    float _1150 = float(uint(_1148));
    float _1152 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1154 = log2(_1152);
    float _1156 = as_type<float>(_907) * _1150;
    float _1158 = trunc(_1156);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    int _1164 = int(_1144) + int(_1162);
    int _1166 = _1118 * _1164;
    int _1168 = _1166 + _1126;
    bool _1170 = uint(_1168) >= uint(_791);
    bool _1172 = !_1170;
    int _1174 = _1172 ? 0 : (-1);
    int _1176 = ~_1164;
    int _1178 = _1176 + _1174;
    int _1180 = _1178 + 1;
    float _1182 = in.m_54.w;
    int _1184 = _791 * _1180;
    int _1186 = _1184 + _1126;
    float _1188 = _777 * 2.0;
    bool _1190 = !_831;
    int _1192 = _1190 ? _1186 : (-1);
    float _1194 = floor(_1188);
    int _1196 = _1192 & 3;
    bool _1198 = _1196 != 0;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1204 = uint(_1196) > 1u;
    float _1206 = 1.0 / _1202;
    bool _1208 = _1182 > 0.5;
    int _1210 = _1198 ? 0 : 1;
    bool _1212 = _1110 > 0.5;
    bool _1214 = _1194 >= 0.0;
    bool _1216 = isnan(_1194);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan(0.0);
    bool _1222 = _1218 || _1220;
    float _1224 = -_221;
    int _1226 = _1212 ? as_type<int>(_1224) : as_type<int>(_221);
    int _1228 = ~_1210;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    bool _1234 = _1194 > 0.0;
    int _1236 = _1232;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_1204)
    {
        int _1240 = ~_1210;
        int _1242 = _1240 + 1;
        _1236 = _1242;
    }
    int _1244 = _1236;
    float _1246 = -_225;
    int _1248 = _1208 ? as_type<int>(_1246) : as_type<int>(_225);
    int _1250 = _1222 ? 0 : 1;
    bool _1252 = _777 > 0.5;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1260 = _1258 != 0;
    float _1262 = -_221;
    int _1264 = _1252 ? as_type<int>(_1262) : as_type<int>(_221);
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1280 = _1278 != 0;
    bool _1282 = !_1256;
    float _1284 = _1282 ? _221 : as_type<float>(_1226);
    float _1286 = 1.0 / _1134;
    float _1288 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1290 = ~_1250;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    bool _1296 = !_1260;
    float _1298 = _1296 ? _225 : as_type<float>(_1248);
    float _1300 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1288);
    float _1302 = _123 * _1154;
    int _1304 = _1294;
    if (!_1234)
    {
        int _1306 = ~_1250;
        int _1308 = _1306 + 1;
        _1304 = _1308;
    }
    int _1310 = _1304;
    float _1312 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1314 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1318 = _1316 != 0;
    float _1320 = exp2(_1302);
    float _1322 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1312);
    float _1324 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1314);
    float _1326 = _1110 * 2.0;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1330 = _1328 != 0;
    float _1332 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1322);
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1336 = _1334 != 0;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1340 = _771 + _1338;
    float _1342 = floor(_1326);
    float _1344 = _1340 * _865;
    float _1346 = 0.0;
    if (!_1280)
    {
        _1346 = _1110;
    }
    float _1348 = _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1356 = _1354 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1358 = _1348;
    if (!_1280)
    {
        _1238 = _1110;
    }
    float _1360 = _1238;
    float _1362 = -_1320;
    float _1364 = _1362 + 1.0;
    float _1366 = _1352 * _917;
    float _1368 = _1356 * _1206;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1374;
    float _1378 = _1360;
    if (_1280)
    {
        _1358 = as_type<float>(_937);
    }
    float _1380 = _1358;
    float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1382;
    if (_1280)
    {
        _1378 = as_type<float>(_937);
    }
    float _1386 = _1378;
    float _1388 = _1372 * _921;
    float _1390 = _1376 * _1286;
    bool _1392 = _1342 >= 0.0;
    bool _1394 = isnan(_1342);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan(0.0);
    bool _1400 = _1396 || _1398;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1408 = _1406 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1410 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1300);
    int _1412 = _1400 ? 0 : 1;
    float _1414 = _1404 * _946;
    bool _1416 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1418 = isnan(0.0);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1424 = _1420 || _1422;
    float _1426 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1324);
    float _1428 = _1408 * _966;
    float _1430 = _1424 ? _1364 : 0.0;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1434 = _767 + _1432;
    bool _1436 = _1342 > 0.0;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1438;
    bool _1442 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1444 = isnan(_767);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1450 = _1446 || _1448;
    float _1452 = float(_1450);
    float _1454 = fma(_849, _1344, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1456 = fma(_877, _1344, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1458 = fma(_1440, _1344, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1462 = _767 + _1460;
    float _1464 = fma(_1366, _1434, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1466 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1468 = isnan(_767);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    float _1478 = -_1452;
    float _1480 = _1478 + 1.0;
    float _1482 = _1384 * _996;
    float _1484 = fma(_1368, _1462, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1488 = _767 + _1486;
    bool _1490 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1492 = isnan(_767);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = _1476 * _1480;
    float _1504 = -_1476;
    float _1506 = _1504 + 1.0;
    float _1508 = fma(_1388, _1488, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1510 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1512 = isnan(_767);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1524 = _767 + _1522;
    float _1526 = _1500 * _1506;
    float _1528 = -_1500;
    float _1530 = _1528 + 1.0;
    bool _1532 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1534 = isnan(_767);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = -_1520;
    float _1546 = _1544 + 1.0;
    float _1548 = fma(_1482, _1524, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1550 = _1520 * _1530;
    bool _1552 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1554 = isnan(_771);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1560 = _1556 || _1558;
    float _1562 = float(_1560);
    float _1564 = _1542 * _1546;
    float _1566 = -_1542;
    float _1568 = _1566 + 1.0;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1572 = _767 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1576 = _767 + _1574;
    float _1578 = -_1562;
    float _1580 = _1578 + 1.0;
    float _1582 = _845 * _1568;
    float _1584 = _889 * _893;
    float _1586 = -_889;
    float _1588 = _1586 + 1.0;
    float _1590 = _861 * _1580;
    float _1592 = fma(_1390, _1572, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1594 = -_861;
    float _1596 = _1594 + 1.0;
    float _1598 = _1454 * _1590;
    float _1600 = _1458 * _1590;
    float _1602 = _905 * _1588;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1606 = 1.0 + _1604;
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1600);
    float _1610 = fma(_1414, _1576, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1614 = _1464 * _1602;
    float _1616 = -_905;
    float _1618 = _1616 + 1.0;
    float _1620 = _1456 * _1590;
    float _1622 = 1.0 / _1606;
    float _1624 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1614);
    float _1626 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1598);
    float _1628 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1620);
    float _1630 = fma(_1484, _1584, _1624);
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1634 = _935 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1636 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1628);
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1640 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1612);
    float _1642 = -_1632;
    float _1644 = fma(_1634, 2.0, _1642);
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1648 = as_type<float>(_937) * 2.0;
    bool _1650 = !_1330;
    float _1652 = _1650 ? _221 : as_type<float>(_1264);
    float _1654 = _777 + as_type<float>(_937);
    int _1656 = ~_1412;
    int _1658 = _1656 + 1;
    int _1660 = _1658 + 1;
    float _1662 = _1110 + as_type<float>(_937);
    int _1664 = _1660;
    if (!_1436)
    {
        int _1666 = ~_1412;
        int _1668 = _1666 + 1;
        _1664 = _1668;
    }
    int _1670 = _1664;
    float _1672 = _1654 + (-1.0);
    float _1674 = _1662 + (-1.0);
    float _1676 = floor(_1648);
    bool _1678 = !_1272;
    int _1680 = _1678 ? 0 : 1;
    float _1682 = _1430 * _1622;
    float _1684 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1686 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1688 = abs(_1680);
    float _1690 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1638);
    float _1692 = float(uint(_1096));
    float _1694 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1626);
    bool _1696 = as_type<float>(_937) > 0.5;
    float _1698 = fma(_1428, _781, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1700 = !_1268;
    int _1702 = _1700 ? 0 : 1;
    float _1704 = as_type<float>(_907) * _1692;
    float _1706 = -_225;
    int _1708 = _1696 ? as_type<int>(_1706) : as_type<int>(_225);
    float _1710 = _1332 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1712 = uint(_1196) >= 2u;
    float _1714 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1608);
    bool _1716 = _1676 >= 0.0;
    bool _1718 = isnan(_1676);
    bool _1720 = _1716 || _1718;
    bool _1722 = isnan(0.0);
    bool _1724 = _1720 || _1722;
    float _1726 = trunc(_1704);
    float _1728 = precise::max(_1726, 0.0);
    uint _1730 = uint(_1728);
    int _1732 = _1712 ? 0 : 1;
    float _1734 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1736 = _1676 > 0.0;
    float _1738 = fma(_1548, _1582, _1630);
    int _1740 = abs(_1702);
    float _1742 = _1410 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1744 = ~_791;
    int _1746 = _1744 + 1;
    float _1748 = _1284 + 0.5;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1752 = _1742 + _1750;
    float _1754 = float(_1688);
    float _1756 = -_123;
    float _1758 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1644);
    float _1760 = float(_1310);
    float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1764 = _1710 + _1762;
    float _1766 = float(_1740);
    float _1768 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1770 = float(_1670);
    float _1772 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1758);
    float _1774 = _1754 * _1760;
    int _1776 = _1192 >> 31;
    float _1778 = _1766 * _1770;
    float _1780 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1768);
    int _1782 = _1746 * int(_1730);
    int _1784 = _1782 + _1096;
    int _1786 = _1776 & 3;
    float _1788 = fma(_1734, -2.0, _1646);
    bool _1790 = !_1336;
    float _1792 = _1790 ? _225 : as_type<float>(_1708);
    float _1794 = fma(_1508, _1564, _1738);
    float _1796 = float(uint(_1784));
    float _1798 = _1298 + (-0.5);
    float _1800 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1788);
    int _1802 = _1192 + _1786;
    float _1804 = as_type<float>(_907) * _1796;
    float _1806 = fma(_1592, _1550, _1794);
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1810 = _1802 >> 2;
    float _1812 = -_1798;
    float _1814 = -_1800;
    float _1816 = fma(_1812, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1814);
    float _1818 = _1426 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1820 = trunc(_1804);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    int _1826 = _1810 << 4;
    int _1828 = _1826 + 512;
    float _1830 = _1694 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1832 = _1636 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1834 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    uint _1836 = uint(int(uint(_1828) >> uint(2)));
    uint _1838 = uint(int(uint(int(_1836)) >> uint(2)));
    int _1840 = int(_1836) & 3;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[int(_1838)][_1840];
    int _1844 = int(_1836) + 1;
    uint _1846 = uint(int(uint(_1844) >> uint(2)));
    int _1848 = _1844 & 3;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[int(_1846)][_1848];
    float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1854 = _1818 + _1852;
    float _1856 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1858 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1860 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1862 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1780);
    float _1864 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1690);
    float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1868 = _1828 + 8;
    uint _1870 = uint(int(uint(_1868) >> uint(2)));
    uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
    int _1874 = int(_1870) & 3;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[int(_1872)][_1874];
    int _1878 = int(_1870) + 1;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    int _1882 = _1878 & 3;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[int(_1880)][_1882];
    out.m_58.x = _1856;
    out.m_58.y = _1858;
    out.m_58.z = _1860;
    out.m_58.w = _1808;
    bool _1886 = _1862 >= 0.0;
    float _1888 = _1778 * (-2.0);
    int _1890 = _1724 ? 0 : 1;
    float _1892 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1640);
    int _1894 = int(_1730) + int(_1824);
    float _1896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1898 = ~_1890;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    float _1904 = -_1792;
    float _1906 = _1904 + 0.5;
    bool _1908 = _1196 != 3;
    float _1910 = in.m_60.x;
    float _1912 = in.m_60.y;
    float _1914 = in.m_60.z;
    int _1916 = _1902;
    if (!_1736)
    {
        int _1918 = ~_1890;
        int _1920 = _1918 + 1;
        _1916 = _1920;
    }
    int _1922 = _1916;
    float _1924 = _1652 + 0.5;
    int _1926 = _1192 & 3;
    bool _1928 = _1926 != 0;
    float _1930 = -_1864;
    float _1932 = _1930 + 1.0;
    int _1934 = ~_791;
    int _1936 = _1934 + 1;
    float _1938 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1940 = -_1892;
    float _1942 = _1940 + 1.0;
    float _1944 = fma(_1298, _1932, _1816);
    float _1946 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1948 = !_1928;
    int _1950 = _1948 ? 0 : 1;
    float _1952 = _1938 * _1866;
    int _1954 = abs(_1244);
    int _1956 = _1936 * _1894;
    int _1958 = _1956 + _1096;
    float _1960 = -_1942;
    float _1962 = fma(_1284, _1960, _1772);
    float _1964 = _1946 * _1896;
    float _1966 = fma(_1698, _1526, _1806);
    int _1968 = ~_1732;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    float _1974 = fma(_1684, _1888, _1684);
    bool _1976 = uint(_1958) >= uint(_791);
    out.m_62.x = _1952;
    out.m_62.y = _1964;
    out.m_62.z = _1962;
    out.m_62.w = _1944;
    int _1978 = _1972;
    if (_1908)
    {
        int _1980 = ~_1732;
        int _1982 = _1980 + 1;
        _1978 = _1982;
    }
    int _1984 = _1978;
    float _1986 = fma(_1610, _1502, _1966);
    bool _1988 = !_1976;
    int _1990 = _1988 ? 0 : (-1);
    float _1992 = fma(_1888, _1910, _1910);
    bool _1994 = _1196 != 3;
    float _1996 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1986);
    int _1998 = abs(_1950);
    float _2000 = _1774 * (-2.0);
    int _2002 = ~_1954;
    int _2004 = _2002 + 1;
    int _2006 = _2004 + 1;
    if (_1886)
    {
        out.m_45.x = 0.0;
    }
    int _2008 = abs(_1984);
    float _2010 = fma(_1686, _2000, _1686);
    int _2012 = ~_1894;
    int _2014 = _2012 + _1990;
    int _2016 = _2014 + 1;
    int _2018 = _2006 * as_type<int>(_1850);
    bool _2020 = !_1994;
    int _2022 = _2020 ? 0 : (-1);
    out.m_64.x = _1996;
    int _2024 = ~_1998;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    float _2030 = fma(_2000, _1912, _1912);
    bool _2032 = !_1318;
    int _2034 = _2032 ? 0 : 1;
    float _2036 = as_type<float>(_937) + (-0.5);
    int _2038 = abs(_2022);
    int _2040 = _2028 * as_type<int>(_1842);
    int _2042 = _2040 + _2018;
    float _2044 = _1752 * _1752;
    int _2046 = abs(_2034);
    float _2048 = _777 + (-0.5);
    int _2050 = ~_2008;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    float _2056 = fma(_1764, _1764, _2044);
    int _2058 = ~_2038;
    int _2060 = _2058 + 1;
    int _2062 = _2060 + 1;
    float _2064 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1992);
    int _2066 = _791 * _2016;
    int _2068 = _2066 + _1096;
    float _2070 = fma(_1854, _1854, _2056);
    int _2072 = _2054 * as_type<int>(_1876);
    int _2074 = _2072 + _2042;
    int _2076 = ~_2046;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    float _2082 = _783 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2084 = _791 == 0;
    int _2086 = _2062 * as_type<int>(_1884);
    int _2088 = _2086 + _2074;
    float _2090 = rsqrt(_2070);
    float _2092 = as_type<float>(_2042);
    if (_1886)
    {
        _2092 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2094 = _2092;
    bool _2096 = !_2084;
    int _2098 = _2096 ? _2068 : (-1);
    int _2100 = _2080 * _2088;
    bool _2102 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2104 = isnan(1.0);
    bool _2106 = _2102 || _2104;
    bool _2108 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2110 = _2106 || _2108;
    int _2112 = as_type<int>(_2094);
    if (_1886)
    {
        float _2114 = _2094 * 5.0;
        _2112 = as_type<int>(_2114);
    }
    int _2116 = _2112;
    int _2118 = _2098 * _2046;
    int _2120 = _2118 + _2100;
    bool _2122 = !_2110;
    float _2124 = _2122 ? _123 : _1682;
    bool _2126 = !_1276;
    int _2128 = _2126 ? 0 : 1;
    if (_1886)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6530 = as_type<float>(_2116);
        out.gl_Position.z = _6530;
    }
    float _2130 = float(_2120);
    float _2132 = fma(_2124, _1974, _2064);
    float _2134 = _2082 * _2090;
    out.m_66.y = _2130;
    float _2136 = _1764 * _2134;
    float _2138 = _1752 * _2134;
    int _2140 = abs(_2128);
    if (_1886)
    {
        return out;
    }
    float _2142 = -_2138;
    float _2144 = _1742 + _2142;
    float _2146 = _1854 * _2134;
    float _2148 = -_2136;
    float _2150 = _1710 + _2148;
    float _2152 = _2132 * 0.15915493667125701904296875;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2156 = _2144 + _2154;
    float _2158 = -_2146;
    float _2160 = _1818 + _2158;
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2164 = _2150 + _2162;
    float _2166 = float(_2140);
    float _2168 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2170 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2172 = _2160 + _2170;
    float _2174 = float(_1922);
    float _2176 = -_2138;
    float _2178 = _1752 + _2176;
    float _2180 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2168);
    float _2182 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2030);
    float _2184 = -_2136;
    float _2186 = _1764 + _2184;
    float _2188 = _2166 * _2174;
    float _2190 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2180);
    float _2192 = _2178 * _2178;
    float _2194 = _777 + _1110;
    float _2196 = _2188 * (-2.0);
    float _2198 = fma(_2124, _2010, _2182);
    bool _2200 = _2190 >= 0.0;
    float _2202 = fma(_2186, _2186, _2192);
    float _2204 = -_2146;
    float _2206 = _1854 + _2204;
    float _2208 = _1110 + (-0.5);
    float _2210 = _2194 + (-1.0);
    float _2212 = fma(_2196, _1914, _1914);
    float _2214 = _2198 * 0.15915493667125701904296875;
    float _2216 = fma(_2206, _2206, _2202);
    float _2218 = fma(_2210, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2220 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2212);
    float _2222 = _2152 * 6.283185482025146484375;
    float _2224 = sin(_2222);
    float _2226 = _2168;
    int _2228 = as_type<int>(_2212);
    float _2230 = _2164;
    float _2232 = _2160;
    if (_2200)
    {
        _2226 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2234 = _2226;
    float _2236 = fma(_2218, _2196, _2218);
    if (_2200)
    {
        out.m_45.x = 0.0;
    }
    if (_2200)
    {
        float _2238 = _2234 * 5.0;
        _2228 = as_type<int>(_2238);
    }
    int _2240 = _2228;
    float _2242 = _2152 * 6.283185482025146484375;
    float _2244 = cos(_2242);
    float _2246 = fma(_2124, _2236, _2220);
    if (_2200)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6723 = as_type<float>(_2240);
        out.gl_Position.z = _6723;
    }
    float _2248 = _2246 * 0.15915493667125701904296875;
    float _2250 = _2214 * 6.283185482025146484375;
    float _2252 = sin(_2250);
    float _2254 = sqrt(_2216);
    float _2256 = _2214 * 6.283185482025146484375;
    float _2258 = cos(_2256);
    if (_2200)
    {
        return out;
    }
    float _2260 = _2248 * 6.283185482025146484375;
    float _2262 = cos(_2260);
    float _2264 = _2090 * _2254;
    float _2266 = _585 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2272 = _783 * _2264;
    float _2274 = _2264 * _2266;
    float _2276 = _2244 * _2258;
    float _2278 = _2248 * 6.283185482025146484375;
    float _2280 = sin(_2278);
    float _2282 = _2270 * _2272;
    float _2284 = _2268 * _2274;
    float _2286 = _2224 * _2252;
    float _2288 = _2244 * _2252;
    float _2290 = _2264 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2292 = _2290 * 0.5;
    float _2294 = _2262 * _2284;
    float _2296 = _2252 * _2262;
    float _2298 = _2258 * _2262;
    float _2300 = _2224 * _2258;
    float _2302 = _2244 * _2294;
    float _2304 = fma(_2280, _2276, _2286);
    float _2306 = -_2284;
    float _2308 = _2280 * _2306;
    float _2310 = -_2300;
    float _2312 = fma(_2280, _2288, _2310);
    float _2314 = -_2288;
    float _2316 = fma(_2280, _2300, _2314);
    float _2318 = fma(_2304, _2282, _2302);
    float _2320 = _2224 * _2294;
    float _2322 = fma(_2298, _2282, _2308);
    float _2324 = fma(_2280, _2286, _2276);
    float _2326 = fma(_2312, _2292, _2318);
    float _2328 = fma(_2316, _2282, _2320);
    float _2330 = fma(_2296, _2292, _2322);
    float _2332 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2334 = fma(_2324, _2292, _2328);
    float _2336 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2338 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2332);
    float _2340 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2336);
    float _2342 = fma(_2334, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2338);
    float _2344 = fma(_2334, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2340);
    float _2346 = _2342 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2348 = _2344 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2350 = _1818 + _2346;
    float _2352 = _1710 + _2348;
    float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2356 = _2350 + _2354;
    float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2360 = _2352 + _2358;
    float _2362 = _2356 * _2356;
    float _2364 = fma(_2360, _2360, _2362);
    float _2366 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2368 = sqrt(_2364);
    float _2370 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2366);
    float _2372 = fma(_2334, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2370);
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2376 = _1742 + _2374;
    bool _2378 = _2368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2380 = _2374;
    float _2382 = _2352;
    float _2384 = _2350;
    float _2386 = _2376;
    float _2388 = _2296;
    float _2390 = _2356;
    float _2392 = _2364;
    if (!_2378)
    {
        _2380 = _2376;
    }
    float _2394 = _2380;
    bool _2396 = !_2378;
    float _2398 = _2394;
    if (!_2396)
    {
        float _2400 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2404 = _2368 + _2402;
        float _2406 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2408 = rsqrt(_2364);
        float _2410 = _2404 * _2400;
        float _2412 = _2410 * 0.15915493667125701904296875;
        float _2414 = _2412 * 6.283185482025146484375;
        float _2416 = cos(_2414);
        float _2418 = _2412 * 6.283185482025146484375;
        float _2420 = sin(_2418);
        float _2422 = _2416 + (-1.0);
        float _2424 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2426 = fma(_2420, _2406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2428 = fma(_2376, _2416, _2424);
        float _2430 = _2408 * _2426;
        float _2432 = fma(_2360, _2430, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2434 = fma(_2356, _2430, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2398 = _2428;
        _2382 = _2432;
        _2384 = _2434;
    }
    float _2436 = _2398;
    float _2438 = _2382;
    float _2440 = _2384;
    float _2442 = -_1742;
    float _2444 = _2442 + _2436;
    float _2446 = -_1710;
    float _2448 = _2446 + _2438;
    float _2450 = -_1818;
    float _2452 = _2450 + _2440;
    float _2454 = _2444 * _2444;
    float _2456 = fma(_2448, _2448, _2454);
    float _2458 = fma(_2452, _2452, _2456);
    float _2460 = sqrt(_2458);
    bool _2462 = _2460 > 0.0;
    float _2464 = _2460;
    float _2466 = _2440;
    if (!_2462)
    {
        _2386 = _2438;
    }
    float _2468 = _2386;
    float _2470 = _2468;
    float _2472 = _2468;
    if (!_2462)
    {
        _2464 = _2436;
    }
    float _2474 = _2464;
    bool _2476 = !_2462;
    float _2478 = _2474;
    if (!_2476)
    {
        bool _2480 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2482 = _2474;
        if (_2480)
        {
            float _2484 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2482 = _2484;
        }
        float _2486 = _2482;
        float _2488 = _2486;
        if (_2480)
        {
            float _2490 = _465 * _2486;
            _2388 = _2490;
        }
        float _2492 = _2388;
        float _2494 = _2492;
        if (_2480)
        {
            float _2496 = _467 * _2486;
            _2390 = _2496;
        }
        float _2498 = _2390;
        float _2500 = _2498;
        if (_2480)
        {
            float _2502 = _469 * _2486;
            _2392 = _2502;
        }
        float _2504 = _2392;
        float _2506 = _2504;
        if (!_2480)
        {
            bool _2508 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2510 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2512 = _2508 || _2510;
            bool _2514 = isnan(1.0);
            bool _2516 = _2512 || _2514;
            float _2518 = _123 + 1.0;
            float _2520 = _2518;
            if (!_2516)
            {
                float _2522 = _2518 * _2518;
                float _2524 = _2522 * 0.5;
                _127 = _2524;
            }
            float _2526 = _127;
            float _2528 = _2526;
            if (!_2516)
            {
                float _2530 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2528 = _2530;
            }
            float _2532 = _2528;
            bool _2534 = !_2516;
            float _2536 = _2532;
            if (!_2534)
            {
                float _2538 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2540 = log2(_2538);
                float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2544 = 1.0 + _2542;
                float _2546 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2548 = _2540 * _2518;
                float _2550 = 1.0 / _2544;
                float _2552 = _2546 * 0.693147182464599609375;
                float _2554 = exp2(_2548);
                float _2556 = 1.0 / _2552;
                float _2558 = _2554 + (-1.0);
                float _2560 = -_2558;
                float _2562 = fma(_2560, _2556, _2518);
                float _2564 = _2562 * _2550;
                float _2566 = _2564 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2536 = _2566;
            }
            float _2568 = _2536;
            float _2570 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2572 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2574 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2576 = _2570 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2578 = _2570 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2580 = _2570 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2582 = fma(_2572, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2576);
            float _2584 = fma(_2572, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2578);
            float _2586 = fma(_2574, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2582);
            bool _2588 = !_2516;
            _2488 = _2586;
            if (!_2588)
            {
                float _2590 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2592 = log2(_2590);
                float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2596 = 1.0 + _2594;
                float _2598 = 1.0 / _2596;
                float _2600 = _2592 * _2518;
                float _2602 = exp2(_2600);
                float _2604 = -_2602;
                float _2606 = _2604 + 1.0;
                float _2608 = _2606 * _2598;
                _2520 = _2608;
            }
            float _2610 = _2520;
            float _2612 = fma(_2572, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2580);
            float _2614 = fma(_2574, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2584);
            float _2616 = fma(_2610, _163, _2586);
            float _2618 = fma(_2574, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2612);
            float _2620 = fma(_2610, _161, _2614);
            float _2622 = -_427;
            float _2624 = _2622 + _2616;
            float _2626 = fma(_2610, _165, _2618);
            float _2628 = -_433;
            float _2630 = _2628 + _2620;
            float _2632 = _2624 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2634 = _2624 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2636 = _2624 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2638 = -_429;
            float _2640 = _2638 + _2626;
            float _2642 = fma(_2630, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2632);
            float _2644 = fma(_2630, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2634);
            float _2646 = fma(_2630, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2636);
            float _2648 = fma(_2640, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2642);
            float _2650 = fma(_2640, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2644);
            float _2652 = fma(_2640, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2646);
            _473 = _2650;
            _475 = _2648;
            _477 = _2652;
            _2494 = _2648;
            _2500 = _2650;
            _2506 = _2652;
            _2470 = _2614;
        }
        float _2654 = _473;
        float _2656 = _475;
        float _2658 = _477;
        float _2660 = _2494;
        float _2662 = _2500;
        float _2664 = _2506;
        float _2666 = _2488;
        float _2668 = _2470;
        float _2670 = _2654 * _2654;
        float _2672 = rsqrt(_2458);
        float _2674 = fma(_2656, _2656, _2670);
        float _2676 = fma(_2658, _2658, _2674);
        float _2678 = sqrt(_2676);
        float _2680 = _2448 * _2672;
        float _2682 = _2444 * _2672;
        float _2684 = _2452 * _2672;
        bool _2686 = _2678 > 0.0;
        float _2688 = _2668;
        float _2690 = _2666;
        if (!_2686)
        {
            _2688 = _2438;
        }
        float _2692 = _2688;
        _2472 = _2692;
        if (!_2686)
        {
            _2690 = _2436;
        }
        float _2694 = _2690;
        bool _2696 = !_2686;
        _2478 = _2694;
        if (!_2696)
        {
            float _2698 = rsqrt(_2676);
            float _2700 = _2698 * _2654;
            float _2702 = _2698 * _2656;
            float _2704 = _2698 * _2658;
            float _2706 = _2682 * _2700;
            float _2708 = fma(_2680, _2702, _2706);
            float _2710 = fma(_2684, _2704, _2708);
            float _2712 = _2710 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2714 = fma(_2660, _2712, _2438);
            float _2716 = fma(_2662, _2712, _2436);
            float _2718 = fma(_2664, _2712, _2440);
            _2478 = _2716;
            _2466 = _2718;
            _2472 = _2714;
        }
    }
    float _2720 = _2478;
    float _2722 = _2466;
    float _2724 = _2472;
    float _2726 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2728 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2730 = isnan(0.5);
    bool _2732 = _2728 || _2730;
    bool _2734 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2736 = _2732 || _2734;
    float _2738 = -_2138;
    float _2740 = _2738 + _2720;
    bool _2742 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2744 = isnan(0.5);
    bool _2746 = _2742 || _2744;
    bool _2748 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2750 = _2746 || _2748;
    float _2752 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2726);
    float _2754 = -_2146;
    float _2756 = _2754 + _2722;
    float _2758 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2752);
    float _2760 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2762 = _2758 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2764 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2760);
    float _2766 = 1.0 / _2762;
    float _2768 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2764);
    float _2770 = _2768 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2772 = _2770 + _2762;
    float _2774 = _2772 * _2766;
    float _2776 = _2774 * 0.5;
    float _2778 = -_2136;
    float _2780 = _2778 + _2724;
    float _2782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2784 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2782);
    float _2786 = _2776;
    float _2788 = _2740;
    float _2790 = _2780;
    float _2792 = _2756;
    float _2794 = _2762;
    if (_2750)
    {
        _2786 = 1.0;
    }
    float _2796 = _2786;
    float _2798 = 1.0 / _2784;
    float _2800 = _2796;
    if (!_2736)
    {
        float _2802 = _2156 * _2156;
        float _2804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2806 = -_1818;
        float _2808 = _2806 + _2722;
        float _2810 = -_1710;
        float _2812 = _2810 + _2724;
        float _2814 = fma(_2164, _2164, _2802);
        float _2816 = -_1742;
        float _2818 = _2816 + _2720;
        float _2820 = fma(_2172, _2172, _2814);
        float _2822 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2824 = sqrt(_2820);
        float _2826 = 1.0 / _2264;
        float _2828 = _2822 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2830 = precise::min(_2824, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2832 = _2830 * _2804;
        float _2834 = _2832 * _2826;
        float _2836 = _2828 * _2834;
        float _2838 = _2808 * _2834;
        float _2840 = fma(_2812, _2836, _2150);
        float _2842 = fma(_2818, _2836, _2144);
        float _2844 = fma(_2828, _2838, _2160);
        _2788 = _2842;
        _2790 = _2840;
        _2792 = _2844;
        _2230 = _2824;
        _2794 = _2834;
    }
    float _2846 = _2788;
    float _2848 = _2790;
    float _2850 = _2792;
    float _2852 = _2230;
    float _2854 = _2794;
    float _2856 = _2854;
    float _2858 = _2852;
    if (_2750)
    {
        _2856 = 1.0;
    }
    float _2860 = _2856;
    float _2862 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2864 = _2798 * _2862;
    float _2866 = _2860;
    if (!_2750)
    {
        float _2868 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2870 = _2868 * 0.15915493667125701904296875;
        float _2872 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2874 = _2870 * 6.283185482025146484375;
        float _2876 = cos(_2874);
        float _2878 = _2872 * 0.15915493667125701904296875;
        float _2880 = _2870 * 6.283185482025146484375;
        float _2882 = sin(_2880);
        float _2884 = 1.0 / _2876;
        float _2886 = _2878 * 6.283185482025146484375;
        float _2888 = cos(_2886);
        float _2890 = _2882 * _2884;
        float _2892 = _2878 * 6.283185482025146484375;
        float _2894 = sin(_2892);
        float _2896 = _2888 * _2890;
        float _2898 = 1.0 / _2896;
        float _2900 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2902 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2900;
        float _2904 = 1.0 / _2902;
        float _2906 = _2894 * _2898;
        float _2908 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2910 = fma(_2864, _2906, _2908);
        float _2912 = _2910 * _2904;
        float _2914 = precise::clamp(_2912, 0.0, 1.0);
        _2232 = _2904;
        _2800 = _2914;
    }
    float _2916 = _2232;
    float _2918 = _2800;
    float _2920 = _2916;
    if (!_2750)
    {
        float _2922 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2924 = _2922 * 0.15915493667125701904296875;
        float _2926 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2928 = _2924 * 6.283185482025146484375;
        float _2930 = cos(_2928);
        float _2932 = _2926 * 0.15915493667125701904296875;
        float _2934 = _2924 * 6.283185482025146484375;
        float _2936 = sin(_2934);
        float _2938 = 1.0 / _2930;
        float _2940 = _2932 * 6.283185482025146484375;
        float _2942 = cos(_2940);
        float _2944 = _2936 * _2938;
        float _2946 = _2932 * 6.283185482025146484375;
        float _2948 = sin(_2946);
        float _2950 = _2942 * _2944;
        float _2952 = 1.0 / _2950;
        float _2954 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2956 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2954;
        float _2958 = 1.0 / _2956;
        float _2960 = _2948 * _2952;
        float _2962 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2964 = fma(_2864, _2960, _2962);
        float _2966 = _2964 * _2958;
        float _2968 = precise::clamp(_2966, 0.0, 1.0);
        float _2970 = -_2968;
        float _2972 = _2970 + 1.0;
        _2858 = _2960;
        _2920 = _2938;
        _2866 = _2972;
    }
    float _2974 = _2858;
    float _2976 = _2920;
    float _2978 = _2866;
    float _2980 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2982 = _2846 + _2980;
    float _2984 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2986 = _2848 + _2984;
    float _2988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2990 = _2850 + _2988;
    float _2992 = _2982 * _2982;
    float _2994 = fma(_2986, _2986, _2992);
    float _2996 = fma(_2990, _2990, _2994);
    float _2998 = rsqrt(_2996);
    float _3000 = sqrt(_2996);
    float _3002 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3004 = _2986 * _3002;
    float _3006 = _2990 * _3002;
    float _3008 = _3004 * _3004;
    float _3010 = _3006 * _3006;
    float _3012 = _3008 + _3010;
    float _3014 = sqrt(_3012);
    bool _3016 = _3014 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3020 = _3014 + _3018;
    float _3022 = _2998;
    float _3024 = _3020;
    float _3026 = _2974;
    float _3028 = _2982;
    float _3030 = _3002;
    if (_3016)
    {
        float _3032 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3022 = _3032;
    }
    float _3034 = _3022;
    float _3036 = _3034;
    if (_3016)
    {
        float _3038 = _3020 * _3034;
        _3024 = _3038;
    }
    float _3040 = _3024;
    if (_3016)
    {
        float _3042 = rsqrt(_3012);
        _3036 = _3042;
    }
    float _3044 = _3036;
    float _3046 = _3044;
    if (_3016)
    {
        float _3048 = _3040 * 0.15915493667125701904296875;
        _3026 = _3048;
    }
    float _3050 = _3026;
    float _3052 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3054 = _2990;
    float _3056 = _3050;
    if (_3016)
    {
        float _3058 = _3050 * 6.283185482025146484375;
        float _3060 = sin(_3058);
        _3054 = _3060;
    }
    float _3062 = _3054;
    float _3064 = precise::max(0.0, _3052);
    float _3066 = _2976;
    float _3068 = _3064;
    if (_3016)
    {
        float _3070 = _3050 * 6.283185482025146484375;
        float _3072 = cos(_3070);
        _3066 = _3072;
    }
    float _3074 = _3066;
    float _3076 = -_3002;
    float _3078 = -_3064;
    float _3080 = fma(_2982, _3076, _3078);
    if (_3016)
    {
        float _3082 = _3080 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3028 = _3082;
    }
    float _3084 = _3028;
    float _3086 = _3062;
    float _3088 = _3084;
    if (_3016)
    {
        float _3090 = fma(_3062, _3084, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3086 = _3090;
    }
    float _3092 = _3086;
    float _3094 = _3092;
    if (!_3016)
    {
        _3088 = _3080;
    }
    float _3096 = _3088;
    float _3098 = _3096;
    if (_3016)
    {
        float _3100 = _3044 * _3092;
        _3030 = _3100;
    }
    float _3102 = _3030;
    if (!_3016)
    {
        _3046 = _3004;
    }
    float _3104 = _3046;
    float _3106 = _3104;
    float _3108 = _3074;
    if (_3016)
    {
        float _3110 = _3074 + (-1.0);
        _3068 = _3110;
    }
    float _3112 = _3068;
    float _3114 = _3112;
    if (_3016)
    {
        float _3116 = _3004 * _3102;
        _3106 = _3116;
    }
    float _3118 = _3106;
    if (!_3016)
    {
        _3094 = _3008;
    }
    float _3120 = _3094;
    float _3122 = _3120;
    if (_3016)
    {
        float _3124 = _3112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3056 = _3124;
    }
    float _3126 = _3056;
    if (!_3016)
    {
        _3114 = _3006;
    }
    float _3128 = _3114;
    float _3130 = _3128;
    if (_3016)
    {
        float _3132 = _3006 * _3102;
        _3130 = _3132;
    }
    float _3134 = _3130;
    if (_3016)
    {
        float _3136 = _3118 * _3118;
        _3122 = _3136;
    }
    float _3138 = _3122;
    if (_3016)
    {
        float _3140 = fma(_3080, _3074, _3126);
        _3098 = _3140;
    }
    float _3142 = _3098;
    if (!_3016)
    {
        _3108 = _3010;
    }
    float _3144 = _3108;
    float _3146 = _3144;
    if (_3016)
    {
        float _3148 = _3134 * _3134;
        _3146 = _3148;
    }
    float _3150 = _3146;
    float _3152 = fma(_3142, _3142, _3138);
    float _3154 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3156 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3158 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3160 = _3152 + _3150;
    float _3162 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3164 = fma(_3000, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3162);
    float _3166 = precise::clamp(_3164, 0.0, 1.0);
    float _3168 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3154);
    float _3170 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3172 = rsqrt(_3160);
    float _3174 = -_3166;
    float _3176 = _3174 + 1.0;
    float _3178 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3158);
    float _3180 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3168);
    float _3182 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3184 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3170);
    float _3186 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3178);
    float _3188 = _3180 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3190 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3182);
    float _3192 = abs(_3176);
    float _3194 = log2(_3192);
    float _3196 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3184);
    float _3198 = _3186 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3200 = _3188 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3202 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3190);
    float _3204 = _3196 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3206 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3208 = _3172 * _3118;
    float _3210 = -_3200;
    float _3212 = fma(_3210, _3156, 1.0);
    float _3214 = _3202 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3216 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3206);
    float _3218 = _3172 * _3142;
    float _3220 = _3208 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3222 = _3172 * _3134;
    float _3224 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3216);
    float _3226 = log2(_3212);
    float _3228 = -_3220;
    float _3230 = fma(_3218, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3228);
    float _3232 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3234 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3224);
    float _3236 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3238 = -_3222;
    float _3240 = fma(_3238, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3230);
    float _3242 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3244 = exp2(_3232);
    float _3246 = fma(_3240, -0.5, 0.5);
    float _3248 = fma(_3240, 0.5, 0.5);
    float _3250 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3242);
    float _3252 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3236);
    float _3254 = _3218 + 1.0;
    float _3256 = fma(_3248, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3258 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3250);
    float _3260 = 1.0 / _3234;
    float _3262 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3252);
    float _3264 = fma(_3248, _3256, -0.212114393711090087890625);
    float _3266 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3258);
    float _3268 = _3226 * 0.693147182464599609375;
    float _3270 = fma(_3248, _3264, 1.570728778839111328125);
    float _3272 = sqrt(_3246);
    float _3274 = -_3218;
    float _3276 = fma(_3244, _3254, _3274);
    float _3278 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3262);
    float _3280 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3282 = fma(_3276, 0.5, 0.5);
    float _3284 = _3266 * _3260;
    float _3286 = _3278 * _3260;
    float _3288 = fma(_3284, 0.5, 0.5);
    float _3290 = fma(_3286, -0.5, 0.5);
    float _3292 = _3272 * 0.636619746685028076171875;
    float _3294 = -_3270;
    float _3296 = fma(_3292, _3294, 1.0);
    float3 _8352 = float3(_3288, _3290, _3280);
    float _3298 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8352, float3(0.0), isnan(_8352)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8352, float3(0.0), isnan(_8352)), level(0.0)).x;
    float3 _8363 = float3(_3288, _3290, _3280);
    float4 _3301 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8363, float3(0.0), isnan(_8363)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8363, float3(0.0), isnan(_8363)), level(0.0)).xyzw;
    float _3303 = _3301.x;
    float _3305 = _3301.y;
    float _3307 = _3301.z;
    float _3309 = _3301.w;
    float2 _8380 = float2(_3296, _3282);
    float3 _3313 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8380, float2(0.0), isnan(_8380)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8380, float2(0.0), isnan(_8380)), level(0.0)).xyz;
    float _3315 = _3313.x;
    float _3317 = _3313.y;
    float _3319 = _3313.z;
    float _3321 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3323 = _2918 > 0.0;
    bool _3325 = isnan(_2918);
    bool _3327 = _3323 || _3325;
    bool _3329 = isnan(0.0);
    bool _3331 = _3327 || _3329;
    float _3333 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3321);
    float _3335 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3337 = _2978 <= 0.0;
    bool _3339 = !_3331;
    bool _3341 = _3337 || _3339;
    float _3343 = _3266 + _3234;
    float _3345 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3333);
    float _3347 = _2918 * _2978;
    float _3349 = exp2(_3335);
    float _3351 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3345);
    float _3353 = _3347 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3355 = _3234 * 0.5;
    float _3357 = _3351 + _3234;
    float _3359 = _3343 * 0.5;
    out.gl_Position.x = _3266;
    out.gl_Position.y = _3278;
    out.gl_Position.z = _3351;
    out.gl_Position.w = _3234;
    float _3361 = _3357 * 0.5;
    float _3363 = -_3349;
    float _3365 = _3363 + 1.0;
    float _3367 = fma(_3278, -0.5, _3355);
    float _3369 = _3353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3371 = _3365 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3359;
    out.m_68.y = _3367;
    out.m_68.z = _3361;
    out.m_68.w = _3234;
    float _3373 = -_3371;
    float _3375 = _3373 + 1.0;
    out.m_45.x = _3369;
    float _3377 = _3371 * _3298;
    float _3379 = _3309 * _3375;
    float _3381 = _3309 * _3377;
    float _3383 = _3319 * _3377;
    float _3385 = fma(_3315, _3381, _3303);
    float _3387 = fma(_3317, _3381, _3305);
    float _3389 = fma(_3309, _3383, _3307);
    out.m_70.x = _3385;
    out.m_70.y = _3387;
    out.m_70.z = _3389;
    out.m_70.w = _3379;
    if (!_3341)
    {
        return out;
    }
    float _3391 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3391;
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
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _759 = false;
    bool _607 = false;
    bool _497 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _84 = in.m_42.w;
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
        out.m_45.x = 0.0;
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
        float _3448 = as_type<float>(_105);
        out.gl_Position.z = _3448;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    float _127 = _123;
    if (_119)
    {
        float _129 = float(_89);
        _125 = _129;
    }
    float _131 = _125;
    bool _133 = _123 >= _131;
    bool _135 = !_119;
    bool _137 = _133 || _135;
    if (_137)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _99;
    if (_137)
    {
        out.m_45.x = 0.0;
    }
    if (_137)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_137)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3517 = as_type<float>(_143);
        out.gl_Position.z = _3517;
    }
    if (_137)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _145 = as_type<float>(int(gl_VertexIndex));
    float _147 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _149 = in.m_52.w;
    bool _151 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _153 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _155 = _151 || _153;
    bool _157 = isnan(1.0);
    bool _159 = _155 || _157;
    float _161 = in.m_47.x;
    float _163 = in.m_47.y;
    float _165 = in.m_47.z;
    float _167 = in.m_42.x;
    float _169 = in.m_42.y;
    float _171 = in.m_42.z;
    int _173 = as_type<int>(_145) & 1;
    bool _175 = _173 != 0;
    int _177 = as_type<int>(_145) & 2;
    bool _179 = _177 != 0;
    int _181 = int(_175);
    int _183 = _179 ? 2 : 0;
    int _185 = _181 | _183;
    int _187 = _159 ? 4 : 0;
    int _189 = _185 | _187;
    int _191 = false ? 8 : 0;
    int _193 = _189 | _191;
    int _195 = false ? 16 : 0;
    int _197 = _193 | _195;
    int _199 = false ? 32 : 0;
    int _201 = _197 | _199;
    int _203 = false ? 64 : 0;
    int _205 = _201 | _203;
    int _207 = _205 & 4;
    float _209 = as_type<float>(_207);
    float _211 = _147;
    if (!_159)
    {
        float _213 = _147 * _147;
        float _215 = _213 * 0.5;
        _209 = _215;
    }
    float _217 = _209;
    bool _219 = !_175;
    float _221 = _219 ? (-0.5) : 0.5;
    bool _223 = !_179;
    float _225 = _223 ? (-0.5) : 0.5;
    float _227 = _217;
    if (!_159)
    {
        float _229 = _217 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _227 = _229;
    }
    float _231 = _227;
    bool _233 = !_159;
    float _235 = _231;
    if (!_233)
    {
        float _237 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _239 = log2(_237);
        float _241 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _243 = _241 + 1.0;
        float _245 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _247 = _147 * _239;
        float _249 = 1.0 / _243;
        float _251 = _245 * 0.693147182464599609375;
        float _253 = exp2(_247);
        float _255 = 1.0 / _251;
        float _257 = _253 + (-1.0);
        float _259 = -_257;
        float _261 = fma(_259, _255, _147);
        float _263 = _261 * _249;
        float _265 = _263 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _235 = _265;
    }
    float _267 = _235;
    float _269 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _271 = !_159;
    float _273 = _269;
    float _275 = _267;
    if (!_271)
    {
        float _277 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _279 = log2(_277);
        float _281 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _283 = _281 + 1.0;
        float _285 = 1.0 / _283;
        float _287 = _147 * _279;
        float _289 = exp2(_287);
        float _291 = -_289;
        float _293 = _291 + 1.0;
        float _295 = _293 * _285;
        _211 = _295;
    }
    float _297 = _211;
    float _299 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _301 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _303 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _305 = _269 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    if (!_159)
    {
        float _307 = _123 * _123;
        float _309 = _307 * 0.5;
        _273 = _309;
    }
    float _311 = _273;
    float _313 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].x, _301);
    float _315 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].y, _303);
    float _317 = fma(_299, (*spvDescriptorSet0.vp_c10)._m0[8].z, _305);
    float _319 = _267 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    if (!_159)
    {
        float _321 = _311 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _275 = _321;
    }
    float _323 = _275;
    bool _325 = !_159;
    float _327 = _323;
    if (!_325)
    {
        float _329 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _331 = log2(_329);
        float _333 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _335 = _333 + 1.0;
        float _337 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _339 = _123 * _331;
        float _341 = 1.0 / _335;
        float _343 = _337 * 0.693147182464599609375;
        float _345 = exp2(_339);
        float _347 = 1.0 / _343;
        float _349 = _345 + (-1.0);
        float _351 = -_349;
        float _353 = fma(_351, _347, _123);
        float _355 = _353 * _341;
        float _357 = _355 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _327 = _357;
    }
    float _359 = _327;
    float _361 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _363 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].x, _313);
    float _365 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].y, _315);
    float _367 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
    float _371 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _373 = _361 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _375 = fma(_319, (*spvDescriptorSet0.vp_c10)._m0[10].z, _317);
    float _377 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].x, _369);
    float _379 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].y, _371);
    float _381 = fma(_367, (*spvDescriptorSet0.vp_c10)._m0[8].z, _373);
    float _383 = _359 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _385 = fma(_297, _161, _363);
    float _387 = fma(_297, _163, _365);
    float _389 = fma(_297, _165, _375);
    float _391 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].x, _377);
    float _393 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].y, _379);
    float _395 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[10].z, _381);
    float _397 = _383;
    if (!_159)
    {
        _397 = _123;
    }
    float _399 = _397;
    bool _401 = !_159;
    float _403 = _399;
    if (!_401)
    {
        float _405 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _407 = log2(_405);
        float _409 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _411 = _409 + 1.0;
        float _413 = 1.0 / _411;
        float _415 = _123 * _407;
        float _417 = exp2(_415);
        float _419 = -_417;
        float _421 = _419 + 1.0;
        float _423 = _421 * _413;
        _403 = _423;
    }
    float _425 = _403;
    float _427 = fma(_425, _163, _393);
    float _429 = fma(_425, _165, _395);
    bool _431 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _433 = fma(_425, _161, _391);
    float _435 = fma(_387, _149, _169);
    float _437 = -_427;
    float _439 = _387 + _437;
    float _441 = fma(_385, _149, _167);
    float _443 = -_433;
    float _445 = _385 + _443;
    float _447 = -_429;
    float _449 = _389 + _447;
    float _451 = _439 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _453 = _439 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _455 = _439 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _457 = fma(_389, _149, _171);
    float _459 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[4].x, _451);
    float _461 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[5].x, _453);
    float _463 = fma(_445, (*spvDescriptorSet0.vp_c10)._m0[6].x, _455);
    float _465 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[4].z, _459);
    float _467 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[5].z, _461);
    float _469 = fma(_449, (*spvDescriptorSet0.vp_c10)._m0[6].z, _463);
    bool _471 = !_431;
    float _473 = _467;
    float _475 = _465;
    float _477 = _469;
    float _495;
    if (!_471)
    {
        float _479 = in.m_54.x;
        float _481 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _483 = _479 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _485 = fma(_483, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _487 = _485 * _481;
        float _489 = floor(_487);
        float _491 = -_489;
        float _493 = _487 + _491;
        _495 = _493;
        _497 = true;
    }
    else
    {
        float _499 = float(_89);
        float _501 = 1.0 / _499;
        float _503 = _123 * _501;
        _495 = _503;
    }
    _497 = false;
    float _505 = _495;
    float _507 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _509 = _505 + _507;
    float _511 = in.m_52.x;
    float _513 = in.m_52.y;
    bool _515 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _517 = isnan(_505);
    bool _519 = _515 || _517;
    bool _521 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _523 = _519 || _521;
    float _525 = float(_523);
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _529 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _527;
    bool _531 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _533 = isnan(_505);
    bool _535 = _531 || _533;
    bool _537 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _539 = _535 || _537;
    float _541 = float(_539);
    float _543 = -_525;
    float _545 = _543 + 1.0;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _547;
    float _551 = 1.0 / _529;
    bool _553 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _555 = _541 * _545;
    float _557 = -_541;
    float _559 = _557 + 1.0;
    float _561 = _509 * _551;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _563;
    float _567 = fma(_549, _561, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _569 = fma(_565, _561, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _571 = _567 * _555;
    float _573 = _569 * _555;
    float _575 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[143].x, _571);
    float _577 = fma(_559, (*spvDescriptorSet0.vp_c9)._m0[143].y, _573);
    float _579 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[144].x, _575);
    float _581 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[144].y, _577);
    float _583 = _579 * _511;
    float _585 = _581 * _513;
    bool _587 = !_553;
    float _605;
    if (!_587)
    {
        float _589 = in.m_54.x;
        float _591 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _593 = _589 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _595 = fma(_593, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _597 = _595 * _591;
        float _599 = floor(_597);
        float _601 = -_599;
        float _603 = _597 + _601;
        _605 = _603;
        _607 = true;
    }
    else
    {
        float _609 = float(_89);
        float _611 = 1.0 / _609;
        float _613 = _123 * _611;
        _605 = _613;
    }
    _607 = false;
    float _615 = _605;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _619 = _615 + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _623 = _621 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _625 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _627 = isnan(_615);
    bool _629 = _625 || _627;
    bool _631 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _633 = _629 || _631;
    float _635 = float(_633);
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _639 = _637 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _641 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _643 = isnan(_615);
    bool _645 = _641 || _643;
    bool _647 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _649 = _645 || _647;
    float _651 = float(_649);
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _653;
    bool _657 = _615 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _659 = isnan(_615);
    bool _661 = _657 || _659;
    bool _663 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _665 = _661 || _663;
    float _667 = float(_665);
    float _669 = 1.0 / _623;
    float _671 = -_635;
    float _673 = _671 + 1.0;
    bool _675 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _677 = _651 * _673;
    float _679 = -_651;
    float _681 = _679 + 1.0;
    float _683 = 1.0 / _639;
    float _685 = _655 * _669;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _691 = fma(_685, _619, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _693 = _689 * _683;
    float _695 = _691 * _677;
    float _697 = -_667;
    float _699 = _697 + 1.0;
    float _701 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _703 = _615 + _701;
    float _705 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[115].x, _695);
    float _707 = _635 * _699;
    float _709 = fma(_693, _703, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _711 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _713 = fma(_709, _707, _705);
    float _715 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _717 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _719 = fma(_667, (*spvDescriptorSet0.vp_c9)._m0[117].x, _713);
    float _721 = _711 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _723 = _715 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _725 = _717 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _727 = _719 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _721;
    out.m_56.y = _723;
    out.m_56.z = _725;
    out.m_56.w = _727;
    bool _729 = !_675;
    float _753;
    float _755;
    float _757;
    if (!_729)
    {
        float _731 = in.m_54.x;
        float _733 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _735 = float(_89);
        float _737 = 1.0 / _735;
        float _739 = _731 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _741 = _123 * _737;
        float _743 = fma(_739, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _745 = _743 * _733;
        float _747 = floor(_745);
        float _749 = -_747;
        float _751 = _745 + _749;
        _753 = _741;
        _755 = _735;
        _757 = _751;
        _759 = true;
    }
    else
    {
        float _761 = float(_89);
        float _763 = 1.0 / _761;
        float _765 = _123 * _763;
        _753 = _765;
        _755 = _761;
        _757 = _765;
    }
    _759 = false;
    float _767 = _753;
    float _769 = _755;
    float _771 = _757;
    float _773 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _775 = int(_773);
    float _777 = in.m_54.x;
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _781 = _767 + _779;
    float _783 = _583 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _787 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _785;
    float _789 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _791 = int(_789);
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _795 = _793 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _797 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _799 = _797 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _801 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _803 = _801 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    float _805 = float(_775);
    float _807 = 1.0 / _769;
    float _809 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _811 = _809 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    int _813 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _815 = _813 != 0;
    float _817 = float(uint(_791));
    float _819 = 1.0 / _805;
    int _821 = ~_791;
    int _823 = _821 + 1;
    float _825 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _827 = _825 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _829 = float(_791);
    bool _831 = _791 == 0;
    float _833 = 1.0 / _817;
    bool _835 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _837 = isnan(_767);
    bool _839 = _835 || _837;
    bool _841 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _843 = _839 || _841;
    float _845 = float(_843);
    float _847 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _847;
    bool _851 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _853 = isnan(_771);
    bool _855 = _851 || _853;
    bool _857 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _859 = _855 || _857;
    float _861 = float(_859);
    float _863 = _123 * _819;
    float _865 = 1.0 / _787;
    float _867 = _819;
    float _869 = _805;
    if (!_815)
    {
        float _871 = in.m_54.y;
        _867 = _871;
    }
    float _873 = _867;
    float _875 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _877 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _875;
    bool _879 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _881 = isnan(_767);
    bool _883 = _879 || _881;
    bool _885 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _887 = _883 || _885;
    float _889 = float(_887);
    float _891 = -_845;
    float _893 = _891 + 1.0;
    bool _895 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _897 = isnan(_767);
    bool _899 = _895 || _897;
    bool _901 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _903 = _899 || _901;
    float _905 = float(_903);
    int _907 = as_type<int>(_833) + (-2);
    float _909 = trunc(_863);
    int _911 = int(_909);
    int _913 = ~_791;
    int _915 = _913 + 1;
    float _917 = 1.0 / _795;
    float _919 = float(uint(_911));
    float _921 = 1.0 / _799;
    if (!_815)
    {
        _869 = _873;
    }
    float _923 = _869;
    float _925 = as_type<float>(_907) * _919;
    float _927 = _923;
    int _929 = as_type<int>(_873);
    if (_815)
    {
        float _931 = in.m_54.x;
        float _933 = in.m_54.y;
        _927 = _931;
        _929 = as_type<int>(_933);
    }
    float _935 = _927;
    int _937 = _929;
    float _939 = trunc(_925);
    float _941 = precise::max(_939, 0.0);
    uint _944 = uint(_941);
    float _946 = 1.0 / _803;
    float _948 = float(_911);
    bool _950 = _948 >= _829;
    bool _952 = isnan(_948);
    bool _954 = _950 || _952;
    bool _956 = isnan(_829);
    bool _958 = _954 || _956;
    float _960 = float(_958);
    int _962 = _915 * int(_944);
    int _964 = _962 + _911;
    float _966 = 1.0 / _811;
    float _968 = float(uint(_964));
    bool _970 = !_815;
    float _972 = _970 ? as_type<float>(_937) : _777;
    float _974 = trunc(_960);
    int _976 = int(_974);
    float _978 = as_type<float>(_907) * _968;
    bool _980 = !_815;
    float _982 = _980 ? 1.2345600128173828125 : 1.0;
    float _984 = trunc(_978);
    float _986 = precise::max(_984, 0.0);
    uint _988 = uint(_986);
    float _990 = _982 * _972;
    float _992 = floor(_990);
    int _994 = int(_944) + int(_988);
    float _996 = 1.0 / _827;
    int _998 = _823 * _994;
    int _1000 = _998 + _911;
    float _1002 = -_992;
    float _1004 = _990 + _1002;
    int _1006 = ~_976;
    int _1008 = _1006 + 1;
    int _1010 = _1008 + 1;
    float _1012 = _829 * _1004;
    bool _1014 = uint(_1000) >= uint(_791);
    float _1016 = _123 * _829;
    float _1018 = trunc(_1012);
    int _1020 = int(_1018);
    bool _1022 = !_1014;
    int _1024 = _1022 ? 0 : (-1);
    float _1026 = _1016 * _807;
    int _1028 = ~_994;
    int _1030 = _1028 + _1024;
    int _1032 = _1030 + 1;
    float _1034 = trunc(_1026);
    int _1036 = int(_1034);
    int _1038 = _791 * _1032;
    int _1040 = _1038 + _911;
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1044 = _1042 != 0;
    bool _1046 = !_831;
    int _1048 = _1046 ? _1040 : (-1);
    int _1050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1052 = _1050 != 0;
    int _1054 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1056 = _1054 != 0;
    int _1058 = _791 + (-1);
    int _1060 = _1010 * _1048;
    bool _1062 = !_1044;
    int _1064 = _1062 ? 0 : 1;
    int _1066 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1068 = _1066 != 0;
    int _1070 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1072 = _1070 != 0;
    int _1074 = _976 * _1058;
    int _1076 = _1074 + _1060;
    bool _1078 = !_1056;
    int _1080 = _1078 ? 0 : 1;
    bool _1082 = !_1052;
    int _1084 = _1082 ? 0 : 1;
    int _1086 = abs(_1064);
    bool _1088 = !_1068;
    int _1090 = _1088 ? 0 : 1;
    int _1092 = abs(_1080);
    int _1094 = _1020 * _1086;
    int _1096 = _1094 + _911;
    int _1098 = abs(_1084);
    bool _1100 = !_1072;
    int _1102 = _1100 ? 0 : 1;
    int _1104 = _1076 * _1092;
    int _1106 = abs(_1090);
    int _1108 = abs(_1102);
    float _1110 = in.m_54.z;
    int _1112 = _1036 * _1098;
    int _1114 = _1112 + _1104;
    int _1116 = ~_791;
    int _1118 = _1116 + 1;
    int _1120 = _1096 * _1106;
    int _1122 = _1120 + _1114;
    int _1124 = _1020 * _1108;
    int _1126 = _1124 + _1122;
    int _1128 = ~_791;
    int _1130 = _1128 + 1;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1134 = _1132 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _1136 = float(uint(_1126));
    float _1138 = as_type<float>(_907) * _1136;
    float _1140 = trunc(_1138);
    float _1142 = precise::max(_1140, 0.0);
    uint _1144 = uint(_1142);
    int _1146 = _1130 * int(_1144);
    int _1148 = _1146 + _1126;
    float _1150 = float(uint(_1148));
    float _1152 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1154 = log2(_1152);
    float _1156 = as_type<float>(_907) * _1150;
    float _1158 = trunc(_1156);
    float _1160 = precise::max(_1158, 0.0);
    uint _1162 = uint(_1160);
    int _1164 = int(_1144) + int(_1162);
    int _1166 = _1118 * _1164;
    int _1168 = _1166 + _1126;
    bool _1170 = uint(_1168) >= uint(_791);
    bool _1172 = !_1170;
    int _1174 = _1172 ? 0 : (-1);
    int _1176 = ~_1164;
    int _1178 = _1176 + _1174;
    int _1180 = _1178 + 1;
    float _1182 = in.m_54.w;
    int _1184 = _791 * _1180;
    int _1186 = _1184 + _1126;
    float _1188 = _777 * 2.0;
    bool _1190 = !_831;
    int _1192 = _1190 ? _1186 : (-1);
    float _1194 = floor(_1188);
    int _1196 = _1192 & 3;
    bool _1198 = _1196 != 0;
    float _1200 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1202 = _1200 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _1204 = uint(_1196) > 1u;
    float _1206 = 1.0 / _1202;
    bool _1208 = _1182 > 0.5;
    int _1210 = _1198 ? 0 : 1;
    bool _1212 = _1110 > 0.5;
    bool _1214 = _1194 >= 0.0;
    bool _1216 = isnan(_1194);
    bool _1218 = _1214 || _1216;
    bool _1220 = isnan(0.0);
    bool _1222 = _1218 || _1220;
    float _1224 = -_221;
    int _1226 = _1212 ? as_type<int>(_1224) : as_type<int>(_221);
    int _1228 = ~_1210;
    int _1230 = _1228 + 1;
    int _1232 = _1230 + 1;
    bool _1234 = _1194 > 0.0;
    int _1236 = _1232;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[7].x;
    if (!_1204)
    {
        int _1240 = ~_1210;
        int _1242 = _1240 + 1;
        _1236 = _1242;
    }
    int _1244 = _1236;
    float _1246 = -_225;
    int _1248 = _1208 ? as_type<int>(_1246) : as_type<int>(_225);
    int _1250 = _1222 ? 0 : 1;
    bool _1252 = _777 > 0.5;
    int _1254 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1256 = _1254 != 0;
    int _1258 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1260 = _1258 != 0;
    float _1262 = -_221;
    int _1264 = _1252 ? as_type<int>(_1262) : as_type<int>(_221);
    int _1266 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1268 = _1266 != 0;
    int _1270 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1272 = _1270 != 0;
    int _1274 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1276 = _1274 != 0;
    int _1278 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1280 = _1278 != 0;
    bool _1282 = !_1256;
    float _1284 = _1282 ? _221 : as_type<float>(_1226);
    float _1286 = 1.0 / _1134;
    float _1288 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _1290 = ~_1250;
    int _1292 = _1290 + 1;
    int _1294 = _1292 + 1;
    bool _1296 = !_1260;
    float _1298 = _1296 ? _225 : as_type<float>(_1248);
    float _1300 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1288);
    float _1302 = _123 * _1154;
    int _1304 = _1294;
    if (!_1234)
    {
        int _1306 = ~_1250;
        int _1308 = _1306 + 1;
        _1304 = _1308;
    }
    int _1310 = _1304;
    float _1312 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1314 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1316 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1318 = _1316 != 0;
    float _1320 = exp2(_1302);
    float _1322 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1312);
    float _1324 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1314);
    float _1326 = _1110 * 2.0;
    int _1328 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1330 = _1328 != 0;
    float _1332 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1322);
    int _1334 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1336 = _1334 != 0;
    float _1338 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1340 = _771 + _1338;
    float _1342 = floor(_1326);
    float _1344 = _1340 * _865;
    float _1346 = 0.0;
    if (!_1280)
    {
        _1346 = _1110;
    }
    float _1348 = _1346;
    float _1350 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1352 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1350;
    float _1354 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1356 = _1354 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1358 = _1348;
    if (!_1280)
    {
        _1238 = _1110;
    }
    float _1360 = _1238;
    float _1362 = -_1320;
    float _1364 = _1362 + 1.0;
    float _1366 = _1352 * _917;
    float _1368 = _1356 * _1206;
    float _1370 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1372 = _1370 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1374 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1376 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1374;
    float _1378 = _1360;
    if (_1280)
    {
        _1358 = as_type<float>(_937);
    }
    float _1380 = _1358;
    float _1382 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1384 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1382;
    if (_1280)
    {
        _1378 = as_type<float>(_937);
    }
    float _1386 = _1378;
    float _1388 = _1372 * _921;
    float _1390 = _1376 * _1286;
    bool _1392 = _1342 >= 0.0;
    bool _1394 = isnan(_1342);
    bool _1396 = _1392 || _1394;
    bool _1398 = isnan(0.0);
    bool _1400 = _1396 || _1398;
    float _1402 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1404 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1402;
    float _1406 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1408 = _1406 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1410 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1300);
    int _1412 = _1400 ? 0 : 1;
    float _1414 = _1404 * _946;
    bool _1416 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1418 = isnan(0.0);
    bool _1420 = _1416 || _1418;
    bool _1422 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1424 = _1420 || _1422;
    float _1426 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1324);
    float _1428 = _1408 * _966;
    float _1430 = _1424 ? _1364 : 0.0;
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1434 = _767 + _1432;
    bool _1436 = _1342 > 0.0;
    float _1438 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1440 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1438;
    bool _1442 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1444 = isnan(_767);
    bool _1446 = _1442 || _1444;
    bool _1448 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1450 = _1446 || _1448;
    float _1452 = float(_1450);
    float _1454 = fma(_849, _1344, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1456 = fma(_877, _1344, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1458 = fma(_1440, _1344, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1460 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1462 = _767 + _1460;
    float _1464 = fma(_1366, _1434, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1466 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1468 = isnan(_767);
    bool _1470 = _1466 || _1468;
    bool _1472 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1474 = _1470 || _1472;
    float _1476 = float(_1474);
    float _1478 = -_1452;
    float _1480 = _1478 + 1.0;
    float _1482 = _1384 * _996;
    float _1484 = fma(_1368, _1462, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1486 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1488 = _767 + _1486;
    bool _1490 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1492 = isnan(_767);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1498 = _1494 || _1496;
    float _1500 = float(_1498);
    float _1502 = _1476 * _1480;
    float _1504 = -_1476;
    float _1506 = _1504 + 1.0;
    float _1508 = fma(_1388, _1488, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    bool _1510 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1512 = isnan(_767);
    bool _1514 = _1510 || _1512;
    bool _1516 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1518 = _1514 || _1516;
    float _1520 = float(_1518);
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1524 = _767 + _1522;
    float _1526 = _1500 * _1506;
    float _1528 = -_1500;
    float _1530 = _1528 + 1.0;
    bool _1532 = _767 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _1534 = isnan(_767);
    bool _1536 = _1532 || _1534;
    bool _1538 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _1540 = _1536 || _1538;
    float _1542 = float(_1540);
    float _1544 = -_1520;
    float _1546 = _1544 + 1.0;
    float _1548 = fma(_1482, _1524, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1550 = _1520 * _1530;
    bool _1552 = _771 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1554 = isnan(_771);
    bool _1556 = _1552 || _1554;
    bool _1558 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1560 = _1556 || _1558;
    float _1562 = float(_1560);
    float _1564 = _1542 * _1546;
    float _1566 = -_1542;
    float _1568 = _1566 + 1.0;
    float _1570 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1572 = _767 + _1570;
    float _1574 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1576 = _767 + _1574;
    float _1578 = -_1562;
    float _1580 = _1578 + 1.0;
    float _1582 = _845 * _1568;
    float _1584 = _889 * _893;
    float _1586 = -_889;
    float _1588 = _1586 + 1.0;
    float _1590 = _861 * _1580;
    float _1592 = fma(_1390, _1572, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1594 = -_861;
    float _1596 = _1594 + 1.0;
    float _1598 = _1454 * _1590;
    float _1600 = _1458 * _1590;
    float _1602 = _905 * _1588;
    float _1604 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1606 = 1.0 + _1604;
    float _1608 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1600);
    float _1610 = fma(_1414, _1576, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1612 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1614 = _1464 * _1602;
    float _1616 = -_905;
    float _1618 = _1616 + 1.0;
    float _1620 = _1456 * _1590;
    float _1622 = 1.0 / _1606;
    float _1624 = fma(_1618, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1614);
    float _1626 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1598);
    float _1628 = fma(_1596, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1620);
    float _1630 = fma(_1484, _1584, _1624);
    float _1632 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1634 = _935 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1636 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[124].y, _1628);
    float _1638 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1640 = fma(_935, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1612);
    float _1642 = -_1632;
    float _1644 = fma(_1634, 2.0, _1642);
    float _1646 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1648 = as_type<float>(_937) * 2.0;
    bool _1650 = !_1330;
    float _1652 = _1650 ? _221 : as_type<float>(_1264);
    float _1654 = _777 + as_type<float>(_937);
    int _1656 = ~_1412;
    int _1658 = _1656 + 1;
    int _1660 = _1658 + 1;
    float _1662 = _1110 + as_type<float>(_937);
    int _1664 = _1660;
    if (!_1436)
    {
        int _1666 = ~_1412;
        int _1668 = _1666 + 1;
        _1664 = _1668;
    }
    int _1670 = _1664;
    float _1672 = _1654 + (-1.0);
    float _1674 = _1662 + (-1.0);
    float _1676 = floor(_1648);
    bool _1678 = !_1272;
    int _1680 = _1678 ? 0 : 1;
    float _1682 = _1430 * _1622;
    float _1684 = fma(_1672, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1686 = fma(_1674, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1688 = abs(_1680);
    float _1690 = fma(_1386, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1638);
    float _1692 = float(uint(_1096));
    float _1694 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[124].x, _1626);
    bool _1696 = as_type<float>(_937) > 0.5;
    float _1698 = fma(_1428, _781, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1700 = !_1268;
    int _1702 = _1700 ? 0 : 1;
    float _1704 = as_type<float>(_907) * _1692;
    float _1706 = -_225;
    int _1708 = _1696 ? as_type<int>(_1706) : as_type<int>(_225);
    float _1710 = _1332 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _1712 = uint(_1196) >= 2u;
    float _1714 = fma(_1562, (*spvDescriptorSet0.vp_c9)._m0[124].z, _1608);
    bool _1716 = _1676 >= 0.0;
    bool _1718 = isnan(_1676);
    bool _1720 = _1716 || _1718;
    bool _1722 = isnan(0.0);
    bool _1724 = _1720 || _1722;
    float _1726 = trunc(_1704);
    float _1728 = precise::max(_1726, 0.0);
    uint _1730 = uint(_1728);
    int _1732 = _1712 ? 0 : 1;
    float _1734 = _1380 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _1736 = _1676 > 0.0;
    float _1738 = fma(_1548, _1582, _1630);
    int _1740 = abs(_1702);
    float _1742 = _1410 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1744 = ~_791;
    int _1746 = _1744 + 1;
    float _1748 = _1284 + 0.5;
    float _1750 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1752 = _1742 + _1750;
    float _1754 = float(_1688);
    float _1756 = -_123;
    float _1758 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1644);
    float _1760 = float(_1310);
    float _1762 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1764 = _1710 + _1762;
    float _1766 = float(_1740);
    float _1768 = _1752 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1770 = float(_1670);
    float _1772 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1758);
    float _1774 = _1754 * _1760;
    int _1776 = _1192 >> 31;
    float _1778 = _1766 * _1770;
    float _1780 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1768);
    int _1782 = _1746 * int(_1730);
    int _1784 = _1782 + _1096;
    int _1786 = _1776 & 3;
    float _1788 = fma(_1734, -2.0, _1646);
    bool _1790 = !_1336;
    float _1792 = _1790 ? _225 : as_type<float>(_1708);
    float _1794 = fma(_1508, _1564, _1738);
    float _1796 = float(uint(_1784));
    float _1798 = _1298 + (-0.5);
    float _1800 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1788);
    int _1802 = _1192 + _1786;
    float _1804 = as_type<float>(_907) * _1796;
    float _1806 = fma(_1592, _1550, _1794);
    float _1808 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    int _1810 = _1802 >> 2;
    float _1812 = -_1798;
    float _1814 = -_1800;
    float _1816 = fma(_1812, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1814);
    float _1818 = _1426 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1820 = trunc(_1804);
    float _1822 = precise::max(_1820, 0.0);
    uint _1824 = uint(_1822);
    int _1826 = _1810 << 4;
    int _1828 = _1826 + 512;
    float _1830 = _1694 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1832 = _1636 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1834 = _1714 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    uint _1836 = uint(int(uint(_1828) >> uint(2)));
    uint _1838 = uint(int(uint(int(_1836)) >> uint(2)));
    int _1840 = int(_1836) & 3;
    float _1842 = (*spvDescriptorSet0.vp_c9)._m0[int(_1838)][_1840];
    int _1844 = int(_1836) + 1;
    uint _1846 = uint(int(uint(_1844) >> uint(2)));
    int _1848 = _1844 & 3;
    float _1850 = (*spvDescriptorSet0.vp_c9)._m0[int(_1846)][_1848];
    float _1852 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1854 = _1818 + _1852;
    float _1856 = _1830 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1858 = _1832 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1860 = _1834 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1862 = fma(_1854, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1780);
    float _1864 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1690);
    float _1866 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _1868 = _1828 + 8;
    uint _1870 = uint(int(uint(_1868) >> uint(2)));
    uint _1872 = uint(int(uint(int(_1870)) >> uint(2)));
    int _1874 = int(_1870) & 3;
    float _1876 = (*spvDescriptorSet0.vp_c9)._m0[int(_1872)][_1874];
    int _1878 = int(_1870) + 1;
    uint _1880 = uint(int(uint(_1878) >> uint(2)));
    int _1882 = _1878 & 3;
    float _1884 = (*spvDescriptorSet0.vp_c9)._m0[int(_1880)][_1882];
    out.m_58.x = _1856;
    out.m_58.y = _1858;
    out.m_58.z = _1860;
    out.m_58.w = _1808;
    bool _1886 = _1862 >= 0.0;
    float _1888 = _1778 * (-2.0);
    int _1890 = _1724 ? 0 : 1;
    float _1892 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1640);
    int _1894 = int(_1730) + int(_1824);
    float _1896 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _1898 = ~_1890;
    int _1900 = _1898 + 1;
    int _1902 = _1900 + 1;
    float _1904 = -_1792;
    float _1906 = _1904 + 0.5;
    bool _1908 = _1196 != 3;
    float _1910 = in.m_60.x;
    float _1912 = in.m_60.y;
    float _1914 = in.m_60.z;
    int _1916 = _1902;
    if (!_1736)
    {
        int _1918 = ~_1890;
        int _1920 = _1918 + 1;
        _1916 = _1920;
    }
    int _1922 = _1916;
    float _1924 = _1652 + 0.5;
    int _1926 = _1192 & 3;
    bool _1928 = _1926 != 0;
    float _1930 = -_1864;
    float _1932 = _1930 + 1.0;
    int _1934 = ~_791;
    int _1936 = _1934 + 1;
    float _1938 = _1924 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1940 = -_1892;
    float _1942 = _1940 + 1.0;
    float _1944 = fma(_1298, _1932, _1816);
    float _1946 = _1906 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _1948 = !_1928;
    int _1950 = _1948 ? 0 : 1;
    float _1952 = _1938 * _1866;
    int _1954 = abs(_1244);
    int _1956 = _1936 * _1894;
    int _1958 = _1956 + _1096;
    float _1960 = -_1942;
    float _1962 = fma(_1284, _1960, _1772);
    float _1964 = _1946 * _1896;
    float _1966 = fma(_1698, _1526, _1806);
    int _1968 = ~_1732;
    int _1970 = _1968 + 1;
    int _1972 = _1970 + 1;
    float _1974 = fma(_1684, _1888, _1684);
    bool _1976 = uint(_1958) >= uint(_791);
    out.m_62.x = _1952;
    out.m_62.y = _1964;
    out.m_62.z = _1962;
    out.m_62.w = _1944;
    int _1978 = _1972;
    if (_1908)
    {
        int _1980 = ~_1732;
        int _1982 = _1980 + 1;
        _1978 = _1982;
    }
    int _1984 = _1978;
    float _1986 = fma(_1610, _1502, _1966);
    bool _1988 = !_1976;
    int _1990 = _1988 ? 0 : (-1);
    float _1992 = fma(_1888, _1910, _1910);
    bool _1994 = _1196 != 3;
    float _1996 = fma(_1452, (*spvDescriptorSet0.vp_c9)._m0[158].x, _1986);
    int _1998 = abs(_1950);
    float _2000 = _1774 * (-2.0);
    int _2002 = ~_1954;
    int _2004 = _2002 + 1;
    int _2006 = _2004 + 1;
    if (_1886)
    {
        out.m_45.x = 0.0;
    }
    int _2008 = abs(_1984);
    float _2010 = fma(_1686, _2000, _1686);
    int _2012 = ~_1894;
    int _2014 = _2012 + _1990;
    int _2016 = _2014 + 1;
    int _2018 = _2006 * as_type<int>(_1850);
    bool _2020 = !_1994;
    int _2022 = _2020 ? 0 : (-1);
    out.m_64.x = _1996;
    int _2024 = ~_1998;
    int _2026 = _2024 + 1;
    int _2028 = _2026 + 1;
    float _2030 = fma(_2000, _1912, _1912);
    bool _2032 = !_1318;
    int _2034 = _2032 ? 0 : 1;
    float _2036 = as_type<float>(_937) + (-0.5);
    int _2038 = abs(_2022);
    int _2040 = _2028 * as_type<int>(_1842);
    int _2042 = _2040 + _2018;
    float _2044 = _1752 * _1752;
    int _2046 = abs(_2034);
    float _2048 = _777 + (-0.5);
    int _2050 = ~_2008;
    int _2052 = _2050 + 1;
    int _2054 = _2052 + 1;
    float _2056 = fma(_1764, _1764, _2044);
    int _2058 = ~_2038;
    int _2060 = _2058 + 1;
    int _2062 = _2060 + 1;
    float _2064 = fma(_2048, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1992);
    int _2066 = _791 * _2016;
    int _2068 = _2066 + _1096;
    float _2070 = fma(_1854, _1854, _2056);
    int _2072 = _2054 * as_type<int>(_1876);
    int _2074 = _2072 + _2042;
    int _2076 = ~_2046;
    int _2078 = _2076 + 1;
    int _2080 = _2078 + 1;
    float _2082 = _783 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2084 = _791 == 0;
    int _2086 = _2062 * as_type<int>(_1884);
    int _2088 = _2086 + _2074;
    float _2090 = rsqrt(_2070);
    float _2092 = as_type<float>(_2042);
    if (_1886)
    {
        _2092 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2094 = _2092;
    bool _2096 = !_2084;
    int _2098 = _2096 ? _2068 : (-1);
    int _2100 = _2080 * _2088;
    bool _2102 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2104 = isnan(1.0);
    bool _2106 = _2102 || _2104;
    bool _2108 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2110 = _2106 || _2108;
    int _2112 = as_type<int>(_2094);
    if (_1886)
    {
        float _2114 = _2094 * 5.0;
        _2112 = as_type<int>(_2114);
    }
    int _2116 = _2112;
    int _2118 = _2098 * _2046;
    int _2120 = _2118 + _2100;
    bool _2122 = !_2110;
    float _2124 = _2122 ? _123 : _1682;
    bool _2126 = !_1276;
    int _2128 = _2126 ? 0 : 1;
    if (_1886)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6530 = as_type<float>(_2116);
        out.gl_Position.z = _6530;
    }
    float _2130 = float(_2120);
    float _2132 = fma(_2124, _1974, _2064);
    float _2134 = _2082 * _2090;
    out.m_66.y = _2130;
    float _2136 = _1764 * _2134;
    float _2138 = _1752 * _2134;
    int _2140 = abs(_2128);
    if (_1886)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2142 = -_2138;
    float _2144 = _1742 + _2142;
    float _2146 = _1854 * _2134;
    float _2148 = -_2136;
    float _2150 = _1710 + _2148;
    float _2152 = _2132 * 0.15915493667125701904296875;
    float _2154 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2156 = _2144 + _2154;
    float _2158 = -_2146;
    float _2160 = _1818 + _2158;
    float _2162 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2164 = _2150 + _2162;
    float _2166 = float(_2140);
    float _2168 = _2156 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2170 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2172 = _2160 + _2170;
    float _2174 = float(_1922);
    float _2176 = -_2138;
    float _2178 = _1752 + _2176;
    float _2180 = fma(_2164, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2168);
    float _2182 = fma(_2036, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2030);
    float _2184 = -_2136;
    float _2186 = _1764 + _2184;
    float _2188 = _2166 * _2174;
    float _2190 = fma(_2172, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2180);
    float _2192 = _2178 * _2178;
    float _2194 = _777 + _1110;
    float _2196 = _2188 * (-2.0);
    float _2198 = fma(_2124, _2010, _2182);
    bool _2200 = _2190 >= 0.0;
    float _2202 = fma(_2186, _2186, _2192);
    float _2204 = -_2146;
    float _2206 = _1854 + _2204;
    float _2208 = _1110 + (-0.5);
    float _2210 = _2194 + (-1.0);
    float _2212 = fma(_2196, _1914, _1914);
    float _2214 = _2198 * 0.15915493667125701904296875;
    float _2216 = fma(_2206, _2206, _2202);
    float _2218 = fma(_2210, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2220 = fma(_2208, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2212);
    float _2222 = _2152 * 6.283185482025146484375;
    float _2224 = sin(_2222);
    float _2226 = _2168;
    int _2228 = as_type<int>(_2212);
    float _2230 = _2164;
    float _2232 = _2160;
    if (_2200)
    {
        _2226 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2234 = _2226;
    float _2236 = fma(_2218, _2196, _2218);
    if (_2200)
    {
        out.m_45.x = 0.0;
    }
    if (_2200)
    {
        float _2238 = _2234 * 5.0;
        _2228 = as_type<int>(_2238);
    }
    int _2240 = _2228;
    float _2242 = _2152 * 6.283185482025146484375;
    float _2244 = cos(_2242);
    float _2246 = fma(_2124, _2236, _2220);
    if (_2200)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6723 = as_type<float>(_2240);
        out.gl_Position.z = _6723;
    }
    float _2248 = _2246 * 0.15915493667125701904296875;
    float _2250 = _2214 * 6.283185482025146484375;
    float _2252 = sin(_2250);
    float _2254 = sqrt(_2216);
    float _2256 = _2214 * 6.283185482025146484375;
    float _2258 = cos(_2256);
    if (_2200)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2260 = _2248 * 6.283185482025146484375;
    float _2262 = cos(_2260);
    float _2264 = _2090 * _2254;
    float _2266 = _585 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2268 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2270 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2272 = _783 * _2264;
    float _2274 = _2264 * _2266;
    float _2276 = _2244 * _2258;
    float _2278 = _2248 * 6.283185482025146484375;
    float _2280 = sin(_2278);
    float _2282 = _2270 * _2272;
    float _2284 = _2268 * _2274;
    float _2286 = _2224 * _2252;
    float _2288 = _2244 * _2252;
    float _2290 = _2264 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2292 = _2290 * 0.5;
    float _2294 = _2262 * _2284;
    float _2296 = _2252 * _2262;
    float _2298 = _2258 * _2262;
    float _2300 = _2224 * _2258;
    float _2302 = _2244 * _2294;
    float _2304 = fma(_2280, _2276, _2286);
    float _2306 = -_2284;
    float _2308 = _2280 * _2306;
    float _2310 = -_2300;
    float _2312 = fma(_2280, _2288, _2310);
    float _2314 = -_2288;
    float _2316 = fma(_2280, _2300, _2314);
    float _2318 = fma(_2304, _2282, _2302);
    float _2320 = _2224 * _2294;
    float _2322 = fma(_2298, _2282, _2308);
    float _2324 = fma(_2280, _2286, _2276);
    float _2326 = fma(_2312, _2292, _2318);
    float _2328 = fma(_2316, _2282, _2320);
    float _2330 = fma(_2296, _2292, _2322);
    float _2332 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2334 = fma(_2324, _2292, _2328);
    float _2336 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2338 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2332);
    float _2340 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2336);
    float _2342 = fma(_2334, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2338);
    float _2344 = fma(_2334, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2340);
    float _2346 = _2342 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2348 = _2344 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2350 = _1818 + _2346;
    float _2352 = _1710 + _2348;
    float _2354 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2356 = _2350 + _2354;
    float _2358 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2360 = _2352 + _2358;
    float _2362 = _2356 * _2356;
    float _2364 = fma(_2360, _2360, _2362);
    float _2366 = _2326 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2368 = sqrt(_2364);
    float _2370 = fma(_2330, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2366);
    float _2372 = fma(_2334, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2370);
    float _2374 = _2372 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2376 = _1742 + _2374;
    bool _2378 = _2368 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2380 = _2374;
    float _2382 = _2352;
    float _2384 = _2350;
    float _2386 = _2376;
    float _2388 = _2296;
    float _2390 = _2356;
    float _2392 = _2364;
    if (!_2378)
    {
        _2380 = _2376;
    }
    float _2394 = _2380;
    bool _2396 = !_2378;
    float _2398 = _2394;
    if (!_2396)
    {
        float _2400 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2402 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2404 = _2368 + _2402;
        float _2406 = _2376 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2408 = rsqrt(_2364);
        float _2410 = _2404 * _2400;
        float _2412 = _2410 * 0.15915493667125701904296875;
        float _2414 = _2412 * 6.283185482025146484375;
        float _2416 = cos(_2414);
        float _2418 = _2412 * 6.283185482025146484375;
        float _2420 = sin(_2418);
        float _2422 = _2416 + (-1.0);
        float _2424 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2426 = fma(_2420, _2406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2428 = fma(_2376, _2416, _2424);
        float _2430 = _2408 * _2426;
        float _2432 = fma(_2360, _2430, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2434 = fma(_2356, _2430, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2398 = _2428;
        _2382 = _2432;
        _2384 = _2434;
    }
    float _2436 = _2398;
    float _2438 = _2382;
    float _2440 = _2384;
    float _2442 = -_1742;
    float _2444 = _2442 + _2436;
    float _2446 = -_1710;
    float _2448 = _2446 + _2438;
    float _2450 = -_1818;
    float _2452 = _2450 + _2440;
    float _2454 = _2444 * _2444;
    float _2456 = fma(_2448, _2448, _2454);
    float _2458 = fma(_2452, _2452, _2456);
    float _2460 = sqrt(_2458);
    bool _2462 = _2460 > 0.0;
    float _2464 = _2460;
    float _2466 = _2440;
    if (!_2462)
    {
        _2386 = _2438;
    }
    float _2468 = _2386;
    float _2470 = _2468;
    float _2472 = _2468;
    if (!_2462)
    {
        _2464 = _2436;
    }
    float _2474 = _2464;
    bool _2476 = !_2462;
    float _2478 = _2474;
    if (!_2476)
    {
        bool _2480 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2482 = _2474;
        if (_2480)
        {
            float _2484 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2482 = _2484;
        }
        float _2486 = _2482;
        float _2488 = _2486;
        if (_2480)
        {
            float _2490 = _465 * _2486;
            _2388 = _2490;
        }
        float _2492 = _2388;
        float _2494 = _2492;
        if (_2480)
        {
            float _2496 = _467 * _2486;
            _2390 = _2496;
        }
        float _2498 = _2390;
        float _2500 = _2498;
        if (_2480)
        {
            float _2502 = _469 * _2486;
            _2392 = _2502;
        }
        float _2504 = _2392;
        float _2506 = _2504;
        if (!_2480)
        {
            bool _2508 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2510 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2512 = _2508 || _2510;
            bool _2514 = isnan(1.0);
            bool _2516 = _2512 || _2514;
            float _2518 = _123 + 1.0;
            float _2520 = _2518;
            if (!_2516)
            {
                float _2522 = _2518 * _2518;
                float _2524 = _2522 * 0.5;
                _127 = _2524;
            }
            float _2526 = _127;
            float _2528 = _2526;
            if (!_2516)
            {
                float _2530 = _2526 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2528 = _2530;
            }
            float _2532 = _2528;
            bool _2534 = !_2516;
            float _2536 = _2532;
            if (!_2534)
            {
                float _2538 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2540 = log2(_2538);
                float _2542 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2544 = 1.0 + _2542;
                float _2546 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2548 = _2540 * _2518;
                float _2550 = 1.0 / _2544;
                float _2552 = _2546 * 0.693147182464599609375;
                float _2554 = exp2(_2548);
                float _2556 = 1.0 / _2552;
                float _2558 = _2554 + (-1.0);
                float _2560 = -_2558;
                float _2562 = fma(_2560, _2556, _2518);
                float _2564 = _2562 * _2550;
                float _2566 = _2564 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2536 = _2566;
            }
            float _2568 = _2536;
            float _2570 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2572 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2574 = _2568 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2576 = _2570 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2578 = _2570 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2580 = _2570 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2582 = fma(_2572, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2576);
            float _2584 = fma(_2572, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2578);
            float _2586 = fma(_2574, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2582);
            bool _2588 = !_2516;
            _2488 = _2586;
            if (!_2588)
            {
                float _2590 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2592 = log2(_2590);
                float _2594 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2596 = 1.0 + _2594;
                float _2598 = 1.0 / _2596;
                float _2600 = _2592 * _2518;
                float _2602 = exp2(_2600);
                float _2604 = -_2602;
                float _2606 = _2604 + 1.0;
                float _2608 = _2606 * _2598;
                _2520 = _2608;
            }
            float _2610 = _2520;
            float _2612 = fma(_2572, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2580);
            float _2614 = fma(_2574, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2584);
            float _2616 = fma(_2610, _163, _2586);
            float _2618 = fma(_2574, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2612);
            float _2620 = fma(_2610, _161, _2614);
            float _2622 = -_427;
            float _2624 = _2622 + _2616;
            float _2626 = fma(_2610, _165, _2618);
            float _2628 = -_433;
            float _2630 = _2628 + _2620;
            float _2632 = _2624 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2634 = _2624 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2636 = _2624 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2638 = -_429;
            float _2640 = _2638 + _2626;
            float _2642 = fma(_2630, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2632);
            float _2644 = fma(_2630, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2634);
            float _2646 = fma(_2630, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2636);
            float _2648 = fma(_2640, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2642);
            float _2650 = fma(_2640, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2644);
            float _2652 = fma(_2640, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2646);
            _473 = _2650;
            _475 = _2648;
            _477 = _2652;
            _2494 = _2648;
            _2500 = _2650;
            _2506 = _2652;
            _2470 = _2614;
        }
        float _2654 = _473;
        float _2656 = _475;
        float _2658 = _477;
        float _2660 = _2494;
        float _2662 = _2500;
        float _2664 = _2506;
        float _2666 = _2488;
        float _2668 = _2470;
        float _2670 = _2654 * _2654;
        float _2672 = rsqrt(_2458);
        float _2674 = fma(_2656, _2656, _2670);
        float _2676 = fma(_2658, _2658, _2674);
        float _2678 = sqrt(_2676);
        float _2680 = _2448 * _2672;
        float _2682 = _2444 * _2672;
        float _2684 = _2452 * _2672;
        bool _2686 = _2678 > 0.0;
        float _2688 = _2668;
        float _2690 = _2666;
        if (!_2686)
        {
            _2688 = _2438;
        }
        float _2692 = _2688;
        _2472 = _2692;
        if (!_2686)
        {
            _2690 = _2436;
        }
        float _2694 = _2690;
        bool _2696 = !_2686;
        _2478 = _2694;
        if (!_2696)
        {
            float _2698 = rsqrt(_2676);
            float _2700 = _2698 * _2654;
            float _2702 = _2698 * _2656;
            float _2704 = _2698 * _2658;
            float _2706 = _2682 * _2700;
            float _2708 = fma(_2680, _2702, _2706);
            float _2710 = fma(_2684, _2704, _2708);
            float _2712 = _2710 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2714 = fma(_2660, _2712, _2438);
            float _2716 = fma(_2662, _2712, _2436);
            float _2718 = fma(_2664, _2712, _2440);
            _2478 = _2716;
            _2466 = _2718;
            _2472 = _2714;
        }
    }
    float _2720 = _2478;
    float _2722 = _2466;
    float _2724 = _2472;
    float _2726 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2728 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2730 = isnan(0.5);
    bool _2732 = _2728 || _2730;
    bool _2734 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2736 = _2732 || _2734;
    float _2738 = -_2138;
    float _2740 = _2738 + _2720;
    bool _2742 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2744 = isnan(0.5);
    bool _2746 = _2742 || _2744;
    bool _2748 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2750 = _2746 || _2748;
    float _2752 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2726);
    float _2754 = -_2146;
    float _2756 = _2754 + _2722;
    float _2758 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2752);
    float _2760 = _2144 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2762 = _2758 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2764 = fma(_2150, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2760);
    float _2766 = 1.0 / _2762;
    float _2768 = fma(_2160, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2764);
    float _2770 = _2768 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2772 = _2770 + _2762;
    float _2774 = _2772 * _2766;
    float _2776 = _2774 * 0.5;
    float _2778 = -_2136;
    float _2780 = _2778 + _2724;
    float _2782 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2784 = fma(_2776, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2782);
    float _2786 = _2776;
    float _2788 = _2740;
    float _2790 = _2780;
    float _2792 = _2756;
    float _2794 = _2762;
    if (_2750)
    {
        _2786 = 1.0;
    }
    float _2796 = _2786;
    float _2798 = 1.0 / _2784;
    float _2800 = _2796;
    if (!_2736)
    {
        float _2802 = _2156 * _2156;
        float _2804 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2806 = -_1818;
        float _2808 = _2806 + _2722;
        float _2810 = -_1710;
        float _2812 = _2810 + _2724;
        float _2814 = fma(_2164, _2164, _2802);
        float _2816 = -_1742;
        float _2818 = _2816 + _2720;
        float _2820 = fma(_2172, _2172, _2814);
        float _2822 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2824 = sqrt(_2820);
        float _2826 = 1.0 / _2264;
        float _2828 = _2822 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2830 = precise::min(_2824, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2832 = _2830 * _2804;
        float _2834 = _2832 * _2826;
        float _2836 = _2828 * _2834;
        float _2838 = _2808 * _2834;
        float _2840 = fma(_2812, _2836, _2150);
        float _2842 = fma(_2818, _2836, _2144);
        float _2844 = fma(_2828, _2838, _2160);
        _2788 = _2842;
        _2790 = _2840;
        _2792 = _2844;
        _2230 = _2824;
        _2794 = _2834;
    }
    float _2846 = _2788;
    float _2848 = _2790;
    float _2850 = _2792;
    float _2852 = _2230;
    float _2854 = _2794;
    float _2856 = _2854;
    float _2858 = _2852;
    if (_2750)
    {
        _2856 = 1.0;
    }
    float _2860 = _2856;
    float _2862 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2864 = _2798 * _2862;
    float _2866 = _2860;
    if (!_2750)
    {
        float _2868 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2870 = _2868 * 0.15915493667125701904296875;
        float _2872 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2874 = _2870 * 6.283185482025146484375;
        float _2876 = cos(_2874);
        float _2878 = _2872 * 0.15915493667125701904296875;
        float _2880 = _2870 * 6.283185482025146484375;
        float _2882 = sin(_2880);
        float _2884 = 1.0 / _2876;
        float _2886 = _2878 * 6.283185482025146484375;
        float _2888 = cos(_2886);
        float _2890 = _2882 * _2884;
        float _2892 = _2878 * 6.283185482025146484375;
        float _2894 = sin(_2892);
        float _2896 = _2888 * _2890;
        float _2898 = 1.0 / _2896;
        float _2900 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2902 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2900;
        float _2904 = 1.0 / _2902;
        float _2906 = _2894 * _2898;
        float _2908 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2910 = fma(_2864, _2906, _2908);
        float _2912 = _2910 * _2904;
        float _2914 = precise::clamp(_2912, 0.0, 1.0);
        _2232 = _2904;
        _2800 = _2914;
    }
    float _2916 = _2232;
    float _2918 = _2800;
    float _2920 = _2916;
    if (!_2750)
    {
        float _2922 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2924 = _2922 * 0.15915493667125701904296875;
        float _2926 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2928 = _2924 * 6.283185482025146484375;
        float _2930 = cos(_2928);
        float _2932 = _2926 * 0.15915493667125701904296875;
        float _2934 = _2924 * 6.283185482025146484375;
        float _2936 = sin(_2934);
        float _2938 = 1.0 / _2930;
        float _2940 = _2932 * 6.283185482025146484375;
        float _2942 = cos(_2940);
        float _2944 = _2936 * _2938;
        float _2946 = _2932 * 6.283185482025146484375;
        float _2948 = sin(_2946);
        float _2950 = _2942 * _2944;
        float _2952 = 1.0 / _2950;
        float _2954 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2956 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2954;
        float _2958 = 1.0 / _2956;
        float _2960 = _2948 * _2952;
        float _2962 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2964 = fma(_2864, _2960, _2962);
        float _2966 = _2964 * _2958;
        float _2968 = precise::clamp(_2966, 0.0, 1.0);
        float _2970 = -_2968;
        float _2972 = _2970 + 1.0;
        _2858 = _2960;
        _2920 = _2938;
        _2866 = _2972;
    }
    float _2974 = _2858;
    float _2976 = _2920;
    float _2978 = _2866;
    float _2980 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2982 = _2846 + _2980;
    float _2984 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2986 = _2848 + _2984;
    float _2988 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2990 = _2850 + _2988;
    float _2992 = _2982 * _2982;
    float _2994 = fma(_2986, _2986, _2992);
    float _2996 = fma(_2990, _2990, _2994);
    float _2998 = rsqrt(_2996);
    float _3000 = sqrt(_2996);
    float _3002 = _2998 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3004 = _2986 * _3002;
    float _3006 = _2990 * _3002;
    float _3008 = _3004 * _3004;
    float _3010 = _3006 * _3006;
    float _3012 = _3008 + _3010;
    float _3014 = sqrt(_3012);
    bool _3016 = _3014 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3018 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3020 = _3014 + _3018;
    float _3022 = _2998;
    float _3024 = _3020;
    float _3026 = _2974;
    float _3028 = _2982;
    float _3030 = _3002;
    if (_3016)
    {
        float _3032 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3022 = _3032;
    }
    float _3034 = _3022;
    float _3036 = _3034;
    if (_3016)
    {
        float _3038 = _3020 * _3034;
        _3024 = _3038;
    }
    float _3040 = _3024;
    if (_3016)
    {
        float _3042 = rsqrt(_3012);
        _3036 = _3042;
    }
    float _3044 = _3036;
    float _3046 = _3044;
    if (_3016)
    {
        float _3048 = _3040 * 0.15915493667125701904296875;
        _3026 = _3048;
    }
    float _3050 = _3026;
    float _3052 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3054 = _2990;
    float _3056 = _3050;
    if (_3016)
    {
        float _3058 = _3050 * 6.283185482025146484375;
        float _3060 = sin(_3058);
        _3054 = _3060;
    }
    float _3062 = _3054;
    float _3064 = precise::max(0.0, _3052);
    float _3066 = _2976;
    float _3068 = _3064;
    if (_3016)
    {
        float _3070 = _3050 * 6.283185482025146484375;
        float _3072 = cos(_3070);
        _3066 = _3072;
    }
    float _3074 = _3066;
    float _3076 = -_3002;
    float _3078 = -_3064;
    float _3080 = fma(_2982, _3076, _3078);
    if (_3016)
    {
        float _3082 = _3080 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3028 = _3082;
    }
    float _3084 = _3028;
    float _3086 = _3062;
    float _3088 = _3084;
    if (_3016)
    {
        float _3090 = fma(_3062, _3084, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3086 = _3090;
    }
    float _3092 = _3086;
    float _3094 = _3092;
    if (!_3016)
    {
        _3088 = _3080;
    }
    float _3096 = _3088;
    float _3098 = _3096;
    if (_3016)
    {
        float _3100 = _3044 * _3092;
        _3030 = _3100;
    }
    float _3102 = _3030;
    if (!_3016)
    {
        _3046 = _3004;
    }
    float _3104 = _3046;
    float _3106 = _3104;
    float _3108 = _3074;
    if (_3016)
    {
        float _3110 = _3074 + (-1.0);
        _3068 = _3110;
    }
    float _3112 = _3068;
    float _3114 = _3112;
    if (_3016)
    {
        float _3116 = _3004 * _3102;
        _3106 = _3116;
    }
    float _3118 = _3106;
    if (!_3016)
    {
        _3094 = _3008;
    }
    float _3120 = _3094;
    float _3122 = _3120;
    if (_3016)
    {
        float _3124 = _3112 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3056 = _3124;
    }
    float _3126 = _3056;
    if (!_3016)
    {
        _3114 = _3006;
    }
    float _3128 = _3114;
    float _3130 = _3128;
    if (_3016)
    {
        float _3132 = _3006 * _3102;
        _3130 = _3132;
    }
    float _3134 = _3130;
    if (_3016)
    {
        float _3136 = _3118 * _3118;
        _3122 = _3136;
    }
    float _3138 = _3122;
    if (_3016)
    {
        float _3140 = fma(_3080, _3074, _3126);
        _3098 = _3140;
    }
    float _3142 = _3098;
    if (!_3016)
    {
        _3108 = _3010;
    }
    float _3144 = _3108;
    float _3146 = _3144;
    if (_3016)
    {
        float _3148 = _3134 * _3134;
        _3146 = _3148;
    }
    float _3150 = _3146;
    float _3152 = fma(_3142, _3142, _3138);
    float _3154 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3156 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3158 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3160 = _3152 + _3150;
    float _3162 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3164 = fma(_3000, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3162);
    float _3166 = precise::clamp(_3164, 0.0, 1.0);
    float _3168 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3154);
    float _3170 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3172 = rsqrt(_3160);
    float _3174 = -_3166;
    float _3176 = _3174 + 1.0;
    float _3178 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3158);
    float _3180 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3168);
    float _3182 = _2846 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3184 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3170);
    float _3186 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3178);
    float _3188 = _3180 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3190 = fma(_2848, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3182);
    float _3192 = abs(_3176);
    float _3194 = log2(_3192);
    float _3196 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3184);
    float _3198 = _3186 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3200 = _3188 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3202 = fma(_2850, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3190);
    float _3204 = _3196 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3206 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3208 = _3172 * _3118;
    float _3210 = -_3200;
    float _3212 = fma(_3210, _3156, 1.0);
    float _3214 = _3202 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3216 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3206);
    float _3218 = _3172 * _3142;
    float _3220 = _3208 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3222 = _3172 * _3134;
    float _3224 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3216);
    float _3226 = log2(_3212);
    float _3228 = -_3220;
    float _3230 = fma(_3218, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3228);
    float _3232 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3234 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3224);
    float _3236 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3238 = -_3222;
    float _3240 = fma(_3238, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3230);
    float _3242 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3244 = exp2(_3232);
    float _3246 = fma(_3240, -0.5, 0.5);
    float _3248 = fma(_3240, 0.5, 0.5);
    float _3250 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3242);
    float _3252 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3236);
    float _3254 = _3218 + 1.0;
    float _3256 = fma(_3248, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3258 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3250);
    float _3260 = 1.0 / _3234;
    float _3262 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3252);
    float _3264 = fma(_3248, _3256, -0.212114393711090087890625);
    float _3266 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3258);
    float _3268 = _3226 * 0.693147182464599609375;
    float _3270 = fma(_3248, _3264, 1.570728778839111328125);
    float _3272 = sqrt(_3246);
    float _3274 = -_3218;
    float _3276 = fma(_3244, _3254, _3274);
    float _3278 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3262);
    float _3280 = _3268 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3282 = fma(_3276, 0.5, 0.5);
    float _3284 = _3266 * _3260;
    float _3286 = _3278 * _3260;
    float _3288 = fma(_3284, 0.5, 0.5);
    float _3290 = fma(_3286, -0.5, 0.5);
    float _3292 = _3272 * 0.636619746685028076171875;
    float _3294 = -_3270;
    float _3296 = fma(_3292, _3294, 1.0);
    float3 _8352 = float3(_3288, _3290, _3280);
    float _3298 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8352, float3(0.0), isnan(_8352)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8352, float3(0.0), isnan(_8352)), level(0.0)).x;
    float3 _8363 = float3(_3288, _3290, _3280);
    float4 _3301 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8363, float3(0.0), isnan(_8363)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8363, float3(0.0), isnan(_8363)), level(0.0)).xyzw;
    float _3303 = _3301.x;
    float _3305 = _3301.y;
    float _3307 = _3301.z;
    float _3309 = _3301.w;
    float2 _8380 = float2(_3296, _3282);
    float3 _3313 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8380, float2(0.0), isnan(_8380)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8380, float2(0.0), isnan(_8380)), level(0.0)).xyz;
    float _3315 = _3313.x;
    float _3317 = _3313.y;
    float _3319 = _3313.z;
    float _3321 = _3198 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3323 = _2918 > 0.0;
    bool _3325 = isnan(_2918);
    bool _3327 = _3323 || _3325;
    bool _3329 = isnan(0.0);
    bool _3331 = _3327 || _3329;
    float _3333 = fma(_3204, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3321);
    float _3335 = _3194 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _3337 = _2978 <= 0.0;
    bool _3339 = !_3331;
    bool _3341 = _3337 || _3339;
    float _3343 = _3266 + _3234;
    float _3345 = fma(_3188, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3333);
    float _3347 = _2918 * _2978;
    float _3349 = exp2(_3335);
    float _3351 = fma(_3214, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3345);
    float _3353 = _3347 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3355 = _3234 * 0.5;
    float _3357 = _3351 + _3234;
    float _3359 = _3343 * 0.5;
    out.gl_Position.x = _3266;
    out.gl_Position.y = _3278;
    out.gl_Position.z = _3351;
    out.gl_Position.w = _3234;
    float _3361 = _3357 * 0.5;
    float _3363 = -_3349;
    float _3365 = _3363 + 1.0;
    float _3367 = fma(_3278, -0.5, _3355);
    float _3369 = _3353 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3371 = _3365 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3359;
    out.m_68.y = _3367;
    out.m_68.z = _3361;
    out.m_68.w = _3234;
    float _3373 = -_3371;
    float _3375 = _3373 + 1.0;
    out.m_45.x = _3369;
    float _3377 = _3371 * _3298;
    float _3379 = _3309 * _3375;
    float _3381 = _3309 * _3377;
    float _3383 = _3319 * _3377;
    float _3385 = fma(_3315, _3381, _3303);
    float _3387 = fma(_3317, _3381, _3305);
    float _3389 = fma(_3309, _3383, _3307);
    out.m_70.x = _3385;
    out.m_70.y = _3387;
    out.m_70.z = _3389;
    out.m_70.w = _3379;
    if (!_3341)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3391 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3391;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

