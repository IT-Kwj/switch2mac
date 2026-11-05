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
    constant _16* vp_c13 [[id(6)]];
    texture3d<float> vp_t_tcb_32 [[id(7)]];
    sampler vp_t_tcb_32Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_30 [[id(9)]];
    sampler vp_t_tcb_30Smplr [[id(10)]];
    texture2d<float> vp_t_tcb_1C [[id(11)]];
    sampler vp_t_tcb_1CSmplr [[id(12)]];
    sampler vp_t_tcb_32Smplr_w [[id(13)]];
    sampler vp_t_tcb_30Smplr_w [[id(14)]];
    sampler vp_t_tcb_1CSmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_58 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_60 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_84 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_72 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_74 [[user(locn8)]];
    float4 m_76 [[user(locn9)]];
    float4 m_68 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_80 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_62 [[attribute(1)]];
    float4 m_46 [[attribute(2)]];
    float4 m_51 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_64 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2795 = false;
    bool _1990 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3094 = as_type<float>(_119);
        out.gl_Position.z = _3094;
    }
    if (!_107)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = 0.0;
    float _141 = _137;
    if (_133)
    {
        float _143 = float(_103);
        _113 = _143;
    }
    float _145 = _113;
    bool _147 = _137 >= _145;
    bool _149 = !_133;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _121 = as_type<int>(_157);
    }
    int _159 = _121;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3164 = as_type<float>(_159);
        out.gl_Position.z = _3164;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _165 = as_type<int>(_161) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_161) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_163;
    float _201;
    float _203;
    if (!_181)
    {
        float _183 = in.m_56.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = float(_103);
        float _189 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _193 = _191 * _185;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = _187;
        _205 = true;
    }
    else
    {
        float _207 = float(_103);
        float _209 = 1.0 / _207;
        float _211 = _137 * _209;
        _201 = _211;
        _203 = _207;
    }
    _205 = false;
    float _213 = _201;
    float _215 = _203;
    float _217 = in.m_56.x;
    float _219 = in.m_56.y;
    float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _223 = log2(_221);
    float _225 = in.m_56.z;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _229 = _213 + _227;
    int _231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _233 = _231 != 0;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    int _239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _241 = _239 != 0;
    float _243 = in.m_56.w;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _247 = _245 != 0;
    float _249 = 1.0 / _237;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _213 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _267;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _273 = 1.0 / _265;
    bool _275 = _217 > 0.5;
    float _277 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _279 = _219 > 0.5;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _283 = _213 + _281;
    float _285 = -_175;
    int _287 = _275 ? as_type<int>(_285) : as_type<int>(_175);
    float _289 = _217 * 2.0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _293 = _291 != 0;
    float _295 = 1.0 / _269;
    float _297 = -_179;
    int _299 = _279 ? as_type<int>(_297) : as_type<int>(_179);
    float _301 = fma(_277, -2.0, _271);
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _305 = _303 != 0;
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _309 = _307 != 0;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = _213 + _311;
    bool _315 = !_241;
    float _317 = _315 ? _175 : as_type<float>(_287);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = _213 + _319;
    bool _323 = !_247;
    float _325 = _323 ? _179 : as_type<float>(_299);
    float _327 = 1.0 / _261;
    float _329 = -_175;
    int _331 = _279 ? as_type<int>(_329) : as_type<int>(_175);
    float _333 = _229 * _273;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _337 = _335 != 0;
    float _339 = _223 * _137;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _343 = _341 != 0;
    float _345 = _321 * _249;
    int _347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _349 = _347 != 0;
    float _351 = 1.0 / _253;
    float _353 = in.m_46.x;
    float _355 = in.m_46.y;
    float _357 = in.m_46.z;
    float _359 = _217 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_233)
    {
        _139 = _219;
    }
    float _361 = _139;
    float _363 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _301);
    float _365 = 0.0;
    float _367 = _361;
    if (_233)
    {
        _365 = _217;
    }
    float _369 = _365;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _373 = !_233;
    float _375 = _373 ? 5.839270114898681640625 : 1.0;
    float _377 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _379 = int(_377);
    float _381 = _369;
    if (!_233)
    {
        _367 = _217;
    }
    float _383 = _367;
    float _385 = -_371;
    float _387 = fma(_359, 2.0, _385);
    if (!_233)
    {
        _381 = _225;
    }
    float _389 = _381;
    float _391 = _313 * _327;
    bool _393 = !_233;
    float _395 = _393 ? _225 : _217;
    float _397 = _383 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _399 = _225 > 0.5;
    float _401 = 1.0 / _215;
    float _403 = _257 * _351;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _407 = _213 + _405;
    float _409 = -_179;
    int _411 = _399 ? as_type<int>(_409) : as_type<int>(_179);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _413;
    float _417 = -_175;
    int _419 = _399 ? as_type<int>(_417) : as_type<int>(_175);
    float _421 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _423 = _243 > 0.5;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _429 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _431 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _437 = _213 + _435;
    float _439 = 1.0 / _415;
    float _441 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].x, _421);
    float _443 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].x, _429);
    float _445 = _437 * _295;
    float _447 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].x, _431);
    out.m_58.w = _433;
    float _449 = _375 * _395;
    float _451 = 1.0 / _427;
    float _453 = float(_379);
    float _455 = _219 * 2.0;
    float _457 = -_137;
    float _459 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[76].x, _387);
    float _461 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].z, _441);
    bool _463 = !_343;
    float _465 = _463 ? _175 : as_type<float>(_419);
    float _467 = exp2(_339);
    float _469 = _283 * _439;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _475 = _453 * _137;
    float _477 = _217 + _225;
    float _479 = fma(_397, -2.0, _473);
    float _481 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _483 = int(_481);
    float _485 = _407 * _451;
    float _487 = -_179;
    int _489 = _423 ? as_type<int>(_487) : as_type<int>(_179);
    float _491 = _389 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _493 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _501 = _497 || _499;
    float _503 = _475 * _401;
    float _505 = -_471;
    float _507 = fma(_491, 2.0, _505);
    float _509 = -_467;
    float _511 = _509 + 1.0;
    float _513 = floor(_289);
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _517 = -_137;
    float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[86].x, _507);
    float _521 = _501 ? _511 : 0.0;
    float _523 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[88].w, _515);
    float _525 = float(_483);
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _529 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _531 = isnan(1.0);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _537 = _533 || _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _541 = 1.0 + _539;
    float _543 = 1.0 / _525;
    float _545 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _479);
    float _547 = _477 + (-1.0);
    bool _549 = !_349;
    float _551 = _549 ? _179 : as_type<float>(_489);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _555 = _513 >= 0.0;
    bool _557 = isnan(_513);
    bool _559 = _555 || _557;
    bool _561 = isnan(0.0);
    bool _563 = _559 || _561;
    float _565 = 1.0 / _541;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _569 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].w, _553);
    float _571 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[88].z, _527);
    float _573 = _219 + _217;
    float _575 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[78].z, _567);
    float _577 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _569);
    float _579 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _571);
    float _581 = floor(_455);
    float _583 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _523);
    float _585 = _225 * 2.0;
    float _587 = _543 * _137;
    float _589 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _575);
    float _591 = _573 + (-1.0);
    int _593 = _563 ? 0 : 1;
    if (_537)
    {
        float _595 = _521 * _565;
        _141 = _595;
    }
    float _597 = _141;
    float _599 = floor(_585);
    float _601 = _219 + _225;
    bool _603 = _513 > 0.0;
    float _605 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _607 = _601 + (-1.0);
    float _609 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _611 = _581 >= 0.0;
    bool _613 = isnan(_581);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    float _621 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].z, _443);
    float _623 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _625 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
    float _627 = trunc(_587);
    int _629 = int(_627);
    int _631 = ~_593;
    int _633 = _631 + 1;
    int _635 = _633 + 1;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _637;
    bool _641 = _581 > 0.0;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _643;
    int _647 = _635;
    if (!_603)
    {
        int _649 = ~_593;
        int _651 = _649 + 1;
        _647 = _651;
    }
    int _653 = _647;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _659 = _619 ? 0 : 1;
    float _661 = fma(_639, _345, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _663 = _599 > 0.0;
    float _665 = fma(_645, _345, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _667 = _599 >= 0.0;
    bool _669 = isnan(_599);
    bool _671 = _667 || _669;
    bool _673 = isnan(0.0);
    bool _675 = _671 || _673;
    float _677 = fma(_657, _403, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _699 = fma(_681, _391, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _701 = fma(_693, _391, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _703 = fma(_685, _333, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _705 = fma(_697, _333, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _707 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _709 = isnan(_213);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _719;
    bool _723 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _725 = isnan(_213);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _735;
    float _739 = float(uint(_379));
    float _741 = -_717;
    float _743 = _741 + 1.0;
    float _745 = fma(_721, _445, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _747 = fma(_737, _445, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    bool _749 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _751 = isnan(_213);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _733 * _743;
    float _763 = 1.0 / _739;
    float _765 = -_733;
    float _767 = _765 + 1.0;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    bool _773 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _775 = isnan(_213);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _789 = -_759;
    float _791 = _789 + 1.0;
    float _793 = _759 * _767;
    float _795 = fma(_771, _485, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _797 = fma(_787, _485, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _799 = _783 * _791;
    float _801 = -_783;
    float _803 = _801 + 1.0;
    float _805 = fma(_689, _403, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _809 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _811 = isnan(_213);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -_551;
    float _823 = _821 + 0.5;
    bool _825 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _827 = isnan(_213);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -_577;
    float _839 = _837 + 1.0;
    bool _841 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _843 = isnan(_213);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -_819;
    float _855 = _853 + 1.0;
    bool _857 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _859 = isnan(_213);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _871 = as_type<int>(_763) + (-2);
    float _873 = _819 * _803;
    float _875 = float(uint(_629));
    float _877 = _835 * _855;
    float _879 = -_835;
    float _881 = _879 + 1.0;
    float _883 = floor(_449);
    float _885 = as_type<float>(_871) * _875;
    float _887 = _867 * _881;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _889;
    float _893 = _807 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _895;
    float _899 = _317 + 0.5;
    float _901 = -_867;
    float _903 = _901 + 1.0;
    float _905 = _869 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _907 = trunc(_885);
    float _909 = precise::max(_907, 0.0);
    uint _912 = uint(_909);
    float _914 = _325 + (-0.5);
    float _916 = fma(_897, _469, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _918 = fma(_905, _899, _459);
    float _920 = _851 * _903;
    float _922 = -_893;
    float _924 = -_363;
    float _926 = fma(_922, _914, _924);
    float _928 = -_851;
    float _930 = _928 + 1.0;
    int _932 = ~_379;
    int _934 = _932 + 1;
    float _936 = _661 * _920;
    float _938 = _665 * _920;
    float _940 = -_883;
    float _942 = _449 + _940;
    float _944 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _946 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].x, _936);
    float _948 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].y, _938);
    float _950 = float(_629);
    int _952 = _934 * int(_912);
    int _954 = _952 + _629;
    float _956 = _823 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _958 = ~_659;
    int _960 = _958 + 1;
    int _962 = _960 + 1;
    float _964 = _453 * _942;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _968 = float(uint(_954));
    float _970 = fma(_677, _887, _946);
    int _972 = _962;
    if (!_641)
    {
        int _974 = ~_659;
        int _976 = _974 + 1;
        _972 = _976;
    }
    int _978 = _972;
    float _980 = _465 + 0.5;
    bool _982 = _950 >= _453;
    bool _984 = isnan(_950);
    bool _986 = _982 || _984;
    bool _988 = isnan(_453);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = as_type<float>(_871) * _968;
    float _996 = -_589;
    float _998 = _996 + 1.0;
    float _1000 = _956 * _944;
    float _1002 = fma(_325, _839, _926);
    float _1004 = trunc(_994);
    float _1006 = precise::max(_1004, 0.0);
    uint _1008 = uint(_1006);
    float _1010 = -_998;
    float _1012 = fma(_317, _1010, _918);
    float _1014 = _980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1016 = !_305;
    float _1018 = _1016 ? _175 : as_type<float>(_331);
    float _1020 = fma(_805, _887, _948);
    bool _1022 = !_309;
    float _1024 = _1022 ? _179 : as_type<float>(_411);
    float _1026 = _1014 * _966;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1030 = _1028 != 0;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1034 = _1032 != 0;
    float _1036 = fma(_699, _877, _970);
    bool _1038 = !_293;
    int _1040 = _1038 ? 0 : 1;
    float _1042 = trunc(_992);
    int _1044 = int(_1042);
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1048 = _1046 != 0;
    out.m_60.x = _1012;
    out.m_60.y = _1002;
    out.m_60.z = _1026;
    int _1050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1052 = _1050 != 0;
    float _1054 = _219 + (-0.5);
    int _1056 = _675 ? 0 : 1;
    float _1058 = fma(_701, _877, _1020);
    bool _1060 = !_1034;
    int _1062 = _1060 ? 0 : 1;
    float _1064 = trunc(_503);
    int _1066 = int(_1064);
    bool _1068 = !_1030;
    int _1070 = _1068 ? 0 : 1;
    float _1072 = _217 + (-0.5);
    int _1074 = ~_379;
    int _1076 = _1074 + 1;
    float _1078 = _225 + (-0.5);
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1090 = _1088 != 0;
    float _1092 = fma(_705, _873, _1058);
    int _1094 = ~_1056;
    int _1096 = _1094 + 1;
    int _1098 = _1096 + 1;
    float _1100 = fma(_703, _873, _1036);
    int _1102 = int(_912) + int(_1008);
    float _1104 = fma(_747, _799, _1092);
    float _1106 = trunc(_964);
    int _1108 = int(_1106);
    int _1110 = _1098;
    if (!_663)
    {
        int _1112 = ~_1056;
        int _1114 = _1112 + 1;
        _1110 = _1114;
    }
    int _1116 = _1110;
    float _1118 = fma(_745, _799, _1100);
    bool _1120 = !_1086;
    int _1122 = _1120 ? 0 : 1;
    int _1124 = _1076 * _1102;
    int _1126 = _1124 + _629;
    int _1128 = abs(_1040);
    float _1130 = fma(_795, _793, _1118);
    int _1132 = abs(_1122);
    float _1134 = fma(_891, _469, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1136 = in.m_62.x;
    float _1138 = in.m_62.y;
    float _1140 = in.m_62.z;
    bool _1142 = uint(_1126) >= uint(_379);
    float _1144 = fma(_797, _793, _1104);
    float _1146 = fma(_916, _761, _1130);
    bool _1148 = !_1142;
    int _1150 = _1148 ? 0 : (-1);
    float _1152 = fma(_1134, _761, _1144);
    bool _1154 = !_1082;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1108 * _1128;
    int _1160 = _1158 + _629;
    float _1162 = float(_653);
    float _1164 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1146);
    float _1166 = float(_1132);
    float _1168 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1152);
    int _1170 = ~_1102;
    int _1172 = _1170 + _1150;
    int _1174 = _1172 + 1;
    float _1176 = _461 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1178 = abs(_1156);
    float _1180 = _1166 * _1162;
    float _1182 = float(uint(_1160));
    int _1184 = _379 * _1174;
    int _1186 = _1184 + _629;
    float _1188 = _1180 * (-2.0);
    bool _1190 = _379 == 0;
    float _1192 = as_type<float>(_871) * _1182;
    float _1194 = float(_1178);
    float _1196 = fma(_623, _1188, _623);
    int _1198 = ~_1044;
    int _1200 = _1198 + 1;
    int _1202 = _1200 + 1;
    float _1204 = fma(_1188, _1138, _1138);
    bool _1206 = !_1190;
    int _1208 = _1206 ? _1186 : (-1);
    float _1210 = trunc(_1192);
    float _1212 = precise::max(_1210, 0.0);
    uint _1214 = uint(_1212);
    int _1216 = _379 + (-1);
    float _1218 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1204);
    float _1220 = float(_1116);
    int _1222 = _1202 * _1208;
    int _1224 = abs(_1070);
    float _1226 = fma(_1196, _597, _1218);
    float _1228 = float(_978);
    int _1230 = _1044 * _1216;
    int _1232 = _1230 + _1222;
    float _1234 = _1194 * _1220;
    bool _1236 = !_1048;
    int _1238 = _1236 ? 0 : 1;
    float _1240 = _1226 * 0.15915493667125701904296875;
    int _1242 = abs(_1062);
    float _1244 = _625 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1246 = abs(_1238);
    out.m_60.w = _1000;
    bool _1248 = !_1052;
    int _1250 = _1248 ? 0 : 1;
    int _1252 = _1232 * _1242;
    float _1254 = _621 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1256 = abs(_1250);
    bool _1258 = !_1090;
    int _1260 = _1258 ? 0 : 1;
    int _1262 = _1066 * _1224;
    int _1264 = _1262 + _1252;
    int _1266 = abs(_1260);
    int _1268 = _1160 * _1246;
    int _1270 = _1268 + _1264;
    int _1272 = ~_379;
    int _1274 = _1272 + 1;
    float _1276 = float(_1266);
    int _1278 = _1108 * _1256;
    int _1280 = _1278 + _1270;
    float _1282 = _1234 * (-2.0);
    int _1284 = _1274 * int(_1214);
    int _1286 = _1284 + _1160;
    int _1288 = ~_379;
    int _1290 = _1288 + 1;
    float _1292 = _1276 * _1228;
    float _1294 = float(uint(_1280));
    float _1296 = fma(_1282, _1136, _1136);
    float _1298 = fma(_605, _1282, _605);
    float _1300 = _1292 * (-2.0);
    int _1302 = ~_379;
    int _1304 = _1302 + 1;
    float _1306 = as_type<float>(_871) * _1294;
    float _1308 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1296);
    float _1310 = float(uint(_1286));
    float _1312 = fma(_1300, _1140, _1140);
    float _1314 = trunc(_1306);
    float _1316 = precise::max(_1314, 0.0);
    uint _1318 = uint(_1316);
    float _1320 = fma(_1298, _597, _1308);
    float _1322 = fma(_609, _1300, _609);
    float _1324 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1312);
    float _1326 = as_type<float>(_871) * _1310;
    float _1328 = _1320 * 0.15915493667125701904296875;
    float _1330 = fma(_1322, _597, _1324);
    float _1332 = in.m_64.x;
    float _1334 = in.m_64.y;
    float _1336 = _1018 + 0.5;
    float _1338 = trunc(_1326);
    float _1340 = precise::max(_1338, 0.0);
    uint _1342 = uint(_1340);
    float _1344 = _1330 * 0.15915493667125701904296875;
    float _1346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[90].x, _519);
    int _1350 = ~_379;
    int _1352 = _1350 + 1;
    float _1354 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1356 = _1304 * int(_1318);
    int _1358 = _1356 + _1280;
    float _1360 = _1240 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    float _1364 = float(uint(_1358));
    float _1366 = _1024 + (-0.5);
    float _1368 = as_type<float>(_871) * _1364;
    int _1370 = int(_1214) + int(_1342);
    float _1372 = _1240 * 6.283185482025146484375;
    float _1374 = cos(_1372);
    float _1376 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _1378 = -_1366;
    float _1380 = -_545;
    float _1382 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[90].y, _1380);
    float _1384 = _1168 * _1334;
    float _1386 = _1164 * _1332;
    int _1388 = _1352 * _1370;
    int _1390 = _1388 + _1160;
    float _1392 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1394 = trunc(_1368);
    float _1396 = precise::max(_1394, 0.0);
    uint _1398 = uint(_1396);
    float _1400 = _1384 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1402 = _1386 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1404 = uint(_1390) >= uint(_379);
    float _1406 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1408 = _1400 * _1376;
    float _1410 = _1402 * _1346;
    float _1412 = _1328 * 6.283185482025146484375;
    float _1414 = sin(_1412);
    float _1416 = _1328 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    int _1420 = int(_1318) + int(_1398);
    int _1422 = _1290 * _1420;
    int _1424 = _1422 + _1280;
    float _1426 = _1344 * 6.283185482025146484375;
    float _1428 = cos(_1426);
    float _1430 = _1414 * _1362;
    float _1432 = _1414 * _1374;
    bool _1434 = uint(_1424) >= uint(_379);
    bool _1436 = !_1404;
    int _1438 = _1436 ? 0 : (-1);
    bool _1440 = !_1434;
    int _1442 = _1440 ? 0 : (-1);
    float _1444 = _1344 * 6.283185482025146484375;
    float _1446 = sin(_1444);
    float _1448 = _1418 * _1374;
    float _1450 = _1418 * _1362;
    int _1452 = ~_1420;
    int _1454 = _1452 + _1442;
    int _1456 = _1454 + 1;
    int _1458 = ~_1370;
    int _1460 = _1458 + _1438;
    int _1462 = _1460 + 1;
    float _1464 = _1414 * _1428;
    float _1466 = _1374 * _1428;
    float _1468 = _1418 * _1428;
    float _1470 = _1362 * _1428;
    float _1472 = fma(_1406, _1406, 1.0);
    int _1474 = _379 * _1456;
    int _1476 = _1474 + _1280;
    float _1478 = _1468 * _1408;
    int _1480 = _379 * _1462;
    int _1482 = _1480 + _1160;
    float _1484 = rsqrt(_1472);
    float _1486 = fma(_1446, _1448, _1430);
    float _1488 = fma(_1446, _1430, _1448);
    float _1490 = -_1450;
    float _1492 = fma(_1446, _1432, _1490);
    float _1494 = -_1432;
    float _1496 = fma(_1446, _1450, _1494);
    float _1498 = -_1408;
    float _1500 = _1446 * _1498;
    float _1502 = _1464 * _1408;
    float _1504 = fma(_1486, _1410, _1478);
    float _1506 = _1486 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1508 = -_1406;
    float _1510 = _1446 * _1508;
    float _1512 = fma(_1466, _1410, _1500);
    float _1514 = fma(_1492, _1410, _1502);
    float _1516 = fma(_1496, _1392, _1504);
    float _1518 = fma(_1466, _1354, _1510);
    float _1520 = fma(_1470, _1392, _1512);
    bool _1522 = !_1190;
    int _1524 = _1522 ? _1476 : (-1);
    float _1526 = _1406 * _1484;
    float _1528 = _1470 + _1518;
    float _1530 = fma(_1488, _1392, _1514);
    float _1532 = _1486 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1534 = -_1526;
    float _1536 = _1470 * _1534;
    float _1538 = _1468 * _1406;
    float _1540 = _1464 * _1406;
    int _1542 = _1524 & 3;
    bool _1544 = _1542 != 0;
    float _1546 = -_1446;
    float _1548 = fma(_1546, _1484, _1536);
    float _1550 = fma(_1486, _1354, _1538);
    int _1552 = _1524 >> 31;
    float _1554 = fma(_1492, _1354, _1540);
    float _1556 = -_1526;
    float _1558 = _1488 * _1556;
    float _1560 = -_1526;
    float _1562 = _1496 * _1560;
    int _1564 = _1552 & 3;
    float _1566 = _1496 + _1550;
    float _1568 = fma(_1464, _1484, _1558);
    float _1570 = _1488 + _1554;
    int _1572 = _1524 + _1564;
    float _1574 = fma(_1468, _1484, _1562);
    float _1576 = _1486 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1578 = uint(_1542) > 1u;
    float _1580 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1582 = _1572 >> 2;
    float _1584 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1586 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1576);
    bool _1588 = uint(_1542) >= 2u;
    float _1590 = fma(_1520, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1580);
    int _1592 = _1582 << 4;
    int _1594 = _1592 + 656;
    float _1596 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1598 = fma(_1520, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1584);
    float _1600 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1532);
    uint _1602 = uint(int(uint(_1594) >> uint(2)));
    uint _1604 = uint(int(uint(int(_1602)) >> uint(2)));
    int _1606 = int(_1602) & 3;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[int(_1604)][_1606];
    int _1610 = int(_1602) + 1;
    uint _1612 = uint(int(uint(_1610) >> uint(2)));
    int _1614 = _1610 & 3;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[int(_1612)][_1614];
    float _1618 = fma(_1520, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1596);
    float _1620 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1598);
    float _1622 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1506);
    int _1624 = _1544 ? 0 : 1;
    float _1626 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1618);
    float _1628 = _1244 + _1620;
    bool _1630 = _1542 != 3;
    int _1632 = _1594 + 8;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    uint _1636 = uint(int(uint(int(_1634)) >> uint(2)));
    int _1638 = int(_1634) & 3;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[int(_1636)][_1638];
    int _1642 = int(_1634) + 1;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    int _1646 = _1642 & 3;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[int(_1644)][_1646];
    float _1650 = _1176 + _1626;
    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1654 = _1628 + _1652;
    int _1656 = _1588 ? 0 : 1;
    float _1658 = _1566 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1662 = _1650 + _1660;
    float _1664 = _1654 * _1654;
    int _1666 = ~_1624;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = fma(_1528, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1658);
    float _1674 = _1662 * _1662;
    int _1676 = _1524 & 3;
    bool _1678 = _1676 != 0;
    float _1680 = _1566 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1682 = _1670;
    float _1684 = _1674;
    float _1686 = _1568;
    if (!_1578)
    {
        int _1688 = ~_1624;
        int _1690 = _1688 + 1;
        _1682 = _1690;
    }
    int _1692 = _1682;
    float _1694 = _1674 + _1664;
    bool _1696 = !_1678;
    int _1698 = _1696 ? 0 : 1;
    float _1700 = _1566 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _1702 = abs(_1692);
    float _1704 = sqrt(_1694);
    int _1706 = abs(_1698);
    float _1708 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1590);
    int _1710 = ~_1656;
    int _1712 = _1710 + 1;
    int _1714 = _1712 + 1;
    int _1716 = _1714;
    if (_1630)
    {
        int _1718 = ~_1656;
        int _1720 = _1718 + 1;
        _1716 = _1720;
    }
    int _1722 = _1716;
    float _1724 = fma(_1528, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1680);
    float _1726 = fma(_1528, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1700);
    int _1728 = ~_1702;
    int _1730 = _1728 + 1;
    int _1732 = _1730 + 1;
    int _1734 = abs(_1722);
    int _1736 = ~_1706;
    int _1738 = _1736 + 1;
    int _1740 = _1738 + 1;
    bool _1742 = _1542 != 3;
    float _1744 = _1254 + _1708;
    bool _1746 = _1704 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1748 = _1732 * as_type<int>(_1616);
    bool _1750 = !_337;
    int _1752 = _1750 ? 0 : 1;
    int _1754 = ~_1734;
    int _1756 = _1754 + 1;
    int _1758 = _1756 + 1;
    int _1760 = _1740 * as_type<int>(_1608);
    int _1762 = _1760 + _1748;
    bool _1764 = !_1742;
    float _1766 = _1764 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _1768 = abs(_1752);
    int _1770 = _1758 * as_type<int>(_1640);
    int _1772 = _1770 + _1762;
    int _1774 = abs(as_type<int>(_1766));
    float _1776 = _1766;
    float _1778 = as_type<float>(_1768);
    float _1780 = as_type<float>(_1774);
    float _1782 = as_type<float>(_1762);
    if (!_1746)
    {
        _1776 = _1664;
    }
    float _1784 = _1776;
    float _1786 = _1784;
    if (!_1746)
    {
        _1778 = _1650;
    }
    float _1788 = _1778;
    float _1790 = _1788;
    if (!_1746)
    {
        _1780 = _1628;
    }
    float _1792 = _1780;
    int _1794 = ~_1774;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    float _1800 = _1792;
    if (!_1746)
    {
        _1782 = _1744;
    }
    float _1802 = _1782;
    bool _1804 = !_1746;
    float _1806 = _1802;
    if (!_1804)
    {
        float _1808 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1812 = _1704 + _1810;
        float _1814 = rsqrt(_1694);
        float _1816 = _1812 * _1808;
        float _1818 = _1744 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1820 = _1816 * 0.15915493667125701904296875;
        float _1822 = _1820 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        float _1826 = _1820 * 6.283185482025146484375;
        float _1828 = cos(_1826);
        float _1830 = fma(_1824, _1818, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1832 = _1814 * _1830;
        float _1834 = _1828 + (-1.0);
        float _1836 = fma(_1662, _1832, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1838 = fma(_1654, _1832, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1840 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1844 = _1836 + _1842;
        float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1848 = _1838 + _1846;
        float _1850 = fma(_1744, _1828, _1840);
        float _1852 = _1844 * _1844;
        float _1854 = _1848 * _1848;
        _1806 = _1850;
        _1684 = _1852;
        _1786 = _1854;
        _1800 = _1838;
        _1790 = _1836;
    }
    float _1856 = _1806;
    float _1858 = _1684;
    float _1860 = _1786;
    float _1862 = _1800;
    float _1864 = _1790;
    float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1868 = _1856 + _1866;
    int _1870 = _1798 * as_type<int>(_1648);
    int _1872 = _1870 + _1772;
    int _1874 = ~_1768;
    int _1876 = _1874 + 1;
    int _1878 = _1876 + 1;
    float _1880 = _1574 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1882 = fma(_1868, _1868, _1858);
    bool _1884 = !_1190;
    int _1886 = _1884 ? _1482 : (-1);
    float _1888 = _1574 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1890 = _1878 * _1872;
    float _1892 = _1882 + _1860;
    float _1894 = _1574 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1896 = -_579;
    float _1898 = _1896 + 1.0;
    int _1900 = _1886 * _1768;
    int _1902 = _1900 + _1890;
    float _1904 = fma(_1548, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1880);
    float _1906 = fma(_1548, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1888);
    float _1908 = sqrt(_1892);
    float _1910 = fma(_1548, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1894);
    float _1912 = -_583;
    float _1914 = _1912 + 1.0;
    float _1916 = -_1898;
    float _1918 = fma(_1018, _1916, _1348);
    float _1920 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1586);
    float _1922 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1600);
    float _1924 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1622);
    float _1926 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1672);
    float _1928 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1724);
    float _1930 = fma(_1024, _1914, _1382);
    float _1932 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1904);
    float _1934 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1906);
    float _1936 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1910);
    float _1938 = float(_1902);
    float _1940 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1726);
    out.m_66.x = _1918;
    out.m_66.y = _1930;
    bool _1942 = _1908 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1944 = isnan(_1908);
    bool _1946 = _1942 || _1944;
    bool _1948 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1950 = _1946 || _1948;
    out.m_68.x = _1920;
    out.m_68.y = _1922;
    out.m_68.z = _1924;
    out.m_70.x = _1932;
    out.m_70.y = _1934;
    out.m_70.z = _1936;
    out.m_72.z = _1938;
    float _1952 = _1864;
    float _1954 = _1934;
    if (!_1950)
    {
        _1686 = 1.0;
    }
    float _1956 = _1686;
    out.m_74.x = _1926;
    out.m_74.y = _1928;
    out.m_74.z = _1940;
    bool _1958 = !_1950;
    float _1960 = _1956;
    if (!_1958)
    {
        bool _1962 = _1908 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1964 = isnan(_1908);
        bool _1966 = _1962 || _1964;
        bool _1968 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1970 = _1966 || _1968;
        if (!_1970)
        {
            float _1972 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1974 = _1908 + _1972;
            float _1976 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1978 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1976;
            float _1980 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1982 = _1980 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1984 = 1.0 / _1978;
            float _1986 = _1974 * _1984;
            float _1988 = fma(_1986, _1982, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1960 = _1988;
            _1990 = true;
        }
        else
        {
            bool _1992 = _1908 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1994 = isnan(_1908);
            bool _1996 = _1992 || _1994;
            bool _1998 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2000 = _1996 || _1998;
            if (!_2000)
            {
                float _2002 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2004 = _1908 + _2002;
                float _2006 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2008 = _2006 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2010 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2012 = _2010 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2014 = 1.0 / _2008;
                float _2016 = _2004 * _2014;
                float _2018 = fma(_2016, _2012, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1960 = _2018;
                _1990 = true;
            }
            else
            {
                _1960 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1990 = false;
    float _2020 = _1960;
    float _2022 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2026 = _1856 + _2024;
    float _2028 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2022);
    float _2030 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2032 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2036 = _2032 || _2034;
    bool _2038 = isnan(0.5);
    bool _2040 = _2036 || _2038;
    float _2042 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2044 = _1862 + _2042;
    float _2046 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2028);
    bool _2048 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan(0.5);
    bool _2056 = _2052 || _2054;
    float _2058 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2030);
    float _2060 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2062 = _1864 + _2060;
    float _2064 = _2046 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2066 = fma(_2026, _2020, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2068 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2058);
    float _2070 = fma(_2062, _2020, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2072 = 1.0 / _2064;
    float _2074 = fma(_2044, _2020, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2076 = _2068 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2078 = _2076 + _2064;
    float _2080 = _2062;
    float _2082 = _2046;
    float _2084 = _2076;
    float _2086 = _2070;
    if (_2056)
    {
        _2080 = _2070;
    }
    float _2088 = _2080;
    float _2090 = _2088;
    if (_2056)
    {
        _2082 = _2066;
    }
    float _2092 = _2082;
    float _2094 = _2092;
    if (_2056)
    {
        _2084 = _2074;
    }
    float _2096 = _2084;
    float _2098 = _2096;
    if (!_2056)
    {
        float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2102 = _1254 + _2100;
        float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2106 = _1176 + _2104;
        float _2108 = -_1176;
        float _2110 = _2108 + _2070;
        float _2112 = -_1254;
        float _2114 = _2112 + _2066;
        float _2116 = _2102 * _2102;
        float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2120 = _1244 + _2118;
        float _2122 = -_1244;
        float _2124 = _2122 + _2074;
        float _2126 = fma(_2106, _2106, _2116);
        float _2128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2130 = fma(_2120, _2120, _2126);
        float _2132 = sqrt(_2130);
        float _2134 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _2136 = _2132 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2138 = isnan(_2132);
        bool _2140 = _2136 || _2138;
        bool _2142 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2144 = _2140 || _2142;
        float _2146 = precise::min(_2132, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2148 = _2146 * _2128;
        float _2150 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2152 = _2150 * _2148;
        float _2154 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
        float _2156 = _2128;
        float _2158 = _2132;
        float _2160 = _2152;
        float _2162 = _2150;
        _2086 = _2110;
        if (_2144)
        {
            float _2164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2154 = _2164;
        }
        float _2166 = _2154;
        if (_2144)
        {
            float _2168 = precise::max(_2132, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2156 = _2168;
        }
        float _2170 = _2156;
        float _2172 = fma(_2110, _2152, _1176);
        float _2174 = _2172;
        if (_2144)
        {
            float _2176 = _2170 * _2166;
            _2158 = _2176;
        }
        float _2178 = _2158;
        float _2180 = fma(_2114, _2152, _1254);
        float _2182 = fma(_2124, _2152, _1244);
        float _2184 = _2178;
        _1952 = _2180;
        if (_2144)
        {
            float _2186 = _2150 * _2178;
            _2160 = _2186;
        }
        float _2188 = _2160;
        if (!_2144)
        {
            _2184 = _2172;
        }
        float _2190 = _2184;
        float _2192 = _2190;
        if (!_2144)
        {
            _2162 = _2180;
        }
        float _2194 = _2162;
        float _2196 = _2194;
        if (_2144)
        {
            float _2198 = fma(_2110, _2188, _1176);
            _2192 = _2198;
        }
        float _2200 = _2192;
        _2090 = _2200;
        if (!_2144)
        {
            _2174 = _2182;
        }
        float _2202 = _2174;
        _2098 = _2202;
        if (_2144)
        {
            float _2204 = fma(_2114, _2188, _1254);
            _2196 = _2204;
        }
        float _2206 = _2196;
        _2094 = _2206;
        if (_2144)
        {
            float _2208 = fma(_2124, _2188, _1244);
            _2098 = _2208;
        }
    }
    float _2210 = _2094;
    float _2212 = _2090;
    float _2214 = _2098;
    float _2216 = _2086;
    float _2218 = _1952;
    float _2220 = _2218;
    float _2222 = _2216;
    if (_2040)
    {
        _2220 = 1.0;
    }
    float _2224 = _2220;
    float _2226 = _2078 * _2072;
    float _2228 = _2226 * 0.5;
    float _2230 = _2224;
    if (!_2040)
    {
        float _2232 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2234 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2236 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2234);
        float _2238 = _2232 * 0.15915493667125701904296875;
        float _2240 = _2238 * 6.283185482025146484375;
        float _2242 = cos(_2240);
        float _2244 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2246 = _2244 * 0.15915493667125701904296875;
        float _2248 = _2238 * 6.283185482025146484375;
        float _2250 = sin(_2248);
        float _2252 = 1.0 / _2242;
        float _2254 = _2246 * 6.283185482025146484375;
        float _2256 = cos(_2254);
        float _2258 = _2250 * _2252;
        float _2260 = 1.0 / _2236;
        float _2262 = _2256 * _2258;
        float _2264 = _2246 * 6.283185482025146484375;
        float _2266 = sin(_2264);
        float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2270 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2268;
        float _2272 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2274 = _2260 * _2272;
        float _2276 = 1.0 / _2262;
        float _2278 = 1.0 / _2270;
        float _2280 = _2266 * _2276;
        float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2284 = fma(_2280, _2274, _2282);
        float _2286 = _2284 * _2278;
        float _2288 = precise::clamp(_2286, 0.0, 1.0);
        float _2290 = -_2288;
        float _2292 = _2290 + 1.0;
        _2222 = _2278;
        _1954 = _2246;
        _2230 = _2292;
    }
    float _2294 = _2222;
    float _2296 = _1954;
    float _2298 = _2230;
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2302 = _2210 + _2300;
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2306 = _2212 + _2304;
    float _2308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2310 = _2214 + _2308;
    float _2312 = _2302 * _2302;
    float _2314 = fma(_2306, _2306, _2312);
    float _2316 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2318 = fma(_2310, _2310, _2314);
    float _2320 = rsqrt(_2318);
    float _2322 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2324 = _2306 * _2322;
    float _2326 = _2310 * _2322;
    float _2328 = _2324 * _2324;
    float _2330 = _2326 * _2326;
    float _2332 = _2328 + _2330;
    float _2334 = sqrt(_2332);
    bool _2336 = _2334 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2340 = _2334 + _2338;
    float _2342 = _2294;
    float _2344 = _2296;
    float _2346 = _2340;
    float _2348 = _2302;
    float _2350 = _2324;
    if (_2336)
    {
        float _2352 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2342 = _2352;
    }
    float _2354 = _2342;
    if (_2336)
    {
        float _2356 = rsqrt(_2332);
        _2344 = _2356;
    }
    float _2358 = _2344;
    float _2360 = _2354;
    float _2362 = _2358;
    if (_2336)
    {
        float _2364 = _2340 * _2354;
        _2346 = _2364;
    }
    float _2366 = _2346;
    if (_2336)
    {
        float _2368 = _2366 * 0.15915493667125701904296875;
        _2360 = _2368;
    }
    float _2370 = _2360;
    float _2372 = _2320;
    float _2374 = _2370;
    if (_2336)
    {
        float _2376 = _2370 * 6.283185482025146484375;
        float _2378 = sin(_2376);
        _2372 = _2378;
    }
    float _2380 = _2372;
    float _2382 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2384 = precise::max(0.0, _2382);
    float _2386 = _2310;
    float _2388 = _2384;
    if (_2336)
    {
        float _2390 = _2370 * 6.283185482025146484375;
        float _2392 = cos(_2390);
        _2386 = _2392;
    }
    float _2394 = _2386;
    float _2396 = -_2322;
    float _2398 = -_2384;
    float _2400 = fma(_2302, _2396, _2398);
    float _2402 = _2400;
    if (_2336)
    {
        float _2404 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2348 = _2404;
    }
    float _2406 = _2348;
    float _2408 = _2406;
    float _2410 = _2380;
    if (_2336)
    {
        float _2412 = fma(_2380, _2406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2408 = _2412;
    }
    float _2414 = _2408;
    float _2416 = _2414;
    float _2418 = _2394;
    if (_2336)
    {
        float _2420 = _2394 + (-1.0);
        _2388 = _2420;
    }
    float _2422 = _2388;
    if (_2336)
    {
        float _2424 = _2358 * _2414;
        _2410 = _2424;
    }
    float _2426 = _2410;
    if (!_2336)
    {
        _2362 = _2326;
    }
    float _2428 = _2362;
    float _2430 = _2428;
    if (_2336)
    {
        float _2432 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2374 = _2432;
    }
    float _2434 = _2374;
    if (_2336)
    {
        float _2436 = _2324 * _2426;
        _2350 = _2436;
    }
    float _2438 = _2350;
    float _2440 = sqrt(_2318);
    if (!_2336)
    {
        _2416 = _2328;
    }
    float _2442 = _2416;
    float _2444 = _2442;
    if (_2336)
    {
        float _2446 = fma(_2400, _2394, _2434);
        _2402 = _2446;
    }
    float _2448 = _2402;
    if (_2336)
    {
        float _2450 = _2326 * _2426;
        _2430 = _2450;
    }
    float _2452 = _2430;
    if (_2336)
    {
        float _2454 = _2438 * _2438;
        _2444 = _2454;
    }
    float _2456 = _2444;
    if (!_2336)
    {
        _2418 = _2330;
    }
    float _2458 = _2418;
    float _2460 = _2210 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2462 = _2458;
    if (_2336)
    {
        float _2464 = _2452 * _2452;
        _2462 = _2464;
    }
    float _2466 = _2462;
    float _2468 = fma(_2448, _2448, _2456);
    float _2470 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2460);
    float _2472 = _2210 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2474 = _2468 + _2466;
    float _2476 = _2210 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2478 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2470);
    float _2480 = _2210 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2484 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2482);
    float _2486 = precise::clamp(_2484, 0.0, 1.0);
    float _2488 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2476);
    float _2490 = rsqrt(_2474);
    float _2492 = _2478 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2494 = -_2486;
    float _2496 = _2494 + 1.0;
    float _2498 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2480);
    float _2500 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2488);
    float _2502 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2472);
    float _2504 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2498);
    float _2506 = abs(_2496);
    float _2508 = log2(_2506);
    float _2510 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2512 = _2500 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2514 = _2504 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2516 = -_2510;
    float _2518 = fma(_2516, _2316, 1.0);
    float _2520 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2502);
    float _2522 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2524 = _2490 * _2438;
    float _2526 = _2490 * _2448;
    float _2528 = _2490 * _2452;
    float _2530 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2522);
    float _2532 = _2524 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2534 = _2520 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2536 = log2(_2518);
    float _2538 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2530);
    float _2540 = -_2532;
    float _2542 = fma(_2526, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2540);
    float _2544 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2546 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2548 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2538);
    float _2550 = -_2528;
    float _2552 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2542);
    float _2554 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2556 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2546);
    float _2558 = exp2(_2544);
    float _2560 = fma(_2552, -0.5, 0.5);
    float _2562 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2554);
    float _2564 = fma(_2552, 0.5, 0.5);
    float _2566 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2556);
    float _2568 = _2526 + 1.0;
    float _2570 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2562);
    float _2572 = fma(_2564, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2574 = 1.0 / _2548;
    float _2576 = _2536 * 0.693147182464599609375;
    float _2578 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2570);
    float _2580 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2566);
    float _2582 = fma(_2564, _2572, -0.212114393711090087890625);
    float _2584 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2586 = sqrt(_2560);
    float _2588 = -_2526;
    float _2590 = fma(_2558, _2568, _2588);
    float _2592 = fma(_2564, _2582, 1.570728778839111328125);
    float _2594 = fma(_2590, 0.5, 0.5);
    float _2596 = _2578 * _2574;
    float _2598 = _2580 * _2574;
    float _2600 = fma(_2596, 0.5, 0.5);
    float _2602 = fma(_2598, -0.5, 0.5);
    float _2604 = _2586 * 0.636619746685028076171875;
    float3 _6985 = float3(_2600, _2602, _2584);
    float _2606 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6985, float3(0.0), isnan(_6985)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6985, float3(0.0), isnan(_6985)), level(0.0)).x;
    float _2608 = -_2592;
    float _2610 = fma(_2604, _2608, 1.0);
    float3 _7001 = float3(_2600, _2602, _2584);
    float4 _2613 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7001, float3(0.0), isnan(_7001)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7001, float3(0.0), isnan(_7001)), level(0.0)).xyzw;
    float _2615 = _2613.x;
    float _2617 = _2613.y;
    float _2619 = _2613.z;
    float _2621 = _2613.w;
    float2 _7018 = float2(_2610, _2594);
    float3 _2625 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7018, float2(0.0), isnan(_7018)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7018, float2(0.0), isnan(_7018)), level(0.0)).xyz;
    float _2627 = _2625.x;
    float _2629 = _2625.y;
    float _2631 = _2625.z;
    float _2633 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2635 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_76.x = _2212;
    out.m_76.y = _2210;
    out.m_76.z = _2214;
    bool _2637 = _2440 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2639 = isnan(_2440);
    bool _2641 = _2637 || _2639;
    bool _2643 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2645 = _2641 || _2643;
    float _2647 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2635);
    float _2649 = exp2(_2633);
    float _2651 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2647);
    float _2653 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2651);
    float _2655 = _2653 + _2548;
    out.gl_Position.x = _2578;
    out.gl_Position.y = _2580;
    out.gl_Position.z = _2653;
    out.gl_Position.w = _2548;
    float _2657 = _2655 * 0.5;
    float _2659 = -_2649;
    float _2661 = _2659 + 1.0;
    float _2663 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.z = _2657;
    out.m_78.w = _2548;
    float _2665 = _2298 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2667 = _2653;
    float _2669 = _2578;
    float _2671 = _2580;
    float _2673 = _2548;
    float _2675 = _2657;
    float _2677 = _2663;
    if (!_2645)
    {
        _2667 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2679 = _2667;
    float _2681 = _2679;
    float _2683 = _2679;
    if (!_2645)
    {
        _2669 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2685 = _2669;
    float _2687 = _2685;
    float _2689 = _2685;
    if (!_2645)
    {
        _2671 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2691 = _2671;
    float _2693 = _2691;
    float _2695 = _2691;
    if (!_2645)
    {
        _2673 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2697 = _2673;
    float _2699 = _2697;
    float _2701 = _2697;
    if (!_2645)
    {
        _2675 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2703 = _2675;
    float _2705 = _2663 * _2606;
    float _2707 = -_2663;
    float _2709 = _2707 + 1.0;
    float _2711 = _2703;
    float _2713 = _2703;
    if (!_2645)
    {
        _2677 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2715 = _2677;
    float _2717 = _2621 * _2705;
    float _2719 = _2621 * _2709;
    float _2721 = _2631 * _2705;
    float _2723 = fma(_2627, _2717, _2615);
    float _2725 = fma(_2629, _2717, _2617);
    float _2727 = fma(_2621, _2721, _2619);
    out.m_80.x = _2723;
    out.m_80.y = _2725;
    out.m_80.z = _2727;
    out.m_80.w = _2719;
    bool _2729 = !_2645;
    float _2731 = _2715;
    float _2733 = _2715;
    if (!_2729)
    {
        bool _2735 = _2440 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2737 = isnan(_2440);
        bool _2739 = _2735 || _2737;
        bool _2741 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2743 = _2739 || _2741;
        if (!_2743)
        {
            float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2747 = _2440 + _2745;
            float _2749 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2751 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2749;
            float _2753 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2755 = _2753 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2757 = 1.0 / _2751;
            float _2759 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2763 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2765 = _2763 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2773 = _2771 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2775 = _2747 * _2757;
            float _2777 = precise::clamp(_2775, 0.0, 1.0);
            float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2783 = fma(_2777, _2755, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2785 = fma(_2777, _2781, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2787 = fma(_2777, _2761, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2789 = fma(_2777, _2765, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2791 = fma(_2777, _2769, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2793 = fma(_2777, _2773, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2689 = _2787;
            _2701 = _2791;
            _2683 = _2783;
            _2733 = _2789;
            _2695 = _2785;
            _2713 = _2793;
            _2795 = true;
        }
        else
        {
            bool _2797 = _2440 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2799 = isnan(_2440);
            bool _2801 = _2797 || _2799;
            bool _2803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2805 = _2801 || _2803;
            if (!_2805)
            {
                _2681 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2807 = _2681;
            _2683 = _2807;
            if (!_2805)
            {
                _2687 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2809 = _2687;
            _2689 = _2809;
            if (!_2805)
            {
                _2693 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2811 = _2693;
            _2695 = _2811;
            if (!_2805)
            {
                _2731 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2813 = _2731;
            _2733 = _2813;
            if (!_2805)
            {
                _2699 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2815 = _2699;
            _2701 = _2815;
            if (!_2805)
            {
                _2711 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2817 = _2711;
            bool _2819 = !_2805;
            _2713 = _2817;
            if (!_2819)
            {
                bool _2821 = _2440 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2823 = isnan(_2440);
                bool _2825 = _2821 || _2823;
                bool _2827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2829 = _2825 || _2827;
                if (!_2829)
                {
                    float _2831 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2833 = _2440 + _2831;
                    float _2835 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2837 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2835;
                    float _2839 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2841 = _2839 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2843 = 1.0 / _2837;
                    float _2845 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2851 = _2849 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2853 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2855 = _2853 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2859 = _2857 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2861 = _2833 * _2843;
                    float _2863 = precise::clamp(_2861, 0.0, 1.0);
                    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2867 = _2865 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2869 = fma(_2863, _2841, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2871 = fma(_2863, _2867, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2873 = fma(_2863, _2847, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2875 = fma(_2863, _2851, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2877 = fma(_2863, _2855, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2879 = fma(_2863, _2859, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2689 = _2873;
                    _2701 = _2877;
                    _2683 = _2869;
                    _2733 = _2875;
                    _2695 = _2871;
                    _2713 = _2879;
                    _2795 = true;
                }
                else
                {
                    _2689 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2701 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2683 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2733 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2695 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2713 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2795 = false;
    float _2881 = _2689;
    float _2883 = _2701;
    float _2885 = _2683;
    float _2887 = _2733;
    float _2889 = _2695;
    float _2891 = _2713;
    float _2893 = fma(_1928, -0.5, 0.5);
    float _2895 = precise::clamp(_2893, 0.0, 1.0);
    float _2897 = -_2881;
    float _2899 = _2897 + _2883;
    float _2901 = _2665 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2903 = -_2885;
    float _2905 = _2903 + _2887;
    out.m_82.x = 0.0;
    float _2907 = fma(_2895, _2899, _2881);
    float _2909 = -_2889;
    float _2911 = _2909 + _2891;
    out.m_49.x = _2901;
    float _2913 = fma(_2895, _2905, _2885);
    float _2915 = _2907 * 0.586610972881317138671875;
    bool _2917 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2919 = fma(_2895, _2911, _2889);
    float _2921 = fma(_2913, 0.298911988735198974609375, _2915);
    bool _2923 = _2298 > 0.0;
    bool _2925 = isnan(_2298);
    bool _2927 = _2923 || _2925;
    bool _2929 = isnan(0.0);
    bool _2931 = _2927 || _2929;
    float _2933 = fma(_2919, 0.114477999508380889892578125, _2921);
    float _2935 = -_2933;
    float _2937 = _2913 + _2935;
    float _2939 = -_2933;
    float _2941 = _2907 + _2939;
    float _2943 = -_2933;
    float _2945 = _2919 + _2943;
    float _2947 = fma(_2937, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2933);
    float _2949 = fma(_2941, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2933);
    float _2951 = fma(_2945, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2933);
    bool _2953 = !_2917;
    if (!_2953)
    {
        float _2955 = -_2210;
        float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2959 = -_2212;
        float _2961 = _2959 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2963 = -_2214;
        float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2967 = _2957 * _2957;
        float _2969 = fma(_2961, _2961, _2967);
        float _2971 = fma(_2965, _2965, _2969);
        float _2973 = sqrt(_2971);
        float _2975 = rsqrt(_2971);
        float _2977 = -_2973;
        float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2981 = _2979 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2983 = precise::clamp(_2981, 0.0, 1.0);
        float _2985 = _2961 * _2975;
        float _2987 = _2957 * _2975;
        float _2989 = abs(_2983);
        float _2991 = log2(_2989);
        float _2993 = _2965 * _2975;
        float _2995 = _2985 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2997 = _1928 * _2987;
        float _2999 = -_2987;
        float _3001 = -_2995;
        float _3003 = fma(_2999, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3001);
        float _3005 = fma(_1926, _2985, _2997);
        float _3007 = -_2993;
        float _3009 = fma(_3007, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3003);
        float _3011 = fma(_1940, _2993, _3005);
        float _3013 = precise::clamp(_3011, 0.0, 1.0);
        float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3017 = _3009 + _3015;
        float _3019 = _2991 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3021 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3023 = precise::clamp(_3021, 0.0, 1.0);
        float _3025 = exp2(_3019);
        float _3027 = _3025 * _3023;
        float _3029 = _3013 * _3027;
        float _3031 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3033 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3035 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _3031;
        out.m_82.y = _3033;
        out.m_82.z = _3035;
    }
    out.m_84.x = _2947;
    out.m_84.y = _2949;
    out.m_84.z = _2951;
    if (_2931)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_49.x = 0.0;
    float _3037 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3037;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_58 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2795 = false;
    bool _1990 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3094 = as_type<float>(_119);
        out.gl_Position.z = _3094;
    }
    if (!_107)
    {
        return out;
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = 0.0;
    float _141 = _137;
    if (_133)
    {
        float _143 = float(_103);
        _113 = _143;
    }
    float _145 = _113;
    bool _147 = _137 >= _145;
    bool _149 = !_133;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _121 = as_type<int>(_157);
    }
    int _159 = _121;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3164 = as_type<float>(_159);
        out.gl_Position.z = _3164;
    }
    if (_151)
    {
        return out;
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _165 = as_type<int>(_161) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_161) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_163;
    float _201;
    float _203;
    if (!_181)
    {
        float _183 = in.m_56.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = float(_103);
        float _189 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _193 = _191 * _185;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = _187;
        _205 = true;
    }
    else
    {
        float _207 = float(_103);
        float _209 = 1.0 / _207;
        float _211 = _137 * _209;
        _201 = _211;
        _203 = _207;
    }
    _205 = false;
    float _213 = _201;
    float _215 = _203;
    float _217 = in.m_56.x;
    float _219 = in.m_56.y;
    float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _223 = log2(_221);
    float _225 = in.m_56.z;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _229 = _213 + _227;
    int _231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _233 = _231 != 0;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    int _239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _241 = _239 != 0;
    float _243 = in.m_56.w;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _247 = _245 != 0;
    float _249 = 1.0 / _237;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _213 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _267;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _273 = 1.0 / _265;
    bool _275 = _217 > 0.5;
    float _277 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _279 = _219 > 0.5;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _283 = _213 + _281;
    float _285 = -_175;
    int _287 = _275 ? as_type<int>(_285) : as_type<int>(_175);
    float _289 = _217 * 2.0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _293 = _291 != 0;
    float _295 = 1.0 / _269;
    float _297 = -_179;
    int _299 = _279 ? as_type<int>(_297) : as_type<int>(_179);
    float _301 = fma(_277, -2.0, _271);
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _305 = _303 != 0;
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _309 = _307 != 0;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = _213 + _311;
    bool _315 = !_241;
    float _317 = _315 ? _175 : as_type<float>(_287);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = _213 + _319;
    bool _323 = !_247;
    float _325 = _323 ? _179 : as_type<float>(_299);
    float _327 = 1.0 / _261;
    float _329 = -_175;
    int _331 = _279 ? as_type<int>(_329) : as_type<int>(_175);
    float _333 = _229 * _273;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _337 = _335 != 0;
    float _339 = _223 * _137;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _343 = _341 != 0;
    float _345 = _321 * _249;
    int _347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _349 = _347 != 0;
    float _351 = 1.0 / _253;
    float _353 = in.m_46.x;
    float _355 = in.m_46.y;
    float _357 = in.m_46.z;
    float _359 = _217 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_233)
    {
        _139 = _219;
    }
    float _361 = _139;
    float _363 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _301);
    float _365 = 0.0;
    float _367 = _361;
    if (_233)
    {
        _365 = _217;
    }
    float _369 = _365;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _373 = !_233;
    float _375 = _373 ? 5.839270114898681640625 : 1.0;
    float _377 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _379 = int(_377);
    float _381 = _369;
    if (!_233)
    {
        _367 = _217;
    }
    float _383 = _367;
    float _385 = -_371;
    float _387 = fma(_359, 2.0, _385);
    if (!_233)
    {
        _381 = _225;
    }
    float _389 = _381;
    float _391 = _313 * _327;
    bool _393 = !_233;
    float _395 = _393 ? _225 : _217;
    float _397 = _383 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _399 = _225 > 0.5;
    float _401 = 1.0 / _215;
    float _403 = _257 * _351;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _407 = _213 + _405;
    float _409 = -_179;
    int _411 = _399 ? as_type<int>(_409) : as_type<int>(_179);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _413;
    float _417 = -_175;
    int _419 = _399 ? as_type<int>(_417) : as_type<int>(_175);
    float _421 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _423 = _243 > 0.5;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _429 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _431 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _437 = _213 + _435;
    float _439 = 1.0 / _415;
    float _441 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].x, _421);
    float _443 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].x, _429);
    float _445 = _437 * _295;
    float _447 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].x, _431);
    out.m_58.w = _433;
    float _449 = _375 * _395;
    float _451 = 1.0 / _427;
    float _453 = float(_379);
    float _455 = _219 * 2.0;
    float _457 = -_137;
    float _459 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[76].x, _387);
    float _461 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].z, _441);
    bool _463 = !_343;
    float _465 = _463 ? _175 : as_type<float>(_419);
    float _467 = exp2(_339);
    float _469 = _283 * _439;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _475 = _453 * _137;
    float _477 = _217 + _225;
    float _479 = fma(_397, -2.0, _473);
    float _481 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _483 = int(_481);
    float _485 = _407 * _451;
    float _487 = -_179;
    int _489 = _423 ? as_type<int>(_487) : as_type<int>(_179);
    float _491 = _389 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _493 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _501 = _497 || _499;
    float _503 = _475 * _401;
    float _505 = -_471;
    float _507 = fma(_491, 2.0, _505);
    float _509 = -_467;
    float _511 = _509 + 1.0;
    float _513 = floor(_289);
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _517 = -_137;
    float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[86].x, _507);
    float _521 = _501 ? _511 : 0.0;
    float _523 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[88].w, _515);
    float _525 = float(_483);
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _529 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _531 = isnan(1.0);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _537 = _533 || _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _541 = 1.0 + _539;
    float _543 = 1.0 / _525;
    float _545 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _479);
    float _547 = _477 + (-1.0);
    bool _549 = !_349;
    float _551 = _549 ? _179 : as_type<float>(_489);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _555 = _513 >= 0.0;
    bool _557 = isnan(_513);
    bool _559 = _555 || _557;
    bool _561 = isnan(0.0);
    bool _563 = _559 || _561;
    float _565 = 1.0 / _541;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _569 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].w, _553);
    float _571 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[88].z, _527);
    float _573 = _219 + _217;
    float _575 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[78].z, _567);
    float _577 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _569);
    float _579 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _571);
    float _581 = floor(_455);
    float _583 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _523);
    float _585 = _225 * 2.0;
    float _587 = _543 * _137;
    float _589 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _575);
    float _591 = _573 + (-1.0);
    int _593 = _563 ? 0 : 1;
    if (_537)
    {
        float _595 = _521 * _565;
        _141 = _595;
    }
    float _597 = _141;
    float _599 = floor(_585);
    float _601 = _219 + _225;
    bool _603 = _513 > 0.0;
    float _605 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _607 = _601 + (-1.0);
    float _609 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _611 = _581 >= 0.0;
    bool _613 = isnan(_581);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    float _621 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].z, _443);
    float _623 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _625 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
    float _627 = trunc(_587);
    int _629 = int(_627);
    int _631 = ~_593;
    int _633 = _631 + 1;
    int _635 = _633 + 1;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _637;
    bool _641 = _581 > 0.0;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _643;
    int _647 = _635;
    if (!_603)
    {
        int _649 = ~_593;
        int _651 = _649 + 1;
        _647 = _651;
    }
    int _653 = _647;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _659 = _619 ? 0 : 1;
    float _661 = fma(_639, _345, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _663 = _599 > 0.0;
    float _665 = fma(_645, _345, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _667 = _599 >= 0.0;
    bool _669 = isnan(_599);
    bool _671 = _667 || _669;
    bool _673 = isnan(0.0);
    bool _675 = _671 || _673;
    float _677 = fma(_657, _403, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _699 = fma(_681, _391, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _701 = fma(_693, _391, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _703 = fma(_685, _333, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _705 = fma(_697, _333, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _707 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _709 = isnan(_213);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _719;
    bool _723 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _725 = isnan(_213);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _735;
    float _739 = float(uint(_379));
    float _741 = -_717;
    float _743 = _741 + 1.0;
    float _745 = fma(_721, _445, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _747 = fma(_737, _445, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    bool _749 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _751 = isnan(_213);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _733 * _743;
    float _763 = 1.0 / _739;
    float _765 = -_733;
    float _767 = _765 + 1.0;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    bool _773 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _775 = isnan(_213);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _789 = -_759;
    float _791 = _789 + 1.0;
    float _793 = _759 * _767;
    float _795 = fma(_771, _485, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _797 = fma(_787, _485, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _799 = _783 * _791;
    float _801 = -_783;
    float _803 = _801 + 1.0;
    float _805 = fma(_689, _403, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _809 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _811 = isnan(_213);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -_551;
    float _823 = _821 + 0.5;
    bool _825 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _827 = isnan(_213);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -_577;
    float _839 = _837 + 1.0;
    bool _841 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _843 = isnan(_213);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -_819;
    float _855 = _853 + 1.0;
    bool _857 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _859 = isnan(_213);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _871 = as_type<int>(_763) + (-2);
    float _873 = _819 * _803;
    float _875 = float(uint(_629));
    float _877 = _835 * _855;
    float _879 = -_835;
    float _881 = _879 + 1.0;
    float _883 = floor(_449);
    float _885 = as_type<float>(_871) * _875;
    float _887 = _867 * _881;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _889;
    float _893 = _807 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _895;
    float _899 = _317 + 0.5;
    float _901 = -_867;
    float _903 = _901 + 1.0;
    float _905 = _869 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _907 = trunc(_885);
    float _909 = precise::max(_907, 0.0);
    uint _912 = uint(_909);
    float _914 = _325 + (-0.5);
    float _916 = fma(_897, _469, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _918 = fma(_905, _899, _459);
    float _920 = _851 * _903;
    float _922 = -_893;
    float _924 = -_363;
    float _926 = fma(_922, _914, _924);
    float _928 = -_851;
    float _930 = _928 + 1.0;
    int _932 = ~_379;
    int _934 = _932 + 1;
    float _936 = _661 * _920;
    float _938 = _665 * _920;
    float _940 = -_883;
    float _942 = _449 + _940;
    float _944 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _946 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].x, _936);
    float _948 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].y, _938);
    float _950 = float(_629);
    int _952 = _934 * int(_912);
    int _954 = _952 + _629;
    float _956 = _823 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _958 = ~_659;
    int _960 = _958 + 1;
    int _962 = _960 + 1;
    float _964 = _453 * _942;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _968 = float(uint(_954));
    float _970 = fma(_677, _887, _946);
    int _972 = _962;
    if (!_641)
    {
        int _974 = ~_659;
        int _976 = _974 + 1;
        _972 = _976;
    }
    int _978 = _972;
    float _980 = _465 + 0.5;
    bool _982 = _950 >= _453;
    bool _984 = isnan(_950);
    bool _986 = _982 || _984;
    bool _988 = isnan(_453);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = as_type<float>(_871) * _968;
    float _996 = -_589;
    float _998 = _996 + 1.0;
    float _1000 = _956 * _944;
    float _1002 = fma(_325, _839, _926);
    float _1004 = trunc(_994);
    float _1006 = precise::max(_1004, 0.0);
    uint _1008 = uint(_1006);
    float _1010 = -_998;
    float _1012 = fma(_317, _1010, _918);
    float _1014 = _980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1016 = !_305;
    float _1018 = _1016 ? _175 : as_type<float>(_331);
    float _1020 = fma(_805, _887, _948);
    bool _1022 = !_309;
    float _1024 = _1022 ? _179 : as_type<float>(_411);
    float _1026 = _1014 * _966;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1030 = _1028 != 0;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1034 = _1032 != 0;
    float _1036 = fma(_699, _877, _970);
    bool _1038 = !_293;
    int _1040 = _1038 ? 0 : 1;
    float _1042 = trunc(_992);
    int _1044 = int(_1042);
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1048 = _1046 != 0;
    out.m_60.x = _1012;
    out.m_60.y = _1002;
    out.m_60.z = _1026;
    int _1050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1052 = _1050 != 0;
    float _1054 = _219 + (-0.5);
    int _1056 = _675 ? 0 : 1;
    float _1058 = fma(_701, _877, _1020);
    bool _1060 = !_1034;
    int _1062 = _1060 ? 0 : 1;
    float _1064 = trunc(_503);
    int _1066 = int(_1064);
    bool _1068 = !_1030;
    int _1070 = _1068 ? 0 : 1;
    float _1072 = _217 + (-0.5);
    int _1074 = ~_379;
    int _1076 = _1074 + 1;
    float _1078 = _225 + (-0.5);
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1090 = _1088 != 0;
    float _1092 = fma(_705, _873, _1058);
    int _1094 = ~_1056;
    int _1096 = _1094 + 1;
    int _1098 = _1096 + 1;
    float _1100 = fma(_703, _873, _1036);
    int _1102 = int(_912) + int(_1008);
    float _1104 = fma(_747, _799, _1092);
    float _1106 = trunc(_964);
    int _1108 = int(_1106);
    int _1110 = _1098;
    if (!_663)
    {
        int _1112 = ~_1056;
        int _1114 = _1112 + 1;
        _1110 = _1114;
    }
    int _1116 = _1110;
    float _1118 = fma(_745, _799, _1100);
    bool _1120 = !_1086;
    int _1122 = _1120 ? 0 : 1;
    int _1124 = _1076 * _1102;
    int _1126 = _1124 + _629;
    int _1128 = abs(_1040);
    float _1130 = fma(_795, _793, _1118);
    int _1132 = abs(_1122);
    float _1134 = fma(_891, _469, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1136 = in.m_62.x;
    float _1138 = in.m_62.y;
    float _1140 = in.m_62.z;
    bool _1142 = uint(_1126) >= uint(_379);
    float _1144 = fma(_797, _793, _1104);
    float _1146 = fma(_916, _761, _1130);
    bool _1148 = !_1142;
    int _1150 = _1148 ? 0 : (-1);
    float _1152 = fma(_1134, _761, _1144);
    bool _1154 = !_1082;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1108 * _1128;
    int _1160 = _1158 + _629;
    float _1162 = float(_653);
    float _1164 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1146);
    float _1166 = float(_1132);
    float _1168 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1152);
    int _1170 = ~_1102;
    int _1172 = _1170 + _1150;
    int _1174 = _1172 + 1;
    float _1176 = _461 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1178 = abs(_1156);
    float _1180 = _1166 * _1162;
    float _1182 = float(uint(_1160));
    int _1184 = _379 * _1174;
    int _1186 = _1184 + _629;
    float _1188 = _1180 * (-2.0);
    bool _1190 = _379 == 0;
    float _1192 = as_type<float>(_871) * _1182;
    float _1194 = float(_1178);
    float _1196 = fma(_623, _1188, _623);
    int _1198 = ~_1044;
    int _1200 = _1198 + 1;
    int _1202 = _1200 + 1;
    float _1204 = fma(_1188, _1138, _1138);
    bool _1206 = !_1190;
    int _1208 = _1206 ? _1186 : (-1);
    float _1210 = trunc(_1192);
    float _1212 = precise::max(_1210, 0.0);
    uint _1214 = uint(_1212);
    int _1216 = _379 + (-1);
    float _1218 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1204);
    float _1220 = float(_1116);
    int _1222 = _1202 * _1208;
    int _1224 = abs(_1070);
    float _1226 = fma(_1196, _597, _1218);
    float _1228 = float(_978);
    int _1230 = _1044 * _1216;
    int _1232 = _1230 + _1222;
    float _1234 = _1194 * _1220;
    bool _1236 = !_1048;
    int _1238 = _1236 ? 0 : 1;
    float _1240 = _1226 * 0.15915493667125701904296875;
    int _1242 = abs(_1062);
    float _1244 = _625 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1246 = abs(_1238);
    out.m_60.w = _1000;
    bool _1248 = !_1052;
    int _1250 = _1248 ? 0 : 1;
    int _1252 = _1232 * _1242;
    float _1254 = _621 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1256 = abs(_1250);
    bool _1258 = !_1090;
    int _1260 = _1258 ? 0 : 1;
    int _1262 = _1066 * _1224;
    int _1264 = _1262 + _1252;
    int _1266 = abs(_1260);
    int _1268 = _1160 * _1246;
    int _1270 = _1268 + _1264;
    int _1272 = ~_379;
    int _1274 = _1272 + 1;
    float _1276 = float(_1266);
    int _1278 = _1108 * _1256;
    int _1280 = _1278 + _1270;
    float _1282 = _1234 * (-2.0);
    int _1284 = _1274 * int(_1214);
    int _1286 = _1284 + _1160;
    int _1288 = ~_379;
    int _1290 = _1288 + 1;
    float _1292 = _1276 * _1228;
    float _1294 = float(uint(_1280));
    float _1296 = fma(_1282, _1136, _1136);
    float _1298 = fma(_605, _1282, _605);
    float _1300 = _1292 * (-2.0);
    int _1302 = ~_379;
    int _1304 = _1302 + 1;
    float _1306 = as_type<float>(_871) * _1294;
    float _1308 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1296);
    float _1310 = float(uint(_1286));
    float _1312 = fma(_1300, _1140, _1140);
    float _1314 = trunc(_1306);
    float _1316 = precise::max(_1314, 0.0);
    uint _1318 = uint(_1316);
    float _1320 = fma(_1298, _597, _1308);
    float _1322 = fma(_609, _1300, _609);
    float _1324 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1312);
    float _1326 = as_type<float>(_871) * _1310;
    float _1328 = _1320 * 0.15915493667125701904296875;
    float _1330 = fma(_1322, _597, _1324);
    float _1332 = in.m_64.x;
    float _1334 = in.m_64.y;
    float _1336 = _1018 + 0.5;
    float _1338 = trunc(_1326);
    float _1340 = precise::max(_1338, 0.0);
    uint _1342 = uint(_1340);
    float _1344 = _1330 * 0.15915493667125701904296875;
    float _1346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[90].x, _519);
    int _1350 = ~_379;
    int _1352 = _1350 + 1;
    float _1354 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1356 = _1304 * int(_1318);
    int _1358 = _1356 + _1280;
    float _1360 = _1240 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    float _1364 = float(uint(_1358));
    float _1366 = _1024 + (-0.5);
    float _1368 = as_type<float>(_871) * _1364;
    int _1370 = int(_1214) + int(_1342);
    float _1372 = _1240 * 6.283185482025146484375;
    float _1374 = cos(_1372);
    float _1376 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _1378 = -_1366;
    float _1380 = -_545;
    float _1382 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[90].y, _1380);
    float _1384 = _1168 * _1334;
    float _1386 = _1164 * _1332;
    int _1388 = _1352 * _1370;
    int _1390 = _1388 + _1160;
    float _1392 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1394 = trunc(_1368);
    float _1396 = precise::max(_1394, 0.0);
    uint _1398 = uint(_1396);
    float _1400 = _1384 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1402 = _1386 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1404 = uint(_1390) >= uint(_379);
    float _1406 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1408 = _1400 * _1376;
    float _1410 = _1402 * _1346;
    float _1412 = _1328 * 6.283185482025146484375;
    float _1414 = sin(_1412);
    float _1416 = _1328 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    int _1420 = int(_1318) + int(_1398);
    int _1422 = _1290 * _1420;
    int _1424 = _1422 + _1280;
    float _1426 = _1344 * 6.283185482025146484375;
    float _1428 = cos(_1426);
    float _1430 = _1414 * _1362;
    float _1432 = _1414 * _1374;
    bool _1434 = uint(_1424) >= uint(_379);
    bool _1436 = !_1404;
    int _1438 = _1436 ? 0 : (-1);
    bool _1440 = !_1434;
    int _1442 = _1440 ? 0 : (-1);
    float _1444 = _1344 * 6.283185482025146484375;
    float _1446 = sin(_1444);
    float _1448 = _1418 * _1374;
    float _1450 = _1418 * _1362;
    int _1452 = ~_1420;
    int _1454 = _1452 + _1442;
    int _1456 = _1454 + 1;
    int _1458 = ~_1370;
    int _1460 = _1458 + _1438;
    int _1462 = _1460 + 1;
    float _1464 = _1414 * _1428;
    float _1466 = _1374 * _1428;
    float _1468 = _1418 * _1428;
    float _1470 = _1362 * _1428;
    float _1472 = fma(_1406, _1406, 1.0);
    int _1474 = _379 * _1456;
    int _1476 = _1474 + _1280;
    float _1478 = _1468 * _1408;
    int _1480 = _379 * _1462;
    int _1482 = _1480 + _1160;
    float _1484 = rsqrt(_1472);
    float _1486 = fma(_1446, _1448, _1430);
    float _1488 = fma(_1446, _1430, _1448);
    float _1490 = -_1450;
    float _1492 = fma(_1446, _1432, _1490);
    float _1494 = -_1432;
    float _1496 = fma(_1446, _1450, _1494);
    float _1498 = -_1408;
    float _1500 = _1446 * _1498;
    float _1502 = _1464 * _1408;
    float _1504 = fma(_1486, _1410, _1478);
    float _1506 = _1486 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1508 = -_1406;
    float _1510 = _1446 * _1508;
    float _1512 = fma(_1466, _1410, _1500);
    float _1514 = fma(_1492, _1410, _1502);
    float _1516 = fma(_1496, _1392, _1504);
    float _1518 = fma(_1466, _1354, _1510);
    float _1520 = fma(_1470, _1392, _1512);
    bool _1522 = !_1190;
    int _1524 = _1522 ? _1476 : (-1);
    float _1526 = _1406 * _1484;
    float _1528 = _1470 + _1518;
    float _1530 = fma(_1488, _1392, _1514);
    float _1532 = _1486 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1534 = -_1526;
    float _1536 = _1470 * _1534;
    float _1538 = _1468 * _1406;
    float _1540 = _1464 * _1406;
    int _1542 = _1524 & 3;
    bool _1544 = _1542 != 0;
    float _1546 = -_1446;
    float _1548 = fma(_1546, _1484, _1536);
    float _1550 = fma(_1486, _1354, _1538);
    int _1552 = _1524 >> 31;
    float _1554 = fma(_1492, _1354, _1540);
    float _1556 = -_1526;
    float _1558 = _1488 * _1556;
    float _1560 = -_1526;
    float _1562 = _1496 * _1560;
    int _1564 = _1552 & 3;
    float _1566 = _1496 + _1550;
    float _1568 = fma(_1464, _1484, _1558);
    float _1570 = _1488 + _1554;
    int _1572 = _1524 + _1564;
    float _1574 = fma(_1468, _1484, _1562);
    float _1576 = _1486 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1578 = uint(_1542) > 1u;
    float _1580 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1582 = _1572 >> 2;
    float _1584 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1586 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1576);
    bool _1588 = uint(_1542) >= 2u;
    float _1590 = fma(_1520, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1580);
    int _1592 = _1582 << 4;
    int _1594 = _1592 + 656;
    float _1596 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1598 = fma(_1520, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1584);
    float _1600 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1532);
    uint _1602 = uint(int(uint(_1594) >> uint(2)));
    uint _1604 = uint(int(uint(int(_1602)) >> uint(2)));
    int _1606 = int(_1602) & 3;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[int(_1604)][_1606];
    int _1610 = int(_1602) + 1;
    uint _1612 = uint(int(uint(_1610) >> uint(2)));
    int _1614 = _1610 & 3;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[int(_1612)][_1614];
    float _1618 = fma(_1520, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1596);
    float _1620 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1598);
    float _1622 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1506);
    int _1624 = _1544 ? 0 : 1;
    float _1626 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1618);
    float _1628 = _1244 + _1620;
    bool _1630 = _1542 != 3;
    int _1632 = _1594 + 8;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    uint _1636 = uint(int(uint(int(_1634)) >> uint(2)));
    int _1638 = int(_1634) & 3;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[int(_1636)][_1638];
    int _1642 = int(_1634) + 1;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    int _1646 = _1642 & 3;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[int(_1644)][_1646];
    float _1650 = _1176 + _1626;
    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1654 = _1628 + _1652;
    int _1656 = _1588 ? 0 : 1;
    float _1658 = _1566 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1662 = _1650 + _1660;
    float _1664 = _1654 * _1654;
    int _1666 = ~_1624;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = fma(_1528, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1658);
    float _1674 = _1662 * _1662;
    int _1676 = _1524 & 3;
    bool _1678 = _1676 != 0;
    float _1680 = _1566 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1682 = _1670;
    float _1684 = _1674;
    float _1686 = _1568;
    if (!_1578)
    {
        int _1688 = ~_1624;
        int _1690 = _1688 + 1;
        _1682 = _1690;
    }
    int _1692 = _1682;
    float _1694 = _1674 + _1664;
    bool _1696 = !_1678;
    int _1698 = _1696 ? 0 : 1;
    float _1700 = _1566 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _1702 = abs(_1692);
    float _1704 = sqrt(_1694);
    int _1706 = abs(_1698);
    float _1708 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1590);
    int _1710 = ~_1656;
    int _1712 = _1710 + 1;
    int _1714 = _1712 + 1;
    int _1716 = _1714;
    if (_1630)
    {
        int _1718 = ~_1656;
        int _1720 = _1718 + 1;
        _1716 = _1720;
    }
    int _1722 = _1716;
    float _1724 = fma(_1528, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1680);
    float _1726 = fma(_1528, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1700);
    int _1728 = ~_1702;
    int _1730 = _1728 + 1;
    int _1732 = _1730 + 1;
    int _1734 = abs(_1722);
    int _1736 = ~_1706;
    int _1738 = _1736 + 1;
    int _1740 = _1738 + 1;
    bool _1742 = _1542 != 3;
    float _1744 = _1254 + _1708;
    bool _1746 = _1704 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1748 = _1732 * as_type<int>(_1616);
    bool _1750 = !_337;
    int _1752 = _1750 ? 0 : 1;
    int _1754 = ~_1734;
    int _1756 = _1754 + 1;
    int _1758 = _1756 + 1;
    int _1760 = _1740 * as_type<int>(_1608);
    int _1762 = _1760 + _1748;
    bool _1764 = !_1742;
    float _1766 = _1764 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _1768 = abs(_1752);
    int _1770 = _1758 * as_type<int>(_1640);
    int _1772 = _1770 + _1762;
    int _1774 = abs(as_type<int>(_1766));
    float _1776 = _1766;
    float _1778 = as_type<float>(_1768);
    float _1780 = as_type<float>(_1774);
    float _1782 = as_type<float>(_1762);
    if (!_1746)
    {
        _1776 = _1664;
    }
    float _1784 = _1776;
    float _1786 = _1784;
    if (!_1746)
    {
        _1778 = _1650;
    }
    float _1788 = _1778;
    float _1790 = _1788;
    if (!_1746)
    {
        _1780 = _1628;
    }
    float _1792 = _1780;
    int _1794 = ~_1774;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    float _1800 = _1792;
    if (!_1746)
    {
        _1782 = _1744;
    }
    float _1802 = _1782;
    bool _1804 = !_1746;
    float _1806 = _1802;
    if (!_1804)
    {
        float _1808 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1812 = _1704 + _1810;
        float _1814 = rsqrt(_1694);
        float _1816 = _1812 * _1808;
        float _1818 = _1744 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1820 = _1816 * 0.15915493667125701904296875;
        float _1822 = _1820 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        float _1826 = _1820 * 6.283185482025146484375;
        float _1828 = cos(_1826);
        float _1830 = fma(_1824, _1818, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1832 = _1814 * _1830;
        float _1834 = _1828 + (-1.0);
        float _1836 = fma(_1662, _1832, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1838 = fma(_1654, _1832, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1840 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1844 = _1836 + _1842;
        float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1848 = _1838 + _1846;
        float _1850 = fma(_1744, _1828, _1840);
        float _1852 = _1844 * _1844;
        float _1854 = _1848 * _1848;
        _1806 = _1850;
        _1684 = _1852;
        _1786 = _1854;
        _1800 = _1838;
        _1790 = _1836;
    }
    float _1856 = _1806;
    float _1858 = _1684;
    float _1860 = _1786;
    float _1862 = _1800;
    float _1864 = _1790;
    float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1868 = _1856 + _1866;
    int _1870 = _1798 * as_type<int>(_1648);
    int _1872 = _1870 + _1772;
    int _1874 = ~_1768;
    int _1876 = _1874 + 1;
    int _1878 = _1876 + 1;
    float _1880 = _1574 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1882 = fma(_1868, _1868, _1858);
    bool _1884 = !_1190;
    int _1886 = _1884 ? _1482 : (-1);
    float _1888 = _1574 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1890 = _1878 * _1872;
    float _1892 = _1882 + _1860;
    float _1894 = _1574 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1896 = -_579;
    float _1898 = _1896 + 1.0;
    int _1900 = _1886 * _1768;
    int _1902 = _1900 + _1890;
    float _1904 = fma(_1548, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1880);
    float _1906 = fma(_1548, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1888);
    float _1908 = sqrt(_1892);
    float _1910 = fma(_1548, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1894);
    float _1912 = -_583;
    float _1914 = _1912 + 1.0;
    float _1916 = -_1898;
    float _1918 = fma(_1018, _1916, _1348);
    float _1920 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1586);
    float _1922 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1600);
    float _1924 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1622);
    float _1926 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1672);
    float _1928 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1724);
    float _1930 = fma(_1024, _1914, _1382);
    float _1932 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1904);
    float _1934 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1906);
    float _1936 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1910);
    float _1938 = float(_1902);
    float _1940 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1726);
    out.m_66.x = _1918;
    out.m_66.y = _1930;
    bool _1942 = _1908 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1944 = isnan(_1908);
    bool _1946 = _1942 || _1944;
    bool _1948 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1950 = _1946 || _1948;
    out.m_68.x = _1920;
    out.m_68.y = _1922;
    out.m_68.z = _1924;
    out.m_70.x = _1932;
    out.m_70.y = _1934;
    out.m_70.z = _1936;
    out.m_72.z = _1938;
    float _1952 = _1864;
    float _1954 = _1934;
    if (!_1950)
    {
        _1686 = 1.0;
    }
    float _1956 = _1686;
    out.m_74.x = _1926;
    out.m_74.y = _1928;
    out.m_74.z = _1940;
    bool _1958 = !_1950;
    float _1960 = _1956;
    if (!_1958)
    {
        bool _1962 = _1908 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1964 = isnan(_1908);
        bool _1966 = _1962 || _1964;
        bool _1968 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1970 = _1966 || _1968;
        if (!_1970)
        {
            float _1972 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1974 = _1908 + _1972;
            float _1976 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1978 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1976;
            float _1980 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1982 = _1980 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1984 = 1.0 / _1978;
            float _1986 = _1974 * _1984;
            float _1988 = fma(_1986, _1982, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1960 = _1988;
            _1990 = true;
        }
        else
        {
            bool _1992 = _1908 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1994 = isnan(_1908);
            bool _1996 = _1992 || _1994;
            bool _1998 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2000 = _1996 || _1998;
            if (!_2000)
            {
                float _2002 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2004 = _1908 + _2002;
                float _2006 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2008 = _2006 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2010 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2012 = _2010 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2014 = 1.0 / _2008;
                float _2016 = _2004 * _2014;
                float _2018 = fma(_2016, _2012, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1960 = _2018;
                _1990 = true;
            }
            else
            {
                _1960 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1990 = false;
    float _2020 = _1960;
    float _2022 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2026 = _1856 + _2024;
    float _2028 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2022);
    float _2030 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2032 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2036 = _2032 || _2034;
    bool _2038 = isnan(0.5);
    bool _2040 = _2036 || _2038;
    float _2042 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2044 = _1862 + _2042;
    float _2046 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2028);
    bool _2048 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan(0.5);
    bool _2056 = _2052 || _2054;
    float _2058 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2030);
    float _2060 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2062 = _1864 + _2060;
    float _2064 = _2046 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2066 = fma(_2026, _2020, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2068 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2058);
    float _2070 = fma(_2062, _2020, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2072 = 1.0 / _2064;
    float _2074 = fma(_2044, _2020, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2076 = _2068 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2078 = _2076 + _2064;
    float _2080 = _2062;
    float _2082 = _2046;
    float _2084 = _2076;
    float _2086 = _2070;
    if (_2056)
    {
        _2080 = _2070;
    }
    float _2088 = _2080;
    float _2090 = _2088;
    if (_2056)
    {
        _2082 = _2066;
    }
    float _2092 = _2082;
    float _2094 = _2092;
    if (_2056)
    {
        _2084 = _2074;
    }
    float _2096 = _2084;
    float _2098 = _2096;
    if (!_2056)
    {
        float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2102 = _1254 + _2100;
        float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2106 = _1176 + _2104;
        float _2108 = -_1176;
        float _2110 = _2108 + _2070;
        float _2112 = -_1254;
        float _2114 = _2112 + _2066;
        float _2116 = _2102 * _2102;
        float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2120 = _1244 + _2118;
        float _2122 = -_1244;
        float _2124 = _2122 + _2074;
        float _2126 = fma(_2106, _2106, _2116);
        float _2128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2130 = fma(_2120, _2120, _2126);
        float _2132 = sqrt(_2130);
        float _2134 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _2136 = _2132 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2138 = isnan(_2132);
        bool _2140 = _2136 || _2138;
        bool _2142 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2144 = _2140 || _2142;
        float _2146 = precise::min(_2132, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2148 = _2146 * _2128;
        float _2150 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2152 = _2150 * _2148;
        float _2154 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
        float _2156 = _2128;
        float _2158 = _2132;
        float _2160 = _2152;
        float _2162 = _2150;
        _2086 = _2110;
        if (_2144)
        {
            float _2164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2154 = _2164;
        }
        float _2166 = _2154;
        if (_2144)
        {
            float _2168 = precise::max(_2132, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2156 = _2168;
        }
        float _2170 = _2156;
        float _2172 = fma(_2110, _2152, _1176);
        float _2174 = _2172;
        if (_2144)
        {
            float _2176 = _2170 * _2166;
            _2158 = _2176;
        }
        float _2178 = _2158;
        float _2180 = fma(_2114, _2152, _1254);
        float _2182 = fma(_2124, _2152, _1244);
        float _2184 = _2178;
        _1952 = _2180;
        if (_2144)
        {
            float _2186 = _2150 * _2178;
            _2160 = _2186;
        }
        float _2188 = _2160;
        if (!_2144)
        {
            _2184 = _2172;
        }
        float _2190 = _2184;
        float _2192 = _2190;
        if (!_2144)
        {
            _2162 = _2180;
        }
        float _2194 = _2162;
        float _2196 = _2194;
        if (_2144)
        {
            float _2198 = fma(_2110, _2188, _1176);
            _2192 = _2198;
        }
        float _2200 = _2192;
        _2090 = _2200;
        if (!_2144)
        {
            _2174 = _2182;
        }
        float _2202 = _2174;
        _2098 = _2202;
        if (_2144)
        {
            float _2204 = fma(_2114, _2188, _1254);
            _2196 = _2204;
        }
        float _2206 = _2196;
        _2094 = _2206;
        if (_2144)
        {
            float _2208 = fma(_2124, _2188, _1244);
            _2098 = _2208;
        }
    }
    float _2210 = _2094;
    float _2212 = _2090;
    float _2214 = _2098;
    float _2216 = _2086;
    float _2218 = _1952;
    float _2220 = _2218;
    float _2222 = _2216;
    if (_2040)
    {
        _2220 = 1.0;
    }
    float _2224 = _2220;
    float _2226 = _2078 * _2072;
    float _2228 = _2226 * 0.5;
    float _2230 = _2224;
    if (!_2040)
    {
        float _2232 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2234 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2236 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2234);
        float _2238 = _2232 * 0.15915493667125701904296875;
        float _2240 = _2238 * 6.283185482025146484375;
        float _2242 = cos(_2240);
        float _2244 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2246 = _2244 * 0.15915493667125701904296875;
        float _2248 = _2238 * 6.283185482025146484375;
        float _2250 = sin(_2248);
        float _2252 = 1.0 / _2242;
        float _2254 = _2246 * 6.283185482025146484375;
        float _2256 = cos(_2254);
        float _2258 = _2250 * _2252;
        float _2260 = 1.0 / _2236;
        float _2262 = _2256 * _2258;
        float _2264 = _2246 * 6.283185482025146484375;
        float _2266 = sin(_2264);
        float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2270 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2268;
        float _2272 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2274 = _2260 * _2272;
        float _2276 = 1.0 / _2262;
        float _2278 = 1.0 / _2270;
        float _2280 = _2266 * _2276;
        float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2284 = fma(_2280, _2274, _2282);
        float _2286 = _2284 * _2278;
        float _2288 = precise::clamp(_2286, 0.0, 1.0);
        float _2290 = -_2288;
        float _2292 = _2290 + 1.0;
        _2222 = _2278;
        _1954 = _2246;
        _2230 = _2292;
    }
    float _2294 = _2222;
    float _2296 = _1954;
    float _2298 = _2230;
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2302 = _2210 + _2300;
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2306 = _2212 + _2304;
    float _2308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2310 = _2214 + _2308;
    float _2312 = _2302 * _2302;
    float _2314 = fma(_2306, _2306, _2312);
    float _2316 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2318 = fma(_2310, _2310, _2314);
    float _2320 = rsqrt(_2318);
    float _2322 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2324 = _2306 * _2322;
    float _2326 = _2310 * _2322;
    float _2328 = _2324 * _2324;
    float _2330 = _2326 * _2326;
    float _2332 = _2328 + _2330;
    float _2334 = sqrt(_2332);
    bool _2336 = _2334 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2340 = _2334 + _2338;
    float _2342 = _2294;
    float _2344 = _2296;
    float _2346 = _2340;
    float _2348 = _2302;
    float _2350 = _2324;
    if (_2336)
    {
        float _2352 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2342 = _2352;
    }
    float _2354 = _2342;
    if (_2336)
    {
        float _2356 = rsqrt(_2332);
        _2344 = _2356;
    }
    float _2358 = _2344;
    float _2360 = _2354;
    float _2362 = _2358;
    if (_2336)
    {
        float _2364 = _2340 * _2354;
        _2346 = _2364;
    }
    float _2366 = _2346;
    if (_2336)
    {
        float _2368 = _2366 * 0.15915493667125701904296875;
        _2360 = _2368;
    }
    float _2370 = _2360;
    float _2372 = _2320;
    float _2374 = _2370;
    if (_2336)
    {
        float _2376 = _2370 * 6.283185482025146484375;
        float _2378 = sin(_2376);
        _2372 = _2378;
    }
    float _2380 = _2372;
    float _2382 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2384 = precise::max(0.0, _2382);
    float _2386 = _2310;
    float _2388 = _2384;
    if (_2336)
    {
        float _2390 = _2370 * 6.283185482025146484375;
        float _2392 = cos(_2390);
        _2386 = _2392;
    }
    float _2394 = _2386;
    float _2396 = -_2322;
    float _2398 = -_2384;
    float _2400 = fma(_2302, _2396, _2398);
    float _2402 = _2400;
    if (_2336)
    {
        float _2404 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2348 = _2404;
    }
    float _2406 = _2348;
    float _2408 = _2406;
    float _2410 = _2380;
    if (_2336)
    {
        float _2412 = fma(_2380, _2406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2408 = _2412;
    }
    float _2414 = _2408;
    float _2416 = _2414;
    float _2418 = _2394;
    if (_2336)
    {
        float _2420 = _2394 + (-1.0);
        _2388 = _2420;
    }
    float _2422 = _2388;
    if (_2336)
    {
        float _2424 = _2358 * _2414;
        _2410 = _2424;
    }
    float _2426 = _2410;
    if (!_2336)
    {
        _2362 = _2326;
    }
    float _2428 = _2362;
    float _2430 = _2428;
    if (_2336)
    {
        float _2432 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2374 = _2432;
    }
    float _2434 = _2374;
    if (_2336)
    {
        float _2436 = _2324 * _2426;
        _2350 = _2436;
    }
    float _2438 = _2350;
    float _2440 = sqrt(_2318);
    if (!_2336)
    {
        _2416 = _2328;
    }
    float _2442 = _2416;
    float _2444 = _2442;
    if (_2336)
    {
        float _2446 = fma(_2400, _2394, _2434);
        _2402 = _2446;
    }
    float _2448 = _2402;
    if (_2336)
    {
        float _2450 = _2326 * _2426;
        _2430 = _2450;
    }
    float _2452 = _2430;
    if (_2336)
    {
        float _2454 = _2438 * _2438;
        _2444 = _2454;
    }
    float _2456 = _2444;
    if (!_2336)
    {
        _2418 = _2330;
    }
    float _2458 = _2418;
    float _2460 = _2210 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2462 = _2458;
    if (_2336)
    {
        float _2464 = _2452 * _2452;
        _2462 = _2464;
    }
    float _2466 = _2462;
    float _2468 = fma(_2448, _2448, _2456);
    float _2470 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2460);
    float _2472 = _2210 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2474 = _2468 + _2466;
    float _2476 = _2210 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2478 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2470);
    float _2480 = _2210 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2484 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2482);
    float _2486 = precise::clamp(_2484, 0.0, 1.0);
    float _2488 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2476);
    float _2490 = rsqrt(_2474);
    float _2492 = _2478 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2494 = -_2486;
    float _2496 = _2494 + 1.0;
    float _2498 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2480);
    float _2500 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2488);
    float _2502 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2472);
    float _2504 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2498);
    float _2506 = abs(_2496);
    float _2508 = log2(_2506);
    float _2510 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2512 = _2500 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2514 = _2504 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2516 = -_2510;
    float _2518 = fma(_2516, _2316, 1.0);
    float _2520 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2502);
    float _2522 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2524 = _2490 * _2438;
    float _2526 = _2490 * _2448;
    float _2528 = _2490 * _2452;
    float _2530 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2522);
    float _2532 = _2524 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2534 = _2520 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2536 = log2(_2518);
    float _2538 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2530);
    float _2540 = -_2532;
    float _2542 = fma(_2526, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2540);
    float _2544 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2546 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2548 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2538);
    float _2550 = -_2528;
    float _2552 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2542);
    float _2554 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2556 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2546);
    float _2558 = exp2(_2544);
    float _2560 = fma(_2552, -0.5, 0.5);
    float _2562 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2554);
    float _2564 = fma(_2552, 0.5, 0.5);
    float _2566 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2556);
    float _2568 = _2526 + 1.0;
    float _2570 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2562);
    float _2572 = fma(_2564, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2574 = 1.0 / _2548;
    float _2576 = _2536 * 0.693147182464599609375;
    float _2578 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2570);
    float _2580 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2566);
    float _2582 = fma(_2564, _2572, -0.212114393711090087890625);
    float _2584 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2586 = sqrt(_2560);
    float _2588 = -_2526;
    float _2590 = fma(_2558, _2568, _2588);
    float _2592 = fma(_2564, _2582, 1.570728778839111328125);
    float _2594 = fma(_2590, 0.5, 0.5);
    float _2596 = _2578 * _2574;
    float _2598 = _2580 * _2574;
    float _2600 = fma(_2596, 0.5, 0.5);
    float _2602 = fma(_2598, -0.5, 0.5);
    float _2604 = _2586 * 0.636619746685028076171875;
    float3 _6985 = float3(_2600, _2602, _2584);
    float _2606 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6985, float3(0.0), isnan(_6985)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6985, float3(0.0), isnan(_6985)), level(0.0)).x;
    float _2608 = -_2592;
    float _2610 = fma(_2604, _2608, 1.0);
    float3 _7001 = float3(_2600, _2602, _2584);
    float4 _2613 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7001, float3(0.0), isnan(_7001)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7001, float3(0.0), isnan(_7001)), level(0.0)).xyzw;
    float _2615 = _2613.x;
    float _2617 = _2613.y;
    float _2619 = _2613.z;
    float _2621 = _2613.w;
    float2 _7018 = float2(_2610, _2594);
    float3 _2625 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7018, float2(0.0), isnan(_7018)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7018, float2(0.0), isnan(_7018)), level(0.0)).xyz;
    float _2627 = _2625.x;
    float _2629 = _2625.y;
    float _2631 = _2625.z;
    float _2633 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2635 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_76.x = _2212;
    out.m_76.y = _2210;
    out.m_76.z = _2214;
    bool _2637 = _2440 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2639 = isnan(_2440);
    bool _2641 = _2637 || _2639;
    bool _2643 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2645 = _2641 || _2643;
    float _2647 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2635);
    float _2649 = exp2(_2633);
    float _2651 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2647);
    float _2653 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2651);
    float _2655 = _2653 + _2548;
    out.gl_Position.x = _2578;
    out.gl_Position.y = _2580;
    out.gl_Position.z = _2653;
    out.gl_Position.w = _2548;
    float _2657 = _2655 * 0.5;
    float _2659 = -_2649;
    float _2661 = _2659 + 1.0;
    float _2663 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.z = _2657;
    out.m_78.w = _2548;
    float _2665 = _2298 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2667 = _2653;
    float _2669 = _2578;
    float _2671 = _2580;
    float _2673 = _2548;
    float _2675 = _2657;
    float _2677 = _2663;
    if (!_2645)
    {
        _2667 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2679 = _2667;
    float _2681 = _2679;
    float _2683 = _2679;
    if (!_2645)
    {
        _2669 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2685 = _2669;
    float _2687 = _2685;
    float _2689 = _2685;
    if (!_2645)
    {
        _2671 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2691 = _2671;
    float _2693 = _2691;
    float _2695 = _2691;
    if (!_2645)
    {
        _2673 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2697 = _2673;
    float _2699 = _2697;
    float _2701 = _2697;
    if (!_2645)
    {
        _2675 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2703 = _2675;
    float _2705 = _2663 * _2606;
    float _2707 = -_2663;
    float _2709 = _2707 + 1.0;
    float _2711 = _2703;
    float _2713 = _2703;
    if (!_2645)
    {
        _2677 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2715 = _2677;
    float _2717 = _2621 * _2705;
    float _2719 = _2621 * _2709;
    float _2721 = _2631 * _2705;
    float _2723 = fma(_2627, _2717, _2615);
    float _2725 = fma(_2629, _2717, _2617);
    float _2727 = fma(_2621, _2721, _2619);
    out.m_80.x = _2723;
    out.m_80.y = _2725;
    out.m_80.z = _2727;
    out.m_80.w = _2719;
    bool _2729 = !_2645;
    float _2731 = _2715;
    float _2733 = _2715;
    if (!_2729)
    {
        bool _2735 = _2440 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2737 = isnan(_2440);
        bool _2739 = _2735 || _2737;
        bool _2741 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2743 = _2739 || _2741;
        if (!_2743)
        {
            float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2747 = _2440 + _2745;
            float _2749 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2751 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2749;
            float _2753 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2755 = _2753 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2757 = 1.0 / _2751;
            float _2759 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2763 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2765 = _2763 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2773 = _2771 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2775 = _2747 * _2757;
            float _2777 = precise::clamp(_2775, 0.0, 1.0);
            float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2783 = fma(_2777, _2755, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2785 = fma(_2777, _2781, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2787 = fma(_2777, _2761, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2789 = fma(_2777, _2765, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2791 = fma(_2777, _2769, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2793 = fma(_2777, _2773, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2689 = _2787;
            _2701 = _2791;
            _2683 = _2783;
            _2733 = _2789;
            _2695 = _2785;
            _2713 = _2793;
            _2795 = true;
        }
        else
        {
            bool _2797 = _2440 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2799 = isnan(_2440);
            bool _2801 = _2797 || _2799;
            bool _2803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2805 = _2801 || _2803;
            if (!_2805)
            {
                _2681 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2807 = _2681;
            _2683 = _2807;
            if (!_2805)
            {
                _2687 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2809 = _2687;
            _2689 = _2809;
            if (!_2805)
            {
                _2693 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2811 = _2693;
            _2695 = _2811;
            if (!_2805)
            {
                _2731 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2813 = _2731;
            _2733 = _2813;
            if (!_2805)
            {
                _2699 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2815 = _2699;
            _2701 = _2815;
            if (!_2805)
            {
                _2711 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2817 = _2711;
            bool _2819 = !_2805;
            _2713 = _2817;
            if (!_2819)
            {
                bool _2821 = _2440 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2823 = isnan(_2440);
                bool _2825 = _2821 || _2823;
                bool _2827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2829 = _2825 || _2827;
                if (!_2829)
                {
                    float _2831 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2833 = _2440 + _2831;
                    float _2835 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2837 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2835;
                    float _2839 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2841 = _2839 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2843 = 1.0 / _2837;
                    float _2845 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2851 = _2849 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2853 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2855 = _2853 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2859 = _2857 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2861 = _2833 * _2843;
                    float _2863 = precise::clamp(_2861, 0.0, 1.0);
                    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2867 = _2865 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2869 = fma(_2863, _2841, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2871 = fma(_2863, _2867, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2873 = fma(_2863, _2847, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2875 = fma(_2863, _2851, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2877 = fma(_2863, _2855, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2879 = fma(_2863, _2859, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2689 = _2873;
                    _2701 = _2877;
                    _2683 = _2869;
                    _2733 = _2875;
                    _2695 = _2871;
                    _2713 = _2879;
                    _2795 = true;
                }
                else
                {
                    _2689 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2701 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2683 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2733 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2695 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2713 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2795 = false;
    float _2881 = _2689;
    float _2883 = _2701;
    float _2885 = _2683;
    float _2887 = _2733;
    float _2889 = _2695;
    float _2891 = _2713;
    float _2893 = fma(_1928, -0.5, 0.5);
    float _2895 = precise::clamp(_2893, 0.0, 1.0);
    float _2897 = -_2881;
    float _2899 = _2897 + _2883;
    float _2901 = _2665 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2903 = -_2885;
    float _2905 = _2903 + _2887;
    out.m_82.x = 0.0;
    float _2907 = fma(_2895, _2899, _2881);
    float _2909 = -_2889;
    float _2911 = _2909 + _2891;
    out.m_49.x = _2901;
    float _2913 = fma(_2895, _2905, _2885);
    float _2915 = _2907 * 0.586610972881317138671875;
    bool _2917 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2919 = fma(_2895, _2911, _2889);
    float _2921 = fma(_2913, 0.298911988735198974609375, _2915);
    bool _2923 = _2298 > 0.0;
    bool _2925 = isnan(_2298);
    bool _2927 = _2923 || _2925;
    bool _2929 = isnan(0.0);
    bool _2931 = _2927 || _2929;
    float _2933 = fma(_2919, 0.114477999508380889892578125, _2921);
    float _2935 = -_2933;
    float _2937 = _2913 + _2935;
    float _2939 = -_2933;
    float _2941 = _2907 + _2939;
    float _2943 = -_2933;
    float _2945 = _2919 + _2943;
    float _2947 = fma(_2937, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2933);
    float _2949 = fma(_2941, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2933);
    float _2951 = fma(_2945, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2933);
    bool _2953 = !_2917;
    if (!_2953)
    {
        float _2955 = -_2210;
        float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2959 = -_2212;
        float _2961 = _2959 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2963 = -_2214;
        float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2967 = _2957 * _2957;
        float _2969 = fma(_2961, _2961, _2967);
        float _2971 = fma(_2965, _2965, _2969);
        float _2973 = sqrt(_2971);
        float _2975 = rsqrt(_2971);
        float _2977 = -_2973;
        float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2981 = _2979 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2983 = precise::clamp(_2981, 0.0, 1.0);
        float _2985 = _2961 * _2975;
        float _2987 = _2957 * _2975;
        float _2989 = abs(_2983);
        float _2991 = log2(_2989);
        float _2993 = _2965 * _2975;
        float _2995 = _2985 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2997 = _1928 * _2987;
        float _2999 = -_2987;
        float _3001 = -_2995;
        float _3003 = fma(_2999, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3001);
        float _3005 = fma(_1926, _2985, _2997);
        float _3007 = -_2993;
        float _3009 = fma(_3007, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3003);
        float _3011 = fma(_1940, _2993, _3005);
        float _3013 = precise::clamp(_3011, 0.0, 1.0);
        float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3017 = _3009 + _3015;
        float _3019 = _2991 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3021 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3023 = precise::clamp(_3021, 0.0, 1.0);
        float _3025 = exp2(_3019);
        float _3027 = _3025 * _3023;
        float _3029 = _3013 * _3027;
        float _3031 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3033 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3035 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _3031;
        out.m_82.y = _3033;
        out.m_82.z = _3035;
    }
    out.m_84.x = _2947;
    out.m_84.y = _2949;
    out.m_84.z = _2951;
    if (_2931)
    {
        return out;
    }
    out.m_49.x = 0.0;
    float _3037 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3037;
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
    out.m_49 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2795 = false;
    bool _1990 = false;
    bool _205 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _98 = in.m_46.w;
    float _100 = trunc(_98);
    int _103 = int(_100);
    bool _107 = _103 >= 1;
    float _109 = 0.0;
    if (!_107)
    {
        _109 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _111 = _109;
    float _113 = _111;
    if (!_107)
    {
        out.m_49.x = 0.0;
    }
    int _115 = 0;
    if (!_107)
    {
        float _117 = _111 * 5.0;
        _115 = as_type<int>(_117);
    }
    int _119 = _115;
    int _121 = _119;
    if (!_107)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3094 = as_type<float>(_119);
        out.gl_Position.z = _3094;
    }
    if (!_107)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _123 = in.m_51.w;
    bool _125 = _123 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _127 = isnan(_123);
    bool _129 = _125 || _127;
    bool _131 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _133 = _129 || _131;
    float _135 = -_123;
    float _137 = _135 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _139 = 0.0;
    float _141 = _137;
    if (_133)
    {
        float _143 = float(_103);
        _113 = _143;
    }
    float _145 = _113;
    bool _147 = _137 >= _145;
    bool _149 = !_133;
    bool _151 = _147 || _149;
    float _153 = _145;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _153;
    if (_151)
    {
        out.m_49.x = 0.0;
    }
    if (_151)
    {
        float _157 = _155 * 5.0;
        _121 = as_type<int>(_157);
    }
    int _159 = _121;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3164 = as_type<float>(_159);
        out.gl_Position.z = _3164;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _161 = as_type<float>(int(gl_VertexIndex));
    bool _163 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    int _165 = as_type<int>(_161) & 1;
    bool _167 = _165 != 0;
    int _169 = as_type<int>(_161) & 2;
    bool _171 = _169 != 0;
    bool _173 = !_167;
    float _175 = _173 ? (-0.5) : 0.5;
    bool _177 = !_171;
    float _179 = _177 ? (-0.5) : 0.5;
    bool _181 = !_163;
    float _201;
    float _203;
    if (!_181)
    {
        float _183 = in.m_56.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = float(_103);
        float _189 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _191 = fma(_189, (*spvDescriptorSet0.vp_c9)._m0[12].x, _137);
        float _193 = _191 * _185;
        float _195 = floor(_193);
        float _197 = -_195;
        float _199 = _193 + _197;
        _201 = _199;
        _203 = _187;
        _205 = true;
    }
    else
    {
        float _207 = float(_103);
        float _209 = 1.0 / _207;
        float _211 = _137 * _209;
        _201 = _211;
        _203 = _207;
    }
    _205 = false;
    float _213 = _201;
    float _215 = _203;
    float _217 = in.m_56.x;
    float _219 = in.m_56.y;
    float _221 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _223 = log2(_221);
    float _225 = in.m_56.z;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _229 = _213 + _227;
    int _231 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _233 = _231 != 0;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    int _239 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _241 = _239 != 0;
    float _243 = in.m_56.w;
    int _245 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _247 = _245 != 0;
    float _249 = 1.0 / _237;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _253 = _251 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _213 + _255;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[146].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _267 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _269 = (*spvDescriptorSet0.vp_c9)._m0[148].w + _267;
    float _271 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _273 = 1.0 / _265;
    bool _275 = _217 > 0.5;
    float _277 = _219 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    bool _279 = _219 > 0.5;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _283 = _213 + _281;
    float _285 = -_175;
    int _287 = _275 ? as_type<int>(_285) : as_type<int>(_175);
    float _289 = _217 * 2.0;
    int _291 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16384;
    bool _293 = _291 != 0;
    float _295 = 1.0 / _269;
    float _297 = -_179;
    int _299 = _279 ? as_type<int>(_297) : as_type<int>(_179);
    float _301 = fma(_277, -2.0, _271);
    int _303 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _305 = _303 != 0;
    int _307 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _309 = _307 != 0;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _313 = _213 + _311;
    bool _315 = !_241;
    float _317 = _315 ? _175 : as_type<float>(_287);
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _321 = _213 + _319;
    bool _323 = !_247;
    float _325 = _323 ? _179 : as_type<float>(_299);
    float _327 = 1.0 / _261;
    float _329 = -_175;
    int _331 = _279 ? as_type<int>(_329) : as_type<int>(_175);
    float _333 = _229 * _273;
    int _335 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8388608;
    bool _337 = _335 != 0;
    float _339 = _223 * _137;
    int _341 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _343 = _341 != 0;
    float _345 = _321 * _249;
    int _347 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _349 = _347 != 0;
    float _351 = 1.0 / _253;
    float _353 = in.m_46.x;
    float _355 = in.m_46.y;
    float _357 = in.m_46.z;
    float _359 = _217 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    if (_233)
    {
        _139 = _219;
    }
    float _361 = _139;
    float _363 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[76].y, _301);
    float _365 = 0.0;
    float _367 = _361;
    if (_233)
    {
        _365 = _217;
    }
    float _369 = _365;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _373 = !_233;
    float _375 = _373 ? 5.839270114898681640625 : 1.0;
    float _377 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].x);
    int _379 = int(_377);
    float _381 = _369;
    if (!_233)
    {
        _367 = _217;
    }
    float _383 = _367;
    float _385 = -_371;
    float _387 = fma(_359, 2.0, _385);
    if (!_233)
    {
        _381 = _225;
    }
    float _389 = _381;
    float _391 = _313 * _327;
    bool _393 = !_233;
    float _395 = _393 ? _225 : _217;
    float _397 = _383 * (*spvDescriptorSet0.vp_c9)._m0[87].y;
    bool _399 = _225 > 0.5;
    float _401 = 1.0 / _215;
    float _403 = _257 * _351;
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _407 = _213 + _405;
    float _409 = -_179;
    int _411 = _399 ? as_type<int>(_409) : as_type<int>(_179);
    float _413 = -(*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _415 = (*spvDescriptorSet0.vp_c9)._m0[150].w + _413;
    float _417 = -_175;
    int _419 = _399 ? as_type<int>(_417) : as_type<int>(_175);
    float _421 = _355 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _423 = _243 > 0.5;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[148].w;
    float _427 = _425 + (*spvDescriptorSet0.vp_c9)._m0[149].w;
    float _429 = _355 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _431 = _355 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _433 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[147].w;
    float _437 = _213 + _435;
    float _439 = 1.0 / _415;
    float _441 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[4].x, _421);
    float _443 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[5].x, _429);
    float _445 = _437 * _295;
    float _447 = fma(_353, (*spvDescriptorSet0.vp_c10)._m0[6].x, _431);
    out.m_58.w = _433;
    float _449 = _375 * _395;
    float _451 = 1.0 / _427;
    float _453 = float(_379);
    float _455 = _219 * 2.0;
    float _457 = -_137;
    float _459 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[76].x, _387);
    float _461 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[4].z, _441);
    bool _463 = !_343;
    float _465 = _463 ? _175 : as_type<float>(_419);
    float _467 = exp2(_339);
    float _469 = _283 * _439;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[87].x + (*spvDescriptorSet0.vp_c9)._m0[86].z;
    float _473 = (*spvDescriptorSet0.vp_c9)._m0[87].y + (*spvDescriptorSet0.vp_c9)._m0[86].w;
    float _475 = _453 * _137;
    float _477 = _217 + _225;
    float _479 = fma(_397, -2.0, _473);
    float _481 = trunc((*spvDescriptorSet0.vp_c9)._m0[40].y);
    int _483 = int(_481);
    float _485 = _407 * _451;
    float _487 = -_179;
    int _489 = _423 ? as_type<int>(_487) : as_type<int>(_179);
    float _491 = _389 * (*spvDescriptorSet0.vp_c9)._m0[87].x;
    bool _493 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _495 = isnan(0.0);
    bool _497 = _493 || _495;
    bool _499 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _501 = _497 || _499;
    float _503 = _475 * _401;
    float _505 = -_471;
    float _507 = fma(_491, 2.0, _505);
    float _509 = -_467;
    float _511 = _509 + 1.0;
    float _513 = floor(_289);
    float _515 = (*spvDescriptorSet0.vp_c9)._m0[88].w + (*spvDescriptorSet0.vp_c9)._m0[88].y;
    float _517 = -_137;
    float _519 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[86].x, _507);
    float _521 = _501 ? _511 : 0.0;
    float _523 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[88].w, _515);
    float _525 = float(_483);
    float _527 = (*spvDescriptorSet0.vp_c9)._m0[88].z + (*spvDescriptorSet0.vp_c9)._m0[88].x;
    bool _529 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _531 = isnan(1.0);
    bool _533 = _529 || _531;
    bool _535 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _537 = _533 || _535;
    float _539 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _541 = 1.0 + _539;
    float _543 = 1.0 / _525;
    float _545 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[86].y, _479);
    float _547 = _477 + (-1.0);
    bool _549 = !_349;
    float _551 = _549 ? _179 : as_type<float>(_489);
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _555 = _513 >= 0.0;
    bool _557 = isnan(_513);
    bool _559 = _555 || _557;
    bool _561 = isnan(0.0);
    bool _563 = _559 || _561;
    float _565 = 1.0 / _541;
    float _567 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _569 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[78].w, _553);
    float _571 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[88].z, _527);
    float _573 = _219 + _217;
    float _575 = fma(_217, (*spvDescriptorSet0.vp_c9)._m0[78].z, _567);
    float _577 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].w, _569);
    float _579 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].z, _571);
    float _581 = floor(_455);
    float _583 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[87].w, _523);
    float _585 = _225 * 2.0;
    float _587 = _543 * _137;
    float _589 = fma(_137, (*spvDescriptorSet0.vp_c9)._m0[77].z, _575);
    float _591 = _573 + (-1.0);
    int _593 = _563 ? 0 : 1;
    if (_537)
    {
        float _595 = _521 * _565;
        _141 = _595;
    }
    float _597 = _141;
    float _599 = floor(_585);
    float _601 = _219 + _225;
    bool _603 = _513 > 0.0;
    float _605 = fma(_591, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _607 = _601 + (-1.0);
    float _609 = fma(_547, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _611 = _581 >= 0.0;
    bool _613 = isnan(_581);
    bool _615 = _611 || _613;
    bool _617 = isnan(0.0);
    bool _619 = _615 || _617;
    float _621 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[5].z, _443);
    float _623 = fma(_607, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _625 = fma(_357, (*spvDescriptorSet0.vp_c10)._m0[6].z, _447);
    float _627 = trunc(_587);
    int _629 = int(_627);
    int _631 = ~_593;
    int _633 = _631 + 1;
    int _635 = _633 + 1;
    float _637 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _639 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _637;
    bool _641 = _581 > 0.0;
    float _643 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _645 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _643;
    int _647 = _635;
    if (!_603)
    {
        int _649 = ~_593;
        int _651 = _649 + 1;
        _647 = _651;
    }
    int _653 = _647;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    int _659 = _619 ? 0 : 1;
    float _661 = fma(_639, _345, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    bool _663 = _599 > 0.0;
    float _665 = fma(_645, _345, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    bool _667 = _599 >= 0.0;
    bool _669 = isnan(_599);
    bool _671 = _667 || _669;
    bool _673 = isnan(0.0);
    bool _675 = _671 || _673;
    float _677 = fma(_657, _403, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _679 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _681 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _679;
    float _683 = -(*spvDescriptorSet0.vp_c9)._m0[146].x;
    float _685 = _683 + (*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _687 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _689 = _687 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _693 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _691;
    float _695 = -(*spvDescriptorSet0.vp_c9)._m0[146].y;
    float _697 = _695 + (*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _699 = fma(_681, _391, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _701 = fma(_693, _391, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _703 = fma(_685, _333, (*spvDescriptorSet0.vp_c9)._m0[146].x);
    float _705 = fma(_697, _333, (*spvDescriptorSet0.vp_c9)._m0[146].y);
    bool _707 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[150].w;
    bool _709 = isnan(_213);
    bool _711 = _707 || _709;
    bool _713 = isnan((*spvDescriptorSet0.vp_c9)._m0[150].w);
    bool _715 = _711 || _713;
    float _717 = float(_715);
    float _719 = -(*spvDescriptorSet0.vp_c9)._m0[147].x;
    float _721 = (*spvDescriptorSet0.vp_c9)._m0[148].x + _719;
    bool _723 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[149].w;
    bool _725 = isnan(_213);
    bool _727 = _723 || _725;
    bool _729 = isnan((*spvDescriptorSet0.vp_c9)._m0[149].w);
    bool _731 = _727 || _729;
    float _733 = float(_731);
    float _735 = -(*spvDescriptorSet0.vp_c9)._m0[147].y;
    float _737 = (*spvDescriptorSet0.vp_c9)._m0[148].y + _735;
    float _739 = float(uint(_379));
    float _741 = -_717;
    float _743 = _741 + 1.0;
    float _745 = fma(_721, _445, (*spvDescriptorSet0.vp_c9)._m0[147].x);
    float _747 = fma(_737, _445, (*spvDescriptorSet0.vp_c9)._m0[147].y);
    bool _749 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[148].w;
    bool _751 = isnan(_213);
    bool _753 = _749 || _751;
    bool _755 = isnan((*spvDescriptorSet0.vp_c9)._m0[148].w);
    bool _757 = _753 || _755;
    float _759 = float(_757);
    float _761 = _733 * _743;
    float _763 = 1.0 / _739;
    float _765 = -_733;
    float _767 = _765 + 1.0;
    float _769 = -(*spvDescriptorSet0.vp_c9)._m0[148].x;
    float _771 = _769 + (*spvDescriptorSet0.vp_c9)._m0[149].x;
    bool _773 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[147].w;
    bool _775 = isnan(_213);
    bool _777 = _773 || _775;
    bool _779 = isnan((*spvDescriptorSet0.vp_c9)._m0[147].w);
    bool _781 = _777 || _779;
    float _783 = float(_781);
    float _785 = -(*spvDescriptorSet0.vp_c9)._m0[148].y;
    float _787 = _785 + (*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _789 = -_759;
    float _791 = _789 + 1.0;
    float _793 = _759 * _767;
    float _795 = fma(_771, _485, (*spvDescriptorSet0.vp_c9)._m0[148].x);
    float _797 = fma(_787, _485, (*spvDescriptorSet0.vp_c9)._m0[148].y);
    float _799 = _783 * _791;
    float _801 = -_783;
    float _803 = _801 + 1.0;
    float _805 = fma(_689, _403, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _807 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _809 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _811 = isnan(_213);
    bool _813 = _809 || _811;
    bool _815 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _817 = _813 || _815;
    float _819 = float(_817);
    float _821 = -_551;
    float _823 = _821 + 0.5;
    bool _825 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _827 = isnan(_213);
    bool _829 = _825 || _827;
    bool _831 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _833 = _829 || _831;
    float _835 = float(_833);
    float _837 = -_577;
    float _839 = _837 + 1.0;
    bool _841 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _843 = isnan(_213);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -_819;
    float _855 = _853 + 1.0;
    bool _857 = _213 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _859 = isnan(_213);
    bool _861 = _857 || _859;
    bool _863 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _865 = _861 || _863;
    float _867 = float(_865);
    float _869 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    int _871 = as_type<int>(_763) + (-2);
    float _873 = _819 * _803;
    float _875 = float(uint(_629));
    float _877 = _835 * _855;
    float _879 = -_835;
    float _881 = _879 + 1.0;
    float _883 = floor(_449);
    float _885 = as_type<float>(_871) * _875;
    float _887 = _867 * _881;
    float _889 = -(*spvDescriptorSet0.vp_c9)._m0[149].y;
    float _891 = (*spvDescriptorSet0.vp_c9)._m0[150].y + _889;
    float _893 = _807 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _895 = -(*spvDescriptorSet0.vp_c9)._m0[149].x;
    float _897 = (*spvDescriptorSet0.vp_c9)._m0[150].x + _895;
    float _899 = _317 + 0.5;
    float _901 = -_867;
    float _903 = _901 + 1.0;
    float _905 = _869 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _907 = trunc(_885);
    float _909 = precise::max(_907, 0.0);
    uint _912 = uint(_909);
    float _914 = _325 + (-0.5);
    float _916 = fma(_897, _469, (*spvDescriptorSet0.vp_c9)._m0[149].x);
    float _918 = fma(_905, _899, _459);
    float _920 = _851 * _903;
    float _922 = -_893;
    float _924 = -_363;
    float _926 = fma(_922, _914, _924);
    float _928 = -_851;
    float _930 = _928 + 1.0;
    int _932 = ~_379;
    int _934 = _932 + 1;
    float _936 = _661 * _920;
    float _938 = _665 * _920;
    float _940 = -_883;
    float _942 = _449 + _940;
    float _944 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _946 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].x, _936);
    float _948 = fma(_930, (*spvDescriptorSet0.vp_c9)._m0[143].y, _938);
    float _950 = float(_629);
    int _952 = _934 * int(_912);
    int _954 = _952 + _629;
    float _956 = _823 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _958 = ~_659;
    int _960 = _958 + 1;
    int _962 = _960 + 1;
    float _964 = _453 * _942;
    float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _968 = float(uint(_954));
    float _970 = fma(_677, _887, _946);
    int _972 = _962;
    if (!_641)
    {
        int _974 = ~_659;
        int _976 = _974 + 1;
        _972 = _976;
    }
    int _978 = _972;
    float _980 = _465 + 0.5;
    bool _982 = _950 >= _453;
    bool _984 = isnan(_950);
    bool _986 = _982 || _984;
    bool _988 = isnan(_453);
    bool _990 = _986 || _988;
    float _992 = float(_990);
    float _994 = as_type<float>(_871) * _968;
    float _996 = -_589;
    float _998 = _996 + 1.0;
    float _1000 = _956 * _944;
    float _1002 = fma(_325, _839, _926);
    float _1004 = trunc(_994);
    float _1006 = precise::max(_1004, 0.0);
    uint _1008 = uint(_1006);
    float _1010 = -_998;
    float _1012 = fma(_317, _1010, _918);
    float _1014 = _980 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    bool _1016 = !_305;
    float _1018 = _1016 ? _175 : as_type<float>(_331);
    float _1020 = fma(_805, _887, _948);
    bool _1022 = !_309;
    float _1024 = _1022 ? _179 : as_type<float>(_411);
    float _1026 = _1014 * _966;
    int _1028 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4096;
    bool _1030 = _1028 != 0;
    int _1032 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 8192;
    bool _1034 = _1032 != 0;
    float _1036 = fma(_699, _877, _970);
    bool _1038 = !_293;
    int _1040 = _1038 ? 0 : 1;
    float _1042 = trunc(_992);
    int _1044 = int(_1042);
    int _1046 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16384;
    bool _1048 = _1046 != 0;
    out.m_60.x = _1012;
    out.m_60.y = _1002;
    out.m_60.z = _1026;
    int _1050 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32768;
    bool _1052 = _1050 != 0;
    float _1054 = _219 + (-0.5);
    int _1056 = _675 ? 0 : 1;
    float _1058 = fma(_701, _877, _1020);
    bool _1060 = !_1034;
    int _1062 = _1060 ? 0 : 1;
    float _1064 = trunc(_503);
    int _1066 = int(_1064);
    bool _1068 = !_1030;
    int _1070 = _1068 ? 0 : 1;
    float _1072 = _217 + (-0.5);
    int _1074 = ~_379;
    int _1076 = _1074 + 1;
    float _1078 = _225 + (-0.5);
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1082 = _1080 != 0;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1086 = _1084 != 0;
    int _1088 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1090 = _1088 != 0;
    float _1092 = fma(_705, _873, _1058);
    int _1094 = ~_1056;
    int _1096 = _1094 + 1;
    int _1098 = _1096 + 1;
    float _1100 = fma(_703, _873, _1036);
    int _1102 = int(_912) + int(_1008);
    float _1104 = fma(_747, _799, _1092);
    float _1106 = trunc(_964);
    int _1108 = int(_1106);
    int _1110 = _1098;
    if (!_663)
    {
        int _1112 = ~_1056;
        int _1114 = _1112 + 1;
        _1110 = _1114;
    }
    int _1116 = _1110;
    float _1118 = fma(_745, _799, _1100);
    bool _1120 = !_1086;
    int _1122 = _1120 ? 0 : 1;
    int _1124 = _1076 * _1102;
    int _1126 = _1124 + _629;
    int _1128 = abs(_1040);
    float _1130 = fma(_795, _793, _1118);
    int _1132 = abs(_1122);
    float _1134 = fma(_891, _469, (*spvDescriptorSet0.vp_c9)._m0[149].y);
    float _1136 = in.m_62.x;
    float _1138 = in.m_62.y;
    float _1140 = in.m_62.z;
    bool _1142 = uint(_1126) >= uint(_379);
    float _1144 = fma(_797, _793, _1104);
    float _1146 = fma(_916, _761, _1130);
    bool _1148 = !_1142;
    int _1150 = _1148 ? 0 : (-1);
    float _1152 = fma(_1134, _761, _1144);
    bool _1154 = !_1082;
    int _1156 = _1154 ? 0 : 1;
    int _1158 = _1108 * _1128;
    int _1160 = _1158 + _629;
    float _1162 = float(_653);
    float _1164 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[150].x, _1146);
    float _1166 = float(_1132);
    float _1168 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[150].y, _1152);
    int _1170 = ~_1102;
    int _1172 = _1170 + _1150;
    int _1174 = _1172 + 1;
    float _1176 = _461 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    int _1178 = abs(_1156);
    float _1180 = _1166 * _1162;
    float _1182 = float(uint(_1160));
    int _1184 = _379 * _1174;
    int _1186 = _1184 + _629;
    float _1188 = _1180 * (-2.0);
    bool _1190 = _379 == 0;
    float _1192 = as_type<float>(_871) * _1182;
    float _1194 = float(_1178);
    float _1196 = fma(_623, _1188, _623);
    int _1198 = ~_1044;
    int _1200 = _1198 + 1;
    int _1202 = _1200 + 1;
    float _1204 = fma(_1188, _1138, _1138);
    bool _1206 = !_1190;
    int _1208 = _1206 ? _1186 : (-1);
    float _1210 = trunc(_1192);
    float _1212 = precise::max(_1210, 0.0);
    uint _1214 = uint(_1212);
    int _1216 = _379 + (-1);
    float _1218 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1204);
    float _1220 = float(_1116);
    int _1222 = _1202 * _1208;
    int _1224 = abs(_1070);
    float _1226 = fma(_1196, _597, _1218);
    float _1228 = float(_978);
    int _1230 = _1044 * _1216;
    int _1232 = _1230 + _1222;
    float _1234 = _1194 * _1220;
    bool _1236 = !_1048;
    int _1238 = _1236 ? 0 : 1;
    float _1240 = _1226 * 0.15915493667125701904296875;
    int _1242 = abs(_1062);
    float _1244 = _625 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1246 = abs(_1238);
    out.m_60.w = _1000;
    bool _1248 = !_1052;
    int _1250 = _1248 ? 0 : 1;
    int _1252 = _1232 * _1242;
    float _1254 = _621 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    int _1256 = abs(_1250);
    bool _1258 = !_1090;
    int _1260 = _1258 ? 0 : 1;
    int _1262 = _1066 * _1224;
    int _1264 = _1262 + _1252;
    int _1266 = abs(_1260);
    int _1268 = _1160 * _1246;
    int _1270 = _1268 + _1264;
    int _1272 = ~_379;
    int _1274 = _1272 + 1;
    float _1276 = float(_1266);
    int _1278 = _1108 * _1256;
    int _1280 = _1278 + _1270;
    float _1282 = _1234 * (-2.0);
    int _1284 = _1274 * int(_1214);
    int _1286 = _1284 + _1160;
    int _1288 = ~_379;
    int _1290 = _1288 + 1;
    float _1292 = _1276 * _1228;
    float _1294 = float(uint(_1280));
    float _1296 = fma(_1282, _1136, _1136);
    float _1298 = fma(_605, _1282, _605);
    float _1300 = _1292 * (-2.0);
    int _1302 = ~_379;
    int _1304 = _1302 + 1;
    float _1306 = as_type<float>(_871) * _1294;
    float _1308 = fma(_1072, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1296);
    float _1310 = float(uint(_1286));
    float _1312 = fma(_1300, _1140, _1140);
    float _1314 = trunc(_1306);
    float _1316 = precise::max(_1314, 0.0);
    uint _1318 = uint(_1316);
    float _1320 = fma(_1298, _597, _1308);
    float _1322 = fma(_609, _1300, _609);
    float _1324 = fma(_1078, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1312);
    float _1326 = as_type<float>(_871) * _1310;
    float _1328 = _1320 * 0.15915493667125701904296875;
    float _1330 = fma(_1322, _597, _1324);
    float _1332 = in.m_64.x;
    float _1334 = in.m_64.y;
    float _1336 = _1018 + 0.5;
    float _1338 = trunc(_1326);
    float _1340 = precise::max(_1338, 0.0);
    uint _1342 = uint(_1340);
    float _1344 = _1330 * 0.15915493667125701904296875;
    float _1346 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1348 = fma(_1336, (*spvDescriptorSet0.vp_c9)._m0[90].x, _519);
    int _1350 = ~_379;
    int _1352 = _1350 + 1;
    float _1354 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _1356 = _1304 * int(_1318);
    int _1358 = _1356 + _1280;
    float _1360 = _1240 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    float _1364 = float(uint(_1358));
    float _1366 = _1024 + (-0.5);
    float _1368 = as_type<float>(_871) * _1364;
    int _1370 = int(_1214) + int(_1342);
    float _1372 = _1240 * 6.283185482025146484375;
    float _1374 = cos(_1372);
    float _1376 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _1378 = -_1366;
    float _1380 = -_545;
    float _1382 = fma(_1378, (*spvDescriptorSet0.vp_c9)._m0[90].y, _1380);
    float _1384 = _1168 * _1334;
    float _1386 = _1164 * _1332;
    int _1388 = _1352 * _1370;
    int _1390 = _1388 + _1160;
    float _1392 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1394 = trunc(_1368);
    float _1396 = precise::max(_1394, 0.0);
    uint _1398 = uint(_1396);
    float _1400 = _1384 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1402 = _1386 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    bool _1404 = uint(_1390) >= uint(_379);
    float _1406 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1408 = _1400 * _1376;
    float _1410 = _1402 * _1346;
    float _1412 = _1328 * 6.283185482025146484375;
    float _1414 = sin(_1412);
    float _1416 = _1328 * 6.283185482025146484375;
    float _1418 = cos(_1416);
    int _1420 = int(_1318) + int(_1398);
    int _1422 = _1290 * _1420;
    int _1424 = _1422 + _1280;
    float _1426 = _1344 * 6.283185482025146484375;
    float _1428 = cos(_1426);
    float _1430 = _1414 * _1362;
    float _1432 = _1414 * _1374;
    bool _1434 = uint(_1424) >= uint(_379);
    bool _1436 = !_1404;
    int _1438 = _1436 ? 0 : (-1);
    bool _1440 = !_1434;
    int _1442 = _1440 ? 0 : (-1);
    float _1444 = _1344 * 6.283185482025146484375;
    float _1446 = sin(_1444);
    float _1448 = _1418 * _1374;
    float _1450 = _1418 * _1362;
    int _1452 = ~_1420;
    int _1454 = _1452 + _1442;
    int _1456 = _1454 + 1;
    int _1458 = ~_1370;
    int _1460 = _1458 + _1438;
    int _1462 = _1460 + 1;
    float _1464 = _1414 * _1428;
    float _1466 = _1374 * _1428;
    float _1468 = _1418 * _1428;
    float _1470 = _1362 * _1428;
    float _1472 = fma(_1406, _1406, 1.0);
    int _1474 = _379 * _1456;
    int _1476 = _1474 + _1280;
    float _1478 = _1468 * _1408;
    int _1480 = _379 * _1462;
    int _1482 = _1480 + _1160;
    float _1484 = rsqrt(_1472);
    float _1486 = fma(_1446, _1448, _1430);
    float _1488 = fma(_1446, _1430, _1448);
    float _1490 = -_1450;
    float _1492 = fma(_1446, _1432, _1490);
    float _1494 = -_1432;
    float _1496 = fma(_1446, _1450, _1494);
    float _1498 = -_1408;
    float _1500 = _1446 * _1498;
    float _1502 = _1464 * _1408;
    float _1504 = fma(_1486, _1410, _1478);
    float _1506 = _1486 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1508 = -_1406;
    float _1510 = _1446 * _1508;
    float _1512 = fma(_1466, _1410, _1500);
    float _1514 = fma(_1492, _1410, _1502);
    float _1516 = fma(_1496, _1392, _1504);
    float _1518 = fma(_1466, _1354, _1510);
    float _1520 = fma(_1470, _1392, _1512);
    bool _1522 = !_1190;
    int _1524 = _1522 ? _1476 : (-1);
    float _1526 = _1406 * _1484;
    float _1528 = _1470 + _1518;
    float _1530 = fma(_1488, _1392, _1514);
    float _1532 = _1486 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1534 = -_1526;
    float _1536 = _1470 * _1534;
    float _1538 = _1468 * _1406;
    float _1540 = _1464 * _1406;
    int _1542 = _1524 & 3;
    bool _1544 = _1542 != 0;
    float _1546 = -_1446;
    float _1548 = fma(_1546, _1484, _1536);
    float _1550 = fma(_1486, _1354, _1538);
    int _1552 = _1524 >> 31;
    float _1554 = fma(_1492, _1354, _1540);
    float _1556 = -_1526;
    float _1558 = _1488 * _1556;
    float _1560 = -_1526;
    float _1562 = _1496 * _1560;
    int _1564 = _1552 & 3;
    float _1566 = _1496 + _1550;
    float _1568 = fma(_1464, _1484, _1558);
    float _1570 = _1488 + _1554;
    int _1572 = _1524 + _1564;
    float _1574 = fma(_1468, _1484, _1562);
    float _1576 = _1486 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    bool _1578 = uint(_1542) > 1u;
    float _1580 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1582 = _1572 >> 2;
    float _1584 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1586 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1576);
    bool _1588 = uint(_1542) >= 2u;
    float _1590 = fma(_1520, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1580);
    int _1592 = _1582 << 4;
    int _1594 = _1592 + 656;
    float _1596 = _1516 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1598 = fma(_1520, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1584);
    float _1600 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1532);
    uint _1602 = uint(int(uint(_1594) >> uint(2)));
    uint _1604 = uint(int(uint(int(_1602)) >> uint(2)));
    int _1606 = int(_1602) & 3;
    float _1608 = (*spvDescriptorSet0.vp_c9)._m0[int(_1604)][_1606];
    int _1610 = int(_1602) + 1;
    uint _1612 = uint(int(uint(_1610) >> uint(2)));
    int _1614 = _1610 & 3;
    float _1616 = (*spvDescriptorSet0.vp_c9)._m0[int(_1612)][_1614];
    float _1618 = fma(_1520, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1596);
    float _1620 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1598);
    float _1622 = fma(_1466, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1506);
    int _1624 = _1544 ? 0 : 1;
    float _1626 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1618);
    float _1628 = _1244 + _1620;
    bool _1630 = _1542 != 3;
    int _1632 = _1594 + 8;
    uint _1634 = uint(int(uint(_1632) >> uint(2)));
    uint _1636 = uint(int(uint(int(_1634)) >> uint(2)));
    int _1638 = int(_1634) & 3;
    float _1640 = (*spvDescriptorSet0.vp_c9)._m0[int(_1636)][_1638];
    int _1642 = int(_1634) + 1;
    uint _1644 = uint(int(uint(_1642) >> uint(2)));
    int _1646 = _1642 & 3;
    float _1648 = (*spvDescriptorSet0.vp_c9)._m0[int(_1644)][_1646];
    float _1650 = _1176 + _1626;
    float _1652 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1654 = _1628 + _1652;
    int _1656 = _1588 ? 0 : 1;
    float _1658 = _1566 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1660 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1662 = _1650 + _1660;
    float _1664 = _1654 * _1654;
    int _1666 = ~_1624;
    int _1668 = _1666 + 1;
    int _1670 = _1668 + 1;
    float _1672 = fma(_1528, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1658);
    float _1674 = _1662 * _1662;
    int _1676 = _1524 & 3;
    bool _1678 = _1676 != 0;
    float _1680 = _1566 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1682 = _1670;
    float _1684 = _1674;
    float _1686 = _1568;
    if (!_1578)
    {
        int _1688 = ~_1624;
        int _1690 = _1688 + 1;
        _1682 = _1690;
    }
    int _1692 = _1682;
    float _1694 = _1674 + _1664;
    bool _1696 = !_1678;
    int _1698 = _1696 ? 0 : 1;
    float _1700 = _1566 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    int _1702 = abs(_1692);
    float _1704 = sqrt(_1694);
    int _1706 = abs(_1698);
    float _1708 = fma(_1530, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1590);
    int _1710 = ~_1656;
    int _1712 = _1710 + 1;
    int _1714 = _1712 + 1;
    int _1716 = _1714;
    if (_1630)
    {
        int _1718 = ~_1656;
        int _1720 = _1718 + 1;
        _1716 = _1720;
    }
    int _1722 = _1716;
    float _1724 = fma(_1528, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1680);
    float _1726 = fma(_1528, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1700);
    int _1728 = ~_1702;
    int _1730 = _1728 + 1;
    int _1732 = _1730 + 1;
    int _1734 = abs(_1722);
    int _1736 = ~_1706;
    int _1738 = _1736 + 1;
    int _1740 = _1738 + 1;
    bool _1742 = _1542 != 3;
    float _1744 = _1254 + _1708;
    bool _1746 = _1704 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1748 = _1732 * as_type<int>(_1616);
    bool _1750 = !_337;
    int _1752 = _1750 ? 0 : 1;
    int _1754 = ~_1734;
    int _1756 = _1754 + 1;
    int _1758 = _1756 + 1;
    int _1760 = _1740 * as_type<int>(_1608);
    int _1762 = _1760 + _1748;
    bool _1764 = !_1742;
    float _1766 = _1764 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    int _1768 = abs(_1752);
    int _1770 = _1758 * as_type<int>(_1640);
    int _1772 = _1770 + _1762;
    int _1774 = abs(as_type<int>(_1766));
    float _1776 = _1766;
    float _1778 = as_type<float>(_1768);
    float _1780 = as_type<float>(_1774);
    float _1782 = as_type<float>(_1762);
    if (!_1746)
    {
        _1776 = _1664;
    }
    float _1784 = _1776;
    float _1786 = _1784;
    if (!_1746)
    {
        _1778 = _1650;
    }
    float _1788 = _1778;
    float _1790 = _1788;
    if (!_1746)
    {
        _1780 = _1628;
    }
    float _1792 = _1780;
    int _1794 = ~_1774;
    int _1796 = _1794 + 1;
    int _1798 = _1796 + 1;
    float _1800 = _1792;
    if (!_1746)
    {
        _1782 = _1744;
    }
    float _1802 = _1782;
    bool _1804 = !_1746;
    float _1806 = _1802;
    if (!_1804)
    {
        float _1808 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1810 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1812 = _1704 + _1810;
        float _1814 = rsqrt(_1694);
        float _1816 = _1812 * _1808;
        float _1818 = _1744 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1820 = _1816 * 0.15915493667125701904296875;
        float _1822 = _1820 * 6.283185482025146484375;
        float _1824 = sin(_1822);
        float _1826 = _1820 * 6.283185482025146484375;
        float _1828 = cos(_1826);
        float _1830 = fma(_1824, _1818, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1832 = _1814 * _1830;
        float _1834 = _1828 + (-1.0);
        float _1836 = fma(_1662, _1832, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1838 = fma(_1654, _1832, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1840 = _1834 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1842 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1844 = _1836 + _1842;
        float _1846 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1848 = _1838 + _1846;
        float _1850 = fma(_1744, _1828, _1840);
        float _1852 = _1844 * _1844;
        float _1854 = _1848 * _1848;
        _1806 = _1850;
        _1684 = _1852;
        _1786 = _1854;
        _1800 = _1838;
        _1790 = _1836;
    }
    float _1856 = _1806;
    float _1858 = _1684;
    float _1860 = _1786;
    float _1862 = _1800;
    float _1864 = _1790;
    float _1866 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1868 = _1856 + _1866;
    int _1870 = _1798 * as_type<int>(_1648);
    int _1872 = _1870 + _1772;
    int _1874 = ~_1768;
    int _1876 = _1874 + 1;
    int _1878 = _1876 + 1;
    float _1880 = _1574 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _1882 = fma(_1868, _1868, _1858);
    bool _1884 = !_1190;
    int _1886 = _1884 ? _1482 : (-1);
    float _1888 = _1574 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1890 = _1878 * _1872;
    float _1892 = _1882 + _1860;
    float _1894 = _1574 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _1896 = -_579;
    float _1898 = _1896 + 1.0;
    int _1900 = _1886 * _1768;
    int _1902 = _1900 + _1890;
    float _1904 = fma(_1548, (*spvDescriptorSet0.vp_c10)._m0[8].x, _1880);
    float _1906 = fma(_1548, (*spvDescriptorSet0.vp_c10)._m0[9].x, _1888);
    float _1908 = sqrt(_1892);
    float _1910 = fma(_1548, (*spvDescriptorSet0.vp_c10)._m0[10].x, _1894);
    float _1912 = -_583;
    float _1914 = _1912 + 1.0;
    float _1916 = -_1898;
    float _1918 = fma(_1018, _1916, _1348);
    float _1920 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1586);
    float _1922 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1600);
    float _1924 = fma(_1492, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1622);
    float _1926 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1672);
    float _1928 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1724);
    float _1930 = fma(_1024, _1914, _1382);
    float _1932 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1904);
    float _1934 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1906);
    float _1936 = fma(_1568, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1910);
    float _1938 = float(_1902);
    float _1940 = fma(_1570, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1726);
    out.m_66.x = _1918;
    out.m_66.y = _1930;
    bool _1942 = _1908 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1944 = isnan(_1908);
    bool _1946 = _1942 || _1944;
    bool _1948 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1950 = _1946 || _1948;
    out.m_68.x = _1920;
    out.m_68.y = _1922;
    out.m_68.z = _1924;
    out.m_70.x = _1932;
    out.m_70.y = _1934;
    out.m_70.z = _1936;
    out.m_72.z = _1938;
    float _1952 = _1864;
    float _1954 = _1934;
    if (!_1950)
    {
        _1686 = 1.0;
    }
    float _1956 = _1686;
    out.m_74.x = _1926;
    out.m_74.y = _1928;
    out.m_74.z = _1940;
    bool _1958 = !_1950;
    float _1960 = _1956;
    if (!_1958)
    {
        bool _1962 = _1908 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1964 = isnan(_1908);
        bool _1966 = _1962 || _1964;
        bool _1968 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1970 = _1966 || _1968;
        if (!_1970)
        {
            float _1972 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1974 = _1908 + _1972;
            float _1976 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1978 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1976;
            float _1980 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1982 = _1980 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1984 = 1.0 / _1978;
            float _1986 = _1974 * _1984;
            float _1988 = fma(_1986, _1982, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1960 = _1988;
            _1990 = true;
        }
        else
        {
            bool _1992 = _1908 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1994 = isnan(_1908);
            bool _1996 = _1992 || _1994;
            bool _1998 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2000 = _1996 || _1998;
            if (!_2000)
            {
                float _2002 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2004 = _1908 + _2002;
                float _2006 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2008 = _2006 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2010 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2012 = _2010 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2014 = 1.0 / _2008;
                float _2016 = _2004 * _2014;
                float _2018 = fma(_2016, _2012, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1960 = _2018;
                _1990 = true;
            }
            else
            {
                _1960 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1990 = false;
    float _2020 = _1960;
    float _2022 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2026 = _1856 + _2024;
    float _2028 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2022);
    float _2030 = _1254 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    bool _2032 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2034 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2036 = _2032 || _2034;
    bool _2038 = isnan(0.5);
    bool _2040 = _2036 || _2038;
    float _2042 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2044 = _1862 + _2042;
    float _2046 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2028);
    bool _2048 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2050 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2052 = _2048 || _2050;
    bool _2054 = isnan(0.5);
    bool _2056 = _2052 || _2054;
    float _2058 = fma(_1176, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2030);
    float _2060 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2062 = _1864 + _2060;
    float _2064 = _2046 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2066 = fma(_2026, _2020, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2068 = fma(_1244, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2058);
    float _2070 = fma(_2062, _2020, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2072 = 1.0 / _2064;
    float _2074 = fma(_2044, _2020, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2076 = _2068 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2078 = _2076 + _2064;
    float _2080 = _2062;
    float _2082 = _2046;
    float _2084 = _2076;
    float _2086 = _2070;
    if (_2056)
    {
        _2080 = _2070;
    }
    float _2088 = _2080;
    float _2090 = _2088;
    if (_2056)
    {
        _2082 = _2066;
    }
    float _2092 = _2082;
    float _2094 = _2092;
    if (_2056)
    {
        _2084 = _2074;
    }
    float _2096 = _2084;
    float _2098 = _2096;
    if (!_2056)
    {
        float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2102 = _1254 + _2100;
        float _2104 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _2106 = _1176 + _2104;
        float _2108 = -_1176;
        float _2110 = _2108 + _2070;
        float _2112 = -_1254;
        float _2114 = _2112 + _2066;
        float _2116 = _2102 * _2102;
        float _2118 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _2120 = _1244 + _2118;
        float _2122 = -_1244;
        float _2124 = _2122 + _2074;
        float _2126 = fma(_2106, _2106, _2116);
        float _2128 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2130 = fma(_2120, _2120, _2126);
        float _2132 = sqrt(_2130);
        float _2134 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        bool _2136 = _2132 > (*spvDescriptorSet0.vp_c9)._m0[199].x;
        bool _2138 = isnan(_2132);
        bool _2140 = _2136 || _2138;
        bool _2142 = isnan((*spvDescriptorSet0.vp_c9)._m0[199].x);
        bool _2144 = _2140 || _2142;
        float _2146 = precise::min(_2132, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2148 = _2146 * _2128;
        float _2150 = _2134 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2152 = _2150 * _2148;
        float _2154 = (*spvDescriptorSet0.vp_c15)._m0[660].y;
        float _2156 = _2128;
        float _2158 = _2132;
        float _2160 = _2152;
        float _2162 = _2150;
        _2086 = _2110;
        if (_2144)
        {
            float _2164 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].y;
            _2154 = _2164;
        }
        float _2166 = _2154;
        if (_2144)
        {
            float _2168 = precise::max(_2132, (*spvDescriptorSet0.vp_c9)._m0[199].y);
            _2156 = _2168;
        }
        float _2170 = _2156;
        float _2172 = fma(_2110, _2152, _1176);
        float _2174 = _2172;
        if (_2144)
        {
            float _2176 = _2170 * _2166;
            _2158 = _2176;
        }
        float _2178 = _2158;
        float _2180 = fma(_2114, _2152, _1254);
        float _2182 = fma(_2124, _2152, _1244);
        float _2184 = _2178;
        _1952 = _2180;
        if (_2144)
        {
            float _2186 = _2150 * _2178;
            _2160 = _2186;
        }
        float _2188 = _2160;
        if (!_2144)
        {
            _2184 = _2172;
        }
        float _2190 = _2184;
        float _2192 = _2190;
        if (!_2144)
        {
            _2162 = _2180;
        }
        float _2194 = _2162;
        float _2196 = _2194;
        if (_2144)
        {
            float _2198 = fma(_2110, _2188, _1176);
            _2192 = _2198;
        }
        float _2200 = _2192;
        _2090 = _2200;
        if (!_2144)
        {
            _2174 = _2182;
        }
        float _2202 = _2174;
        _2098 = _2202;
        if (_2144)
        {
            float _2204 = fma(_2114, _2188, _1254);
            _2196 = _2204;
        }
        float _2206 = _2196;
        _2094 = _2206;
        if (_2144)
        {
            float _2208 = fma(_2124, _2188, _1244);
            _2098 = _2208;
        }
    }
    float _2210 = _2094;
    float _2212 = _2090;
    float _2214 = _2098;
    float _2216 = _2086;
    float _2218 = _1952;
    float _2220 = _2218;
    float _2222 = _2216;
    if (_2040)
    {
        _2220 = 1.0;
    }
    float _2224 = _2220;
    float _2226 = _2078 * _2072;
    float _2228 = _2226 * 0.5;
    float _2230 = _2224;
    if (!_2040)
    {
        float _2232 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2234 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _2236 = fma(_2228, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2234);
        float _2238 = _2232 * 0.15915493667125701904296875;
        float _2240 = _2238 * 6.283185482025146484375;
        float _2242 = cos(_2240);
        float _2244 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2246 = _2244 * 0.15915493667125701904296875;
        float _2248 = _2238 * 6.283185482025146484375;
        float _2250 = sin(_2248);
        float _2252 = 1.0 / _2242;
        float _2254 = _2246 * 6.283185482025146484375;
        float _2256 = cos(_2254);
        float _2258 = _2250 * _2252;
        float _2260 = 1.0 / _2236;
        float _2262 = _2256 * _2258;
        float _2264 = _2246 * 6.283185482025146484375;
        float _2266 = sin(_2264);
        float _2268 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2270 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2268;
        float _2272 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2274 = _2260 * _2272;
        float _2276 = 1.0 / _2262;
        float _2278 = 1.0 / _2270;
        float _2280 = _2266 * _2276;
        float _2282 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2284 = fma(_2280, _2274, _2282);
        float _2286 = _2284 * _2278;
        float _2288 = precise::clamp(_2286, 0.0, 1.0);
        float _2290 = -_2288;
        float _2292 = _2290 + 1.0;
        _2222 = _2278;
        _1954 = _2246;
        _2230 = _2292;
    }
    float _2294 = _2222;
    float _2296 = _1954;
    float _2298 = _2230;
    float _2300 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2302 = _2210 + _2300;
    float _2304 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2306 = _2212 + _2304;
    float _2308 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2310 = _2214 + _2308;
    float _2312 = _2302 * _2302;
    float _2314 = fma(_2306, _2306, _2312);
    float _2316 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2318 = fma(_2310, _2310, _2314);
    float _2320 = rsqrt(_2318);
    float _2322 = _2320 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2324 = _2306 * _2322;
    float _2326 = _2310 * _2322;
    float _2328 = _2324 * _2324;
    float _2330 = _2326 * _2326;
    float _2332 = _2328 + _2330;
    float _2334 = sqrt(_2332);
    bool _2336 = _2334 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2338 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2340 = _2334 + _2338;
    float _2342 = _2294;
    float _2344 = _2296;
    float _2346 = _2340;
    float _2348 = _2302;
    float _2350 = _2324;
    if (_2336)
    {
        float _2352 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2342 = _2352;
    }
    float _2354 = _2342;
    if (_2336)
    {
        float _2356 = rsqrt(_2332);
        _2344 = _2356;
    }
    float _2358 = _2344;
    float _2360 = _2354;
    float _2362 = _2358;
    if (_2336)
    {
        float _2364 = _2340 * _2354;
        _2346 = _2364;
    }
    float _2366 = _2346;
    if (_2336)
    {
        float _2368 = _2366 * 0.15915493667125701904296875;
        _2360 = _2368;
    }
    float _2370 = _2360;
    float _2372 = _2320;
    float _2374 = _2370;
    if (_2336)
    {
        float _2376 = _2370 * 6.283185482025146484375;
        float _2378 = sin(_2376);
        _2372 = _2378;
    }
    float _2380 = _2372;
    float _2382 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2384 = precise::max(0.0, _2382);
    float _2386 = _2310;
    float _2388 = _2384;
    if (_2336)
    {
        float _2390 = _2370 * 6.283185482025146484375;
        float _2392 = cos(_2390);
        _2386 = _2392;
    }
    float _2394 = _2386;
    float _2396 = -_2322;
    float _2398 = -_2384;
    float _2400 = fma(_2302, _2396, _2398);
    float _2402 = _2400;
    if (_2336)
    {
        float _2404 = _2400 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2348 = _2404;
    }
    float _2406 = _2348;
    float _2408 = _2406;
    float _2410 = _2380;
    if (_2336)
    {
        float _2412 = fma(_2380, _2406, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2408 = _2412;
    }
    float _2414 = _2408;
    float _2416 = _2414;
    float _2418 = _2394;
    if (_2336)
    {
        float _2420 = _2394 + (-1.0);
        _2388 = _2420;
    }
    float _2422 = _2388;
    if (_2336)
    {
        float _2424 = _2358 * _2414;
        _2410 = _2424;
    }
    float _2426 = _2410;
    if (!_2336)
    {
        _2362 = _2326;
    }
    float _2428 = _2362;
    float _2430 = _2428;
    if (_2336)
    {
        float _2432 = _2422 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2374 = _2432;
    }
    float _2434 = _2374;
    if (_2336)
    {
        float _2436 = _2324 * _2426;
        _2350 = _2436;
    }
    float _2438 = _2350;
    float _2440 = sqrt(_2318);
    if (!_2336)
    {
        _2416 = _2328;
    }
    float _2442 = _2416;
    float _2444 = _2442;
    if (_2336)
    {
        float _2446 = fma(_2400, _2394, _2434);
        _2402 = _2446;
    }
    float _2448 = _2402;
    if (_2336)
    {
        float _2450 = _2326 * _2426;
        _2430 = _2450;
    }
    float _2452 = _2430;
    if (_2336)
    {
        float _2454 = _2438 * _2438;
        _2444 = _2454;
    }
    float _2456 = _2444;
    if (!_2336)
    {
        _2418 = _2330;
    }
    float _2458 = _2418;
    float _2460 = _2210 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2462 = _2458;
    if (_2336)
    {
        float _2464 = _2452 * _2452;
        _2462 = _2464;
    }
    float _2466 = _2462;
    float _2468 = fma(_2448, _2448, _2456);
    float _2470 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2460);
    float _2472 = _2210 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2474 = _2468 + _2466;
    float _2476 = _2210 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2478 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2470);
    float _2480 = _2210 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2482 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2484 = fma(_2440, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2482);
    float _2486 = precise::clamp(_2484, 0.0, 1.0);
    float _2488 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2476);
    float _2490 = rsqrt(_2474);
    float _2492 = _2478 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2494 = -_2486;
    float _2496 = _2494 + 1.0;
    float _2498 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2480);
    float _2500 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2488);
    float _2502 = fma(_2212, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2472);
    float _2504 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2498);
    float _2506 = abs(_2496);
    float _2508 = log2(_2506);
    float _2510 = _2492 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2512 = _2500 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2514 = _2504 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2516 = -_2510;
    float _2518 = fma(_2516, _2316, 1.0);
    float _2520 = fma(_2214, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2502);
    float _2522 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2524 = _2490 * _2438;
    float _2526 = _2490 * _2448;
    float _2528 = _2490 * _2452;
    float _2530 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2522);
    float _2532 = _2524 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2534 = _2520 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2536 = log2(_2518);
    float _2538 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2530);
    float _2540 = -_2532;
    float _2542 = fma(_2526, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2540);
    float _2544 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2546 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2548 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2538);
    float _2550 = -_2528;
    float _2552 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2542);
    float _2554 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2556 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2546);
    float _2558 = exp2(_2544);
    float _2560 = fma(_2552, -0.5, 0.5);
    float _2562 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2554);
    float _2564 = fma(_2552, 0.5, 0.5);
    float _2566 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2556);
    float _2568 = _2526 + 1.0;
    float _2570 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2562);
    float _2572 = fma(_2564, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2574 = 1.0 / _2548;
    float _2576 = _2536 * 0.693147182464599609375;
    float _2578 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2570);
    float _2580 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2566);
    float _2582 = fma(_2564, _2572, -0.212114393711090087890625);
    float _2584 = _2576 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2586 = sqrt(_2560);
    float _2588 = -_2526;
    float _2590 = fma(_2558, _2568, _2588);
    float _2592 = fma(_2564, _2582, 1.570728778839111328125);
    float _2594 = fma(_2590, 0.5, 0.5);
    float _2596 = _2578 * _2574;
    float _2598 = _2580 * _2574;
    float _2600 = fma(_2596, 0.5, 0.5);
    float _2602 = fma(_2598, -0.5, 0.5);
    float _2604 = _2586 * 0.636619746685028076171875;
    float3 _6985 = float3(_2600, _2602, _2584);
    float _2606 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6985, float3(0.0), isnan(_6985)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6985, float3(0.0), isnan(_6985)), level(0.0)).x;
    float _2608 = -_2592;
    float _2610 = fma(_2604, _2608, 1.0);
    float3 _7001 = float3(_2600, _2602, _2584);
    float4 _2613 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_7001, float3(0.0), isnan(_7001)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_7001, float3(0.0), isnan(_7001)), level(0.0)).xyzw;
    float _2615 = _2613.x;
    float _2617 = _2613.y;
    float _2619 = _2613.z;
    float _2621 = _2613.w;
    float2 _7018 = float2(_2610, _2594);
    float3 _2625 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_7018, float2(0.0), isnan(_7018)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_7018, float2(0.0), isnan(_7018)), level(0.0)).xyz;
    float _2627 = _2625.x;
    float _2629 = _2625.y;
    float _2631 = _2625.z;
    float _2633 = _2508 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2635 = _2512 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_76.x = _2212;
    out.m_76.y = _2210;
    out.m_76.z = _2214;
    bool _2637 = _2440 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2639 = isnan(_2440);
    bool _2641 = _2637 || _2639;
    bool _2643 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2645 = _2641 || _2643;
    float _2647 = fma(_2514, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2635);
    float _2649 = exp2(_2633);
    float _2651 = fma(_2492, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2647);
    float _2653 = fma(_2534, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2651);
    float _2655 = _2653 + _2548;
    out.gl_Position.x = _2578;
    out.gl_Position.y = _2580;
    out.gl_Position.z = _2653;
    out.gl_Position.w = _2548;
    float _2657 = _2655 * 0.5;
    float _2659 = -_2649;
    float _2661 = _2659 + 1.0;
    float _2663 = _2661 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_78.z = _2657;
    out.m_78.w = _2548;
    float _2665 = _2298 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2667 = _2653;
    float _2669 = _2578;
    float _2671 = _2580;
    float _2673 = _2548;
    float _2675 = _2657;
    float _2677 = _2663;
    if (!_2645)
    {
        _2667 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2679 = _2667;
    float _2681 = _2679;
    float _2683 = _2679;
    if (!_2645)
    {
        _2669 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2685 = _2669;
    float _2687 = _2685;
    float _2689 = _2685;
    if (!_2645)
    {
        _2671 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2691 = _2671;
    float _2693 = _2691;
    float _2695 = _2691;
    if (!_2645)
    {
        _2673 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2697 = _2673;
    float _2699 = _2697;
    float _2701 = _2697;
    if (!_2645)
    {
        _2675 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2703 = _2675;
    float _2705 = _2663 * _2606;
    float _2707 = -_2663;
    float _2709 = _2707 + 1.0;
    float _2711 = _2703;
    float _2713 = _2703;
    if (!_2645)
    {
        _2677 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2715 = _2677;
    float _2717 = _2621 * _2705;
    float _2719 = _2621 * _2709;
    float _2721 = _2631 * _2705;
    float _2723 = fma(_2627, _2717, _2615);
    float _2725 = fma(_2629, _2717, _2617);
    float _2727 = fma(_2621, _2721, _2619);
    out.m_80.x = _2723;
    out.m_80.y = _2725;
    out.m_80.z = _2727;
    out.m_80.w = _2719;
    bool _2729 = !_2645;
    float _2731 = _2715;
    float _2733 = _2715;
    if (!_2729)
    {
        bool _2735 = _2440 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2737 = isnan(_2440);
        bool _2739 = _2735 || _2737;
        bool _2741 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2743 = _2739 || _2741;
        if (!_2743)
        {
            float _2745 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2747 = _2440 + _2745;
            float _2749 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2751 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2749;
            float _2753 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2755 = _2753 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2757 = 1.0 / _2751;
            float _2759 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2761 = _2759 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2763 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2765 = _2763 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2767 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2769 = _2767 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2771 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2773 = _2771 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2775 = _2747 * _2757;
            float _2777 = precise::clamp(_2775, 0.0, 1.0);
            float _2779 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2781 = _2779 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2783 = fma(_2777, _2755, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2785 = fma(_2777, _2781, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2787 = fma(_2777, _2761, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2789 = fma(_2777, _2765, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2791 = fma(_2777, _2769, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2793 = fma(_2777, _2773, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2689 = _2787;
            _2701 = _2791;
            _2683 = _2783;
            _2733 = _2789;
            _2695 = _2785;
            _2713 = _2793;
            _2795 = true;
        }
        else
        {
            bool _2797 = _2440 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2799 = isnan(_2440);
            bool _2801 = _2797 || _2799;
            bool _2803 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2805 = _2801 || _2803;
            if (!_2805)
            {
                _2681 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2807 = _2681;
            _2683 = _2807;
            if (!_2805)
            {
                _2687 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2809 = _2687;
            _2689 = _2809;
            if (!_2805)
            {
                _2693 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2811 = _2693;
            _2695 = _2811;
            if (!_2805)
            {
                _2731 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2813 = _2731;
            _2733 = _2813;
            if (!_2805)
            {
                _2699 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2815 = _2699;
            _2701 = _2815;
            if (!_2805)
            {
                _2711 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2817 = _2711;
            bool _2819 = !_2805;
            _2713 = _2817;
            if (!_2819)
            {
                bool _2821 = _2440 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2823 = isnan(_2440);
                bool _2825 = _2821 || _2823;
                bool _2827 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2829 = _2825 || _2827;
                if (!_2829)
                {
                    float _2831 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2833 = _2440 + _2831;
                    float _2835 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2837 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2835;
                    float _2839 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2841 = _2839 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2843 = 1.0 / _2837;
                    float _2845 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2847 = _2845 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2849 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2851 = _2849 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2853 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2855 = _2853 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2857 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2859 = _2857 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2861 = _2833 * _2843;
                    float _2863 = precise::clamp(_2861, 0.0, 1.0);
                    float _2865 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2867 = _2865 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2869 = fma(_2863, _2841, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2871 = fma(_2863, _2867, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2873 = fma(_2863, _2847, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2875 = fma(_2863, _2851, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2877 = fma(_2863, _2855, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2879 = fma(_2863, _2859, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2689 = _2873;
                    _2701 = _2877;
                    _2683 = _2869;
                    _2733 = _2875;
                    _2695 = _2871;
                    _2713 = _2879;
                    _2795 = true;
                }
                else
                {
                    _2689 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2701 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2683 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2733 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2695 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2713 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2795 = false;
    float _2881 = _2689;
    float _2883 = _2701;
    float _2885 = _2683;
    float _2887 = _2733;
    float _2889 = _2695;
    float _2891 = _2713;
    float _2893 = fma(_1928, -0.5, 0.5);
    float _2895 = precise::clamp(_2893, 0.0, 1.0);
    float _2897 = -_2881;
    float _2899 = _2897 + _2883;
    float _2901 = _2665 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2903 = -_2885;
    float _2905 = _2903 + _2887;
    out.m_82.x = 0.0;
    float _2907 = fma(_2895, _2899, _2881);
    float _2909 = -_2889;
    float _2911 = _2909 + _2891;
    out.m_49.x = _2901;
    float _2913 = fma(_2895, _2905, _2885);
    float _2915 = _2907 * 0.586610972881317138671875;
    bool _2917 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2919 = fma(_2895, _2911, _2889);
    float _2921 = fma(_2913, 0.298911988735198974609375, _2915);
    bool _2923 = _2298 > 0.0;
    bool _2925 = isnan(_2298);
    bool _2927 = _2923 || _2925;
    bool _2929 = isnan(0.0);
    bool _2931 = _2927 || _2929;
    float _2933 = fma(_2919, 0.114477999508380889892578125, _2921);
    float _2935 = -_2933;
    float _2937 = _2913 + _2935;
    float _2939 = -_2933;
    float _2941 = _2907 + _2939;
    float _2943 = -_2933;
    float _2945 = _2919 + _2943;
    float _2947 = fma(_2937, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2933);
    float _2949 = fma(_2941, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2933);
    float _2951 = fma(_2945, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2933);
    bool _2953 = !_2917;
    if (!_2953)
    {
        float _2955 = -_2210;
        float _2957 = _2955 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2959 = -_2212;
        float _2961 = _2959 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2963 = -_2214;
        float _2965 = _2963 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2967 = _2957 * _2957;
        float _2969 = fma(_2961, _2961, _2967);
        float _2971 = fma(_2965, _2965, _2969);
        float _2973 = sqrt(_2971);
        float _2975 = rsqrt(_2971);
        float _2977 = -_2973;
        float _2979 = _2977 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2981 = _2979 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2983 = precise::clamp(_2981, 0.0, 1.0);
        float _2985 = _2961 * _2975;
        float _2987 = _2957 * _2975;
        float _2989 = abs(_2983);
        float _2991 = log2(_2989);
        float _2993 = _2965 * _2975;
        float _2995 = _2985 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2997 = _1928 * _2987;
        float _2999 = -_2987;
        float _3001 = -_2995;
        float _3003 = fma(_2999, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3001);
        float _3005 = fma(_1926, _2985, _2997);
        float _3007 = -_2993;
        float _3009 = fma(_3007, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3003);
        float _3011 = fma(_1940, _2993, _3005);
        float _3013 = precise::clamp(_3011, 0.0, 1.0);
        float _3015 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3017 = _3009 + _3015;
        float _3019 = _2991 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3021 = _3017 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3023 = precise::clamp(_3021, 0.0, 1.0);
        float _3025 = exp2(_3019);
        float _3027 = _3025 * _3023;
        float _3029 = _3013 * _3027;
        float _3031 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3033 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3035 = _3029 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_82.x = _3031;
        out.m_82.y = _3033;
        out.m_82.z = _3035;
    }
    out.m_84.x = _2947;
    out.m_84.y = _2949;
    out.m_84.z = _2951;
    if (_2931)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_49.x = 0.0;
    float _3037 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3037;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_58.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_58.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_58.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_58.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_49.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_49.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_49.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_49.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

