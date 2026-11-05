#pragma clang diagnostic ignored "-Wmissing-prototypes"

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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c10 [[id(1)]];
    constant _16* vp_c8 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_C [[id(6)]];
    sampler vp_t_tcb_CSmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_32Smplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    sampler vp_t_tcb_1CSmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_59 [[user(locn0)]];
    float4 m_61 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_55 [[user(locn3)]];
    float4 m_75 [[user(locn4)]];
    float4 m_49 [[user(locn5)]];
    float4 m_83 [[user(locn6)]];
    float4 m_63 [[user(locn7)]];
    float4 m_65 [[user(locn8)]];
    float4 m_79 [[user(locn9)]];
    float4 m_81 [[user(locn10)]];
    float4 m_77 [[user(locn11)]];
    float4 m_85 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_69 [[attribute(1)]];
    float4 m_44 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_71 [[attribute(4)]];
    float4 m_53 [[attribute(6)]];
    float4 m_57 [[attribute(7)]];
    float4 m_67 [[attribute(8)]];
    float4 m_73 [[attribute(9)]];
};

static inline __attribute__((always_inline))
int _98(thread const int& _9611, thread const int& _9612, constant _10& support_buffer)
{
    float _9615 = as_type<float>(support_buffer._m4);
    int _9617 = _9612 + as_type<int>(_9615);
    int _9619 = 1 + _9617;
    float _9621 = support_buffer._m5[_9619].x;
    float _9623 = abs(_9621);
    bool _9625 = _9623 == 1.0;
    if (_9625)
    {
        return _9611;
    }
    float _9627 = float(_9611);
    float _9629 = _9627 / _9623;
    int _9631 = int(_9629);
    return _9631;
}

static inline __attribute__((always_inline))
int _99(thread const int& _9661, thread const int& _9662, constant _10& support_buffer)
{
    float _9665 = as_type<float>(support_buffer._m4);
    int _9667 = _9662 + as_type<int>(_9665);
    int _9669 = 1 + _9667;
    float _9671 = support_buffer._m5[_9669].x;
    bool _9673 = _9671 == 1.0;
    if (_9673)
    {
        return _9661;
    }
    float _9675 = float(_9661);
    float _9677 = _9675 * _9671;
    int _9679 = int(_9677);
    return _9679;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1971 = false;
    bool _1541 = false;
    bool _1445 = false;
    bool _1177 = false;
    bool _1005 = false;
    bool _725 = false;
    bool _403 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = in.m_46.w;
    float _107 = trunc(_103);
    int _109 = int(_107);
    float _111 = -_105;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _113;
    bool _117 = _109 >= 1;
    float _119 = 0.0;
    float _121 = as_type<float>(_109);
    float _123 = 0.0;
    float _125 = _113;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _119;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_117)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3800 = as_type<float>(_133);
        out.gl_Position.z = _3800;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _135 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_105);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = in.m_53.x;
    float _147 = float(_109);
    float _149 = in.m_53.w;
    bool _151 = _113 >= _147;
    bool _153 = !_143;
    bool _155 = _151 || _153;
    float _157 = in.m_53.y;
    float _159 = in.m_53.z;
    if (_155)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    int _163 = 0;
    if (_155)
    {
        float _165 = _161 * 5.0;
        _163 = as_type<int>(_165);
    }
    int _167 = _163;
    out.m_55.x = _145;
    out.m_55.w = _149;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3867 = as_type<float>(_167);
        out.gl_Position.z = _3867;
    }
    out.m_55.y = _157;
    out.m_55.z = _159;
    if (_155)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _171 = _113 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _173 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = _171 * _169;
    if (!_183)
    {
        float _187 = _173 * _173;
        float _189 = _187 * 0.5;
        _123 = _189;
    }
    float _191 = _123;
    float _193 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _185);
    float _195 = in.m_46.x;
    float _197 = in.m_46.y;
    float _199 = in.m_46.z;
    float _201 = _191;
    if (!_183)
    {
        float _203 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    float _207 = _193 * 6.283185482025146484375;
    float _209 = floor(_193);
    float _211 = _207 * 0.15915493667125701904296875;
    int _213 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _215 = _213 != 0;
    float _217 = _211 * 6.283185482025146484375;
    float _219 = cos(_217);
    float _221 = 1.4012984643248170709237295832899e-45;
    float _223 = _205;
    if (!_183)
    {
        _221 = _173;
    }
    float _225 = _221;
    float _227 = -_209;
    float _229 = _193 + _227;
    bool _231 = !_183;
    float _233 = _225;
    if (!_231)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = _173 * _237;
        float _247 = 1.0 / _241;
        float _249 = _243 * 0.693147182464599609375;
        float _251 = exp2(_245);
        float _253 = 1.0 / _249;
        float _255 = _251 + (-1.0);
        float _257 = -_255;
        float _259 = fma(_257, _253, _173);
        float _261 = _259 * _247;
        float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _263;
    }
    float _265 = _223;
    bool _267 = !_183;
    if (!_267)
    {
        float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = log2(_269);
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = 1.0 / _275;
        float _279 = _173 * _271;
        float _281 = exp2(_279);
        float _283 = -_281;
        float _285 = _283 + 1.0;
        float _287 = _285 * _277;
        _233 = _287;
    }
    float _289 = _233;
    float _291 = in.m_57.w;
    float _293 = in.m_44.x;
    float _295 = in.m_44.y;
    float _297 = in.m_44.z;
    bool _299 = _229 < 0.5;
    float _301 = float(_299);
    float _303 = -_229;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _309 = _307 != 0;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _313 = _311 != 0;
    float _315 = fma(_219, 0.5, 0.5);
    float _317 = -_301;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _321 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _323 = !_309;
    int _325 = _323 ? 0 : 1;
    float _327 = -_315;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _331 = !_215;
    int _333 = _331 ? 0 : 1;
    float _335 = fma(_289, _195, _321);
    int _337 = abs(_325);
    int _339 = abs(_333);
    float _341 = 1.0 / _147;
    bool _343 = !_313;
    int _345 = _343 ? 0 : 1;
    float _347 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _351 = abs(_345);
    float _353 = fma(_289, _197, _347);
    float _355 = float(_337);
    float _357 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = float(_339);
    float _361 = fma(_353, _291, _295);
    float _363 = abs(_305);
    float _365 = _355 * _363;
    float _367 = fma(_289, _199, _357);
    float _369 = _113 * _341;
    float _371 = float(_351);
    float _373 = fma(_359, _329, _365);
    float _375 = fma(_335, _291, _293);
    float _377 = fma(_367, _291, _297);
    float _379 = abs(_319);
    float _381 = fma(_371, _379, _373);
    bool _383 = !_349;
    float _385 = _369;
    float _401;
    if (!_383)
    {
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _389 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _391 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _393 = _391 * _387;
        float _395 = floor(_393);
        float _397 = -_395;
        float _399 = _393 + _397;
        _401 = _399;
        _403 = true;
    }
    else
    {
        _401 = _369;
    }
    _403 = false;
    float _405 = _401;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _405 + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _413 = _405 + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _431 = 1.0 / _417;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _433;
    float _437 = 1.0 / _429;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _441 = _405 + _439;
    bool _443 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _445 = isnan(_405);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    bool _455 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _457 = isnan(_405);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -_453;
    float _469 = _467 + 1.0;
    float _471 = 1.0 / _425;
    float _473 = _441 * _431;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _477 = _405 + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _479;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _485 = fma(_481, _473, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _487 = 1.0 / _421;
    float _489 = _477 * _437;
    bool _491 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _493 = isnan(_405);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    bool _503 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _505 = isnan(_405);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -_501;
    float _517 = _515 + 1.0;
    float _519 = 1.0 / _435;
    float _521 = _409 * _471;
    bool _523 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _525 = isnan(_405);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = -_533;
    float _537 = _535 + 1.0;
    float _539 = _413 * _487;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _543 = _405 + _541;
    float _545 = _533 * _517;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _547;
    float _551 = _513 * _537;
    float _553 = -_513;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _561 = fma(_549, _473, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _563 = _543 * _519;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _565;
    float _569 = _465 * _469;
    float _571 = -_465;
    float _573 = _571 + 1.0;
    float _575 = fma(_559, _539, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _577 = fma(_567, _473, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _579 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _581 = isnan(_405);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = _453 * _555;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _601 = _589 * _573;
    float _603 = fma(_595, _539, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _605 = fma(_599, _539, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _607 = _577 * _601;
    float _609 = -_589;
    float _611 = _609 + 1.0;
    float _613 = _561 * _601;
    float _615 = _485 * _601;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _621;
    float _625 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].x, _607);
    float _627 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].y, _613);
    float _629 = fma(_619, _521, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _635;
    float _639 = fma(_623, _521, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _641 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].z, _615);
    float _643 = fma(_603, _569, _625);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _649 = fma(_633, _489, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _651 = fma(_637, _521, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _653 = fma(_605, _569, _627);
    float _655 = fma(_575, _569, _641);
    float _657 = fma(_629, _591, _643);
    float _659 = fma(_647, _489, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _665 = fma(_639, _591, _653);
    float _667 = fma(_651, _591, _655);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _669;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _673;
    float _677 = fma(_663, _489, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _679;
    float _683 = fma(_671, _563, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _685 = fma(_675, _563, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _687 = fma(_649, _551, _657);
    float _689 = fma(_681, _563, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _691 = fma(_659, _551, _665);
    float _693 = fma(_677, _551, _667);
    float _695 = fma(_683, _545, _687);
    float _697 = fma(_685, _545, _691);
    float _699 = fma(_689, _545, _693);
    float _701 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[148].x, _695);
    float _703 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[148].y, _697);
    float _705 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[148].z, _699);
    bool _707 = !_483;
    float _723;
    if (!_707)
    {
        float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _711 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
        float _715 = _713 * _709;
        float _717 = floor(_715);
        float _719 = -_717;
        float _721 = _715 + _719;
        _723 = _721;
        _725 = true;
    }
    else
    {
        _723 = _369;
    }
    _725 = false;
    float _727 = _723;
    float _729 = in.m_57.x;
    float _731 = in.m_57.y;
    float _733 = in.m_57.z;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _735;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _751 = 1.0 / _737;
    bool _753 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _755 = isnan(_727);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = 1.0 / _741;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _769 = _727 + _767;
    float _771 = _705 * _733;
    float _773 = _703 * _731;
    float _775 = 1.0 / _745;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _779 = _727 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _783 = _727 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _787 = _727 + _785;
    bool _789 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _791 = _701 * _729;
    float _793 = _783 * _751;
    bool _795 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _797 = isnan(_727);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = 1.0 / _749;
    float _809 = _779 * _765;
    bool _811 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _813 = isnan(_727);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -_805;
    float _825 = _823 + 1.0;
    float _827 = _769 * _775;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _833;
    float _837 = _821 * _825;
    bool _839 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _841 = isnan(_727);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = fma(_831, _793, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _853 = fma(_835, _793, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _855 = -_821;
    float _857 = _855 + 1.0;
    float _859 = _787 * _807;
    bool _861 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _863 = isnan(_727);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _873;
    float _877 = fma(_875, _793, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _879 = -_871;
    float _881 = _879 + 1.0;
    float _883 = _871 * _857;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _893 = _763 * _881;
    float _895 = -_763;
    float _897 = _895 + 1.0;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _903 = fma(_887, _809, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _905 = fma(_891, _809, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _907 = _849 * _897;
    float _909 = -_849;
    float _911 = _909 + 1.0;
    float _913 = fma(_901, _809, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _915 = _851 * _907;
    float _917 = _853 * _907;
    float _919 = _877 * _907;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _921;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _925;
    float _929 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[107].x, _915);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _931;
    float _935 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[107].y, _917);
    float _937 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[107].z, _919);
    float _939 = fma(_923, _827, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _941 = fma(_927, _827, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _943 = fma(_903, _893, _929);
    float _945 = fma(_933, _827, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _947 = fma(_913, _893, _935);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _957 = fma(_905, _893, _937);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _963 = fma(_939, _883, _943);
    float _965 = fma(_951, _859, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _967 = fma(_955, _859, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _969 = fma(_941, _883, _947);
    float _971 = fma(_961, _859, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _973 = fma(_945, _883, _957);
    float _975 = fma(_965, _837, _963);
    float _977 = fma(_967, _837, _969);
    float _979 = fma(_971, _837, _973);
    float _981 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[111].x, _975);
    float _983 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[111].y, _977);
    float _985 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[111].z, _979);
    bool _987 = !_789;
    float _1003;
    if (!_987)
    {
        float _989 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _991 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _993 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _995 = _993 * _989;
        float _997 = floor(_995);
        float _999 = -_997;
        float _1001 = _995 + _999;
        _1003 = _1001;
        _1005 = true;
    }
    else
    {
        _1003 = _369;
    }
    _1005 = false;
    float _1007 = _1003;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1011 = _1007 + _1009;
    float _1013 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1023 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1025 = isnan(_1007);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1039 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1041 = isnan(_1007);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1047 = _1043 || _1045;
    float _1049 = float(_1047);
    float _1051 = 1.0 / _1017;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1053;
    float _1057 = -_1033;
    float _1059 = _1057 + 1.0;
    bool _1061 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1063 = isnan(_1007);
    bool _1065 = _1061 || _1063;
    bool _1067 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1069 = _1065 || _1067;
    float _1071 = float(_1069);
    float _1073 = _983 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1075 = _985 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1077 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1079 = 1.0 / _1021;
    float _1081 = 1.0 / _1037;
    float _1083 = _1055 * _1051;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1089 = _1049 * _1059;
    float _1091 = -_1049;
    float _1093 = _1091 + 1.0;
    float _1095 = fma(_1083, _1011, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1097 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1099 = isnan(_1007);
    bool _1101 = _1097 || _1099;
    bool _1103 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1105 = _1101 || _1103;
    float _1107 = float(_1105);
    float _1109 = _1071 * _1093;
    float _1111 = _1087 * _1079;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1113;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1119 = _1007 + _1117;
    float _1121 = _1095 * _1109;
    float _1123 = -_1071;
    float _1125 = _1123 + 1.0;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1129 = _1007 + _1127;
    float _1131 = fma(_1111, _1119, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1133 = _1115 * _1081;
    float _1135 = -_1107;
    float _1137 = _1135 + 1.0;
    float _1139 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1121);
    float _1141 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = fma(_1133, _1129, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1145 = _1033 * _1137;
    float _1147 = fma(_1131, _1089, _1139);
    float _1149 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1151 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = fma(_1143, _1145, _1147);
    float _1155 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1153);
    float _1157 = _1155 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _1149;
    out.m_59.y = _1141;
    out.m_59.z = _1151;
    out.m_59.w = _1157;
    bool _1159 = !_1077;
    float _1175;
    if (!_1159)
    {
        float _1161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1163 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1165 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[11].z, _113);
        float _1167 = _1165 * _1161;
        float _1169 = floor(_1167);
        float _1171 = -_1169;
        float _1173 = _1167 + _1171;
        _1175 = _1173;
        _1177 = true;
    }
    else
    {
        _1175 = _369;
    }
    _1177 = false;
    float _1179 = _1175;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1183 = _1179 + _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1187 = _1179 + _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1189;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1195 = _1193 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1203 = _1201 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1207 = _1179 + _1205;
    float _1209 = 1.0 / _1195;
    bool _1211 = _1179 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1213 = isnan(_1179);
    bool _1215 = _1211 || _1213;
    bool _1217 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1219 = _1215 || _1217;
    float _1221 = float(_1219);
    float _1223 = 1.0 / _1199;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1225;
    bool _1229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1231 = 1.0 / _1203;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1235 = _1179 + _1233;
    float _1237 = 1.0 / _1191;
    float _1239 = _1235 * _1209;
    bool _1241 = _1179 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1243 = isnan(_1179);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = _1183 * _1223;
    bool _1255 = _1179 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1257 = isnan(_1179);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    bool _1267 = _1179 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1269 = isnan(_1179);
    bool _1271 = _1267 || _1269;
    bool _1273 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1275 = _1271 || _1273;
    float _1277 = float(_1275);
    float _1279 = -_1251;
    float _1281 = _1279 + 1.0;
    float _1283 = _1187 * _1231;
    bool _1285 = _1179 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1287 = isnan(_1179);
    bool _1289 = _1285 || _1287;
    bool _1291 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1293 = _1289 || _1291;
    float _1295 = float(_1293);
    float _1297 = -_1265;
    float _1299 = _1297 + 1.0;
    float _1301 = fma(_1227, _1253, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1303 = _1295 * _1281;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1309 = _1207 * _1237;
    float _1311 = -_1295;
    float _1313 = _1311 + 1.0;
    float _1315 = _1277 * _1299;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1321;
    float _1325 = -_1277;
    float _1327 = _1325 + 1.0;
    float _1329 = _1265 * _1313;
    float _1331 = fma(_1319, _1253, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1333 = fma(_1323, _1253, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1341 = _1339 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1343 = _1221 * _1327;
    float _1345 = fma(_1307, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1347 = fma(_1337, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1349 = fma(_1341, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1351 = _1331 * _1343;
    float _1353 = _1333 * _1343;
    float _1355 = -_1221;
    float _1357 = _1355 + 1.0;
    float _1359 = _1301 * _1343;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1361;
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1365;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1369;
    float _1373 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1351);
    float _1375 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1353);
    float _1377 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1359);
    float _1379 = fma(_1363, _1309, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1381 = fma(_1367, _1309, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1383 = fma(_1371, _1309, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1385 = fma(_1347, _1315, _1373);
    float _1387 = fma(_1349, _1315, _1375);
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1395 = _1393 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1397 = fma(_1345, _1315, _1377);
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1401 = _1399 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1403 = fma(_1379, _1329, _1385);
    float _1405 = fma(_1391, _1239, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1407 = fma(_1395, _1239, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1409 = fma(_1401, _1239, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1411 = fma(_1381, _1329, _1387);
    float _1413 = fma(_1383, _1329, _1397);
    float _1415 = fma(_1405, _1303, _1403);
    float _1417 = fma(_1407, _1303, _1411);
    float _1419 = fma(_1409, _1303, _1413);
    float _1421 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1415);
    float _1423 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1417);
    float _1425 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1419);
    bool _1427 = !_1229;
    float _1443;
    if (!_1427)
    {
        float _1429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1431 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1433 = fma(_1431, (*spvDescriptorSet0.vp_c9)._m0[11].w, _113);
        float _1435 = _1433 * _1429;
        float _1437 = floor(_1435);
        float _1439 = -_1437;
        float _1441 = _1435 + _1439;
        _1443 = _1441;
        _1445 = true;
    }
    else
    {
        _1443 = _369;
    }
    _1445 = false;
    float _1447 = _1443;
    float _1449 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1451 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1453 = _1447 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1455 = isnan(_1447);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1461 = _1457 || _1459;
    float _1463 = float(_1461);
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1467 = _1465 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1469 = _1447 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1471 = isnan(_1447);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1477 = _1473 || _1475;
    float _1479 = float(_1477);
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1481;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1487 = _1447 + _1485;
    float _1489 = -_1463;
    float _1491 = _1489 + 1.0;
    float _1493 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1495 = 1.0 / _1467;
    float _1497 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1499 = _1479 * _1491;
    float _1501 = -_1479;
    float _1503 = _1501 + 1.0;
    float _1505 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1507 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1509 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1511 = _1483 * _1495;
    float _1513 = fma(_1511, _1487, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1515 = _1513 * _1499;
    float _1517 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1515);
    float _1519 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1517);
    float _1521 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _1497;
    out.m_61.y = _1505;
    out.m_61.z = _1507;
    out.m_61.w = _1521;
    bool _1523 = !_1509;
    float _1539;
    if (!_1523)
    {
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1527 = _145 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[14].x, _113);
        float _1531 = _1529 * _1525;
        float _1533 = floor(_1531);
        float _1535 = -_1533;
        float _1537 = _1531 + _1535;
        _1539 = _1537;
        _1541 = true;
    }
    else
    {
        _1539 = _369;
    }
    _1541 = false;
    float _1543 = _1539;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1547 = _1543 + _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1551 = _1543 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1553;
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1563 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1575 = _1573 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1577 = 1.0 / _1563;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1581 = _1543 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1585 = _1543 + _1583;
    bool _1587 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1589 = isnan(_1543);
    bool _1591 = _1587 || _1589;
    bool _1593 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1595 = _1591 || _1593;
    float _1597 = float(_1595);
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1599;
    float _1603 = 1.0 / _1559;
    bool _1605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1607 = 1.0 / _1567;
    float _1609 = 1.0 / _1575;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1611;
    float _1615 = _1547 * _1603;
    bool _1617 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1619 = isnan(_1543);
    bool _1621 = _1617 || _1619;
    bool _1623 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1625 = _1621 || _1623;
    float _1627 = float(_1625);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1631 = _1543 + _1629;
    float _1633 = 1.0 / _1613;
    float _1635 = _1631 * _1577;
    float _1637 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1639 = _1543 + _1637;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1643 = _1543 + _1641;
    float _1645 = _1581 * _1607;
    float _1647 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1647;
    float _1651 = fma(_1601, _1635, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1655 = _1653 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1657 = 1.0 / _1555;
    float _1659 = -_1627;
    float _1661 = _1659 + 1.0;
    float _1663 = _1639 * _1609;
    bool _1665 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1667 = isnan(_1543);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1673 = _1669 || _1671;
    float _1675 = float(_1673);
    float _1677 = fma(_1649, _1635, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1679 = 1.0 / _1571;
    bool _1681 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1683 = isnan(_1543);
    bool _1685 = _1681 || _1683;
    bool _1687 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1689 = _1685 || _1687;
    float _1691 = float(_1689);
    float _1693 = _1643 * _1633;
    float _1695 = -_1691;
    float _1697 = _1695 + 1.0;
    float _1699 = _1691 * _1661;
    float _1701 = _1551 * _1657;
    bool _1703 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1705 = isnan(_1543);
    bool _1707 = _1703 || _1705;
    bool _1709 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1711 = _1707 || _1709;
    float _1713 = float(_1711);
    bool _1715 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1717 = isnan(_1543);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1723 = _1719 || _1721;
    float _1725 = float(_1723);
    float _1727 = _1713 * _1697;
    float _1729 = -_1713;
    float _1731 = _1729 + 1.0;
    float _1733 = -_1725;
    float _1735 = _1733 + 1.0;
    float _1737 = _1585 * _1679;
    bool _1739 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1741 = isnan(_1543);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1747 = _1743 || _1745;
    float _1749 = float(_1747);
    float _1751 = _1675 * _1731;
    float _1753 = -_1675;
    float _1755 = _1753 + 1.0;
    float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1757;
    float _1761 = _1725 * _1755;
    float _1763 = fma(_1759, _1635, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1765 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1767 = isnan(_1543);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    float _1777 = _1749 * _1735;
    float _1779 = -_1749;
    float _1781 = _1779 + 1.0;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1785 = _1783 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1789 = _1787 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1791 = -_1775;
    float _1793 = _1791 + 1.0;
    float _1795 = fma(_1655, _1645, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1797 = _1775 * _1781;
    float _1799 = _1597 * _1793;
    float _1801 = fma(_1785, _1645, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1803 = fma(_1789, _1645, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1805 = _1763 * _1799;
    float _1807 = _1651 * _1799;
    float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1809;
    float _1813 = _1677 * _1799;
    float _1815 = -_1597;
    float _1817 = _1815 + 1.0;
    float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1821 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1819;
    float _1823 = fma(_1811, _1701, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1825;
    float _1829 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1813);
    float _1831 = fma(_1821, _1701, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1833 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1807);
    float _1835 = fma(_1827, _1701, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1837 = fma(_1795, _1797, _1829);
    float _1839 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1805);
    float _1841 = fma(_1803, _1797, _1833);
    float _1843 = fma(_1835, _1777, _1837);
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1847 = _1845 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1849 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1851 = _1849 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1853 = fma(_1823, _1777, _1841);
    float _1855 = fma(_1847, _1615, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1857 = fma(_1851, _1615, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1861 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1859;
    float _1863 = fma(_1801, _1797, _1839);
    float _1865 = fma(_1855, _1761, _1843);
    float _1867 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1867;
    float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1873 = _1871 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1875 = fma(_1857, _1761, _1853);
    float _1877 = fma(_1861, _1737, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1879 = fma(_1869, _1737, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1881 = fma(_1873, _1663, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1883 = fma(_1877, _1751, _1875);
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1887 = _1885 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1889 = fma(_1879, _1751, _1865);
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1891;
    float _1895 = fma(_1881, _1727, _1883);
    float _1897 = fma(_1887, _1663, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1899;
    float _1903 = fma(_1893, _1693, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1905 = fma(_1897, _1727, _1889);
    float _1907 = fma(_1901, _1693, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1909 = fma(_1903, _1699, _1895);
    float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1913 = _1911 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1915;
    float _1919 = fma(_1907, _1699, _1905);
    float _1921 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1909);
    float _1923 = fma(_1913, _1615, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1925 = fma(_1831, _1777, _1863);
    float _1927 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1919);
    float _1929 = fma(_1917, _1737, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    out.m_63.y = _1921;
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1933 = _1931 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1935 = fma(_1923, _1761, _1925);
    out.m_63.z = _1927;
    float _1937 = fma(_1933, _1663, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1939;
    float _1943 = fma(_1929, _1751, _1935);
    float _1945 = fma(_1941, _1693, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1947 = fma(_1937, _1727, _1943);
    float _1949 = fma(_1945, _1699, _1947);
    float _1951 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1949);
    bool _1953 = !_1605;
    float _1969;
    if (!_1953)
    {
        float _1955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1957 = _145 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1959 = fma(_1957, (*spvDescriptorSet0.vp_c9)._m0[14].y, _113);
        float _1961 = _1959 * _1955;
        float _1963 = floor(_1961);
        float _1965 = -_1963;
        float _1967 = _1961 + _1965;
        _1969 = _1967;
        _1971 = true;
    }
    else
    {
        _1969 = _369;
    }
    _1971 = false;
    float _1973 = _1969;
    float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1977 = _1973 + _1975;
    bool _1979 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1981 = isnan(_1973);
    bool _1983 = _1979 || _1981;
    bool _1985 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1987 = _1983 || _1985;
    float _1989 = float(_1987);
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1993 = _1991 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1995 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1997 = isnan(_1973);
    bool _1999 = _1995 || _1997;
    bool _2001 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2003 = _1999 || _2001;
    float _2005 = float(_2003);
    float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2009 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2007;
    bool _2011 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2013 = isnan(_1973);
    bool _2015 = _2011 || _2013;
    bool _2017 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2019 = _2015 || _2017;
    float _2021 = float(_2019);
    float _2023 = 1.0 / _1993;
    bool _2025 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2027 = isnan(_1973);
    bool _2029 = _2025 || _2027;
    bool _2031 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2033 = _2029 || _2031;
    float _2035 = float(_2033);
    float _2037 = -_2021;
    float _2039 = _2037 + 1.0;
    bool _2041 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2043 = isnan(_1973);
    bool _2045 = _2041 || _2043;
    bool _2047 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2049 = _2045 || _2047;
    float _2051 = float(_2049);
    float _2053 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2055 = _2053 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2057 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2059 = isnan(_1973);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2065 = _2061 || _2063;
    float _2067 = float(_2065);
    float _2069 = 1.0 / _2055;
    bool _2071 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _2073 = _2009 * _2023;
    float _2075 = -_1989;
    float _2077 = _2075 + 1.0;
    float _2079 = -_2005;
    float _2081 = _2079 + 1.0;
    float _2083 = fma(_2073, _1977, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2085 = _2005 * _2077;
    float _2087 = _2035 * _2081;
    float _2089 = -_2035;
    float _2091 = _2089 + 1.0;
    float _2093 = _2051 * _2039;
    float _2095 = -_2051;
    float _2097 = _2095 + 1.0;
    bool _2099 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2101 = isnan(_1973);
    bool _2103 = _2099 || _2101;
    bool _2105 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2107 = _2103 || _2105;
    float _2109 = float(_2107);
    float _2111 = _2021 * _2091;
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2115 = _2113 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2117 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2119 = _2117 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2121 = _2067 * _2097;
    float _2123 = -_2067;
    float _2125 = _2123 + 1.0;
    float _2127 = 1.0 / _2115;
    float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2131 = _2129 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2133 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2135 = _2133 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2137 = _2135 * _2069;
    float _2139 = 1.0 / _2119;
    float _2141 = _2109 * _2125;
    float _2143 = -_2109;
    float _2145 = _2143 + 1.0;
    float _2147 = _2083 * _2141;
    float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2151 = _1973 + _2149;
    float _2153 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2155 = _2153 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2157 = 1.0 / _2131;
    float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2161 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2159;
    float _2163 = fma(_2137, _2151, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2165 = fma(_2145, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2147);
    float _2167 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2169 = _1973 + _2167;
    float _2171 = _2161 * _2127;
    float _2173 = 1.0 / _2155;
    float _2175 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2177 = _2175 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2181 = _2179 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2183 = fma(_2171, _2169, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2185 = fma(_2163, _2121, _2165);
    float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2189 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2187;
    float _2191 = _2181 * _2139;
    float _2193 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2195 = _2193 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2197 = 1.0 / _2177;
    float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2201 = _1973 + _2199;
    float _2203 = fma(_2183, _2093, _2185);
    float _2205 = _2189 * _2157;
    float _2207 = fma(_2191, _2201, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2211 = _1973 + _2209;
    float _2213 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2215 = _1973 + _2213;
    float _2217 = _2195 * _2173;
    bool _2219 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2221 = isnan(_1973);
    bool _2223 = _2219 || _2221;
    bool _2225 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2227 = _2223 || _2225;
    float _2229 = float(_2227);
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2231;
    float _2235 = fma(_2205, _2211, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2237 = fma(_2207, _2111, _2203);
    float _2239 = fma(_2217, _2215, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2241 = -_2229;
    float _2243 = _2241 + 1.0;
    float _2245 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2247 = _1973 + _2245;
    float _2249 = _2233 * _2197;
    float _2251 = fma(_2235, _2087, _2237);
    float _2253 = _1989 * _2243;
    float _2255 = fma(_2249, _2247, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2257 = fma(_2239, _2085, _2251);
    float _2259 = fma(_2255, _2253, _2257);
    float _2261 = fma(_2229, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2259);
    out.m_65.x = _2261;
    bool _2263 = !_2071;
    if (!_2263)
    {
        float _2265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _2267 = _145 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _2269 = fma(_2267, (*spvDescriptorSet0.vp_c9)._m0[14].z, _113);
        float _2271 = _2269 * _2265;
        float _2273 = floor(_2271);
        float _2275 = -_2273;
        float _2277 = _2271 + _2275;
        _385 = _2277;
    }
    float _2279 = _385;
    int _2281 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _2283 = _2281;
    int _2285 = 0;
    int _2287 = _98(_2283, _2285, (*spvDescriptorSet0.support_buffer));
    float _2289 = in.m_67.z;
    float _2291 = 0.0 + _1951;
    float _2293 = precise::clamp(_2291, 0.0, 1.0);
    int _2295 = _2287 + (-1);
    float _2297 = trunc(_2289);
    int _2299 = int(_2297);
    float _2301 = float(_2295);
    float _2303 = _2293 * _2301;
    float _2305 = trunc(_2303);
    int _2307 = int(_2305);
    int _2309 = _2307 + 1;
    int _2311 = min(_2295, _2309);
    int _2313 = _2307;
    int _2315 = 0;
    int _2317 = _99(_2313, _2315, (*spvDescriptorSet0.support_buffer));
    int _2319 = _2299;
    int _2321 = 0;
    int _2323 = _99(_2319, _2321, (*spvDescriptorSet0.support_buffer));
    float3 _2327 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2317, _2323)), 0).xyz;
    float _2329 = _2327.x;
    float _2331 = _2327.y;
    float _2333 = _2327.z;
    int _2335 = _2311;
    int _2337 = 0;
    int _2339 = _99(_2335, _2337, (*spvDescriptorSet0.support_buffer));
    int _2341 = _2299;
    int _2343 = 0;
    int _2345 = _99(_2341, _2343, (*spvDescriptorSet0.support_buffer));
    float3 _2347 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2339, _2345)), 0).xyz;
    float _2349 = _2347.x;
    float _2351 = _2347.y;
    float _2353 = _2347.z;
    float _2355 = _159 * 2.0;
    float _2357 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2359 = log2(_2357);
    float _2361 = _145 * 2.0;
    float _2363 = _157 * 2.0;
    float _2365 = _381 * _791;
    float _2367 = _381 * _771;
    float _2369 = floor(_2355);
    float _2371 = _2365 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2373 = _2367 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2375 = floor(_2361);
    float _2377 = _2359 * _113;
    float _2379 = _145 + _157;
    float _2381 = _2379 + (-1.0);
    bool _2383 = _2369 > 0.0;
    float _2385 = exp2(_2377);
    bool _2387 = _2369 >= 0.0;
    bool _2389 = isnan(_2369);
    bool _2391 = _2387 || _2389;
    bool _2393 = isnan(0.0);
    bool _2395 = _2391 || _2393;
    float _2397 = fma(_2381, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2399 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2401 = 1.0 + _2399;
    int _2403 = _2395 ? 0 : 1;
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2407 = _2405 != 0;
    int _2409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2411 = _2409 != 0;
    int _2413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2415 = _2413 != 0;
    float _2417 = floor(_2363);
    int _2419 = ~_2403;
    int _2421 = _2419 + 1;
    int _2423 = _2421 + 1;
    bool _2425 = _2375 > 0.0;
    int _2427 = _2423;
    float _2429 = _2279;
    if (!_2383)
    {
        int _2431 = ~_2403;
        int _2433 = _2431 + 1;
        _2427 = _2433;
    }
    int _2435 = _2427;
    float _2437 = in.m_69.x;
    float _2439 = in.m_69.y;
    float _2441 = in.m_69.z;
    bool _2443 = _2375 >= 0.0;
    bool _2445 = isnan(_2375);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan(0.0);
    bool _2451 = _2447 || _2449;
    float _2453 = 1.0 / _2401;
    bool _2455 = !_2407;
    int _2457 = _2455 ? 0 : 1;
    float _2459 = -_2385;
    float _2461 = _2459 + 1.0;
    bool _2463 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2465 = isnan(1.0);
    bool _2467 = _2463 || _2465;
    bool _2469 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2471 = _2467 || _2469;
    int _2473 = abs(_2457);
    bool _2475 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2477 = isnan(0.0);
    bool _2479 = _2475 || _2477;
    bool _2481 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2483 = _2479 || _2481;
    float _2485 = float(_2473);
    float _2487 = float(_2435);
    int _2489 = _2451 ? 0 : 1;
    bool _2491 = !_2411;
    int _2493 = _2491 ? 0 : 1;
    float _2495 = _2485 * _2487;
    bool _2497 = _2417 > 0.0;
    float _2499 = _2483 ? _2461 : 0.0;
    float _2501 = _2495 * (-2.0);
    int _2503 = ~_2489;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    int _2509 = _2507;
    if (!_2425)
    {
        int _2511 = ~_2489;
        int _2513 = _2511 + 1;
        _2509 = _2513;
    }
    int _2515 = _2509;
    if (_2471)
    {
        float _2517 = _2499 * _2453;
        _125 = _2517;
    }
    float _2519 = _125;
    bool _2521 = _2417 >= 0.0;
    bool _2523 = isnan(_2417);
    bool _2525 = _2521 || _2523;
    bool _2527 = isnan(0.0);
    bool _2529 = _2525 || _2527;
    float _2531 = _145 + (-0.5);
    int _2533 = abs(_2493);
    float _2535 = fma(_2501, _2437, _2437);
    bool _2537 = !_2415;
    int _2539 = _2537 ? 0 : 1;
    float _2541 = fma(_2397, _2501, _2397);
    int _2543 = _2529 ? 0 : 1;
    float _2545 = fma(_2531, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2535);
    float _2547 = float(_2533);
    float _2549 = _157 + _159;
    float _2551 = float(_2515);
    float _2553 = fma(_2541, _2519, _2545);
    int _2555 = abs(_2539);
    float _2557 = _2549 + (-1.0);
    int _2559 = ~_2543;
    int _2561 = _2559 + 1;
    int _2563 = _2561 + 1;
    float _2565 = _2547 * _2551;
    int _2567 = _2563;
    if (!_2497)
    {
        int _2569 = ~_2543;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    float _2575 = _157 + (-0.5);
    float _2577 = _2565 * (-2.0);
    float _2579 = _145 + _159;
    float _2581 = float(_2555);
    float _2583 = _159 + (-0.5);
    float _2585 = float(_2573);
    float _2587 = fma(_2557, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2589 = fma(_2577, _2439, _2439);
    float _2591 = _2579 + (-1.0);
    float _2593 = _2553 * 0.15915493667125701904296875;
    float _2595 = _2581 * _2585;
    float _2597 = fma(_2587, _2577, _2587);
    float _2599 = fma(_2575, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2589);
    float _2601 = _2595 * (-2.0);
    float _2603 = _2593 * 6.283185482025146484375;
    float _2605 = cos(_2603);
    float _2607 = fma(_2597, _2519, _2599);
    float _2609 = fma(_2591, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2611 = fma(_2601, _2441, _2441);
    float _2613 = _2607 * 0.15915493667125701904296875;
    float _2615 = _361 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2617 = fma(_2609, _2601, _2609);
    float _2619 = fma(_2583, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2611);
    float _2621 = _2613 * 6.283185482025146484375;
    float _2623 = sin(_2621);
    float _2625 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2615);
    float _2627 = _361 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2629 = fma(_2617, _2519, _2619);
    float _2631 = _361 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2633 = _381 * _773;
    float _2635 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2627);
    float _2637 = _2629 * 0.15915493667125701904296875;
    float _2639 = _2613 * 6.283185482025146484375;
    float _2641 = cos(_2639);
    float _2643 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2631);
    float _2645 = _2633 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2647 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2635);
    float _2649 = _2647 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2651 = floor(_2303);
    float _2653 = _2623 * _2605;
    float _2655 = _2637 * 6.283185482025146484375;
    float _2657 = sin(_2655);
    float _2659 = _2641 * _2605;
    float _2661 = _2637 * 6.283185482025146484375;
    float _2663 = cos(_2661);
    float _2665 = -_2651;
    float _2667 = _2303 + _2665;
    float _2669 = _2593 * 6.283185482025146484375;
    float _2671 = sin(_2669);
    float _2673 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2625);
    float _2675 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2643);
    float _2677 = _2641 * _2657;
    float _2679 = _2623 * _2657;
    float _2681 = _2657 * _2605;
    float _2683 = _2675 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2685 = _2673 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2687 = _2641 * _2663;
    float _2689 = _2623 * _2663;
    float _2691 = _2663 * _2605;
    float _2693 = -_2689;
    float _2695 = fma(_2671, _2677, _2693);
    float _2697 = -_2677;
    float _2699 = fma(_2671, _2689, _2697);
    float _2701 = fma(_2671, _2679, _2687);
    float _2703 = fma(_2671, _2687, _2679);
    float _2705 = -_2331;
    float _2707 = _2705 + _2351;
    float _2709 = -_2329;
    float _2711 = _2709 + _2349;
    float _2713 = -_2333;
    float _2715 = _2713 + _2353;
    float _2717 = fma(_2667, _2707, _2331);
    float _2719 = fma(_2667, _2711, _2329);
    float _2721 = fma(_2667, _2715, _2333);
    float _2723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2717);
    float _2725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2719);
    float _2727 = _2723 * _2645;
    float _2729 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2721);
    float _2731 = _2725 * _2371;
    float _2733 = _2691 * _2727;
    float _2735 = _2729 * _2373;
    float _2737 = _2699 * _2727;
    float _2739 = _2703 * _2727;
    float _2741 = fma(_2681, _2731, _2733);
    float _2743 = fma(_2701, _2731, _2737);
    float _2745 = fma(_2695, _2731, _2739);
    float _2747 = -_2671;
    float _2749 = fma(_2747, _2735, _2741);
    float _2751 = fma(_2653, _2735, _2743);
    float _2753 = fma(_2659, _2735, _2745);
    float _2755 = _2749 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2757 = _2749 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2759 = _2749 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2761 = fma(_2751, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2755);
    float _2763 = fma(_2751, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2757);
    float _2765 = fma(_2751, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2759);
    float _2767 = fma(_2753, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2761);
    float _2769 = fma(_2753, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2763);
    float _2771 = fma(_2753, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2765);
    float _2773 = _2683 + _2767;
    float _2775 = _2649 + _2769;
    float _2777 = _2685 + _2771;
    float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2781 = _2773 + _2779;
    float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2785 = _2775 + _2783;
    float _2787 = _2781 * _2781;
    float _2789 = fma(_2785, _2785, _2787);
    float _2791 = sqrt(_2789);
    bool _2793 = _2791 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2795 = _2787;
    float _2797 = _2765;
    float _2799 = _2773;
    float _2801 = _2771;
    float _2803 = _2671;
    if (!_2793)
    {
        _2795 = _2775;
    }
    float _2805 = _2795;
    float _2807 = _2805;
    if (!_2793)
    {
        _2797 = _2777;
    }
    float _2809 = _2797;
    bool _2811 = !_2793;
    float _2813 = _2809;
    if (!_2811)
    {
        float _2815 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2819 = _2791 + _2817;
        float _2821 = _2777 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2823 = rsqrt(_2789);
        float _2825 = _2819 * _2815;
        float _2827 = _2825 * 0.15915493667125701904296875;
        float _2829 = _2827 * 6.283185482025146484375;
        float _2831 = cos(_2829);
        float _2833 = _2827 * 6.283185482025146484375;
        float _2835 = sin(_2833);
        float _2837 = _2831 + (-1.0);
        float _2839 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2841 = fma(_2835, _2821, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2843 = fma(_2777, _2831, _2839);
        float _2845 = _2823 * _2841;
        float _2847 = fma(_2785, _2845, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2849 = fma(_2781, _2845, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2813 = _2843;
        _2807 = _2847;
        _2799 = _2849;
    }
    float _2851 = _2813;
    float _2853 = _2807;
    float _2855 = _2799;
    float _2857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2859 = _2851 + _2857;
    float _2861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2863 = _2853 + _2861;
    float _2865 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2867 = _2855 + _2865;
    float _2869 = _2859 * _2859;
    float _2871 = fma(_2863, _2863, _2869);
    float _2873 = fma(_2867, _2867, _2871);
    float _2875 = rsqrt(_2873);
    float _2877 = sqrt(_2873);
    float _2879 = _2875 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2881 = _2863 * _2879;
    float _2883 = _2867 * _2879;
    float _2885 = _2881 * _2881;
    float _2887 = _2883 * _2883;
    float _2889 = _2885 + _2887;
    float _2891 = sqrt(_2889);
    bool _2893 = _2891 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2897 = _2891 + _2895;
    float _2899 = _2867;
    float _2901 = _2889;
    float _2903 = _2897;
    float _2905 = _2879;
    if (_2893)
    {
        float _2907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2899 = _2907;
    }
    float _2909 = _2899;
    if (_2893)
    {
        float _2911 = rsqrt(_2889);
        _2901 = _2911;
    }
    float _2913 = _2901;
    float _2915 = _2913;
    if (_2893)
    {
        float _2917 = _2897 * _2909;
        _2903 = _2917;
    }
    float _2919 = _2903;
    if (_2893)
    {
        float _2921 = _2919 * 0.15915493667125701904296875;
        _2801 = _2921;
    }
    float _2923 = _2801;
    float _2925 = _2909;
    float _2927 = _2923;
    if (_2893)
    {
        float _2929 = _2923 * 6.283185482025146484375;
        float _2931 = sin(_2929);
        _2925 = _2931;
    }
    float _2933 = _2925;
    float _2935 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2937 = precise::max(0.0, _2935);
    float _2939 = _2869;
    float _2941 = _2937;
    if (_2893)
    {
        float _2943 = _2923 * 6.283185482025146484375;
        float _2945 = cos(_2943);
        _2939 = _2945;
    }
    float _2947 = _2939;
    float _2949 = -_2879;
    float _2951 = -_2937;
    float _2953 = fma(_2859, _2949, _2951);
    float _2955 = _2953;
    if (_2893)
    {
        float _2957 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2941 = _2957;
    }
    float _2959 = _2941;
    float _2961 = _2933;
    float _2963 = _2959;
    if (_2893)
    {
        float _2965 = fma(_2933, _2959, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2961 = _2965;
    }
    float _2967 = _2961;
    float _2969 = _2967;
    float _2971 = _2947;
    if (_2893)
    {
        float _2973 = _2947 + (-1.0);
        _2963 = _2973;
    }
    float _2975 = _2963;
    float _2977 = _2975;
    if (_2893)
    {
        float _2979 = _2913 * _2967;
        _2905 = _2979;
    }
    float _2981 = _2905;
    if (!_2893)
    {
        _2969 = _2881;
    }
    float _2983 = _2969;
    float _2985 = _2983;
    if (_2893)
    {
        float _2987 = _2975 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2927 = _2987;
    }
    float _2989 = _2927;
    if (_2893)
    {
        float _2991 = _2881 * _2981;
        _2985 = _2991;
    }
    float _2993 = _2985;
    if (!_2893)
    {
        _2977 = _2883;
    }
    float _2995 = _2977;
    float _2997 = _2995;
    if (_2893)
    {
        float _2999 = _2883 * _2981;
        _2997 = _2999;
    }
    float _3001 = _2997;
    if (!_2893)
    {
        _2915 = _2885;
    }
    float _3003 = _2915;
    float _3005 = _3003;
    if (_2893)
    {
        float _3007 = fma(_2953, _2947, _2989);
        _2955 = _3007;
    }
    float _3009 = _2955;
    if (_2893)
    {
        float _3011 = _2993 * _2993;
        _3005 = _3011;
    }
    float _3013 = _3005;
    if (!_2893)
    {
        _2971 = _2887;
    }
    float _3015 = _2971;
    float _3017 = _3015;
    if (_2893)
    {
        float _3019 = _3001 * _3001;
        _3017 = _3019;
    }
    float _3021 = _3017;
    float _3023 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3025 = fma(_3009, _3009, _3013);
    float _3027 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3029 = _3025 + _3021;
    float _3031 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3023);
    float _3033 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3037 = fma(_2877, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3035);
    float _3039 = precise::clamp(_3037, 0.0, 1.0);
    float _3041 = rsqrt(_3029);
    float _3043 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3031);
    float _3045 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3047 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3033);
    float _3049 = -_3039;
    float _3051 = _3049 + 1.0;
    float _3053 = _3043 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3055 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3045);
    float _3057 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3047);
    float _3059 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3061 = _3053 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3063 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3055);
    float _3065 = _3057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3067 = abs(_3051);
    float _3069 = log2(_3067);
    float _3071 = -_3061;
    float _3073 = fma(_3071, _3027, 1.0);
    float _3075 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3059);
    float _3077 = _3063 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3079 = _3041 * _2993;
    float _3081 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3083 = _3041 * _3009;
    float _3085 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3075);
    float _3087 = _3079 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3089 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3081);
    float _3091 = _3041 * _3001;
    float _3093 = _3085 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3095 = -_3087;
    float _3097 = fma(_3083, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3095);
    float _3099 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3089);
    float _3101 = log2(_3073);
    float _3103 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3105 = -_3091;
    float _3107 = fma(_3105, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3097);
    float _3109 = fma(_3093, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3099);
    float _3111 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3113 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3115 = fma(_3107, -0.5, 0.5);
    float _3117 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3103);
    float _3119 = 1.0 / _3109;
    float _3121 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3113);
    float _3123 = fma(_3107, 0.5, 0.5);
    float _3125 = _3083 + 1.0;
    float _3127 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3121);
    float _3129 = fma(_3123, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3131 = exp2(_3111);
    float _3133 = fma(_3093, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3127);
    float _3135 = _3101 * 0.693147182464599609375;
    float _3137 = fma(_3123, _3129, -0.212114393711090087890625);
    float _3139 = _3135 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3141 = fma(_3123, _3137, 1.570728778839111328125);
    float _3143 = sqrt(_3115);
    float _3145 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3117);
    float _3147 = _3133 * _3119;
    float _3149 = fma(_3093, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3145);
    float _3151 = fma(_3147, 0.5, 0.5);
    float _3153 = -_3083;
    float _3155 = fma(_3131, _3125, _3153);
    float _3157 = _3149 * _3119;
    float _3159 = fma(_3155, 0.5, 0.5);
    float _3161 = fma(_3157, -0.5, 0.5);
    float _3163 = _3143 * 0.636619746685028076171875;
    float3 _8641 = float3(_3151, _3161, _3139);
    float _3165 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8641, float3(0.0), isnan(_8641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8641, float3(0.0), isnan(_8641)), level(0.0)).x;
    float _3167 = -_3141;
    float _3169 = fma(_3163, _3167, 1.0);
    float3 _8657 = float3(_3151, _3161, _3139);
    float4 _3172 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8657, float3(0.0), isnan(_8657)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8657, float3(0.0), isnan(_8657)), level(0.0)).xyzw;
    float _3174 = _3172.x;
    float _3176 = _3172.y;
    float _3178 = _3172.z;
    float _3180 = _3172.w;
    float2 _8674 = float2(_3169, _3159);
    float3 _3182 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8674, float2(0.0), isnan(_8674)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8674, float2(0.0), isnan(_8674)), level(0.0)).xyz;
    float _3184 = _3182.x;
    float _3186 = _3182.y;
    float _3188 = _3182.z;
    float _3190 = in.m_71.x;
    float _3192 = in.m_71.y;
    float _3194 = in.m_71.z;
    float _3196 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3198 = in.m_73.x;
    float _3200 = in.m_73.y;
    float _3202 = in.m_73.z;
    float _3204 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3206 = _3204 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3208 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3210 = isnan(0.5);
    bool _3212 = _3208 || _3210;
    bool _3214 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3216 = _3212 || _3214;
    float _3218 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3220 = _3218 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3222 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3196);
    bool _3224 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _3226 = isnan(_2279);
    bool _3228 = _3224 || _3226;
    bool _3230 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _3232 = _3228 || _3230;
    float _3234 = float(_3232);
    float _3236 = 1.0 / _3206;
    bool _3238 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _3240 = isnan(_2279);
    bool _3242 = _3238 || _3240;
    bool _3244 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _3246 = _3242 || _3244;
    float _3248 = float(_3246);
    float _3250 = -(*spvDescriptorSet0.vp_c9)._m0[175].y;
    float _3252 = (*spvDescriptorSet0.vp_c9)._m0[176].y + _3250;
    float _3254 = -(*spvDescriptorSet0.vp_c9)._m0[176].y;
    float _3256 = _3254 + (*spvDescriptorSet0.vp_c9)._m0[177].y;
    bool _3258 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _3260 = isnan(_2279);
    bool _3262 = _3258 || _3260;
    bool _3264 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _3266 = _3262 || _3264;
    float _3268 = float(_3266);
    float _3270 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3222);
    float _3272 = -_3248;
    float _3274 = _3272 + 1.0;
    bool _3276 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3278 = isnan(_2279);
    bool _3280 = _3276 || _3278;
    bool _3282 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _3284 = _3280 || _3282;
    float _3286 = float(_3284);
    float _3288 = 1.0 / _3220;
    bool _3290 = _2717 != 0.0;
    bool _3292 = isnan(_2717);
    bool _3294 = _3290 || _3292;
    bool _3296 = isnan(0.0);
    bool _3298 = _3294 || _3296;
    float _3300 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_75.x = _2649;
    out.m_75.y = _2685;
    out.m_75.z = _2683;
    float _3302 = -_3286;
    float _3304 = _3302 + 1.0;
    bool _3306 = _2719 == 0.0;
    bool _3308 = !_3298;
    bool _3310 = _3306 && _3308;
    out.m_77.x = _2853;
    out.m_77.y = _2851;
    out.m_77.z = _2855;
    float _3312 = -_3190;
    float _3314 = _3312 + _3198;
    float _3316 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3318 = _3316 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3320 = _3252 * _3236;
    float _3322 = -_3192;
    float _3324 = _3322 + _3200;
    float _3326 = 1.0 / _3318;
    float _3328 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3330 = _3328 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3332 = fma(_1951, _3314, _3190);
    float _3334 = fma(_1951, _3324, _3192);
    float _3336 = -(*spvDescriptorSet0.vp_c9)._m0[177].y;
    float _3338 = (*spvDescriptorSet0.vp_c9)._m0[178].y + _3336;
    bool _3340 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _3342 = isnan(_2279);
    bool _3344 = _3340 || _3342;
    bool _3346 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _3348 = _3344 || _3346;
    float _3350 = float(_3348);
    float _3352 = 1.0 / _3330;
    float _3354 = -_3234;
    float _3356 = _3354 + 1.0;
    float _3358 = _3256 * _3288;
    bool _3360 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _3362 = isnan(_2279);
    bool _3364 = _3360 || _3362;
    bool _3366 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _3368 = _3364 || _3366;
    float _3370 = float(_3368);
    float _3372 = -_3194;
    float _3374 = _3372 + _3202;
    float _3376 = _3350 * _3356;
    float _3378 = -_3350;
    float _3380 = _3378 + 1.0;
    bool _3382 = _2721 == 0.0;
    bool _3384 = _3382 && _3310;
    float _3386 = _3338 * _3326;
    float _3388 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3390 = _3388 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3392 = -_3370;
    float _3394 = _3392 + 1.0;
    float _3396 = _3370 * _3380;
    float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[178].y;
    float _3400 = _3398 + (*spvDescriptorSet0.vp_c9)._m0[179].y;
    float _3402 = fma(_1951, _3374, _3194);
    float _3404 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3406 = _3404 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3408 = _3248 * _3394;
    float _3410 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3412 = _2279 + _3410;
    float _3414 = _3400 * _3352;
    float _3416 = _3268 * _3274;
    float _3418 = -_3268;
    float _3420 = _3418 + 1.0;
    float _3422 = 1.0 / _3406;
    float _3424 = fma(_3320, _3412, (*spvDescriptorSet0.vp_c9)._m0[175].y);
    bool _3426 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _3428 = isnan(_2279);
    bool _3430 = _3426 || _3428;
    bool _3432 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _3434 = _3430 || _3432;
    float _3436 = float(_3434);
    float _3438 = _3286 * _3420;
    float _3440 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3442 = _2279 + _3440;
    float _3444 = -(*spvDescriptorSet0.vp_c9)._m0[179].y;
    float _3446 = (*spvDescriptorSet0.vp_c9)._m0[180].y + _3444;
    float _3448 = -(*spvDescriptorSet0.vp_c9)._m0[180].y;
    float _3450 = _3448 + (*spvDescriptorSet0.vp_c9)._m0[181].y;
    float _3452 = 1.0 / _3390;
    float _3454 = _3436 * _3304;
    float _3456 = fma(_3358, _3442, (*spvDescriptorSet0.vp_c9)._m0[176].y);
    float _3458 = -_3436;
    float _3460 = _3458 + 1.0;
    float _3462 = _3424 * _3454;
    float _3464 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3466 = _2279 + _3464;
    float _3468 = _3334;
    float _3470 = _3332;
    float _3472 = _3402;
    float _3474 = _3234;
    if (!_3384)
    {
        float _3476 = fma(_2717, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3334);
        _3468 = _3476;
    }
    float _3478 = _3468;
    float _3480 = _3450 * _3422;
    float _3482 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3484 = _2279 + _3482;
    float _3486 = fma(_3460, (*spvDescriptorSet0.vp_c9)._m0[175].y, _3462);
    float _3488 = -(*spvDescriptorSet0.vp_c9)._m0[181].y;
    float _3490 = (*spvDescriptorSet0.vp_c9)._m0[182].y + _3488;
    float _3492 = exp2(_3300);
    float _3494 = fma(_3386, _3484, (*spvDescriptorSet0.vp_c9)._m0[177].y);
    float _3496 = fma(_3456, _3438, _3486);
    float _3498 = fma(_3414, _3466, (*spvDescriptorSet0.vp_c9)._m0[178].y);
    float _3500 = _3446 * _3452;
    float _3502 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3504 = _2279 + _3502;
    float _3506 = fma(_3494, _3416, _3496);
    float _3508 = _3270 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3510 = fma(_3500, _3504, (*spvDescriptorSet0.vp_c9)._m0[179].y);
    float _3512 = fma(_3498, _3408, _3506);
    float _3514 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3516 = 1.0 / _3508;
    float _3518 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3520 = _2279 + _3518;
    float _3522 = fma(_3510, _3396, _3512);
    float _3524 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3526 = _3524 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _3528 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3514);
    float _3530 = fma(_3480, _3520, (*spvDescriptorSet0.vp_c9)._m0[180].y);
    float _3532 = _3512;
    if (!_3216)
    {
        _3532 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3534 = _3532;
    float _3536 = _3534;
    if (!_3384)
    {
        float _3538 = fma(_2719, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3332);
        _3470 = _3538;
    }
    float _3540 = _3470;
    float _3542 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3528);
    float _3544 = 1.0 / _3526;
    float _3546 = fma(_3530, _3376, _3522);
    bool _3548 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _3550 = isnan(_2279);
    bool _3552 = _3548 || _3550;
    bool _3554 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _3556 = _3552 || _3554;
    float _3558 = float(_3556);
    float _3560 = _3542 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3562 = _2691 * _3478;
    float _3564 = _2699 * _3478;
    float _3566 = _2703 * _3478;
    float _3568 = _3560 + _3508;
    float _3570 = -_3558;
    float _3572 = _3570 + 1.0;
    if (!_3384)
    {
        float _3574 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3402);
        _3472 = _3574;
    }
    float _3576 = _3472;
    float _3578 = fma(_2681, _3540, _3562);
    float _3580 = _3568 * _3516;
    float _3582 = _3580 * 0.5;
    float _3584 = _3234 * _3572;
    float _3586 = fma(_2701, _3540, _3564);
    float _3588 = fma(_2695, _3540, _3566);
    if (!_3216)
    {
        float _3590 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3592 = fma(_3582, _3534, _3590);
        _3536 = _3592;
    }
    float _3594 = _3536;
    float _3596 = _3490 * _3544;
    float _3598 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3600 = _2279 + _3598;
    if (!_3216)
    {
        _2429 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3602 = _2429;
    float _3604 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3606 = -_2671;
    float _3608 = fma(_3606, _3576, _3578);
    float _3610 = fma(_3596, _3600, (*spvDescriptorSet0.vp_c9)._m0[181].y);
    float _3612 = _3594;
    if (!_3216)
    {
        float _3614 = 1.0 / _3594;
        _3612 = _3614;
    }
    float _3616 = _3612;
    if (!_3216)
    {
        float _3618 = -_3602;
        float _3620 = _3618 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3474 = _3620;
    }
    float _3622 = _3474;
    float _3624 = -_3492;
    float _3626 = _3624 + 1.0;
    float _3628 = fma(_3610, _3584, _3546);
    float _3630 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3604);
    float _3632 = fma(_2653, _3576, _3586);
    float _3634 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3636 = fma(_3558, (*spvDescriptorSet0.vp_c9)._m0[182].y, _3628);
    float _3638 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3630);
    float _3640 = _3558;
    float _3642 = _3622;
    if (!_3216)
    {
        float _3644 = 1.0 / _3622;
        _3640 = _3644;
    }
    float _3646 = _3640;
    float _3648 = fma(_2659, _3576, _3588);
    float _3650 = _3608 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _3652 = _3109 * 0.5;
    float _3654 = -_3634;
    float _3656 = _3654 + 1.0;
    float _3658 = fma(_3632, (*spvDescriptorSet0.vp_c10)._m0[9].x, _3650);
    if (!_3216)
    {
        float _3660 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3662 = -_3602;
        float _3664 = fma(_3616, _3660, _3662);
        _2803 = _3664;
    }
    float _3666 = _2803;
    float _3668 = _3608 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_3216)
    {
        _3642 = 1.0;
    }
    float _3670 = _3642;
    float _3672 = _3608 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _3674 = fma(_3149, -0.5, _3652);
    float _3676 = fma(_3632, (*spvDescriptorSet0.vp_c10)._m0[8].x, _3668);
    float _3678 = fma(_3093, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3638);
    float _3680 = fma(_3632, (*spvDescriptorSet0.vp_c10)._m0[10].x, _3672);
    float _3682 = fma(_3648, (*spvDescriptorSet0.vp_c10)._m0[9].z, _3658);
    float _3684 = _3670;
    if (!_3216)
    {
        float _3686 = _3666 * _3646;
        float _3688 = precise::clamp(_3686, 0.0, 1.0);
        _3684 = _3688;
    }
    float _3690 = _3684;
    float _3692 = fma(_3648, (*spvDescriptorSet0.vp_c10)._m0[8].z, _3676);
    float _3694 = _3678 + _3109;
    float _3696 = _3133 + _3109;
    float _3698 = _3690 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3700 = _3690 > 0.0;
    bool _3702 = isnan(_3690);
    bool _3704 = _3700 || _3702;
    bool _3706 = isnan(0.0);
    bool _3708 = _3704 || _3706;
    float _3710 = fma(_3648, (*spvDescriptorSet0.vp_c10)._m0[10].z, _3680);
    float _3712 = _3694 * 0.5;
    float _3714 = _3696 * 0.5;
    float _3716 = _3698 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.y = _3636;
    out.m_81.x = _3692;
    out.m_81.y = _3682;
    out.m_81.z = _3710;
    out.gl_Position.x = _3133;
    out.gl_Position.y = _3149;
    out.gl_Position.z = _3678;
    out.gl_Position.w = _3109;
    out.m_83.x = _3714;
    out.m_83.y = _3674;
    out.m_83.z = _3712;
    out.m_83.w = _3109;
    out.m_51.x = _3716;
    float _3718 = _3634 * _3165;
    float _3720 = _3180 * _3718;
    float _3722 = _3180 * _3656;
    float _3724 = _3188 * _3718;
    float _3726 = fma(_3184, _3720, _3174);
    float _3728 = fma(_3186, _3720, _3176);
    float _3730 = fma(_3180, _3724, _3178);
    out.m_85.x = _3726;
    out.m_85.y = _3728;
    out.m_85.z = _3730;
    out.m_85.w = _3722;
    if (_3708)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3732 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3732;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1971 = false;
    bool _1541 = false;
    bool _1445 = false;
    bool _1177 = false;
    bool _1005 = false;
    bool _725 = false;
    bool _403 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = in.m_46.w;
    float _107 = trunc(_103);
    int _109 = int(_107);
    float _111 = -_105;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _113;
    bool _117 = _109 >= 1;
    float _119 = 0.0;
    float _121 = as_type<float>(_109);
    float _123 = 0.0;
    float _125 = _113;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _119;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_117)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3800 = as_type<float>(_133);
        out.gl_Position.z = _3800;
    }
    if (!_117)
    {
        return out;
    }
    bool _135 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_105);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = in.m_53.x;
    float _147 = float(_109);
    float _149 = in.m_53.w;
    bool _151 = _113 >= _147;
    bool _153 = !_143;
    bool _155 = _151 || _153;
    float _157 = in.m_53.y;
    float _159 = in.m_53.z;
    if (_155)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    int _163 = 0;
    if (_155)
    {
        float _165 = _161 * 5.0;
        _163 = as_type<int>(_165);
    }
    int _167 = _163;
    out.m_55.x = _145;
    out.m_55.w = _149;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3867 = as_type<float>(_167);
        out.gl_Position.z = _3867;
    }
    out.m_55.y = _157;
    out.m_55.z = _159;
    if (_155)
    {
        return out;
    }
    float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _171 = _113 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _173 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = _171 * _169;
    if (!_183)
    {
        float _187 = _173 * _173;
        float _189 = _187 * 0.5;
        _123 = _189;
    }
    float _191 = _123;
    float _193 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _185);
    float _195 = in.m_46.x;
    float _197 = in.m_46.y;
    float _199 = in.m_46.z;
    float _201 = _191;
    if (!_183)
    {
        float _203 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    float _207 = _193 * 6.283185482025146484375;
    float _209 = floor(_193);
    float _211 = _207 * 0.15915493667125701904296875;
    int _213 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _215 = _213 != 0;
    float _217 = _211 * 6.283185482025146484375;
    float _219 = cos(_217);
    float _221 = 1.4012984643248170709237295832899e-45;
    float _223 = _205;
    if (!_183)
    {
        _221 = _173;
    }
    float _225 = _221;
    float _227 = -_209;
    float _229 = _193 + _227;
    bool _231 = !_183;
    float _233 = _225;
    if (!_231)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = _173 * _237;
        float _247 = 1.0 / _241;
        float _249 = _243 * 0.693147182464599609375;
        float _251 = exp2(_245);
        float _253 = 1.0 / _249;
        float _255 = _251 + (-1.0);
        float _257 = -_255;
        float _259 = fma(_257, _253, _173);
        float _261 = _259 * _247;
        float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _263;
    }
    float _265 = _223;
    bool _267 = !_183;
    if (!_267)
    {
        float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = log2(_269);
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = 1.0 / _275;
        float _279 = _173 * _271;
        float _281 = exp2(_279);
        float _283 = -_281;
        float _285 = _283 + 1.0;
        float _287 = _285 * _277;
        _233 = _287;
    }
    float _289 = _233;
    float _291 = in.m_57.w;
    float _293 = in.m_44.x;
    float _295 = in.m_44.y;
    float _297 = in.m_44.z;
    bool _299 = _229 < 0.5;
    float _301 = float(_299);
    float _303 = -_229;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _309 = _307 != 0;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _313 = _311 != 0;
    float _315 = fma(_219, 0.5, 0.5);
    float _317 = -_301;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _321 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _323 = !_309;
    int _325 = _323 ? 0 : 1;
    float _327 = -_315;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _331 = !_215;
    int _333 = _331 ? 0 : 1;
    float _335 = fma(_289, _195, _321);
    int _337 = abs(_325);
    int _339 = abs(_333);
    float _341 = 1.0 / _147;
    bool _343 = !_313;
    int _345 = _343 ? 0 : 1;
    float _347 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _351 = abs(_345);
    float _353 = fma(_289, _197, _347);
    float _355 = float(_337);
    float _357 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = float(_339);
    float _361 = fma(_353, _291, _295);
    float _363 = abs(_305);
    float _365 = _355 * _363;
    float _367 = fma(_289, _199, _357);
    float _369 = _113 * _341;
    float _371 = float(_351);
    float _373 = fma(_359, _329, _365);
    float _375 = fma(_335, _291, _293);
    float _377 = fma(_367, _291, _297);
    float _379 = abs(_319);
    float _381 = fma(_371, _379, _373);
    bool _383 = !_349;
    float _385 = _369;
    float _401;
    if (!_383)
    {
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _389 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _391 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _393 = _391 * _387;
        float _395 = floor(_393);
        float _397 = -_395;
        float _399 = _393 + _397;
        _401 = _399;
        _403 = true;
    }
    else
    {
        _401 = _369;
    }
    _403 = false;
    float _405 = _401;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _405 + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _413 = _405 + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _431 = 1.0 / _417;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _433;
    float _437 = 1.0 / _429;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _441 = _405 + _439;
    bool _443 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _445 = isnan(_405);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    bool _455 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _457 = isnan(_405);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -_453;
    float _469 = _467 + 1.0;
    float _471 = 1.0 / _425;
    float _473 = _441 * _431;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _477 = _405 + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _479;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _485 = fma(_481, _473, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _487 = 1.0 / _421;
    float _489 = _477 * _437;
    bool _491 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _493 = isnan(_405);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    bool _503 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _505 = isnan(_405);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -_501;
    float _517 = _515 + 1.0;
    float _519 = 1.0 / _435;
    float _521 = _409 * _471;
    bool _523 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _525 = isnan(_405);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = -_533;
    float _537 = _535 + 1.0;
    float _539 = _413 * _487;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _543 = _405 + _541;
    float _545 = _533 * _517;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _547;
    float _551 = _513 * _537;
    float _553 = -_513;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _561 = fma(_549, _473, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _563 = _543 * _519;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _565;
    float _569 = _465 * _469;
    float _571 = -_465;
    float _573 = _571 + 1.0;
    float _575 = fma(_559, _539, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _577 = fma(_567, _473, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _579 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _581 = isnan(_405);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = _453 * _555;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _601 = _589 * _573;
    float _603 = fma(_595, _539, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _605 = fma(_599, _539, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _607 = _577 * _601;
    float _609 = -_589;
    float _611 = _609 + 1.0;
    float _613 = _561 * _601;
    float _615 = _485 * _601;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _621;
    float _625 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].x, _607);
    float _627 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].y, _613);
    float _629 = fma(_619, _521, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _635;
    float _639 = fma(_623, _521, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _641 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].z, _615);
    float _643 = fma(_603, _569, _625);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _649 = fma(_633, _489, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _651 = fma(_637, _521, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _653 = fma(_605, _569, _627);
    float _655 = fma(_575, _569, _641);
    float _657 = fma(_629, _591, _643);
    float _659 = fma(_647, _489, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _665 = fma(_639, _591, _653);
    float _667 = fma(_651, _591, _655);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _669;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _673;
    float _677 = fma(_663, _489, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _679;
    float _683 = fma(_671, _563, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _685 = fma(_675, _563, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _687 = fma(_649, _551, _657);
    float _689 = fma(_681, _563, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _691 = fma(_659, _551, _665);
    float _693 = fma(_677, _551, _667);
    float _695 = fma(_683, _545, _687);
    float _697 = fma(_685, _545, _691);
    float _699 = fma(_689, _545, _693);
    float _701 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[148].x, _695);
    float _703 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[148].y, _697);
    float _705 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[148].z, _699);
    bool _707 = !_483;
    float _723;
    if (!_707)
    {
        float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _711 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
        float _715 = _713 * _709;
        float _717 = floor(_715);
        float _719 = -_717;
        float _721 = _715 + _719;
        _723 = _721;
        _725 = true;
    }
    else
    {
        _723 = _369;
    }
    _725 = false;
    float _727 = _723;
    float _729 = in.m_57.x;
    float _731 = in.m_57.y;
    float _733 = in.m_57.z;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _735;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _751 = 1.0 / _737;
    bool _753 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _755 = isnan(_727);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = 1.0 / _741;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _769 = _727 + _767;
    float _771 = _705 * _733;
    float _773 = _703 * _731;
    float _775 = 1.0 / _745;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _779 = _727 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _783 = _727 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _787 = _727 + _785;
    bool _789 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _791 = _701 * _729;
    float _793 = _783 * _751;
    bool _795 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _797 = isnan(_727);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = 1.0 / _749;
    float _809 = _779 * _765;
    bool _811 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _813 = isnan(_727);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -_805;
    float _825 = _823 + 1.0;
    float _827 = _769 * _775;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _833;
    float _837 = _821 * _825;
    bool _839 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _841 = isnan(_727);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = fma(_831, _793, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _853 = fma(_835, _793, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _855 = -_821;
    float _857 = _855 + 1.0;
    float _859 = _787 * _807;
    bool _861 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _863 = isnan(_727);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _873;
    float _877 = fma(_875, _793, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _879 = -_871;
    float _881 = _879 + 1.0;
    float _883 = _871 * _857;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _893 = _763 * _881;
    float _895 = -_763;
    float _897 = _895 + 1.0;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _903 = fma(_887, _809, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _905 = fma(_891, _809, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _907 = _849 * _897;
    float _909 = -_849;
    float _911 = _909 + 1.0;
    float _913 = fma(_901, _809, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _915 = _851 * _907;
    float _917 = _853 * _907;
    float _919 = _877 * _907;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _921;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _925;
    float _929 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[107].x, _915);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _931;
    float _935 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[107].y, _917);
    float _937 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[107].z, _919);
    float _939 = fma(_923, _827, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _941 = fma(_927, _827, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _943 = fma(_903, _893, _929);
    float _945 = fma(_933, _827, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _947 = fma(_913, _893, _935);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _957 = fma(_905, _893, _937);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _963 = fma(_939, _883, _943);
    float _965 = fma(_951, _859, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _967 = fma(_955, _859, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _969 = fma(_941, _883, _947);
    float _971 = fma(_961, _859, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _973 = fma(_945, _883, _957);
    float _975 = fma(_965, _837, _963);
    float _977 = fma(_967, _837, _969);
    float _979 = fma(_971, _837, _973);
    float _981 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[111].x, _975);
    float _983 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[111].y, _977);
    float _985 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[111].z, _979);
    bool _987 = !_789;
    float _1003;
    if (!_987)
    {
        float _989 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _991 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _993 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _995 = _993 * _989;
        float _997 = floor(_995);
        float _999 = -_997;
        float _1001 = _995 + _999;
        _1003 = _1001;
        _1005 = true;
    }
    else
    {
        _1003 = _369;
    }
    _1005 = false;
    float _1007 = _1003;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1011 = _1007 + _1009;
    float _1013 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1023 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1025 = isnan(_1007);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1039 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1041 = isnan(_1007);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1047 = _1043 || _1045;
    float _1049 = float(_1047);
    float _1051 = 1.0 / _1017;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1053;
    float _1057 = -_1033;
    float _1059 = _1057 + 1.0;
    bool _1061 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1063 = isnan(_1007);
    bool _1065 = _1061 || _1063;
    bool _1067 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1069 = _1065 || _1067;
    float _1071 = float(_1069);
    float _1073 = _983 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1075 = _985 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1077 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1079 = 1.0 / _1021;
    float _1081 = 1.0 / _1037;
    float _1083 = _1055 * _1051;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1089 = _1049 * _1059;
    float _1091 = -_1049;
    float _1093 = _1091 + 1.0;
    float _1095 = fma(_1083, _1011, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1097 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1099 = isnan(_1007);
    bool _1101 = _1097 || _1099;
    bool _1103 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1105 = _1101 || _1103;
    float _1107 = float(_1105);
    float _1109 = _1071 * _1093;
    float _1111 = _1087 * _1079;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1113;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1119 = _1007 + _1117;
    float _1121 = _1095 * _1109;
    float _1123 = -_1071;
    float _1125 = _1123 + 1.0;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1129 = _1007 + _1127;
    float _1131 = fma(_1111, _1119, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1133 = _1115 * _1081;
    float _1135 = -_1107;
    float _1137 = _1135 + 1.0;
    float _1139 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1121);
    float _1141 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = fma(_1133, _1129, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1145 = _1033 * _1137;
    float _1147 = fma(_1131, _1089, _1139);
    float _1149 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1151 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = fma(_1143, _1145, _1147);
    float _1155 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1153);
    float _1157 = _1155 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _1149;
    out.m_59.y = _1141;
    out.m_59.z = _1151;
    out.m_59.w = _1157;
    bool _1159 = !_1077;
    float _1175;
    if (!_1159)
    {
        float _1161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1163 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1165 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[11].z, _113);
        float _1167 = _1165 * _1161;
        float _1169 = floor(_1167);
        float _1171 = -_1169;
        float _1173 = _1167 + _1171;
        _1175 = _1173;
        _1177 = true;
    }
    else
    {
        _1175 = _369;
    }
    _1177 = false;
    float _1179 = _1175;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1183 = _1179 + _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1187 = _1179 + _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1189;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1195 = _1193 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1203 = _1201 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1207 = _1179 + _1205;
    float _1209 = 1.0 / _1195;
    bool _1211 = _1179 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1213 = isnan(_1179);
    bool _1215 = _1211 || _1213;
    bool _1217 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1219 = _1215 || _1217;
    float _1221 = float(_1219);
    float _1223 = 1.0 / _1199;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1225;
    bool _1229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1231 = 1.0 / _1203;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1235 = _1179 + _1233;
    float _1237 = 1.0 / _1191;
    float _1239 = _1235 * _1209;
    bool _1241 = _1179 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1243 = isnan(_1179);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = _1183 * _1223;
    bool _1255 = _1179 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1257 = isnan(_1179);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    bool _1267 = _1179 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1269 = isnan(_1179);
    bool _1271 = _1267 || _1269;
    bool _1273 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1275 = _1271 || _1273;
    float _1277 = float(_1275);
    float _1279 = -_1251;
    float _1281 = _1279 + 1.0;
    float _1283 = _1187 * _1231;
    bool _1285 = _1179 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1287 = isnan(_1179);
    bool _1289 = _1285 || _1287;
    bool _1291 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1293 = _1289 || _1291;
    float _1295 = float(_1293);
    float _1297 = -_1265;
    float _1299 = _1297 + 1.0;
    float _1301 = fma(_1227, _1253, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1303 = _1295 * _1281;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1309 = _1207 * _1237;
    float _1311 = -_1295;
    float _1313 = _1311 + 1.0;
    float _1315 = _1277 * _1299;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1321;
    float _1325 = -_1277;
    float _1327 = _1325 + 1.0;
    float _1329 = _1265 * _1313;
    float _1331 = fma(_1319, _1253, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1333 = fma(_1323, _1253, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1341 = _1339 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1343 = _1221 * _1327;
    float _1345 = fma(_1307, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1347 = fma(_1337, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1349 = fma(_1341, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1351 = _1331 * _1343;
    float _1353 = _1333 * _1343;
    float _1355 = -_1221;
    float _1357 = _1355 + 1.0;
    float _1359 = _1301 * _1343;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1361;
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1365;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1369;
    float _1373 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1351);
    float _1375 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1353);
    float _1377 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1359);
    float _1379 = fma(_1363, _1309, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1381 = fma(_1367, _1309, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1383 = fma(_1371, _1309, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1385 = fma(_1347, _1315, _1373);
    float _1387 = fma(_1349, _1315, _1375);
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1395 = _1393 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1397 = fma(_1345, _1315, _1377);
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1401 = _1399 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1403 = fma(_1379, _1329, _1385);
    float _1405 = fma(_1391, _1239, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1407 = fma(_1395, _1239, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1409 = fma(_1401, _1239, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1411 = fma(_1381, _1329, _1387);
    float _1413 = fma(_1383, _1329, _1397);
    float _1415 = fma(_1405, _1303, _1403);
    float _1417 = fma(_1407, _1303, _1411);
    float _1419 = fma(_1409, _1303, _1413);
    float _1421 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1415);
    float _1423 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1417);
    float _1425 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1419);
    bool _1427 = !_1229;
    float _1443;
    if (!_1427)
    {
        float _1429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1431 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1433 = fma(_1431, (*spvDescriptorSet0.vp_c9)._m0[11].w, _113);
        float _1435 = _1433 * _1429;
        float _1437 = floor(_1435);
        float _1439 = -_1437;
        float _1441 = _1435 + _1439;
        _1443 = _1441;
        _1445 = true;
    }
    else
    {
        _1443 = _369;
    }
    _1445 = false;
    float _1447 = _1443;
    float _1449 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1451 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1453 = _1447 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1455 = isnan(_1447);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1461 = _1457 || _1459;
    float _1463 = float(_1461);
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1467 = _1465 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1469 = _1447 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1471 = isnan(_1447);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1477 = _1473 || _1475;
    float _1479 = float(_1477);
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1481;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1487 = _1447 + _1485;
    float _1489 = -_1463;
    float _1491 = _1489 + 1.0;
    float _1493 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1495 = 1.0 / _1467;
    float _1497 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1499 = _1479 * _1491;
    float _1501 = -_1479;
    float _1503 = _1501 + 1.0;
    float _1505 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1507 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1509 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1511 = _1483 * _1495;
    float _1513 = fma(_1511, _1487, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1515 = _1513 * _1499;
    float _1517 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1515);
    float _1519 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1517);
    float _1521 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _1497;
    out.m_61.y = _1505;
    out.m_61.z = _1507;
    out.m_61.w = _1521;
    bool _1523 = !_1509;
    float _1539;
    if (!_1523)
    {
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1527 = _145 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[14].x, _113);
        float _1531 = _1529 * _1525;
        float _1533 = floor(_1531);
        float _1535 = -_1533;
        float _1537 = _1531 + _1535;
        _1539 = _1537;
        _1541 = true;
    }
    else
    {
        _1539 = _369;
    }
    _1541 = false;
    float _1543 = _1539;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1547 = _1543 + _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1551 = _1543 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1553;
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1563 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1575 = _1573 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1577 = 1.0 / _1563;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1581 = _1543 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1585 = _1543 + _1583;
    bool _1587 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1589 = isnan(_1543);
    bool _1591 = _1587 || _1589;
    bool _1593 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1595 = _1591 || _1593;
    float _1597 = float(_1595);
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1599;
    float _1603 = 1.0 / _1559;
    bool _1605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1607 = 1.0 / _1567;
    float _1609 = 1.0 / _1575;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1611;
    float _1615 = _1547 * _1603;
    bool _1617 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1619 = isnan(_1543);
    bool _1621 = _1617 || _1619;
    bool _1623 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1625 = _1621 || _1623;
    float _1627 = float(_1625);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1631 = _1543 + _1629;
    float _1633 = 1.0 / _1613;
    float _1635 = _1631 * _1577;
    float _1637 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1639 = _1543 + _1637;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1643 = _1543 + _1641;
    float _1645 = _1581 * _1607;
    float _1647 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1647;
    float _1651 = fma(_1601, _1635, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1655 = _1653 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1657 = 1.0 / _1555;
    float _1659 = -_1627;
    float _1661 = _1659 + 1.0;
    float _1663 = _1639 * _1609;
    bool _1665 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1667 = isnan(_1543);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1673 = _1669 || _1671;
    float _1675 = float(_1673);
    float _1677 = fma(_1649, _1635, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1679 = 1.0 / _1571;
    bool _1681 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1683 = isnan(_1543);
    bool _1685 = _1681 || _1683;
    bool _1687 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1689 = _1685 || _1687;
    float _1691 = float(_1689);
    float _1693 = _1643 * _1633;
    float _1695 = -_1691;
    float _1697 = _1695 + 1.0;
    float _1699 = _1691 * _1661;
    float _1701 = _1551 * _1657;
    bool _1703 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1705 = isnan(_1543);
    bool _1707 = _1703 || _1705;
    bool _1709 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1711 = _1707 || _1709;
    float _1713 = float(_1711);
    bool _1715 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1717 = isnan(_1543);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1723 = _1719 || _1721;
    float _1725 = float(_1723);
    float _1727 = _1713 * _1697;
    float _1729 = -_1713;
    float _1731 = _1729 + 1.0;
    float _1733 = -_1725;
    float _1735 = _1733 + 1.0;
    float _1737 = _1585 * _1679;
    bool _1739 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1741 = isnan(_1543);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1747 = _1743 || _1745;
    float _1749 = float(_1747);
    float _1751 = _1675 * _1731;
    float _1753 = -_1675;
    float _1755 = _1753 + 1.0;
    float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1757;
    float _1761 = _1725 * _1755;
    float _1763 = fma(_1759, _1635, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1765 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1767 = isnan(_1543);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    float _1777 = _1749 * _1735;
    float _1779 = -_1749;
    float _1781 = _1779 + 1.0;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1785 = _1783 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1789 = _1787 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1791 = -_1775;
    float _1793 = _1791 + 1.0;
    float _1795 = fma(_1655, _1645, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1797 = _1775 * _1781;
    float _1799 = _1597 * _1793;
    float _1801 = fma(_1785, _1645, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1803 = fma(_1789, _1645, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1805 = _1763 * _1799;
    float _1807 = _1651 * _1799;
    float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1809;
    float _1813 = _1677 * _1799;
    float _1815 = -_1597;
    float _1817 = _1815 + 1.0;
    float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1821 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1819;
    float _1823 = fma(_1811, _1701, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1825;
    float _1829 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1813);
    float _1831 = fma(_1821, _1701, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1833 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1807);
    float _1835 = fma(_1827, _1701, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1837 = fma(_1795, _1797, _1829);
    float _1839 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1805);
    float _1841 = fma(_1803, _1797, _1833);
    float _1843 = fma(_1835, _1777, _1837);
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1847 = _1845 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1849 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1851 = _1849 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1853 = fma(_1823, _1777, _1841);
    float _1855 = fma(_1847, _1615, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1857 = fma(_1851, _1615, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1861 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1859;
    float _1863 = fma(_1801, _1797, _1839);
    float _1865 = fma(_1855, _1761, _1843);
    float _1867 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1867;
    float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1873 = _1871 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1875 = fma(_1857, _1761, _1853);
    float _1877 = fma(_1861, _1737, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1879 = fma(_1869, _1737, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1881 = fma(_1873, _1663, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1883 = fma(_1877, _1751, _1875);
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1887 = _1885 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1889 = fma(_1879, _1751, _1865);
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1891;
    float _1895 = fma(_1881, _1727, _1883);
    float _1897 = fma(_1887, _1663, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1899;
    float _1903 = fma(_1893, _1693, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1905 = fma(_1897, _1727, _1889);
    float _1907 = fma(_1901, _1693, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1909 = fma(_1903, _1699, _1895);
    float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1913 = _1911 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1915;
    float _1919 = fma(_1907, _1699, _1905);
    float _1921 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1909);
    float _1923 = fma(_1913, _1615, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1925 = fma(_1831, _1777, _1863);
    float _1927 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1919);
    float _1929 = fma(_1917, _1737, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    out.m_63.y = _1921;
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1933 = _1931 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1935 = fma(_1923, _1761, _1925);
    out.m_63.z = _1927;
    float _1937 = fma(_1933, _1663, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1939;
    float _1943 = fma(_1929, _1751, _1935);
    float _1945 = fma(_1941, _1693, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1947 = fma(_1937, _1727, _1943);
    float _1949 = fma(_1945, _1699, _1947);
    float _1951 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1949);
    bool _1953 = !_1605;
    float _1969;
    if (!_1953)
    {
        float _1955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1957 = _145 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1959 = fma(_1957, (*spvDescriptorSet0.vp_c9)._m0[14].y, _113);
        float _1961 = _1959 * _1955;
        float _1963 = floor(_1961);
        float _1965 = -_1963;
        float _1967 = _1961 + _1965;
        _1969 = _1967;
        _1971 = true;
    }
    else
    {
        _1969 = _369;
    }
    _1971 = false;
    float _1973 = _1969;
    float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1977 = _1973 + _1975;
    bool _1979 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1981 = isnan(_1973);
    bool _1983 = _1979 || _1981;
    bool _1985 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1987 = _1983 || _1985;
    float _1989 = float(_1987);
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1993 = _1991 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1995 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1997 = isnan(_1973);
    bool _1999 = _1995 || _1997;
    bool _2001 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2003 = _1999 || _2001;
    float _2005 = float(_2003);
    float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2009 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2007;
    bool _2011 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2013 = isnan(_1973);
    bool _2015 = _2011 || _2013;
    bool _2017 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2019 = _2015 || _2017;
    float _2021 = float(_2019);
    float _2023 = 1.0 / _1993;
    bool _2025 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2027 = isnan(_1973);
    bool _2029 = _2025 || _2027;
    bool _2031 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2033 = _2029 || _2031;
    float _2035 = float(_2033);
    float _2037 = -_2021;
    float _2039 = _2037 + 1.0;
    bool _2041 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2043 = isnan(_1973);
    bool _2045 = _2041 || _2043;
    bool _2047 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2049 = _2045 || _2047;
    float _2051 = float(_2049);
    float _2053 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2055 = _2053 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2057 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2059 = isnan(_1973);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2065 = _2061 || _2063;
    float _2067 = float(_2065);
    float _2069 = 1.0 / _2055;
    bool _2071 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _2073 = _2009 * _2023;
    float _2075 = -_1989;
    float _2077 = _2075 + 1.0;
    float _2079 = -_2005;
    float _2081 = _2079 + 1.0;
    float _2083 = fma(_2073, _1977, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2085 = _2005 * _2077;
    float _2087 = _2035 * _2081;
    float _2089 = -_2035;
    float _2091 = _2089 + 1.0;
    float _2093 = _2051 * _2039;
    float _2095 = -_2051;
    float _2097 = _2095 + 1.0;
    bool _2099 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2101 = isnan(_1973);
    bool _2103 = _2099 || _2101;
    bool _2105 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2107 = _2103 || _2105;
    float _2109 = float(_2107);
    float _2111 = _2021 * _2091;
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2115 = _2113 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2117 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2119 = _2117 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2121 = _2067 * _2097;
    float _2123 = -_2067;
    float _2125 = _2123 + 1.0;
    float _2127 = 1.0 / _2115;
    float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2131 = _2129 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2133 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2135 = _2133 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2137 = _2135 * _2069;
    float _2139 = 1.0 / _2119;
    float _2141 = _2109 * _2125;
    float _2143 = -_2109;
    float _2145 = _2143 + 1.0;
    float _2147 = _2083 * _2141;
    float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2151 = _1973 + _2149;
    float _2153 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2155 = _2153 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2157 = 1.0 / _2131;
    float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2161 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2159;
    float _2163 = fma(_2137, _2151, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2165 = fma(_2145, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2147);
    float _2167 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2169 = _1973 + _2167;
    float _2171 = _2161 * _2127;
    float _2173 = 1.0 / _2155;
    float _2175 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2177 = _2175 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2181 = _2179 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2183 = fma(_2171, _2169, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2185 = fma(_2163, _2121, _2165);
    float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2189 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2187;
    float _2191 = _2181 * _2139;
    float _2193 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2195 = _2193 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2197 = 1.0 / _2177;
    float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2201 = _1973 + _2199;
    float _2203 = fma(_2183, _2093, _2185);
    float _2205 = _2189 * _2157;
    float _2207 = fma(_2191, _2201, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2211 = _1973 + _2209;
    float _2213 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2215 = _1973 + _2213;
    float _2217 = _2195 * _2173;
    bool _2219 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2221 = isnan(_1973);
    bool _2223 = _2219 || _2221;
    bool _2225 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2227 = _2223 || _2225;
    float _2229 = float(_2227);
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2231;
    float _2235 = fma(_2205, _2211, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2237 = fma(_2207, _2111, _2203);
    float _2239 = fma(_2217, _2215, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2241 = -_2229;
    float _2243 = _2241 + 1.0;
    float _2245 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2247 = _1973 + _2245;
    float _2249 = _2233 * _2197;
    float _2251 = fma(_2235, _2087, _2237);
    float _2253 = _1989 * _2243;
    float _2255 = fma(_2249, _2247, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2257 = fma(_2239, _2085, _2251);
    float _2259 = fma(_2255, _2253, _2257);
    float _2261 = fma(_2229, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2259);
    out.m_65.x = _2261;
    bool _2263 = !_2071;
    if (!_2263)
    {
        float _2265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _2267 = _145 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _2269 = fma(_2267, (*spvDescriptorSet0.vp_c9)._m0[14].z, _113);
        float _2271 = _2269 * _2265;
        float _2273 = floor(_2271);
        float _2275 = -_2273;
        float _2277 = _2271 + _2275;
        _385 = _2277;
    }
    float _2279 = _385;
    int _2281 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _2283 = _2281;
    int _2285 = 0;
    int _2287 = _98(_2283, _2285, (*spvDescriptorSet0.support_buffer));
    float _2289 = in.m_67.z;
    float _2291 = 0.0 + _1951;
    float _2293 = precise::clamp(_2291, 0.0, 1.0);
    int _2295 = _2287 + (-1);
    float _2297 = trunc(_2289);
    int _2299 = int(_2297);
    float _2301 = float(_2295);
    float _2303 = _2293 * _2301;
    float _2305 = trunc(_2303);
    int _2307 = int(_2305);
    int _2309 = _2307 + 1;
    int _2311 = min(_2295, _2309);
    int _2313 = _2307;
    int _2315 = 0;
    int _2317 = _99(_2313, _2315, (*spvDescriptorSet0.support_buffer));
    int _2319 = _2299;
    int _2321 = 0;
    int _2323 = _99(_2319, _2321, (*spvDescriptorSet0.support_buffer));
    float3 _2327 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2317, _2323)), 0).xyz;
    float _2329 = _2327.x;
    float _2331 = _2327.y;
    float _2333 = _2327.z;
    int _2335 = _2311;
    int _2337 = 0;
    int _2339 = _99(_2335, _2337, (*spvDescriptorSet0.support_buffer));
    int _2341 = _2299;
    int _2343 = 0;
    int _2345 = _99(_2341, _2343, (*spvDescriptorSet0.support_buffer));
    float3 _2347 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2339, _2345)), 0).xyz;
    float _2349 = _2347.x;
    float _2351 = _2347.y;
    float _2353 = _2347.z;
    float _2355 = _159 * 2.0;
    float _2357 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2359 = log2(_2357);
    float _2361 = _145 * 2.0;
    float _2363 = _157 * 2.0;
    float _2365 = _381 * _791;
    float _2367 = _381 * _771;
    float _2369 = floor(_2355);
    float _2371 = _2365 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2373 = _2367 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2375 = floor(_2361);
    float _2377 = _2359 * _113;
    float _2379 = _145 + _157;
    float _2381 = _2379 + (-1.0);
    bool _2383 = _2369 > 0.0;
    float _2385 = exp2(_2377);
    bool _2387 = _2369 >= 0.0;
    bool _2389 = isnan(_2369);
    bool _2391 = _2387 || _2389;
    bool _2393 = isnan(0.0);
    bool _2395 = _2391 || _2393;
    float _2397 = fma(_2381, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2399 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2401 = 1.0 + _2399;
    int _2403 = _2395 ? 0 : 1;
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2407 = _2405 != 0;
    int _2409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2411 = _2409 != 0;
    int _2413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2415 = _2413 != 0;
    float _2417 = floor(_2363);
    int _2419 = ~_2403;
    int _2421 = _2419 + 1;
    int _2423 = _2421 + 1;
    bool _2425 = _2375 > 0.0;
    int _2427 = _2423;
    float _2429 = _2279;
    if (!_2383)
    {
        int _2431 = ~_2403;
        int _2433 = _2431 + 1;
        _2427 = _2433;
    }
    int _2435 = _2427;
    float _2437 = in.m_69.x;
    float _2439 = in.m_69.y;
    float _2441 = in.m_69.z;
    bool _2443 = _2375 >= 0.0;
    bool _2445 = isnan(_2375);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan(0.0);
    bool _2451 = _2447 || _2449;
    float _2453 = 1.0 / _2401;
    bool _2455 = !_2407;
    int _2457 = _2455 ? 0 : 1;
    float _2459 = -_2385;
    float _2461 = _2459 + 1.0;
    bool _2463 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2465 = isnan(1.0);
    bool _2467 = _2463 || _2465;
    bool _2469 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2471 = _2467 || _2469;
    int _2473 = abs(_2457);
    bool _2475 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2477 = isnan(0.0);
    bool _2479 = _2475 || _2477;
    bool _2481 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2483 = _2479 || _2481;
    float _2485 = float(_2473);
    float _2487 = float(_2435);
    int _2489 = _2451 ? 0 : 1;
    bool _2491 = !_2411;
    int _2493 = _2491 ? 0 : 1;
    float _2495 = _2485 * _2487;
    bool _2497 = _2417 > 0.0;
    float _2499 = _2483 ? _2461 : 0.0;
    float _2501 = _2495 * (-2.0);
    int _2503 = ~_2489;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    int _2509 = _2507;
    if (!_2425)
    {
        int _2511 = ~_2489;
        int _2513 = _2511 + 1;
        _2509 = _2513;
    }
    int _2515 = _2509;
    if (_2471)
    {
        float _2517 = _2499 * _2453;
        _125 = _2517;
    }
    float _2519 = _125;
    bool _2521 = _2417 >= 0.0;
    bool _2523 = isnan(_2417);
    bool _2525 = _2521 || _2523;
    bool _2527 = isnan(0.0);
    bool _2529 = _2525 || _2527;
    float _2531 = _145 + (-0.5);
    int _2533 = abs(_2493);
    float _2535 = fma(_2501, _2437, _2437);
    bool _2537 = !_2415;
    int _2539 = _2537 ? 0 : 1;
    float _2541 = fma(_2397, _2501, _2397);
    int _2543 = _2529 ? 0 : 1;
    float _2545 = fma(_2531, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2535);
    float _2547 = float(_2533);
    float _2549 = _157 + _159;
    float _2551 = float(_2515);
    float _2553 = fma(_2541, _2519, _2545);
    int _2555 = abs(_2539);
    float _2557 = _2549 + (-1.0);
    int _2559 = ~_2543;
    int _2561 = _2559 + 1;
    int _2563 = _2561 + 1;
    float _2565 = _2547 * _2551;
    int _2567 = _2563;
    if (!_2497)
    {
        int _2569 = ~_2543;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    float _2575 = _157 + (-0.5);
    float _2577 = _2565 * (-2.0);
    float _2579 = _145 + _159;
    float _2581 = float(_2555);
    float _2583 = _159 + (-0.5);
    float _2585 = float(_2573);
    float _2587 = fma(_2557, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2589 = fma(_2577, _2439, _2439);
    float _2591 = _2579 + (-1.0);
    float _2593 = _2553 * 0.15915493667125701904296875;
    float _2595 = _2581 * _2585;
    float _2597 = fma(_2587, _2577, _2587);
    float _2599 = fma(_2575, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2589);
    float _2601 = _2595 * (-2.0);
    float _2603 = _2593 * 6.283185482025146484375;
    float _2605 = cos(_2603);
    float _2607 = fma(_2597, _2519, _2599);
    float _2609 = fma(_2591, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2611 = fma(_2601, _2441, _2441);
    float _2613 = _2607 * 0.15915493667125701904296875;
    float _2615 = _361 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2617 = fma(_2609, _2601, _2609);
    float _2619 = fma(_2583, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2611);
    float _2621 = _2613 * 6.283185482025146484375;
    float _2623 = sin(_2621);
    float _2625 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2615);
    float _2627 = _361 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2629 = fma(_2617, _2519, _2619);
    float _2631 = _361 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2633 = _381 * _773;
    float _2635 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2627);
    float _2637 = _2629 * 0.15915493667125701904296875;
    float _2639 = _2613 * 6.283185482025146484375;
    float _2641 = cos(_2639);
    float _2643 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2631);
    float _2645 = _2633 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2647 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2635);
    float _2649 = _2647 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2651 = floor(_2303);
    float _2653 = _2623 * _2605;
    float _2655 = _2637 * 6.283185482025146484375;
    float _2657 = sin(_2655);
    float _2659 = _2641 * _2605;
    float _2661 = _2637 * 6.283185482025146484375;
    float _2663 = cos(_2661);
    float _2665 = -_2651;
    float _2667 = _2303 + _2665;
    float _2669 = _2593 * 6.283185482025146484375;
    float _2671 = sin(_2669);
    float _2673 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2625);
    float _2675 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2643);
    float _2677 = _2641 * _2657;
    float _2679 = _2623 * _2657;
    float _2681 = _2657 * _2605;
    float _2683 = _2675 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2685 = _2673 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2687 = _2641 * _2663;
    float _2689 = _2623 * _2663;
    float _2691 = _2663 * _2605;
    float _2693 = -_2689;
    float _2695 = fma(_2671, _2677, _2693);
    float _2697 = -_2677;
    float _2699 = fma(_2671, _2689, _2697);
    float _2701 = fma(_2671, _2679, _2687);
    float _2703 = fma(_2671, _2687, _2679);
    float _2705 = -_2331;
    float _2707 = _2705 + _2351;
    float _2709 = -_2329;
    float _2711 = _2709 + _2349;
    float _2713 = -_2333;
    float _2715 = _2713 + _2353;
    float _2717 = fma(_2667, _2707, _2331);
    float _2719 = fma(_2667, _2711, _2329);
    float _2721 = fma(_2667, _2715, _2333);
    float _2723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2717);
    float _2725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2719);
    float _2727 = _2723 * _2645;
    float _2729 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2721);
    float _2731 = _2725 * _2371;
    float _2733 = _2691 * _2727;
    float _2735 = _2729 * _2373;
    float _2737 = _2699 * _2727;
    float _2739 = _2703 * _2727;
    float _2741 = fma(_2681, _2731, _2733);
    float _2743 = fma(_2701, _2731, _2737);
    float _2745 = fma(_2695, _2731, _2739);
    float _2747 = -_2671;
    float _2749 = fma(_2747, _2735, _2741);
    float _2751 = fma(_2653, _2735, _2743);
    float _2753 = fma(_2659, _2735, _2745);
    float _2755 = _2749 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2757 = _2749 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2759 = _2749 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2761 = fma(_2751, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2755);
    float _2763 = fma(_2751, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2757);
    float _2765 = fma(_2751, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2759);
    float _2767 = fma(_2753, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2761);
    float _2769 = fma(_2753, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2763);
    float _2771 = fma(_2753, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2765);
    float _2773 = _2683 + _2767;
    float _2775 = _2649 + _2769;
    float _2777 = _2685 + _2771;
    float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2781 = _2773 + _2779;
    float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2785 = _2775 + _2783;
    float _2787 = _2781 * _2781;
    float _2789 = fma(_2785, _2785, _2787);
    float _2791 = sqrt(_2789);
    bool _2793 = _2791 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2795 = _2787;
    float _2797 = _2765;
    float _2799 = _2773;
    float _2801 = _2771;
    float _2803 = _2671;
    if (!_2793)
    {
        _2795 = _2775;
    }
    float _2805 = _2795;
    float _2807 = _2805;
    if (!_2793)
    {
        _2797 = _2777;
    }
    float _2809 = _2797;
    bool _2811 = !_2793;
    float _2813 = _2809;
    if (!_2811)
    {
        float _2815 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2819 = _2791 + _2817;
        float _2821 = _2777 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2823 = rsqrt(_2789);
        float _2825 = _2819 * _2815;
        float _2827 = _2825 * 0.15915493667125701904296875;
        float _2829 = _2827 * 6.283185482025146484375;
        float _2831 = cos(_2829);
        float _2833 = _2827 * 6.283185482025146484375;
        float _2835 = sin(_2833);
        float _2837 = _2831 + (-1.0);
        float _2839 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2841 = fma(_2835, _2821, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2843 = fma(_2777, _2831, _2839);
        float _2845 = _2823 * _2841;
        float _2847 = fma(_2785, _2845, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2849 = fma(_2781, _2845, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2813 = _2843;
        _2807 = _2847;
        _2799 = _2849;
    }
    float _2851 = _2813;
    float _2853 = _2807;
    float _2855 = _2799;
    float _2857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2859 = _2851 + _2857;
    float _2861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2863 = _2853 + _2861;
    float _2865 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2867 = _2855 + _2865;
    float _2869 = _2859 * _2859;
    float _2871 = fma(_2863, _2863, _2869);
    float _2873 = fma(_2867, _2867, _2871);
    float _2875 = rsqrt(_2873);
    float _2877 = sqrt(_2873);
    float _2879 = _2875 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2881 = _2863 * _2879;
    float _2883 = _2867 * _2879;
    float _2885 = _2881 * _2881;
    float _2887 = _2883 * _2883;
    float _2889 = _2885 + _2887;
    float _2891 = sqrt(_2889);
    bool _2893 = _2891 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2897 = _2891 + _2895;
    float _2899 = _2867;
    float _2901 = _2889;
    float _2903 = _2897;
    float _2905 = _2879;
    if (_2893)
    {
        float _2907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2899 = _2907;
    }
    float _2909 = _2899;
    if (_2893)
    {
        float _2911 = rsqrt(_2889);
        _2901 = _2911;
    }
    float _2913 = _2901;
    float _2915 = _2913;
    if (_2893)
    {
        float _2917 = _2897 * _2909;
        _2903 = _2917;
    }
    float _2919 = _2903;
    if (_2893)
    {
        float _2921 = _2919 * 0.15915493667125701904296875;
        _2801 = _2921;
    }
    float _2923 = _2801;
    float _2925 = _2909;
    float _2927 = _2923;
    if (_2893)
    {
        float _2929 = _2923 * 6.283185482025146484375;
        float _2931 = sin(_2929);
        _2925 = _2931;
    }
    float _2933 = _2925;
    float _2935 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2937 = precise::max(0.0, _2935);
    float _2939 = _2869;
    float _2941 = _2937;
    if (_2893)
    {
        float _2943 = _2923 * 6.283185482025146484375;
        float _2945 = cos(_2943);
        _2939 = _2945;
    }
    float _2947 = _2939;
    float _2949 = -_2879;
    float _2951 = -_2937;
    float _2953 = fma(_2859, _2949, _2951);
    float _2955 = _2953;
    if (_2893)
    {
        float _2957 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2941 = _2957;
    }
    float _2959 = _2941;
    float _2961 = _2933;
    float _2963 = _2959;
    if (_2893)
    {
        float _2965 = fma(_2933, _2959, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2961 = _2965;
    }
    float _2967 = _2961;
    float _2969 = _2967;
    float _2971 = _2947;
    if (_2893)
    {
        float _2973 = _2947 + (-1.0);
        _2963 = _2973;
    }
    float _2975 = _2963;
    float _2977 = _2975;
    if (_2893)
    {
        float _2979 = _2913 * _2967;
        _2905 = _2979;
    }
    float _2981 = _2905;
    if (!_2893)
    {
        _2969 = _2881;
    }
    float _2983 = _2969;
    float _2985 = _2983;
    if (_2893)
    {
        float _2987 = _2975 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2927 = _2987;
    }
    float _2989 = _2927;
    if (_2893)
    {
        float _2991 = _2881 * _2981;
        _2985 = _2991;
    }
    float _2993 = _2985;
    if (!_2893)
    {
        _2977 = _2883;
    }
    float _2995 = _2977;
    float _2997 = _2995;
    if (_2893)
    {
        float _2999 = _2883 * _2981;
        _2997 = _2999;
    }
    float _3001 = _2997;
    if (!_2893)
    {
        _2915 = _2885;
    }
    float _3003 = _2915;
    float _3005 = _3003;
    if (_2893)
    {
        float _3007 = fma(_2953, _2947, _2989);
        _2955 = _3007;
    }
    float _3009 = _2955;
    if (_2893)
    {
        float _3011 = _2993 * _2993;
        _3005 = _3011;
    }
    float _3013 = _3005;
    if (!_2893)
    {
        _2971 = _2887;
    }
    float _3015 = _2971;
    float _3017 = _3015;
    if (_2893)
    {
        float _3019 = _3001 * _3001;
        _3017 = _3019;
    }
    float _3021 = _3017;
    float _3023 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3025 = fma(_3009, _3009, _3013);
    float _3027 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3029 = _3025 + _3021;
    float _3031 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3023);
    float _3033 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3037 = fma(_2877, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3035);
    float _3039 = precise::clamp(_3037, 0.0, 1.0);
    float _3041 = rsqrt(_3029);
    float _3043 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3031);
    float _3045 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3047 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3033);
    float _3049 = -_3039;
    float _3051 = _3049 + 1.0;
    float _3053 = _3043 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3055 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3045);
    float _3057 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3047);
    float _3059 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3061 = _3053 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3063 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3055);
    float _3065 = _3057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3067 = abs(_3051);
    float _3069 = log2(_3067);
    float _3071 = -_3061;
    float _3073 = fma(_3071, _3027, 1.0);
    float _3075 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3059);
    float _3077 = _3063 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3079 = _3041 * _2993;
    float _3081 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3083 = _3041 * _3009;
    float _3085 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3075);
    float _3087 = _3079 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3089 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3081);
    float _3091 = _3041 * _3001;
    float _3093 = _3085 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3095 = -_3087;
    float _3097 = fma(_3083, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3095);
    float _3099 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3089);
    float _3101 = log2(_3073);
    float _3103 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3105 = -_3091;
    float _3107 = fma(_3105, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3097);
    float _3109 = fma(_3093, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3099);
    float _3111 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3113 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3115 = fma(_3107, -0.5, 0.5);
    float _3117 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3103);
    float _3119 = 1.0 / _3109;
    float _3121 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3113);
    float _3123 = fma(_3107, 0.5, 0.5);
    float _3125 = _3083 + 1.0;
    float _3127 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3121);
    float _3129 = fma(_3123, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3131 = exp2(_3111);
    float _3133 = fma(_3093, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3127);
    float _3135 = _3101 * 0.693147182464599609375;
    float _3137 = fma(_3123, _3129, -0.212114393711090087890625);
    float _3139 = _3135 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3141 = fma(_3123, _3137, 1.570728778839111328125);
    float _3143 = sqrt(_3115);
    float _3145 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3117);
    float _3147 = _3133 * _3119;
    float _3149 = fma(_3093, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3145);
    float _3151 = fma(_3147, 0.5, 0.5);
    float _3153 = -_3083;
    float _3155 = fma(_3131, _3125, _3153);
    float _3157 = _3149 * _3119;
    float _3159 = fma(_3155, 0.5, 0.5);
    float _3161 = fma(_3157, -0.5, 0.5);
    float _3163 = _3143 * 0.636619746685028076171875;
    float3 _8641 = float3(_3151, _3161, _3139);
    float _3165 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8641, float3(0.0), isnan(_8641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8641, float3(0.0), isnan(_8641)), level(0.0)).x;
    float _3167 = -_3141;
    float _3169 = fma(_3163, _3167, 1.0);
    float3 _8657 = float3(_3151, _3161, _3139);
    float4 _3172 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8657, float3(0.0), isnan(_8657)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8657, float3(0.0), isnan(_8657)), level(0.0)).xyzw;
    float _3174 = _3172.x;
    float _3176 = _3172.y;
    float _3178 = _3172.z;
    float _3180 = _3172.w;
    float2 _8674 = float2(_3169, _3159);
    float3 _3182 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8674, float2(0.0), isnan(_8674)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8674, float2(0.0), isnan(_8674)), level(0.0)).xyz;
    float _3184 = _3182.x;
    float _3186 = _3182.y;
    float _3188 = _3182.z;
    float _3190 = in.m_71.x;
    float _3192 = in.m_71.y;
    float _3194 = in.m_71.z;
    float _3196 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3198 = in.m_73.x;
    float _3200 = in.m_73.y;
    float _3202 = in.m_73.z;
    float _3204 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3206 = _3204 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3208 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3210 = isnan(0.5);
    bool _3212 = _3208 || _3210;
    bool _3214 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3216 = _3212 || _3214;
    float _3218 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3220 = _3218 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3222 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3196);
    bool _3224 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _3226 = isnan(_2279);
    bool _3228 = _3224 || _3226;
    bool _3230 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _3232 = _3228 || _3230;
    float _3234 = float(_3232);
    float _3236 = 1.0 / _3206;
    bool _3238 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _3240 = isnan(_2279);
    bool _3242 = _3238 || _3240;
    bool _3244 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _3246 = _3242 || _3244;
    float _3248 = float(_3246);
    float _3250 = -(*spvDescriptorSet0.vp_c9)._m0[175].y;
    float _3252 = (*spvDescriptorSet0.vp_c9)._m0[176].y + _3250;
    float _3254 = -(*spvDescriptorSet0.vp_c9)._m0[176].y;
    float _3256 = _3254 + (*spvDescriptorSet0.vp_c9)._m0[177].y;
    bool _3258 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _3260 = isnan(_2279);
    bool _3262 = _3258 || _3260;
    bool _3264 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _3266 = _3262 || _3264;
    float _3268 = float(_3266);
    float _3270 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3222);
    float _3272 = -_3248;
    float _3274 = _3272 + 1.0;
    bool _3276 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3278 = isnan(_2279);
    bool _3280 = _3276 || _3278;
    bool _3282 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _3284 = _3280 || _3282;
    float _3286 = float(_3284);
    float _3288 = 1.0 / _3220;
    bool _3290 = _2717 != 0.0;
    bool _3292 = isnan(_2717);
    bool _3294 = _3290 || _3292;
    bool _3296 = isnan(0.0);
    bool _3298 = _3294 || _3296;
    float _3300 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_75.x = _2649;
    out.m_75.y = _2685;
    out.m_75.z = _2683;
    float _3302 = -_3286;
    float _3304 = _3302 + 1.0;
    bool _3306 = _2719 == 0.0;
    bool _3308 = !_3298;
    bool _3310 = _3306 && _3308;
    out.m_77.x = _2853;
    out.m_77.y = _2851;
    out.m_77.z = _2855;
    float _3312 = -_3190;
    float _3314 = _3312 + _3198;
    float _3316 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3318 = _3316 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3320 = _3252 * _3236;
    float _3322 = -_3192;
    float _3324 = _3322 + _3200;
    float _3326 = 1.0 / _3318;
    float _3328 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3330 = _3328 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3332 = fma(_1951, _3314, _3190);
    float _3334 = fma(_1951, _3324, _3192);
    float _3336 = -(*spvDescriptorSet0.vp_c9)._m0[177].y;
    float _3338 = (*spvDescriptorSet0.vp_c9)._m0[178].y + _3336;
    bool _3340 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _3342 = isnan(_2279);
    bool _3344 = _3340 || _3342;
    bool _3346 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _3348 = _3344 || _3346;
    float _3350 = float(_3348);
    float _3352 = 1.0 / _3330;
    float _3354 = -_3234;
    float _3356 = _3354 + 1.0;
    float _3358 = _3256 * _3288;
    bool _3360 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _3362 = isnan(_2279);
    bool _3364 = _3360 || _3362;
    bool _3366 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _3368 = _3364 || _3366;
    float _3370 = float(_3368);
    float _3372 = -_3194;
    float _3374 = _3372 + _3202;
    float _3376 = _3350 * _3356;
    float _3378 = -_3350;
    float _3380 = _3378 + 1.0;
    bool _3382 = _2721 == 0.0;
    bool _3384 = _3382 && _3310;
    float _3386 = _3338 * _3326;
    float _3388 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3390 = _3388 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3392 = -_3370;
    float _3394 = _3392 + 1.0;
    float _3396 = _3370 * _3380;
    float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[178].y;
    float _3400 = _3398 + (*spvDescriptorSet0.vp_c9)._m0[179].y;
    float _3402 = fma(_1951, _3374, _3194);
    float _3404 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3406 = _3404 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3408 = _3248 * _3394;
    float _3410 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3412 = _2279 + _3410;
    float _3414 = _3400 * _3352;
    float _3416 = _3268 * _3274;
    float _3418 = -_3268;
    float _3420 = _3418 + 1.0;
    float _3422 = 1.0 / _3406;
    float _3424 = fma(_3320, _3412, (*spvDescriptorSet0.vp_c9)._m0[175].y);
    bool _3426 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _3428 = isnan(_2279);
    bool _3430 = _3426 || _3428;
    bool _3432 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _3434 = _3430 || _3432;
    float _3436 = float(_3434);
    float _3438 = _3286 * _3420;
    float _3440 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3442 = _2279 + _3440;
    float _3444 = -(*spvDescriptorSet0.vp_c9)._m0[179].y;
    float _3446 = (*spvDescriptorSet0.vp_c9)._m0[180].y + _3444;
    float _3448 = -(*spvDescriptorSet0.vp_c9)._m0[180].y;
    float _3450 = _3448 + (*spvDescriptorSet0.vp_c9)._m0[181].y;
    float _3452 = 1.0 / _3390;
    float _3454 = _3436 * _3304;
    float _3456 = fma(_3358, _3442, (*spvDescriptorSet0.vp_c9)._m0[176].y);
    float _3458 = -_3436;
    float _3460 = _3458 + 1.0;
    float _3462 = _3424 * _3454;
    float _3464 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3466 = _2279 + _3464;
    float _3468 = _3334;
    float _3470 = _3332;
    float _3472 = _3402;
    float _3474 = _3234;
    if (!_3384)
    {
        float _3476 = fma(_2717, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3334);
        _3468 = _3476;
    }
    float _3478 = _3468;
    float _3480 = _3450 * _3422;
    float _3482 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3484 = _2279 + _3482;
    float _3486 = fma(_3460, (*spvDescriptorSet0.vp_c9)._m0[175].y, _3462);
    float _3488 = -(*spvDescriptorSet0.vp_c9)._m0[181].y;
    float _3490 = (*spvDescriptorSet0.vp_c9)._m0[182].y + _3488;
    float _3492 = exp2(_3300);
    float _3494 = fma(_3386, _3484, (*spvDescriptorSet0.vp_c9)._m0[177].y);
    float _3496 = fma(_3456, _3438, _3486);
    float _3498 = fma(_3414, _3466, (*spvDescriptorSet0.vp_c9)._m0[178].y);
    float _3500 = _3446 * _3452;
    float _3502 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3504 = _2279 + _3502;
    float _3506 = fma(_3494, _3416, _3496);
    float _3508 = _3270 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3510 = fma(_3500, _3504, (*spvDescriptorSet0.vp_c9)._m0[179].y);
    float _3512 = fma(_3498, _3408, _3506);
    float _3514 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3516 = 1.0 / _3508;
    float _3518 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3520 = _2279 + _3518;
    float _3522 = fma(_3510, _3396, _3512);
    float _3524 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3526 = _3524 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _3528 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3514);
    float _3530 = fma(_3480, _3520, (*spvDescriptorSet0.vp_c9)._m0[180].y);
    float _3532 = _3512;
    if (!_3216)
    {
        _3532 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3534 = _3532;
    float _3536 = _3534;
    if (!_3384)
    {
        float _3538 = fma(_2719, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3332);
        _3470 = _3538;
    }
    float _3540 = _3470;
    float _3542 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3528);
    float _3544 = 1.0 / _3526;
    float _3546 = fma(_3530, _3376, _3522);
    bool _3548 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _3550 = isnan(_2279);
    bool _3552 = _3548 || _3550;
    bool _3554 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _3556 = _3552 || _3554;
    float _3558 = float(_3556);
    float _3560 = _3542 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3562 = _2691 * _3478;
    float _3564 = _2699 * _3478;
    float _3566 = _2703 * _3478;
    float _3568 = _3560 + _3508;
    float _3570 = -_3558;
    float _3572 = _3570 + 1.0;
    if (!_3384)
    {
        float _3574 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3402);
        _3472 = _3574;
    }
    float _3576 = _3472;
    float _3578 = fma(_2681, _3540, _3562);
    float _3580 = _3568 * _3516;
    float _3582 = _3580 * 0.5;
    float _3584 = _3234 * _3572;
    float _3586 = fma(_2701, _3540, _3564);
    float _3588 = fma(_2695, _3540, _3566);
    if (!_3216)
    {
        float _3590 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3592 = fma(_3582, _3534, _3590);
        _3536 = _3592;
    }
    float _3594 = _3536;
    float _3596 = _3490 * _3544;
    float _3598 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3600 = _2279 + _3598;
    if (!_3216)
    {
        _2429 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3602 = _2429;
    float _3604 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3606 = -_2671;
    float _3608 = fma(_3606, _3576, _3578);
    float _3610 = fma(_3596, _3600, (*spvDescriptorSet0.vp_c9)._m0[181].y);
    float _3612 = _3594;
    if (!_3216)
    {
        float _3614 = 1.0 / _3594;
        _3612 = _3614;
    }
    float _3616 = _3612;
    if (!_3216)
    {
        float _3618 = -_3602;
        float _3620 = _3618 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3474 = _3620;
    }
    float _3622 = _3474;
    float _3624 = -_3492;
    float _3626 = _3624 + 1.0;
    float _3628 = fma(_3610, _3584, _3546);
    float _3630 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3604);
    float _3632 = fma(_2653, _3576, _3586);
    float _3634 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3636 = fma(_3558, (*spvDescriptorSet0.vp_c9)._m0[182].y, _3628);
    float _3638 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3630);
    float _3640 = _3558;
    float _3642 = _3622;
    if (!_3216)
    {
        float _3644 = 1.0 / _3622;
        _3640 = _3644;
    }
    float _3646 = _3640;
    float _3648 = fma(_2659, _3576, _3588);
    float _3650 = _3608 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _3652 = _3109 * 0.5;
    float _3654 = -_3634;
    float _3656 = _3654 + 1.0;
    float _3658 = fma(_3632, (*spvDescriptorSet0.vp_c10)._m0[9].x, _3650);
    if (!_3216)
    {
        float _3660 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3662 = -_3602;
        float _3664 = fma(_3616, _3660, _3662);
        _2803 = _3664;
    }
    float _3666 = _2803;
    float _3668 = _3608 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_3216)
    {
        _3642 = 1.0;
    }
    float _3670 = _3642;
    float _3672 = _3608 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _3674 = fma(_3149, -0.5, _3652);
    float _3676 = fma(_3632, (*spvDescriptorSet0.vp_c10)._m0[8].x, _3668);
    float _3678 = fma(_3093, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3638);
    float _3680 = fma(_3632, (*spvDescriptorSet0.vp_c10)._m0[10].x, _3672);
    float _3682 = fma(_3648, (*spvDescriptorSet0.vp_c10)._m0[9].z, _3658);
    float _3684 = _3670;
    if (!_3216)
    {
        float _3686 = _3666 * _3646;
        float _3688 = precise::clamp(_3686, 0.0, 1.0);
        _3684 = _3688;
    }
    float _3690 = _3684;
    float _3692 = fma(_3648, (*spvDescriptorSet0.vp_c10)._m0[8].z, _3676);
    float _3694 = _3678 + _3109;
    float _3696 = _3133 + _3109;
    float _3698 = _3690 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3700 = _3690 > 0.0;
    bool _3702 = isnan(_3690);
    bool _3704 = _3700 || _3702;
    bool _3706 = isnan(0.0);
    bool _3708 = _3704 || _3706;
    float _3710 = fma(_3648, (*spvDescriptorSet0.vp_c10)._m0[10].z, _3680);
    float _3712 = _3694 * 0.5;
    float _3714 = _3696 * 0.5;
    float _3716 = _3698 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.y = _3636;
    out.m_81.x = _3692;
    out.m_81.y = _3682;
    out.m_81.z = _3710;
    out.gl_Position.x = _3133;
    out.gl_Position.y = _3149;
    out.gl_Position.z = _3678;
    out.gl_Position.w = _3109;
    out.m_83.x = _3714;
    out.m_83.y = _3674;
    out.m_83.z = _3712;
    out.m_83.w = _3109;
    out.m_51.x = _3716;
    float _3718 = _3634 * _3165;
    float _3720 = _3180 * _3718;
    float _3722 = _3180 * _3656;
    float _3724 = _3188 * _3718;
    float _3726 = fma(_3184, _3720, _3174);
    float _3728 = fma(_3186, _3720, _3176);
    float _3730 = fma(_3180, _3724, _3178);
    out.m_85.x = _3726;
    out.m_85.y = _3728;
    out.m_85.z = _3730;
    out.m_85.w = _3722;
    if (_3708)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3732 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3732;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_75 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_83 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_79 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_81 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_77 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_85 = float4(0.0, 0.0, 0.0, 1.0);
    bool _1971 = false;
    bool _1541 = false;
    bool _1445 = false;
    bool _1177 = false;
    bool _1005 = false;
    bool _725 = false;
    bool _403 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _103 = in.m_44.w;
    float _105 = in.m_46.w;
    float _107 = trunc(_103);
    int _109 = int(_107);
    float _111 = -_105;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_49.y = _113;
    bool _117 = _109 >= 1;
    float _119 = 0.0;
    float _121 = as_type<float>(_109);
    float _123 = 0.0;
    float _125 = _113;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _127 = _119;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _129 = 0;
    if (!_117)
    {
        float _131 = _127 * 5.0;
        _129 = as_type<int>(_131);
    }
    int _133 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3800 = as_type<float>(_133);
        out.gl_Position.z = _3800;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _135 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_105);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = in.m_53.x;
    float _147 = float(_109);
    float _149 = in.m_53.w;
    bool _151 = _113 >= _147;
    bool _153 = !_143;
    bool _155 = _151 || _153;
    float _157 = in.m_53.y;
    float _159 = in.m_53.z;
    if (_155)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _121;
    if (_155)
    {
        out.m_51.x = 0.0;
    }
    int _163 = 0;
    if (_155)
    {
        float _165 = _161 * 5.0;
        _163 = as_type<int>(_165);
    }
    int _167 = _163;
    out.m_55.x = _145;
    out.m_55.w = _149;
    if (_155)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3867 = as_type<float>(_167);
        out.gl_Position.z = _3867;
    }
    out.m_55.y = _157;
    out.m_55.z = _159;
    if (_155)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _171 = _113 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    float _173 = _113 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    bool _175 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _177 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _179 = _175 || _177;
    bool _181 = isnan(1.0);
    bool _183 = _179 || _181;
    float _185 = _171 * _169;
    if (!_183)
    {
        float _187 = _173 * _173;
        float _189 = _187 * 0.5;
        _123 = _189;
    }
    float _191 = _123;
    float _193 = fma(_145, (*spvDescriptorSet0.vp_c9)._m0[20].x, _185);
    float _195 = in.m_46.x;
    float _197 = in.m_46.y;
    float _199 = in.m_46.z;
    float _201 = _191;
    if (!_183)
    {
        float _203 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _201 = _203;
    }
    float _205 = _201;
    float _207 = _193 * 6.283185482025146484375;
    float _209 = floor(_193);
    float _211 = _207 * 0.15915493667125701904296875;
    int _213 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _215 = _213 != 0;
    float _217 = _211 * 6.283185482025146484375;
    float _219 = cos(_217);
    float _221 = 1.4012984643248170709237295832899e-45;
    float _223 = _205;
    if (!_183)
    {
        _221 = _173;
    }
    float _225 = _221;
    float _227 = -_209;
    float _229 = _193 + _227;
    bool _231 = !_183;
    float _233 = _225;
    if (!_231)
    {
        float _235 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _237 = log2(_235);
        float _239 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _241 = _239 + 1.0;
        float _243 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _245 = _173 * _237;
        float _247 = 1.0 / _241;
        float _249 = _243 * 0.693147182464599609375;
        float _251 = exp2(_245);
        float _253 = 1.0 / _249;
        float _255 = _251 + (-1.0);
        float _257 = -_255;
        float _259 = fma(_257, _253, _173);
        float _261 = _259 * _247;
        float _263 = _261 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _223 = _263;
    }
    float _265 = _223;
    bool _267 = !_183;
    if (!_267)
    {
        float _269 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _271 = log2(_269);
        float _273 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _275 = _273 + 1.0;
        float _277 = 1.0 / _275;
        float _279 = _173 * _271;
        float _281 = exp2(_279);
        float _283 = -_281;
        float _285 = _283 + 1.0;
        float _287 = _285 * _277;
        _233 = _287;
    }
    float _289 = _233;
    float _291 = in.m_57.w;
    float _293 = in.m_44.x;
    float _295 = in.m_44.y;
    float _297 = in.m_44.z;
    bool _299 = _229 < 0.5;
    float _301 = float(_299);
    float _303 = -_229;
    float _305 = fma(_303, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _309 = _307 != 0;
    int _311 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _313 = _311 != 0;
    float _315 = fma(_219, 0.5, 0.5);
    float _317 = -_301;
    float _319 = fma(_317, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _321 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    bool _323 = !_309;
    int _325 = _323 ? 0 : 1;
    float _327 = -_315;
    float _329 = fma(_327, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _331 = !_215;
    int _333 = _331 ? 0 : 1;
    float _335 = fma(_289, _195, _321);
    int _337 = abs(_325);
    int _339 = abs(_333);
    float _341 = 1.0 / _147;
    bool _343 = !_313;
    int _345 = _343 ? 0 : 1;
    float _347 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    bool _349 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _351 = abs(_345);
    float _353 = fma(_289, _197, _347);
    float _355 = float(_337);
    float _357 = _265 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _359 = float(_339);
    float _361 = fma(_353, _291, _295);
    float _363 = abs(_305);
    float _365 = _355 * _363;
    float _367 = fma(_289, _199, _357);
    float _369 = _113 * _341;
    float _371 = float(_351);
    float _373 = fma(_359, _329, _365);
    float _375 = fma(_335, _291, _293);
    float _377 = fma(_367, _291, _297);
    float _379 = abs(_319);
    float _381 = fma(_371, _379, _373);
    bool _383 = !_349;
    float _385 = _369;
    float _401;
    if (!_383)
    {
        float _387 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _389 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _391 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _393 = _391 * _387;
        float _395 = floor(_393);
        float _397 = -_395;
        float _399 = _393 + _397;
        _401 = _399;
        _403 = true;
    }
    else
    {
        _401 = _369;
    }
    _403 = false;
    float _405 = _401;
    float _407 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _409 = _405 + _407;
    float _411 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _413 = _405 + _411;
    float _415 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _417 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _415;
    float _419 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _421 = _419 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _423 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _425 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _423;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _429 = _427 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _431 = 1.0 / _417;
    float _433 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _435 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _433;
    float _437 = 1.0 / _429;
    float _439 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _441 = _405 + _439;
    bool _443 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _445 = isnan(_405);
    bool _447 = _443 || _445;
    bool _449 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _451 = _447 || _449;
    float _453 = float(_451);
    bool _455 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _457 = isnan(_405);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -_453;
    float _469 = _467 + 1.0;
    float _471 = 1.0 / _425;
    float _473 = _441 * _431;
    float _475 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _477 = _405 + _475;
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _479;
    bool _483 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _485 = fma(_481, _473, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _487 = 1.0 / _421;
    float _489 = _477 * _437;
    bool _491 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _493 = isnan(_405);
    bool _495 = _491 || _493;
    bool _497 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _499 = _495 || _497;
    float _501 = float(_499);
    bool _503 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _505 = isnan(_405);
    bool _507 = _503 || _505;
    bool _509 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _511 = _507 || _509;
    float _513 = float(_511);
    float _515 = -_501;
    float _517 = _515 + 1.0;
    float _519 = 1.0 / _435;
    float _521 = _409 * _471;
    bool _523 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _525 = isnan(_405);
    bool _527 = _523 || _525;
    bool _529 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _531 = _527 || _529;
    float _533 = float(_531);
    float _535 = -_533;
    float _537 = _535 + 1.0;
    float _539 = _413 * _487;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _543 = _405 + _541;
    float _545 = _533 * _517;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _549 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _547;
    float _551 = _513 * _537;
    float _553 = -_513;
    float _555 = _553 + 1.0;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _561 = fma(_549, _473, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _563 = _543 * _519;
    float _565 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _565;
    float _569 = _465 * _469;
    float _571 = -_465;
    float _573 = _571 + 1.0;
    float _575 = fma(_559, _539, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    float _577 = fma(_567, _473, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _579 = _405 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _581 = isnan(_405);
    bool _583 = _579 || _581;
    bool _585 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _587 = _583 || _585;
    float _589 = float(_587);
    float _591 = _453 * _555;
    float _593 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _595 = _593 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _601 = _589 * _573;
    float _603 = fma(_595, _539, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _605 = fma(_599, _539, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _607 = _577 * _601;
    float _609 = -_589;
    float _611 = _609 + 1.0;
    float _613 = _561 * _601;
    float _615 = _485 * _601;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _619 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _617;
    float _621 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _623 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _621;
    float _625 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].x, _607);
    float _627 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].y, _613);
    float _629 = fma(_619, _521, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _633 = _631 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[145].z;
    float _637 = (*spvDescriptorSet0.vp_c9)._m0[146].z + _635;
    float _639 = fma(_623, _521, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _641 = fma(_611, (*spvDescriptorSet0.vp_c9)._m0[143].z, _615);
    float _643 = fma(_603, _569, _625);
    float _645 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _647 = _645 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _649 = fma(_633, _489, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _651 = fma(_637, _521, (*spvDescriptorSet0.vp_c9)._m0[145].z);
    float _653 = fma(_605, _569, _627);
    float _655 = fma(_575, _569, _641);
    float _657 = fma(_629, _591, _643);
    float _659 = fma(_647, _489, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    float _661 = -(*spvDescriptorSet0.vp_c9)._m0[146].z;
    float _663 = _661 + (*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _665 = fma(_639, _591, _653);
    float _667 = fma(_651, _591, _655);
    float _669 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _671 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _669;
    float _673 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _675 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _673;
    float _677 = fma(_663, _489, (*spvDescriptorSet0.vp_c9)._m0[146].z);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[147].z;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[148].z + _679;
    float _683 = fma(_671, _563, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _685 = fma(_675, _563, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    float _687 = fma(_649, _551, _657);
    float _689 = fma(_681, _563, (*spvDescriptorSet0.vp_c9)._m0[147].z);
    float _691 = fma(_659, _551, _665);
    float _693 = fma(_677, _551, _667);
    float _695 = fma(_683, _545, _687);
    float _697 = fma(_685, _545, _691);
    float _699 = fma(_689, _545, _693);
    float _701 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[148].x, _695);
    float _703 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[148].y, _697);
    float _705 = fma(_501, (*spvDescriptorSet0.vp_c9)._m0[148].z, _699);
    bool _707 = !_483;
    float _723;
    if (!_707)
    {
        float _709 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _711 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _713 = fma(_711, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
        float _715 = _713 * _709;
        float _717 = floor(_715);
        float _719 = -_717;
        float _721 = _715 + _719;
        _723 = _721;
        _725 = true;
    }
    else
    {
        _723 = _369;
    }
    _725 = false;
    float _727 = _723;
    float _729 = in.m_57.x;
    float _731 = in.m_57.y;
    float _733 = in.m_57.z;
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _735;
    float _739 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _741 = _739 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _745 = (*spvDescriptorSet0.vp_c9)._m0[110].w + _743;
    float _747 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _749 = _747 + (*spvDescriptorSet0.vp_c9)._m0[111].w;
    float _751 = 1.0 / _737;
    bool _753 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _755 = isnan(_727);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = 1.0 / _741;
    float _767 = -(*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _769 = _727 + _767;
    float _771 = _705 * _733;
    float _773 = _703 * _731;
    float _775 = 1.0 / _745;
    float _777 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _779 = _727 + _777;
    float _781 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _783 = _727 + _781;
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[110].w;
    float _787 = _727 + _785;
    bool _789 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _791 = _701 * _729;
    float _793 = _783 * _751;
    bool _795 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[111].w;
    bool _797 = isnan(_727);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[111].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = 1.0 / _749;
    float _809 = _779 * _765;
    bool _811 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[110].w;
    bool _813 = isnan(_727);
    bool _815 = _811 || _813;
    bool _817 = isnan((*spvDescriptorSet0.vp_c9)._m0[110].w);
    bool _819 = _815 || _817;
    float _821 = float(_819);
    float _823 = -_805;
    float _825 = _823 + 1.0;
    float _827 = _769 * _775;
    float _829 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _831 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _829;
    float _833 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _835 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _833;
    float _837 = _821 * _825;
    bool _839 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _841 = isnan(_727);
    bool _843 = _839 || _841;
    bool _845 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _847 = _843 || _845;
    float _849 = float(_847);
    float _851 = fma(_831, _793, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _853 = fma(_835, _793, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _855 = -_821;
    float _857 = _855 + 1.0;
    float _859 = _787 * _807;
    bool _861 = _727 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _863 = isnan(_727);
    bool _865 = _861 || _863;
    bool _867 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _869 = _865 || _867;
    float _871 = float(_869);
    float _873 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _875 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _873;
    float _877 = fma(_875, _793, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _879 = -_871;
    float _881 = _879 + 1.0;
    float _883 = _871 * _857;
    float _885 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _887 = _885 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _891 = _889 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _893 = _763 * _881;
    float _895 = -_763;
    float _897 = _895 + 1.0;
    float _899 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _901 = _899 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _903 = fma(_887, _809, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _905 = fma(_891, _809, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _907 = _849 * _897;
    float _909 = -_849;
    float _911 = _909 + 1.0;
    float _913 = fma(_901, _809, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _915 = _851 * _907;
    float _917 = _853 * _907;
    float _919 = _877 * _907;
    float _921 = -(*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _923 = (*spvDescriptorSet0.vp_c9)._m0[110].x + _921;
    float _925 = -(*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _927 = (*spvDescriptorSet0.vp_c9)._m0[110].y + _925;
    float _929 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[107].x, _915);
    float _931 = -(*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[110].z + _931;
    float _935 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[107].y, _917);
    float _937 = fma(_911, (*spvDescriptorSet0.vp_c9)._m0[107].z, _919);
    float _939 = fma(_923, _827, (*spvDescriptorSet0.vp_c9)._m0[109].x);
    float _941 = fma(_927, _827, (*spvDescriptorSet0.vp_c9)._m0[109].y);
    float _943 = fma(_903, _893, _929);
    float _945 = fma(_933, _827, (*spvDescriptorSet0.vp_c9)._m0[109].z);
    float _947 = fma(_913, _893, _935);
    float _949 = -(*spvDescriptorSet0.vp_c9)._m0[110].x;
    float _951 = _949 + (*spvDescriptorSet0.vp_c9)._m0[111].x;
    float _953 = -(*spvDescriptorSet0.vp_c9)._m0[110].y;
    float _955 = _953 + (*spvDescriptorSet0.vp_c9)._m0[111].y;
    float _957 = fma(_905, _893, _937);
    float _959 = -(*spvDescriptorSet0.vp_c9)._m0[110].z;
    float _961 = _959 + (*spvDescriptorSet0.vp_c9)._m0[111].z;
    float _963 = fma(_939, _883, _943);
    float _965 = fma(_951, _859, (*spvDescriptorSet0.vp_c9)._m0[110].x);
    float _967 = fma(_955, _859, (*spvDescriptorSet0.vp_c9)._m0[110].y);
    float _969 = fma(_941, _883, _947);
    float _971 = fma(_961, _859, (*spvDescriptorSet0.vp_c9)._m0[110].z);
    float _973 = fma(_945, _883, _957);
    float _975 = fma(_965, _837, _963);
    float _977 = fma(_967, _837, _969);
    float _979 = fma(_971, _837, _973);
    float _981 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[111].x, _975);
    float _983 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[111].y, _977);
    float _985 = fma(_805, (*spvDescriptorSet0.vp_c9)._m0[111].z, _979);
    bool _987 = !_789;
    float _1003;
    if (!_987)
    {
        float _989 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _991 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _993 = fma(_991, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _995 = _993 * _989;
        float _997 = floor(_995);
        float _999 = -_997;
        float _1001 = _995 + _999;
        _1003 = _1001;
        _1005 = true;
    }
    else
    {
        _1003 = _369;
    }
    _1005 = false;
    float _1007 = _1003;
    float _1009 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1011 = _1007 + _1009;
    float _1013 = _981 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _1015 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _1017 = _1015 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1019 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1021 = _1019 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1023 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _1025 = isnan(_1007);
    bool _1027 = _1023 || _1025;
    bool _1029 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _1031 = _1027 || _1029;
    float _1033 = float(_1031);
    float _1035 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1037 = _1035 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1039 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _1041 = isnan(_1007);
    bool _1043 = _1039 || _1041;
    bool _1045 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _1047 = _1043 || _1045;
    float _1049 = float(_1047);
    float _1051 = 1.0 / _1017;
    float _1053 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _1055 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _1053;
    float _1057 = -_1033;
    float _1059 = _1057 + 1.0;
    bool _1061 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _1063 = isnan(_1007);
    bool _1065 = _1061 || _1063;
    bool _1067 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _1069 = _1065 || _1067;
    float _1071 = float(_1069);
    float _1073 = _983 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _1075 = _985 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    bool _1077 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _1079 = 1.0 / _1021;
    float _1081 = 1.0 / _1037;
    float _1083 = _1055 * _1051;
    float _1085 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _1087 = _1085 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1089 = _1049 * _1059;
    float _1091 = -_1049;
    float _1093 = _1091 + 1.0;
    float _1095 = fma(_1083, _1011, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    bool _1097 = _1007 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _1099 = isnan(_1007);
    bool _1101 = _1097 || _1099;
    bool _1103 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _1105 = _1101 || _1103;
    float _1107 = float(_1105);
    float _1109 = _1071 * _1093;
    float _1111 = _1087 * _1079;
    float _1113 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _1113;
    float _1117 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _1119 = _1007 + _1117;
    float _1121 = _1095 * _1109;
    float _1123 = -_1071;
    float _1125 = _1123 + 1.0;
    float _1127 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _1129 = _1007 + _1127;
    float _1131 = fma(_1111, _1119, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _1133 = _1115 * _1081;
    float _1135 = -_1107;
    float _1137 = _1135 + 1.0;
    float _1139 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[115].x, _1121);
    float _1141 = _1073 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = fma(_1133, _1129, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _1145 = _1033 * _1137;
    float _1147 = fma(_1131, _1089, _1139);
    float _1149 = _1013 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1151 = _1075 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1153 = fma(_1143, _1145, _1147);
    float _1155 = fma(_1107, (*spvDescriptorSet0.vp_c9)._m0[118].x, _1153);
    float _1157 = _1155 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_59.x = _1149;
    out.m_59.y = _1141;
    out.m_59.z = _1151;
    out.m_59.w = _1157;
    bool _1159 = !_1077;
    float _1175;
    if (!_1159)
    {
        float _1161 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _1163 = _145 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _1165 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[11].z, _113);
        float _1167 = _1165 * _1161;
        float _1169 = floor(_1167);
        float _1171 = -_1169;
        float _1173 = _1167 + _1171;
        _1175 = _1173;
        _1177 = true;
    }
    else
    {
        _1175 = _369;
    }
    _1177 = false;
    float _1179 = _1175;
    float _1181 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1183 = _1179 + _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1187 = _1179 + _1185;
    float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1191 = (*spvDescriptorSet0.vp_c9)._m0[126].w + _1189;
    float _1193 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1195 = _1193 + (*spvDescriptorSet0.vp_c9)._m0[127].w;
    float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1199 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1197;
    float _1201 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1203 = _1201 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1205 = -(*spvDescriptorSet0.vp_c9)._m0[125].w;
    float _1207 = _1179 + _1205;
    float _1209 = 1.0 / _1195;
    bool _1211 = _1179 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _1213 = isnan(_1179);
    bool _1215 = _1211 || _1213;
    bool _1217 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _1219 = _1215 || _1217;
    float _1221 = float(_1219);
    float _1223 = 1.0 / _1199;
    float _1225 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1227 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1225;
    bool _1229 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _1231 = 1.0 / _1203;
    float _1233 = -(*spvDescriptorSet0.vp_c9)._m0[126].w;
    float _1235 = _1179 + _1233;
    float _1237 = 1.0 / _1191;
    float _1239 = _1235 * _1209;
    bool _1241 = _1179 >= (*spvDescriptorSet0.vp_c9)._m0[127].w;
    bool _1243 = isnan(_1179);
    bool _1245 = _1241 || _1243;
    bool _1247 = isnan((*spvDescriptorSet0.vp_c9)._m0[127].w);
    bool _1249 = _1245 || _1247;
    float _1251 = float(_1249);
    float _1253 = _1183 * _1223;
    bool _1255 = _1179 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1257 = isnan(_1179);
    bool _1259 = _1255 || _1257;
    bool _1261 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1263 = _1259 || _1261;
    float _1265 = float(_1263);
    bool _1267 = _1179 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1269 = isnan(_1179);
    bool _1271 = _1267 || _1269;
    bool _1273 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1275 = _1271 || _1273;
    float _1277 = float(_1275);
    float _1279 = -_1251;
    float _1281 = _1279 + 1.0;
    float _1283 = _1187 * _1231;
    bool _1285 = _1179 >= (*spvDescriptorSet0.vp_c9)._m0[126].w;
    bool _1287 = isnan(_1179);
    bool _1289 = _1285 || _1287;
    bool _1291 = isnan((*spvDescriptorSet0.vp_c9)._m0[126].w);
    bool _1293 = _1289 || _1291;
    float _1295 = float(_1293);
    float _1297 = -_1265;
    float _1299 = _1297 + 1.0;
    float _1301 = fma(_1227, _1253, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    float _1303 = _1295 * _1281;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1309 = _1207 * _1237;
    float _1311 = -_1295;
    float _1313 = _1311 + 1.0;
    float _1315 = _1277 * _1299;
    float _1317 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1319 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1317;
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1323 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1321;
    float _1325 = -_1277;
    float _1327 = _1325 + 1.0;
    float _1329 = _1265 * _1313;
    float _1331 = fma(_1319, _1253, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1333 = fma(_1323, _1253, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1335 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1337 = _1335 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1339 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1341 = _1339 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1343 = _1221 * _1327;
    float _1345 = fma(_1307, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _1347 = fma(_1337, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _1349 = fma(_1341, _1283, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _1351 = _1331 * _1343;
    float _1353 = _1333 * _1343;
    float _1355 = -_1221;
    float _1357 = _1355 + 1.0;
    float _1359 = _1301 * _1343;
    float _1361 = -(*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1363 = (*spvDescriptorSet0.vp_c9)._m0[126].x + _1361;
    float _1365 = -(*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1367 = (*spvDescriptorSet0.vp_c9)._m0[126].y + _1365;
    float _1369 = -(*spvDescriptorSet0.vp_c9)._m0[125].z;
    float _1371 = (*spvDescriptorSet0.vp_c9)._m0[126].z + _1369;
    float _1373 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].x, _1351);
    float _1375 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].y, _1353);
    float _1377 = fma(_1357, (*spvDescriptorSet0.vp_c9)._m0[123].z, _1359);
    float _1379 = fma(_1363, _1309, (*spvDescriptorSet0.vp_c9)._m0[125].x);
    float _1381 = fma(_1367, _1309, (*spvDescriptorSet0.vp_c9)._m0[125].y);
    float _1383 = fma(_1371, _1309, (*spvDescriptorSet0.vp_c9)._m0[125].z);
    float _1385 = fma(_1347, _1315, _1373);
    float _1387 = fma(_1349, _1315, _1375);
    float _1389 = -(*spvDescriptorSet0.vp_c9)._m0[126].x;
    float _1391 = _1389 + (*spvDescriptorSet0.vp_c9)._m0[127].x;
    float _1393 = -(*spvDescriptorSet0.vp_c9)._m0[126].y;
    float _1395 = _1393 + (*spvDescriptorSet0.vp_c9)._m0[127].y;
    float _1397 = fma(_1345, _1315, _1377);
    float _1399 = -(*spvDescriptorSet0.vp_c9)._m0[126].z;
    float _1401 = _1399 + (*spvDescriptorSet0.vp_c9)._m0[127].z;
    float _1403 = fma(_1379, _1329, _1385);
    float _1405 = fma(_1391, _1239, (*spvDescriptorSet0.vp_c9)._m0[126].x);
    float _1407 = fma(_1395, _1239, (*spvDescriptorSet0.vp_c9)._m0[126].y);
    float _1409 = fma(_1401, _1239, (*spvDescriptorSet0.vp_c9)._m0[126].z);
    float _1411 = fma(_1381, _1329, _1387);
    float _1413 = fma(_1383, _1329, _1397);
    float _1415 = fma(_1405, _1303, _1403);
    float _1417 = fma(_1407, _1303, _1411);
    float _1419 = fma(_1409, _1303, _1413);
    float _1421 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[127].x, _1415);
    float _1423 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[127].y, _1417);
    float _1425 = fma(_1251, (*spvDescriptorSet0.vp_c9)._m0[127].z, _1419);
    bool _1427 = !_1229;
    float _1443;
    if (!_1427)
    {
        float _1429 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _1431 = _145 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _1433 = fma(_1431, (*spvDescriptorSet0.vp_c9)._m0[11].w, _113);
        float _1435 = _1433 * _1429;
        float _1437 = floor(_1435);
        float _1439 = -_1437;
        float _1441 = _1435 + _1439;
        _1443 = _1441;
        _1445 = true;
    }
    else
    {
        _1443 = _369;
    }
    _1445 = false;
    float _1447 = _1443;
    float _1449 = _1421 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1451 = _1423 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1453 = _1447 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1455 = isnan(_1447);
    bool _1457 = _1453 || _1455;
    bool _1459 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1461 = _1457 || _1459;
    float _1463 = float(_1461);
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1467 = _1465 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1469 = _1447 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1471 = isnan(_1447);
    bool _1473 = _1469 || _1471;
    bool _1475 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1477 = _1473 || _1475;
    float _1479 = float(_1477);
    float _1481 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1483 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1481;
    float _1485 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1487 = _1447 + _1485;
    float _1489 = -_1463;
    float _1491 = _1489 + 1.0;
    float _1493 = _1425 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1495 = 1.0 / _1467;
    float _1497 = _1449 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1499 = _1479 * _1491;
    float _1501 = -_1479;
    float _1503 = _1501 + 1.0;
    float _1505 = _1451 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1507 = _1493 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _1509 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _1511 = _1483 * _1495;
    float _1513 = fma(_1511, _1487, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1515 = _1513 * _1499;
    float _1517 = fma(_1503, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1515);
    float _1519 = fma(_1463, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1517);
    float _1521 = _1519 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    out.m_61.x = _1497;
    out.m_61.y = _1505;
    out.m_61.z = _1507;
    out.m_61.w = _1521;
    bool _1523 = !_1509;
    float _1539;
    if (!_1523)
    {
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _1527 = _145 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _1529 = fma(_1527, (*spvDescriptorSet0.vp_c9)._m0[14].x, _113);
        float _1531 = _1529 * _1525;
        float _1533 = floor(_1531);
        float _1535 = -_1533;
        float _1537 = _1531 + _1535;
        _1539 = _1537;
        _1541 = true;
    }
    else
    {
        _1539 = _369;
    }
    _1541 = false;
    float _1543 = _1539;
    float _1545 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1547 = _1543 + _1545;
    float _1549 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1551 = _1543 + _1549;
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1555 = (*spvDescriptorSet0.vp_c9)._m0[162].w + _1553;
    float _1557 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _1559 = _1557 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1561 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1563 = (*spvDescriptorSet0.vp_c9)._m0[160].w + _1561;
    float _1565 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1567 = _1565 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1571 = (*spvDescriptorSet0.vp_c9)._m0[164].w + _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1575 = _1573 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1577 = 1.0 / _1563;
    float _1579 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _1581 = _1543 + _1579;
    float _1583 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _1585 = _1543 + _1583;
    bool _1587 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _1589 = isnan(_1543);
    bool _1591 = _1587 || _1589;
    bool _1593 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _1595 = _1591 || _1593;
    float _1597 = float(_1595);
    float _1599 = -(*spvDescriptorSet0.vp_c9)._m0[159].y;
    float _1601 = (*spvDescriptorSet0.vp_c9)._m0[160].y + _1599;
    float _1603 = 1.0 / _1559;
    bool _1605 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1607 = 1.0 / _1567;
    float _1609 = 1.0 / _1575;
    float _1611 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1613 = (*spvDescriptorSet0.vp_c9)._m0[166].w + _1611;
    float _1615 = _1547 * _1603;
    bool _1617 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _1619 = isnan(_1543);
    bool _1621 = _1617 || _1619;
    bool _1623 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _1625 = _1621 || _1623;
    float _1627 = float(_1625);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _1631 = _1543 + _1629;
    float _1633 = 1.0 / _1613;
    float _1635 = _1631 * _1577;
    float _1637 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _1639 = _1543 + _1637;
    float _1641 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _1643 = _1543 + _1641;
    float _1645 = _1581 * _1607;
    float _1647 = -(*spvDescriptorSet0.vp_c9)._m0[159].z;
    float _1649 = (*spvDescriptorSet0.vp_c9)._m0[160].z + _1647;
    float _1651 = fma(_1601, _1635, (*spvDescriptorSet0.vp_c9)._m0[159].y);
    float _1653 = -(*spvDescriptorSet0.vp_c9)._m0[160].z;
    float _1655 = _1653 + (*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1657 = 1.0 / _1555;
    float _1659 = -_1627;
    float _1661 = _1659 + 1.0;
    float _1663 = _1639 * _1609;
    bool _1665 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _1667 = isnan(_1543);
    bool _1669 = _1665 || _1667;
    bool _1671 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _1673 = _1669 || _1671;
    float _1675 = float(_1673);
    float _1677 = fma(_1649, _1635, (*spvDescriptorSet0.vp_c9)._m0[159].z);
    float _1679 = 1.0 / _1571;
    bool _1681 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _1683 = isnan(_1543);
    bool _1685 = _1681 || _1683;
    bool _1687 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _1689 = _1685 || _1687;
    float _1691 = float(_1689);
    float _1693 = _1643 * _1633;
    float _1695 = -_1691;
    float _1697 = _1695 + 1.0;
    float _1699 = _1691 * _1661;
    float _1701 = _1551 * _1657;
    bool _1703 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _1705 = isnan(_1543);
    bool _1707 = _1703 || _1705;
    bool _1709 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _1711 = _1707 || _1709;
    float _1713 = float(_1711);
    bool _1715 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _1717 = isnan(_1543);
    bool _1719 = _1715 || _1717;
    bool _1721 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _1723 = _1719 || _1721;
    float _1725 = float(_1723);
    float _1727 = _1713 * _1697;
    float _1729 = -_1713;
    float _1731 = _1729 + 1.0;
    float _1733 = -_1725;
    float _1735 = _1733 + 1.0;
    float _1737 = _1585 * _1679;
    bool _1739 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _1741 = isnan(_1543);
    bool _1743 = _1739 || _1741;
    bool _1745 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _1747 = _1743 || _1745;
    float _1749 = float(_1747);
    float _1751 = _1675 * _1731;
    float _1753 = -_1675;
    float _1755 = _1753 + 1.0;
    float _1757 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _1759 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _1757;
    float _1761 = _1725 * _1755;
    float _1763 = fma(_1759, _1635, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _1765 = _1543 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _1767 = isnan(_1543);
    bool _1769 = _1765 || _1767;
    bool _1771 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _1773 = _1769 || _1771;
    float _1775 = float(_1773);
    float _1777 = _1749 * _1735;
    float _1779 = -_1749;
    float _1781 = _1779 + 1.0;
    float _1783 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _1785 = _1783 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1787 = -(*spvDescriptorSet0.vp_c9)._m0[160].y;
    float _1789 = _1787 + (*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1791 = -_1775;
    float _1793 = _1791 + 1.0;
    float _1795 = fma(_1655, _1645, (*spvDescriptorSet0.vp_c9)._m0[160].z);
    float _1797 = _1775 * _1781;
    float _1799 = _1597 * _1793;
    float _1801 = fma(_1785, _1645, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _1803 = fma(_1789, _1645, (*spvDescriptorSet0.vp_c9)._m0[160].y);
    float _1805 = _1763 * _1799;
    float _1807 = _1651 * _1799;
    float _1809 = -(*spvDescriptorSet0.vp_c9)._m0[161].y;
    float _1811 = (*spvDescriptorSet0.vp_c9)._m0[162].y + _1809;
    float _1813 = _1677 * _1799;
    float _1815 = -_1597;
    float _1817 = _1815 + 1.0;
    float _1819 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _1821 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _1819;
    float _1823 = fma(_1811, _1701, (*spvDescriptorSet0.vp_c9)._m0[161].y);
    float _1825 = -(*spvDescriptorSet0.vp_c9)._m0[161].z;
    float _1827 = (*spvDescriptorSet0.vp_c9)._m0[162].z + _1825;
    float _1829 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[159].z, _1813);
    float _1831 = fma(_1821, _1701, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _1833 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[159].y, _1807);
    float _1835 = fma(_1827, _1701, (*spvDescriptorSet0.vp_c9)._m0[161].z);
    float _1837 = fma(_1795, _1797, _1829);
    float _1839 = fma(_1817, (*spvDescriptorSet0.vp_c9)._m0[159].x, _1805);
    float _1841 = fma(_1803, _1797, _1833);
    float _1843 = fma(_1835, _1777, _1837);
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[162].z;
    float _1847 = _1845 + (*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1849 = -(*spvDescriptorSet0.vp_c9)._m0[162].y;
    float _1851 = _1849 + (*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1853 = fma(_1823, _1777, _1841);
    float _1855 = fma(_1847, _1615, (*spvDescriptorSet0.vp_c9)._m0[162].z);
    float _1857 = fma(_1851, _1615, (*spvDescriptorSet0.vp_c9)._m0[162].y);
    float _1859 = -(*spvDescriptorSet0.vp_c9)._m0[163].y;
    float _1861 = (*spvDescriptorSet0.vp_c9)._m0[164].y + _1859;
    float _1863 = fma(_1801, _1797, _1839);
    float _1865 = fma(_1855, _1761, _1843);
    float _1867 = -(*spvDescriptorSet0.vp_c9)._m0[163].z;
    float _1869 = (*spvDescriptorSet0.vp_c9)._m0[164].z + _1867;
    float _1871 = -(*spvDescriptorSet0.vp_c9)._m0[164].y;
    float _1873 = _1871 + (*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1875 = fma(_1857, _1761, _1853);
    float _1877 = fma(_1861, _1737, (*spvDescriptorSet0.vp_c9)._m0[163].y);
    float _1879 = fma(_1869, _1737, (*spvDescriptorSet0.vp_c9)._m0[163].z);
    float _1881 = fma(_1873, _1663, (*spvDescriptorSet0.vp_c9)._m0[164].y);
    float _1883 = fma(_1877, _1751, _1875);
    float _1885 = -(*spvDescriptorSet0.vp_c9)._m0[164].z;
    float _1887 = _1885 + (*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1889 = fma(_1879, _1751, _1865);
    float _1891 = -(*spvDescriptorSet0.vp_c9)._m0[165].y;
    float _1893 = (*spvDescriptorSet0.vp_c9)._m0[166].y + _1891;
    float _1895 = fma(_1881, _1727, _1883);
    float _1897 = fma(_1887, _1663, (*spvDescriptorSet0.vp_c9)._m0[164].z);
    float _1899 = -(*spvDescriptorSet0.vp_c9)._m0[165].z;
    float _1901 = (*spvDescriptorSet0.vp_c9)._m0[166].z + _1899;
    float _1903 = fma(_1893, _1693, (*spvDescriptorSet0.vp_c9)._m0[165].y);
    float _1905 = fma(_1897, _1727, _1889);
    float _1907 = fma(_1901, _1693, (*spvDescriptorSet0.vp_c9)._m0[165].z);
    float _1909 = fma(_1903, _1699, _1895);
    float _1911 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _1913 = _1911 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1915 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _1917 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _1915;
    float _1919 = fma(_1907, _1699, _1905);
    float _1921 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[166].y, _1909);
    float _1923 = fma(_1913, _1615, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _1925 = fma(_1831, _1777, _1863);
    float _1927 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[166].z, _1919);
    float _1929 = fma(_1917, _1737, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    out.m_63.y = _1921;
    float _1931 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _1933 = _1931 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1935 = fma(_1923, _1761, _1925);
    out.m_63.z = _1927;
    float _1937 = fma(_1933, _1663, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _1939;
    float _1943 = fma(_1929, _1751, _1935);
    float _1945 = fma(_1941, _1693, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _1947 = fma(_1937, _1727, _1943);
    float _1949 = fma(_1945, _1699, _1947);
    float _1951 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[166].x, _1949);
    bool _1953 = !_1605;
    float _1969;
    if (!_1953)
    {
        float _1955 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        float _1957 = _145 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        float _1959 = fma(_1957, (*spvDescriptorSet0.vp_c9)._m0[14].y, _113);
        float _1961 = _1959 * _1955;
        float _1963 = floor(_1961);
        float _1965 = -_1963;
        float _1967 = _1961 + _1965;
        _1969 = _1967;
        _1971 = true;
    }
    else
    {
        _1969 = _369;
    }
    _1971 = false;
    float _1973 = _1969;
    float _1975 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1977 = _1973 + _1975;
    bool _1979 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1981 = isnan(_1973);
    bool _1983 = _1979 || _1981;
    bool _1985 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1987 = _1983 || _1985;
    float _1989 = float(_1987);
    float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1993 = _1991 + (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1995 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1997 = isnan(_1973);
    bool _1999 = _1995 || _1997;
    bool _2001 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _2003 = _1999 || _2001;
    float _2005 = float(_2003);
    float _2007 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _2009 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _2007;
    bool _2011 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _2013 = isnan(_1973);
    bool _2015 = _2011 || _2013;
    bool _2017 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _2019 = _2015 || _2017;
    float _2021 = float(_2019);
    float _2023 = 1.0 / _1993;
    bool _2025 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _2027 = isnan(_1973);
    bool _2029 = _2025 || _2027;
    bool _2031 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _2033 = _2029 || _2031;
    float _2035 = float(_2033);
    float _2037 = -_2021;
    float _2039 = _2037 + 1.0;
    bool _2041 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2043 = isnan(_1973);
    bool _2045 = _2041 || _2043;
    bool _2047 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _2049 = _2045 || _2047;
    float _2051 = float(_2049);
    float _2053 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2055 = _2053 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _2057 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _2059 = isnan(_1973);
    bool _2061 = _2057 || _2059;
    bool _2063 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _2065 = _2061 || _2063;
    float _2067 = float(_2065);
    float _2069 = 1.0 / _2055;
    bool _2071 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _2073 = _2009 * _2023;
    float _2075 = -_1989;
    float _2077 = _2075 + 1.0;
    float _2079 = -_2005;
    float _2081 = _2079 + 1.0;
    float _2083 = fma(_2073, _1977, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _2085 = _2005 * _2077;
    float _2087 = _2035 * _2081;
    float _2089 = -_2035;
    float _2091 = _2089 + 1.0;
    float _2093 = _2051 * _2039;
    float _2095 = -_2051;
    float _2097 = _2095 + 1.0;
    bool _2099 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _2101 = isnan(_1973);
    bool _2103 = _2099 || _2101;
    bool _2105 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _2107 = _2103 || _2105;
    float _2109 = float(_2107);
    float _2111 = _2021 * _2091;
    float _2113 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2115 = _2113 + (*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2117 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2119 = _2117 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2121 = _2067 * _2097;
    float _2123 = -_2067;
    float _2125 = _2123 + 1.0;
    float _2127 = 1.0 / _2115;
    float _2129 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2131 = _2129 + (*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2133 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _2135 = _2133 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2137 = _2135 * _2069;
    float _2139 = 1.0 / _2119;
    float _2141 = _2109 * _2125;
    float _2143 = -_2109;
    float _2145 = _2143 + 1.0;
    float _2147 = _2083 * _2141;
    float _2149 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _2151 = _1973 + _2149;
    float _2153 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2155 = _2153 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2157 = 1.0 / _2131;
    float _2159 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2161 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2159;
    float _2163 = fma(_2137, _2151, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _2165 = fma(_2145, (*spvDescriptorSet0.vp_c9)._m0[167].x, _2147);
    float _2167 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _2169 = _1973 + _2167;
    float _2171 = _2161 * _2127;
    float _2173 = 1.0 / _2155;
    float _2175 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2177 = _2175 + (*spvDescriptorSet0.vp_c9)._m0[174].w;
    float _2179 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2181 = _2179 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2183 = fma(_2171, _2169, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2185 = fma(_2163, _2121, _2165);
    float _2187 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2189 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2187;
    float _2191 = _2181 * _2139;
    float _2193 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2195 = _2193 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2197 = 1.0 / _2177;
    float _2199 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _2201 = _1973 + _2199;
    float _2203 = fma(_2183, _2093, _2185);
    float _2205 = _2189 * _2157;
    float _2207 = fma(_2191, _2201, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2209 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _2211 = _1973 + _2209;
    float _2213 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _2215 = _1973 + _2213;
    float _2217 = _2195 * _2173;
    bool _2219 = _1973 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _2221 = isnan(_1973);
    bool _2223 = _2219 || _2221;
    bool _2225 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _2227 = _2223 || _2225;
    float _2229 = float(_2227);
    float _2231 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2231;
    float _2235 = fma(_2205, _2211, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2237 = fma(_2207, _2111, _2203);
    float _2239 = fma(_2217, _2215, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2241 = -_2229;
    float _2243 = _2241 + 1.0;
    float _2245 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _2247 = _1973 + _2245;
    float _2249 = _2233 * _2197;
    float _2251 = fma(_2235, _2087, _2237);
    float _2253 = _1989 * _2243;
    float _2255 = fma(_2249, _2247, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2257 = fma(_2239, _2085, _2251);
    float _2259 = fma(_2255, _2253, _2257);
    float _2261 = fma(_2229, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2259);
    out.m_65.x = _2261;
    bool _2263 = !_2071;
    if (!_2263)
    {
        float _2265 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        float _2267 = _145 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        float _2269 = fma(_2267, (*spvDescriptorSet0.vp_c9)._m0[14].z, _113);
        float _2271 = _2269 * _2265;
        float _2273 = floor(_2271);
        float _2275 = -_2273;
        float _2277 = _2271 + _2275;
        _385 = _2277;
    }
    float _2279 = _385;
    int _2281 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _2283 = _2281;
    int _2285 = 0;
    int _2287 = _98(_2283, _2285, (*spvDescriptorSet0.support_buffer));
    float _2289 = in.m_67.z;
    float _2291 = 0.0 + _1951;
    float _2293 = precise::clamp(_2291, 0.0, 1.0);
    int _2295 = _2287 + (-1);
    float _2297 = trunc(_2289);
    int _2299 = int(_2297);
    float _2301 = float(_2295);
    float _2303 = _2293 * _2301;
    float _2305 = trunc(_2303);
    int _2307 = int(_2305);
    int _2309 = _2307 + 1;
    int _2311 = min(_2295, _2309);
    int _2313 = _2307;
    int _2315 = 0;
    int _2317 = _99(_2313, _2315, (*spvDescriptorSet0.support_buffer));
    int _2319 = _2299;
    int _2321 = 0;
    int _2323 = _99(_2319, _2321, (*spvDescriptorSet0.support_buffer));
    float3 _2327 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2317, _2323)), 0).xyz;
    float _2329 = _2327.x;
    float _2331 = _2327.y;
    float _2333 = _2327.z;
    int _2335 = _2311;
    int _2337 = 0;
    int _2339 = _99(_2335, _2337, (*spvDescriptorSet0.support_buffer));
    int _2341 = _2299;
    int _2343 = 0;
    int _2345 = _99(_2341, _2343, (*spvDescriptorSet0.support_buffer));
    float3 _2347 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_2339, _2345)), 0).xyz;
    float _2349 = _2347.x;
    float _2351 = _2347.y;
    float _2353 = _2347.z;
    float _2355 = _159 * 2.0;
    float _2357 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _2359 = log2(_2357);
    float _2361 = _145 * 2.0;
    float _2363 = _157 * 2.0;
    float _2365 = _381 * _791;
    float _2367 = _381 * _771;
    float _2369 = floor(_2355);
    float _2371 = _2365 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _2373 = _2367 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _2375 = floor(_2361);
    float _2377 = _2359 * _113;
    float _2379 = _145 + _157;
    float _2381 = _2379 + (-1.0);
    bool _2383 = _2369 > 0.0;
    float _2385 = exp2(_2377);
    bool _2387 = _2369 >= 0.0;
    bool _2389 = isnan(_2369);
    bool _2391 = _2387 || _2389;
    bool _2393 = isnan(0.0);
    bool _2395 = _2391 || _2393;
    float _2397 = fma(_2381, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _2399 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _2401 = 1.0 + _2399;
    int _2403 = _2395 ? 0 : 1;
    int _2405 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _2407 = _2405 != 0;
    int _2409 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _2411 = _2409 != 0;
    int _2413 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _2415 = _2413 != 0;
    float _2417 = floor(_2363);
    int _2419 = ~_2403;
    int _2421 = _2419 + 1;
    int _2423 = _2421 + 1;
    bool _2425 = _2375 > 0.0;
    int _2427 = _2423;
    float _2429 = _2279;
    if (!_2383)
    {
        int _2431 = ~_2403;
        int _2433 = _2431 + 1;
        _2427 = _2433;
    }
    int _2435 = _2427;
    float _2437 = in.m_69.x;
    float _2439 = in.m_69.y;
    float _2441 = in.m_69.z;
    bool _2443 = _2375 >= 0.0;
    bool _2445 = isnan(_2375);
    bool _2447 = _2443 || _2445;
    bool _2449 = isnan(0.0);
    bool _2451 = _2447 || _2449;
    float _2453 = 1.0 / _2401;
    bool _2455 = !_2407;
    int _2457 = _2455 ? 0 : 1;
    float _2459 = -_2385;
    float _2461 = _2459 + 1.0;
    bool _2463 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2465 = isnan(1.0);
    bool _2467 = _2463 || _2465;
    bool _2469 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2471 = _2467 || _2469;
    int _2473 = abs(_2457);
    bool _2475 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _2477 = isnan(0.0);
    bool _2479 = _2475 || _2477;
    bool _2481 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _2483 = _2479 || _2481;
    float _2485 = float(_2473);
    float _2487 = float(_2435);
    int _2489 = _2451 ? 0 : 1;
    bool _2491 = !_2411;
    int _2493 = _2491 ? 0 : 1;
    float _2495 = _2485 * _2487;
    bool _2497 = _2417 > 0.0;
    float _2499 = _2483 ? _2461 : 0.0;
    float _2501 = _2495 * (-2.0);
    int _2503 = ~_2489;
    int _2505 = _2503 + 1;
    int _2507 = _2505 + 1;
    int _2509 = _2507;
    if (!_2425)
    {
        int _2511 = ~_2489;
        int _2513 = _2511 + 1;
        _2509 = _2513;
    }
    int _2515 = _2509;
    if (_2471)
    {
        float _2517 = _2499 * _2453;
        _125 = _2517;
    }
    float _2519 = _125;
    bool _2521 = _2417 >= 0.0;
    bool _2523 = isnan(_2417);
    bool _2525 = _2521 || _2523;
    bool _2527 = isnan(0.0);
    bool _2529 = _2525 || _2527;
    float _2531 = _145 + (-0.5);
    int _2533 = abs(_2493);
    float _2535 = fma(_2501, _2437, _2437);
    bool _2537 = !_2415;
    int _2539 = _2537 ? 0 : 1;
    float _2541 = fma(_2397, _2501, _2397);
    int _2543 = _2529 ? 0 : 1;
    float _2545 = fma(_2531, (*spvDescriptorSet0.vp_c9)._m0[196].x, _2535);
    float _2547 = float(_2533);
    float _2549 = _157 + _159;
    float _2551 = float(_2515);
    float _2553 = fma(_2541, _2519, _2545);
    int _2555 = abs(_2539);
    float _2557 = _2549 + (-1.0);
    int _2559 = ~_2543;
    int _2561 = _2559 + 1;
    int _2563 = _2561 + 1;
    float _2565 = _2547 * _2551;
    int _2567 = _2563;
    if (!_2497)
    {
        int _2569 = ~_2543;
        int _2571 = _2569 + 1;
        _2567 = _2571;
    }
    int _2573 = _2567;
    float _2575 = _157 + (-0.5);
    float _2577 = _2565 * (-2.0);
    float _2579 = _145 + _159;
    float _2581 = float(_2555);
    float _2583 = _159 + (-0.5);
    float _2585 = float(_2573);
    float _2587 = fma(_2557, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _2589 = fma(_2577, _2439, _2439);
    float _2591 = _2579 + (-1.0);
    float _2593 = _2553 * 0.15915493667125701904296875;
    float _2595 = _2581 * _2585;
    float _2597 = fma(_2587, _2577, _2587);
    float _2599 = fma(_2575, (*spvDescriptorSet0.vp_c9)._m0[196].y, _2589);
    float _2601 = _2595 * (-2.0);
    float _2603 = _2593 * 6.283185482025146484375;
    float _2605 = cos(_2603);
    float _2607 = fma(_2597, _2519, _2599);
    float _2609 = fma(_2591, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _2611 = fma(_2601, _2441, _2441);
    float _2613 = _2607 * 0.15915493667125701904296875;
    float _2615 = _361 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _2617 = fma(_2609, _2601, _2609);
    float _2619 = fma(_2583, (*spvDescriptorSet0.vp_c9)._m0[196].z, _2611);
    float _2621 = _2613 * 6.283185482025146484375;
    float _2623 = sin(_2621);
    float _2625 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[5].x, _2615);
    float _2627 = _361 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _2629 = fma(_2617, _2519, _2619);
    float _2631 = _361 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _2633 = _381 * _773;
    float _2635 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[4].x, _2627);
    float _2637 = _2629 * 0.15915493667125701904296875;
    float _2639 = _2613 * 6.283185482025146484375;
    float _2641 = cos(_2639);
    float _2643 = fma(_375, (*spvDescriptorSet0.vp_c10)._m0[6].x, _2631);
    float _2645 = _2633 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _2647 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[4].z, _2635);
    float _2649 = _2647 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _2651 = floor(_2303);
    float _2653 = _2623 * _2605;
    float _2655 = _2637 * 6.283185482025146484375;
    float _2657 = sin(_2655);
    float _2659 = _2641 * _2605;
    float _2661 = _2637 * 6.283185482025146484375;
    float _2663 = cos(_2661);
    float _2665 = -_2651;
    float _2667 = _2303 + _2665;
    float _2669 = _2593 * 6.283185482025146484375;
    float _2671 = sin(_2669);
    float _2673 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[5].z, _2625);
    float _2675 = fma(_377, (*spvDescriptorSet0.vp_c10)._m0[6].z, _2643);
    float _2677 = _2641 * _2657;
    float _2679 = _2623 * _2657;
    float _2681 = _2657 * _2605;
    float _2683 = _2675 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _2685 = _2673 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _2687 = _2641 * _2663;
    float _2689 = _2623 * _2663;
    float _2691 = _2663 * _2605;
    float _2693 = -_2689;
    float _2695 = fma(_2671, _2677, _2693);
    float _2697 = -_2677;
    float _2699 = fma(_2671, _2689, _2697);
    float _2701 = fma(_2671, _2679, _2687);
    float _2703 = fma(_2671, _2687, _2679);
    float _2705 = -_2331;
    float _2707 = _2705 + _2351;
    float _2709 = -_2329;
    float _2711 = _2709 + _2349;
    float _2713 = -_2333;
    float _2715 = _2713 + _2353;
    float _2717 = fma(_2667, _2707, _2331);
    float _2719 = fma(_2667, _2711, _2329);
    float _2721 = fma(_2667, _2715, _2333);
    float _2723 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _2717);
    float _2725 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _2719);
    float _2727 = _2723 * _2645;
    float _2729 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _2721);
    float _2731 = _2725 * _2371;
    float _2733 = _2691 * _2727;
    float _2735 = _2729 * _2373;
    float _2737 = _2699 * _2727;
    float _2739 = _2703 * _2727;
    float _2741 = fma(_2681, _2731, _2733);
    float _2743 = fma(_2701, _2731, _2737);
    float _2745 = fma(_2695, _2731, _2739);
    float _2747 = -_2671;
    float _2749 = fma(_2747, _2735, _2741);
    float _2751 = fma(_2653, _2735, _2743);
    float _2753 = fma(_2659, _2735, _2745);
    float _2755 = _2749 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _2757 = _2749 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _2759 = _2749 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _2761 = fma(_2751, (*spvDescriptorSet0.vp_c10)._m0[10].x, _2755);
    float _2763 = fma(_2751, (*spvDescriptorSet0.vp_c10)._m0[8].x, _2757);
    float _2765 = fma(_2751, (*spvDescriptorSet0.vp_c10)._m0[9].x, _2759);
    float _2767 = fma(_2753, (*spvDescriptorSet0.vp_c10)._m0[10].z, _2761);
    float _2769 = fma(_2753, (*spvDescriptorSet0.vp_c10)._m0[8].z, _2763);
    float _2771 = fma(_2753, (*spvDescriptorSet0.vp_c10)._m0[9].z, _2765);
    float _2773 = _2683 + _2767;
    float _2775 = _2649 + _2769;
    float _2777 = _2685 + _2771;
    float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2781 = _2773 + _2779;
    float _2783 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2785 = _2775 + _2783;
    float _2787 = _2781 * _2781;
    float _2789 = fma(_2785, _2785, _2787);
    float _2791 = sqrt(_2789);
    bool _2793 = _2791 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2795 = _2787;
    float _2797 = _2765;
    float _2799 = _2773;
    float _2801 = _2771;
    float _2803 = _2671;
    if (!_2793)
    {
        _2795 = _2775;
    }
    float _2805 = _2795;
    float _2807 = _2805;
    if (!_2793)
    {
        _2797 = _2777;
    }
    float _2809 = _2797;
    bool _2811 = !_2793;
    float _2813 = _2809;
    if (!_2811)
    {
        float _2815 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2817 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _2819 = _2791 + _2817;
        float _2821 = _2777 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2823 = rsqrt(_2789);
        float _2825 = _2819 * _2815;
        float _2827 = _2825 * 0.15915493667125701904296875;
        float _2829 = _2827 * 6.283185482025146484375;
        float _2831 = cos(_2829);
        float _2833 = _2827 * 6.283185482025146484375;
        float _2835 = sin(_2833);
        float _2837 = _2831 + (-1.0);
        float _2839 = _2837 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _2841 = fma(_2835, _2821, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _2843 = fma(_2777, _2831, _2839);
        float _2845 = _2823 * _2841;
        float _2847 = fma(_2785, _2845, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _2849 = fma(_2781, _2845, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2813 = _2843;
        _2807 = _2847;
        _2799 = _2849;
    }
    float _2851 = _2813;
    float _2853 = _2807;
    float _2855 = _2799;
    float _2857 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2859 = _2851 + _2857;
    float _2861 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2863 = _2853 + _2861;
    float _2865 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2867 = _2855 + _2865;
    float _2869 = _2859 * _2859;
    float _2871 = fma(_2863, _2863, _2869);
    float _2873 = fma(_2867, _2867, _2871);
    float _2875 = rsqrt(_2873);
    float _2877 = sqrt(_2873);
    float _2879 = _2875 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2881 = _2863 * _2879;
    float _2883 = _2867 * _2879;
    float _2885 = _2881 * _2881;
    float _2887 = _2883 * _2883;
    float _2889 = _2885 + _2887;
    float _2891 = sqrt(_2889);
    bool _2893 = _2891 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2895 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2897 = _2891 + _2895;
    float _2899 = _2867;
    float _2901 = _2889;
    float _2903 = _2897;
    float _2905 = _2879;
    if (_2893)
    {
        float _2907 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2899 = _2907;
    }
    float _2909 = _2899;
    if (_2893)
    {
        float _2911 = rsqrt(_2889);
        _2901 = _2911;
    }
    float _2913 = _2901;
    float _2915 = _2913;
    if (_2893)
    {
        float _2917 = _2897 * _2909;
        _2903 = _2917;
    }
    float _2919 = _2903;
    if (_2893)
    {
        float _2921 = _2919 * 0.15915493667125701904296875;
        _2801 = _2921;
    }
    float _2923 = _2801;
    float _2925 = _2909;
    float _2927 = _2923;
    if (_2893)
    {
        float _2929 = _2923 * 6.283185482025146484375;
        float _2931 = sin(_2929);
        _2925 = _2931;
    }
    float _2933 = _2925;
    float _2935 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2937 = precise::max(0.0, _2935);
    float _2939 = _2869;
    float _2941 = _2937;
    if (_2893)
    {
        float _2943 = _2923 * 6.283185482025146484375;
        float _2945 = cos(_2943);
        _2939 = _2945;
    }
    float _2947 = _2939;
    float _2949 = -_2879;
    float _2951 = -_2937;
    float _2953 = fma(_2859, _2949, _2951);
    float _2955 = _2953;
    if (_2893)
    {
        float _2957 = _2953 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2941 = _2957;
    }
    float _2959 = _2941;
    float _2961 = _2933;
    float _2963 = _2959;
    if (_2893)
    {
        float _2965 = fma(_2933, _2959, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2961 = _2965;
    }
    float _2967 = _2961;
    float _2969 = _2967;
    float _2971 = _2947;
    if (_2893)
    {
        float _2973 = _2947 + (-1.0);
        _2963 = _2973;
    }
    float _2975 = _2963;
    float _2977 = _2975;
    if (_2893)
    {
        float _2979 = _2913 * _2967;
        _2905 = _2979;
    }
    float _2981 = _2905;
    if (!_2893)
    {
        _2969 = _2881;
    }
    float _2983 = _2969;
    float _2985 = _2983;
    if (_2893)
    {
        float _2987 = _2975 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2927 = _2987;
    }
    float _2989 = _2927;
    if (_2893)
    {
        float _2991 = _2881 * _2981;
        _2985 = _2991;
    }
    float _2993 = _2985;
    if (!_2893)
    {
        _2977 = _2883;
    }
    float _2995 = _2977;
    float _2997 = _2995;
    if (_2893)
    {
        float _2999 = _2883 * _2981;
        _2997 = _2999;
    }
    float _3001 = _2997;
    if (!_2893)
    {
        _2915 = _2885;
    }
    float _3003 = _2915;
    float _3005 = _3003;
    if (_2893)
    {
        float _3007 = fma(_2953, _2947, _2989);
        _2955 = _3007;
    }
    float _3009 = _2955;
    if (_2893)
    {
        float _3011 = _2993 * _2993;
        _3005 = _3011;
    }
    float _3013 = _3005;
    if (!_2893)
    {
        _2971 = _2887;
    }
    float _3015 = _2971;
    float _3017 = _3015;
    if (_2893)
    {
        float _3019 = _3001 * _3001;
        _3017 = _3019;
    }
    float _3021 = _3017;
    float _3023 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _3025 = fma(_3009, _3009, _3013);
    float _3027 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _3029 = _3025 + _3021;
    float _3031 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[2].x, _3023);
    float _3033 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _3035 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _3037 = fma(_2877, (*spvDescriptorSet0.vp_c15)._m0[23].w, _3035);
    float _3039 = precise::clamp(_3037, 0.0, 1.0);
    float _3041 = rsqrt(_3029);
    float _3043 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[2].z, _3031);
    float _3045 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _3047 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[1].x, _3033);
    float _3049 = -_3039;
    float _3051 = _3049 + 1.0;
    float _3053 = _3043 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _3055 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[0].x, _3045);
    float _3057 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[1].z, _3047);
    float _3059 = _2851 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _3061 = _3053 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _3063 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[0].z, _3055);
    float _3065 = _3057 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _3067 = abs(_3051);
    float _3069 = log2(_3067);
    float _3071 = -_3061;
    float _3073 = fma(_3071, _3027, 1.0);
    float _3075 = fma(_2853, (*spvDescriptorSet0.vp_c8)._m0[3].x, _3059);
    float _3077 = _3063 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _3079 = _3041 * _2993;
    float _3081 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _3083 = _3041 * _3009;
    float _3085 = fma(_2855, (*spvDescriptorSet0.vp_c8)._m0[3].z, _3075);
    float _3087 = _3079 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _3089 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[7].x, _3081);
    float _3091 = _3041 * _3001;
    float _3093 = _3085 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _3095 = -_3087;
    float _3097 = fma(_3083, (*spvDescriptorSet0.vp_c15)._m0[21].y, _3095);
    float _3099 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[7].z, _3089);
    float _3101 = log2(_3073);
    float _3103 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _3105 = -_3091;
    float _3107 = fma(_3105, (*spvDescriptorSet0.vp_c15)._m0[21].z, _3097);
    float _3109 = fma(_3093, (*spvDescriptorSet0.vp_c8)._m0[7].w, _3099);
    float _3111 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _3113 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _3115 = fma(_3107, -0.5, 0.5);
    float _3117 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[5].x, _3103);
    float _3119 = 1.0 / _3109;
    float _3121 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[4].x, _3113);
    float _3123 = fma(_3107, 0.5, 0.5);
    float _3125 = _3083 + 1.0;
    float _3127 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[4].z, _3121);
    float _3129 = fma(_3123, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _3131 = exp2(_3111);
    float _3133 = fma(_3093, (*spvDescriptorSet0.vp_c8)._m0[4].w, _3127);
    float _3135 = _3101 * 0.693147182464599609375;
    float _3137 = fma(_3123, _3129, -0.212114393711090087890625);
    float _3139 = _3135 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3141 = fma(_3123, _3137, 1.570728778839111328125);
    float _3143 = sqrt(_3115);
    float _3145 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[5].z, _3117);
    float _3147 = _3133 * _3119;
    float _3149 = fma(_3093, (*spvDescriptorSet0.vp_c8)._m0[5].w, _3145);
    float _3151 = fma(_3147, 0.5, 0.5);
    float _3153 = -_3083;
    float _3155 = fma(_3131, _3125, _3153);
    float _3157 = _3149 * _3119;
    float _3159 = fma(_3155, 0.5, 0.5);
    float _3161 = fma(_3157, -0.5, 0.5);
    float _3163 = _3143 * 0.636619746685028076171875;
    float3 _8641 = float3(_3151, _3161, _3139);
    float _3165 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8641, float3(0.0), isnan(_8641)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8641, float3(0.0), isnan(_8641)), level(0.0)).x;
    float _3167 = -_3141;
    float _3169 = fma(_3163, _3167, 1.0);
    float3 _8657 = float3(_3151, _3161, _3139);
    float4 _3172 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8657, float3(0.0), isnan(_8657)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8657, float3(0.0), isnan(_8657)), level(0.0)).xyzw;
    float _3174 = _3172.x;
    float _3176 = _3172.y;
    float _3178 = _3172.z;
    float _3180 = _3172.w;
    float2 _8674 = float2(_3169, _3159);
    float3 _3182 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8674, float2(0.0), isnan(_8674)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8674, float2(0.0), isnan(_8674)), level(0.0)).xyz;
    float _3184 = _3182.x;
    float _3186 = _3182.y;
    float _3188 = _3182.z;
    float _3190 = in.m_71.x;
    float _3192 = in.m_71.y;
    float _3194 = in.m_71.z;
    float _3196 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _3198 = in.m_73.x;
    float _3200 = in.m_73.y;
    float _3202 = in.m_73.z;
    float _3204 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3206 = _3204 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3208 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _3210 = isnan(0.5);
    bool _3212 = _3208 || _3210;
    bool _3214 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _3216 = _3212 || _3214;
    float _3218 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3220 = _3218 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3222 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[11].x, _3196);
    bool _3224 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _3226 = isnan(_2279);
    bool _3228 = _3224 || _3226;
    bool _3230 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _3232 = _3228 || _3230;
    float _3234 = float(_3232);
    float _3236 = 1.0 / _3206;
    bool _3238 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _3240 = isnan(_2279);
    bool _3242 = _3238 || _3240;
    bool _3244 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _3246 = _3242 || _3244;
    float _3248 = float(_3246);
    float _3250 = -(*spvDescriptorSet0.vp_c9)._m0[175].y;
    float _3252 = (*spvDescriptorSet0.vp_c9)._m0[176].y + _3250;
    float _3254 = -(*spvDescriptorSet0.vp_c9)._m0[176].y;
    float _3256 = _3254 + (*spvDescriptorSet0.vp_c9)._m0[177].y;
    bool _3258 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _3260 = isnan(_2279);
    bool _3262 = _3258 || _3260;
    bool _3264 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _3266 = _3262 || _3264;
    float _3268 = float(_3266);
    float _3270 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[11].z, _3222);
    float _3272 = -_3248;
    float _3274 = _3272 + 1.0;
    bool _3276 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _3278 = isnan(_2279);
    bool _3280 = _3276 || _3278;
    bool _3282 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _3284 = _3280 || _3282;
    float _3286 = float(_3284);
    float _3288 = 1.0 / _3220;
    bool _3290 = _2717 != 0.0;
    bool _3292 = isnan(_2717);
    bool _3294 = _3290 || _3292;
    bool _3296 = isnan(0.0);
    bool _3298 = _3294 || _3296;
    float _3300 = _3069 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    out.m_75.x = _2649;
    out.m_75.y = _2685;
    out.m_75.z = _2683;
    float _3302 = -_3286;
    float _3304 = _3302 + 1.0;
    bool _3306 = _2719 == 0.0;
    bool _3308 = !_3298;
    bool _3310 = _3306 && _3308;
    out.m_77.x = _2853;
    out.m_77.y = _2851;
    out.m_77.z = _2855;
    float _3312 = -_3190;
    float _3314 = _3312 + _3198;
    float _3316 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3318 = _3316 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3320 = _3252 * _3236;
    float _3322 = -_3192;
    float _3324 = _3322 + _3200;
    float _3326 = 1.0 / _3318;
    float _3328 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3330 = _3328 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3332 = fma(_1951, _3314, _3190);
    float _3334 = fma(_1951, _3324, _3192);
    float _3336 = -(*spvDescriptorSet0.vp_c9)._m0[177].y;
    float _3338 = (*spvDescriptorSet0.vp_c9)._m0[178].y + _3336;
    bool _3340 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _3342 = isnan(_2279);
    bool _3344 = _3340 || _3342;
    bool _3346 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _3348 = _3344 || _3346;
    float _3350 = float(_3348);
    float _3352 = 1.0 / _3330;
    float _3354 = -_3234;
    float _3356 = _3354 + 1.0;
    float _3358 = _3256 * _3288;
    bool _3360 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _3362 = isnan(_2279);
    bool _3364 = _3360 || _3362;
    bool _3366 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _3368 = _3364 || _3366;
    float _3370 = float(_3368);
    float _3372 = -_3194;
    float _3374 = _3372 + _3202;
    float _3376 = _3350 * _3356;
    float _3378 = -_3350;
    float _3380 = _3378 + 1.0;
    bool _3382 = _2721 == 0.0;
    bool _3384 = _3382 && _3310;
    float _3386 = _3338 * _3326;
    float _3388 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3390 = _3388 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3392 = -_3370;
    float _3394 = _3392 + 1.0;
    float _3396 = _3370 * _3380;
    float _3398 = -(*spvDescriptorSet0.vp_c9)._m0[178].y;
    float _3400 = _3398 + (*spvDescriptorSet0.vp_c9)._m0[179].y;
    float _3402 = fma(_1951, _3374, _3194);
    float _3404 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3406 = _3404 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3408 = _3248 * _3394;
    float _3410 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _3412 = _2279 + _3410;
    float _3414 = _3400 * _3352;
    float _3416 = _3268 * _3274;
    float _3418 = -_3268;
    float _3420 = _3418 + 1.0;
    float _3422 = 1.0 / _3406;
    float _3424 = fma(_3320, _3412, (*spvDescriptorSet0.vp_c9)._m0[175].y);
    bool _3426 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _3428 = isnan(_2279);
    bool _3430 = _3426 || _3428;
    bool _3432 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _3434 = _3430 || _3432;
    float _3436 = float(_3434);
    float _3438 = _3286 * _3420;
    float _3440 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _3442 = _2279 + _3440;
    float _3444 = -(*spvDescriptorSet0.vp_c9)._m0[179].y;
    float _3446 = (*spvDescriptorSet0.vp_c9)._m0[180].y + _3444;
    float _3448 = -(*spvDescriptorSet0.vp_c9)._m0[180].y;
    float _3450 = _3448 + (*spvDescriptorSet0.vp_c9)._m0[181].y;
    float _3452 = 1.0 / _3390;
    float _3454 = _3436 * _3304;
    float _3456 = fma(_3358, _3442, (*spvDescriptorSet0.vp_c9)._m0[176].y);
    float _3458 = -_3436;
    float _3460 = _3458 + 1.0;
    float _3462 = _3424 * _3454;
    float _3464 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _3466 = _2279 + _3464;
    float _3468 = _3334;
    float _3470 = _3332;
    float _3472 = _3402;
    float _3474 = _3234;
    if (!_3384)
    {
        float _3476 = fma(_2717, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3334);
        _3468 = _3476;
    }
    float _3478 = _3468;
    float _3480 = _3450 * _3422;
    float _3482 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _3484 = _2279 + _3482;
    float _3486 = fma(_3460, (*spvDescriptorSet0.vp_c9)._m0[175].y, _3462);
    float _3488 = -(*spvDescriptorSet0.vp_c9)._m0[181].y;
    float _3490 = (*spvDescriptorSet0.vp_c9)._m0[182].y + _3488;
    float _3492 = exp2(_3300);
    float _3494 = fma(_3386, _3484, (*spvDescriptorSet0.vp_c9)._m0[177].y);
    float _3496 = fma(_3456, _3438, _3486);
    float _3498 = fma(_3414, _3466, (*spvDescriptorSet0.vp_c9)._m0[178].y);
    float _3500 = _3446 * _3452;
    float _3502 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _3504 = _2279 + _3502;
    float _3506 = fma(_3494, _3416, _3496);
    float _3508 = _3270 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _3510 = fma(_3500, _3504, (*spvDescriptorSet0.vp_c9)._m0[179].y);
    float _3512 = fma(_3498, _3408, _3506);
    float _3514 = _2685 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _3516 = 1.0 / _3508;
    float _3518 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _3520 = _2279 + _3518;
    float _3522 = fma(_3510, _3396, _3512);
    float _3524 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3526 = _3524 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _3528 = fma(_2649, (*spvDescriptorSet0.vp_c8)._m0[10].x, _3514);
    float _3530 = fma(_3480, _3520, (*spvDescriptorSet0.vp_c9)._m0[180].y);
    float _3532 = _3512;
    if (!_3216)
    {
        _3532 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    }
    float _3534 = _3532;
    float _3536 = _3534;
    if (!_3384)
    {
        float _3538 = fma(_2719, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3332);
        _3470 = _3538;
    }
    float _3540 = _3470;
    float _3542 = fma(_2683, (*spvDescriptorSet0.vp_c8)._m0[10].z, _3528);
    float _3544 = 1.0 / _3526;
    float _3546 = fma(_3530, _3376, _3522);
    bool _3548 = _2279 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _3550 = isnan(_2279);
    bool _3552 = _3548 || _3550;
    bool _3554 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _3556 = _3552 || _3554;
    float _3558 = float(_3556);
    float _3560 = _3542 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _3562 = _2691 * _3478;
    float _3564 = _2699 * _3478;
    float _3566 = _2703 * _3478;
    float _3568 = _3560 + _3508;
    float _3570 = -_3558;
    float _3572 = _3570 + 1.0;
    if (!_3384)
    {
        float _3574 = fma(_2721, (*spvDescriptorSet0.vp_c9)._m0[17].y, _3402);
        _3472 = _3574;
    }
    float _3576 = _3472;
    float _3578 = fma(_2681, _3540, _3562);
    float _3580 = _3568 * _3516;
    float _3582 = _3580 * 0.5;
    float _3584 = _3234 * _3572;
    float _3586 = fma(_2701, _3540, _3564);
    float _3588 = fma(_2695, _3540, _3566);
    if (!_3216)
    {
        float _3590 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _3592 = fma(_3582, _3534, _3590);
        _3536 = _3592;
    }
    float _3594 = _3536;
    float _3596 = _3490 * _3544;
    float _3598 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _3600 = _2279 + _3598;
    if (!_3216)
    {
        _2429 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _3602 = _2429;
    float _3604 = _3065 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3606 = -_2671;
    float _3608 = fma(_3606, _3576, _3578);
    float _3610 = fma(_3596, _3600, (*spvDescriptorSet0.vp_c9)._m0[181].y);
    float _3612 = _3594;
    if (!_3216)
    {
        float _3614 = 1.0 / _3594;
        _3612 = _3614;
    }
    float _3616 = _3612;
    if (!_3216)
    {
        float _3618 = -_3602;
        float _3620 = _3618 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _3474 = _3620;
    }
    float _3622 = _3474;
    float _3624 = -_3492;
    float _3626 = _3624 + 1.0;
    float _3628 = fma(_3610, _3584, _3546);
    float _3630 = fma(_3077, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3604);
    float _3632 = fma(_2653, _3576, _3586);
    float _3634 = _3626 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3636 = fma(_3558, (*spvDescriptorSet0.vp_c9)._m0[182].y, _3628);
    float _3638 = fma(_3053, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3630);
    float _3640 = _3558;
    float _3642 = _3622;
    if (!_3216)
    {
        float _3644 = 1.0 / _3622;
        _3640 = _3644;
    }
    float _3646 = _3640;
    float _3648 = fma(_2659, _3576, _3588);
    float _3650 = _3608 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _3652 = _3109 * 0.5;
    float _3654 = -_3634;
    float _3656 = _3654 + 1.0;
    float _3658 = fma(_3632, (*spvDescriptorSet0.vp_c10)._m0[9].x, _3650);
    if (!_3216)
    {
        float _3660 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _3662 = -_3602;
        float _3664 = fma(_3616, _3660, _3662);
        _2803 = _3664;
    }
    float _3666 = _2803;
    float _3668 = _3608 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    if (_3216)
    {
        _3642 = 1.0;
    }
    float _3670 = _3642;
    float _3672 = _3608 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _3674 = fma(_3149, -0.5, _3652);
    float _3676 = fma(_3632, (*spvDescriptorSet0.vp_c10)._m0[8].x, _3668);
    float _3678 = fma(_3093, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3638);
    float _3680 = fma(_3632, (*spvDescriptorSet0.vp_c10)._m0[10].x, _3672);
    float _3682 = fma(_3648, (*spvDescriptorSet0.vp_c10)._m0[9].z, _3658);
    float _3684 = _3670;
    if (!_3216)
    {
        float _3686 = _3666 * _3646;
        float _3688 = precise::clamp(_3686, 0.0, 1.0);
        _3684 = _3688;
    }
    float _3690 = _3684;
    float _3692 = fma(_3648, (*spvDescriptorSet0.vp_c10)._m0[8].z, _3676);
    float _3694 = _3678 + _3109;
    float _3696 = _3133 + _3109;
    float _3698 = _3690 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    bool _3700 = _3690 > 0.0;
    bool _3702 = isnan(_3690);
    bool _3704 = _3700 || _3702;
    bool _3706 = isnan(0.0);
    bool _3708 = _3704 || _3706;
    float _3710 = fma(_3648, (*spvDescriptorSet0.vp_c10)._m0[10].z, _3680);
    float _3712 = _3694 * 0.5;
    float _3714 = _3696 * 0.5;
    float _3716 = _3698 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    out.m_79.y = _3636;
    out.m_81.x = _3692;
    out.m_81.y = _3682;
    out.m_81.z = _3710;
    out.gl_Position.x = _3133;
    out.gl_Position.y = _3149;
    out.gl_Position.z = _3678;
    out.gl_Position.w = _3109;
    out.m_83.x = _3714;
    out.m_83.y = _3674;
    out.m_83.z = _3712;
    out.m_83.w = _3109;
    out.m_51.x = _3716;
    float _3718 = _3634 * _3165;
    float _3720 = _3180 * _3718;
    float _3722 = _3180 * _3656;
    float _3724 = _3188 * _3718;
    float _3726 = fma(_3184, _3720, _3174);
    float _3728 = fma(_3186, _3720, _3176);
    float _3730 = fma(_3180, _3724, _3178);
    out.m_85.x = _3726;
    out.m_85.y = _3728;
    out.m_85.z = _3730;
    out.m_85.w = _3722;
    if (_3708)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3732 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3732;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_75.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_75.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_75.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_75.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_83.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_83.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_83.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_83.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_79.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_79.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_79.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_79.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_81.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_81.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_81.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_81.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_77.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_77.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_77.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_77.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_85.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_85.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_85.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_85.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

