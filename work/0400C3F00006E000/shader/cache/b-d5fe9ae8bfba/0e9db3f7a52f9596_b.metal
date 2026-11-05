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
    float4 m_62 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
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
    float4 m_58 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_54 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _815 = false;
    bool _699 = false;
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
        float _3572 = as_type<float>(_105);
        out.gl_Position.z = _3572;
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
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3642 = as_type<float>(_143);
        out.gl_Position.z = _3642;
    }
    if (_135)
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
        float _341 = exp2(_339);
        float _343 = _337 * 0.693147182464599609375;
        float _345 = 1.0 / _343;
        float _347 = 1.0 / _335;
        float _349 = _341 + (-1.0);
        float _351 = -_349;
        float _353 = fma(_351, _345, _123);
        float _355 = _353 * _347;
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
    float _429 = fma(_425, _161, _391);
    float _431 = fma(_425, _165, _395);
    bool _433 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _435 = fma(_387, _149, _169);
    float _437 = -_427;
    float _439 = _387 + _437;
    float _441 = fma(_385, _149, _167);
    float _443 = -_429;
    float _445 = _385 + _443;
    float _447 = -_431;
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
    bool _471 = !_433;
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
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _513 = _505 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _523;
    bool _527 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _529 = isnan(_505);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = 1.0 / _517;
    bool _541 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _543 = -_537;
    float _545 = _543 + 1.0;
    float _547 = 1.0 / _521;
    float _549 = 1.0 / _525;
    float _551 = _509 * _539;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _555 = _505 + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _557;
    float _561 = _555 * _547;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _563;
    float _567 = fma(_559, _551, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _573 = fma(_565, _551, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _575 = _513 * _549;
    bool _577 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _579 = isnan(_505);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    bool _589 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _591 = isnan(_505);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = _587 * _545;
    bool _603 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _605 = isnan(_505);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -_587;
    float _617 = _615 + 1.0;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _623 = -_599;
    float _625 = _623 + 1.0;
    float _627 = _599 * _617;
    float _629 = fma(_621, _561, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _631 = fma(_571, _561, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _633 = _613 * _625;
    float _635 = in.m_52.x;
    float _637 = in.m_52.y;
    float _639 = -_613;
    float _641 = _639 + 1.0;
    float _643 = _567 * _633;
    float _645 = _573 * _633;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _647;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _651;
    float _655 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].x, _643);
    float _657 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].y, _645);
    float _659 = fma(_649, _575, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _661 = fma(_653, _575, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _663 = fma(_629, _627, _655);
    float _665 = fma(_631, _627, _657);
    float _667 = fma(_659, _601, _663);
    float _669 = fma(_661, _601, _665);
    float _671 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[146].x, _667);
    float _673 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[146].y, _669);
    float _675 = _671 * _635;
    float _677 = _673 * _637;
    bool _679 = !_541;
    float _697;
    if (!_679)
    {
        float _681 = in.m_54.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _697 = _695;
        _699 = true;
    }
    else
    {
        float _701 = float(_89);
        float _703 = 1.0 / _701;
        float _705 = _123 * _703;
        _697 = _705;
    }
    _699 = false;
    float _707 = _697;
    bool _709 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _711 = isnan(_707);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _725 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _727 = isnan(_707);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _743 = _707 + _741;
    float _745 = -_719;
    float _747 = _745 + 1.0;
    bool _749 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _751 = 1.0 / _723;
    float _753 = _735 * _747;
    float _755 = -_735;
    float _757 = _755 + 1.0;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _761 = _739 * _751;
    float _763 = fma(_761, _743, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _767 = _763 * _753;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _771 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[115].x, _767);
    float _773 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[116].x, _771);
    float _775 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _777 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = _759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _781 = _773 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _775;
    out.m_56.y = _777;
    out.m_56.z = _779;
    out.m_56.w = _781;
    bool _783 = !_749;
    float _785 = _781;
    float _809;
    float _811;
    float _813;
    if (!_783)
    {
        float _787 = in.m_54.x;
        float _789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _791 = float(_89);
        float _793 = 1.0 / _791;
        float _795 = _787 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _797 = _123 * _793;
        float _799 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _801 = _799 * _789;
        float _803 = floor(_801);
        float _805 = -_803;
        float _807 = _801 + _805;
        _809 = _797;
        _811 = _791;
        _785 = _789;
        _813 = _807;
        _815 = true;
    }
    else
    {
        float _817 = float(_89);
        float _819 = 1.0 / _817;
        float _821 = _123 * _819;
        _809 = _821;
        _811 = _817;
        _813 = _821;
    }
    _815 = false;
    float _823 = _809;
    float _825 = _811;
    float _827 = _785;
    float _829 = _813;
    float _831 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _833 = int(_831);
    float _835 = in.m_54.x;
    float _837 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _841 = _823 + _839;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _847 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _849 = int(_847);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _863 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _837);
    float _865 = 1.0 / _825;
    float _867 = float(_833);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _877 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[5].z, _863);
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _881 = _879 != 0;
    float _883 = 1.0 / _867;
    float _885 = float(uint(_849));
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _891 = ~_849;
    int _893 = _891 + 1;
    float _895 = _877 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _897 = float(_849);
    float _899 = _675 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _901 = _849 == 0;
    float _903 = 1.0 / _885;
    bool _905 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _907 = isnan(_823);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _913 = _909 || _911;
    float _915 = float(_913);
    float _917 = _827;
    float _919 = as_type<float>(_849);
    if (!_881)
    {
        float _921 = in.m_54.y;
        _917 = _921;
    }
    float _923 = _917;
    bool _925 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _927 = isnan(_829);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _937;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _945 = _123 * _883;
    int _947 = ~_849;
    int _949 = _947 + 1;
    float _951 = 1.0 / _845;
    bool _953 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _955 = isnan(_823);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = -_915;
    float _967 = _965 + 1.0;
    bool _969 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _971 = isnan(_823);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    bool _981 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _983 = isnan(_823);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    int _993 = as_type<int>(_903) + (-2);
    float _995 = trunc(_945);
    int _997 = int(_995);
    float _999 = 1.0 / _853;
    float _1001 = _883;
    if (!_881)
    {
        _1001 = _923;
    }
    float _1003 = _1001;
    float _1005 = float(uint(_997));
    float _1007 = _1003;
    int _1009 = as_type<int>(_923);
    if (_881)
    {
        float _1011 = in.m_54.x;
        float _1013 = in.m_54.y;
        _1007 = _1011;
        _1009 = as_type<int>(_1013);
    }
    float _1015 = _1007;
    int _1017 = _1009;
    float _1019 = 1.0 / _857;
    float _1021 = as_type<float>(_993) * _1005;
    float _1023 = trunc(_1021);
    float _1025 = precise::max(_1023, 0.0);
    uint _1028 = uint(_1025);
    float _1030 = 1.0 / _861;
    bool _1032 = !_881;
    float _1034 = _1032 ? as_type<float>(_1017) : _835;
    int _1036 = _949 * int(_1028);
    int _1038 = _1036 + _997;
    float _1040 = 1.0 / _871;
    float _1042 = float(uint(_1038));
    float _1044 = 1.0 / _875;
    float _1046 = as_type<float>(_993) * _1042;
    bool _1048 = !_881;
    float _1050 = _1048 ? 1.2345600128173828125 : 1.0;
    float _1052 = float(_997);
    float _1054 = _1050 * _1034;
    float _1056 = trunc(_1046);
    float _1058 = precise::max(_1056, 0.0);
    uint _1060 = uint(_1058);
    bool _1062 = _1052 >= _897;
    bool _1064 = isnan(_1052);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan(_897);
    bool _1070 = _1066 || _1068;
    float _1072 = float(_1070);
    float _1074 = floor(_1054);
    int _1076 = int(_1028) + int(_1060);
    float _1078 = trunc(_1072);
    int _1080 = int(_1078);
    float _1082 = _123 * _897;
    int _1084 = _893 * _1076;
    int _1086 = _1084 + _997;
    float _1088 = _1082 * _865;
    int _1090 = _849 + (-1);
    float _1092 = 1.0 / _889;
    bool _1094 = uint(_1086) >= uint(_849);
    bool _1096 = !_1094;
    int _1098 = _1096 ? 0 : (-1);
    float _1100 = trunc(_1088);
    int _1102 = int(_1100);
    int _1104 = ~_1076;
    int _1106 = _1104 + _1098;
    int _1108 = _1106 + 1;
    float _1110 = -_1074;
    float _1112 = _1054 + _1110;
    int _1114 = ~_1080;
    int _1116 = _1114 + 1;
    int _1118 = _1116 + 1;
    int _1120 = _849 * _1108;
    int _1122 = _1120 + _997;
    float _1124 = _897 * _1112;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1128 = _1126 != 0;
    float _1130 = trunc(_1124);
    int _1132 = int(_1130);
    bool _1134 = !_901;
    int _1136 = _1134 ? _1122 : (-1);
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1140 = _1138 != 0;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1144 = _1142 != 0;
    int _1146 = _1118 * _1136;
    bool _1148 = !_1128;
    int _1150 = _1148 ? 0 : 1;
    int _1152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1154 = _1152 != 0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1158 = _1156 != 0;
    int _1160 = _1080 * _1090;
    int _1162 = _1160 + _1146;
    bool _1164 = !_1144;
    int _1166 = _1164 ? 0 : 1;
    bool _1168 = !_1140;
    int _1170 = _1168 ? 0 : 1;
    int _1172 = abs(_1150);
    int _1174 = abs(_1166);
    bool _1176 = !_1154;
    int _1178 = _1176 ? 0 : 1;
    int _1180 = abs(_1170);
    int _1182 = _1162 * _1174;
    bool _1184 = !_1158;
    int _1186 = _1184 ? 0 : 1;
    int _1188 = abs(_1178);
    int _1190 = _1132 * _1172;
    int _1192 = _1190 + _997;
    int _1194 = abs(_1186);
    int _1196 = _1102 * _1180;
    int _1198 = _1196 + _1182;
    int _1200 = ~_849;
    int _1202 = _1200 + 1;
    int _1204 = _1192 * _1188;
    int _1206 = _1204 + _1198;
    int _1208 = ~_849;
    int _1210 = _1208 + 1;
    float _1212 = in.m_54.z;
    int _1214 = _1132 * _1194;
    int _1216 = _1214 + _1206;
    float _1218 = float(uint(_1216));
    float _1220 = as_type<float>(_993) * _1218;
    float _1222 = trunc(_1220);
    float _1224 = precise::max(_1222, 0.0);
    uint _1226 = uint(_1224);
    int _1228 = _1210 * int(_1226);
    int _1230 = _1228 + _1216;
    float _1232 = float(uint(_1230));
    float _1234 = as_type<float>(_993) * _1232;
    float _1236 = trunc(_1234);
    float _1238 = precise::max(_1236, 0.0);
    uint _1240 = uint(_1238);
    float _1242 = _835 * 2.0;
    float _1244 = floor(_1242);
    int _1246 = int(_1226) + int(_1240);
    float _1248 = in.m_54.w;
    int _1250 = _1202 * _1246;
    int _1252 = _1250 + _1216;
    float _1254 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1256 = log2(_1254);
    bool _1258 = uint(_1252) >= uint(_849);
    bool _1260 = !_1258;
    int _1262 = _1260 ? 0 : (-1);
    bool _1264 = _1244 >= 0.0;
    bool _1266 = isnan(_1244);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan(0.0);
    bool _1272 = _1268 || _1270;
    int _1274 = ~_1246;
    int _1276 = _1274 + _1262;
    int _1278 = _1276 + 1;
    int _1280 = _1272 ? 0 : 1;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1284 = _1282 != 0;
    int _1286 = _849 * _1278;
    int _1288 = _1286 + _1216;
    float _1290 = _123 * _1256;
    bool _1292 = _1248 > 0.5;
    bool _1294 = !_901;
    int _1296 = _1294 ? _1288 : (-1);
    float _1298 = -_225;
    int _1300 = _1292 ? as_type<int>(_1298) : as_type<int>(_225);
    float _1302 = exp2(_1290);
    int _1304 = _1296 & 3;
    bool _1306 = _1304 != 0;
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1310 = _1308 != 0;
    bool _1312 = uint(_1304) > 1u;
    int _1314 = _1306 ? 0 : 1;
    bool _1316 = _1212 > 0.5;
    int _1318 = ~_1314;
    int _1320 = _1318 + 1;
    int _1322 = _1320 + 1;
    float _1324 = -_221;
    int _1326 = _1316 ? as_type<int>(_1324) : as_type<int>(_221);
    bool _1328 = _1244 > 0.0;
    float _1330 = -_1302;
    float _1332 = _1330 + 1.0;
    int _1334 = ~_1280;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    int _1340 = _1322;
    int _1342 = _1338;
    if (!_1312)
    {
        int _1344 = ~_1314;
        int _1346 = _1344 + 1;
        _1340 = _1346;
    }
    int _1348 = _1340;
    bool _1350 = _835 > 0.5;
    bool _1352 = !_1310;
    float _1354 = _1352 ? _221 : as_type<float>(_1326);
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1358 = _1356 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1370 = _1368 != 0;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1374 = _1372 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1376 = !_1284;
    float _1378 = _1376 ? _225 : as_type<float>(_1300);
    float _1380 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (!_1328)
    {
        int _1382 = ~_1280;
        int _1384 = _1382 + 1;
        _1342 = _1384;
    }
    int _1386 = _1342;
    float _1388 = 1.0 / _1358;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1392 = _1390 != 0;
    float _1394 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1398 = _1396 != 0;
    float _1400 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1380);
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1404 = _1402 != 0;
    float _1406 = _1212 * 2.0;
    float _1408 = 1.0 / _1374;
    float _1410 = -_221;
    int _1412 = _1350 ? as_type<int>(_1410) : as_type<int>(_221);
    float _1414 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1394);
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1418 = _1416 != 0;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1420;
    float _1424 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1400);
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1428 = _829 + _1426;
    float _1430 = floor(_1406);
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1434 = _829 + _1432;
    float _1436 = _1422 * _951;
    float _1438 = _1428 * _999;
    float _1440 = _1434 * _1019;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1442;
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1448 = _1446 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1456 = _1454 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1458 = _1444 * _1030;
    float _1460 = _1448 * _1388;
    float _1462 = 0.0;
    if (!_1418)
    {
        _1462 = _1212;
    }
    float _1464 = _1462;
    float _1466 = _1452 * _1408;
    float _1468 = 0.0;
    float _1470 = _1464;
    if (!_1418)
    {
        _1468 = _1212;
    }
    float _1472 = _1468;
    float _1474 = _1456 * _1040;
    float _1476 = _1472;
    if (_1418)
    {
        _1470 = as_type<float>(_1017);
    }
    float _1478 = _1470;
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    if (_1418)
    {
        _1476 = as_type<float>(_1017);
    }
    float _1484 = _1476;
    float _1486 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1414);
    float _1488 = _1482 * _1044;
    bool _1490 = _1430 >= 0.0;
    bool _1492 = isnan(_1430);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan(0.0);
    bool _1498 = _1494 || _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1502 = _823 + _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1504;
    int _1508 = _1498 ? 0 : 1;
    float _1510 = fma(_1436, _1502, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1512 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1514 = isnan(0.0);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1520 = _1516 || _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1522;
    float _1526 = fma(_1506, _1438, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1528 = _1520 ? _1332 : 0.0;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1532 = _823 + _1530;
    bool _1534 = _1430 > 0.0;
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1542 = _1540 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1544 = fma(_1458, _1532, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1546 = _1524 * _1092;
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1550 = _823 + _1548;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1552;
    float _1556 = fma(_1538, _1440, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1558 = fma(_943, _1440, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1560 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1562 = isnan(_823);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1568 = _1564 || _1566;
    float _1570 = float(_1568);
    float _1572 = fma(_1542, _1440, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1574 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1576 = isnan(_823);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1582 = _1578 || _1580;
    float _1584 = float(_1582);
    float _1586 = fma(_939, _1438, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1590 = _823 + _1588;
    float _1592 = fma(_1466, _1550, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1594 = fma(_1554, _1438, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1596 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1598 = isnan(_823);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1604 = _1600 || _1602;
    float _1606 = float(_1604);
    float _1608 = -_1570;
    float _1610 = _1608 + 1.0;
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1614 = _823 + _1612;
    float _1616 = fma(_1460, _1590, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1618 = -_1584;
    float _1620 = _1618 + 1.0;
    bool _1622 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1624 = isnan(_823);
    bool _1626 = _1622 || _1624;
    bool _1628 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1630 = _1626 || _1628;
    float _1632 = float(_1630);
    float _1634 = _1584 * _1610;
    float _1636 = -_1606;
    float _1638 = _1636 + 1.0;
    float _1640 = fma(_1474, _1614, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1642 = _1606 * _1620;
    bool _1644 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1646 = isnan(_829);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = fma(_1488, _841, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1658 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1660 = isnan(_829);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1666 = _1662 || _1664;
    float _1668 = float(_1666);
    float _1670 = _1632 * _1638;
    float _1672 = -_1632;
    float _1674 = _1672 + 1.0;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1678 = 1.0 + _1676;
    float _1680 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1682 = -_1668;
    float _1684 = _1682 + 1.0;
    float _1686 = _915 * _1674;
    float _1688 = _963 * _967;
    float _1690 = -_963;
    float _1692 = _1690 + 1.0;
    float _1694 = 1.0 / _1678;
    float _1696 = _935 * _1684;
    float _1698 = -_935;
    float _1700 = _1698 + 1.0;
    float _1702 = _979 * _1692;
    float _1704 = -_979;
    float _1706 = _1704 + 1.0;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1710 = _823 + _1708;
    float _1712 = _1654 * _1700;
    float _1714 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1716 = _991 * _1706;
    float _1718 = fma(_1546, _1710, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1720 = _1526 * _1712;
    float _1722 = _1586 * _1712;
    float _1724 = _1594 * _1712;
    float _1726 = _1510 * _1716;
    float _1728 = -_1654;
    float _1730 = _1728 + 1.0;
    float _1732 = _1528 * _1694;
    float _1734 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1720);
    float _1736 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1722);
    float _1738 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1724);
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1742 = -_991;
    float _1744 = _1742 + 1.0;
    float _1746 = fma(_1558, _1696, _1736);
    float _1748 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1740);
    int _1750 = ~_1508;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1726);
    int _1758 = _1754;
    if (!_1534)
    {
        int _1760 = ~_1508;
        int _1762 = _1760 + 1;
        _1758 = _1762;
    }
    int _1764 = _1758;
    float _1766 = fma(_1556, _1696, _1734);
    float _1768 = fma(_1572, _1696, _1738);
    float _1770 = as_type<float>(_1017) * 2.0;
    float _1772 = fma(_1640, _1702, _1756);
    float _1774 = _835 + as_type<float>(_1017);
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1780 = floor(_1770);
    float _1782 = _1774 + (-1.0);
    float _1784 = fma(_1714, -2.0, _1778);
    float _1786 = float(uint(_1192));
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1790 = -_1776;
    float _1792 = fma(_1680, 2.0, _1790);
    float _1794 = _1212 + as_type<float>(_1017);
    float _1796 = fma(_1544, _1688, _1772);
    float _1798 = fma(_1782, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1800 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1788);
    float _1802 = _1354 + 0.5;
    float _1804 = -_123;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1792);
    float _1808 = as_type<float>(_993) * _1786;
    bool _1810 = !_1398;
    float _1812 = _1810 ? _221 : as_type<float>(_1412);
    float _1814 = _1794 + (-1.0);
    bool _1816 = as_type<float>(_1017) > 0.5;
    float _1818 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1768);
    bool _1820 = !_1362;
    int _1822 = _1820 ? 0 : 1;
    float _1824 = fma(_1802, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1806);
    float _1826 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1828 = _1424 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1830 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1832 = _895 + _1830;
    float _1834 = -_225;
    int _1836 = _1816 ? as_type<int>(_1834) : as_type<int>(_225);
    float _1838 = trunc(_1808);
    float _1840 = precise::max(_1838, 0.0);
    uint _1842 = uint(_1840);
    bool _1844 = _1780 > 0.0;
    float _1846 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1746);
    bool _1848 = _1780 >= 0.0;
    bool _1850 = isnan(_1780);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan(0.0);
    bool _1856 = _1852 || _1854;
    float _1858 = _1486 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1860 = !_1366;
    int _1862 = _1860 ? 0 : 1;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1866 = _1828 + _1864;
    int _1868 = abs(_1822);
    float _1870 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1872 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1766);
    int _1874 = abs(_1862);
    float _1876 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1878 = _1858 + _1876;
    int _1880 = ~_849;
    int _1882 = _1880 + 1;
    float _1884 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1870);
    float _1886 = float(_1874);
    float _1888 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1784);
    float _1890 = float(_1386);
    float _1892 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1884);
    float _1894 = float(_1764);
    float _1896 = fma(_1616, _1686, _1796);
    float _1898 = in.m_58.x;
    float _1900 = in.m_58.y;
    float _1902 = in.m_58.z;
    float _1904 = _1886 * _1890;
    int _1906 = _1856 ? 0 : 1;
    float _1908 = _1812 + 0.5;
    int _1910 = _1882 * int(_1842);
    int _1912 = _1910 + _1192;
    bool _1914 = _1892 >= 0.0;
    float _1916 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1748);
    int _1918 = _1296 >> 31;
    float _1920 = _1908 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1922 = float(uint(_1912));
    float _1924 = -_1916;
    float _1926 = _1924 + 1.0;
    int _1928 = _1918 & 3;
    float _1930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1932 = float(_1868);
    float _1934 = as_type<float>(_993) * _1922;
    int _1936 = _1296 + _1928;
    float _1938 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1800);
    float _1940 = -_1926;
    float _1942 = fma(_1354, _1940, _1824);
    float _1944 = _1932 * _1894;
    float _1946 = _1378 + (-0.5);
    int _1948 = _1936 >> 2;
    float _1950 = trunc(_1934);
    float _1952 = precise::max(_1950, 0.0);
    uint _1954 = uint(_1952);
    float _1956 = _1944 * (-2.0);
    float _1958 = -_1946;
    float _1960 = -_1888;
    float _1962 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1960);
    int _1964 = ~_1906;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    float _1970 = -_1938;
    float _1972 = _1970 + 1.0;
    int _1974 = _1948 << 4;
    int _1976 = _1974 + 512;
    float _1978 = fma(_1798, _1956, _1798);
    int _1980 = _1968;
    if (!_1844)
    {
        int _1982 = ~_1906;
        int _1984 = _1982 + 1;
        _1980 = _1984;
    }
    int _1986 = _1980;
    float _1988 = fma(_1956, _1898, _1898);
    float _1990 = _1904 * (-2.0);
    float _1992 = _1920 * _1930;
    uint _1994 = uint(int(uint(_1976) >> uint(2)));
    uint _1996 = uint(int(uint(int(_1994)) >> uint(2)));
    int _1998 = int(_1994) & 3;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[int(_1996)][_1998];
    int _2002 = int(_1994) + 1;
    uint _2004 = uint(int(uint(_2002) >> uint(2)));
    int _2006 = _2002 & 3;
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[int(_2004)][_2006];
    float _2010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2012 = fma(_1826, _1990, _1826);
    float _2014 = fma(_1990, _1900, _1900);
    float _2016 = fma(_1592, _1670, _1896);
    int _2018 = int(_1842) + int(_1954);
    float _2020 = fma(_1378, _1972, _1962);
    bool _2022 = !_1404;
    float _2024 = _2022 ? _225 : as_type<float>(_1836);
    int _2026 = _1976 + 8;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
    int _2032 = int(_2028) & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    int _2036 = int(_2028) + 1;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    int _2040 = _2036 & 3;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[int(_2038)][_2040];
    bool _2044 = uint(_1304) >= 2u;
    float _2046 = _1818 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2048 = ~_849;
    int _2050 = _2048 + 1;
    float _2052 = -_2024;
    float _2054 = _2052 + 0.5;
    int _2056 = _2044 ? 0 : 1;
    float _2058 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2060 = _1304 != 3;
    float _2062 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2064 = ~_2056;
    int _2066 = _2064 + 1;
    int _2068 = _2066 + 1;
    float _2070 = _1872 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2072 = _2062 * _2010;
    int _2074 = _2050 * _2018;
    int _2076 = _2074 + _1192;
    float _2078 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2080 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2084 = _2046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2086 = abs(_1348);
    float _2088 = fma(_1656, _1642, _2016);
    int _2090 = _2068;
    if (_2060)
    {
        int _2092 = ~_2056;
        int _2094 = _2092 + 1;
        _2090 = _2094;
    }
    int _2096 = _2090;
    out.m_60.x = _1992;
    out.m_60.y = _2072;
    out.m_60.z = _1942;
    out.m_60.w = _2020;
    int _2098 = _1296 & 3;
    bool _2100 = _2098 != 0;
    float _2102 = fma(_1718, _1634, _2088);
    int _2104 = abs(_2096);
    out.m_62.x = _2078;
    out.m_62.y = _2080;
    out.m_62.z = _2084;
    out.m_62.w = _2082;
    bool _2106 = !_2100;
    int _2108 = _2106 ? 0 : 1;
    float _2110 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2102);
    bool _2112 = uint(_2076) >= uint(_849);
    if (_1914)
    {
        out.m_45.x = 0.0;
    }
    int _2114 = abs(_2108);
    float _2116 = as_type<float>(_1017) + (-0.5);
    bool _2118 = !_2112;
    int _2120 = _2118 ? 0 : (-1);
    out.m_64.x = _2110;
    bool _2122 = _1304 != 3;
    float _2124 = _835 + (-0.5);
    int _2126 = ~_2018;
    int _2128 = _2126 + _2120;
    int _2130 = _2128 + 1;
    float _2132 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1988);
    int _2134 = ~_2086;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    bool _2140 = !_2122;
    int _2142 = _2140 ? 0 : (-1);
    int _2144 = _849 * _2130;
    int _2146 = _2144 + _1192;
    int _2148 = ~_2114;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    int _2154 = _2138 * as_type<int>(_2008);
    bool _2156 = !_1392;
    int _2158 = _2156 ? 0 : 1;
    int _2160 = abs(_2142);
    int _2162 = _2152 * as_type<int>(_2000);
    int _2164 = _2162 + _2154;
    int _2166 = abs(_2158);
    float _2168 = _1832 * _1832;
    int _2170 = ~_2104;
    int _2172 = _2170 + 1;
    int _2174 = _2172 + 1;
    int _2176 = ~_2160;
    int _2178 = _2176 + 1;
    int _2180 = _2178 + 1;
    float _2182 = fma(_1866, _1866, _2168);
    bool _2184 = _849 == 0;
    int _2186 = _2174 * as_type<int>(_2034);
    int _2188 = _2186 + _2164;
    int _2190 = ~_2166;
    int _2192 = _2190 + 1;
    int _2194 = _2192 + 1;
    float _2196 = fma(_1878, _1878, _2182);
    float _2198 = as_type<float>(_2164);
    if (_1914)
    {
        _2198 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2200 = _2198;
    int _2202 = _2180 * as_type<int>(_2042);
    int _2204 = _2202 + _2188;
    bool _2206 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2208 = isnan(1.0);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2214 = _2210 || _2212;
    float _2216 = rsqrt(_2196);
    int _2218 = _2194 * _2204;
    bool _2220 = !_2184;
    int _2222 = _2220 ? _2146 : (-1);
    int _2224 = as_type<int>(_2200);
    if (_1914)
    {
        float _2226 = _2200 * 5.0;
        _2224 = as_type<int>(_2226);
    }
    int _2228 = _2224;
    bool _2230 = !_2214;
    float _2232 = _2230 ? _123 : _1732;
    int _2234 = _2222 * _2166;
    int _2236 = _2234 + _2218;
    float _2238 = _899 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2240 = !_1370;
    int _2242 = _2240 ? 0 : 1;
    if (_1914)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6840 = as_type<float>(_2228);
        out.gl_Position.z = _6840;
    }
    float _2244 = fma(_2232, _1978, _2132);
    float _2246 = float(_2236);
    float _2248 = _2238 * _2216;
    out.m_66.y = _2246;
    float _2250 = _1866 * _2248;
    float _2252 = _1832 * _2248;
    int _2254 = abs(_2242);
    if (_1914)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2256 = -_2252;
    float _2258 = _895 + _2256;
    float _2260 = _1878 * _2248;
    float _2262 = -_2250;
    float _2264 = _1828 + _2262;
    float _2266 = -_2252;
    float _2268 = _1832 + _2266;
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2272 = _2258 + _2270;
    float _2274 = -_2260;
    float _2276 = _1858 + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2280 = _2264 + _2278;
    float _2282 = float(_2254);
    float _2284 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2286 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2288 = _2276 + _2286;
    float _2290 = float(_1986);
    float _2292 = -_2250;
    float _2294 = _1866 + _2292;
    float _2296 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2284);
    float _2298 = _2268 * _2268;
    float _2300 = fma(_2116, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2014);
    float _2302 = -_2260;
    float _2304 = _1878 + _2302;
    float _2306 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2296);
    float _2308 = fma(_2294, _2294, _2298);
    float _2310 = _2282 * _2290;
    float _2312 = _835 + _1212;
    float _2314 = fma(_2232, _2012, _2300);
    bool _2316 = _2306 >= 0.0;
    float _2318 = fma(_2304, _2304, _2308);
    float _2320 = _2312 + (-1.0);
    float _2322 = _2310 * (-2.0);
    float _2324 = _2244 * 0.15915493667125701904296875;
    float _2326 = _2314 * 0.15915493667125701904296875;
    float _2328 = fma(_2320, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2330 = fma(_2322, _1902, _1902);
    float _2332 = _1212 + (-0.5);
    float _2334 = _2324 * 6.283185482025146484375;
    float _2336 = sin(_2334);
    float _2338 = fma(_2328, _2322, _2328);
    int _2340 = as_type<int>(_2330);
    float _2342 = _2280;
    float _2344 = _2276;
    if (_2316)
    {
        _919 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2346 = _919;
    float _2348 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2330);
    if (_2316)
    {
        out.m_45.x = 0.0;
    }
    float _2350 = _2324 * 6.283185482025146484375;
    float _2352 = cos(_2350);
    if (_2316)
    {
        float _2354 = _2346 * 5.0;
        _2340 = as_type<int>(_2354);
    }
    int _2356 = _2340;
    float _2358 = fma(_2232, _2338, _2348);
    if (_2316)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7032 = as_type<float>(_2356);
        out.gl_Position.z = _7032;
    }
    float _2360 = _2358 * 0.15915493667125701904296875;
    float _2362 = _2326 * 6.283185482025146484375;
    float _2364 = sin(_2362);
    float _2366 = sqrt(_2318);
    float _2368 = _2326 * 6.283185482025146484375;
    float _2370 = cos(_2368);
    if (_2316)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2372 = _2360 * 6.283185482025146484375;
    float _2374 = cos(_2372);
    float _2376 = _2216 * _2366;
    float _2378 = _677 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2380 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2382 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2384 = _899 * _2376;
    float _2386 = _2376 * _2378;
    float _2388 = _2352 * _2370;
    float _2390 = _2360 * 6.283185482025146484375;
    float _2392 = sin(_2390);
    float _2394 = _2382 * _2384;
    float _2396 = _2380 * _2386;
    float _2398 = _2336 * _2364;
    float _2400 = _2352 * _2364;
    float _2402 = _2336 * _2370;
    float _2404 = _2376 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2406 = _2404 * 0.5;
    float _2408 = _2374 * _2396;
    float _2410 = _2364 * _2374;
    float _2412 = _2370 * _2374;
    float _2414 = _2352 * _2408;
    float _2416 = _2336 * _2408;
    float _2418 = fma(_2392, _2388, _2398);
    float _2420 = -_2396;
    float _2422 = _2392 * _2420;
    float _2424 = fma(_2392, _2398, _2388);
    float _2426 = fma(_2418, _2394, _2414);
    float _2428 = -_2402;
    float _2430 = fma(_2392, _2400, _2428);
    float _2432 = fma(_2412, _2394, _2422);
    float _2434 = -_2400;
    float _2436 = fma(_2392, _2402, _2434);
    float _2438 = fma(_2430, _2406, _2426);
    float _2440 = fma(_2410, _2406, _2432);
    float _2442 = fma(_2436, _2394, _2416);
    float _2444 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2446 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2448 = fma(_2424, _2406, _2442);
    float _2450 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2444);
    float _2452 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2446);
    float _2454 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2450);
    float _2456 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2452);
    float _2458 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2460 = _2456 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2462 = _1858 + _2458;
    float _2464 = _1828 + _2460;
    float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2468 = _2462 + _2466;
    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2472 = _2464 + _2470;
    float _2474 = _2468 * _2468;
    float _2476 = fma(_2472, _2472, _2474);
    float _2478 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2480 = sqrt(_2476);
    float _2482 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2478);
    float _2484 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2482);
    float _2486 = _2484 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2488 = _895 + _2486;
    bool _2490 = _2480 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2492 = _2478;
    float _2494 = _2448;
    float _2496 = _2464;
    float _2498 = _2408;
    float _2500 = _2426;
    if (!_2490)
    {
        _2492 = _2464;
    }
    float _2502 = _2492;
    float _2504 = _2502;
    if (!_2490)
    {
        _2494 = _2462;
    }
    float _2506 = _2494;
    float _2508 = _2506;
    if (!_2490)
    {
        _2496 = _2488;
    }
    float _2510 = _2496;
    bool _2512 = !_2490;
    float _2514 = _2510;
    if (!_2512)
    {
        float _2516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2520 = _2480 + _2518;
        float _2522 = rsqrt(_2476);
        float _2524 = _2520 * _2516;
        float _2526 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2528 = _2524 * 0.15915493667125701904296875;
        float _2530 = _2528 * 6.283185482025146484375;
        float _2532 = cos(_2530);
        float _2534 = _2528 * 6.283185482025146484375;
        float _2536 = sin(_2534);
        float _2538 = _2532 + (-1.0);
        float _2540 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2542 = fma(_2536, _2526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2544 = fma(_2488, _2532, _2540);
        float _2546 = _2522 * _2542;
        float _2548 = fma(_2472, _2546, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2550 = fma(_2468, _2546, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2514 = _2544;
        _2504 = _2548;
        _2508 = _2550;
    }
    float _2552 = _2514;
    float _2554 = _2504;
    float _2556 = _2508;
    float _2558 = -_895;
    float _2560 = _2558 + _2552;
    float _2562 = -_1828;
    float _2564 = _2562 + _2554;
    float _2566 = -_1858;
    float _2568 = _2566 + _2556;
    float _2570 = _2560 * _2560;
    float _2572 = fma(_2564, _2564, _2570);
    float _2574 = fma(_2568, _2568, _2572);
    float _2576 = sqrt(_2574);
    bool _2578 = _2576 > 0.0;
    float _2580 = _2572;
    float _2582 = _2576;
    float _2584 = _2556;
    if (!_2578)
    {
        _2580 = _2554;
    }
    float _2586 = _2580;
    float _2588 = _2586;
    float _2590 = _2586;
    if (!_2578)
    {
        _2582 = _2552;
    }
    float _2592 = _2582;
    bool _2594 = !_2578;
    float _2596 = _2592;
    float _2598 = _2592;
    if (!_2594)
    {
        bool _2600 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2602 = _2468;
        if (_2600)
        {
            float _2604 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2602 = _2604;
        }
        float _2606 = _2602;
        float _2608 = _2606;
        if (_2600)
        {
            float _2610 = _465 * _2606;
            _2498 = _2610;
        }
        float _2612 = _2498;
        float _2614 = _2612;
        if (_2600)
        {
            float _2616 = _467 * _2606;
            _2500 = _2616;
        }
        float _2618 = _2500;
        float _2620 = _2618;
        if (_2600)
        {
            float _2622 = _469 * _2606;
            _2608 = _2622;
        }
        float _2624 = _2608;
        float _2626 = _2624;
        if (!_2600)
        {
            bool _2628 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2632 = _2628 || _2630;
            bool _2634 = isnan(1.0);
            bool _2636 = _2632 || _2634;
            float _2638 = _123 + 1.0;
            if (!_2636)
            {
                float _2640 = _2638 * _2638;
                float _2642 = _2640 * 0.5;
                _125 = _2642;
            }
            float _2644 = _125;
            float _2646 = _2644;
            if (!_2636)
            {
                float _2648 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2646 = _2648;
            }
            float _2650 = _2646;
            bool _2652 = !_2636;
            float _2654 = _2650;
            if (!_2652)
            {
                float _2656 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2658 = log2(_2656);
                float _2660 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2662 = 1.0 + _2660;
                float _2664 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2666 = _2658 * _2638;
                float _2668 = 1.0 / _2662;
                float _2670 = _2664 * 0.693147182464599609375;
                float _2672 = exp2(_2666);
                float _2674 = 1.0 / _2670;
                float _2676 = _2672 + (-1.0);
                float _2678 = -_2676;
                float _2680 = fma(_2678, _2674, _2638);
                float _2682 = _2680 * _2668;
                float _2684 = _2682 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2654 = _2684;
            }
            float _2686 = _2654;
            float _2688 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2690 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2692 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2694 = _2686;
            if (!_2636)
            {
                _2694 = _2638;
            }
            float _2696 = _2694;
            float _2698 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2700 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2702 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2704 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2698);
            float _2706 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2700);
            float _2708 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2704);
            bool _2710 = !_2636;
            float _2712 = _2696;
            _2588 = _2706;
            if (!_2710)
            {
                float _2714 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2716 = log2(_2714);
                float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2720 = 1.0 + _2718;
                float _2722 = 1.0 / _2720;
                float _2724 = _2716 * _2638;
                float _2726 = exp2(_2724);
                float _2728 = -_2726;
                float _2730 = _2728 + 1.0;
                float _2732 = _2730 * _2722;
                _2712 = _2732;
            }
            float _2734 = _2712;
            float _2736 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2702);
            float _2738 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2706);
            float _2740 = fma(_2734, _163, _2708);
            float _2742 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2736);
            float _2744 = fma(_2734, _161, _2738);
            float _2746 = -_427;
            float _2748 = _2746 + _2740;
            float _2750 = fma(_2734, _165, _2742);
            float _2752 = -_429;
            float _2754 = _2752 + _2744;
            float _2756 = _2748 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2758 = _2748 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2760 = _2748 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2762 = -_431;
            float _2764 = _2762 + _2750;
            float _2766 = fma(_2754, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2756);
            float _2768 = fma(_2754, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2758);
            float _2770 = fma(_2754, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2760);
            float _2772 = fma(_2764, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2766);
            float _2774 = fma(_2764, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2768);
            float _2776 = fma(_2764, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2770);
            _473 = _2774;
            _475 = _2772;
            _477 = _2776;
            _2614 = _2772;
            _2620 = _2774;
            _2626 = _2776;
            _2596 = _2742;
        }
        float _2778 = _473;
        float _2780 = _475;
        float _2782 = _477;
        float _2784 = _2614;
        float _2786 = _2620;
        float _2788 = _2626;
        float _2790 = _2596;
        float _2792 = _2588;
        float _2794 = _2778 * _2778;
        float _2796 = rsqrt(_2574);
        float _2798 = fma(_2780, _2780, _2794);
        float _2800 = fma(_2782, _2782, _2798);
        float _2802 = sqrt(_2800);
        float _2804 = _2564 * _2796;
        float _2806 = _2560 * _2796;
        float _2808 = _2568 * _2796;
        bool _2810 = _2802 > 0.0;
        float _2812 = _2792;
        float _2814 = _2790;
        if (!_2810)
        {
            _2812 = _2554;
        }
        float _2816 = _2812;
        _2590 = _2816;
        if (!_2810)
        {
            _2814 = _2552;
        }
        float _2818 = _2814;
        bool _2820 = !_2810;
        _2598 = _2818;
        if (!_2820)
        {
            float _2822 = rsqrt(_2800);
            float _2824 = _2822 * _2778;
            float _2826 = _2822 * _2780;
            float _2828 = _2822 * _2782;
            float _2830 = _2806 * _2824;
            float _2832 = fma(_2804, _2826, _2830);
            float _2834 = fma(_2808, _2828, _2832);
            float _2836 = _2834 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2838 = fma(_2784, _2836, _2554);
            float _2840 = fma(_2786, _2836, _2552);
            float _2842 = fma(_2788, _2836, _2556);
            _2598 = _2840;
            _2584 = _2842;
            _2590 = _2838;
        }
    }
    float _2844 = _2598;
    float _2846 = _2584;
    float _2848 = _2590;
    float _2850 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2852 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2854 = isnan(0.5);
    bool _2856 = _2852 || _2854;
    bool _2858 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2860 = _2856 || _2858;
    float _2862 = -_2252;
    float _2864 = _2862 + _2844;
    bool _2866 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2868 = isnan(0.5);
    bool _2870 = _2866 || _2868;
    bool _2872 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2874 = _2870 || _2872;
    float _2876 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2850);
    float _2878 = -_2260;
    float _2880 = _2878 + _2846;
    float _2882 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2876);
    float _2884 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2886 = _2882 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2888 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2884);
    float _2890 = 1.0 / _2886;
    float _2892 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2888);
    float _2894 = _2892 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2896 = _2894 + _2886;
    float _2898 = _2896 * _2890;
    float _2900 = _2898 * 0.5;
    float _2902 = -_2250;
    float _2904 = _2902 + _2848;
    float _2906 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2908 = fma(_2900, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2906);
    float _2910 = _2900;
    float _2912 = _2864;
    float _2914 = _2904;
    float _2916 = _2880;
    float _2918 = _2886;
    if (_2874)
    {
        _2910 = 1.0;
    }
    float _2920 = _2910;
    float _2922 = 1.0 / _2908;
    float _2924 = _2920;
    if (!_2860)
    {
        float _2926 = _2272 * _2272;
        float _2928 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2930 = -_1858;
        float _2932 = _2930 + _2846;
        float _2934 = -_1828;
        float _2936 = _2934 + _2848;
        float _2938 = fma(_2280, _2280, _2926);
        float _2940 = -_895;
        float _2942 = _2940 + _2844;
        float _2944 = fma(_2288, _2288, _2938);
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2948 = sqrt(_2944);
        float _2950 = _2928 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2952 = 1.0 / _2376;
        float _2954 = precise::min(_2948, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2956 = _2954 * _2946;
        float _2958 = _2956 * _2952;
        float _2960 = _2950 * _2958;
        float _2962 = _2932 * _2958;
        float _2964 = fma(_2936, _2960, _2264);
        float _2966 = fma(_2942, _2960, _2258);
        float _2968 = fma(_2950, _2962, _2276);
        _2912 = _2966;
        _2914 = _2964;
        _2916 = _2968;
        _2342 = _2948;
        _2918 = _2958;
    }
    float _2970 = _2912;
    float _2972 = _2914;
    float _2974 = _2916;
    float _2976 = _2342;
    float _2978 = _2918;
    float _2980 = _2978;
    float _2982 = _2976;
    if (_2874)
    {
        _2980 = 1.0;
    }
    float _2984 = _2980;
    float _2986 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2988 = _2922 * _2986;
    float _2990 = _2984;
    if (!_2874)
    {
        float _2992 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2994 = _2992 * 0.15915493667125701904296875;
        float _2996 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2998 = _2994 * 6.283185482025146484375;
        float _3000 = cos(_2998);
        float _3002 = _2996 * 0.15915493667125701904296875;
        float _3004 = _2994 * 6.283185482025146484375;
        float _3006 = sin(_3004);
        float _3008 = 1.0 / _3000;
        float _3010 = _3002 * 6.283185482025146484375;
        float _3012 = cos(_3010);
        float _3014 = _3006 * _3008;
        float _3016 = _3002 * 6.283185482025146484375;
        float _3018 = sin(_3016);
        float _3020 = _3012 * _3014;
        float _3022 = 1.0 / _3020;
        float _3024 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3026 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3024;
        float _3028 = 1.0 / _3026;
        float _3030 = _3018 * _3022;
        float _3032 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3034 = fma(_2988, _3030, _3032);
        float _3036 = _3034 * _3028;
        float _3038 = precise::clamp(_3036, 0.0, 1.0);
        _2344 = _3028;
        _2924 = _3038;
    }
    float _3040 = _2344;
    float _3042 = _2924;
    float _3044 = _3040;
    if (!_2874)
    {
        float _3046 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3048 = _3046 * 0.15915493667125701904296875;
        float _3050 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3052 = _3048 * 6.283185482025146484375;
        float _3054 = cos(_3052);
        float _3056 = _3050 * 0.15915493667125701904296875;
        float _3058 = _3048 * 6.283185482025146484375;
        float _3060 = sin(_3058);
        float _3062 = 1.0 / _3054;
        float _3064 = _3056 * 6.283185482025146484375;
        float _3066 = cos(_3064);
        float _3068 = _3060 * _3062;
        float _3070 = _3056 * 6.283185482025146484375;
        float _3072 = sin(_3070);
        float _3074 = _3066 * _3068;
        float _3076 = 1.0 / _3074;
        float _3078 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3080 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3078;
        float _3082 = 1.0 / _3080;
        float _3084 = _3072 * _3076;
        float _3086 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3088 = fma(_2988, _3084, _3086);
        float _3090 = _3088 * _3082;
        float _3092 = precise::clamp(_3090, 0.0, 1.0);
        float _3094 = -_3092;
        float _3096 = _3094 + 1.0;
        _2982 = _3084;
        _3044 = _3062;
        _2990 = _3096;
    }
    float _3098 = _2982;
    float _3100 = _3044;
    float _3102 = _2990;
    float _3104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3106 = _2970 + _3104;
    float _3108 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3110 = _2972 + _3108;
    float _3112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3114 = _2974 + _3112;
    float _3116 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3118 = _3106 * _3106;
    float _3120 = fma(_3110, _3110, _3118);
    float _3122 = fma(_3114, _3114, _3120);
    float _3124 = rsqrt(_3122);
    float _3126 = sqrt(_3122);
    float _3128 = _3124 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3130 = _3110 * _3128;
    float _3132 = _3114 * _3128;
    float _3134 = _3130 * _3130;
    float _3136 = _3132 * _3132;
    float _3138 = _3134 + _3136;
    float _3140 = sqrt(_3138);
    bool _3142 = _3140 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3146 = _3140 + _3144;
    float _3148 = _3124;
    float _3150 = _3100;
    float _3152 = _3146;
    float _3154 = _3098;
    float _3156 = _3106;
    float _3158 = _3128;
    if (_3142)
    {
        float _3160 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3148 = _3160;
    }
    float _3162 = _3148;
    if (_3142)
    {
        float _3164 = rsqrt(_3138);
        _3150 = _3164;
    }
    float _3166 = _3150;
    float _3168 = _3166;
    if (_3142)
    {
        float _3170 = _3146 * _3162;
        _3152 = _3170;
    }
    float _3172 = _3152;
    if (_3142)
    {
        float _3174 = _3172 * 0.15915493667125701904296875;
        _3154 = _3174;
    }
    float _3176 = _3154;
    float _3178 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3180 = fma(_3126, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3178);
    float _3182 = precise::clamp(_3180, 0.0, 1.0);
    float _3184 = _3162;
    float _3186 = _3176;
    if (_3142)
    {
        float _3188 = _3176 * 6.283185482025146484375;
        float _3190 = sin(_3188);
        _3184 = _3190;
    }
    float _3192 = _3184;
    float _3194 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3196 = precise::max(0.0, _3194);
    float _3198 = _3114;
    float _3200 = _3196;
    if (_3142)
    {
        float _3202 = _3176 * 6.283185482025146484375;
        float _3204 = cos(_3202);
        _3198 = _3204;
    }
    float _3206 = _3198;
    float _3208 = -_3128;
    float _3210 = -_3196;
    float _3212 = fma(_3106, _3208, _3210);
    if (!_3142)
    {
        _3156 = _3132;
    }
    float _3214 = _3156;
    float _3216 = _3214;
    if (_3142)
    {
        float _3218 = _3212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3200 = _3218;
    }
    float _3220 = _3200;
    float _3222 = _3192;
    float _3224 = _3220;
    if (_3142)
    {
        float _3226 = fma(_3192, _3220, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3222 = _3226;
    }
    float _3228 = _3222;
    float _3230 = _3228;
    float _3232 = _3206;
    if (_3142)
    {
        float _3234 = _3206 + (-1.0);
        _3224 = _3234;
    }
    float _3236 = _3224;
    float _3238 = _3236;
    if (_3142)
    {
        float _3240 = _3166 * _3228;
        _3158 = _3240;
    }
    float _3242 = _3158;
    if (!_3142)
    {
        _3168 = _3130;
    }
    float _3244 = _3168;
    float _3246 = _3244;
    if (_3142)
    {
        float _3248 = _3236 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3186 = _3248;
    }
    float _3250 = _3186;
    if (_3142)
    {
        float _3252 = _3130 * _3242;
        _3246 = _3252;
    }
    float _3254 = _3246;
    if (!_3142)
    {
        _3230 = _3212;
    }
    float _3256 = _3230;
    float _3258 = _3256;
    if (_3142)
    {
        float _3260 = _3132 * _3242;
        _3216 = _3260;
    }
    float _3262 = _3216;
    if (!_3142)
    {
        _3238 = _3134;
    }
    float _3264 = _3238;
    float _3266 = _3264;
    if (_3142)
    {
        float _3268 = fma(_3212, _3206, _3250);
        _3258 = _3268;
    }
    float _3270 = _3258;
    if (_3142)
    {
        float _3272 = _3254 * _3254;
        _3266 = _3272;
    }
    float _3274 = _3266;
    if (!_3142)
    {
        _3232 = _3136;
    }
    float _3276 = _3232;
    float _3278 = _3276;
    if (_3142)
    {
        float _3280 = _3262 * _3262;
        _3278 = _3280;
    }
    float _3282 = _3278;
    float _3284 = _2970 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3286 = fma(_3270, _3270, _3274);
    float _3288 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3284);
    float _3290 = _3286 + _3282;
    float _3292 = _2970 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3294 = _2970 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3296 = -_3182;
    float _3298 = _3296 + 1.0;
    float _3300 = rsqrt(_3290);
    float _3302 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3292);
    float _3304 = _2970 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3306 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3294);
    float _3308 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3288);
    float _3310 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3302);
    float _3312 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3304);
    float _3314 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3306);
    float _3316 = abs(_3298);
    float _3318 = log2(_3316);
    float _3320 = _3310 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3322 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3312);
    float _3324 = _3314 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3326 = _3308 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3328 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3330 = _3322 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3332 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3334 = _3300 * _3254;
    float _3336 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3328);
    float _3338 = _3300 * _3270;
    float _3340 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3342 = _3334 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3344 = _3300 * _3262;
    float _3346 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3336);
    float _3348 = -_3340;
    float _3350 = fma(_3348, _3116, 1.0);
    float _3352 = -_3342;
    float _3354 = fma(_3338, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3352);
    float _3356 = _3318 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3358 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3346);
    float _3360 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3362 = -_3344;
    float _3364 = fma(_3362, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3354);
    float _3366 = exp2(_3356);
    float _3368 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3332);
    float _3370 = _3338 + 1.0;
    float _3372 = fma(_3364, -0.5, 0.5);
    float _3374 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3368);
    float _3376 = log2(_3350);
    float _3378 = fma(_3364, 0.5, 0.5);
    float _3380 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3360);
    float _3382 = fma(_3378, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3384 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3380);
    float _3386 = 1.0 / _3358;
    float _3388 = -_3338;
    float _3390 = fma(_3366, _3370, _3388);
    float _3392 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3374);
    float _3394 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3384);
    float _3396 = fma(_3378, _3382, -0.212114393711090087890625);
    float _3398 = sqrt(_3372);
    float _3400 = _3376 * 0.693147182464599609375;
    float _3402 = fma(_3378, _3396, 1.570728778839111328125);
    float _3404 = _3400 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3406 = _3392 * _3386;
    float _3408 = _3394 * _3386;
    float _3410 = fma(_3406, 0.5, 0.5);
    float _3412 = fma(_3408, -0.5, 0.5);
    float _3414 = fma(_3390, 0.5, 0.5);
    float _3416 = _3398 * 0.636619746685028076171875;
    float3 _8677 = float3(_3410, _3412, _3404);
    float _3418 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8677, float3(0.0), isnan(_8677)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8677, float3(0.0), isnan(_8677)), level(0.0)).x;
    float _3420 = -_3402;
    float _3422 = fma(_3416, _3420, 1.0);
    float3 _8693 = float3(_3410, _3412, _3404);
    float4 _3425 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8693, float3(0.0), isnan(_8693)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8693, float3(0.0), isnan(_8693)), level(0.0)).xyzw;
    float _3427 = _3425.x;
    float _3429 = _3425.y;
    float _3431 = _3425.z;
    float _3433 = _3425.w;
    float2 _8710 = float2(_3422, _3414);
    float3 _3437 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8710, float2(0.0), isnan(_8710)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8710, float2(0.0), isnan(_8710)), level(0.0)).xyz;
    float _3439 = _3437.x;
    float _3441 = _3437.y;
    float _3443 = _3437.z;
    float _3445 = _3318 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3447 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3449 = _3042 > 0.0;
    bool _3451 = isnan(_3042);
    bool _3453 = _3449 || _3451;
    bool _3455 = isnan(0.0);
    bool _3457 = _3453 || _3455;
    float _3459 = _3392 + _3358;
    float _3461 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3447);
    float _3463 = exp2(_3445);
    bool _3465 = _3102 <= 0.0;
    bool _3467 = !_3457;
    bool _3469 = _3465 || _3467;
    float _3471 = _3459 * 0.5;
    float _3473 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3461);
    float _3475 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3473);
    float _3477 = _3042 * _3102;
    float _3479 = _3358 * 0.5;
    float _3481 = _3475 + _3358;
    float _3483 = _3477 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _3392;
    out.gl_Position.y = _3394;
    out.gl_Position.z = _3475;
    out.gl_Position.w = _3358;
    float _3485 = _3481 * 0.5;
    float _3487 = -_3463;
    float _3489 = _3487 + 1.0;
    float _3491 = fma(_3394, -0.5, _3479);
    float _3493 = _3483 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3495 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3471;
    out.m_68.y = _3491;
    out.m_68.z = _3485;
    out.m_68.w = _3358;
    float _3497 = -_3495;
    float _3499 = _3497 + 1.0;
    out.m_45.x = _3493;
    float _3501 = _3495 * _3418;
    float _3503 = _3433 * _3501;
    float _3505 = _3433 * _3499;
    float _3507 = _3443 * _3501;
    float _3509 = fma(_3439, _3503, _3427);
    float _3511 = fma(_3441, _3503, _3429);
    float _3513 = fma(_3433, _3507, _3431);
    out.m_70.x = _3509;
    out.m_70.y = _3511;
    out.m_70.z = _3513;
    out.m_70.w = _3505;
    if (!_3469)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _3515 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3515;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _815 = false;
    bool _699 = false;
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
        float _3572 = as_type<float>(_105);
        out.gl_Position.z = _3572;
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
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3642 = as_type<float>(_143);
        out.gl_Position.z = _3642;
    }
    if (_135)
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
        float _341 = exp2(_339);
        float _343 = _337 * 0.693147182464599609375;
        float _345 = 1.0 / _343;
        float _347 = 1.0 / _335;
        float _349 = _341 + (-1.0);
        float _351 = -_349;
        float _353 = fma(_351, _345, _123);
        float _355 = _353 * _347;
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
    float _429 = fma(_425, _161, _391);
    float _431 = fma(_425, _165, _395);
    bool _433 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _435 = fma(_387, _149, _169);
    float _437 = -_427;
    float _439 = _387 + _437;
    float _441 = fma(_385, _149, _167);
    float _443 = -_429;
    float _445 = _385 + _443;
    float _447 = -_431;
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
    bool _471 = !_433;
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
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _513 = _505 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _523;
    bool _527 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _529 = isnan(_505);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = 1.0 / _517;
    bool _541 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _543 = -_537;
    float _545 = _543 + 1.0;
    float _547 = 1.0 / _521;
    float _549 = 1.0 / _525;
    float _551 = _509 * _539;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _555 = _505 + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _557;
    float _561 = _555 * _547;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _563;
    float _567 = fma(_559, _551, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _573 = fma(_565, _551, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _575 = _513 * _549;
    bool _577 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _579 = isnan(_505);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    bool _589 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _591 = isnan(_505);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = _587 * _545;
    bool _603 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _605 = isnan(_505);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -_587;
    float _617 = _615 + 1.0;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _623 = -_599;
    float _625 = _623 + 1.0;
    float _627 = _599 * _617;
    float _629 = fma(_621, _561, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _631 = fma(_571, _561, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _633 = _613 * _625;
    float _635 = in.m_52.x;
    float _637 = in.m_52.y;
    float _639 = -_613;
    float _641 = _639 + 1.0;
    float _643 = _567 * _633;
    float _645 = _573 * _633;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _647;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _651;
    float _655 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].x, _643);
    float _657 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].y, _645);
    float _659 = fma(_649, _575, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _661 = fma(_653, _575, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _663 = fma(_629, _627, _655);
    float _665 = fma(_631, _627, _657);
    float _667 = fma(_659, _601, _663);
    float _669 = fma(_661, _601, _665);
    float _671 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[146].x, _667);
    float _673 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[146].y, _669);
    float _675 = _671 * _635;
    float _677 = _673 * _637;
    bool _679 = !_541;
    float _697;
    if (!_679)
    {
        float _681 = in.m_54.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _697 = _695;
        _699 = true;
    }
    else
    {
        float _701 = float(_89);
        float _703 = 1.0 / _701;
        float _705 = _123 * _703;
        _697 = _705;
    }
    _699 = false;
    float _707 = _697;
    bool _709 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _711 = isnan(_707);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _725 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _727 = isnan(_707);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _743 = _707 + _741;
    float _745 = -_719;
    float _747 = _745 + 1.0;
    bool _749 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _751 = 1.0 / _723;
    float _753 = _735 * _747;
    float _755 = -_735;
    float _757 = _755 + 1.0;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _761 = _739 * _751;
    float _763 = fma(_761, _743, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _767 = _763 * _753;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _771 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[115].x, _767);
    float _773 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[116].x, _771);
    float _775 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _777 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = _759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _781 = _773 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _775;
    out.m_56.y = _777;
    out.m_56.z = _779;
    out.m_56.w = _781;
    bool _783 = !_749;
    float _785 = _781;
    float _809;
    float _811;
    float _813;
    if (!_783)
    {
        float _787 = in.m_54.x;
        float _789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _791 = float(_89);
        float _793 = 1.0 / _791;
        float _795 = _787 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _797 = _123 * _793;
        float _799 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _801 = _799 * _789;
        float _803 = floor(_801);
        float _805 = -_803;
        float _807 = _801 + _805;
        _809 = _797;
        _811 = _791;
        _785 = _789;
        _813 = _807;
        _815 = true;
    }
    else
    {
        float _817 = float(_89);
        float _819 = 1.0 / _817;
        float _821 = _123 * _819;
        _809 = _821;
        _811 = _817;
        _813 = _821;
    }
    _815 = false;
    float _823 = _809;
    float _825 = _811;
    float _827 = _785;
    float _829 = _813;
    float _831 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _833 = int(_831);
    float _835 = in.m_54.x;
    float _837 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _841 = _823 + _839;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _847 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _849 = int(_847);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _863 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _837);
    float _865 = 1.0 / _825;
    float _867 = float(_833);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _877 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[5].z, _863);
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _881 = _879 != 0;
    float _883 = 1.0 / _867;
    float _885 = float(uint(_849));
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _891 = ~_849;
    int _893 = _891 + 1;
    float _895 = _877 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _897 = float(_849);
    float _899 = _675 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _901 = _849 == 0;
    float _903 = 1.0 / _885;
    bool _905 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _907 = isnan(_823);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _913 = _909 || _911;
    float _915 = float(_913);
    float _917 = _827;
    float _919 = as_type<float>(_849);
    if (!_881)
    {
        float _921 = in.m_54.y;
        _917 = _921;
    }
    float _923 = _917;
    bool _925 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _927 = isnan(_829);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _937;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _945 = _123 * _883;
    int _947 = ~_849;
    int _949 = _947 + 1;
    float _951 = 1.0 / _845;
    bool _953 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _955 = isnan(_823);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = -_915;
    float _967 = _965 + 1.0;
    bool _969 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _971 = isnan(_823);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    bool _981 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _983 = isnan(_823);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    int _993 = as_type<int>(_903) + (-2);
    float _995 = trunc(_945);
    int _997 = int(_995);
    float _999 = 1.0 / _853;
    float _1001 = _883;
    if (!_881)
    {
        _1001 = _923;
    }
    float _1003 = _1001;
    float _1005 = float(uint(_997));
    float _1007 = _1003;
    int _1009 = as_type<int>(_923);
    if (_881)
    {
        float _1011 = in.m_54.x;
        float _1013 = in.m_54.y;
        _1007 = _1011;
        _1009 = as_type<int>(_1013);
    }
    float _1015 = _1007;
    int _1017 = _1009;
    float _1019 = 1.0 / _857;
    float _1021 = as_type<float>(_993) * _1005;
    float _1023 = trunc(_1021);
    float _1025 = precise::max(_1023, 0.0);
    uint _1028 = uint(_1025);
    float _1030 = 1.0 / _861;
    bool _1032 = !_881;
    float _1034 = _1032 ? as_type<float>(_1017) : _835;
    int _1036 = _949 * int(_1028);
    int _1038 = _1036 + _997;
    float _1040 = 1.0 / _871;
    float _1042 = float(uint(_1038));
    float _1044 = 1.0 / _875;
    float _1046 = as_type<float>(_993) * _1042;
    bool _1048 = !_881;
    float _1050 = _1048 ? 1.2345600128173828125 : 1.0;
    float _1052 = float(_997);
    float _1054 = _1050 * _1034;
    float _1056 = trunc(_1046);
    float _1058 = precise::max(_1056, 0.0);
    uint _1060 = uint(_1058);
    bool _1062 = _1052 >= _897;
    bool _1064 = isnan(_1052);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan(_897);
    bool _1070 = _1066 || _1068;
    float _1072 = float(_1070);
    float _1074 = floor(_1054);
    int _1076 = int(_1028) + int(_1060);
    float _1078 = trunc(_1072);
    int _1080 = int(_1078);
    float _1082 = _123 * _897;
    int _1084 = _893 * _1076;
    int _1086 = _1084 + _997;
    float _1088 = _1082 * _865;
    int _1090 = _849 + (-1);
    float _1092 = 1.0 / _889;
    bool _1094 = uint(_1086) >= uint(_849);
    bool _1096 = !_1094;
    int _1098 = _1096 ? 0 : (-1);
    float _1100 = trunc(_1088);
    int _1102 = int(_1100);
    int _1104 = ~_1076;
    int _1106 = _1104 + _1098;
    int _1108 = _1106 + 1;
    float _1110 = -_1074;
    float _1112 = _1054 + _1110;
    int _1114 = ~_1080;
    int _1116 = _1114 + 1;
    int _1118 = _1116 + 1;
    int _1120 = _849 * _1108;
    int _1122 = _1120 + _997;
    float _1124 = _897 * _1112;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1128 = _1126 != 0;
    float _1130 = trunc(_1124);
    int _1132 = int(_1130);
    bool _1134 = !_901;
    int _1136 = _1134 ? _1122 : (-1);
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1140 = _1138 != 0;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1144 = _1142 != 0;
    int _1146 = _1118 * _1136;
    bool _1148 = !_1128;
    int _1150 = _1148 ? 0 : 1;
    int _1152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1154 = _1152 != 0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1158 = _1156 != 0;
    int _1160 = _1080 * _1090;
    int _1162 = _1160 + _1146;
    bool _1164 = !_1144;
    int _1166 = _1164 ? 0 : 1;
    bool _1168 = !_1140;
    int _1170 = _1168 ? 0 : 1;
    int _1172 = abs(_1150);
    int _1174 = abs(_1166);
    bool _1176 = !_1154;
    int _1178 = _1176 ? 0 : 1;
    int _1180 = abs(_1170);
    int _1182 = _1162 * _1174;
    bool _1184 = !_1158;
    int _1186 = _1184 ? 0 : 1;
    int _1188 = abs(_1178);
    int _1190 = _1132 * _1172;
    int _1192 = _1190 + _997;
    int _1194 = abs(_1186);
    int _1196 = _1102 * _1180;
    int _1198 = _1196 + _1182;
    int _1200 = ~_849;
    int _1202 = _1200 + 1;
    int _1204 = _1192 * _1188;
    int _1206 = _1204 + _1198;
    int _1208 = ~_849;
    int _1210 = _1208 + 1;
    float _1212 = in.m_54.z;
    int _1214 = _1132 * _1194;
    int _1216 = _1214 + _1206;
    float _1218 = float(uint(_1216));
    float _1220 = as_type<float>(_993) * _1218;
    float _1222 = trunc(_1220);
    float _1224 = precise::max(_1222, 0.0);
    uint _1226 = uint(_1224);
    int _1228 = _1210 * int(_1226);
    int _1230 = _1228 + _1216;
    float _1232 = float(uint(_1230));
    float _1234 = as_type<float>(_993) * _1232;
    float _1236 = trunc(_1234);
    float _1238 = precise::max(_1236, 0.0);
    uint _1240 = uint(_1238);
    float _1242 = _835 * 2.0;
    float _1244 = floor(_1242);
    int _1246 = int(_1226) + int(_1240);
    float _1248 = in.m_54.w;
    int _1250 = _1202 * _1246;
    int _1252 = _1250 + _1216;
    float _1254 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1256 = log2(_1254);
    bool _1258 = uint(_1252) >= uint(_849);
    bool _1260 = !_1258;
    int _1262 = _1260 ? 0 : (-1);
    bool _1264 = _1244 >= 0.0;
    bool _1266 = isnan(_1244);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan(0.0);
    bool _1272 = _1268 || _1270;
    int _1274 = ~_1246;
    int _1276 = _1274 + _1262;
    int _1278 = _1276 + 1;
    int _1280 = _1272 ? 0 : 1;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1284 = _1282 != 0;
    int _1286 = _849 * _1278;
    int _1288 = _1286 + _1216;
    float _1290 = _123 * _1256;
    bool _1292 = _1248 > 0.5;
    bool _1294 = !_901;
    int _1296 = _1294 ? _1288 : (-1);
    float _1298 = -_225;
    int _1300 = _1292 ? as_type<int>(_1298) : as_type<int>(_225);
    float _1302 = exp2(_1290);
    int _1304 = _1296 & 3;
    bool _1306 = _1304 != 0;
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1310 = _1308 != 0;
    bool _1312 = uint(_1304) > 1u;
    int _1314 = _1306 ? 0 : 1;
    bool _1316 = _1212 > 0.5;
    int _1318 = ~_1314;
    int _1320 = _1318 + 1;
    int _1322 = _1320 + 1;
    float _1324 = -_221;
    int _1326 = _1316 ? as_type<int>(_1324) : as_type<int>(_221);
    bool _1328 = _1244 > 0.0;
    float _1330 = -_1302;
    float _1332 = _1330 + 1.0;
    int _1334 = ~_1280;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    int _1340 = _1322;
    int _1342 = _1338;
    if (!_1312)
    {
        int _1344 = ~_1314;
        int _1346 = _1344 + 1;
        _1340 = _1346;
    }
    int _1348 = _1340;
    bool _1350 = _835 > 0.5;
    bool _1352 = !_1310;
    float _1354 = _1352 ? _221 : as_type<float>(_1326);
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1358 = _1356 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1370 = _1368 != 0;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1374 = _1372 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1376 = !_1284;
    float _1378 = _1376 ? _225 : as_type<float>(_1300);
    float _1380 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (!_1328)
    {
        int _1382 = ~_1280;
        int _1384 = _1382 + 1;
        _1342 = _1384;
    }
    int _1386 = _1342;
    float _1388 = 1.0 / _1358;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1392 = _1390 != 0;
    float _1394 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1398 = _1396 != 0;
    float _1400 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1380);
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1404 = _1402 != 0;
    float _1406 = _1212 * 2.0;
    float _1408 = 1.0 / _1374;
    float _1410 = -_221;
    int _1412 = _1350 ? as_type<int>(_1410) : as_type<int>(_221);
    float _1414 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1394);
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1418 = _1416 != 0;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1420;
    float _1424 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1400);
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1428 = _829 + _1426;
    float _1430 = floor(_1406);
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1434 = _829 + _1432;
    float _1436 = _1422 * _951;
    float _1438 = _1428 * _999;
    float _1440 = _1434 * _1019;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1442;
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1448 = _1446 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1456 = _1454 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1458 = _1444 * _1030;
    float _1460 = _1448 * _1388;
    float _1462 = 0.0;
    if (!_1418)
    {
        _1462 = _1212;
    }
    float _1464 = _1462;
    float _1466 = _1452 * _1408;
    float _1468 = 0.0;
    float _1470 = _1464;
    if (!_1418)
    {
        _1468 = _1212;
    }
    float _1472 = _1468;
    float _1474 = _1456 * _1040;
    float _1476 = _1472;
    if (_1418)
    {
        _1470 = as_type<float>(_1017);
    }
    float _1478 = _1470;
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    if (_1418)
    {
        _1476 = as_type<float>(_1017);
    }
    float _1484 = _1476;
    float _1486 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1414);
    float _1488 = _1482 * _1044;
    bool _1490 = _1430 >= 0.0;
    bool _1492 = isnan(_1430);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan(0.0);
    bool _1498 = _1494 || _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1502 = _823 + _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1504;
    int _1508 = _1498 ? 0 : 1;
    float _1510 = fma(_1436, _1502, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1512 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1514 = isnan(0.0);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1520 = _1516 || _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1522;
    float _1526 = fma(_1506, _1438, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1528 = _1520 ? _1332 : 0.0;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1532 = _823 + _1530;
    bool _1534 = _1430 > 0.0;
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1542 = _1540 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1544 = fma(_1458, _1532, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1546 = _1524 * _1092;
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1550 = _823 + _1548;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1552;
    float _1556 = fma(_1538, _1440, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1558 = fma(_943, _1440, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1560 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1562 = isnan(_823);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1568 = _1564 || _1566;
    float _1570 = float(_1568);
    float _1572 = fma(_1542, _1440, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1574 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1576 = isnan(_823);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1582 = _1578 || _1580;
    float _1584 = float(_1582);
    float _1586 = fma(_939, _1438, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1590 = _823 + _1588;
    float _1592 = fma(_1466, _1550, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1594 = fma(_1554, _1438, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1596 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1598 = isnan(_823);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1604 = _1600 || _1602;
    float _1606 = float(_1604);
    float _1608 = -_1570;
    float _1610 = _1608 + 1.0;
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1614 = _823 + _1612;
    float _1616 = fma(_1460, _1590, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1618 = -_1584;
    float _1620 = _1618 + 1.0;
    bool _1622 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1624 = isnan(_823);
    bool _1626 = _1622 || _1624;
    bool _1628 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1630 = _1626 || _1628;
    float _1632 = float(_1630);
    float _1634 = _1584 * _1610;
    float _1636 = -_1606;
    float _1638 = _1636 + 1.0;
    float _1640 = fma(_1474, _1614, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1642 = _1606 * _1620;
    bool _1644 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1646 = isnan(_829);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = fma(_1488, _841, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1658 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1660 = isnan(_829);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1666 = _1662 || _1664;
    float _1668 = float(_1666);
    float _1670 = _1632 * _1638;
    float _1672 = -_1632;
    float _1674 = _1672 + 1.0;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1678 = 1.0 + _1676;
    float _1680 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1682 = -_1668;
    float _1684 = _1682 + 1.0;
    float _1686 = _915 * _1674;
    float _1688 = _963 * _967;
    float _1690 = -_963;
    float _1692 = _1690 + 1.0;
    float _1694 = 1.0 / _1678;
    float _1696 = _935 * _1684;
    float _1698 = -_935;
    float _1700 = _1698 + 1.0;
    float _1702 = _979 * _1692;
    float _1704 = -_979;
    float _1706 = _1704 + 1.0;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1710 = _823 + _1708;
    float _1712 = _1654 * _1700;
    float _1714 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1716 = _991 * _1706;
    float _1718 = fma(_1546, _1710, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1720 = _1526 * _1712;
    float _1722 = _1586 * _1712;
    float _1724 = _1594 * _1712;
    float _1726 = _1510 * _1716;
    float _1728 = -_1654;
    float _1730 = _1728 + 1.0;
    float _1732 = _1528 * _1694;
    float _1734 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1720);
    float _1736 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1722);
    float _1738 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1724);
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1742 = -_991;
    float _1744 = _1742 + 1.0;
    float _1746 = fma(_1558, _1696, _1736);
    float _1748 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1740);
    int _1750 = ~_1508;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1726);
    int _1758 = _1754;
    if (!_1534)
    {
        int _1760 = ~_1508;
        int _1762 = _1760 + 1;
        _1758 = _1762;
    }
    int _1764 = _1758;
    float _1766 = fma(_1556, _1696, _1734);
    float _1768 = fma(_1572, _1696, _1738);
    float _1770 = as_type<float>(_1017) * 2.0;
    float _1772 = fma(_1640, _1702, _1756);
    float _1774 = _835 + as_type<float>(_1017);
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1780 = floor(_1770);
    float _1782 = _1774 + (-1.0);
    float _1784 = fma(_1714, -2.0, _1778);
    float _1786 = float(uint(_1192));
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1790 = -_1776;
    float _1792 = fma(_1680, 2.0, _1790);
    float _1794 = _1212 + as_type<float>(_1017);
    float _1796 = fma(_1544, _1688, _1772);
    float _1798 = fma(_1782, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1800 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1788);
    float _1802 = _1354 + 0.5;
    float _1804 = -_123;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1792);
    float _1808 = as_type<float>(_993) * _1786;
    bool _1810 = !_1398;
    float _1812 = _1810 ? _221 : as_type<float>(_1412);
    float _1814 = _1794 + (-1.0);
    bool _1816 = as_type<float>(_1017) > 0.5;
    float _1818 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1768);
    bool _1820 = !_1362;
    int _1822 = _1820 ? 0 : 1;
    float _1824 = fma(_1802, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1806);
    float _1826 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1828 = _1424 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1830 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1832 = _895 + _1830;
    float _1834 = -_225;
    int _1836 = _1816 ? as_type<int>(_1834) : as_type<int>(_225);
    float _1838 = trunc(_1808);
    float _1840 = precise::max(_1838, 0.0);
    uint _1842 = uint(_1840);
    bool _1844 = _1780 > 0.0;
    float _1846 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1746);
    bool _1848 = _1780 >= 0.0;
    bool _1850 = isnan(_1780);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan(0.0);
    bool _1856 = _1852 || _1854;
    float _1858 = _1486 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1860 = !_1366;
    int _1862 = _1860 ? 0 : 1;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1866 = _1828 + _1864;
    int _1868 = abs(_1822);
    float _1870 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1872 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1766);
    int _1874 = abs(_1862);
    float _1876 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1878 = _1858 + _1876;
    int _1880 = ~_849;
    int _1882 = _1880 + 1;
    float _1884 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1870);
    float _1886 = float(_1874);
    float _1888 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1784);
    float _1890 = float(_1386);
    float _1892 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1884);
    float _1894 = float(_1764);
    float _1896 = fma(_1616, _1686, _1796);
    float _1898 = in.m_58.x;
    float _1900 = in.m_58.y;
    float _1902 = in.m_58.z;
    float _1904 = _1886 * _1890;
    int _1906 = _1856 ? 0 : 1;
    float _1908 = _1812 + 0.5;
    int _1910 = _1882 * int(_1842);
    int _1912 = _1910 + _1192;
    bool _1914 = _1892 >= 0.0;
    float _1916 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1748);
    int _1918 = _1296 >> 31;
    float _1920 = _1908 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1922 = float(uint(_1912));
    float _1924 = -_1916;
    float _1926 = _1924 + 1.0;
    int _1928 = _1918 & 3;
    float _1930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1932 = float(_1868);
    float _1934 = as_type<float>(_993) * _1922;
    int _1936 = _1296 + _1928;
    float _1938 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1800);
    float _1940 = -_1926;
    float _1942 = fma(_1354, _1940, _1824);
    float _1944 = _1932 * _1894;
    float _1946 = _1378 + (-0.5);
    int _1948 = _1936 >> 2;
    float _1950 = trunc(_1934);
    float _1952 = precise::max(_1950, 0.0);
    uint _1954 = uint(_1952);
    float _1956 = _1944 * (-2.0);
    float _1958 = -_1946;
    float _1960 = -_1888;
    float _1962 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1960);
    int _1964 = ~_1906;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    float _1970 = -_1938;
    float _1972 = _1970 + 1.0;
    int _1974 = _1948 << 4;
    int _1976 = _1974 + 512;
    float _1978 = fma(_1798, _1956, _1798);
    int _1980 = _1968;
    if (!_1844)
    {
        int _1982 = ~_1906;
        int _1984 = _1982 + 1;
        _1980 = _1984;
    }
    int _1986 = _1980;
    float _1988 = fma(_1956, _1898, _1898);
    float _1990 = _1904 * (-2.0);
    float _1992 = _1920 * _1930;
    uint _1994 = uint(int(uint(_1976) >> uint(2)));
    uint _1996 = uint(int(uint(int(_1994)) >> uint(2)));
    int _1998 = int(_1994) & 3;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[int(_1996)][_1998];
    int _2002 = int(_1994) + 1;
    uint _2004 = uint(int(uint(_2002) >> uint(2)));
    int _2006 = _2002 & 3;
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[int(_2004)][_2006];
    float _2010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2012 = fma(_1826, _1990, _1826);
    float _2014 = fma(_1990, _1900, _1900);
    float _2016 = fma(_1592, _1670, _1896);
    int _2018 = int(_1842) + int(_1954);
    float _2020 = fma(_1378, _1972, _1962);
    bool _2022 = !_1404;
    float _2024 = _2022 ? _225 : as_type<float>(_1836);
    int _2026 = _1976 + 8;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
    int _2032 = int(_2028) & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    int _2036 = int(_2028) + 1;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    int _2040 = _2036 & 3;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[int(_2038)][_2040];
    bool _2044 = uint(_1304) >= 2u;
    float _2046 = _1818 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2048 = ~_849;
    int _2050 = _2048 + 1;
    float _2052 = -_2024;
    float _2054 = _2052 + 0.5;
    int _2056 = _2044 ? 0 : 1;
    float _2058 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2060 = _1304 != 3;
    float _2062 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2064 = ~_2056;
    int _2066 = _2064 + 1;
    int _2068 = _2066 + 1;
    float _2070 = _1872 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2072 = _2062 * _2010;
    int _2074 = _2050 * _2018;
    int _2076 = _2074 + _1192;
    float _2078 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2080 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2084 = _2046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2086 = abs(_1348);
    float _2088 = fma(_1656, _1642, _2016);
    int _2090 = _2068;
    if (_2060)
    {
        int _2092 = ~_2056;
        int _2094 = _2092 + 1;
        _2090 = _2094;
    }
    int _2096 = _2090;
    out.m_60.x = _1992;
    out.m_60.y = _2072;
    out.m_60.z = _1942;
    out.m_60.w = _2020;
    int _2098 = _1296 & 3;
    bool _2100 = _2098 != 0;
    float _2102 = fma(_1718, _1634, _2088);
    int _2104 = abs(_2096);
    out.m_62.x = _2078;
    out.m_62.y = _2080;
    out.m_62.z = _2084;
    out.m_62.w = _2082;
    bool _2106 = !_2100;
    int _2108 = _2106 ? 0 : 1;
    float _2110 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2102);
    bool _2112 = uint(_2076) >= uint(_849);
    if (_1914)
    {
        out.m_45.x = 0.0;
    }
    int _2114 = abs(_2108);
    float _2116 = as_type<float>(_1017) + (-0.5);
    bool _2118 = !_2112;
    int _2120 = _2118 ? 0 : (-1);
    out.m_64.x = _2110;
    bool _2122 = _1304 != 3;
    float _2124 = _835 + (-0.5);
    int _2126 = ~_2018;
    int _2128 = _2126 + _2120;
    int _2130 = _2128 + 1;
    float _2132 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1988);
    int _2134 = ~_2086;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    bool _2140 = !_2122;
    int _2142 = _2140 ? 0 : (-1);
    int _2144 = _849 * _2130;
    int _2146 = _2144 + _1192;
    int _2148 = ~_2114;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    int _2154 = _2138 * as_type<int>(_2008);
    bool _2156 = !_1392;
    int _2158 = _2156 ? 0 : 1;
    int _2160 = abs(_2142);
    int _2162 = _2152 * as_type<int>(_2000);
    int _2164 = _2162 + _2154;
    int _2166 = abs(_2158);
    float _2168 = _1832 * _1832;
    int _2170 = ~_2104;
    int _2172 = _2170 + 1;
    int _2174 = _2172 + 1;
    int _2176 = ~_2160;
    int _2178 = _2176 + 1;
    int _2180 = _2178 + 1;
    float _2182 = fma(_1866, _1866, _2168);
    bool _2184 = _849 == 0;
    int _2186 = _2174 * as_type<int>(_2034);
    int _2188 = _2186 + _2164;
    int _2190 = ~_2166;
    int _2192 = _2190 + 1;
    int _2194 = _2192 + 1;
    float _2196 = fma(_1878, _1878, _2182);
    float _2198 = as_type<float>(_2164);
    if (_1914)
    {
        _2198 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2200 = _2198;
    int _2202 = _2180 * as_type<int>(_2042);
    int _2204 = _2202 + _2188;
    bool _2206 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2208 = isnan(1.0);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2214 = _2210 || _2212;
    float _2216 = rsqrt(_2196);
    int _2218 = _2194 * _2204;
    bool _2220 = !_2184;
    int _2222 = _2220 ? _2146 : (-1);
    int _2224 = as_type<int>(_2200);
    if (_1914)
    {
        float _2226 = _2200 * 5.0;
        _2224 = as_type<int>(_2226);
    }
    int _2228 = _2224;
    bool _2230 = !_2214;
    float _2232 = _2230 ? _123 : _1732;
    int _2234 = _2222 * _2166;
    int _2236 = _2234 + _2218;
    float _2238 = _899 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2240 = !_1370;
    int _2242 = _2240 ? 0 : 1;
    if (_1914)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6840 = as_type<float>(_2228);
        out.gl_Position.z = _6840;
    }
    float _2244 = fma(_2232, _1978, _2132);
    float _2246 = float(_2236);
    float _2248 = _2238 * _2216;
    out.m_66.y = _2246;
    float _2250 = _1866 * _2248;
    float _2252 = _1832 * _2248;
    int _2254 = abs(_2242);
    if (_1914)
    {
        return out;
    }
    float _2256 = -_2252;
    float _2258 = _895 + _2256;
    float _2260 = _1878 * _2248;
    float _2262 = -_2250;
    float _2264 = _1828 + _2262;
    float _2266 = -_2252;
    float _2268 = _1832 + _2266;
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2272 = _2258 + _2270;
    float _2274 = -_2260;
    float _2276 = _1858 + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2280 = _2264 + _2278;
    float _2282 = float(_2254);
    float _2284 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2286 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2288 = _2276 + _2286;
    float _2290 = float(_1986);
    float _2292 = -_2250;
    float _2294 = _1866 + _2292;
    float _2296 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2284);
    float _2298 = _2268 * _2268;
    float _2300 = fma(_2116, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2014);
    float _2302 = -_2260;
    float _2304 = _1878 + _2302;
    float _2306 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2296);
    float _2308 = fma(_2294, _2294, _2298);
    float _2310 = _2282 * _2290;
    float _2312 = _835 + _1212;
    float _2314 = fma(_2232, _2012, _2300);
    bool _2316 = _2306 >= 0.0;
    float _2318 = fma(_2304, _2304, _2308);
    float _2320 = _2312 + (-1.0);
    float _2322 = _2310 * (-2.0);
    float _2324 = _2244 * 0.15915493667125701904296875;
    float _2326 = _2314 * 0.15915493667125701904296875;
    float _2328 = fma(_2320, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2330 = fma(_2322, _1902, _1902);
    float _2332 = _1212 + (-0.5);
    float _2334 = _2324 * 6.283185482025146484375;
    float _2336 = sin(_2334);
    float _2338 = fma(_2328, _2322, _2328);
    int _2340 = as_type<int>(_2330);
    float _2342 = _2280;
    float _2344 = _2276;
    if (_2316)
    {
        _919 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2346 = _919;
    float _2348 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2330);
    if (_2316)
    {
        out.m_45.x = 0.0;
    }
    float _2350 = _2324 * 6.283185482025146484375;
    float _2352 = cos(_2350);
    if (_2316)
    {
        float _2354 = _2346 * 5.0;
        _2340 = as_type<int>(_2354);
    }
    int _2356 = _2340;
    float _2358 = fma(_2232, _2338, _2348);
    if (_2316)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7032 = as_type<float>(_2356);
        out.gl_Position.z = _7032;
    }
    float _2360 = _2358 * 0.15915493667125701904296875;
    float _2362 = _2326 * 6.283185482025146484375;
    float _2364 = sin(_2362);
    float _2366 = sqrt(_2318);
    float _2368 = _2326 * 6.283185482025146484375;
    float _2370 = cos(_2368);
    if (_2316)
    {
        return out;
    }
    float _2372 = _2360 * 6.283185482025146484375;
    float _2374 = cos(_2372);
    float _2376 = _2216 * _2366;
    float _2378 = _677 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2380 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2382 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2384 = _899 * _2376;
    float _2386 = _2376 * _2378;
    float _2388 = _2352 * _2370;
    float _2390 = _2360 * 6.283185482025146484375;
    float _2392 = sin(_2390);
    float _2394 = _2382 * _2384;
    float _2396 = _2380 * _2386;
    float _2398 = _2336 * _2364;
    float _2400 = _2352 * _2364;
    float _2402 = _2336 * _2370;
    float _2404 = _2376 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2406 = _2404 * 0.5;
    float _2408 = _2374 * _2396;
    float _2410 = _2364 * _2374;
    float _2412 = _2370 * _2374;
    float _2414 = _2352 * _2408;
    float _2416 = _2336 * _2408;
    float _2418 = fma(_2392, _2388, _2398);
    float _2420 = -_2396;
    float _2422 = _2392 * _2420;
    float _2424 = fma(_2392, _2398, _2388);
    float _2426 = fma(_2418, _2394, _2414);
    float _2428 = -_2402;
    float _2430 = fma(_2392, _2400, _2428);
    float _2432 = fma(_2412, _2394, _2422);
    float _2434 = -_2400;
    float _2436 = fma(_2392, _2402, _2434);
    float _2438 = fma(_2430, _2406, _2426);
    float _2440 = fma(_2410, _2406, _2432);
    float _2442 = fma(_2436, _2394, _2416);
    float _2444 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2446 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2448 = fma(_2424, _2406, _2442);
    float _2450 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2444);
    float _2452 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2446);
    float _2454 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2450);
    float _2456 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2452);
    float _2458 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2460 = _2456 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2462 = _1858 + _2458;
    float _2464 = _1828 + _2460;
    float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2468 = _2462 + _2466;
    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2472 = _2464 + _2470;
    float _2474 = _2468 * _2468;
    float _2476 = fma(_2472, _2472, _2474);
    float _2478 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2480 = sqrt(_2476);
    float _2482 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2478);
    float _2484 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2482);
    float _2486 = _2484 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2488 = _895 + _2486;
    bool _2490 = _2480 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2492 = _2478;
    float _2494 = _2448;
    float _2496 = _2464;
    float _2498 = _2408;
    float _2500 = _2426;
    if (!_2490)
    {
        _2492 = _2464;
    }
    float _2502 = _2492;
    float _2504 = _2502;
    if (!_2490)
    {
        _2494 = _2462;
    }
    float _2506 = _2494;
    float _2508 = _2506;
    if (!_2490)
    {
        _2496 = _2488;
    }
    float _2510 = _2496;
    bool _2512 = !_2490;
    float _2514 = _2510;
    if (!_2512)
    {
        float _2516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2520 = _2480 + _2518;
        float _2522 = rsqrt(_2476);
        float _2524 = _2520 * _2516;
        float _2526 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2528 = _2524 * 0.15915493667125701904296875;
        float _2530 = _2528 * 6.283185482025146484375;
        float _2532 = cos(_2530);
        float _2534 = _2528 * 6.283185482025146484375;
        float _2536 = sin(_2534);
        float _2538 = _2532 + (-1.0);
        float _2540 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2542 = fma(_2536, _2526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2544 = fma(_2488, _2532, _2540);
        float _2546 = _2522 * _2542;
        float _2548 = fma(_2472, _2546, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2550 = fma(_2468, _2546, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2514 = _2544;
        _2504 = _2548;
        _2508 = _2550;
    }
    float _2552 = _2514;
    float _2554 = _2504;
    float _2556 = _2508;
    float _2558 = -_895;
    float _2560 = _2558 + _2552;
    float _2562 = -_1828;
    float _2564 = _2562 + _2554;
    float _2566 = -_1858;
    float _2568 = _2566 + _2556;
    float _2570 = _2560 * _2560;
    float _2572 = fma(_2564, _2564, _2570);
    float _2574 = fma(_2568, _2568, _2572);
    float _2576 = sqrt(_2574);
    bool _2578 = _2576 > 0.0;
    float _2580 = _2572;
    float _2582 = _2576;
    float _2584 = _2556;
    if (!_2578)
    {
        _2580 = _2554;
    }
    float _2586 = _2580;
    float _2588 = _2586;
    float _2590 = _2586;
    if (!_2578)
    {
        _2582 = _2552;
    }
    float _2592 = _2582;
    bool _2594 = !_2578;
    float _2596 = _2592;
    float _2598 = _2592;
    if (!_2594)
    {
        bool _2600 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2602 = _2468;
        if (_2600)
        {
            float _2604 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2602 = _2604;
        }
        float _2606 = _2602;
        float _2608 = _2606;
        if (_2600)
        {
            float _2610 = _465 * _2606;
            _2498 = _2610;
        }
        float _2612 = _2498;
        float _2614 = _2612;
        if (_2600)
        {
            float _2616 = _467 * _2606;
            _2500 = _2616;
        }
        float _2618 = _2500;
        float _2620 = _2618;
        if (_2600)
        {
            float _2622 = _469 * _2606;
            _2608 = _2622;
        }
        float _2624 = _2608;
        float _2626 = _2624;
        if (!_2600)
        {
            bool _2628 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2632 = _2628 || _2630;
            bool _2634 = isnan(1.0);
            bool _2636 = _2632 || _2634;
            float _2638 = _123 + 1.0;
            if (!_2636)
            {
                float _2640 = _2638 * _2638;
                float _2642 = _2640 * 0.5;
                _125 = _2642;
            }
            float _2644 = _125;
            float _2646 = _2644;
            if (!_2636)
            {
                float _2648 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2646 = _2648;
            }
            float _2650 = _2646;
            bool _2652 = !_2636;
            float _2654 = _2650;
            if (!_2652)
            {
                float _2656 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2658 = log2(_2656);
                float _2660 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2662 = 1.0 + _2660;
                float _2664 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2666 = _2658 * _2638;
                float _2668 = 1.0 / _2662;
                float _2670 = _2664 * 0.693147182464599609375;
                float _2672 = exp2(_2666);
                float _2674 = 1.0 / _2670;
                float _2676 = _2672 + (-1.0);
                float _2678 = -_2676;
                float _2680 = fma(_2678, _2674, _2638);
                float _2682 = _2680 * _2668;
                float _2684 = _2682 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2654 = _2684;
            }
            float _2686 = _2654;
            float _2688 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2690 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2692 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2694 = _2686;
            if (!_2636)
            {
                _2694 = _2638;
            }
            float _2696 = _2694;
            float _2698 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2700 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2702 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2704 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2698);
            float _2706 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2700);
            float _2708 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2704);
            bool _2710 = !_2636;
            float _2712 = _2696;
            _2588 = _2706;
            if (!_2710)
            {
                float _2714 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2716 = log2(_2714);
                float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2720 = 1.0 + _2718;
                float _2722 = 1.0 / _2720;
                float _2724 = _2716 * _2638;
                float _2726 = exp2(_2724);
                float _2728 = -_2726;
                float _2730 = _2728 + 1.0;
                float _2732 = _2730 * _2722;
                _2712 = _2732;
            }
            float _2734 = _2712;
            float _2736 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2702);
            float _2738 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2706);
            float _2740 = fma(_2734, _163, _2708);
            float _2742 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2736);
            float _2744 = fma(_2734, _161, _2738);
            float _2746 = -_427;
            float _2748 = _2746 + _2740;
            float _2750 = fma(_2734, _165, _2742);
            float _2752 = -_429;
            float _2754 = _2752 + _2744;
            float _2756 = _2748 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2758 = _2748 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2760 = _2748 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2762 = -_431;
            float _2764 = _2762 + _2750;
            float _2766 = fma(_2754, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2756);
            float _2768 = fma(_2754, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2758);
            float _2770 = fma(_2754, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2760);
            float _2772 = fma(_2764, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2766);
            float _2774 = fma(_2764, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2768);
            float _2776 = fma(_2764, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2770);
            _473 = _2774;
            _475 = _2772;
            _477 = _2776;
            _2614 = _2772;
            _2620 = _2774;
            _2626 = _2776;
            _2596 = _2742;
        }
        float _2778 = _473;
        float _2780 = _475;
        float _2782 = _477;
        float _2784 = _2614;
        float _2786 = _2620;
        float _2788 = _2626;
        float _2790 = _2596;
        float _2792 = _2588;
        float _2794 = _2778 * _2778;
        float _2796 = rsqrt(_2574);
        float _2798 = fma(_2780, _2780, _2794);
        float _2800 = fma(_2782, _2782, _2798);
        float _2802 = sqrt(_2800);
        float _2804 = _2564 * _2796;
        float _2806 = _2560 * _2796;
        float _2808 = _2568 * _2796;
        bool _2810 = _2802 > 0.0;
        float _2812 = _2792;
        float _2814 = _2790;
        if (!_2810)
        {
            _2812 = _2554;
        }
        float _2816 = _2812;
        _2590 = _2816;
        if (!_2810)
        {
            _2814 = _2552;
        }
        float _2818 = _2814;
        bool _2820 = !_2810;
        _2598 = _2818;
        if (!_2820)
        {
            float _2822 = rsqrt(_2800);
            float _2824 = _2822 * _2778;
            float _2826 = _2822 * _2780;
            float _2828 = _2822 * _2782;
            float _2830 = _2806 * _2824;
            float _2832 = fma(_2804, _2826, _2830);
            float _2834 = fma(_2808, _2828, _2832);
            float _2836 = _2834 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2838 = fma(_2784, _2836, _2554);
            float _2840 = fma(_2786, _2836, _2552);
            float _2842 = fma(_2788, _2836, _2556);
            _2598 = _2840;
            _2584 = _2842;
            _2590 = _2838;
        }
    }
    float _2844 = _2598;
    float _2846 = _2584;
    float _2848 = _2590;
    float _2850 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2852 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2854 = isnan(0.5);
    bool _2856 = _2852 || _2854;
    bool _2858 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2860 = _2856 || _2858;
    float _2862 = -_2252;
    float _2864 = _2862 + _2844;
    bool _2866 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2868 = isnan(0.5);
    bool _2870 = _2866 || _2868;
    bool _2872 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2874 = _2870 || _2872;
    float _2876 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2850);
    float _2878 = -_2260;
    float _2880 = _2878 + _2846;
    float _2882 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2876);
    float _2884 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2886 = _2882 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2888 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2884);
    float _2890 = 1.0 / _2886;
    float _2892 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2888);
    float _2894 = _2892 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2896 = _2894 + _2886;
    float _2898 = _2896 * _2890;
    float _2900 = _2898 * 0.5;
    float _2902 = -_2250;
    float _2904 = _2902 + _2848;
    float _2906 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2908 = fma(_2900, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2906);
    float _2910 = _2900;
    float _2912 = _2864;
    float _2914 = _2904;
    float _2916 = _2880;
    float _2918 = _2886;
    if (_2874)
    {
        _2910 = 1.0;
    }
    float _2920 = _2910;
    float _2922 = 1.0 / _2908;
    float _2924 = _2920;
    if (!_2860)
    {
        float _2926 = _2272 * _2272;
        float _2928 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2930 = -_1858;
        float _2932 = _2930 + _2846;
        float _2934 = -_1828;
        float _2936 = _2934 + _2848;
        float _2938 = fma(_2280, _2280, _2926);
        float _2940 = -_895;
        float _2942 = _2940 + _2844;
        float _2944 = fma(_2288, _2288, _2938);
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2948 = sqrt(_2944);
        float _2950 = _2928 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2952 = 1.0 / _2376;
        float _2954 = precise::min(_2948, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2956 = _2954 * _2946;
        float _2958 = _2956 * _2952;
        float _2960 = _2950 * _2958;
        float _2962 = _2932 * _2958;
        float _2964 = fma(_2936, _2960, _2264);
        float _2966 = fma(_2942, _2960, _2258);
        float _2968 = fma(_2950, _2962, _2276);
        _2912 = _2966;
        _2914 = _2964;
        _2916 = _2968;
        _2342 = _2948;
        _2918 = _2958;
    }
    float _2970 = _2912;
    float _2972 = _2914;
    float _2974 = _2916;
    float _2976 = _2342;
    float _2978 = _2918;
    float _2980 = _2978;
    float _2982 = _2976;
    if (_2874)
    {
        _2980 = 1.0;
    }
    float _2984 = _2980;
    float _2986 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2988 = _2922 * _2986;
    float _2990 = _2984;
    if (!_2874)
    {
        float _2992 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2994 = _2992 * 0.15915493667125701904296875;
        float _2996 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2998 = _2994 * 6.283185482025146484375;
        float _3000 = cos(_2998);
        float _3002 = _2996 * 0.15915493667125701904296875;
        float _3004 = _2994 * 6.283185482025146484375;
        float _3006 = sin(_3004);
        float _3008 = 1.0 / _3000;
        float _3010 = _3002 * 6.283185482025146484375;
        float _3012 = cos(_3010);
        float _3014 = _3006 * _3008;
        float _3016 = _3002 * 6.283185482025146484375;
        float _3018 = sin(_3016);
        float _3020 = _3012 * _3014;
        float _3022 = 1.0 / _3020;
        float _3024 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3026 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3024;
        float _3028 = 1.0 / _3026;
        float _3030 = _3018 * _3022;
        float _3032 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3034 = fma(_2988, _3030, _3032);
        float _3036 = _3034 * _3028;
        float _3038 = precise::clamp(_3036, 0.0, 1.0);
        _2344 = _3028;
        _2924 = _3038;
    }
    float _3040 = _2344;
    float _3042 = _2924;
    float _3044 = _3040;
    if (!_2874)
    {
        float _3046 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3048 = _3046 * 0.15915493667125701904296875;
        float _3050 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3052 = _3048 * 6.283185482025146484375;
        float _3054 = cos(_3052);
        float _3056 = _3050 * 0.15915493667125701904296875;
        float _3058 = _3048 * 6.283185482025146484375;
        float _3060 = sin(_3058);
        float _3062 = 1.0 / _3054;
        float _3064 = _3056 * 6.283185482025146484375;
        float _3066 = cos(_3064);
        float _3068 = _3060 * _3062;
        float _3070 = _3056 * 6.283185482025146484375;
        float _3072 = sin(_3070);
        float _3074 = _3066 * _3068;
        float _3076 = 1.0 / _3074;
        float _3078 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3080 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3078;
        float _3082 = 1.0 / _3080;
        float _3084 = _3072 * _3076;
        float _3086 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3088 = fma(_2988, _3084, _3086);
        float _3090 = _3088 * _3082;
        float _3092 = precise::clamp(_3090, 0.0, 1.0);
        float _3094 = -_3092;
        float _3096 = _3094 + 1.0;
        _2982 = _3084;
        _3044 = _3062;
        _2990 = _3096;
    }
    float _3098 = _2982;
    float _3100 = _3044;
    float _3102 = _2990;
    float _3104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3106 = _2970 + _3104;
    float _3108 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3110 = _2972 + _3108;
    float _3112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3114 = _2974 + _3112;
    float _3116 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3118 = _3106 * _3106;
    float _3120 = fma(_3110, _3110, _3118);
    float _3122 = fma(_3114, _3114, _3120);
    float _3124 = rsqrt(_3122);
    float _3126 = sqrt(_3122);
    float _3128 = _3124 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3130 = _3110 * _3128;
    float _3132 = _3114 * _3128;
    float _3134 = _3130 * _3130;
    float _3136 = _3132 * _3132;
    float _3138 = _3134 + _3136;
    float _3140 = sqrt(_3138);
    bool _3142 = _3140 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3146 = _3140 + _3144;
    float _3148 = _3124;
    float _3150 = _3100;
    float _3152 = _3146;
    float _3154 = _3098;
    float _3156 = _3106;
    float _3158 = _3128;
    if (_3142)
    {
        float _3160 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3148 = _3160;
    }
    float _3162 = _3148;
    if (_3142)
    {
        float _3164 = rsqrt(_3138);
        _3150 = _3164;
    }
    float _3166 = _3150;
    float _3168 = _3166;
    if (_3142)
    {
        float _3170 = _3146 * _3162;
        _3152 = _3170;
    }
    float _3172 = _3152;
    if (_3142)
    {
        float _3174 = _3172 * 0.15915493667125701904296875;
        _3154 = _3174;
    }
    float _3176 = _3154;
    float _3178 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3180 = fma(_3126, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3178);
    float _3182 = precise::clamp(_3180, 0.0, 1.0);
    float _3184 = _3162;
    float _3186 = _3176;
    if (_3142)
    {
        float _3188 = _3176 * 6.283185482025146484375;
        float _3190 = sin(_3188);
        _3184 = _3190;
    }
    float _3192 = _3184;
    float _3194 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3196 = precise::max(0.0, _3194);
    float _3198 = _3114;
    float _3200 = _3196;
    if (_3142)
    {
        float _3202 = _3176 * 6.283185482025146484375;
        float _3204 = cos(_3202);
        _3198 = _3204;
    }
    float _3206 = _3198;
    float _3208 = -_3128;
    float _3210 = -_3196;
    float _3212 = fma(_3106, _3208, _3210);
    if (!_3142)
    {
        _3156 = _3132;
    }
    float _3214 = _3156;
    float _3216 = _3214;
    if (_3142)
    {
        float _3218 = _3212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3200 = _3218;
    }
    float _3220 = _3200;
    float _3222 = _3192;
    float _3224 = _3220;
    if (_3142)
    {
        float _3226 = fma(_3192, _3220, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3222 = _3226;
    }
    float _3228 = _3222;
    float _3230 = _3228;
    float _3232 = _3206;
    if (_3142)
    {
        float _3234 = _3206 + (-1.0);
        _3224 = _3234;
    }
    float _3236 = _3224;
    float _3238 = _3236;
    if (_3142)
    {
        float _3240 = _3166 * _3228;
        _3158 = _3240;
    }
    float _3242 = _3158;
    if (!_3142)
    {
        _3168 = _3130;
    }
    float _3244 = _3168;
    float _3246 = _3244;
    if (_3142)
    {
        float _3248 = _3236 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3186 = _3248;
    }
    float _3250 = _3186;
    if (_3142)
    {
        float _3252 = _3130 * _3242;
        _3246 = _3252;
    }
    float _3254 = _3246;
    if (!_3142)
    {
        _3230 = _3212;
    }
    float _3256 = _3230;
    float _3258 = _3256;
    if (_3142)
    {
        float _3260 = _3132 * _3242;
        _3216 = _3260;
    }
    float _3262 = _3216;
    if (!_3142)
    {
        _3238 = _3134;
    }
    float _3264 = _3238;
    float _3266 = _3264;
    if (_3142)
    {
        float _3268 = fma(_3212, _3206, _3250);
        _3258 = _3268;
    }
    float _3270 = _3258;
    if (_3142)
    {
        float _3272 = _3254 * _3254;
        _3266 = _3272;
    }
    float _3274 = _3266;
    if (!_3142)
    {
        _3232 = _3136;
    }
    float _3276 = _3232;
    float _3278 = _3276;
    if (_3142)
    {
        float _3280 = _3262 * _3262;
        _3278 = _3280;
    }
    float _3282 = _3278;
    float _3284 = _2970 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3286 = fma(_3270, _3270, _3274);
    float _3288 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3284);
    float _3290 = _3286 + _3282;
    float _3292 = _2970 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3294 = _2970 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3296 = -_3182;
    float _3298 = _3296 + 1.0;
    float _3300 = rsqrt(_3290);
    float _3302 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3292);
    float _3304 = _2970 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3306 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3294);
    float _3308 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3288);
    float _3310 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3302);
    float _3312 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3304);
    float _3314 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3306);
    float _3316 = abs(_3298);
    float _3318 = log2(_3316);
    float _3320 = _3310 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3322 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3312);
    float _3324 = _3314 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3326 = _3308 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3328 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3330 = _3322 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3332 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3334 = _3300 * _3254;
    float _3336 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3328);
    float _3338 = _3300 * _3270;
    float _3340 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3342 = _3334 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3344 = _3300 * _3262;
    float _3346 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3336);
    float _3348 = -_3340;
    float _3350 = fma(_3348, _3116, 1.0);
    float _3352 = -_3342;
    float _3354 = fma(_3338, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3352);
    float _3356 = _3318 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3358 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3346);
    float _3360 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3362 = -_3344;
    float _3364 = fma(_3362, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3354);
    float _3366 = exp2(_3356);
    float _3368 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3332);
    float _3370 = _3338 + 1.0;
    float _3372 = fma(_3364, -0.5, 0.5);
    float _3374 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3368);
    float _3376 = log2(_3350);
    float _3378 = fma(_3364, 0.5, 0.5);
    float _3380 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3360);
    float _3382 = fma(_3378, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3384 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3380);
    float _3386 = 1.0 / _3358;
    float _3388 = -_3338;
    float _3390 = fma(_3366, _3370, _3388);
    float _3392 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3374);
    float _3394 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3384);
    float _3396 = fma(_3378, _3382, -0.212114393711090087890625);
    float _3398 = sqrt(_3372);
    float _3400 = _3376 * 0.693147182464599609375;
    float _3402 = fma(_3378, _3396, 1.570728778839111328125);
    float _3404 = _3400 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3406 = _3392 * _3386;
    float _3408 = _3394 * _3386;
    float _3410 = fma(_3406, 0.5, 0.5);
    float _3412 = fma(_3408, -0.5, 0.5);
    float _3414 = fma(_3390, 0.5, 0.5);
    float _3416 = _3398 * 0.636619746685028076171875;
    float3 _8677 = float3(_3410, _3412, _3404);
    float _3418 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8677, float3(0.0), isnan(_8677)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8677, float3(0.0), isnan(_8677)), level(0.0)).x;
    float _3420 = -_3402;
    float _3422 = fma(_3416, _3420, 1.0);
    float3 _8693 = float3(_3410, _3412, _3404);
    float4 _3425 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8693, float3(0.0), isnan(_8693)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8693, float3(0.0), isnan(_8693)), level(0.0)).xyzw;
    float _3427 = _3425.x;
    float _3429 = _3425.y;
    float _3431 = _3425.z;
    float _3433 = _3425.w;
    float2 _8710 = float2(_3422, _3414);
    float3 _3437 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8710, float2(0.0), isnan(_8710)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8710, float2(0.0), isnan(_8710)), level(0.0)).xyz;
    float _3439 = _3437.x;
    float _3441 = _3437.y;
    float _3443 = _3437.z;
    float _3445 = _3318 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3447 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3449 = _3042 > 0.0;
    bool _3451 = isnan(_3042);
    bool _3453 = _3449 || _3451;
    bool _3455 = isnan(0.0);
    bool _3457 = _3453 || _3455;
    float _3459 = _3392 + _3358;
    float _3461 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3447);
    float _3463 = exp2(_3445);
    bool _3465 = _3102 <= 0.0;
    bool _3467 = !_3457;
    bool _3469 = _3465 || _3467;
    float _3471 = _3459 * 0.5;
    float _3473 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3461);
    float _3475 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3473);
    float _3477 = _3042 * _3102;
    float _3479 = _3358 * 0.5;
    float _3481 = _3475 + _3358;
    float _3483 = _3477 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _3392;
    out.gl_Position.y = _3394;
    out.gl_Position.z = _3475;
    out.gl_Position.w = _3358;
    float _3485 = _3481 * 0.5;
    float _3487 = -_3463;
    float _3489 = _3487 + 1.0;
    float _3491 = fma(_3394, -0.5, _3479);
    float _3493 = _3483 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3495 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3471;
    out.m_68.y = _3491;
    out.m_68.z = _3485;
    out.m_68.w = _3358;
    float _3497 = -_3495;
    float _3499 = _3497 + 1.0;
    out.m_45.x = _3493;
    float _3501 = _3495 * _3418;
    float _3503 = _3433 * _3501;
    float _3505 = _3433 * _3499;
    float _3507 = _3443 * _3501;
    float _3509 = fma(_3439, _3503, _3427);
    float _3511 = fma(_3441, _3503, _3429);
    float _3513 = fma(_3433, _3507, _3431);
    out.m_70.x = _3509;
    out.m_70.y = _3511;
    out.m_70.z = _3513;
    out.m_70.w = _3505;
    if (!_3469)
    {
        return out;
    }
    float _3515 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3515;
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
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    bool _815 = false;
    bool _699 = false;
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
        float _3572 = as_type<float>(_105);
        out.gl_Position.z = _3572;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_47.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = _123;
    if (_119)
    {
        float _127 = float(_89);
        _99 = _127;
    }
    float _129 = _99;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    float _137 = _129;
    if (_135)
    {
        _137 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _139 = _137;
    if (_135)
    {
        out.m_45.x = 0.0;
    }
    if (_135)
    {
        float _141 = _139 * 5.0;
        _107 = as_type<int>(_141);
    }
    int _143 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3642 = as_type<float>(_143);
        out.gl_Position.z = _3642;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        float _341 = exp2(_339);
        float _343 = _337 * 0.693147182464599609375;
        float _345 = 1.0 / _343;
        float _347 = 1.0 / _335;
        float _349 = _341 + (-1.0);
        float _351 = -_349;
        float _353 = fma(_351, _345, _123);
        float _355 = _353 * _347;
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
    float _429 = fma(_425, _161, _391);
    float _431 = fma(_425, _165, _395);
    bool _433 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _435 = fma(_387, _149, _169);
    float _437 = -_427;
    float _439 = _387 + _437;
    float _441 = fma(_385, _149, _167);
    float _443 = -_429;
    float _445 = _385 + _443;
    float _447 = -_431;
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
    bool _471 = !_433;
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
    float _511 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _513 = _505 + _511;
    float _515 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _515;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _521 = _519 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _523 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _525 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _523;
    bool _527 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _529 = isnan(_505);
    bool _531 = _527 || _529;
    bool _533 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _535 = _531 || _533;
    float _537 = float(_535);
    float _539 = 1.0 / _517;
    bool _541 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _543 = -_537;
    float _545 = _543 + 1.0;
    float _547 = 1.0 / _521;
    float _549 = 1.0 / _525;
    float _551 = _509 * _539;
    float _553 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _555 = _505 + _553;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _559 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _557;
    float _561 = _555 * _547;
    float _563 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _565 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _563;
    float _567 = fma(_559, _551, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _571 = _569 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _573 = fma(_565, _551, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _575 = _513 * _549;
    bool _577 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _579 = isnan(_505);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    bool _589 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _591 = isnan(_505);
    bool _593 = _589 || _591;
    bool _595 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _597 = _593 || _595;
    float _599 = float(_597);
    float _601 = _587 * _545;
    bool _603 = _505 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _605 = isnan(_505);
    bool _607 = _603 || _605;
    bool _609 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _611 = _607 || _609;
    float _613 = float(_611);
    float _615 = -_587;
    float _617 = _615 + 1.0;
    float _619 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _621 = _619 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _623 = -_599;
    float _625 = _623 + 1.0;
    float _627 = _599 * _617;
    float _629 = fma(_621, _561, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _631 = fma(_571, _561, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _633 = _613 * _625;
    float _635 = in.m_52.x;
    float _637 = in.m_52.y;
    float _639 = -_613;
    float _641 = _639 + 1.0;
    float _643 = _567 * _633;
    float _645 = _573 * _633;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _647;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _651;
    float _655 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].x, _643);
    float _657 = fma(_641, (*spvDescriptorSet0.vp_c9)._m0[143].y, _645);
    float _659 = fma(_649, _575, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _661 = fma(_653, _575, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _663 = fma(_629, _627, _655);
    float _665 = fma(_631, _627, _657);
    float _667 = fma(_659, _601, _663);
    float _669 = fma(_661, _601, _665);
    float _671 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[146].x, _667);
    float _673 = fma(_537, (*spvDescriptorSet0.vp_c9)._m0[146].y, _669);
    float _675 = _671 * _635;
    float _677 = _673 * _637;
    bool _679 = !_541;
    float _697;
    if (!_679)
    {
        float _681 = in.m_54.x;
        float _683 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _685 = _681 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _687 = fma(_685, (*spvDescriptorSet0.vp_c9)._m0[11].y, _123);
        float _689 = _687 * _683;
        float _691 = floor(_689);
        float _693 = -_691;
        float _695 = _689 + _693;
        _697 = _695;
        _699 = true;
    }
    else
    {
        float _701 = float(_89);
        float _703 = 1.0 / _701;
        float _705 = _123 * _703;
        _697 = _705;
    }
    _699 = false;
    float _707 = _697;
    bool _709 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _711 = isnan(_707);
    bool _713 = _709 || _711;
    bool _715 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _717 = _713 || _715;
    float _719 = float(_717);
    float _721 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _723 = _721 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _725 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _727 = isnan(_707);
    bool _729 = _725 || _727;
    bool _731 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _733 = _729 || _731;
    float _735 = float(_733);
    float _737 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _737;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _743 = _707 + _741;
    float _745 = -_719;
    float _747 = _745 + 1.0;
    bool _749 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _751 = 1.0 / _723;
    float _753 = _735 * _747;
    float _755 = -_735;
    float _757 = _755 + 1.0;
    float _759 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _761 = _739 * _751;
    float _763 = fma(_761, _743, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _765 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _767 = _763 * _753;
    float _769 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _771 = fma(_757, (*spvDescriptorSet0.vp_c9)._m0[115].x, _767);
    float _773 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[116].x, _771);
    float _775 = _769 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _777 = _765 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _779 = _759 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _781 = _773 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_56.x = _775;
    out.m_56.y = _777;
    out.m_56.z = _779;
    out.m_56.w = _781;
    bool _783 = !_749;
    float _785 = _781;
    float _809;
    float _811;
    float _813;
    if (!_783)
    {
        float _787 = in.m_54.x;
        float _789 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _791 = float(_89);
        float _793 = 1.0 / _791;
        float _795 = _787 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _797 = _123 * _793;
        float _799 = fma(_795, (*spvDescriptorSet0.vp_c9)._m0[11].z, _123);
        float _801 = _799 * _789;
        float _803 = floor(_801);
        float _805 = -_803;
        float _807 = _801 + _805;
        _809 = _797;
        _811 = _791;
        _785 = _789;
        _813 = _807;
        _815 = true;
    }
    else
    {
        float _817 = float(_89);
        float _819 = 1.0 / _817;
        float _821 = _123 * _819;
        _809 = _821;
        _811 = _817;
        _813 = _821;
    }
    _815 = false;
    float _823 = _809;
    float _825 = _811;
    float _827 = _785;
    float _829 = _813;
    float _831 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _833 = int(_831);
    float _835 = in.m_54.x;
    float _837 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _839 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _841 = _823 + _839;
    float _843 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _845 = _843 + (*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _847 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _849 = int(_847);
    float _851 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _853 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _851;
    float _855 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _857 = _855 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _859 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _861 = _859 + (*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _863 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[5].x, _837);
    float _865 = 1.0 / _825;
    float _867 = float(_833);
    float _869 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _871 = _869 + (*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[156].w;
    float _875 = _873 + (*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _877 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[5].z, _863);
    int _879 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _881 = _879 != 0;
    float _883 = 1.0 / _867;
    float _885 = float(uint(_849));
    float _887 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _889 = _887 + (*spvDescriptorSet0.vp_c9)._m0[158].w;
    int _891 = ~_849;
    int _893 = _891 + 1;
    float _895 = _877 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _897 = float(_849);
    float _899 = _675 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _901 = _849 == 0;
    float _903 = 1.0 / _885;
    bool _905 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[154].w;
    bool _907 = isnan(_823);
    bool _909 = _905 || _907;
    bool _911 = isnan((*spvDescriptorSet0.vp_c9)._m0[154].w);
    bool _913 = _909 || _911;
    float _915 = float(_913);
    float _917 = _827;
    float _919 = as_type<float>(_849);
    if (!_881)
    {
        float _921 = in.m_54.y;
        _917 = _921;
    }
    float _923 = _917;
    bool _925 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _927 = isnan(_829);
    bool _929 = _925 || _927;
    bool _931 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _933 = _929 || _931;
    float _935 = float(_933);
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _939 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _937;
    float _941 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _943 = _941 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _945 = _123 * _883;
    int _947 = ~_849;
    int _949 = _947 + 1;
    float _951 = 1.0 / _845;
    bool _953 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[153].w;
    bool _955 = isnan(_823);
    bool _957 = _953 || _955;
    bool _959 = isnan((*spvDescriptorSet0.vp_c9)._m0[153].w);
    bool _961 = _957 || _959;
    float _963 = float(_961);
    float _965 = -_915;
    float _967 = _965 + 1.0;
    bool _969 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[152].w;
    bool _971 = isnan(_823);
    bool _973 = _969 || _971;
    bool _975 = isnan((*spvDescriptorSet0.vp_c9)._m0[152].w);
    bool _977 = _973 || _975;
    float _979 = float(_977);
    bool _981 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[151].w;
    bool _983 = isnan(_823);
    bool _985 = _981 || _983;
    bool _987 = isnan((*spvDescriptorSet0.vp_c9)._m0[151].w);
    bool _989 = _985 || _987;
    float _991 = float(_989);
    int _993 = as_type<int>(_903) + (-2);
    float _995 = trunc(_945);
    int _997 = int(_995);
    float _999 = 1.0 / _853;
    float _1001 = _883;
    if (!_881)
    {
        _1001 = _923;
    }
    float _1003 = _1001;
    float _1005 = float(uint(_997));
    float _1007 = _1003;
    int _1009 = as_type<int>(_923);
    if (_881)
    {
        float _1011 = in.m_54.x;
        float _1013 = in.m_54.y;
        _1007 = _1011;
        _1009 = as_type<int>(_1013);
    }
    float _1015 = _1007;
    int _1017 = _1009;
    float _1019 = 1.0 / _857;
    float _1021 = as_type<float>(_993) * _1005;
    float _1023 = trunc(_1021);
    float _1025 = precise::max(_1023, 0.0);
    uint _1028 = uint(_1025);
    float _1030 = 1.0 / _861;
    bool _1032 = !_881;
    float _1034 = _1032 ? as_type<float>(_1017) : _835;
    int _1036 = _949 * int(_1028);
    int _1038 = _1036 + _997;
    float _1040 = 1.0 / _871;
    float _1042 = float(uint(_1038));
    float _1044 = 1.0 / _875;
    float _1046 = as_type<float>(_993) * _1042;
    bool _1048 = !_881;
    float _1050 = _1048 ? 1.2345600128173828125 : 1.0;
    float _1052 = float(_997);
    float _1054 = _1050 * _1034;
    float _1056 = trunc(_1046);
    float _1058 = precise::max(_1056, 0.0);
    uint _1060 = uint(_1058);
    bool _1062 = _1052 >= _897;
    bool _1064 = isnan(_1052);
    bool _1066 = _1062 || _1064;
    bool _1068 = isnan(_897);
    bool _1070 = _1066 || _1068;
    float _1072 = float(_1070);
    float _1074 = floor(_1054);
    int _1076 = int(_1028) + int(_1060);
    float _1078 = trunc(_1072);
    int _1080 = int(_1078);
    float _1082 = _123 * _897;
    int _1084 = _893 * _1076;
    int _1086 = _1084 + _997;
    float _1088 = _1082 * _865;
    int _1090 = _849 + (-1);
    float _1092 = 1.0 / _889;
    bool _1094 = uint(_1086) >= uint(_849);
    bool _1096 = !_1094;
    int _1098 = _1096 ? 0 : (-1);
    float _1100 = trunc(_1088);
    int _1102 = int(_1100);
    int _1104 = ~_1076;
    int _1106 = _1104 + _1098;
    int _1108 = _1106 + 1;
    float _1110 = -_1074;
    float _1112 = _1054 + _1110;
    int _1114 = ~_1080;
    int _1116 = _1114 + 1;
    int _1118 = _1116 + 1;
    int _1120 = _849 * _1108;
    int _1122 = _1120 + _997;
    float _1124 = _897 * _1112;
    int _1126 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _1128 = _1126 != 0;
    float _1130 = trunc(_1124);
    int _1132 = int(_1130);
    bool _1134 = !_901;
    int _1136 = _1134 ? _1122 : (-1);
    int _1138 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1140 = _1138 != 0;
    int _1142 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1144 = _1142 != 0;
    int _1146 = _1118 * _1136;
    bool _1148 = !_1128;
    int _1150 = _1148 ? 0 : 1;
    int _1152 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1154 = _1152 != 0;
    int _1156 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1158 = _1156 != 0;
    int _1160 = _1080 * _1090;
    int _1162 = _1160 + _1146;
    bool _1164 = !_1144;
    int _1166 = _1164 ? 0 : 1;
    bool _1168 = !_1140;
    int _1170 = _1168 ? 0 : 1;
    int _1172 = abs(_1150);
    int _1174 = abs(_1166);
    bool _1176 = !_1154;
    int _1178 = _1176 ? 0 : 1;
    int _1180 = abs(_1170);
    int _1182 = _1162 * _1174;
    bool _1184 = !_1158;
    int _1186 = _1184 ? 0 : 1;
    int _1188 = abs(_1178);
    int _1190 = _1132 * _1172;
    int _1192 = _1190 + _997;
    int _1194 = abs(_1186);
    int _1196 = _1102 * _1180;
    int _1198 = _1196 + _1182;
    int _1200 = ~_849;
    int _1202 = _1200 + 1;
    int _1204 = _1192 * _1188;
    int _1206 = _1204 + _1198;
    int _1208 = ~_849;
    int _1210 = _1208 + 1;
    float _1212 = in.m_54.z;
    int _1214 = _1132 * _1194;
    int _1216 = _1214 + _1206;
    float _1218 = float(uint(_1216));
    float _1220 = as_type<float>(_993) * _1218;
    float _1222 = trunc(_1220);
    float _1224 = precise::max(_1222, 0.0);
    uint _1226 = uint(_1224);
    int _1228 = _1210 * int(_1226);
    int _1230 = _1228 + _1216;
    float _1232 = float(uint(_1230));
    float _1234 = as_type<float>(_993) * _1232;
    float _1236 = trunc(_1234);
    float _1238 = precise::max(_1236, 0.0);
    uint _1240 = uint(_1238);
    float _1242 = _835 * 2.0;
    float _1244 = floor(_1242);
    int _1246 = int(_1226) + int(_1240);
    float _1248 = in.m_54.w;
    int _1250 = _1202 * _1246;
    int _1252 = _1250 + _1216;
    float _1254 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1256 = log2(_1254);
    bool _1258 = uint(_1252) >= uint(_849);
    bool _1260 = !_1258;
    int _1262 = _1260 ? 0 : (-1);
    bool _1264 = _1244 >= 0.0;
    bool _1266 = isnan(_1244);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan(0.0);
    bool _1272 = _1268 || _1270;
    int _1274 = ~_1246;
    int _1276 = _1274 + _1262;
    int _1278 = _1276 + 1;
    int _1280 = _1272 ? 0 : 1;
    int _1282 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1284 = _1282 != 0;
    int _1286 = _849 * _1278;
    int _1288 = _1286 + _1216;
    float _1290 = _123 * _1256;
    bool _1292 = _1248 > 0.5;
    bool _1294 = !_901;
    int _1296 = _1294 ? _1288 : (-1);
    float _1298 = -_225;
    int _1300 = _1292 ? as_type<int>(_1298) : as_type<int>(_225);
    float _1302 = exp2(_1290);
    int _1304 = _1296 & 3;
    bool _1306 = _1304 != 0;
    int _1308 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1310 = _1308 != 0;
    bool _1312 = uint(_1304) > 1u;
    int _1314 = _1306 ? 0 : 1;
    bool _1316 = _1212 > 0.5;
    int _1318 = ~_1314;
    int _1320 = _1318 + 1;
    int _1322 = _1320 + 1;
    float _1324 = -_221;
    int _1326 = _1316 ? as_type<int>(_1324) : as_type<int>(_221);
    bool _1328 = _1244 > 0.0;
    float _1330 = -_1302;
    float _1332 = _1330 + 1.0;
    int _1334 = ~_1280;
    int _1336 = _1334 + 1;
    int _1338 = _1336 + 1;
    int _1340 = _1322;
    int _1342 = _1338;
    if (!_1312)
    {
        int _1344 = ~_1314;
        int _1346 = _1344 + 1;
        _1340 = _1346;
    }
    int _1348 = _1340;
    bool _1350 = _835 > 0.5;
    bool _1352 = !_1310;
    float _1354 = _1352 ? _221 : as_type<float>(_1326);
    float _1356 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1358 = _1356 + (*spvDescriptorSet0.vp_c9)._m0[155].w;
    int _1360 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1362 = _1360 != 0;
    int _1364 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1366 = _1364 != 0;
    int _1368 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1370 = _1368 != 0;
    float _1372 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1374 = _1372 + (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1376 = !_1284;
    float _1378 = _1376 ? _225 : as_type<float>(_1300);
    float _1380 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    if (!_1328)
    {
        int _1382 = ~_1280;
        int _1384 = _1382 + 1;
        _1342 = _1384;
    }
    int _1386 = _1342;
    float _1388 = 1.0 / _1358;
    int _1390 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _1392 = _1390 != 0;
    float _1394 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    int _1396 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1398 = _1396 != 0;
    float _1400 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1380);
    int _1402 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1404 = _1402 != 0;
    float _1406 = _1212 * 2.0;
    float _1408 = 1.0 / _1374;
    float _1410 = -_221;
    int _1412 = _1350 ? as_type<int>(_1410) : as_type<int>(_221);
    float _1414 = fma(_441, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1394);
    int _1416 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1418 = _1416 != 0;
    float _1420 = -(*spvDescriptorSet0.vp_c9)._m0[151].x;
    float _1422 = (*spvDescriptorSet0.vp_c9)._m0[152].x + _1420;
    float _1424 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1400);
    float _1426 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1428 = _829 + _1426;
    float _1430 = floor(_1406);
    float _1432 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1434 = _829 + _1432;
    float _1436 = _1422 * _951;
    float _1438 = _1428 * _999;
    float _1440 = _1434 * _1019;
    float _1442 = -(*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1444 = (*spvDescriptorSet0.vp_c9)._m0[154].x + _1442;
    float _1446 = -(*spvDescriptorSet0.vp_c9)._m0[154].x;
    float _1448 = _1446 + (*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1450 = -(*spvDescriptorSet0.vp_c9)._m0[155].x;
    float _1452 = (*spvDescriptorSet0.vp_c9)._m0[156].x + _1450;
    float _1454 = -(*spvDescriptorSet0.vp_c9)._m0[152].x;
    float _1456 = _1454 + (*spvDescriptorSet0.vp_c9)._m0[153].x;
    float _1458 = _1444 * _1030;
    float _1460 = _1448 * _1388;
    float _1462 = 0.0;
    if (!_1418)
    {
        _1462 = _1212;
    }
    float _1464 = _1462;
    float _1466 = _1452 * _1408;
    float _1468 = 0.0;
    float _1470 = _1464;
    if (!_1418)
    {
        _1468 = _1212;
    }
    float _1472 = _1468;
    float _1474 = _1456 * _1040;
    float _1476 = _1472;
    if (_1418)
    {
        _1470 = as_type<float>(_1017);
    }
    float _1478 = _1470;
    float _1480 = -(*spvDescriptorSet0.vp_c9)._m0[156].x;
    float _1482 = _1480 + (*spvDescriptorSet0.vp_c9)._m0[157].x;
    if (_1418)
    {
        _1476 = as_type<float>(_1017);
    }
    float _1484 = _1476;
    float _1486 = fma(_457, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1414);
    float _1488 = _1482 * _1044;
    bool _1490 = _1430 >= 0.0;
    bool _1492 = isnan(_1430);
    bool _1494 = _1490 || _1492;
    bool _1496 = isnan(0.0);
    bool _1498 = _1494 || _1496;
    float _1500 = -(*spvDescriptorSet0.vp_c9)._m0[151].w;
    float _1502 = _823 + _1500;
    float _1504 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1506 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1504;
    int _1508 = _1498 ? 0 : 1;
    float _1510 = fma(_1436, _1502, (*spvDescriptorSet0.vp_c9)._m0[151].x);
    bool _1512 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1514 = isnan(0.0);
    bool _1516 = _1512 || _1514;
    bool _1518 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1520 = _1516 || _1518;
    float _1522 = -(*spvDescriptorSet0.vp_c9)._m0[157].x;
    float _1524 = (*spvDescriptorSet0.vp_c9)._m0[158].x + _1522;
    float _1526 = fma(_1506, _1438, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1528 = _1520 ? _1332 : 0.0;
    float _1530 = -(*spvDescriptorSet0.vp_c9)._m0[153].w;
    float _1532 = _823 + _1530;
    bool _1534 = _1430 > 0.0;
    float _1536 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1538 = _1536 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1540 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1542 = _1540 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1544 = fma(_1458, _1532, (*spvDescriptorSet0.vp_c9)._m0[153].x);
    float _1546 = _1524 * _1092;
    float _1548 = -(*spvDescriptorSet0.vp_c9)._m0[155].w;
    float _1550 = _823 + _1548;
    float _1552 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1554 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1552;
    float _1556 = fma(_1538, _1440, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1558 = fma(_943, _1440, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    bool _1560 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[158].w;
    bool _1562 = isnan(_823);
    bool _1564 = _1560 || _1562;
    bool _1566 = isnan((*spvDescriptorSet0.vp_c9)._m0[158].w);
    bool _1568 = _1564 || _1566;
    float _1570 = float(_1568);
    float _1572 = fma(_1542, _1440, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    bool _1574 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[157].w;
    bool _1576 = isnan(_823);
    bool _1578 = _1574 || _1576;
    bool _1580 = isnan((*spvDescriptorSet0.vp_c9)._m0[157].w);
    bool _1582 = _1578 || _1580;
    float _1584 = float(_1582);
    float _1586 = fma(_939, _1438, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1588 = -(*spvDescriptorSet0.vp_c9)._m0[154].w;
    float _1590 = _823 + _1588;
    float _1592 = fma(_1466, _1550, (*spvDescriptorSet0.vp_c9)._m0[155].x);
    float _1594 = fma(_1554, _1438, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1596 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[156].w;
    bool _1598 = isnan(_823);
    bool _1600 = _1596 || _1598;
    bool _1602 = isnan((*spvDescriptorSet0.vp_c9)._m0[156].w);
    bool _1604 = _1600 || _1602;
    float _1606 = float(_1604);
    float _1608 = -_1570;
    float _1610 = _1608 + 1.0;
    float _1612 = -(*spvDescriptorSet0.vp_c9)._m0[152].w;
    float _1614 = _823 + _1612;
    float _1616 = fma(_1460, _1590, (*spvDescriptorSet0.vp_c9)._m0[154].x);
    float _1618 = -_1584;
    float _1620 = _1618 + 1.0;
    bool _1622 = _823 >= (*spvDescriptorSet0.vp_c9)._m0[155].w;
    bool _1624 = isnan(_823);
    bool _1626 = _1622 || _1624;
    bool _1628 = isnan((*spvDescriptorSet0.vp_c9)._m0[155].w);
    bool _1630 = _1626 || _1628;
    float _1632 = float(_1630);
    float _1634 = _1584 * _1610;
    float _1636 = -_1606;
    float _1638 = _1636 + 1.0;
    float _1640 = fma(_1474, _1614, (*spvDescriptorSet0.vp_c9)._m0[152].x);
    float _1642 = _1606 * _1620;
    bool _1644 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1646 = isnan(_829);
    bool _1648 = _1644 || _1646;
    bool _1650 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1652 = _1648 || _1650;
    float _1654 = float(_1652);
    float _1656 = fma(_1488, _841, (*spvDescriptorSet0.vp_c9)._m0[156].x);
    bool _1658 = _829 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1660 = isnan(_829);
    bool _1662 = _1658 || _1660;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1666 = _1662 || _1664;
    float _1668 = float(_1666);
    float _1670 = _1632 * _1638;
    float _1672 = -_1632;
    float _1674 = _1672 + 1.0;
    float _1676 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1678 = 1.0 + _1676;
    float _1680 = _1015 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _1682 = -_1668;
    float _1684 = _1682 + 1.0;
    float _1686 = _915 * _1674;
    float _1688 = _963 * _967;
    float _1690 = -_963;
    float _1692 = _1690 + 1.0;
    float _1694 = 1.0 / _1678;
    float _1696 = _935 * _1684;
    float _1698 = -_935;
    float _1700 = _1698 + 1.0;
    float _1702 = _979 * _1692;
    float _1704 = -_979;
    float _1706 = _1704 + 1.0;
    float _1708 = -(*spvDescriptorSet0.vp_c9)._m0[157].w;
    float _1710 = _823 + _1708;
    float _1712 = _1654 * _1700;
    float _1714 = _1478 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1716 = _991 * _1706;
    float _1718 = fma(_1546, _1710, (*spvDescriptorSet0.vp_c9)._m0[157].x);
    float _1720 = _1526 * _1712;
    float _1722 = _1586 * _1712;
    float _1724 = _1594 * _1712;
    float _1726 = _1510 * _1716;
    float _1728 = -_1654;
    float _1730 = _1728 + 1.0;
    float _1732 = _1528 * _1694;
    float _1734 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1720);
    float _1736 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1722);
    float _1738 = fma(_1730, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1724);
    float _1740 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _1742 = -_991;
    float _1744 = _1742 + 1.0;
    float _1746 = fma(_1558, _1696, _1736);
    float _1748 = fma(_1015, (*spvDescriptorSet0.vp_c9)._m0[83].z, _1740);
    int _1750 = ~_1508;
    int _1752 = _1750 + 1;
    int _1754 = _1752 + 1;
    float _1756 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[151].x, _1726);
    int _1758 = _1754;
    if (!_1534)
    {
        int _1760 = ~_1508;
        int _1762 = _1760 + 1;
        _1758 = _1762;
    }
    int _1764 = _1758;
    float _1766 = fma(_1556, _1696, _1734);
    float _1768 = fma(_1572, _1696, _1738);
    float _1770 = as_type<float>(_1017) * 2.0;
    float _1772 = fma(_1640, _1702, _1756);
    float _1774 = _835 + as_type<float>(_1017);
    float _1776 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _1778 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _1780 = floor(_1770);
    float _1782 = _1774 + (-1.0);
    float _1784 = fma(_1714, -2.0, _1778);
    float _1786 = float(uint(_1192));
    float _1788 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _1790 = -_1776;
    float _1792 = fma(_1680, 2.0, _1790);
    float _1794 = _1212 + as_type<float>(_1017);
    float _1796 = fma(_1544, _1688, _1772);
    float _1798 = fma(_1782, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1800 = fma(_1484, (*spvDescriptorSet0.vp_c9)._m0[83].w, _1788);
    float _1802 = _1354 + 0.5;
    float _1804 = -_123;
    float _1806 = fma(_1804, (*spvDescriptorSet0.vp_c9)._m0[81].x, _1792);
    float _1808 = as_type<float>(_993) * _1786;
    bool _1810 = !_1398;
    float _1812 = _1810 ? _221 : as_type<float>(_1412);
    float _1814 = _1794 + (-1.0);
    bool _1816 = as_type<float>(_1017) > 0.5;
    float _1818 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[125].z, _1768);
    bool _1820 = !_1362;
    int _1822 = _1820 ? 0 : 1;
    float _1824 = fma(_1802, (*spvDescriptorSet0.vp_c9)._m0[85].x, _1806);
    float _1826 = fma(_1814, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1828 = _1424 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1830 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1832 = _895 + _1830;
    float _1834 = -_225;
    int _1836 = _1816 ? as_type<int>(_1834) : as_type<int>(_225);
    float _1838 = trunc(_1808);
    float _1840 = precise::max(_1838, 0.0);
    uint _1842 = uint(_1840);
    bool _1844 = _1780 > 0.0;
    float _1846 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[125].y, _1746);
    bool _1848 = _1780 >= 0.0;
    bool _1850 = isnan(_1780);
    bool _1852 = _1848 || _1850;
    bool _1854 = isnan(0.0);
    bool _1856 = _1852 || _1854;
    float _1858 = _1486 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    bool _1860 = !_1366;
    int _1862 = _1860 ? 0 : 1;
    float _1864 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1866 = _1828 + _1864;
    int _1868 = abs(_1822);
    float _1870 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1872 = fma(_1668, (*spvDescriptorSet0.vp_c9)._m0[125].x, _1766);
    int _1874 = abs(_1862);
    float _1876 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1878 = _1858 + _1876;
    int _1880 = ~_849;
    int _1882 = _1880 + 1;
    float _1884 = fma(_1866, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1870);
    float _1886 = float(_1874);
    float _1888 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[81].y, _1784);
    float _1890 = float(_1386);
    float _1892 = fma(_1878, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1884);
    float _1894 = float(_1764);
    float _1896 = fma(_1616, _1686, _1796);
    float _1898 = in.m_58.x;
    float _1900 = in.m_58.y;
    float _1902 = in.m_58.z;
    float _1904 = _1886 * _1890;
    int _1906 = _1856 ? 0 : 1;
    float _1908 = _1812 + 0.5;
    int _1910 = _1882 * int(_1842);
    int _1912 = _1910 + _1192;
    bool _1914 = _1892 >= 0.0;
    float _1916 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].z, _1748);
    int _1918 = _1296 >> 31;
    float _1920 = _1908 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _1922 = float(uint(_1912));
    float _1924 = -_1916;
    float _1926 = _1924 + 1.0;
    int _1928 = _1918 & 3;
    float _1930 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _1932 = float(_1868);
    float _1934 = as_type<float>(_993) * _1922;
    int _1936 = _1296 + _1928;
    float _1938 = fma(_123, (*spvDescriptorSet0.vp_c9)._m0[82].w, _1800);
    float _1940 = -_1926;
    float _1942 = fma(_1354, _1940, _1824);
    float _1944 = _1932 * _1894;
    float _1946 = _1378 + (-0.5);
    int _1948 = _1936 >> 2;
    float _1950 = trunc(_1934);
    float _1952 = precise::max(_1950, 0.0);
    uint _1954 = uint(_1952);
    float _1956 = _1944 * (-2.0);
    float _1958 = -_1946;
    float _1960 = -_1888;
    float _1962 = fma(_1958, (*spvDescriptorSet0.vp_c9)._m0[85].y, _1960);
    int _1964 = ~_1906;
    int _1966 = _1964 + 1;
    int _1968 = _1966 + 1;
    float _1970 = -_1938;
    float _1972 = _1970 + 1.0;
    int _1974 = _1948 << 4;
    int _1976 = _1974 + 512;
    float _1978 = fma(_1798, _1956, _1798);
    int _1980 = _1968;
    if (!_1844)
    {
        int _1982 = ~_1906;
        int _1984 = _1982 + 1;
        _1980 = _1984;
    }
    int _1986 = _1980;
    float _1988 = fma(_1956, _1898, _1898);
    float _1990 = _1904 * (-2.0);
    float _1992 = _1920 * _1930;
    uint _1994 = uint(int(uint(_1976) >> uint(2)));
    uint _1996 = uint(int(uint(int(_1994)) >> uint(2)));
    int _1998 = int(_1994) & 3;
    float _2000 = (*spvDescriptorSet0.vp_c9)._m0[int(_1996)][_1998];
    int _2002 = int(_1994) + 1;
    uint _2004 = uint(int(uint(_2002) >> uint(2)));
    int _2006 = _2002 & 3;
    float _2008 = (*spvDescriptorSet0.vp_c9)._m0[int(_2004)][_2006];
    float _2010 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _2012 = fma(_1826, _1990, _1826);
    float _2014 = fma(_1990, _1900, _1900);
    float _2016 = fma(_1592, _1670, _1896);
    int _2018 = int(_1842) + int(_1954);
    float _2020 = fma(_1378, _1972, _1962);
    bool _2022 = !_1404;
    float _2024 = _2022 ? _225 : as_type<float>(_1836);
    int _2026 = _1976 + 8;
    uint _2028 = uint(int(uint(_2026) >> uint(2)));
    uint _2030 = uint(int(uint(int(_2028)) >> uint(2)));
    int _2032 = int(_2028) & 3;
    float _2034 = (*spvDescriptorSet0.vp_c9)._m0[int(_2030)][_2032];
    int _2036 = int(_2028) + 1;
    uint _2038 = uint(int(uint(_2036) >> uint(2)));
    int _2040 = _2036 & 3;
    float _2042 = (*spvDescriptorSet0.vp_c9)._m0[int(_2038)][_2040];
    bool _2044 = uint(_1304) >= 2u;
    float _2046 = _1818 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    int _2048 = ~_849;
    int _2050 = _2048 + 1;
    float _2052 = -_2024;
    float _2054 = _2052 + 0.5;
    int _2056 = _2044 ? 0 : 1;
    float _2058 = _1846 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _2060 = _1304 != 3;
    float _2062 = _2054 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    int _2064 = ~_2056;
    int _2066 = _2064 + 1;
    int _2068 = _2066 + 1;
    float _2070 = _1872 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2072 = _2062 * _2010;
    int _2074 = _2050 * _2018;
    int _2076 = _2074 + _1192;
    float _2078 = _2070 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2080 = _2058 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2082 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _2084 = _2046 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    int _2086 = abs(_1348);
    float _2088 = fma(_1656, _1642, _2016);
    int _2090 = _2068;
    if (_2060)
    {
        int _2092 = ~_2056;
        int _2094 = _2092 + 1;
        _2090 = _2094;
    }
    int _2096 = _2090;
    out.m_60.x = _1992;
    out.m_60.y = _2072;
    out.m_60.z = _1942;
    out.m_60.w = _2020;
    int _2098 = _1296 & 3;
    bool _2100 = _2098 != 0;
    float _2102 = fma(_1718, _1634, _2088);
    int _2104 = abs(_2096);
    out.m_62.x = _2078;
    out.m_62.y = _2080;
    out.m_62.z = _2084;
    out.m_62.w = _2082;
    bool _2106 = !_2100;
    int _2108 = _2106 ? 0 : 1;
    float _2110 = fma(_1570, (*spvDescriptorSet0.vp_c9)._m0[158].x, _2102);
    bool _2112 = uint(_2076) >= uint(_849);
    if (_1914)
    {
        out.m_45.x = 0.0;
    }
    int _2114 = abs(_2108);
    float _2116 = as_type<float>(_1017) + (-0.5);
    bool _2118 = !_2112;
    int _2120 = _2118 ? 0 : (-1);
    out.m_64.x = _2110;
    bool _2122 = _1304 != 3;
    float _2124 = _835 + (-0.5);
    int _2126 = ~_2018;
    int _2128 = _2126 + _2120;
    int _2130 = _2128 + 1;
    float _2132 = fma(_2124, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1988);
    int _2134 = ~_2086;
    int _2136 = _2134 + 1;
    int _2138 = _2136 + 1;
    bool _2140 = !_2122;
    int _2142 = _2140 ? 0 : (-1);
    int _2144 = _849 * _2130;
    int _2146 = _2144 + _1192;
    int _2148 = ~_2114;
    int _2150 = _2148 + 1;
    int _2152 = _2150 + 1;
    int _2154 = _2138 * as_type<int>(_2008);
    bool _2156 = !_1392;
    int _2158 = _2156 ? 0 : 1;
    int _2160 = abs(_2142);
    int _2162 = _2152 * as_type<int>(_2000);
    int _2164 = _2162 + _2154;
    int _2166 = abs(_2158);
    float _2168 = _1832 * _1832;
    int _2170 = ~_2104;
    int _2172 = _2170 + 1;
    int _2174 = _2172 + 1;
    int _2176 = ~_2160;
    int _2178 = _2176 + 1;
    int _2180 = _2178 + 1;
    float _2182 = fma(_1866, _1866, _2168);
    bool _2184 = _849 == 0;
    int _2186 = _2174 * as_type<int>(_2034);
    int _2188 = _2186 + _2164;
    int _2190 = ~_2166;
    int _2192 = _2190 + 1;
    int _2194 = _2192 + 1;
    float _2196 = fma(_1878, _1878, _2182);
    float _2198 = as_type<float>(_2164);
    if (_1914)
    {
        _2198 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2200 = _2198;
    int _2202 = _2180 * as_type<int>(_2042);
    int _2204 = _2202 + _2188;
    bool _2206 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2208 = isnan(1.0);
    bool _2210 = _2206 || _2208;
    bool _2212 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2214 = _2210 || _2212;
    float _2216 = rsqrt(_2196);
    int _2218 = _2194 * _2204;
    bool _2220 = !_2184;
    int _2222 = _2220 ? _2146 : (-1);
    int _2224 = as_type<int>(_2200);
    if (_1914)
    {
        float _2226 = _2200 * 5.0;
        _2224 = as_type<int>(_2226);
    }
    int _2228 = _2224;
    bool _2230 = !_2214;
    float _2232 = _2230 ? _123 : _1732;
    int _2234 = _2222 * _2166;
    int _2236 = _2234 + _2218;
    float _2238 = _899 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    bool _2240 = !_1370;
    int _2242 = _2240 ? 0 : 1;
    if (_1914)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _6840 = as_type<float>(_2228);
        out.gl_Position.z = _6840;
    }
    float _2244 = fma(_2232, _1978, _2132);
    float _2246 = float(_2236);
    float _2248 = _2238 * _2216;
    out.m_66.y = _2246;
    float _2250 = _1866 * _2248;
    float _2252 = _1832 * _2248;
    int _2254 = abs(_2242);
    if (_1914)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2256 = -_2252;
    float _2258 = _895 + _2256;
    float _2260 = _1878 * _2248;
    float _2262 = -_2250;
    float _2264 = _1828 + _2262;
    float _2266 = -_2252;
    float _2268 = _1832 + _2266;
    float _2270 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2272 = _2258 + _2270;
    float _2274 = -_2260;
    float _2276 = _1858 + _2274;
    float _2278 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2280 = _2264 + _2278;
    float _2282 = float(_2254);
    float _2284 = _2272 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _2286 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2288 = _2276 + _2286;
    float _2290 = float(_1986);
    float _2292 = -_2250;
    float _2294 = _1866 + _2292;
    float _2296 = fma(_2280, (*spvDescriptorSet0.vp_c8)._m0[28].x, _2284);
    float _2298 = _2268 * _2268;
    float _2300 = fma(_2116, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2014);
    float _2302 = -_2260;
    float _2304 = _1878 + _2302;
    float _2306 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[28].z, _2296);
    float _2308 = fma(_2294, _2294, _2298);
    float _2310 = _2282 * _2290;
    float _2312 = _835 + _1212;
    float _2314 = fma(_2232, _2012, _2300);
    bool _2316 = _2306 >= 0.0;
    float _2318 = fma(_2304, _2304, _2308);
    float _2320 = _2312 + (-1.0);
    float _2322 = _2310 * (-2.0);
    float _2324 = _2244 * 0.15915493667125701904296875;
    float _2326 = _2314 * 0.15915493667125701904296875;
    float _2328 = fma(_2320, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2330 = fma(_2322, _1902, _1902);
    float _2332 = _1212 + (-0.5);
    float _2334 = _2324 * 6.283185482025146484375;
    float _2336 = sin(_2334);
    float _2338 = fma(_2328, _2322, _2328);
    int _2340 = as_type<int>(_2330);
    float _2342 = _2280;
    float _2344 = _2276;
    if (_2316)
    {
        _919 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _2346 = _919;
    float _2348 = fma(_2332, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2330);
    if (_2316)
    {
        out.m_45.x = 0.0;
    }
    float _2350 = _2324 * 6.283185482025146484375;
    float _2352 = cos(_2350);
    if (_2316)
    {
        float _2354 = _2346 * 5.0;
        _2340 = as_type<int>(_2354);
    }
    int _2356 = _2340;
    float _2358 = fma(_2232, _2338, _2348);
    if (_2316)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _7032 = as_type<float>(_2356);
        out.gl_Position.z = _7032;
    }
    float _2360 = _2358 * 0.15915493667125701904296875;
    float _2362 = _2326 * 6.283185482025146484375;
    float _2364 = sin(_2362);
    float _2366 = sqrt(_2318);
    float _2368 = _2326 * 6.283185482025146484375;
    float _2370 = cos(_2368);
    if (_2316)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2372 = _2360 * 6.283185482025146484375;
    float _2374 = cos(_2372);
    float _2376 = _2216 * _2366;
    float _2378 = _677 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2380 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _225);
    float _2382 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _221);
    float _2384 = _899 * _2376;
    float _2386 = _2376 * _2378;
    float _2388 = _2352 * _2370;
    float _2390 = _2360 * 6.283185482025146484375;
    float _2392 = sin(_2390);
    float _2394 = _2382 * _2384;
    float _2396 = _2380 * _2386;
    float _2398 = _2336 * _2364;
    float _2400 = _2352 * _2364;
    float _2402 = _2336 * _2370;
    float _2404 = _2376 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _2406 = _2404 * 0.5;
    float _2408 = _2374 * _2396;
    float _2410 = _2364 * _2374;
    float _2412 = _2370 * _2374;
    float _2414 = _2352 * _2408;
    float _2416 = _2336 * _2408;
    float _2418 = fma(_2392, _2388, _2398);
    float _2420 = -_2396;
    float _2422 = _2392 * _2420;
    float _2424 = fma(_2392, _2398, _2388);
    float _2426 = fma(_2418, _2394, _2414);
    float _2428 = -_2402;
    float _2430 = fma(_2392, _2400, _2428);
    float _2432 = fma(_2412, _2394, _2422);
    float _2434 = -_2400;
    float _2436 = fma(_2392, _2402, _2434);
    float _2438 = fma(_2430, _2406, _2426);
    float _2440 = fma(_2410, _2406, _2432);
    float _2442 = fma(_2436, _2394, _2416);
    float _2444 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2446 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2448 = fma(_2424, _2406, _2442);
    float _2450 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2444);
    float _2452 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2446);
    float _2454 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2450);
    float _2456 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2452);
    float _2458 = _2454 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _2460 = _2456 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _2462 = _1858 + _2458;
    float _2464 = _1828 + _2460;
    float _2466 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2468 = _2462 + _2466;
    float _2470 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2472 = _2464 + _2470;
    float _2474 = _2468 * _2468;
    float _2476 = fma(_2472, _2472, _2474);
    float _2478 = _2438 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2480 = sqrt(_2476);
    float _2482 = fma(_2440, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2478);
    float _2484 = fma(_2448, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2482);
    float _2486 = _2484 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _2488 = _895 + _2486;
    bool _2490 = _2480 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2492 = _2478;
    float _2494 = _2448;
    float _2496 = _2464;
    float _2498 = _2408;
    float _2500 = _2426;
    if (!_2490)
    {
        _2492 = _2464;
    }
    float _2502 = _2492;
    float _2504 = _2502;
    if (!_2490)
    {
        _2494 = _2462;
    }
    float _2506 = _2494;
    float _2508 = _2506;
    if (!_2490)
    {
        _2496 = _2488;
    }
    float _2510 = _2496;
    bool _2512 = !_2490;
    float _2514 = _2510;
    if (!_2512)
    {
        float _2516 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2518 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2520 = _2480 + _2518;
        float _2522 = rsqrt(_2476);
        float _2524 = _2520 * _2516;
        float _2526 = _2488 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2528 = _2524 * 0.15915493667125701904296875;
        float _2530 = _2528 * 6.283185482025146484375;
        float _2532 = cos(_2530);
        float _2534 = _2528 * 6.283185482025146484375;
        float _2536 = sin(_2534);
        float _2538 = _2532 + (-1.0);
        float _2540 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2542 = fma(_2536, _2526, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2544 = fma(_2488, _2532, _2540);
        float _2546 = _2522 * _2542;
        float _2548 = fma(_2472, _2546, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2550 = fma(_2468, _2546, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2514 = _2544;
        _2504 = _2548;
        _2508 = _2550;
    }
    float _2552 = _2514;
    float _2554 = _2504;
    float _2556 = _2508;
    float _2558 = -_895;
    float _2560 = _2558 + _2552;
    float _2562 = -_1828;
    float _2564 = _2562 + _2554;
    float _2566 = -_1858;
    float _2568 = _2566 + _2556;
    float _2570 = _2560 * _2560;
    float _2572 = fma(_2564, _2564, _2570);
    float _2574 = fma(_2568, _2568, _2572);
    float _2576 = sqrt(_2574);
    bool _2578 = _2576 > 0.0;
    float _2580 = _2572;
    float _2582 = _2576;
    float _2584 = _2556;
    if (!_2578)
    {
        _2580 = _2554;
    }
    float _2586 = _2580;
    float _2588 = _2586;
    float _2590 = _2586;
    if (!_2578)
    {
        _2582 = _2552;
    }
    float _2592 = _2582;
    bool _2594 = !_2578;
    float _2596 = _2592;
    float _2598 = _2592;
    if (!_2594)
    {
        bool _2600 = 0.0 < (*spvDescriptorSet0.vp_c10)._m0[2].w;
        float _2602 = _2468;
        if (_2600)
        {
            float _2604 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].w;
            _2602 = _2604;
        }
        float _2606 = _2602;
        float _2608 = _2606;
        if (_2600)
        {
            float _2610 = _465 * _2606;
            _2498 = _2610;
        }
        float _2612 = _2498;
        float _2614 = _2612;
        if (_2600)
        {
            float _2616 = _467 * _2606;
            _2500 = _2616;
        }
        float _2618 = _2500;
        float _2620 = _2618;
        if (_2600)
        {
            float _2622 = _469 * _2606;
            _2608 = _2622;
        }
        float _2624 = _2608;
        float _2626 = _2624;
        if (!_2600)
        {
            bool _2628 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
            bool _2630 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
            bool _2632 = _2628 || _2630;
            bool _2634 = isnan(1.0);
            bool _2636 = _2632 || _2634;
            float _2638 = _123 + 1.0;
            if (!_2636)
            {
                float _2640 = _2638 * _2638;
                float _2642 = _2640 * 0.5;
                _125 = _2642;
            }
            float _2644 = _125;
            float _2646 = _2644;
            if (!_2636)
            {
                float _2648 = _2644 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2646 = _2648;
            }
            float _2650 = _2646;
            bool _2652 = !_2636;
            float _2654 = _2650;
            if (!_2652)
            {
                float _2656 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2658 = log2(_2656);
                float _2660 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2662 = 1.0 + _2660;
                float _2664 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2666 = _2658 * _2638;
                float _2668 = 1.0 / _2662;
                float _2670 = _2664 * 0.693147182464599609375;
                float _2672 = exp2(_2666);
                float _2674 = 1.0 / _2670;
                float _2676 = _2672 + (-1.0);
                float _2678 = -_2676;
                float _2680 = fma(_2678, _2674, _2638);
                float _2682 = _2680 * _2668;
                float _2684 = _2682 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
                _2654 = _2684;
            }
            float _2686 = _2654;
            float _2688 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
            float _2690 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
            float _2692 = _2686 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
            float _2694 = _2686;
            if (!_2636)
            {
                _2694 = _2638;
            }
            float _2696 = _2694;
            float _2698 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
            float _2700 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].x;
            float _2702 = _2688 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
            float _2704 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].y, _2698);
            float _2706 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2700);
            float _2708 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].y, _2704);
            bool _2710 = !_2636;
            float _2712 = _2696;
            _2588 = _2706;
            if (!_2710)
            {
                float _2714 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
                float _2716 = log2(_2714);
                float _2718 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
                float _2720 = 1.0 + _2718;
                float _2722 = 1.0 / _2720;
                float _2724 = _2716 * _2638;
                float _2726 = exp2(_2724);
                float _2728 = -_2726;
                float _2730 = _2728 + 1.0;
                float _2732 = _2730 * _2722;
                _2712 = _2732;
            }
            float _2734 = _2712;
            float _2736 = fma(_2690, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2702);
            float _2738 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2706);
            float _2740 = fma(_2734, _163, _2708);
            float _2742 = fma(_2692, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2736);
            float _2744 = fma(_2734, _161, _2738);
            float _2746 = -_427;
            float _2748 = _2746 + _2740;
            float _2750 = fma(_2734, _165, _2742);
            float _2752 = -_429;
            float _2754 = _2752 + _2744;
            float _2756 = _2748 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _2758 = _2748 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _2760 = _2748 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _2762 = -_431;
            float _2764 = _2762 + _2750;
            float _2766 = fma(_2754, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2756);
            float _2768 = fma(_2754, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2758);
            float _2770 = fma(_2754, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2760);
            float _2772 = fma(_2764, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2766);
            float _2774 = fma(_2764, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2768);
            float _2776 = fma(_2764, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2770);
            _473 = _2774;
            _475 = _2772;
            _477 = _2776;
            _2614 = _2772;
            _2620 = _2774;
            _2626 = _2776;
            _2596 = _2742;
        }
        float _2778 = _473;
        float _2780 = _475;
        float _2782 = _477;
        float _2784 = _2614;
        float _2786 = _2620;
        float _2788 = _2626;
        float _2790 = _2596;
        float _2792 = _2588;
        float _2794 = _2778 * _2778;
        float _2796 = rsqrt(_2574);
        float _2798 = fma(_2780, _2780, _2794);
        float _2800 = fma(_2782, _2782, _2798);
        float _2802 = sqrt(_2800);
        float _2804 = _2564 * _2796;
        float _2806 = _2560 * _2796;
        float _2808 = _2568 * _2796;
        bool _2810 = _2802 > 0.0;
        float _2812 = _2792;
        float _2814 = _2790;
        if (!_2810)
        {
            _2812 = _2554;
        }
        float _2816 = _2812;
        _2590 = _2816;
        if (!_2810)
        {
            _2814 = _2552;
        }
        float _2818 = _2814;
        bool _2820 = !_2810;
        _2598 = _2818;
        if (!_2820)
        {
            float _2822 = rsqrt(_2800);
            float _2824 = _2822 * _2778;
            float _2826 = _2822 * _2780;
            float _2828 = _2822 * _2782;
            float _2830 = _2806 * _2824;
            float _2832 = fma(_2804, _2826, _2830);
            float _2834 = fma(_2808, _2828, _2832);
            float _2836 = _2834 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2838 = fma(_2784, _2836, _2554);
            float _2840 = fma(_2786, _2836, _2552);
            float _2842 = fma(_2788, _2836, _2556);
            _2598 = _2840;
            _2584 = _2842;
            _2590 = _2838;
        }
    }
    float _2844 = _2598;
    float _2846 = _2584;
    float _2848 = _2590;
    float _2850 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    bool _2852 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _2854 = isnan(0.5);
    bool _2856 = _2852 || _2854;
    bool _2858 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2860 = _2856 || _2858;
    float _2862 = -_2252;
    float _2864 = _2862 + _2844;
    bool _2866 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _2868 = isnan(0.5);
    bool _2870 = _2866 || _2868;
    bool _2872 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2874 = _2870 || _2872;
    float _2876 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2850);
    float _2878 = -_2260;
    float _2880 = _2878 + _2846;
    float _2882 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2876);
    float _2884 = _2258 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2886 = _2882 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2888 = fma(_2264, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2884);
    float _2890 = 1.0 / _2886;
    float _2892 = fma(_2276, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2888);
    float _2894 = _2892 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2896 = _2894 + _2886;
    float _2898 = _2896 * _2890;
    float _2900 = _2898 * 0.5;
    float _2902 = -_2250;
    float _2904 = _2902 + _2848;
    float _2906 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2908 = fma(_2900, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2906);
    float _2910 = _2900;
    float _2912 = _2864;
    float _2914 = _2904;
    float _2916 = _2880;
    float _2918 = _2886;
    if (_2874)
    {
        _2910 = 1.0;
    }
    float _2920 = _2910;
    float _2922 = 1.0 / _2908;
    float _2924 = _2920;
    if (!_2860)
    {
        float _2926 = _2272 * _2272;
        float _2928 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2930 = -_1858;
        float _2932 = _2930 + _2846;
        float _2934 = -_1828;
        float _2936 = _2934 + _2848;
        float _2938 = fma(_2280, _2280, _2926);
        float _2940 = -_895;
        float _2942 = _2940 + _2844;
        float _2944 = fma(_2288, _2288, _2938);
        float _2946 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2948 = sqrt(_2944);
        float _2950 = _2928 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2952 = 1.0 / _2376;
        float _2954 = precise::min(_2948, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2956 = _2954 * _2946;
        float _2958 = _2956 * _2952;
        float _2960 = _2950 * _2958;
        float _2962 = _2932 * _2958;
        float _2964 = fma(_2936, _2960, _2264);
        float _2966 = fma(_2942, _2960, _2258);
        float _2968 = fma(_2950, _2962, _2276);
        _2912 = _2966;
        _2914 = _2964;
        _2916 = _2968;
        _2342 = _2948;
        _2918 = _2958;
    }
    float _2970 = _2912;
    float _2972 = _2914;
    float _2974 = _2916;
    float _2976 = _2342;
    float _2978 = _2918;
    float _2980 = _2978;
    float _2982 = _2976;
    if (_2874)
    {
        _2980 = 1.0;
    }
    float _2984 = _2980;
    float _2986 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2988 = _2922 * _2986;
    float _2990 = _2984;
    if (!_2874)
    {
        float _2992 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2994 = _2992 * 0.15915493667125701904296875;
        float _2996 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2998 = _2994 * 6.283185482025146484375;
        float _3000 = cos(_2998);
        float _3002 = _2996 * 0.15915493667125701904296875;
        float _3004 = _2994 * 6.283185482025146484375;
        float _3006 = sin(_3004);
        float _3008 = 1.0 / _3000;
        float _3010 = _3002 * 6.283185482025146484375;
        float _3012 = cos(_3010);
        float _3014 = _3006 * _3008;
        float _3016 = _3002 * 6.283185482025146484375;
        float _3018 = sin(_3016);
        float _3020 = _3012 * _3014;
        float _3022 = 1.0 / _3020;
        float _3024 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3026 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _3024;
        float _3028 = 1.0 / _3026;
        float _3030 = _3018 * _3022;
        float _3032 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _3034 = fma(_2988, _3030, _3032);
        float _3036 = _3034 * _3028;
        float _3038 = precise::clamp(_3036, 0.0, 1.0);
        _2344 = _3028;
        _2924 = _3038;
    }
    float _3040 = _2344;
    float _3042 = _2924;
    float _3044 = _3040;
    if (!_2874)
    {
        float _3046 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _3048 = _3046 * 0.15915493667125701904296875;
        float _3050 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _3052 = _3048 * 6.283185482025146484375;
        float _3054 = cos(_3052);
        float _3056 = _3050 * 0.15915493667125701904296875;
        float _3058 = _3048 * 6.283185482025146484375;
        float _3060 = sin(_3058);
        float _3062 = 1.0 / _3054;
        float _3064 = _3056 * 6.283185482025146484375;
        float _3066 = cos(_3064);
        float _3068 = _3060 * _3062;
        float _3070 = _3056 * 6.283185482025146484375;
        float _3072 = sin(_3070);
        float _3074 = _3066 * _3068;
        float _3076 = 1.0 / _3074;
        float _3078 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3080 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _3078;
        float _3082 = 1.0 / _3080;
        float _3084 = _3072 * _3076;
        float _3086 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _3088 = fma(_2988, _3084, _3086);
        float _3090 = _3088 * _3082;
        float _3092 = precise::clamp(_3090, 0.0, 1.0);
        float _3094 = -_3092;
        float _3096 = _3094 + 1.0;
        _2982 = _3084;
        _3044 = _3062;
        _2990 = _3096;
    }
    float _3098 = _2982;
    float _3100 = _3044;
    float _3102 = _2990;
    float _3104 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _3106 = _2970 + _3104;
    float _3108 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _3110 = _2972 + _3108;
    float _3112 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _3114 = _2974 + _3112;
    float _3116 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3118 = _3106 * _3106;
    float _3120 = fma(_3110, _3110, _3118);
    float _3122 = fma(_3114, _3114, _3120);
    float _3124 = rsqrt(_3122);
    float _3126 = sqrt(_3122);
    float _3128 = _3124 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _3130 = _3110 * _3128;
    float _3132 = _3114 * _3128;
    float _3134 = _3130 * _3130;
    float _3136 = _3132 * _3132;
    float _3138 = _3134 + _3136;
    float _3140 = sqrt(_3138);
    bool _3142 = _3140 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3144 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _3146 = _3140 + _3144;
    float _3148 = _3124;
    float _3150 = _3100;
    float _3152 = _3146;
    float _3154 = _3098;
    float _3156 = _3106;
    float _3158 = _3128;
    if (_3142)
    {
        float _3160 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3148 = _3160;
    }
    float _3162 = _3148;
    if (_3142)
    {
        float _3164 = rsqrt(_3138);
        _3150 = _3164;
    }
    float _3166 = _3150;
    float _3168 = _3166;
    if (_3142)
    {
        float _3170 = _3146 * _3162;
        _3152 = _3170;
    }
    float _3172 = _3152;
    if (_3142)
    {
        float _3174 = _3172 * 0.15915493667125701904296875;
        _3154 = _3174;
    }
    float _3176 = _3154;
    float _3178 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3180 = fma(_3126, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3178);
    float _3182 = precise::clamp(_3180, 0.0, 1.0);
    float _3184 = _3162;
    float _3186 = _3176;
    if (_3142)
    {
        float _3188 = _3176 * 6.283185482025146484375;
        float _3190 = sin(_3188);
        _3184 = _3190;
    }
    float _3192 = _3184;
    float _3194 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _3196 = precise::max(0.0, _3194);
    float _3198 = _3114;
    float _3200 = _3196;
    if (_3142)
    {
        float _3202 = _3176 * 6.283185482025146484375;
        float _3204 = cos(_3202);
        _3198 = _3204;
    }
    float _3206 = _3198;
    float _3208 = -_3128;
    float _3210 = -_3196;
    float _3212 = fma(_3106, _3208, _3210);
    if (!_3142)
    {
        _3156 = _3132;
    }
    float _3214 = _3156;
    float _3216 = _3214;
    if (_3142)
    {
        float _3218 = _3212 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3200 = _3218;
    }
    float _3220 = _3200;
    float _3222 = _3192;
    float _3224 = _3220;
    if (_3142)
    {
        float _3226 = fma(_3192, _3220, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _3222 = _3226;
    }
    float _3228 = _3222;
    float _3230 = _3228;
    float _3232 = _3206;
    if (_3142)
    {
        float _3234 = _3206 + (-1.0);
        _3224 = _3234;
    }
    float _3236 = _3224;
    float _3238 = _3236;
    if (_3142)
    {
        float _3240 = _3166 * _3228;
        _3158 = _3240;
    }
    float _3242 = _3158;
    if (!_3142)
    {
        _3168 = _3130;
    }
    float _3244 = _3168;
    float _3246 = _3244;
    if (_3142)
    {
        float _3248 = _3236 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _3186 = _3248;
    }
    float _3250 = _3186;
    if (_3142)
    {
        float _3252 = _3130 * _3242;
        _3246 = _3252;
    }
    float _3254 = _3246;
    if (!_3142)
    {
        _3230 = _3212;
    }
    float _3256 = _3230;
    float _3258 = _3256;
    if (_3142)
    {
        float _3260 = _3132 * _3242;
        _3216 = _3260;
    }
    float _3262 = _3216;
    if (!_3142)
    {
        _3238 = _3134;
    }
    float _3264 = _3238;
    float _3266 = _3264;
    if (_3142)
    {
        float _3268 = fma(_3212, _3206, _3250);
        _3258 = _3268;
    }
    float _3270 = _3258;
    if (_3142)
    {
        float _3272 = _3254 * _3254;
        _3266 = _3272;
    }
    float _3274 = _3266;
    if (!_3142)
    {
        _3232 = _3136;
    }
    float _3276 = _3232;
    float _3278 = _3276;
    if (_3142)
    {
        float _3280 = _3262 * _3262;
        _3278 = _3280;
    }
    float _3282 = _3278;
    float _3284 = _2970 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3286 = fma(_3270, _3270, _3274);
    float _3288 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3284);
    float _3290 = _3286 + _3282;
    float _3292 = _2970 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3294 = _2970 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3296 = -_3182;
    float _3298 = _3296 + 1.0;
    float _3300 = rsqrt(_3290);
    float _3302 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3292);
    float _3304 = _2970 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3306 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3294);
    float _3308 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3288);
    float _3310 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3302);
    float _3312 = fma(_2972, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3304);
    float _3314 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3306);
    float _3316 = abs(_3298);
    float _3318 = log2(_3316);
    float _3320 = _3310 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3322 = fma(_2974, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3312);
    float _3324 = _3314 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3326 = _3308 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3328 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3330 = _3322 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3332 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3334 = _3300 * _3254;
    float _3336 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3328);
    float _3338 = _3300 * _3270;
    float _3340 = _3326 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3342 = _3334 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3344 = _3300 * _3262;
    float _3346 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3336);
    float _3348 = -_3340;
    float _3350 = fma(_3348, _3116, 1.0);
    float _3352 = -_3342;
    float _3354 = fma(_3338, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3352);
    float _3356 = _3318 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3358 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3346);
    float _3360 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3362 = -_3344;
    float _3364 = fma(_3362, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3354);
    float _3366 = exp2(_3356);
    float _3368 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3332);
    float _3370 = _3338 + 1.0;
    float _3372 = fma(_3364, -0.5, 0.5);
    float _3374 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3368);
    float _3376 = log2(_3350);
    float _3378 = fma(_3364, 0.5, 0.5);
    float _3380 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3360);
    float _3382 = fma(_3378, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3384 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3380);
    float _3386 = 1.0 / _3358;
    float _3388 = -_3338;
    float _3390 = fma(_3366, _3370, _3388);
    float _3392 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3374);
    float _3394 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3384);
    float _3396 = fma(_3378, _3382, -0.212114393711090087890625);
    float _3398 = sqrt(_3372);
    float _3400 = _3376 * 0.693147182464599609375;
    float _3402 = fma(_3378, _3396, 1.570728778839111328125);
    float _3404 = _3400 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3406 = _3392 * _3386;
    float _3408 = _3394 * _3386;
    float _3410 = fma(_3406, 0.5, 0.5);
    float _3412 = fma(_3408, -0.5, 0.5);
    float _3414 = fma(_3390, 0.5, 0.5);
    float _3416 = _3398 * 0.636619746685028076171875;
    float3 _8677 = float3(_3410, _3412, _3404);
    float _3418 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8677, float3(0.0), isnan(_8677)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8677, float3(0.0), isnan(_8677)), level(0.0)).x;
    float _3420 = -_3402;
    float _3422 = fma(_3416, _3420, 1.0);
    float3 _8693 = float3(_3410, _3412, _3404);
    float4 _3425 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8693, float3(0.0), isnan(_8693)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8693, float3(0.0), isnan(_8693)), level(0.0)).xyzw;
    float _3427 = _3425.x;
    float _3429 = _3425.y;
    float _3431 = _3425.z;
    float _3433 = _3425.w;
    float2 _8710 = float2(_3422, _3414);
    float3 _3437 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8710, float2(0.0), isnan(_8710)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8710, float2(0.0), isnan(_8710)), level(0.0)).xyz;
    float _3439 = _3437.x;
    float _3441 = _3437.y;
    float _3443 = _3437.z;
    float _3445 = _3318 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3447 = _3320 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3449 = _3042 > 0.0;
    bool _3451 = isnan(_3042);
    bool _3453 = _3449 || _3451;
    bool _3455 = isnan(0.0);
    bool _3457 = _3453 || _3455;
    float _3459 = _3392 + _3358;
    float _3461 = fma(_3324, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3447);
    float _3463 = exp2(_3445);
    bool _3465 = _3102 <= 0.0;
    bool _3467 = !_3457;
    bool _3469 = _3465 || _3467;
    float _3471 = _3459 * 0.5;
    float _3473 = fma(_3326, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3461);
    float _3475 = fma(_3330, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3473);
    float _3477 = _3042 * _3102;
    float _3479 = _3358 * 0.5;
    float _3481 = _3475 + _3358;
    float _3483 = _3477 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    out.gl_Position.x = _3392;
    out.gl_Position.y = _3394;
    out.gl_Position.z = _3475;
    out.gl_Position.w = _3358;
    float _3485 = _3481 * 0.5;
    float _3487 = -_3463;
    float _3489 = _3487 + 1.0;
    float _3491 = fma(_3394, -0.5, _3479);
    float _3493 = _3483 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3495 = _3489 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_68.x = _3471;
    out.m_68.y = _3491;
    out.m_68.z = _3485;
    out.m_68.w = _3358;
    float _3497 = -_3495;
    float _3499 = _3497 + 1.0;
    out.m_45.x = _3493;
    float _3501 = _3495 * _3418;
    float _3503 = _3433 * _3501;
    float _3505 = _3433 * _3499;
    float _3507 = _3443 * _3501;
    float _3509 = fma(_3439, _3503, _3427);
    float _3511 = fma(_3441, _3503, _3429);
    float _3513 = fma(_3433, _3507, _3431);
    out.m_70.x = _3509;
    out.m_70.y = _3511;
    out.m_70.z = _3513;
    out.m_70.w = _3505;
    if (!_3469)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _3515 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_45.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3515;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

