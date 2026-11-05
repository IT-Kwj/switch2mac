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
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_28 [[id(6)]];
    sampler vp_t_tcb_28Smplr [[id(7)]];
    texture2d<float> vp_t_tcb_24 [[id(8)]];
    sampler vp_t_tcb_24Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_32 [[id(10)]];
    sampler vp_t_tcb_32Smplr [[id(11)]];
    texture3d<float> vp_t_tcb_30 [[id(12)]];
    sampler vp_t_tcb_30Smplr [[id(13)]];
    texture2d<float> vp_t_tcb_1C [[id(14)]];
    sampler vp_t_tcb_1CSmplr [[id(15)]];
    sampler vp_t_tcb_28Smplr_w [[id(16)]];
    sampler vp_t_tcb_24Smplr_w [[id(17)]];
    sampler vp_t_tcb_32Smplr_w [[id(18)]];
    sampler vp_t_tcb_30Smplr_w [[id(19)]];
    sampler vp_t_tcb_1CSmplr_w [[id(20)]];
    constant dm_border_t* dm_border [[id(21)]];
};

struct main0_out
{
    float4 m_62 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_72 [[user(locn2)]];
    float4 m_78 [[user(locn3)]];
    float4 m_86 [[user(locn4)]];
    float4 m_51 [[user(locn5)]];
    float4 m_76 [[user(locn6)]];
    float4 m_84 [[user(locn7)]];
    float4 m_80 [[user(locn8)]];
    float4 m_82 [[user(locn9)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(0)]];
    float4 m_64 [[attribute(1)]];
    float4 m_66 [[attribute(3)]];
    float4 m_70 [[attribute(4)]];
    float4 m_48 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_58 [[attribute(7)]];
    float4 m_60 [[attribute(8)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2376 = false;
    bool _507 = false;
    bool _395 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2681 = as_type<float>(_121);
        out.gl_Position.z = _2681;
    }
    if (!_109)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_53.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2750 = as_type<float>(_159);
        out.gl_Position.z = _2750;
    }
    if (_153)
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
    float _199;
    if (!_181)
    {
        float _183 = in.m_58.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_105);
        float _205 = 1.0 / _203;
        float _207 = _139 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = _209 + _215;
    bool _219 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _221 = isnan(_209);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _209 + _243;
    float _247 = 1.0 / _237;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = 1.0 / _233;
    float _253 = 1.0 / _241;
    float _255 = _245 * _247;
    bool _257 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _259 = isnan(_209);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = _213 * _251;
    bool _271 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_209);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -_229;
    float _285 = _283 + 1.0;
    float _287 = _281 * _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _293 = _217 * _253;
    bool _295 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_209);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -_281;
    float _309 = _307 + 1.0;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = _305 * _309;
    float _325 = -_305;
    float _327 = _325 + 1.0;
    float _329 = fma(_313, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = fma(_317, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = fma(_291, _255, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _335 = _267 * _327;
    float _337 = fma(_321, _255, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = -_267;
    float _341 = _339 + 1.0;
    float _343 = _329 * _335;
    float _345 = _331 * _335;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _351;
    float _355 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _345);
    float _359 = fma(_349, _293, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _361 = fma(_353, _293, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _363 = fma(_333, _323, _355);
    float _365 = fma(_337, _323, _357);
    float _367 = fma(_359, _287, _363);
    float _369 = fma(_361, _287, _365);
    float _371 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].x, _367);
    float _373 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].y, _369);
    bool _375 = !_249;
    float _393;
    if (!_375)
    {
        float _377 = in.m_58.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _385 = _383 * _379;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _393 = _391;
        _395 = true;
    }
    else
    {
        float _397 = float(_105);
        float _399 = 1.0 / _397;
        float _401 = _139 * _399;
        _393 = _401;
    }
    _395 = false;
    float _403 = _393;
    float _405 = in.m_60.x;
    float _407 = in.m_60.y;
    bool _409 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _411 = isnan(_403);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _425 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _427 = isnan(_403);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _403 + _441;
    float _445 = -_419;
    float _447 = _445 + 1.0;
    bool _449 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _451 = 1.0 / _423;
    float _453 = _435 * _447;
    float _455 = -_435;
    float _457 = _455 + 1.0;
    float _459 = _373 * _407;
    float _461 = _371 * _405;
    float _463 = _439 * _451;
    float _465 = fma(_463, _443, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _469 = _465 * _453;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _473 = _467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _475 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[115].x, _469);
    float _477 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[116].x, _475);
    float _479 = _471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _483 = _477 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _485 = _481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _479;
    out.m_62.y = _473;
    out.m_62.z = _485;
    out.m_62.w = _483;
    bool _487 = !_449;
    float _505;
    if (!_487)
    {
        float _489 = in.m_58.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        float _509 = float(_105);
        float _511 = 1.0 / _509;
        float _513 = _139 * _511;
        _505 = _513;
    }
    _507 = false;
    float _515 = _505;
    float _517 = in.m_58.x;
    float _519 = in.m_58.y;
    float _521 = in.m_58.z;
    float _523 = in.m_58.w;
    float _525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _527 = in.m_48.x;
    float _529 = in.m_48.y;
    float _531 = in.m_48.z;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _535 = _533 != 0;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _539 = _537 != 0;
    float _541 = in.m_64.x;
    float _543 = in.m_64.y;
    float _545 = in.m_64.z;
    float _547 = in.m_64.w;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _551 = _549 != 0;
    float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _557 = _555 != 0;
    float _559 = in.m_66.x;
    float _561 = in.m_66.y;
    float _563 = in.m_66.z;
    float _565 = in.m_66.w;
    float _567 = in.m_68.y;
    float _569 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _571 = log2(_569);
    bool _573 = _517 > 0.5;
    float _575 = _521 * 2.0;
    bool _577 = _523 > 0.5;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _581 = _519 > 0.5;
    float _583 = floor(_575);
    float _585 = -_175;
    int _587 = _573 ? as_type<int>(_585) : as_type<int>(_175);
    float _589 = _529 * _543;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _593 = _591 != 0;
    float _595 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[78].w, _579);
    float _597 = -_179;
    int _599 = _577 ? as_type<int>(_597) : as_type<int>(_179);
    float _601 = _571 * _139;
    float _603 = -_179;
    int _605 = _581 ? as_type<int>(_603) : as_type<int>(_179);
    float _607 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _595);
    bool _609 = !_535;
    float _611 = _609 ? _175 : as_type<float>(_587);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _627 = _625 != 0;
    float _629 = _529 * _561;
    float _631 = _529 + _567;
    float _633 = fma(_527, _541, _589);
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _637 = _517 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _639 = fma(_527, _559, _629);
    float _641 = 1.0 / _615;
    float _643 = -_635;
    float _645 = fma(_637, 2.0, _643);
    float _647 = _517 * 2.0;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _651 = _519 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _653;
    float _657 = fma(_531, _563, _639);
    float _659 = fma(_531, _545, _633);
    float _661 = floor(_647);
    float _663 = fma(_651, -2.0, _649);
    bool _665 = !_539;
    float _667 = _665 ? _179 : as_type<float>(_605);
    float _669 = _519 + _521;
    bool _671 = _521 > 0.5;
    float _673 = _519 + _517;
    float _675 = _655 * _641;
    bool _677 = !_557;
    float _679 = _677 ? _179 : as_type<float>(_599);
    float _681 = _669 + (-1.0);
    float _683 = -_175;
    int _685 = _671 ? as_type<int>(_683) : as_type<int>(_175);
    float _687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _689 = _583 >= 0.0;
    bool _691 = isnan(_583);
    bool _693 = _689 || _691;
    bool _695 = isnan(0.0);
    bool _697 = _693 || _695;
    float _699 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _701 = _583 > 0.0;
    float _703 = _519 * 2.0;
    float _705 = _697 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _707 = _673 + (-1.0);
    bool _709 = !_551;
    float _711 = _709 ? _175 : as_type<float>(_685);
    float _713 = floor(_703);
    bool _715 = _661 > 0.0;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _719 = _515 + _717;
    bool _721 = _661 >= 0.0;
    bool _723 = isnan(_661);
    bool _725 = _721 || _723;
    bool _727 = isnan(0.0);
    bool _729 = _725 || _727;
    float _731 = -_139;
    float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[76].x, _645);
    float _735 = fma(_675, _719, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _737 = _681;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _741 = _705;
    if (!_593)
    {
        _737 = _521;
    }
    float _743 = _737;
    float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _747 = _743;
    if (_593)
    {
        _747 = _519;
    }
    float _749 = _747;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _753 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _755 = isnan(_515);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _663);
    float _767 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[83].w, _751);
    bool _769 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _771 = isnan(_515);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = -_763;
    float _783 = _781 + 1.0;
    if (!_593)
    {
        _739 = _521;
    }
    float _785 = _739;
    float _787 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _789 = ~as_type<int>(_705);
    int _791 = _789 + 1;
    int _793 = _791 + 1;
    float _795 = _779 * _783;
    int _797 = _793;
    float _799 = _785;
    if (!_701)
    {
        int _801 = ~as_type<int>(_705);
        int _803 = _801 + 1;
        _797 = _803;
    }
    int _805 = _797;
    float _807 = _659 + _547;
    if (!_593)
    {
        _741 = _519;
    }
    float _809 = _741;
    float _811 = _735 * _795;
    float _813 = _809;
    if (_593)
    {
        _813 = _517;
    }
    float _815 = _813;
    float _817 = _745 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_593)
    {
        _799 = _519;
    }
    float _819 = _799;
    float _821 = -_779;
    float _823 = _821 + 1.0;
    bool _825 = _713 > 0.0;
    float _827 = _657 + _565;
    bool _829 = _713 >= 0.0;
    bool _831 = isnan(_713);
    bool _833 = _829 || _831;
    bool _835 = isnan(0.0);
    bool _837 = _833 || _835;
    float _839 = _687 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _841 = _611 + 0.5;
    float _843 = _819 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _845 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _767);
    float _847 = fma(_839, _841, _733);
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _851 = -_845;
    float _853 = _851 + 1.0;
    int _855 = _729 ? 0 : 1;
    float _857 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[83].z, _849);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _861 = _667 + (-0.5);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _865 = _815 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _867 = fma(_843, -2.0, _859);
    float _869 = -_817;
    float _871 = -_765;
    float _873 = fma(_869, _861, _871);
    float _875 = _525 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _877 = _837 ? 0 : 1;
    float _879 = -_863;
    float _881 = fma(_865, 2.0, _879);
    float _883 = _553 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _885 = _679 + (-0.5);
    float _887 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _867);
    float _889 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[131].x, _811);
    int _891 = ~_877;
    int _893 = _891 + 1;
    int _895 = _893 + 1;
    float _897 = _711 + 0.5;
    int _899 = _895;
    float _901 = _827;
    if (!_825)
    {
        int _903 = ~_877;
        int _905 = _903 + 1;
        _899 = _905;
    }
    int _907 = _899;
    float _909 = -_139;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[81].x, _881);
    float _913 = -_883;
    float _915 = -_887;
    float _917 = fma(_913, _885, _915);
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _921 = _631 + _919;
    float _923 = fma(_875, _897, _911);
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _927 = _807 + _925;
    float _929 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _857);
    float _931 = _921 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _935 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[132].x, _889);
    float _937 = -_929;
    float _939 = _937 + 1.0;
    float _941 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[28].x, _931);
    float _943 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[78].z, _933);
    bool _945 = !_619;
    int _947 = _945 ? 0 : 1;
    float _949 = -_939;
    float _951 = fma(_711, _949, _923);
    bool _953 = !_623;
    int _955 = _953 ? 0 : 1;
    float _957 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _943);
    int _959 = ~_855;
    int _961 = _959 + 1;
    int _963 = _961 + 1;
    float _965 = fma(_679, _853, _917);
    int _967 = _963;
    if (!_715)
    {
        int _969 = ~_855;
        int _971 = _969 + 1;
        _967 = _971;
    }
    int _973 = _967;
    float _975 = -_957;
    float _977 = _975 + 1.0;
    int _979 = abs(_955);
    float _981 = _921 * _921;
    int _983 = abs(_947);
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _987 = _827 + _985;
    float _989 = float(_805);
    float _991 = fma(_927, _927, _981);
    float _993 = -_607;
    float _995 = _993 + 1.0;
    float _997 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[28].z, _941);
    float _999 = in.m_70.x;
    float _1001 = in.m_70.y;
    float _1003 = in.m_70.z;
    float _1005 = fma(_987, _987, _991);
    float _1007 = fma(_667, _995, _873);
    float _1009 = exp2(_601);
    bool _1011 = _997 >= 0.0;
    float _1013 = -_977;
    float _1015 = fma(_611, _1013, _847);
    float _1017 = float(_983);
    bool _1019 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1021 = isnan(1.0);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1027 = _1023 || _1025;
    float _1029 = rsqrt(_1005);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1033 = 1.0 + _1031;
    float _1035 = _1017 * _989;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1039 = float(_979);
    float _1041 = 1.0 / _1033;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1047 = float(_973);
    float _1049 = _1035 * (-2.0);
    float _1051 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1053 = -_1009;
    float _1055 = _1053 + 1.0;
    float _1057 = _1043 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1059 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1061 = _1033;
    if (_1011)
    {
        _1061 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1063 = _1061;
    float _1065 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1067 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1069 = isnan(0.0);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1075 = _1071 || _1073;
    float _1077 = _1039 * _1047;
    out.m_72.x = _1015;
    out.m_72.y = _1007;
    out.m_72.z = _951;
    out.m_72.w = _965;
    float _1079 = fma(_787, _1049, _787);
    int _1081 = as_type<int>(_1063);
    if (_1011)
    {
        float _1083 = _1063 * 5.0;
        _1081 = as_type<int>(_1083);
    }
    int _1085 = _1081;
    float _1087 = fma(_1049, _999, _999);
    float _1089 = _1075 ? _1055 : 0.0;
    out.m_74.x = _1057;
    out.m_74.y = _1059;
    out.m_74.z = _1051;
    out.m_74.w = _1065;
    float _1091 = _1077 * (-2.0);
    float _1093 = _517 + (-0.5);
    float _1095 = _1003;
    if (_1011)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4230 = as_type<float>(_1085);
        out.gl_Position.z = _4230;
    }
    float _1097 = fma(_699, _1091, _699);
    float _1099 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1087);
    if (_1027)
    {
        float _1101 = _1089 * _1041;
        _143 = _1101;
    }
    float _1103 = _143;
    float _1105 = _921 * _1029;
    if (_1011)
    {
        out.m_51.x = 0.0;
    }
    float _1107 = fma(_1091, _1001, _1001);
    bool _1109 = !_627;
    int _1111 = _1109 ? 0 : 1;
    float _1113 = -_1105;
    float _1115 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    float _1117 = _927 * _1029;
    float _1119 = _1115 * _1115;
    float _1121 = -_1117;
    float _1123 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[18].w, _927);
    if (_1011)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1125 = -_1105;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[18].w, _631);
    float _1129 = _987 * _1029;
    float _1131 = -_1117;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[18].w, _807);
    int _1135 = abs(_1111);
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1139 = _1127 + _1137;
    float _1141 = -_1129;
    float _1143 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[18].w, _827);
    float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1147 = _1133 + _1145;
    float _1149 = _519 + (-0.5);
    float _1151 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1155 = _1143 + _1153;
    float _1157 = float(_907);
    float _1159 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1107);
    float _1161 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1151);
    float _1163 = _521 + _517;
    float _1165 = fma(_1079, _1103, _1099);
    float _1167 = fma(_1123, _1123, _1119);
    float _1169 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1161);
    float _1171 = float(_1135);
    float _1173 = -_1129;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _987);
    float _1177 = fma(_1097, _1103, _1159);
    float _1179 = _1163 + (-1.0);
    bool _1181 = _1169 >= 0.0;
    float _1183 = _1171 * _1157;
    float _1185 = _1165 * 0.15915493667125701904296875;
    float _1187 = fma(_1175, _1175, _1167);
    float _1189 = _1183 * (-2.0);
    float _1191 = _1177 * 0.15915493667125701904296875;
    float _1193 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1195 = _1185 * 6.283185482025146484375;
    float _1197 = sin(_1195);
    float _1199 = fma(_1189, _1003, _1003);
    float _1201 = _521 + (-0.5);
    float _1203 = fma(_1193, _1189, _1193);
    int _1205 = as_type<int>(_1201);
    float _1207 = _1147;
    if (_1181)
    {
        _1095 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1209 = _1095;
    float _1211 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1199);
    float _1213 = _1185 * 6.283185482025146484375;
    float _1215 = cos(_1213);
    if (_1181)
    {
        out.m_51.x = 0.0;
    }
    if (_1181)
    {
        float _1217 = _1209 * 5.0;
        _1205 = as_type<int>(_1217);
    }
    int _1219 = _1205;
    float _1221 = fma(_1203, _1103, _1211);
    if (_1181)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4459 = as_type<float>(_1219);
        out.gl_Position.z = _4459;
    }
    float _1223 = sqrt(_1187);
    float _1225 = _1221 * 0.15915493667125701904296875;
    float _1227 = _1191 * 6.283185482025146484375;
    float _1229 = sin(_1227);
    float _1231 = _1191 * 6.283185482025146484375;
    float _1233 = cos(_1231);
    if (_1181)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1235 = _1225 * 6.283185482025146484375;
    float _1237 = cos(_1235);
    float _1239 = _1029 * _1223;
    float _1241 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1243 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _1245 = _461 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1247 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1249 = _1239 * _1241;
    float _1251 = _1197 * _1229;
    float _1253 = _1225 * 6.283185482025146484375;
    float _1255 = sin(_1253);
    float _1257 = _1239 * _1245;
    float _1259 = _1243 * _1249;
    float _1261 = _1215 * _1233;
    float _1263 = _1215 * _1229;
    float _1265 = _1247 * _1257;
    float _1267 = _1197 * _1233;
    float _1269 = _1215 * _1237;
    float _1271 = _1233 * _1237;
    float _1273 = _1197 * _1237;
    float _1275 = _1229 * _1237;
    float _1277 = _1269 * _1259;
    float _1279 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1281 = _1279 * 0.5;
    float _1283 = fma(_1255, _1261, _1251);
    float _1285 = -_1267;
    float _1287 = fma(_1255, _1263, _1285);
    float _1289 = -_1259;
    float _1291 = _1255 * _1289;
    float _1293 = -_1263;
    float _1295 = fma(_1255, _1267, _1293);
    float _1297 = fma(_1283, _1265, _1277);
    float _1299 = _1273 * _1259;
    float _1301 = fma(_1271, _1265, _1291);
    float _1303 = fma(_1255, _1251, _1261);
    float _1305 = fma(_1287, _1281, _1297);
    float _1307 = fma(_1295, _1265, _1299);
    float _1309 = fma(_1275, _1281, _1301);
    float _1311 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1313 = fma(_1303, _1281, _1307);
    float _1315 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1317 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1311);
    float _1319 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1315);
    float _1321 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1317);
    float _1323 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1319);
    float _1325 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1327 = _1323 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1329 = _827 + _1325;
    float _1331 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1333 = _807 + _1327;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1337 = _1329 + _1335;
    float _1339 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1331);
    float _1341 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1343 = _1333 + _1341;
    float _1345 = _1337 * _1337;
    float _1347 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1339);
    float _1349 = fma(_1343, _1343, _1345);
    float _1351 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1353 = sqrt(_1349);
    float _1355 = _631 + _1351;
    bool _1357 = _1353 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1345;
    float _1361 = _1351;
    float _1363 = _1329;
    float _1365 = _1349;
    if (!_1357)
    {
        _1359 = _1333;
    }
    float _1367 = _1359;
    float _1369 = _1367;
    if (!_1357)
    {
        _1361 = _1355;
    }
    float _1371 = _1361;
    bool _1373 = !_1357;
    float _1375 = _1371;
    if (!_1373)
    {
        float _1377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1381 = _1353 + _1379;
        float _1383 = _1355 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1385 = rsqrt(_1349);
        float _1387 = _1381 * _1377;
        float _1389 = _1387 * 0.15915493667125701904296875;
        float _1391 = _1389 * 6.283185482025146484375;
        float _1393 = cos(_1391);
        float _1395 = _1389 * 6.283185482025146484375;
        float _1397 = sin(_1395);
        float _1399 = _1393 + (-1.0);
        float _1401 = fma(_1397, _1383, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1403 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1405 = _1385 * _1401;
        float _1407 = fma(_1355, _1393, _1403);
        float _1409 = fma(_1343, _1405, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1411 = fma(_1337, _1405, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1369 = _1409;
        _1363 = _1411;
        _1375 = _1407;
    }
    float _1413 = _1369;
    float _1415 = _1363;
    float _1417 = _1375;
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1421 = _1413 + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1425 = _1415 + _1423;
    float _1427 = fma(_1421, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1429 = fma(_1425, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4802 = float2(_1427, _1429);
    float _1431 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4802, float2(0.0), isnan(_4802)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4802, float2(0.0), isnan(_4802)), level(0.0)).x;
    bool _1433 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1435 = isnan(0.5);
    bool _1437 = _1433 || _1435;
    bool _1439 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1441 = _1437 || _1439;
    bool _1443 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1445 = isnan(0.5);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1451 = _1447 || _1449;
    float _1453 = fma(_1431, 100.0, _631);
    float _1455 = -_1105;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1453);
    float _1459 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1461 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1459);
    float _1463 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1461);
    float _1465 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1467 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1469 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1465);
    float _1471 = 1.0 / _1467;
    float _1473 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1469);
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1477 = _1475 + _1467;
    float _1479 = _1467;
    if (_1451)
    {
        _1479 = 1.0;
    }
    float _1481 = _1479;
    float _1483 = _1477 * _1471;
    float _1485 = _1483 * 0.5;
    float _1487 = fma(_1431, 100.0, _1417);
    float _1489 = -_1117;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1413);
    float _1493 = -_1129;
    float _1495 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1415);
    float _1497 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1499 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1497);
    float _1501 = -_1105;
    float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1487);
    float _1505 = _1487;
    float _1507 = _1495;
    float _1509 = _1503;
    float _1511 = _1491;
    float _1513 = _1481;
    if (_1441)
    {
        _1505 = _1495;
    }
    float _1515 = _1505;
    float _1517 = 1.0 / _1499;
    float _1519 = _1515;
    if (!_1441)
    {
        float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1523 = _1457 + _1521;
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1527 = -_827;
        float _1529 = _1527 + _1415;
        float _1531 = -_631;
        float _1533 = _1531 + _1417;
        float _1535 = _1523 * _1523;
        float _1537 = -_807;
        float _1539 = _1537 + _1413;
        float _1541 = fma(_1147, _1147, _1535);
        float _1543 = 1.0 / _1239;
        float _1545 = fma(_1155, _1155, _1541);
        float _1547 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1549 = sqrt(_1545);
        float _1551 = precise::min(_1549, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1553 = _1551 * _1525;
        float _1555 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1557 = _1553 * _1543;
        float _1559 = _1555 * _1557;
        float _1561 = _1529 * _1557;
        float _1563 = fma(_1533, _1559, _1457);
        float _1565 = fma(_1539, _1559, _1133);
        float _1567 = fma(_1555, _1561, _1143);
        _1507 = _1549;
        _1509 = _1563;
        _1511 = _1565;
        _1519 = _1567;
        _1207 = _1553;
        _901 = _1561;
    }
    float _1569 = _1507;
    float _1571 = _1509;
    float _1573 = _1511;
    float _1575 = _1519;
    float _1577 = _1207;
    float _1579 = _901;
    float _1581 = _1579;
    float _1583 = _1569;
    float _1585 = _1577;
    if (_1451)
    {
        _1581 = 1.0;
    }
    float _1587 = _1581;
    float _1589 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1591 = _1517 * _1589;
    float _1593 = _1587;
    if (!_1451)
    {
        float _1595 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1597 = _1595 * 0.15915493667125701904296875;
        float _1599 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1603 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1601;
        float _1605 = _1597 * 6.283185482025146484375;
        float _1607 = cos(_1605);
        float _1609 = _1599 * 0.15915493667125701904296875;
        float _1611 = _1597 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        float _1615 = 1.0 / _1607;
        float _1617 = _1609 * 6.283185482025146484375;
        float _1619 = cos(_1617);
        float _1621 = _1613 * _1615;
        float _1623 = _1609 * 6.283185482025146484375;
        float _1625 = sin(_1623);
        float _1627 = _1619 * _1621;
        float _1629 = 1.0 / _1603;
        float _1631 = 1.0 / _1627;
        float _1633 = _1625 * _1631;
        float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1637 = fma(_1591, _1633, _1635);
        float _1639 = _1637 * _1629;
        float _1641 = precise::clamp(_1639, 0.0, 1.0);
        _1583 = _1621;
        _1585 = _1609;
        _1513 = _1641;
    }
    float _1643 = _1583;
    float _1645 = _1585;
    float _1647 = _1513;
    float _1649 = _1643;
    float _1651 = _1645;
    if (!_1451)
    {
        float _1653 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1655 = _1653 * 0.15915493667125701904296875;
        float _1657 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1659 = _1655 * 6.283185482025146484375;
        float _1661 = cos(_1659);
        float _1663 = _1657 * 0.15915493667125701904296875;
        float _1665 = _1655 * 6.283185482025146484375;
        float _1667 = sin(_1665);
        float _1669 = 1.0 / _1661;
        float _1671 = _1663 * 6.283185482025146484375;
        float _1673 = cos(_1671);
        float _1675 = _1667 * _1669;
        float _1677 = _1663 * 6.283185482025146484375;
        float _1679 = sin(_1677);
        float _1681 = _1673 * _1675;
        float _1683 = 1.0 / _1681;
        float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1687 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1685;
        float _1689 = 1.0 / _1687;
        float _1691 = _1679 * _1683;
        float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1695 = fma(_1591, _1691, _1693);
        float _1697 = _1695 * _1689;
        float _1699 = precise::clamp(_1697, 0.0, 1.0);
        float _1701 = -_1699;
        float _1703 = _1701 + 1.0;
        _1649 = _1681;
        _1593 = _1703;
    }
    float _1705 = _1649;
    float _1707 = _1593;
    float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1711 = _1571 + _1709;
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1715 = _1573 + _1713;
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1719 = _1575 + _1717;
    float _1721 = _1711 * _1711;
    float _1723 = fma(_1715, _1715, _1721);
    float _1725 = fma(_1719, _1719, _1723);
    float _1727 = rsqrt(_1725);
    float _1729 = sqrt(_1725);
    float _1731 = _1727 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1733 = _1715 * _1731;
    float _1735 = _1719 * _1731;
    float _1737 = _1733 * _1733;
    float _1739 = _1735 * _1735;
    float _1741 = _1737 + _1739;
    float _1743 = sqrt(_1741);
    bool _1745 = _1743 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1747 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1749 = _1743 + _1747;
    float _1751 = _1719;
    float _1753 = _1727;
    float _1755 = _1749;
    if (_1745)
    {
        float _1757 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1751 = _1757;
    }
    float _1759 = _1751;
    if (_1745)
    {
        float _1761 = rsqrt(_1741);
        _1753 = _1761;
    }
    float _1763 = _1753;
    float _1765 = _1763;
    if (_1745)
    {
        float _1767 = _1749 * _1759;
        _1755 = _1767;
    }
    float _1769 = _1755;
    if (_1745)
    {
        float _1771 = _1769 * 0.15915493667125701904296875;
        _1651 = _1771;
    }
    float _1773 = _1651;
    float _1775 = _1759;
    float _1777 = _1773;
    if (_1745)
    {
        float _1779 = _1773 * 6.283185482025146484375;
        float _1781 = sin(_1779);
        _1775 = _1781;
    }
    float _1783 = _1775;
    float _1785 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1787 = precise::max(0.0, _1785);
    float _1789 = _1705;
    float _1791 = _1787;
    if (_1745)
    {
        float _1793 = _1773 * 6.283185482025146484375;
        float _1795 = cos(_1793);
        _1789 = _1795;
    }
    float _1797 = _1789;
    float _1799 = -_1731;
    float _1801 = -_1787;
    float _1803 = fma(_1711, _1799, _1801);
    float _1805 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1745)
    {
        float _1807 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1791 = _1807;
    }
    float _1809 = _1791;
    float _1811 = _1809;
    if (!_1745)
    {
        _1777 = _1737;
    }
    float _1813 = _1777;
    float _1815 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1817 = _1783;
    float _1819 = _1813;
    if (_1745)
    {
        float _1821 = fma(_1783, _1809, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1811 = _1821;
    }
    float _1823 = _1811;
    float _1825 = _1823;
    if (!_1745)
    {
        _1817 = _1735;
    }
    float _1827 = _1817;
    float _1829 = _1827;
    float _1831 = _1797;
    if (_1745)
    {
        float _1833 = _1797 + (-1.0);
        _1805 = _1833;
    }
    float _1835 = _1805;
    float _1837 = _1835;
    if (_1745)
    {
        float _1839 = _1763 * _1823;
        _1365 = _1839;
    }
    float _1841 = _1365;
    if (!_1745)
    {
        _1765 = _1733;
    }
    float _1843 = _1765;
    float _1845 = fma(_1143, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1847 = _1843;
    if (_1745)
    {
        float _1849 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1837 = _1849;
    }
    float _1851 = _1837;
    if (_1745)
    {
        float _1853 = _1733 * _1841;
        _1847 = _1853;
    }
    float _1855 = _1847;
    if (!_1745)
    {
        _1825 = _1803;
    }
    float _1857 = _1825;
    float _1859 = _1857;
    if (_1745)
    {
        float _1861 = _1735 * _1841;
        _1829 = _1861;
    }
    float _1863 = _1829;
    if (_1745)
    {
        float _1865 = fma(_1803, _1797, _1851);
        _1859 = _1865;
    }
    float _1867 = _1859;
    if (_1745)
    {
        float _1869 = _1855 * _1855;
        _1819 = _1869;
    }
    float _1871 = _1819;
    if (!_1745)
    {
        _1831 = _1739;
    }
    float _1873 = _1831;
    float _1875 = _1873;
    if (_1745)
    {
        float _1877 = _1863 * _1863;
        _1875 = _1877;
    }
    float _1879 = _1875;
    float _1881 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1883 = fma(_1867, _1867, _1871);
    float _1885 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1887 = _1883 + _1879;
    float _1889 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1881);
    float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1893 = fma(_1729, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1891);
    float _1895 = precise::clamp(_1893, 0.0, 1.0);
    float _1897 = floor(_1815);
    float _1899 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1885);
    float _1901 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1889);
    float _1903 = -_1895;
    float _1905 = _1903 + 1.0;
    float _1907 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1909 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1911 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1913 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1899);
    float _1915 = rsqrt(_1887);
    float _1917 = _1911 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1919 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1921 = -_1917;
    float _1923 = fma(_1921, _1907, 1.0);
    float _1925 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1927 = abs(_1905);
    float _1929 = log2(_1927);
    float _1931 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1909);
    float _1933 = -_1897;
    float _1935 = _1815 + _1933;
    float _1937 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1931);
    float _1939 = _1915 * _1855;
    float _1941 = _1915 * _1867;
    float _1943 = _1915 * _1863;
    float _1945 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1925);
    float _1947 = _1939 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1949 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1951 = floor(_1845);
    float _1953 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1945);
    float _1955 = -_1947;
    float _1957 = fma(_1941, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1955);
    float _1959 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1961 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1963 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1965 = -_1943;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1957);
    float _1969 = log2(_1923);
    float _1971 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1959);
    float _1973 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1975 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1971);
    float _1977 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1973);
    float _1979 = exp2(_1961);
    float _1981 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1975);
    float _1983 = fma(_1967, -0.5, 0.5);
    float _1985 = fma(_1967, 0.5, 0.5);
    float _1987 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1989 = -_1951;
    float _1991 = _1845 + _1989;
    float _1993 = fma(_1985, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1995 = 1.0 / _1981;
    float _1997 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1987);
    float _1999 = _1941 + 1.0;
    float _2001 = fma(_1985, _1993, -0.212114393711090087890625);
    float _2003 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1977);
    float _2005 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1997);
    float _2007 = sqrt(_1983);
    float _2009 = -_1941;
    float _2011 = fma(_1979, _1999, _2009);
    float _2013 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2003);
    float _2015 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2005);
    float _2017 = _1969 * 0.693147182464599609375;
    float2 _5721 = float2(_1935, _1991);
    float _2019 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5721, float2(0.0), isnan(_5721)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5721, float2(0.0), isnan(_5721)), level(0.0)).x;
    float _2021 = fma(_1985, _2001, 1.570728778839111328125);
    float _2023 = fma(_2011, 0.5, 0.5);
    float _2025 = _2013 * _1995;
    float _2027 = _2015 * _1995;
    float _2029 = _2017 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2031 = fma(_2025, 0.5, 0.5);
    float _2033 = fma(_2027, -0.5, 0.5);
    float _2035 = _2007 * 0.636619746685028076171875;
    float _2037 = -_2021;
    float _2039 = fma(_2035, _2037, 1.0);
    float3 _5758 = float3(_2031, _2033, _2029);
    float _2041 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5758, float3(0.0), isnan(_5758)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5758, float3(0.0), isnan(_5758)), level(0.0)).x;
    float3 _5769 = float3(_2031, _2033, _2029);
    float4 _2044 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5769, float3(0.0), isnan(_5769)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5769, float3(0.0), isnan(_5769)), level(0.0)).xyzw;
    float _2046 = _2044.x;
    float _2048 = _2044.y;
    float _2050 = _2044.z;
    float _2052 = _2044.w;
    float2 _5785 = float2(_2039, _2023);
    float3 _2056 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5785, float2(0.0), isnan(_5785)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5785, float2(0.0), isnan(_5785)), level(0.0)).xyz;
    float _2058 = _2056.x;
    float _2060 = _2056.y;
    float _2062 = _2056.z;
    float _2064 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2066 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2068 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2070 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2072 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2064);
    float _2074 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2066);
    float _2076 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2078 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2080 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2082 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2068);
    float _2084 = -_1255;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2076);
    float _2088 = -_1255;
    float _2090 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2078);
    float _2092 = -_1255;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2080);
    float _2096 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2072);
    float _2098 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2086);
    float _2100 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2090);
    float _2102 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2094);
    float _2104 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2074);
    float _2106 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2082);
    float _2108 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2110 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2112 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2114 = _2070 * _2098;
    float _2116 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2118 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2108);
    float _2120 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2110);
    float _2122 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2112);
    float _2124 = _2070 * _2100;
    float _2126 = _2070 * _2102;
    float _2128 = fma(_2116, _2096, _2114);
    float _2130 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2118);
    float _2132 = abs(_1591);
    float _2134 = log2(_2132);
    float _2136 = fma(_2116, _2106, _2126);
    float _2138 = fma(_2116, _2104, _2124);
    float _2140 = _2130 + _2128;
    float _2142 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2144 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2146 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2120);
    float _2148 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2122);
    float _2150 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2144);
    float _2152 = exp2(_2142);
    float _2154 = in.m_68.x;
    float _2156 = _2146 + _2138;
    float _2158 = _2148 + _2136;
    bool _2160 = _1729 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2162 = isnan(_1729);
    bool _2164 = _2160 || _2162;
    bool _2166 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2168 = _2164 || _2166;
    float _2170 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_76.x = _2140;
    out.m_76.y = _2156;
    out.m_76.z = _2158;
    float _2172 = exp2(_2170);
    float _2174 = -_2152;
    float _2176 = _2174 + 1.0;
    float _2178 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2180 = precise::clamp(_2178, 0.0, 1.0);
    bool _2182 = _1591 <= 8000.0;
    bool _2184 = isnan(_1591);
    bool _2186 = _2182 || _2184;
    bool _2188 = isnan(8000.0);
    bool _2190 = _2186 || _2188;
    float _2192 = float(_2190);
    float _2194 = _1981 * 0.5;
    float _2196 = fma(_2180, -2.0, 3.0);
    float _2198 = _2180 * _2180;
    float _2200 = fma(_2015, -0.5, _2194);
    float _2202 = _2176 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2204 = _2198 * _2196;
    float _2206 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2150);
    float _2208 = -_2204;
    float _2210 = _2208 + 1.0;
    float _2212 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2206);
    float _2214 = fma(_2210, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2204);
    float _2216 = _2212 + _1981;
    out.gl_Position.x = _2013;
    out.gl_Position.y = _2015;
    out.gl_Position.z = _2212;
    out.gl_Position.w = _1981;
    float _2218 = _2013 + _1981;
    float _2220 = _2192 * _2214;
    float _2222 = _2216 * 0.5;
    float _2224 = _2218 * 0.5;
    float _2226 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_78.x = _2224;
    out.m_78.y = _2200;
    out.m_78.z = _2222;
    out.m_78.w = _1981;
    float _2228 = -_2019;
    float _2230 = _2228 + 1.0;
    float _2232 = _2230 * _2226;
    float _2234 = precise::clamp(_2232, 0.0, 1.0);
    float _2236 = -_2234;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2240 = _2238 * _2154;
    float _2242 = _2202 * _2041;
    float _2244 = -_2202;
    float _2246 = _2244 + 1.0;
    float _2248 = _2052 * _2242;
    float _2250 = _2062 * _2242;
    float _2252 = _2052 * _2246;
    float _2254 = fma(_2060, _2248, _2048);
    float _2256 = fma(_2058, _2248, _2046);
    float _2258 = _2240 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2260 = fma(_2052, _2250, _2050);
    float _2262 = _1647 * _1707;
    float _2264 = _2048;
    float _2266 = _2058;
    float _2268 = _2050;
    float _2270 = _2046;
    float _2272 = _2248;
    float _2274 = _2262;
    if (!_2168)
    {
        _2264 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2276 = _2264;
    out.m_80.x = _2258;
    float _2278 = _2262 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2280 = _2276;
    float _2282 = _2276;
    if (!_2168)
    {
        _2266 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2284 = _2266;
    out.m_82.x = _2256;
    out.m_82.y = _2254;
    out.m_82.z = _2260;
    out.m_82.w = _2252;
    float _2286 = _2284;
    float _2288 = _2284;
    if (!_2168)
    {
        _2268 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2290 = _2268;
    float _2292 = _2290;
    float _2294 = _2290;
    if (!_2168)
    {
        _2270 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2296 = _2270;
    float _2298 = _2296;
    float _2300 = _2296;
    if (!_2168)
    {
        _2272 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2302 = _2272;
    float _2304 = _2302;
    float _2306 = _2302;
    if (!_2168)
    {
        _2274 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2308 = _2274;
    bool _2310 = !_2168;
    float _2312 = _2308;
    float _2314 = _2308;
    if (!_2310)
    {
        bool _2316 = _1729 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2318 = isnan(_1729);
        bool _2320 = _2316 || _2318;
        bool _2322 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2324 = _2320 || _2322;
        if (!_2324)
        {
            float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2328 = _1729 + _2326;
            float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2332 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2330;
            float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2338 = 1.0 / _2332;
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2346 = _2344 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2354 = _2352 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2356 = _2328 * _2338;
            float _2358 = precise::clamp(_2356, 0.0, 1.0);
            float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2364 = fma(_2358, _2336, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2366 = fma(_2358, _2342, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2368 = fma(_2358, _2362, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2370 = fma(_2358, _2346, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2372 = fma(_2358, _2350, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2374 = fma(_2358, _2354, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2288 = _2368;
            _2306 = _2372;
            _2282 = _2366;
            _2300 = _2364;
            _2294 = _2370;
            _2314 = _2374;
            _2376 = true;
        }
        else
        {
            bool _2378 = _1729 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2380 = isnan(_1729);
            bool _2382 = _2378 || _2380;
            bool _2384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2386 = _2382 || _2384;
            if (!_2386)
            {
                _2280 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2388 = _2280;
            _2282 = _2388;
            if (!_2386)
            {
                _2286 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2390 = _2286;
            _2288 = _2390;
            if (!_2386)
            {
                _2292 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2392 = _2292;
            _2294 = _2392;
            if (!_2386)
            {
                _2298 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2394 = _2298;
            _2300 = _2394;
            if (!_2386)
            {
                _2304 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2396 = _2304;
            _2306 = _2396;
            if (!_2386)
            {
                _2312 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2398 = _2312;
            bool _2400 = !_2386;
            _2314 = _2398;
            if (!_2400)
            {
                bool _2402 = _1729 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2404 = isnan(_1729);
                bool _2406 = _2402 || _2404;
                bool _2408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2410 = _2406 || _2408;
                if (!_2410)
                {
                    float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2414 = _1729 + _2412;
                    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2418 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2416;
                    float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2424 = 1.0 / _2418;
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2442 = _2414 * _2424;
                    float _2444 = precise::clamp(_2442, 0.0, 1.0);
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2450 = fma(_2444, _2422, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2452 = fma(_2444, _2428, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2454 = fma(_2444, _2448, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2456 = fma(_2444, _2432, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2458 = fma(_2444, _2436, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2460 = fma(_2444, _2440, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2288 = _2454;
                    _2306 = _2458;
                    _2282 = _2452;
                    _2300 = _2450;
                    _2294 = _2456;
                    _2314 = _2460;
                    _2376 = true;
                }
                else
                {
                    _2288 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2306 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2282 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2300 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2294 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2314 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2376 = false;
    float _2462 = _2288;
    float _2464 = _2306;
    float _2466 = _2282;
    float _2468 = _2300;
    float _2470 = _2294;
    float _2472 = _2314;
    float _2474 = fma(_2156, -0.5, 0.5);
    float _2476 = precise::clamp(_2474, 0.0, 1.0);
    float _2478 = -_2462;
    float _2480 = _2478 + _2464;
    float _2482 = _2278 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2484 = -_2466;
    float _2486 = _2484 + _2468;
    float _2488 = fma(_2476, _2480, _2462);
    out.m_84.x = 0.0;
    float _2490 = -_2470;
    float _2492 = _2490 + _2472;
    float _2494 = fma(_2476, _2486, _2466);
    float _2496 = _2488 * 0.586610972881317138671875;
    out.m_51.x = _2482;
    bool _2498 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2500 = fma(_2476, _2492, _2470);
    float _2502 = fma(_2494, 0.298911988735198974609375, _2496);
    bool _2504 = _1647 > 0.0;
    bool _2506 = isnan(_1647);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan(0.0);
    bool _2512 = _2508 || _2510;
    float _2514 = fma(_2500, 0.114477999508380889892578125, _2502);
    bool _2516 = _1707 <= 0.0;
    bool _2518 = !_2512;
    bool _2520 = _2516 || _2518;
    float _2522 = -_2514;
    float _2524 = _2494 + _2522;
    float _2526 = -_2514;
    float _2528 = _2488 + _2526;
    float _2530 = -_2514;
    float _2532 = _2500 + _2530;
    float _2534 = fma(_2524, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2514);
    float _2536 = fma(_2528, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2514);
    float _2538 = fma(_2532, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2514);
    bool _2540 = !_2498;
    if (!_2540)
    {
        float _2542 = -_1571;
        float _2544 = _2542 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2546 = -_1573;
        float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2550 = -_1575;
        float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2554 = _2544 * _2544;
        float _2556 = fma(_2548, _2548, _2554);
        float _2558 = fma(_2552, _2552, _2556);
        float _2560 = sqrt(_2558);
        float _2562 = rsqrt(_2558);
        float _2564 = -_2560;
        float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2568 = _2566 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2570 = precise::clamp(_2568, 0.0, 1.0);
        float _2572 = _2548 * _2562;
        float _2574 = _2544 * _2562;
        float _2576 = abs(_2570);
        float _2578 = log2(_2576);
        float _2580 = _2552 * _2562;
        float _2582 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2584 = _2156 * _2574;
        float _2586 = -_2574;
        float _2588 = -_2582;
        float _2590 = fma(_2586, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2588);
        float _2592 = fma(_2140, _2572, _2584);
        float _2594 = -_2580;
        float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2590);
        float _2598 = fma(_2158, _2580, _2592);
        float _2600 = precise::clamp(_2598, 0.0, 1.0);
        float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2604 = _2596 + _2602;
        float _2606 = _2578 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2608 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2610 = precise::clamp(_2608, 0.0, 1.0);
        float _2612 = exp2(_2606);
        float _2614 = _2612 * _2610;
        float _2616 = _2600 * _2614;
        float _2618 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2620 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2622 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2618;
        out.m_84.y = _2620;
        out.m_84.z = _2622;
    }
    out.m_86.x = _2534;
    out.m_86.y = _2536;
    out.m_86.z = _2538;
    if (!_2520)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _2624 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2624;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2376 = false;
    bool _507 = false;
    bool _395 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2681 = as_type<float>(_121);
        out.gl_Position.z = _2681;
    }
    if (!_109)
    {
        return out;
    }
    float _125 = in.m_53.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2750 = as_type<float>(_159);
        out.gl_Position.z = _2750;
    }
    if (_153)
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
    float _199;
    if (!_181)
    {
        float _183 = in.m_58.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_105);
        float _205 = 1.0 / _203;
        float _207 = _139 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = _209 + _215;
    bool _219 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _221 = isnan(_209);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _209 + _243;
    float _247 = 1.0 / _237;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = 1.0 / _233;
    float _253 = 1.0 / _241;
    float _255 = _245 * _247;
    bool _257 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _259 = isnan(_209);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = _213 * _251;
    bool _271 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_209);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -_229;
    float _285 = _283 + 1.0;
    float _287 = _281 * _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _293 = _217 * _253;
    bool _295 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_209);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -_281;
    float _309 = _307 + 1.0;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = _305 * _309;
    float _325 = -_305;
    float _327 = _325 + 1.0;
    float _329 = fma(_313, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = fma(_317, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = fma(_291, _255, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _335 = _267 * _327;
    float _337 = fma(_321, _255, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = -_267;
    float _341 = _339 + 1.0;
    float _343 = _329 * _335;
    float _345 = _331 * _335;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _351;
    float _355 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _345);
    float _359 = fma(_349, _293, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _361 = fma(_353, _293, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _363 = fma(_333, _323, _355);
    float _365 = fma(_337, _323, _357);
    float _367 = fma(_359, _287, _363);
    float _369 = fma(_361, _287, _365);
    float _371 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].x, _367);
    float _373 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].y, _369);
    bool _375 = !_249;
    float _393;
    if (!_375)
    {
        float _377 = in.m_58.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _385 = _383 * _379;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _393 = _391;
        _395 = true;
    }
    else
    {
        float _397 = float(_105);
        float _399 = 1.0 / _397;
        float _401 = _139 * _399;
        _393 = _401;
    }
    _395 = false;
    float _403 = _393;
    float _405 = in.m_60.x;
    float _407 = in.m_60.y;
    bool _409 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _411 = isnan(_403);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _425 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _427 = isnan(_403);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _403 + _441;
    float _445 = -_419;
    float _447 = _445 + 1.0;
    bool _449 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _451 = 1.0 / _423;
    float _453 = _435 * _447;
    float _455 = -_435;
    float _457 = _455 + 1.0;
    float _459 = _373 * _407;
    float _461 = _371 * _405;
    float _463 = _439 * _451;
    float _465 = fma(_463, _443, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _469 = _465 * _453;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _473 = _467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _475 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[115].x, _469);
    float _477 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[116].x, _475);
    float _479 = _471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _483 = _477 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _485 = _481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _479;
    out.m_62.y = _473;
    out.m_62.z = _485;
    out.m_62.w = _483;
    bool _487 = !_449;
    float _505;
    if (!_487)
    {
        float _489 = in.m_58.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        float _509 = float(_105);
        float _511 = 1.0 / _509;
        float _513 = _139 * _511;
        _505 = _513;
    }
    _507 = false;
    float _515 = _505;
    float _517 = in.m_58.x;
    float _519 = in.m_58.y;
    float _521 = in.m_58.z;
    float _523 = in.m_58.w;
    float _525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _527 = in.m_48.x;
    float _529 = in.m_48.y;
    float _531 = in.m_48.z;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _535 = _533 != 0;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _539 = _537 != 0;
    float _541 = in.m_64.x;
    float _543 = in.m_64.y;
    float _545 = in.m_64.z;
    float _547 = in.m_64.w;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _551 = _549 != 0;
    float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _557 = _555 != 0;
    float _559 = in.m_66.x;
    float _561 = in.m_66.y;
    float _563 = in.m_66.z;
    float _565 = in.m_66.w;
    float _567 = in.m_68.y;
    float _569 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _571 = log2(_569);
    bool _573 = _517 > 0.5;
    float _575 = _521 * 2.0;
    bool _577 = _523 > 0.5;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _581 = _519 > 0.5;
    float _583 = floor(_575);
    float _585 = -_175;
    int _587 = _573 ? as_type<int>(_585) : as_type<int>(_175);
    float _589 = _529 * _543;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _593 = _591 != 0;
    float _595 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[78].w, _579);
    float _597 = -_179;
    int _599 = _577 ? as_type<int>(_597) : as_type<int>(_179);
    float _601 = _571 * _139;
    float _603 = -_179;
    int _605 = _581 ? as_type<int>(_603) : as_type<int>(_179);
    float _607 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _595);
    bool _609 = !_535;
    float _611 = _609 ? _175 : as_type<float>(_587);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _627 = _625 != 0;
    float _629 = _529 * _561;
    float _631 = _529 + _567;
    float _633 = fma(_527, _541, _589);
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _637 = _517 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _639 = fma(_527, _559, _629);
    float _641 = 1.0 / _615;
    float _643 = -_635;
    float _645 = fma(_637, 2.0, _643);
    float _647 = _517 * 2.0;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _651 = _519 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _653;
    float _657 = fma(_531, _563, _639);
    float _659 = fma(_531, _545, _633);
    float _661 = floor(_647);
    float _663 = fma(_651, -2.0, _649);
    bool _665 = !_539;
    float _667 = _665 ? _179 : as_type<float>(_605);
    float _669 = _519 + _521;
    bool _671 = _521 > 0.5;
    float _673 = _519 + _517;
    float _675 = _655 * _641;
    bool _677 = !_557;
    float _679 = _677 ? _179 : as_type<float>(_599);
    float _681 = _669 + (-1.0);
    float _683 = -_175;
    int _685 = _671 ? as_type<int>(_683) : as_type<int>(_175);
    float _687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _689 = _583 >= 0.0;
    bool _691 = isnan(_583);
    bool _693 = _689 || _691;
    bool _695 = isnan(0.0);
    bool _697 = _693 || _695;
    float _699 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _701 = _583 > 0.0;
    float _703 = _519 * 2.0;
    float _705 = _697 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _707 = _673 + (-1.0);
    bool _709 = !_551;
    float _711 = _709 ? _175 : as_type<float>(_685);
    float _713 = floor(_703);
    bool _715 = _661 > 0.0;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _719 = _515 + _717;
    bool _721 = _661 >= 0.0;
    bool _723 = isnan(_661);
    bool _725 = _721 || _723;
    bool _727 = isnan(0.0);
    bool _729 = _725 || _727;
    float _731 = -_139;
    float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[76].x, _645);
    float _735 = fma(_675, _719, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _737 = _681;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _741 = _705;
    if (!_593)
    {
        _737 = _521;
    }
    float _743 = _737;
    float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _747 = _743;
    if (_593)
    {
        _747 = _519;
    }
    float _749 = _747;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _753 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _755 = isnan(_515);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _663);
    float _767 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[83].w, _751);
    bool _769 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _771 = isnan(_515);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = -_763;
    float _783 = _781 + 1.0;
    if (!_593)
    {
        _739 = _521;
    }
    float _785 = _739;
    float _787 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _789 = ~as_type<int>(_705);
    int _791 = _789 + 1;
    int _793 = _791 + 1;
    float _795 = _779 * _783;
    int _797 = _793;
    float _799 = _785;
    if (!_701)
    {
        int _801 = ~as_type<int>(_705);
        int _803 = _801 + 1;
        _797 = _803;
    }
    int _805 = _797;
    float _807 = _659 + _547;
    if (!_593)
    {
        _741 = _519;
    }
    float _809 = _741;
    float _811 = _735 * _795;
    float _813 = _809;
    if (_593)
    {
        _813 = _517;
    }
    float _815 = _813;
    float _817 = _745 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_593)
    {
        _799 = _519;
    }
    float _819 = _799;
    float _821 = -_779;
    float _823 = _821 + 1.0;
    bool _825 = _713 > 0.0;
    float _827 = _657 + _565;
    bool _829 = _713 >= 0.0;
    bool _831 = isnan(_713);
    bool _833 = _829 || _831;
    bool _835 = isnan(0.0);
    bool _837 = _833 || _835;
    float _839 = _687 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _841 = _611 + 0.5;
    float _843 = _819 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _845 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _767);
    float _847 = fma(_839, _841, _733);
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _851 = -_845;
    float _853 = _851 + 1.0;
    int _855 = _729 ? 0 : 1;
    float _857 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[83].z, _849);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _861 = _667 + (-0.5);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _865 = _815 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _867 = fma(_843, -2.0, _859);
    float _869 = -_817;
    float _871 = -_765;
    float _873 = fma(_869, _861, _871);
    float _875 = _525 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _877 = _837 ? 0 : 1;
    float _879 = -_863;
    float _881 = fma(_865, 2.0, _879);
    float _883 = _553 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _885 = _679 + (-0.5);
    float _887 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _867);
    float _889 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[131].x, _811);
    int _891 = ~_877;
    int _893 = _891 + 1;
    int _895 = _893 + 1;
    float _897 = _711 + 0.5;
    int _899 = _895;
    float _901 = _827;
    if (!_825)
    {
        int _903 = ~_877;
        int _905 = _903 + 1;
        _899 = _905;
    }
    int _907 = _899;
    float _909 = -_139;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[81].x, _881);
    float _913 = -_883;
    float _915 = -_887;
    float _917 = fma(_913, _885, _915);
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _921 = _631 + _919;
    float _923 = fma(_875, _897, _911);
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _927 = _807 + _925;
    float _929 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _857);
    float _931 = _921 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _935 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[132].x, _889);
    float _937 = -_929;
    float _939 = _937 + 1.0;
    float _941 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[28].x, _931);
    float _943 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[78].z, _933);
    bool _945 = !_619;
    int _947 = _945 ? 0 : 1;
    float _949 = -_939;
    float _951 = fma(_711, _949, _923);
    bool _953 = !_623;
    int _955 = _953 ? 0 : 1;
    float _957 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _943);
    int _959 = ~_855;
    int _961 = _959 + 1;
    int _963 = _961 + 1;
    float _965 = fma(_679, _853, _917);
    int _967 = _963;
    if (!_715)
    {
        int _969 = ~_855;
        int _971 = _969 + 1;
        _967 = _971;
    }
    int _973 = _967;
    float _975 = -_957;
    float _977 = _975 + 1.0;
    int _979 = abs(_955);
    float _981 = _921 * _921;
    int _983 = abs(_947);
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _987 = _827 + _985;
    float _989 = float(_805);
    float _991 = fma(_927, _927, _981);
    float _993 = -_607;
    float _995 = _993 + 1.0;
    float _997 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[28].z, _941);
    float _999 = in.m_70.x;
    float _1001 = in.m_70.y;
    float _1003 = in.m_70.z;
    float _1005 = fma(_987, _987, _991);
    float _1007 = fma(_667, _995, _873);
    float _1009 = exp2(_601);
    bool _1011 = _997 >= 0.0;
    float _1013 = -_977;
    float _1015 = fma(_611, _1013, _847);
    float _1017 = float(_983);
    bool _1019 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1021 = isnan(1.0);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1027 = _1023 || _1025;
    float _1029 = rsqrt(_1005);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1033 = 1.0 + _1031;
    float _1035 = _1017 * _989;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1039 = float(_979);
    float _1041 = 1.0 / _1033;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1047 = float(_973);
    float _1049 = _1035 * (-2.0);
    float _1051 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1053 = -_1009;
    float _1055 = _1053 + 1.0;
    float _1057 = _1043 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1059 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1061 = _1033;
    if (_1011)
    {
        _1061 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1063 = _1061;
    float _1065 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1067 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1069 = isnan(0.0);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1075 = _1071 || _1073;
    float _1077 = _1039 * _1047;
    out.m_72.x = _1015;
    out.m_72.y = _1007;
    out.m_72.z = _951;
    out.m_72.w = _965;
    float _1079 = fma(_787, _1049, _787);
    int _1081 = as_type<int>(_1063);
    if (_1011)
    {
        float _1083 = _1063 * 5.0;
        _1081 = as_type<int>(_1083);
    }
    int _1085 = _1081;
    float _1087 = fma(_1049, _999, _999);
    float _1089 = _1075 ? _1055 : 0.0;
    out.m_74.x = _1057;
    out.m_74.y = _1059;
    out.m_74.z = _1051;
    out.m_74.w = _1065;
    float _1091 = _1077 * (-2.0);
    float _1093 = _517 + (-0.5);
    float _1095 = _1003;
    if (_1011)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4230 = as_type<float>(_1085);
        out.gl_Position.z = _4230;
    }
    float _1097 = fma(_699, _1091, _699);
    float _1099 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1087);
    if (_1027)
    {
        float _1101 = _1089 * _1041;
        _143 = _1101;
    }
    float _1103 = _143;
    float _1105 = _921 * _1029;
    if (_1011)
    {
        out.m_51.x = 0.0;
    }
    float _1107 = fma(_1091, _1001, _1001);
    bool _1109 = !_627;
    int _1111 = _1109 ? 0 : 1;
    float _1113 = -_1105;
    float _1115 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    float _1117 = _927 * _1029;
    float _1119 = _1115 * _1115;
    float _1121 = -_1117;
    float _1123 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[18].w, _927);
    if (_1011)
    {
        return out;
    }
    float _1125 = -_1105;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[18].w, _631);
    float _1129 = _987 * _1029;
    float _1131 = -_1117;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[18].w, _807);
    int _1135 = abs(_1111);
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1139 = _1127 + _1137;
    float _1141 = -_1129;
    float _1143 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[18].w, _827);
    float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1147 = _1133 + _1145;
    float _1149 = _519 + (-0.5);
    float _1151 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1155 = _1143 + _1153;
    float _1157 = float(_907);
    float _1159 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1107);
    float _1161 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1151);
    float _1163 = _521 + _517;
    float _1165 = fma(_1079, _1103, _1099);
    float _1167 = fma(_1123, _1123, _1119);
    float _1169 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1161);
    float _1171 = float(_1135);
    float _1173 = -_1129;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _987);
    float _1177 = fma(_1097, _1103, _1159);
    float _1179 = _1163 + (-1.0);
    bool _1181 = _1169 >= 0.0;
    float _1183 = _1171 * _1157;
    float _1185 = _1165 * 0.15915493667125701904296875;
    float _1187 = fma(_1175, _1175, _1167);
    float _1189 = _1183 * (-2.0);
    float _1191 = _1177 * 0.15915493667125701904296875;
    float _1193 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1195 = _1185 * 6.283185482025146484375;
    float _1197 = sin(_1195);
    float _1199 = fma(_1189, _1003, _1003);
    float _1201 = _521 + (-0.5);
    float _1203 = fma(_1193, _1189, _1193);
    int _1205 = as_type<int>(_1201);
    float _1207 = _1147;
    if (_1181)
    {
        _1095 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1209 = _1095;
    float _1211 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1199);
    float _1213 = _1185 * 6.283185482025146484375;
    float _1215 = cos(_1213);
    if (_1181)
    {
        out.m_51.x = 0.0;
    }
    if (_1181)
    {
        float _1217 = _1209 * 5.0;
        _1205 = as_type<int>(_1217);
    }
    int _1219 = _1205;
    float _1221 = fma(_1203, _1103, _1211);
    if (_1181)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4459 = as_type<float>(_1219);
        out.gl_Position.z = _4459;
    }
    float _1223 = sqrt(_1187);
    float _1225 = _1221 * 0.15915493667125701904296875;
    float _1227 = _1191 * 6.283185482025146484375;
    float _1229 = sin(_1227);
    float _1231 = _1191 * 6.283185482025146484375;
    float _1233 = cos(_1231);
    if (_1181)
    {
        return out;
    }
    float _1235 = _1225 * 6.283185482025146484375;
    float _1237 = cos(_1235);
    float _1239 = _1029 * _1223;
    float _1241 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1243 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _1245 = _461 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1247 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1249 = _1239 * _1241;
    float _1251 = _1197 * _1229;
    float _1253 = _1225 * 6.283185482025146484375;
    float _1255 = sin(_1253);
    float _1257 = _1239 * _1245;
    float _1259 = _1243 * _1249;
    float _1261 = _1215 * _1233;
    float _1263 = _1215 * _1229;
    float _1265 = _1247 * _1257;
    float _1267 = _1197 * _1233;
    float _1269 = _1215 * _1237;
    float _1271 = _1233 * _1237;
    float _1273 = _1197 * _1237;
    float _1275 = _1229 * _1237;
    float _1277 = _1269 * _1259;
    float _1279 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1281 = _1279 * 0.5;
    float _1283 = fma(_1255, _1261, _1251);
    float _1285 = -_1267;
    float _1287 = fma(_1255, _1263, _1285);
    float _1289 = -_1259;
    float _1291 = _1255 * _1289;
    float _1293 = -_1263;
    float _1295 = fma(_1255, _1267, _1293);
    float _1297 = fma(_1283, _1265, _1277);
    float _1299 = _1273 * _1259;
    float _1301 = fma(_1271, _1265, _1291);
    float _1303 = fma(_1255, _1251, _1261);
    float _1305 = fma(_1287, _1281, _1297);
    float _1307 = fma(_1295, _1265, _1299);
    float _1309 = fma(_1275, _1281, _1301);
    float _1311 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1313 = fma(_1303, _1281, _1307);
    float _1315 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1317 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1311);
    float _1319 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1315);
    float _1321 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1317);
    float _1323 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1319);
    float _1325 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1327 = _1323 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1329 = _827 + _1325;
    float _1331 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1333 = _807 + _1327;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1337 = _1329 + _1335;
    float _1339 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1331);
    float _1341 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1343 = _1333 + _1341;
    float _1345 = _1337 * _1337;
    float _1347 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1339);
    float _1349 = fma(_1343, _1343, _1345);
    float _1351 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1353 = sqrt(_1349);
    float _1355 = _631 + _1351;
    bool _1357 = _1353 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1345;
    float _1361 = _1351;
    float _1363 = _1329;
    float _1365 = _1349;
    if (!_1357)
    {
        _1359 = _1333;
    }
    float _1367 = _1359;
    float _1369 = _1367;
    if (!_1357)
    {
        _1361 = _1355;
    }
    float _1371 = _1361;
    bool _1373 = !_1357;
    float _1375 = _1371;
    if (!_1373)
    {
        float _1377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1381 = _1353 + _1379;
        float _1383 = _1355 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1385 = rsqrt(_1349);
        float _1387 = _1381 * _1377;
        float _1389 = _1387 * 0.15915493667125701904296875;
        float _1391 = _1389 * 6.283185482025146484375;
        float _1393 = cos(_1391);
        float _1395 = _1389 * 6.283185482025146484375;
        float _1397 = sin(_1395);
        float _1399 = _1393 + (-1.0);
        float _1401 = fma(_1397, _1383, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1403 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1405 = _1385 * _1401;
        float _1407 = fma(_1355, _1393, _1403);
        float _1409 = fma(_1343, _1405, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1411 = fma(_1337, _1405, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1369 = _1409;
        _1363 = _1411;
        _1375 = _1407;
    }
    float _1413 = _1369;
    float _1415 = _1363;
    float _1417 = _1375;
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1421 = _1413 + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1425 = _1415 + _1423;
    float _1427 = fma(_1421, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1429 = fma(_1425, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4802 = float2(_1427, _1429);
    float _1431 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4802, float2(0.0), isnan(_4802)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4802, float2(0.0), isnan(_4802)), level(0.0)).x;
    bool _1433 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1435 = isnan(0.5);
    bool _1437 = _1433 || _1435;
    bool _1439 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1441 = _1437 || _1439;
    bool _1443 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1445 = isnan(0.5);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1451 = _1447 || _1449;
    float _1453 = fma(_1431, 100.0, _631);
    float _1455 = -_1105;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1453);
    float _1459 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1461 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1459);
    float _1463 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1461);
    float _1465 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1467 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1469 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1465);
    float _1471 = 1.0 / _1467;
    float _1473 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1469);
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1477 = _1475 + _1467;
    float _1479 = _1467;
    if (_1451)
    {
        _1479 = 1.0;
    }
    float _1481 = _1479;
    float _1483 = _1477 * _1471;
    float _1485 = _1483 * 0.5;
    float _1487 = fma(_1431, 100.0, _1417);
    float _1489 = -_1117;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1413);
    float _1493 = -_1129;
    float _1495 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1415);
    float _1497 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1499 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1497);
    float _1501 = -_1105;
    float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1487);
    float _1505 = _1487;
    float _1507 = _1495;
    float _1509 = _1503;
    float _1511 = _1491;
    float _1513 = _1481;
    if (_1441)
    {
        _1505 = _1495;
    }
    float _1515 = _1505;
    float _1517 = 1.0 / _1499;
    float _1519 = _1515;
    if (!_1441)
    {
        float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1523 = _1457 + _1521;
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1527 = -_827;
        float _1529 = _1527 + _1415;
        float _1531 = -_631;
        float _1533 = _1531 + _1417;
        float _1535 = _1523 * _1523;
        float _1537 = -_807;
        float _1539 = _1537 + _1413;
        float _1541 = fma(_1147, _1147, _1535);
        float _1543 = 1.0 / _1239;
        float _1545 = fma(_1155, _1155, _1541);
        float _1547 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1549 = sqrt(_1545);
        float _1551 = precise::min(_1549, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1553 = _1551 * _1525;
        float _1555 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1557 = _1553 * _1543;
        float _1559 = _1555 * _1557;
        float _1561 = _1529 * _1557;
        float _1563 = fma(_1533, _1559, _1457);
        float _1565 = fma(_1539, _1559, _1133);
        float _1567 = fma(_1555, _1561, _1143);
        _1507 = _1549;
        _1509 = _1563;
        _1511 = _1565;
        _1519 = _1567;
        _1207 = _1553;
        _901 = _1561;
    }
    float _1569 = _1507;
    float _1571 = _1509;
    float _1573 = _1511;
    float _1575 = _1519;
    float _1577 = _1207;
    float _1579 = _901;
    float _1581 = _1579;
    float _1583 = _1569;
    float _1585 = _1577;
    if (_1451)
    {
        _1581 = 1.0;
    }
    float _1587 = _1581;
    float _1589 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1591 = _1517 * _1589;
    float _1593 = _1587;
    if (!_1451)
    {
        float _1595 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1597 = _1595 * 0.15915493667125701904296875;
        float _1599 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1603 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1601;
        float _1605 = _1597 * 6.283185482025146484375;
        float _1607 = cos(_1605);
        float _1609 = _1599 * 0.15915493667125701904296875;
        float _1611 = _1597 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        float _1615 = 1.0 / _1607;
        float _1617 = _1609 * 6.283185482025146484375;
        float _1619 = cos(_1617);
        float _1621 = _1613 * _1615;
        float _1623 = _1609 * 6.283185482025146484375;
        float _1625 = sin(_1623);
        float _1627 = _1619 * _1621;
        float _1629 = 1.0 / _1603;
        float _1631 = 1.0 / _1627;
        float _1633 = _1625 * _1631;
        float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1637 = fma(_1591, _1633, _1635);
        float _1639 = _1637 * _1629;
        float _1641 = precise::clamp(_1639, 0.0, 1.0);
        _1583 = _1621;
        _1585 = _1609;
        _1513 = _1641;
    }
    float _1643 = _1583;
    float _1645 = _1585;
    float _1647 = _1513;
    float _1649 = _1643;
    float _1651 = _1645;
    if (!_1451)
    {
        float _1653 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1655 = _1653 * 0.15915493667125701904296875;
        float _1657 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1659 = _1655 * 6.283185482025146484375;
        float _1661 = cos(_1659);
        float _1663 = _1657 * 0.15915493667125701904296875;
        float _1665 = _1655 * 6.283185482025146484375;
        float _1667 = sin(_1665);
        float _1669 = 1.0 / _1661;
        float _1671 = _1663 * 6.283185482025146484375;
        float _1673 = cos(_1671);
        float _1675 = _1667 * _1669;
        float _1677 = _1663 * 6.283185482025146484375;
        float _1679 = sin(_1677);
        float _1681 = _1673 * _1675;
        float _1683 = 1.0 / _1681;
        float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1687 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1685;
        float _1689 = 1.0 / _1687;
        float _1691 = _1679 * _1683;
        float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1695 = fma(_1591, _1691, _1693);
        float _1697 = _1695 * _1689;
        float _1699 = precise::clamp(_1697, 0.0, 1.0);
        float _1701 = -_1699;
        float _1703 = _1701 + 1.0;
        _1649 = _1681;
        _1593 = _1703;
    }
    float _1705 = _1649;
    float _1707 = _1593;
    float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1711 = _1571 + _1709;
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1715 = _1573 + _1713;
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1719 = _1575 + _1717;
    float _1721 = _1711 * _1711;
    float _1723 = fma(_1715, _1715, _1721);
    float _1725 = fma(_1719, _1719, _1723);
    float _1727 = rsqrt(_1725);
    float _1729 = sqrt(_1725);
    float _1731 = _1727 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1733 = _1715 * _1731;
    float _1735 = _1719 * _1731;
    float _1737 = _1733 * _1733;
    float _1739 = _1735 * _1735;
    float _1741 = _1737 + _1739;
    float _1743 = sqrt(_1741);
    bool _1745 = _1743 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1747 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1749 = _1743 + _1747;
    float _1751 = _1719;
    float _1753 = _1727;
    float _1755 = _1749;
    if (_1745)
    {
        float _1757 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1751 = _1757;
    }
    float _1759 = _1751;
    if (_1745)
    {
        float _1761 = rsqrt(_1741);
        _1753 = _1761;
    }
    float _1763 = _1753;
    float _1765 = _1763;
    if (_1745)
    {
        float _1767 = _1749 * _1759;
        _1755 = _1767;
    }
    float _1769 = _1755;
    if (_1745)
    {
        float _1771 = _1769 * 0.15915493667125701904296875;
        _1651 = _1771;
    }
    float _1773 = _1651;
    float _1775 = _1759;
    float _1777 = _1773;
    if (_1745)
    {
        float _1779 = _1773 * 6.283185482025146484375;
        float _1781 = sin(_1779);
        _1775 = _1781;
    }
    float _1783 = _1775;
    float _1785 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1787 = precise::max(0.0, _1785);
    float _1789 = _1705;
    float _1791 = _1787;
    if (_1745)
    {
        float _1793 = _1773 * 6.283185482025146484375;
        float _1795 = cos(_1793);
        _1789 = _1795;
    }
    float _1797 = _1789;
    float _1799 = -_1731;
    float _1801 = -_1787;
    float _1803 = fma(_1711, _1799, _1801);
    float _1805 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1745)
    {
        float _1807 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1791 = _1807;
    }
    float _1809 = _1791;
    float _1811 = _1809;
    if (!_1745)
    {
        _1777 = _1737;
    }
    float _1813 = _1777;
    float _1815 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1817 = _1783;
    float _1819 = _1813;
    if (_1745)
    {
        float _1821 = fma(_1783, _1809, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1811 = _1821;
    }
    float _1823 = _1811;
    float _1825 = _1823;
    if (!_1745)
    {
        _1817 = _1735;
    }
    float _1827 = _1817;
    float _1829 = _1827;
    float _1831 = _1797;
    if (_1745)
    {
        float _1833 = _1797 + (-1.0);
        _1805 = _1833;
    }
    float _1835 = _1805;
    float _1837 = _1835;
    if (_1745)
    {
        float _1839 = _1763 * _1823;
        _1365 = _1839;
    }
    float _1841 = _1365;
    if (!_1745)
    {
        _1765 = _1733;
    }
    float _1843 = _1765;
    float _1845 = fma(_1143, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1847 = _1843;
    if (_1745)
    {
        float _1849 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1837 = _1849;
    }
    float _1851 = _1837;
    if (_1745)
    {
        float _1853 = _1733 * _1841;
        _1847 = _1853;
    }
    float _1855 = _1847;
    if (!_1745)
    {
        _1825 = _1803;
    }
    float _1857 = _1825;
    float _1859 = _1857;
    if (_1745)
    {
        float _1861 = _1735 * _1841;
        _1829 = _1861;
    }
    float _1863 = _1829;
    if (_1745)
    {
        float _1865 = fma(_1803, _1797, _1851);
        _1859 = _1865;
    }
    float _1867 = _1859;
    if (_1745)
    {
        float _1869 = _1855 * _1855;
        _1819 = _1869;
    }
    float _1871 = _1819;
    if (!_1745)
    {
        _1831 = _1739;
    }
    float _1873 = _1831;
    float _1875 = _1873;
    if (_1745)
    {
        float _1877 = _1863 * _1863;
        _1875 = _1877;
    }
    float _1879 = _1875;
    float _1881 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1883 = fma(_1867, _1867, _1871);
    float _1885 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1887 = _1883 + _1879;
    float _1889 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1881);
    float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1893 = fma(_1729, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1891);
    float _1895 = precise::clamp(_1893, 0.0, 1.0);
    float _1897 = floor(_1815);
    float _1899 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1885);
    float _1901 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1889);
    float _1903 = -_1895;
    float _1905 = _1903 + 1.0;
    float _1907 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1909 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1911 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1913 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1899);
    float _1915 = rsqrt(_1887);
    float _1917 = _1911 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1919 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1921 = -_1917;
    float _1923 = fma(_1921, _1907, 1.0);
    float _1925 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1927 = abs(_1905);
    float _1929 = log2(_1927);
    float _1931 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1909);
    float _1933 = -_1897;
    float _1935 = _1815 + _1933;
    float _1937 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1931);
    float _1939 = _1915 * _1855;
    float _1941 = _1915 * _1867;
    float _1943 = _1915 * _1863;
    float _1945 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1925);
    float _1947 = _1939 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1949 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1951 = floor(_1845);
    float _1953 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1945);
    float _1955 = -_1947;
    float _1957 = fma(_1941, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1955);
    float _1959 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1961 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1963 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1965 = -_1943;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1957);
    float _1969 = log2(_1923);
    float _1971 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1959);
    float _1973 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1975 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1971);
    float _1977 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1973);
    float _1979 = exp2(_1961);
    float _1981 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1975);
    float _1983 = fma(_1967, -0.5, 0.5);
    float _1985 = fma(_1967, 0.5, 0.5);
    float _1987 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1989 = -_1951;
    float _1991 = _1845 + _1989;
    float _1993 = fma(_1985, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1995 = 1.0 / _1981;
    float _1997 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1987);
    float _1999 = _1941 + 1.0;
    float _2001 = fma(_1985, _1993, -0.212114393711090087890625);
    float _2003 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1977);
    float _2005 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1997);
    float _2007 = sqrt(_1983);
    float _2009 = -_1941;
    float _2011 = fma(_1979, _1999, _2009);
    float _2013 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2003);
    float _2015 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2005);
    float _2017 = _1969 * 0.693147182464599609375;
    float2 _5721 = float2(_1935, _1991);
    float _2019 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5721, float2(0.0), isnan(_5721)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5721, float2(0.0), isnan(_5721)), level(0.0)).x;
    float _2021 = fma(_1985, _2001, 1.570728778839111328125);
    float _2023 = fma(_2011, 0.5, 0.5);
    float _2025 = _2013 * _1995;
    float _2027 = _2015 * _1995;
    float _2029 = _2017 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2031 = fma(_2025, 0.5, 0.5);
    float _2033 = fma(_2027, -0.5, 0.5);
    float _2035 = _2007 * 0.636619746685028076171875;
    float _2037 = -_2021;
    float _2039 = fma(_2035, _2037, 1.0);
    float3 _5758 = float3(_2031, _2033, _2029);
    float _2041 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5758, float3(0.0), isnan(_5758)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5758, float3(0.0), isnan(_5758)), level(0.0)).x;
    float3 _5769 = float3(_2031, _2033, _2029);
    float4 _2044 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5769, float3(0.0), isnan(_5769)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5769, float3(0.0), isnan(_5769)), level(0.0)).xyzw;
    float _2046 = _2044.x;
    float _2048 = _2044.y;
    float _2050 = _2044.z;
    float _2052 = _2044.w;
    float2 _5785 = float2(_2039, _2023);
    float3 _2056 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5785, float2(0.0), isnan(_5785)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5785, float2(0.0), isnan(_5785)), level(0.0)).xyz;
    float _2058 = _2056.x;
    float _2060 = _2056.y;
    float _2062 = _2056.z;
    float _2064 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2066 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2068 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2070 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2072 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2064);
    float _2074 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2066);
    float _2076 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2078 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2080 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2082 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2068);
    float _2084 = -_1255;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2076);
    float _2088 = -_1255;
    float _2090 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2078);
    float _2092 = -_1255;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2080);
    float _2096 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2072);
    float _2098 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2086);
    float _2100 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2090);
    float _2102 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2094);
    float _2104 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2074);
    float _2106 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2082);
    float _2108 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2110 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2112 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2114 = _2070 * _2098;
    float _2116 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2118 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2108);
    float _2120 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2110);
    float _2122 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2112);
    float _2124 = _2070 * _2100;
    float _2126 = _2070 * _2102;
    float _2128 = fma(_2116, _2096, _2114);
    float _2130 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2118);
    float _2132 = abs(_1591);
    float _2134 = log2(_2132);
    float _2136 = fma(_2116, _2106, _2126);
    float _2138 = fma(_2116, _2104, _2124);
    float _2140 = _2130 + _2128;
    float _2142 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2144 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2146 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2120);
    float _2148 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2122);
    float _2150 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2144);
    float _2152 = exp2(_2142);
    float _2154 = in.m_68.x;
    float _2156 = _2146 + _2138;
    float _2158 = _2148 + _2136;
    bool _2160 = _1729 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2162 = isnan(_1729);
    bool _2164 = _2160 || _2162;
    bool _2166 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2168 = _2164 || _2166;
    float _2170 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_76.x = _2140;
    out.m_76.y = _2156;
    out.m_76.z = _2158;
    float _2172 = exp2(_2170);
    float _2174 = -_2152;
    float _2176 = _2174 + 1.0;
    float _2178 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2180 = precise::clamp(_2178, 0.0, 1.0);
    bool _2182 = _1591 <= 8000.0;
    bool _2184 = isnan(_1591);
    bool _2186 = _2182 || _2184;
    bool _2188 = isnan(8000.0);
    bool _2190 = _2186 || _2188;
    float _2192 = float(_2190);
    float _2194 = _1981 * 0.5;
    float _2196 = fma(_2180, -2.0, 3.0);
    float _2198 = _2180 * _2180;
    float _2200 = fma(_2015, -0.5, _2194);
    float _2202 = _2176 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2204 = _2198 * _2196;
    float _2206 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2150);
    float _2208 = -_2204;
    float _2210 = _2208 + 1.0;
    float _2212 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2206);
    float _2214 = fma(_2210, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2204);
    float _2216 = _2212 + _1981;
    out.gl_Position.x = _2013;
    out.gl_Position.y = _2015;
    out.gl_Position.z = _2212;
    out.gl_Position.w = _1981;
    float _2218 = _2013 + _1981;
    float _2220 = _2192 * _2214;
    float _2222 = _2216 * 0.5;
    float _2224 = _2218 * 0.5;
    float _2226 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_78.x = _2224;
    out.m_78.y = _2200;
    out.m_78.z = _2222;
    out.m_78.w = _1981;
    float _2228 = -_2019;
    float _2230 = _2228 + 1.0;
    float _2232 = _2230 * _2226;
    float _2234 = precise::clamp(_2232, 0.0, 1.0);
    float _2236 = -_2234;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2240 = _2238 * _2154;
    float _2242 = _2202 * _2041;
    float _2244 = -_2202;
    float _2246 = _2244 + 1.0;
    float _2248 = _2052 * _2242;
    float _2250 = _2062 * _2242;
    float _2252 = _2052 * _2246;
    float _2254 = fma(_2060, _2248, _2048);
    float _2256 = fma(_2058, _2248, _2046);
    float _2258 = _2240 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2260 = fma(_2052, _2250, _2050);
    float _2262 = _1647 * _1707;
    float _2264 = _2048;
    float _2266 = _2058;
    float _2268 = _2050;
    float _2270 = _2046;
    float _2272 = _2248;
    float _2274 = _2262;
    if (!_2168)
    {
        _2264 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2276 = _2264;
    out.m_80.x = _2258;
    float _2278 = _2262 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2280 = _2276;
    float _2282 = _2276;
    if (!_2168)
    {
        _2266 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2284 = _2266;
    out.m_82.x = _2256;
    out.m_82.y = _2254;
    out.m_82.z = _2260;
    out.m_82.w = _2252;
    float _2286 = _2284;
    float _2288 = _2284;
    if (!_2168)
    {
        _2268 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2290 = _2268;
    float _2292 = _2290;
    float _2294 = _2290;
    if (!_2168)
    {
        _2270 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2296 = _2270;
    float _2298 = _2296;
    float _2300 = _2296;
    if (!_2168)
    {
        _2272 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2302 = _2272;
    float _2304 = _2302;
    float _2306 = _2302;
    if (!_2168)
    {
        _2274 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2308 = _2274;
    bool _2310 = !_2168;
    float _2312 = _2308;
    float _2314 = _2308;
    if (!_2310)
    {
        bool _2316 = _1729 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2318 = isnan(_1729);
        bool _2320 = _2316 || _2318;
        bool _2322 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2324 = _2320 || _2322;
        if (!_2324)
        {
            float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2328 = _1729 + _2326;
            float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2332 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2330;
            float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2338 = 1.0 / _2332;
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2346 = _2344 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2354 = _2352 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2356 = _2328 * _2338;
            float _2358 = precise::clamp(_2356, 0.0, 1.0);
            float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2364 = fma(_2358, _2336, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2366 = fma(_2358, _2342, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2368 = fma(_2358, _2362, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2370 = fma(_2358, _2346, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2372 = fma(_2358, _2350, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2374 = fma(_2358, _2354, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2288 = _2368;
            _2306 = _2372;
            _2282 = _2366;
            _2300 = _2364;
            _2294 = _2370;
            _2314 = _2374;
            _2376 = true;
        }
        else
        {
            bool _2378 = _1729 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2380 = isnan(_1729);
            bool _2382 = _2378 || _2380;
            bool _2384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2386 = _2382 || _2384;
            if (!_2386)
            {
                _2280 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2388 = _2280;
            _2282 = _2388;
            if (!_2386)
            {
                _2286 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2390 = _2286;
            _2288 = _2390;
            if (!_2386)
            {
                _2292 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2392 = _2292;
            _2294 = _2392;
            if (!_2386)
            {
                _2298 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2394 = _2298;
            _2300 = _2394;
            if (!_2386)
            {
                _2304 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2396 = _2304;
            _2306 = _2396;
            if (!_2386)
            {
                _2312 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2398 = _2312;
            bool _2400 = !_2386;
            _2314 = _2398;
            if (!_2400)
            {
                bool _2402 = _1729 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2404 = isnan(_1729);
                bool _2406 = _2402 || _2404;
                bool _2408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2410 = _2406 || _2408;
                if (!_2410)
                {
                    float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2414 = _1729 + _2412;
                    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2418 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2416;
                    float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2424 = 1.0 / _2418;
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2442 = _2414 * _2424;
                    float _2444 = precise::clamp(_2442, 0.0, 1.0);
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2450 = fma(_2444, _2422, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2452 = fma(_2444, _2428, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2454 = fma(_2444, _2448, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2456 = fma(_2444, _2432, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2458 = fma(_2444, _2436, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2460 = fma(_2444, _2440, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2288 = _2454;
                    _2306 = _2458;
                    _2282 = _2452;
                    _2300 = _2450;
                    _2294 = _2456;
                    _2314 = _2460;
                    _2376 = true;
                }
                else
                {
                    _2288 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2306 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2282 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2300 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2294 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2314 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2376 = false;
    float _2462 = _2288;
    float _2464 = _2306;
    float _2466 = _2282;
    float _2468 = _2300;
    float _2470 = _2294;
    float _2472 = _2314;
    float _2474 = fma(_2156, -0.5, 0.5);
    float _2476 = precise::clamp(_2474, 0.0, 1.0);
    float _2478 = -_2462;
    float _2480 = _2478 + _2464;
    float _2482 = _2278 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2484 = -_2466;
    float _2486 = _2484 + _2468;
    float _2488 = fma(_2476, _2480, _2462);
    out.m_84.x = 0.0;
    float _2490 = -_2470;
    float _2492 = _2490 + _2472;
    float _2494 = fma(_2476, _2486, _2466);
    float _2496 = _2488 * 0.586610972881317138671875;
    out.m_51.x = _2482;
    bool _2498 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2500 = fma(_2476, _2492, _2470);
    float _2502 = fma(_2494, 0.298911988735198974609375, _2496);
    bool _2504 = _1647 > 0.0;
    bool _2506 = isnan(_1647);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan(0.0);
    bool _2512 = _2508 || _2510;
    float _2514 = fma(_2500, 0.114477999508380889892578125, _2502);
    bool _2516 = _1707 <= 0.0;
    bool _2518 = !_2512;
    bool _2520 = _2516 || _2518;
    float _2522 = -_2514;
    float _2524 = _2494 + _2522;
    float _2526 = -_2514;
    float _2528 = _2488 + _2526;
    float _2530 = -_2514;
    float _2532 = _2500 + _2530;
    float _2534 = fma(_2524, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2514);
    float _2536 = fma(_2528, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2514);
    float _2538 = fma(_2532, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2514);
    bool _2540 = !_2498;
    if (!_2540)
    {
        float _2542 = -_1571;
        float _2544 = _2542 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2546 = -_1573;
        float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2550 = -_1575;
        float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2554 = _2544 * _2544;
        float _2556 = fma(_2548, _2548, _2554);
        float _2558 = fma(_2552, _2552, _2556);
        float _2560 = sqrt(_2558);
        float _2562 = rsqrt(_2558);
        float _2564 = -_2560;
        float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2568 = _2566 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2570 = precise::clamp(_2568, 0.0, 1.0);
        float _2572 = _2548 * _2562;
        float _2574 = _2544 * _2562;
        float _2576 = abs(_2570);
        float _2578 = log2(_2576);
        float _2580 = _2552 * _2562;
        float _2582 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2584 = _2156 * _2574;
        float _2586 = -_2574;
        float _2588 = -_2582;
        float _2590 = fma(_2586, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2588);
        float _2592 = fma(_2140, _2572, _2584);
        float _2594 = -_2580;
        float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2590);
        float _2598 = fma(_2158, _2580, _2592);
        float _2600 = precise::clamp(_2598, 0.0, 1.0);
        float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2604 = _2596 + _2602;
        float _2606 = _2578 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2608 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2610 = precise::clamp(_2608, 0.0, 1.0);
        float _2612 = exp2(_2606);
        float _2614 = _2612 * _2610;
        float _2616 = _2600 * _2614;
        float _2618 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2620 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2622 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2618;
        out.m_84.y = _2620;
        out.m_84.z = _2622;
    }
    out.m_86.x = _2534;
    out.m_86.y = _2536;
    out.m_86.z = _2538;
    if (!_2520)
    {
        return out;
    }
    float _2624 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2624;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2376 = false;
    bool _507 = false;
    bool _395 = false;
    bool _201 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _100 = in.m_48.w;
    float _102 = trunc(_100);
    int _105 = int(_102);
    bool _109 = _105 >= 1;
    float _111 = 0.0;
    if (!_109)
    {
        _111 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _113 = _111;
    float _115 = _113;
    if (!_109)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_109)
    {
        float _119 = _113 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_109)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2681 = as_type<float>(_121);
        out.gl_Position.z = _2681;
    }
    if (!_109)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_53.w;
    bool _127 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _129 = isnan(_125);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _135 = _131 || _133;
    float _137 = -_125;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _141 = 0.0;
    float _143 = _139;
    if (_135)
    {
        float _145 = float(_105);
        _141 = _145;
    }
    float _147 = _141;
    bool _149 = _139 >= _147;
    bool _151 = !_135;
    bool _153 = _149 || _151;
    if (_153)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _155 = _115;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _157 = _155 * 5.0;
        _123 = as_type<int>(_157);
    }
    int _159 = _123;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2750 = as_type<float>(_159);
        out.gl_Position.z = _2750;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
    float _199;
    if (!_181)
    {
        float _183 = in.m_58.x;
        float _185 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _187 = _183 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _189 = fma(_187, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _191 = _189 * _185;
        float _193 = floor(_191);
        float _195 = -_193;
        float _197 = _191 + _195;
        _199 = _197;
        _201 = true;
    }
    else
    {
        float _203 = float(_105);
        float _205 = 1.0 / _203;
        float _207 = _139 * _205;
        _199 = _207;
    }
    _201 = false;
    float _209 = _199;
    float _211 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _213 = _209 + _211;
    float _215 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _217 = _209 + _215;
    bool _219 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _221 = isnan(_209);
    bool _223 = _219 || _221;
    bool _225 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _227 = _223 || _225;
    float _229 = float(_227);
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _237 = _235 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _241 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _245 = _209 + _243;
    float _247 = 1.0 / _237;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _251 = 1.0 / _233;
    float _253 = 1.0 / _241;
    float _255 = _245 * _247;
    bool _257 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _259 = isnan(_209);
    bool _261 = _257 || _259;
    bool _263 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _265 = _261 || _263;
    float _267 = float(_265);
    float _269 = _213 * _251;
    bool _271 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _273 = isnan(_209);
    bool _275 = _271 || _273;
    bool _277 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _279 = _275 || _277;
    float _281 = float(_279);
    float _283 = -_229;
    float _285 = _283 + 1.0;
    float _287 = _281 * _285;
    float _289 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _291 = _289 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _293 = _217 * _253;
    bool _295 = _209 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _297 = isnan(_209);
    bool _299 = _295 || _297;
    bool _301 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _303 = _299 || _301;
    float _305 = float(_303);
    float _307 = -_281;
    float _309 = _307 + 1.0;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _311;
    float _315 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _317 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _315;
    float _319 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _321 = _319 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _323 = _305 * _309;
    float _325 = -_305;
    float _327 = _325 + 1.0;
    float _329 = fma(_313, _269, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _331 = fma(_317, _269, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _333 = fma(_291, _255, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _335 = _267 * _327;
    float _337 = fma(_321, _255, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = -_267;
    float _341 = _339 + 1.0;
    float _343 = _329 * _335;
    float _345 = _331 * _335;
    float _347 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _349 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _347;
    float _351 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _353 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _351;
    float _355 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].x, _343);
    float _357 = fma(_341, (*spvDescriptorSet0.vp_c9)._m0[143].y, _345);
    float _359 = fma(_349, _293, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _361 = fma(_353, _293, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _363 = fma(_333, _323, _355);
    float _365 = fma(_337, _323, _357);
    float _367 = fma(_359, _287, _363);
    float _369 = fma(_361, _287, _365);
    float _371 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].x, _367);
    float _373 = fma(_229, (*spvDescriptorSet0.vp_c9)._m0[146].y, _369);
    bool _375 = !_249;
    float _393;
    if (!_375)
    {
        float _377 = in.m_58.x;
        float _379 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _381 = _377 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _383 = fma(_381, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _385 = _383 * _379;
        float _387 = floor(_385);
        float _389 = -_387;
        float _391 = _385 + _389;
        _393 = _391;
        _395 = true;
    }
    else
    {
        float _397 = float(_105);
        float _399 = 1.0 / _397;
        float _401 = _139 * _399;
        _393 = _401;
    }
    _395 = false;
    float _403 = _393;
    float _405 = in.m_60.x;
    float _407 = in.m_60.y;
    bool _409 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _411 = isnan(_403);
    bool _413 = _409 || _411;
    bool _415 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _417 = _413 || _415;
    float _419 = float(_417);
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _423 = _421 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _425 = _403 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _427 = isnan(_403);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _437;
    float _441 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _443 = _403 + _441;
    float _445 = -_419;
    float _447 = _445 + 1.0;
    bool _449 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _451 = 1.0 / _423;
    float _453 = _435 * _447;
    float _455 = -_435;
    float _457 = _455 + 1.0;
    float _459 = _373 * _407;
    float _461 = _371 * _405;
    float _463 = _439 * _451;
    float _465 = fma(_463, _443, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _467 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _469 = _465 * _453;
    float _471 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _473 = _467 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _475 = fma(_457, (*spvDescriptorSet0.vp_c9)._m0[115].x, _469);
    float _477 = fma(_419, (*spvDescriptorSet0.vp_c9)._m0[116].x, _475);
    float _479 = _471 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _483 = _477 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _485 = _481 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_62.x = _479;
    out.m_62.y = _473;
    out.m_62.z = _485;
    out.m_62.w = _483;
    bool _487 = !_449;
    float _505;
    if (!_487)
    {
        float _489 = in.m_58.x;
        float _491 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _493 = _489 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _495 = fma(_493, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _497 = _495 * _491;
        float _499 = floor(_497);
        float _501 = -_499;
        float _503 = _497 + _501;
        _505 = _503;
        _507 = true;
    }
    else
    {
        float _509 = float(_105);
        float _511 = 1.0 / _509;
        float _513 = _139 * _511;
        _505 = _513;
    }
    _507 = false;
    float _515 = _505;
    float _517 = in.m_58.x;
    float _519 = in.m_58.y;
    float _521 = in.m_58.z;
    float _523 = in.m_58.w;
    float _525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    float _527 = in.m_48.x;
    float _529 = in.m_48.y;
    float _531 = in.m_48.z;
    int _533 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _535 = _533 != 0;
    int _537 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _539 = _537 != 0;
    float _541 = in.m_64.x;
    float _543 = in.m_64.y;
    float _545 = in.m_64.z;
    float _547 = in.m_64.w;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _551 = _549 != 0;
    float _553 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _557 = _555 != 0;
    float _559 = in.m_66.x;
    float _561 = in.m_66.y;
    float _563 = in.m_66.z;
    float _565 = in.m_66.w;
    float _567 = in.m_68.y;
    float _569 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _571 = log2(_569);
    bool _573 = _517 > 0.5;
    float _575 = _521 * 2.0;
    bool _577 = _523 > 0.5;
    float _579 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _581 = _519 > 0.5;
    float _583 = floor(_575);
    float _585 = -_175;
    int _587 = _573 ? as_type<int>(_585) : as_type<int>(_175);
    float _589 = _529 * _543;
    int _591 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _593 = _591 != 0;
    float _595 = fma(_519, (*spvDescriptorSet0.vp_c9)._m0[78].w, _579);
    float _597 = -_179;
    int _599 = _577 ? as_type<int>(_597) : as_type<int>(_179);
    float _601 = _571 * _139;
    float _603 = -_179;
    int _605 = _581 ? as_type<int>(_603) : as_type<int>(_179);
    float _607 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _595);
    bool _609 = !_535;
    float _611 = _609 ? _175 : as_type<float>(_587);
    float _613 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _615 = _613 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    int _617 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _619 = _617 != 0;
    int _621 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _623 = _621 != 0;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _627 = _625 != 0;
    float _629 = _529 * _561;
    float _631 = _529 + _567;
    float _633 = fma(_527, _541, _589);
    float _635 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _637 = _517 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _639 = fma(_527, _559, _629);
    float _641 = 1.0 / _615;
    float _643 = -_635;
    float _645 = fma(_637, 2.0, _643);
    float _647 = _517 * 2.0;
    float _649 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _651 = _519 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _653 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _655 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _653;
    float _657 = fma(_531, _563, _639);
    float _659 = fma(_531, _545, _633);
    float _661 = floor(_647);
    float _663 = fma(_651, -2.0, _649);
    bool _665 = !_539;
    float _667 = _665 ? _179 : as_type<float>(_605);
    float _669 = _519 + _521;
    bool _671 = _521 > 0.5;
    float _673 = _519 + _517;
    float _675 = _655 * _641;
    bool _677 = !_557;
    float _679 = _677 ? _179 : as_type<float>(_599);
    float _681 = _669 + (-1.0);
    float _683 = -_175;
    int _685 = _671 ? as_type<int>(_683) : as_type<int>(_175);
    float _687 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _689 = _583 >= 0.0;
    bool _691 = isnan(_583);
    bool _693 = _689 || _691;
    bool _695 = isnan(0.0);
    bool _697 = _693 || _695;
    float _699 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _701 = _583 > 0.0;
    float _703 = _519 * 2.0;
    float _705 = _697 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _707 = _673 + (-1.0);
    bool _709 = !_551;
    float _711 = _709 ? _175 : as_type<float>(_685);
    float _713 = floor(_703);
    bool _715 = _661 > 0.0;
    float _717 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _719 = _515 + _717;
    bool _721 = _661 >= 0.0;
    bool _723 = isnan(_661);
    bool _725 = _721 || _723;
    bool _727 = isnan(0.0);
    bool _729 = _725 || _727;
    float _731 = -_139;
    float _733 = fma(_731, (*spvDescriptorSet0.vp_c9)._m0[76].x, _645);
    float _735 = fma(_675, _719, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _737 = _681;
    float _739 = (*spvDescriptorSet0.vp_c9)._m0[198].y;
    float _741 = _705;
    if (!_593)
    {
        _737 = _521;
    }
    float _743 = _737;
    float _745 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _747 = _743;
    if (_593)
    {
        _747 = _519;
    }
    float _749 = _747;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    bool _753 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _755 = isnan(_515);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _663);
    float _767 = fma(_749, (*spvDescriptorSet0.vp_c9)._m0[83].w, _751);
    bool _769 = _515 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _771 = isnan(_515);
    bool _773 = _769 || _771;
    bool _775 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _777 = _773 || _775;
    float _779 = float(_777);
    float _781 = -_763;
    float _783 = _781 + 1.0;
    if (!_593)
    {
        _739 = _521;
    }
    float _785 = _739;
    float _787 = fma(_707, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _789 = ~as_type<int>(_705);
    int _791 = _789 + 1;
    int _793 = _791 + 1;
    float _795 = _779 * _783;
    int _797 = _793;
    float _799 = _785;
    if (!_701)
    {
        int _801 = ~as_type<int>(_705);
        int _803 = _801 + 1;
        _797 = _803;
    }
    int _805 = _797;
    float _807 = _659 + _547;
    if (!_593)
    {
        _741 = _519;
    }
    float _809 = _741;
    float _811 = _735 * _795;
    float _813 = _809;
    if (_593)
    {
        _813 = _517;
    }
    float _815 = _813;
    float _817 = _745 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    if (_593)
    {
        _799 = _519;
    }
    float _819 = _799;
    float _821 = -_779;
    float _823 = _821 + 1.0;
    bool _825 = _713 > 0.0;
    float _827 = _657 + _565;
    bool _829 = _713 >= 0.0;
    bool _831 = isnan(_713);
    bool _833 = _829 || _831;
    bool _835 = isnan(0.0);
    bool _837 = _833 || _835;
    float _839 = _687 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _841 = _611 + 0.5;
    float _843 = _819 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _845 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _767);
    float _847 = fma(_839, _841, _733);
    float _849 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _851 = -_845;
    float _853 = _851 + 1.0;
    int _855 = _729 ? 0 : 1;
    float _857 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[83].z, _849);
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _861 = _667 + (-0.5);
    float _863 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _865 = _815 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _867 = fma(_843, -2.0, _859);
    float _869 = -_817;
    float _871 = -_765;
    float _873 = fma(_869, _861, _871);
    float _875 = _525 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    int _877 = _837 ? 0 : 1;
    float _879 = -_863;
    float _881 = fma(_865, 2.0, _879);
    float _883 = _553 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _885 = _679 + (-0.5);
    float _887 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _867);
    float _889 = fma(_823, (*spvDescriptorSet0.vp_c9)._m0[131].x, _811);
    int _891 = ~_877;
    int _893 = _891 + 1;
    int _895 = _893 + 1;
    float _897 = _711 + 0.5;
    int _899 = _895;
    float _901 = _827;
    if (!_825)
    {
        int _903 = ~_877;
        int _905 = _903 + 1;
        _899 = _905;
    }
    int _907 = _899;
    float _909 = -_139;
    float _911 = fma(_909, (*spvDescriptorSet0.vp_c9)._m0[81].x, _881);
    float _913 = -_883;
    float _915 = -_887;
    float _917 = fma(_913, _885, _915);
    float _919 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _921 = _631 + _919;
    float _923 = fma(_875, _897, _911);
    float _925 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _927 = _807 + _925;
    float _929 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _857);
    float _931 = _921 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _933 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _935 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[132].x, _889);
    float _937 = -_929;
    float _939 = _937 + 1.0;
    float _941 = fma(_927, (*spvDescriptorSet0.vp_c8)._m0[28].x, _931);
    float _943 = fma(_517, (*spvDescriptorSet0.vp_c9)._m0[78].z, _933);
    bool _945 = !_619;
    int _947 = _945 ? 0 : 1;
    float _949 = -_939;
    float _951 = fma(_711, _949, _923);
    bool _953 = !_623;
    int _955 = _953 ? 0 : 1;
    float _957 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _943);
    int _959 = ~_855;
    int _961 = _959 + 1;
    int _963 = _961 + 1;
    float _965 = fma(_679, _853, _917);
    int _967 = _963;
    if (!_715)
    {
        int _969 = ~_855;
        int _971 = _969 + 1;
        _967 = _971;
    }
    int _973 = _967;
    float _975 = -_957;
    float _977 = _975 + 1.0;
    int _979 = abs(_955);
    float _981 = _921 * _921;
    int _983 = abs(_947);
    float _985 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _987 = _827 + _985;
    float _989 = float(_805);
    float _991 = fma(_927, _927, _981);
    float _993 = -_607;
    float _995 = _993 + 1.0;
    float _997 = fma(_987, (*spvDescriptorSet0.vp_c8)._m0[28].z, _941);
    float _999 = in.m_70.x;
    float _1001 = in.m_70.y;
    float _1003 = in.m_70.z;
    float _1005 = fma(_987, _987, _991);
    float _1007 = fma(_667, _995, _873);
    float _1009 = exp2(_601);
    bool _1011 = _997 >= 0.0;
    float _1013 = -_977;
    float _1015 = fma(_611, _1013, _847);
    float _1017 = float(_983);
    bool _1019 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1021 = isnan(1.0);
    bool _1023 = _1019 || _1021;
    bool _1025 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1027 = _1023 || _1025;
    float _1029 = rsqrt(_1005);
    float _1031 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1033 = 1.0 + _1031;
    float _1035 = _1017 * _989;
    float _1037 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1039 = float(_979);
    float _1041 = 1.0 / _1033;
    float _1043 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1045 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1047 = float(_973);
    float _1049 = _1035 * (-2.0);
    float _1051 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1053 = -_1009;
    float _1055 = _1053 + 1.0;
    float _1057 = _1043 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1059 = _1045 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1061 = _1033;
    if (_1011)
    {
        _1061 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1063 = _1061;
    float _1065 = _935 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _1067 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1069 = isnan(0.0);
    bool _1071 = _1067 || _1069;
    bool _1073 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1075 = _1071 || _1073;
    float _1077 = _1039 * _1047;
    out.m_72.x = _1015;
    out.m_72.y = _1007;
    out.m_72.z = _951;
    out.m_72.w = _965;
    float _1079 = fma(_787, _1049, _787);
    int _1081 = as_type<int>(_1063);
    if (_1011)
    {
        float _1083 = _1063 * 5.0;
        _1081 = as_type<int>(_1083);
    }
    int _1085 = _1081;
    float _1087 = fma(_1049, _999, _999);
    float _1089 = _1075 ? _1055 : 0.0;
    out.m_74.x = _1057;
    out.m_74.y = _1059;
    out.m_74.z = _1051;
    out.m_74.w = _1065;
    float _1091 = _1077 * (-2.0);
    float _1093 = _517 + (-0.5);
    float _1095 = _1003;
    if (_1011)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4230 = as_type<float>(_1085);
        out.gl_Position.z = _4230;
    }
    float _1097 = fma(_699, _1091, _699);
    float _1099 = fma(_1093, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1087);
    if (_1027)
    {
        float _1101 = _1089 * _1041;
        _143 = _1101;
    }
    float _1103 = _143;
    float _1105 = _921 * _1029;
    if (_1011)
    {
        out.m_51.x = 0.0;
    }
    float _1107 = fma(_1091, _1001, _1001);
    bool _1109 = !_627;
    int _1111 = _1109 ? 0 : 1;
    float _1113 = -_1105;
    float _1115 = fma(_1113, (*spvDescriptorSet0.vp_c9)._m0[18].w, _921);
    float _1117 = _927 * _1029;
    float _1119 = _1115 * _1115;
    float _1121 = -_1117;
    float _1123 = fma(_1121, (*spvDescriptorSet0.vp_c9)._m0[18].w, _927);
    if (_1011)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1125 = -_1105;
    float _1127 = fma(_1125, (*spvDescriptorSet0.vp_c9)._m0[18].w, _631);
    float _1129 = _987 * _1029;
    float _1131 = -_1117;
    float _1133 = fma(_1131, (*spvDescriptorSet0.vp_c9)._m0[18].w, _807);
    int _1135 = abs(_1111);
    float _1137 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1139 = _1127 + _1137;
    float _1141 = -_1129;
    float _1143 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[18].w, _827);
    float _1145 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1147 = _1133 + _1145;
    float _1149 = _519 + (-0.5);
    float _1151 = _1139 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1153 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1155 = _1143 + _1153;
    float _1157 = float(_907);
    float _1159 = fma(_1149, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1107);
    float _1161 = fma(_1147, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1151);
    float _1163 = _521 + _517;
    float _1165 = fma(_1079, _1103, _1099);
    float _1167 = fma(_1123, _1123, _1119);
    float _1169 = fma(_1155, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1161);
    float _1171 = float(_1135);
    float _1173 = -_1129;
    float _1175 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[18].w, _987);
    float _1177 = fma(_1097, _1103, _1159);
    float _1179 = _1163 + (-1.0);
    bool _1181 = _1169 >= 0.0;
    float _1183 = _1171 * _1157;
    float _1185 = _1165 * 0.15915493667125701904296875;
    float _1187 = fma(_1175, _1175, _1167);
    float _1189 = _1183 * (-2.0);
    float _1191 = _1177 * 0.15915493667125701904296875;
    float _1193 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1195 = _1185 * 6.283185482025146484375;
    float _1197 = sin(_1195);
    float _1199 = fma(_1189, _1003, _1003);
    float _1201 = _521 + (-0.5);
    float _1203 = fma(_1193, _1189, _1193);
    int _1205 = as_type<int>(_1201);
    float _1207 = _1147;
    if (_1181)
    {
        _1095 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1209 = _1095;
    float _1211 = fma(_1201, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1199);
    float _1213 = _1185 * 6.283185482025146484375;
    float _1215 = cos(_1213);
    if (_1181)
    {
        out.m_51.x = 0.0;
    }
    if (_1181)
    {
        float _1217 = _1209 * 5.0;
        _1205 = as_type<int>(_1217);
    }
    int _1219 = _1205;
    float _1221 = fma(_1203, _1103, _1211);
    if (_1181)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4459 = as_type<float>(_1219);
        out.gl_Position.z = _4459;
    }
    float _1223 = sqrt(_1187);
    float _1225 = _1221 * 0.15915493667125701904296875;
    float _1227 = _1191 * 6.283185482025146484375;
    float _1229 = sin(_1227);
    float _1231 = _1191 * 6.283185482025146484375;
    float _1233 = cos(_1231);
    if (_1181)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1235 = _1225 * 6.283185482025146484375;
    float _1237 = cos(_1235);
    float _1239 = _1029 * _1223;
    float _1241 = _459 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1243 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _179);
    float _1245 = _461 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1247 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _175);
    float _1249 = _1239 * _1241;
    float _1251 = _1197 * _1229;
    float _1253 = _1225 * 6.283185482025146484375;
    float _1255 = sin(_1253);
    float _1257 = _1239 * _1245;
    float _1259 = _1243 * _1249;
    float _1261 = _1215 * _1233;
    float _1263 = _1215 * _1229;
    float _1265 = _1247 * _1257;
    float _1267 = _1197 * _1233;
    float _1269 = _1215 * _1237;
    float _1271 = _1233 * _1237;
    float _1273 = _1197 * _1237;
    float _1275 = _1229 * _1237;
    float _1277 = _1269 * _1259;
    float _1279 = _1239 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1281 = _1279 * 0.5;
    float _1283 = fma(_1255, _1261, _1251);
    float _1285 = -_1267;
    float _1287 = fma(_1255, _1263, _1285);
    float _1289 = -_1259;
    float _1291 = _1255 * _1289;
    float _1293 = -_1263;
    float _1295 = fma(_1255, _1267, _1293);
    float _1297 = fma(_1283, _1265, _1277);
    float _1299 = _1273 * _1259;
    float _1301 = fma(_1271, _1265, _1291);
    float _1303 = fma(_1255, _1251, _1261);
    float _1305 = fma(_1287, _1281, _1297);
    float _1307 = fma(_1295, _1265, _1299);
    float _1309 = fma(_1275, _1281, _1301);
    float _1311 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1313 = fma(_1303, _1281, _1307);
    float _1315 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1317 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1311);
    float _1319 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1315);
    float _1321 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1317);
    float _1323 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1319);
    float _1325 = _1321 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1327 = _1323 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1329 = _827 + _1325;
    float _1331 = _1305 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1333 = _807 + _1327;
    float _1335 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1337 = _1329 + _1335;
    float _1339 = fma(_1309, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1331);
    float _1341 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1343 = _1333 + _1341;
    float _1345 = _1337 * _1337;
    float _1347 = fma(_1313, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1339);
    float _1349 = fma(_1343, _1343, _1345);
    float _1351 = _1347 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1353 = sqrt(_1349);
    float _1355 = _631 + _1351;
    bool _1357 = _1353 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1359 = _1345;
    float _1361 = _1351;
    float _1363 = _1329;
    float _1365 = _1349;
    if (!_1357)
    {
        _1359 = _1333;
    }
    float _1367 = _1359;
    float _1369 = _1367;
    if (!_1357)
    {
        _1361 = _1355;
    }
    float _1371 = _1361;
    bool _1373 = !_1357;
    float _1375 = _1371;
    if (!_1373)
    {
        float _1377 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1379 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1381 = _1353 + _1379;
        float _1383 = _1355 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1385 = rsqrt(_1349);
        float _1387 = _1381 * _1377;
        float _1389 = _1387 * 0.15915493667125701904296875;
        float _1391 = _1389 * 6.283185482025146484375;
        float _1393 = cos(_1391);
        float _1395 = _1389 * 6.283185482025146484375;
        float _1397 = sin(_1395);
        float _1399 = _1393 + (-1.0);
        float _1401 = fma(_1397, _1383, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1403 = _1399 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1405 = _1385 * _1401;
        float _1407 = fma(_1355, _1393, _1403);
        float _1409 = fma(_1343, _1405, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1411 = fma(_1337, _1405, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1369 = _1409;
        _1363 = _1411;
        _1375 = _1407;
    }
    float _1413 = _1369;
    float _1415 = _1363;
    float _1417 = _1375;
    float _1419 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _1421 = _1413 + _1419;
    float _1423 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _1425 = _1415 + _1423;
    float _1427 = fma(_1421, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _1429 = fma(_1425, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _4802 = float2(_1427, _1429);
    float _1431 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_4802, float2(0.0), isnan(_4802)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_4802, float2(0.0), isnan(_4802)), level(0.0)).x;
    bool _1433 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1435 = isnan(0.5);
    bool _1437 = _1433 || _1435;
    bool _1439 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1441 = _1437 || _1439;
    bool _1443 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1445 = isnan(0.5);
    bool _1447 = _1443 || _1445;
    bool _1449 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1451 = _1447 || _1449;
    float _1453 = fma(_1431, 100.0, _631);
    float _1455 = -_1105;
    float _1457 = fma(_1455, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1453);
    float _1459 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1461 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1459);
    float _1463 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1461);
    float _1465 = _1457 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1467 = _1463 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1469 = fma(_1133, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1465);
    float _1471 = 1.0 / _1467;
    float _1473 = fma(_1143, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1469);
    float _1475 = _1473 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1477 = _1475 + _1467;
    float _1479 = _1467;
    if (_1451)
    {
        _1479 = 1.0;
    }
    float _1481 = _1479;
    float _1483 = _1477 * _1471;
    float _1485 = _1483 * 0.5;
    float _1487 = fma(_1431, 100.0, _1417);
    float _1489 = -_1117;
    float _1491 = fma(_1489, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1413);
    float _1493 = -_1129;
    float _1495 = fma(_1493, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1415);
    float _1497 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1499 = fma(_1485, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1497);
    float _1501 = -_1105;
    float _1503 = fma(_1501, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1487);
    float _1505 = _1487;
    float _1507 = _1495;
    float _1509 = _1503;
    float _1511 = _1491;
    float _1513 = _1481;
    if (_1441)
    {
        _1505 = _1495;
    }
    float _1515 = _1505;
    float _1517 = 1.0 / _1499;
    float _1519 = _1515;
    if (!_1441)
    {
        float _1521 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1523 = _1457 + _1521;
        float _1525 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1527 = -_827;
        float _1529 = _1527 + _1415;
        float _1531 = -_631;
        float _1533 = _1531 + _1417;
        float _1535 = _1523 * _1523;
        float _1537 = -_807;
        float _1539 = _1537 + _1413;
        float _1541 = fma(_1147, _1147, _1535);
        float _1543 = 1.0 / _1239;
        float _1545 = fma(_1155, _1155, _1541);
        float _1547 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1549 = sqrt(_1545);
        float _1551 = precise::min(_1549, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1553 = _1551 * _1525;
        float _1555 = _1547 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1557 = _1553 * _1543;
        float _1559 = _1555 * _1557;
        float _1561 = _1529 * _1557;
        float _1563 = fma(_1533, _1559, _1457);
        float _1565 = fma(_1539, _1559, _1133);
        float _1567 = fma(_1555, _1561, _1143);
        _1507 = _1549;
        _1509 = _1563;
        _1511 = _1565;
        _1519 = _1567;
        _1207 = _1553;
        _901 = _1561;
    }
    float _1569 = _1507;
    float _1571 = _1509;
    float _1573 = _1511;
    float _1575 = _1519;
    float _1577 = _1207;
    float _1579 = _901;
    float _1581 = _1579;
    float _1583 = _1569;
    float _1585 = _1577;
    if (_1451)
    {
        _1581 = 1.0;
    }
    float _1587 = _1581;
    float _1589 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1591 = _1517 * _1589;
    float _1593 = _1587;
    if (!_1451)
    {
        float _1595 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1597 = _1595 * 0.15915493667125701904296875;
        float _1599 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1603 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1601;
        float _1605 = _1597 * 6.283185482025146484375;
        float _1607 = cos(_1605);
        float _1609 = _1599 * 0.15915493667125701904296875;
        float _1611 = _1597 * 6.283185482025146484375;
        float _1613 = sin(_1611);
        float _1615 = 1.0 / _1607;
        float _1617 = _1609 * 6.283185482025146484375;
        float _1619 = cos(_1617);
        float _1621 = _1613 * _1615;
        float _1623 = _1609 * 6.283185482025146484375;
        float _1625 = sin(_1623);
        float _1627 = _1619 * _1621;
        float _1629 = 1.0 / _1603;
        float _1631 = 1.0 / _1627;
        float _1633 = _1625 * _1631;
        float _1635 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1637 = fma(_1591, _1633, _1635);
        float _1639 = _1637 * _1629;
        float _1641 = precise::clamp(_1639, 0.0, 1.0);
        _1583 = _1621;
        _1585 = _1609;
        _1513 = _1641;
    }
    float _1643 = _1583;
    float _1645 = _1585;
    float _1647 = _1513;
    float _1649 = _1643;
    float _1651 = _1645;
    if (!_1451)
    {
        float _1653 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1655 = _1653 * 0.15915493667125701904296875;
        float _1657 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1659 = _1655 * 6.283185482025146484375;
        float _1661 = cos(_1659);
        float _1663 = _1657 * 0.15915493667125701904296875;
        float _1665 = _1655 * 6.283185482025146484375;
        float _1667 = sin(_1665);
        float _1669 = 1.0 / _1661;
        float _1671 = _1663 * 6.283185482025146484375;
        float _1673 = cos(_1671);
        float _1675 = _1667 * _1669;
        float _1677 = _1663 * 6.283185482025146484375;
        float _1679 = sin(_1677);
        float _1681 = _1673 * _1675;
        float _1683 = 1.0 / _1681;
        float _1685 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1687 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1685;
        float _1689 = 1.0 / _1687;
        float _1691 = _1679 * _1683;
        float _1693 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1695 = fma(_1591, _1691, _1693);
        float _1697 = _1695 * _1689;
        float _1699 = precise::clamp(_1697, 0.0, 1.0);
        float _1701 = -_1699;
        float _1703 = _1701 + 1.0;
        _1649 = _1681;
        _1593 = _1703;
    }
    float _1705 = _1649;
    float _1707 = _1593;
    float _1709 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1711 = _1571 + _1709;
    float _1713 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1715 = _1573 + _1713;
    float _1717 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1719 = _1575 + _1717;
    float _1721 = _1711 * _1711;
    float _1723 = fma(_1715, _1715, _1721);
    float _1725 = fma(_1719, _1719, _1723);
    float _1727 = rsqrt(_1725);
    float _1729 = sqrt(_1725);
    float _1731 = _1727 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1733 = _1715 * _1731;
    float _1735 = _1719 * _1731;
    float _1737 = _1733 * _1733;
    float _1739 = _1735 * _1735;
    float _1741 = _1737 + _1739;
    float _1743 = sqrt(_1741);
    bool _1745 = _1743 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1747 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1749 = _1743 + _1747;
    float _1751 = _1719;
    float _1753 = _1727;
    float _1755 = _1749;
    if (_1745)
    {
        float _1757 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1751 = _1757;
    }
    float _1759 = _1751;
    if (_1745)
    {
        float _1761 = rsqrt(_1741);
        _1753 = _1761;
    }
    float _1763 = _1753;
    float _1765 = _1763;
    if (_1745)
    {
        float _1767 = _1749 * _1759;
        _1755 = _1767;
    }
    float _1769 = _1755;
    if (_1745)
    {
        float _1771 = _1769 * 0.15915493667125701904296875;
        _1651 = _1771;
    }
    float _1773 = _1651;
    float _1775 = _1759;
    float _1777 = _1773;
    if (_1745)
    {
        float _1779 = _1773 * 6.283185482025146484375;
        float _1781 = sin(_1779);
        _1775 = _1781;
    }
    float _1783 = _1775;
    float _1785 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1787 = precise::max(0.0, _1785);
    float _1789 = _1705;
    float _1791 = _1787;
    if (_1745)
    {
        float _1793 = _1773 * 6.283185482025146484375;
        float _1795 = cos(_1793);
        _1789 = _1795;
    }
    float _1797 = _1789;
    float _1799 = -_1731;
    float _1801 = -_1787;
    float _1803 = fma(_1711, _1799, _1801);
    float _1805 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1745)
    {
        float _1807 = _1803 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1791 = _1807;
    }
    float _1809 = _1791;
    float _1811 = _1809;
    if (!_1745)
    {
        _1777 = _1737;
    }
    float _1813 = _1777;
    float _1815 = fma(_1133, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1817 = _1783;
    float _1819 = _1813;
    if (_1745)
    {
        float _1821 = fma(_1783, _1809, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1811 = _1821;
    }
    float _1823 = _1811;
    float _1825 = _1823;
    if (!_1745)
    {
        _1817 = _1735;
    }
    float _1827 = _1817;
    float _1829 = _1827;
    float _1831 = _1797;
    if (_1745)
    {
        float _1833 = _1797 + (-1.0);
        _1805 = _1833;
    }
    float _1835 = _1805;
    float _1837 = _1835;
    if (_1745)
    {
        float _1839 = _1763 * _1823;
        _1365 = _1839;
    }
    float _1841 = _1365;
    if (!_1745)
    {
        _1765 = _1733;
    }
    float _1843 = _1765;
    float _1845 = fma(_1143, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1847 = _1843;
    if (_1745)
    {
        float _1849 = _1835 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1837 = _1849;
    }
    float _1851 = _1837;
    if (_1745)
    {
        float _1853 = _1733 * _1841;
        _1847 = _1853;
    }
    float _1855 = _1847;
    if (!_1745)
    {
        _1825 = _1803;
    }
    float _1857 = _1825;
    float _1859 = _1857;
    if (_1745)
    {
        float _1861 = _1735 * _1841;
        _1829 = _1861;
    }
    float _1863 = _1829;
    if (_1745)
    {
        float _1865 = fma(_1803, _1797, _1851);
        _1859 = _1865;
    }
    float _1867 = _1859;
    if (_1745)
    {
        float _1869 = _1855 * _1855;
        _1819 = _1869;
    }
    float _1871 = _1819;
    if (!_1745)
    {
        _1831 = _1739;
    }
    float _1873 = _1831;
    float _1875 = _1873;
    if (_1745)
    {
        float _1877 = _1863 * _1863;
        _1875 = _1877;
    }
    float _1879 = _1875;
    float _1881 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1883 = fma(_1867, _1867, _1871);
    float _1885 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1887 = _1883 + _1879;
    float _1889 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1881);
    float _1891 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1893 = fma(_1729, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1891);
    float _1895 = precise::clamp(_1893, 0.0, 1.0);
    float _1897 = floor(_1815);
    float _1899 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1885);
    float _1901 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1889);
    float _1903 = -_1895;
    float _1905 = _1903 + 1.0;
    float _1907 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1909 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1911 = _1901 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1913 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1899);
    float _1915 = rsqrt(_1887);
    float _1917 = _1911 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1919 = _1913 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1921 = -_1917;
    float _1923 = fma(_1921, _1907, 1.0);
    float _1925 = _1571 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1927 = abs(_1905);
    float _1929 = log2(_1927);
    float _1931 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1909);
    float _1933 = -_1897;
    float _1935 = _1815 + _1933;
    float _1937 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1931);
    float _1939 = _1915 * _1855;
    float _1941 = _1915 * _1867;
    float _1943 = _1915 * _1863;
    float _1945 = fma(_1573, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1925);
    float _1947 = _1939 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1949 = _1937 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1951 = floor(_1845);
    float _1953 = fma(_1575, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1945);
    float _1955 = -_1947;
    float _1957 = fma(_1941, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1955);
    float _1959 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1961 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1963 = _1953 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1965 = -_1943;
    float _1967 = fma(_1965, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1957);
    float _1969 = log2(_1923);
    float _1971 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1959);
    float _1973 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1975 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1971);
    float _1977 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1973);
    float _1979 = exp2(_1961);
    float _1981 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1975);
    float _1983 = fma(_1967, -0.5, 0.5);
    float _1985 = fma(_1967, 0.5, 0.5);
    float _1987 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1989 = -_1951;
    float _1991 = _1845 + _1989;
    float _1993 = fma(_1985, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1995 = 1.0 / _1981;
    float _1997 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1987);
    float _1999 = _1941 + 1.0;
    float _2001 = fma(_1985, _1993, -0.212114393711090087890625);
    float _2003 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1977);
    float _2005 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1997);
    float _2007 = sqrt(_1983);
    float _2009 = -_1941;
    float _2011 = fma(_1979, _1999, _2009);
    float _2013 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2003);
    float _2015 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2005);
    float _2017 = _1969 * 0.693147182464599609375;
    float2 _5721 = float2(_1935, _1991);
    float _2019 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5721, float2(0.0), isnan(_5721)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5721, float2(0.0), isnan(_5721)), level(0.0)).x;
    float _2021 = fma(_1985, _2001, 1.570728778839111328125);
    float _2023 = fma(_2011, 0.5, 0.5);
    float _2025 = _2013 * _1995;
    float _2027 = _2015 * _1995;
    float _2029 = _2017 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2031 = fma(_2025, 0.5, 0.5);
    float _2033 = fma(_2027, -0.5, 0.5);
    float _2035 = _2007 * 0.636619746685028076171875;
    float _2037 = -_2021;
    float _2039 = fma(_2035, _2037, 1.0);
    float3 _5758 = float3(_2031, _2033, _2029);
    float _2041 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5758, float3(0.0), isnan(_5758)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5758, float3(0.0), isnan(_5758)), level(0.0)).x;
    float3 _5769 = float3(_2031, _2033, _2029);
    float4 _2044 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5769, float3(0.0), isnan(_5769)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5769, float3(0.0), isnan(_5769)), level(0.0)).xyzw;
    float _2046 = _2044.x;
    float _2048 = _2044.y;
    float _2050 = _2044.z;
    float _2052 = _2044.w;
    float2 _5785 = float2(_2039, _2023);
    float3 _2056 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5785, float2(0.0), isnan(_5785)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5785, float2(0.0), isnan(_5785)), level(0.0)).xyz;
    float _2058 = _2056.x;
    float _2060 = _2056.y;
    float _2062 = _2056.z;
    float _2064 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2066 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2068 = _1283 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2070 = _179 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2072 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2064);
    float _2074 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2066);
    float _2076 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2078 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2080 = _1269 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2082 = fma(_1271, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2068);
    float _2084 = -_1255;
    float _2086 = fma(_2084, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2076);
    float _2088 = -_1255;
    float _2090 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2078);
    float _2092 = -_1255;
    float _2094 = fma(_2092, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2080);
    float _2096 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2072);
    float _2098 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2086);
    float _2100 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2090);
    float _2102 = fma(_1273, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2094);
    float _2104 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2074);
    float _2106 = fma(_1295, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2082);
    float _2108 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2110 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2112 = _1287 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2114 = _2070 * _2098;
    float _2116 = _175 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2118 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2108);
    float _2120 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2110);
    float _2122 = fma(_1275, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2112);
    float _2124 = _2070 * _2100;
    float _2126 = _2070 * _2102;
    float _2128 = fma(_2116, _2096, _2114);
    float _2130 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2118);
    float _2132 = abs(_1591);
    float _2134 = log2(_2132);
    float _2136 = fma(_2116, _2106, _2126);
    float _2138 = fma(_2116, _2104, _2124);
    float _2140 = _2130 + _2128;
    float _2142 = _1929 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2144 = _1949 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2146 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2120);
    float _2148 = fma(_1303, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2122);
    float _2150 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2144);
    float _2152 = exp2(_2142);
    float _2154 = in.m_68.x;
    float _2156 = _2146 + _2138;
    float _2158 = _2148 + _2136;
    bool _2160 = _1729 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2162 = isnan(_1729);
    bool _2164 = _2160 || _2162;
    bool _2166 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2168 = _2164 || _2166;
    float _2170 = _2134 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    out.m_76.x = _2140;
    out.m_76.y = _2156;
    out.m_76.z = _2158;
    float _2172 = exp2(_2170);
    float _2174 = -_2152;
    float _2176 = _2174 + 1.0;
    float _2178 = fma(_2172, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2180 = precise::clamp(_2178, 0.0, 1.0);
    bool _2182 = _1591 <= 8000.0;
    bool _2184 = isnan(_1591);
    bool _2186 = _2182 || _2184;
    bool _2188 = isnan(8000.0);
    bool _2190 = _2186 || _2188;
    float _2192 = float(_2190);
    float _2194 = _1981 * 0.5;
    float _2196 = fma(_2180, -2.0, 3.0);
    float _2198 = _2180 * _2180;
    float _2200 = fma(_2015, -0.5, _2194);
    float _2202 = _2176 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2204 = _2198 * _2196;
    float _2206 = fma(_1911, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2150);
    float _2208 = -_2204;
    float _2210 = _2208 + 1.0;
    float _2212 = fma(_1919, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2206);
    float _2214 = fma(_2210, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2204);
    float _2216 = _2212 + _1981;
    out.gl_Position.x = _2013;
    out.gl_Position.y = _2015;
    out.gl_Position.z = _2212;
    out.gl_Position.w = _1981;
    float _2218 = _2013 + _1981;
    float _2220 = _2192 * _2214;
    float _2222 = _2216 * 0.5;
    float _2224 = _2218 * 0.5;
    float _2226 = _2220 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    out.m_78.x = _2224;
    out.m_78.y = _2200;
    out.m_78.z = _2222;
    out.m_78.w = _1981;
    float _2228 = -_2019;
    float _2230 = _2228 + 1.0;
    float _2232 = _2230 * _2226;
    float _2234 = precise::clamp(_2232, 0.0, 1.0);
    float _2236 = -_2234;
    float _2238 = fma(_2236, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2240 = _2238 * _2154;
    float _2242 = _2202 * _2041;
    float _2244 = -_2202;
    float _2246 = _2244 + 1.0;
    float _2248 = _2052 * _2242;
    float _2250 = _2062 * _2242;
    float _2252 = _2052 * _2246;
    float _2254 = fma(_2060, _2248, _2048);
    float _2256 = fma(_2058, _2248, _2046);
    float _2258 = _2240 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2260 = fma(_2052, _2250, _2050);
    float _2262 = _1647 * _1707;
    float _2264 = _2048;
    float _2266 = _2058;
    float _2268 = _2050;
    float _2270 = _2046;
    float _2272 = _2248;
    float _2274 = _2262;
    if (!_2168)
    {
        _2264 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2276 = _2264;
    out.m_80.x = _2258;
    float _2278 = _2262 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2280 = _2276;
    float _2282 = _2276;
    if (!_2168)
    {
        _2266 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2284 = _2266;
    out.m_82.x = _2256;
    out.m_82.y = _2254;
    out.m_82.z = _2260;
    out.m_82.w = _2252;
    float _2286 = _2284;
    float _2288 = _2284;
    if (!_2168)
    {
        _2268 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2290 = _2268;
    float _2292 = _2290;
    float _2294 = _2290;
    if (!_2168)
    {
        _2270 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2296 = _2270;
    float _2298 = _2296;
    float _2300 = _2296;
    if (!_2168)
    {
        _2272 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2302 = _2272;
    float _2304 = _2302;
    float _2306 = _2302;
    if (!_2168)
    {
        _2274 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2308 = _2274;
    bool _2310 = !_2168;
    float _2312 = _2308;
    float _2314 = _2308;
    if (!_2310)
    {
        bool _2316 = _1729 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2318 = isnan(_1729);
        bool _2320 = _2316 || _2318;
        bool _2322 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2324 = _2320 || _2322;
        if (!_2324)
        {
            float _2326 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2328 = _1729 + _2326;
            float _2330 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2332 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2330;
            float _2334 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2336 = _2334 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2338 = 1.0 / _2332;
            float _2340 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2342 = _2340 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2344 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2346 = _2344 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2348 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2350 = _2348 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2352 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2354 = _2352 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2356 = _2328 * _2338;
            float _2358 = precise::clamp(_2356, 0.0, 1.0);
            float _2360 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2362 = _2360 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2364 = fma(_2358, _2336, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2366 = fma(_2358, _2342, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2368 = fma(_2358, _2362, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2370 = fma(_2358, _2346, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2372 = fma(_2358, _2350, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2374 = fma(_2358, _2354, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2288 = _2368;
            _2306 = _2372;
            _2282 = _2366;
            _2300 = _2364;
            _2294 = _2370;
            _2314 = _2374;
            _2376 = true;
        }
        else
        {
            bool _2378 = _1729 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2380 = isnan(_1729);
            bool _2382 = _2378 || _2380;
            bool _2384 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2386 = _2382 || _2384;
            if (!_2386)
            {
                _2280 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2388 = _2280;
            _2282 = _2388;
            if (!_2386)
            {
                _2286 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2390 = _2286;
            _2288 = _2390;
            if (!_2386)
            {
                _2292 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2392 = _2292;
            _2294 = _2392;
            if (!_2386)
            {
                _2298 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2394 = _2298;
            _2300 = _2394;
            if (!_2386)
            {
                _2304 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2396 = _2304;
            _2306 = _2396;
            if (!_2386)
            {
                _2312 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2398 = _2312;
            bool _2400 = !_2386;
            _2314 = _2398;
            if (!_2400)
            {
                bool _2402 = _1729 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2404 = isnan(_1729);
                bool _2406 = _2402 || _2404;
                bool _2408 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2410 = _2406 || _2408;
                if (!_2410)
                {
                    float _2412 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2414 = _1729 + _2412;
                    float _2416 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2418 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2416;
                    float _2420 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2422 = _2420 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2424 = 1.0 / _2418;
                    float _2426 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2428 = _2426 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2430 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2432 = _2430 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2434 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2436 = _2434 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2438 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2440 = _2438 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2442 = _2414 * _2424;
                    float _2444 = precise::clamp(_2442, 0.0, 1.0);
                    float _2446 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2448 = _2446 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2450 = fma(_2444, _2422, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2452 = fma(_2444, _2428, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2454 = fma(_2444, _2448, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2456 = fma(_2444, _2432, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2458 = fma(_2444, _2436, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2460 = fma(_2444, _2440, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2288 = _2454;
                    _2306 = _2458;
                    _2282 = _2452;
                    _2300 = _2450;
                    _2294 = _2456;
                    _2314 = _2460;
                    _2376 = true;
                }
                else
                {
                    _2288 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2306 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2282 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2300 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2294 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2314 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2376 = false;
    float _2462 = _2288;
    float _2464 = _2306;
    float _2466 = _2282;
    float _2468 = _2300;
    float _2470 = _2294;
    float _2472 = _2314;
    float _2474 = fma(_2156, -0.5, 0.5);
    float _2476 = precise::clamp(_2474, 0.0, 1.0);
    float _2478 = -_2462;
    float _2480 = _2478 + _2464;
    float _2482 = _2278 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2484 = -_2466;
    float _2486 = _2484 + _2468;
    float _2488 = fma(_2476, _2480, _2462);
    out.m_84.x = 0.0;
    float _2490 = -_2470;
    float _2492 = _2490 + _2472;
    float _2494 = fma(_2476, _2486, _2466);
    float _2496 = _2488 * 0.586610972881317138671875;
    out.m_51.x = _2482;
    bool _2498 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2500 = fma(_2476, _2492, _2470);
    float _2502 = fma(_2494, 0.298911988735198974609375, _2496);
    bool _2504 = _1647 > 0.0;
    bool _2506 = isnan(_1647);
    bool _2508 = _2504 || _2506;
    bool _2510 = isnan(0.0);
    bool _2512 = _2508 || _2510;
    float _2514 = fma(_2500, 0.114477999508380889892578125, _2502);
    bool _2516 = _1707 <= 0.0;
    bool _2518 = !_2512;
    bool _2520 = _2516 || _2518;
    float _2522 = -_2514;
    float _2524 = _2494 + _2522;
    float _2526 = -_2514;
    float _2528 = _2488 + _2526;
    float _2530 = -_2514;
    float _2532 = _2500 + _2530;
    float _2534 = fma(_2524, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2514);
    float _2536 = fma(_2528, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2514);
    float _2538 = fma(_2532, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2514);
    bool _2540 = !_2498;
    if (!_2540)
    {
        float _2542 = -_1571;
        float _2544 = _2542 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2546 = -_1573;
        float _2548 = _2546 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2550 = -_1575;
        float _2552 = _2550 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2554 = _2544 * _2544;
        float _2556 = fma(_2548, _2548, _2554);
        float _2558 = fma(_2552, _2552, _2556);
        float _2560 = sqrt(_2558);
        float _2562 = rsqrt(_2558);
        float _2564 = -_2560;
        float _2566 = _2564 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2568 = _2566 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2570 = precise::clamp(_2568, 0.0, 1.0);
        float _2572 = _2548 * _2562;
        float _2574 = _2544 * _2562;
        float _2576 = abs(_2570);
        float _2578 = log2(_2576);
        float _2580 = _2552 * _2562;
        float _2582 = _2572 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2584 = _2156 * _2574;
        float _2586 = -_2574;
        float _2588 = -_2582;
        float _2590 = fma(_2586, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2588);
        float _2592 = fma(_2140, _2572, _2584);
        float _2594 = -_2580;
        float _2596 = fma(_2594, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2590);
        float _2598 = fma(_2158, _2580, _2592);
        float _2600 = precise::clamp(_2598, 0.0, 1.0);
        float _2602 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2604 = _2596 + _2602;
        float _2606 = _2578 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2608 = _2604 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2610 = precise::clamp(_2608, 0.0, 1.0);
        float _2612 = exp2(_2606);
        float _2614 = _2612 * _2610;
        float _2616 = _2600 * _2614;
        float _2618 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2620 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2622 = _2616 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_84.x = _2618;
        out.m_84.y = _2620;
        out.m_84.z = _2622;
    }
    out.m_86.x = _2534;
    out.m_86.y = _2536;
    out.m_86.z = _2538;
    if (!_2520)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _2624 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.m_51.x = 0.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2624;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

