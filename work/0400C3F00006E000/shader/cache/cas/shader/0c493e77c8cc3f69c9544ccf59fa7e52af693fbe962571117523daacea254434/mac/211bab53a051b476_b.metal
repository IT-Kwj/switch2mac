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
    constant _16* vp_c7 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c13 [[id(5)]];
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
    float4 m_66 [[user(locn0)]];
    float4 m_76 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_90 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_82 [[user(locn6)]];
    float4 m_70 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_88 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_68 [[attribute(0)]];
    float4 m_72 [[attribute(1)]];
    float4 m_60 [[attribute(2)]];
    float4 m_48 [[attribute(3)]];
    float4 m_53 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3422 = false;
    bool _337 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3726 = as_type<float>(_123);
        out.gl_Position.z = _3726;
    }
    if (!_113)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _127 = in.m_53.w;
    float _129 = float(_109);
    float _131 = 1.0 / _129;
    float _133 = -_127;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_127);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = _135 * _131;
    bool _149 = _135 >= _129;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    out.m_55.x = _147;
    float _155 = _127;
    float _157 = _147;
    float _159 = _135;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _155;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _163 = _161 * 5.0;
        _125 = as_type<int>(_163);
    }
    int _165 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3799 = as_type<float>(_165);
        out.gl_Position.z = _3799;
    }
    if (_153)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_60.x;
    float _171 = in.m_60.y;
    float _173 = in.m_60.z;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_177;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _207 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _209 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _211 = !_183;
    float _213 = _207;
    float _231;
    if (!_211)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        _231 = _147;
    }
    _233 = false;
    float _235 = _231;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    float _241 = in.m_64.x;
    float _243 = in.m_64.y;
    bool _245 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _247 = isnan(_235);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    bool _261 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _263 = isnan(_235);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -_255;
    float _275 = _273 + 1.0;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = 1.0 / _259;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = _271 * _275;
    float _287 = -_271;
    float _289 = _287 + 1.0;
    float _291 = _239 * _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _293;
    float _297 = fma(_279, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _299 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _301 = _297 * _285;
    float _303 = _299 * _285;
    float _305 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].x, _301);
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _309 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    float _313 = _309 * _241;
    float _315 = _311 * _243;
    bool _317 = !_283;
    float _335;
    if (!_317)
    {
        float _319 = in.m_62.x;
        float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _323 = _319 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _327 = _325 * _321;
        float _329 = floor(_327);
        float _331 = -_329;
        float _333 = _327 + _331;
        _335 = _333;
        _337 = true;
    }
    else
    {
        _335 = _147;
    }
    _337 = false;
    float _339 = _335;
    bool _341 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _343 = isnan(_339);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _357 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _359 = isnan(_339);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _375 = _339 + _373;
    float _377 = -_351;
    float _379 = _377 + 1.0;
    bool _381 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _383 = 1.0 / _355;
    float _385 = _367 * _379;
    float _387 = -_367;
    float _389 = _387 + 1.0;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _393 = _391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _395 = _371 * _383;
    float _397 = fma(_395, _375, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _399 = _397 * _385;
    float _401 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[115].x, _399);
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _407 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[116].x, _401);
    float _409 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _407 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _409;
    out.m_66.y = _411;
    out.m_66.z = _393;
    out.m_66.w = _413;
    bool _415 = !_381;
    if (!_415)
    {
        float _417 = in.m_62.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _157 = _431;
    }
    float _433 = _157;
    float _435 = in.m_62.x;
    float _437 = in.m_62.y;
    float _439 = in.m_62.z;
    float _441 = in.m_62.w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _445 = in.m_68.y;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _453 = _451 != 0;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _461 = _459 != 0;
    float _463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _467 = _465 != 0;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _473 = 1.0 / _457;
    float _475 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _481 = _435 > 0.5;
    float _483 = _435 * 2.0;
    bool _485 = _441 > 0.5;
    float _487 = _439 * 2.0;
    float _489 = -_193;
    int _491 = _481 ? as_type<int>(_489) : as_type<int>(_193);
    float _493 = 1.0 / _471;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _501 = _499 != 0;
    float _503 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _505 = !_449;
    float _507 = _505 ? _193 : as_type<float>(_491);
    bool _509 = _437 > 0.5;
    float _511 = floor(_487);
    float _513 = -_203;
    int _515 = _509 ? as_type<int>(_513) : as_type<int>(_203);
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _519 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _523 = !_453;
    float _525 = _523 ? _203 : as_type<float>(_515);
    float _527 = -_517;
    float _529 = fma(_503, 2.0, _527);
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _533 = _531 != 0;
    float _535 = _437 * 2.0;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _545 = 1.0 / _479;
    float _547 = -_193;
    int _549 = _509 ? as_type<int>(_547) : as_type<int>(_193);
    float _551 = fma(_519, -2.0, _521);
    bool _553 = _439 > 0.5;
    float _555 = _543 * _473;
    float _557 = _539 * _493;
    float _559 = -_193;
    int _561 = _553 ? as_type<int>(_559) : as_type<int>(_193);
    float _563 = floor(_535);
    float _565 = -_203;
    int _567 = _553 ? as_type<int>(_565) : as_type<int>(_203);
    float _569 = _437 + _435;
    bool _571 = _511 > 0.0;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _573;
    bool _577 = !_497;
    float _579 = _577 ? _193 : as_type<float>(_549);
    float _581 = _569 + (-1.0);
    bool _583 = _511 >= 0.0;
    bool _585 = isnan(_511);
    bool _587 = _583 || _585;
    bool _589 = isnan(0.0);
    bool _591 = _587 || _589;
    float _593 = _437 + _439;
    float _595 = floor(_483);
    int _597 = _591 ? 0 : 1;
    float _599 = _575 * _545;
    float _601 = _593 + (-1.0);
    float _603 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _605 = !_501;
    float _607 = _605 ? _203 : as_type<float>(_567);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _611 = _433 + _609;
    int _613 = ~_597;
    int _615 = _613 + 1;
    int _617 = _615 + 1;
    float _619 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _621 = _563 > 0.0;
    float _623 = fma(_557, _611, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _625 = _563 >= 0.0;
    bool _627 = isnan(_563);
    bool _629 = _625 || _627;
    bool _631 = isnan(0.0);
    bool _633 = _629 || _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _637 = _433 + _635;
    int _639 = _617;
    float _641 = _557;
    if (!_571)
    {
        int _643 = ~_597;
        int _645 = _643 + 1;
        _639 = _645;
    }
    int _647 = _639;
    float _649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _653 = _433 + _651;
    float _655 = _653;
    if (!_533)
    {
        _641 = _439;
    }
    float _657 = _641;
    float _659 = fma(_555, _637, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _661 = _657;
    if (_533)
    {
        _661 = _437;
    }
    float _663 = _661;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _667 = _633 ? 0 : 1;
    float _669 = fma(_599, _653, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _671 = _595 >= 0.0;
    bool _673 = isnan(_595);
    bool _675 = _671 || _673;
    bool _677 = isnan(0.0);
    bool _679 = _675 || _677;
    float _681 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[83].w, _665);
    bool _683 = _595 > 0.0;
    float _685 = _507 + 0.5;
    float _687 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _551);
    int _689 = ~_667;
    int _691 = _689 + 1;
    int _693 = _691 + 1;
    float _695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _697 = _663;
    int _699 = _693;
    if (!_533)
    {
        _655 = _437;
    }
    float _701 = _655;
    float _703 = _579 + 0.5;
    float _705 = _701;
    if (!_533)
    {
        _697 = _439;
    }
    float _707 = _697;
    float _709 = -_607;
    float _711 = _709 + 0.5;
    float _713 = _707;
    if (!_621)
    {
        int _715 = ~_667;
        int _717 = _715 + 1;
        _699 = _717;
    }
    int _719 = _699;
    float _721 = -_135;
    float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[76].x, _529);
    if (_533)
    {
        _705 = _435;
    }
    float _725 = _705;
    float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_533)
    {
        _713 = _437;
    }
    float _729 = _713;
    float _731 = _703 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _733 = _679 ? 0 : 1;
    float _735 = _725 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _739 = _737 != 0;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _743 = _741 != 0;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _747 = _745 != 0;
    float _749 = _649 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _751 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _753 = isnan(_433);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _729 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _765 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _767 = isnan(_433);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = fma(_749, _685, _723);
    bool _779 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _781 = isnan(_433);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -_761;
    float _793 = _791 + 1.0;
    bool _795 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _797 = isnan(_433);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = -_775;
    float _809 = _807 + 1.0;
    float _811 = _775 * _793;
    float _813 = _805 * _809;
    float _815 = -_805;
    float _817 = _815 + 1.0;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _823 = _789 * _817;
    float _825 = _525 + (-0.5);
    float _827 = -_789;
    float _829 = _827 + 1.0;
    float _831 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[83].z, _821);
    float _833 = fma(_763, -2.0, _819);
    float _835 = -_475;
    float _837 = -_687;
    float _839 = fma(_835, _825, _837);
    float _841 = _623 * _823;
    float _843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _847 = _711 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _849 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[131].x, _841);
    float _851 = _731 * _463;
    float _853 = in.m_48.x;
    float _855 = in.m_48.y;
    float _857 = in.m_48.z;
    float _859 = -_845;
    float _861 = fma(_735, 2.0, _859);
    float _863 = -_203;
    int _865 = _485 ? as_type<int>(_863) : as_type<int>(_203);
    float _867 = _847 * _695;
    float _869 = _727 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _871 = fma(_659, _813, _849);
    bool _873 = !_461;
    float _875 = _873 ? _203 : as_type<float>(_865);
    float _877 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _833);
    out.m_70.x = _851;
    out.m_70.y = _867;
    float _879 = _843 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _881 = _875 + (-0.5);
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _885 = !_467;
    float _887 = _885 ? _193 : as_type<float>(_561);
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _891 = -_879;
    float _893 = -_877;
    float _895 = fma(_891, _881, _893);
    float _897 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _899 = log2(_897);
    float _901 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _883);
    float _903 = _887 + 0.5;
    float _905 = -_135;
    float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[81].x, _861);
    float _909 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _889);
    float _911 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _901);
    float _913 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _831);
    float _915 = _855 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _917 = _855 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _919 = fma(_869, _903, _907);
    float _921 = _855 + _445;
    float _923 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[6].x, _915);
    float _925 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[4].x, _917);
    float _927 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _909);
    float _929 = -_913;
    float _931 = _929 + 1.0;
    float _933 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[6].z, _923);
    float _935 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[4].z, _925);
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _939 = _921 + _937;
    float _941 = -_927;
    float _943 = _941 + 1.0;
    float _945 = _933 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _947 = -_911;
    float _949 = _947 + 1.0;
    float _951 = _935 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _953 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _681);
    float _955 = -_943;
    float _957 = fma(_507, _955, _777);
    float _959 = fma(_525, _949, _839);
    bool _961 = !_739;
    int _963 = _961 ? 0 : 1;
    float _965 = -_931;
    float _967 = fma(_887, _965, _919);
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _971 = _951 + _969;
    float _973 = _939 * _939;
    float _975 = _899 * _135;
    float _977 = -_953;
    float _979 = _977 + 1.0;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _983 = _945 + _981;
    int _985 = abs(_963);
    float _987 = fma(_971, _971, _973);
    float _989 = fma(_875, _979, _895);
    float _991 = in.m_72.x;
    float _993 = in.m_72.y;
    float _995 = in.m_72.z;
    bool _997 = !_743;
    int _999 = _997 ? 0 : 1;
    float _1001 = exp2(_975);
    float _1003 = fma(_983, _983, _987);
    float _1005 = fma(_669, _811, _871);
    int _1007 = abs(_999);
    float _1009 = _939 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1011 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1013 = isnan(1.0);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1019 = _1015 || _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1023 = 1.0 + _1021;
    float _1025 = rsqrt(_1003);
    float _1027 = float(_647);
    float _1029 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1009);
    float _1031 = float(_985);
    float _1033 = _313 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_74.x = _957;
    out.m_74.y = _959;
    out.m_74.z = _967;
    out.m_74.w = _989;
    bool _1035 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1037 = isnan(0.0);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1043 = _1039 || _1041;
    float _1045 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1029);
    float _1047 = 1.0 / _1023;
    float _1049 = _1031 * _1027;
    float _1051 = -_1001;
    float _1053 = _1051 + 1.0;
    int _1055 = ~_733;
    int _1057 = _1055 + 1;
    int _1059 = _1057 + 1;
    float _1061 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1005);
    int _1063 = _1059;
    float _1065 = as_type<float>(_1007);
    float _1067 = _945;
    if (!_683)
    {
        int _1069 = ~_733;
        int _1071 = _1069 + 1;
        _1063 = _1071;
    }
    int _1073 = _1063;
    float _1075 = _1043 ? _1053 : 0.0;
    bool _1077 = _1045 >= 0.0;
    float _1079 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1081 = _1049 * (-2.0);
    float _1083 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1085 = _1079 * _1025;
    float _1087 = fma(_603, _1081, _603);
    float _1089 = fma(_1081, _991, _991);
    float _1091 = _435 + (-0.5);
    float _1093 = _995;
    if (_1019)
    {
        float _1095 = _1075 * _1047;
        _159 = _1095;
    }
    float _1097 = _159;
    float _1099 = float(_1073);
    float _1101 = _939 * _1085;
    float _1103 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1089);
    float _1105 = _971 * _1085;
    float _1107 = fma(_1087, _1097, _1103);
    float _1109 = -_1101;
    float _1111 = _939 + _1109;
    float _1113 = float(_1007);
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1117 = _1101;
    if (_1077)
    {
        _1065 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1119 = _1065;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1125 = _1113 * _1099;
    int _1127 = as_type<int>(_1119);
    if (_1077)
    {
        float _1129 = _1119 * 5.0;
        _1127 = as_type<int>(_1129);
    }
    int _1131 = _1127;
    float _1133 = -_1105;
    float _1135 = _971 + _1133;
    float _1137 = _1111 * _1111;
    float _1139 = _983 * _1085;
    float _1141 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1145 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1147 = _1125 * (-2.0);
    float _1149 = fma(_1135, _1135, _1137);
    float _1151 = -_1139;
    float _1153 = _983 + _1151;
    float _1155 = _1149;
    if (_1077)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5394 = as_type<float>(_1131);
        out.gl_Position.z = _5394;
    }
    float _1157 = fma(_619, _1147, _619);
    float _1159 = fma(_1147, _993, _993);
    float _1161 = _437 + (-0.5);
    if (_1077)
    {
        out.m_51.x = 0.0;
    }
    bool _1163 = !_747;
    int _1165 = _1163 ? 0 : 1;
    out.m_76.x = _1141;
    out.m_76.y = _1143;
    out.m_76.z = _1145;
    out.m_76.w = _1083;
    float _1167 = fma(_1153, _1153, _1149);
    if (_1077)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1169 = -_1101;
    float _1171 = _921 + _1169;
    int _1173 = abs(_1165);
    float _1175 = -_1105;
    float _1177 = _951 + _1175;
    float _1179 = float(_719);
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1183 = _1171 + _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1187 = _1177 + _1185;
    float _1189 = -_1139;
    float _1191 = _945 + _1189;
    float _1193 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1195 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1159);
    float _1197 = _439 + _435;
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1201 = _1191 + _1199;
    float _1203 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1193);
    float _1205 = float(_1173);
    float _1207 = _1107 * 0.15915493667125701904296875;
    float _1209 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1203);
    float _1211 = _1197 + (-1.0);
    float _1213 = _1205 * _1179;
    float _1215 = fma(_1157, _1097, _1195);
    float _1217 = _439 + (-0.5);
    bool _1219 = _1209 >= 0.0;
    float _1221 = _1213 * (-2.0);
    float _1223 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1225 = _1215 * 0.15915493667125701904296875;
    float _1227 = sqrt(_1167);
    float _1229 = fma(_1221, _995, _995);
    float _1231 = fma(_1223, _1221, _1223);
    float _1233 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1229);
    float _1235 = _1207 * 6.283185482025146484375;
    float _1237 = sin(_1235);
    float _1239 = fma(_1231, _1097, _1233);
    if (_1219)
    {
        _1093 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1241 = _1093;
    int _1243 = as_type<int>(_1241);
    if (_1219)
    {
        out.m_51.x = 0.0;
    }
    float _1245 = _1239 * 0.15915493667125701904296875;
    if (_1219)
    {
        float _1247 = _1241 * 5.0;
        _1243 = as_type<int>(_1247);
    }
    int _1249 = _1243;
    float _1251 = _1207 * 6.283185482025146484375;
    float _1253 = cos(_1251);
    if (_1219)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5572 = as_type<float>(_1249);
        out.gl_Position.z = _5572;
    }
    float _1255 = _1225 * 6.283185482025146484375;
    float _1257 = sin(_1255);
    float _1259 = _1225 * 6.283185482025146484375;
    float _1261 = cos(_1259);
    float _1263 = _1245 * 6.283185482025146484375;
    float _1265 = sin(_1263);
    if (_1219)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1267 = _1245 * 6.283185482025146484375;
    float _1269 = cos(_1267);
    bool _1271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1273 = _1237 * _1257;
    float _1275 = _1253 * _1261;
    bool _1277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1279 = _1025 * _1227;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1283 = _1281 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1285 = fma(_1265, _1275, _1273);
    float _1287 = fma(_1265, _1273, _1275);
    float _1289 = _1253 * _1257;
    float _1291 = _1237 * _1261;
    float _1293 = _1099;
    float _1295 = _1291;
    if (_1271)
    {
        float _1297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1293 = _1297;
    }
    float _1299 = _1293;
    float _1301 = _1261 * _1269;
    float _1303 = _1253 * _1269;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1309 = _1033 * _1279;
    float _1311 = _315 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1313 = _1237 * _1269;
    float _1315 = 1.0 / _1283;
    float _1317 = _1257 * _1269;
    float _1319 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1323 = _1321 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1325 = -_1289;
    float _1327 = fma(_1265, _1291, _1325);
    float _1329 = -_1291;
    float _1331 = fma(_1265, _1289, _1329);
    if (_1271)
    {
        float _1333 = _435 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _1295 = _1333;
    }
    float _1335 = _1295;
    if (_1277)
    {
        float _1337 = _435 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _1155 = _1337;
    }
    float _1339 = _1155;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1345 = _1279 * _1311;
    float _1347 = _1207;
    float _1349 = _1345;
    if (_1277)
    {
        float _1351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _1347 = _1351;
    }
    float _1353 = _1347;
    float _1355 = _1319 * _1309;
    float _1357 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1359 = -_921;
    float _1361 = _1359 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1363 = _1357 * _1345;
    float _1365 = 1.0 / _1307;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1371 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1373 = _1371 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1375 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    if (_1271)
    {
        float _1377 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1349 = _1377;
    }
    float _1379 = _1349;
    if (_1277)
    {
        float _1381 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[14].z, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1375 = _1381;
    }
    float _1383 = _1375;
    float _1385 = -_951;
    float _1387 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1389 = 1.0 / _1323;
    float _1391 = _1361 * _1361;
    float _1393 = _1299;
    if (_1271)
    {
        float _1395 = _1379 * _1299;
        _1393 = _1395;
    }
    float _1397 = _1393;
    float _1399 = -_945;
    float _1401 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1407 = fma(_1387, _1387, _1391);
    float _1409 = _1353;
    if (_1277)
    {
        float _1411 = _1383 * _1353;
        _1409 = _1411;
    }
    float _1413 = _1409;
    float _1415 = 1.0 / _1343;
    float _1417 = fma(_1401, _1401, _1407);
    float _1419 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1421 = _1419 * 0.5;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1423;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1431 = 1.0 / _1369;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1433;
    float _1437 = _1425 * _1315;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1445 = _1443 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1447;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1455 = 1.0 / _1373;
    float _1457 = _1445 * _1365;
    float _1459 = _1441 * _1415;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1461;
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1467 = _1465 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1469 = 0.0;
    if (!_1277)
    {
        _1469 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1471 = _1469;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1473;
    float _1477 = 1.0 / _1405;
    float _1479 = _1429 * _1431;
    float _1481 = _1463 * _1389;
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1483;
    float _1487 = -_1363;
    float _1489 = _1265 * _1487;
    float _1491 = _855 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1493 = rsqrt(_1417);
    float _1495 = _1475 * _1455;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1499 = _1497 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1501 = _1303 * _1363;
    float _1503 = _1313 * _1363;
    float _1505 = fma(_1301, _1355, _1489);
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1507;
    float _1511 = fma(_1285, _1355, _1501);
    float _1513 = _1425;
    float _1515 = _1471;
    if (_1271)
    {
        float _1517 = floor(_1397);
        _1513 = _1517;
    }
    float _1519 = _1513;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1523 = _1521 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1525 = fma(_1327, _1355, _1503);
    float _1527 = fma(_1317, _1421, _1505);
    float _1529 = _1523 * _1477;
    float _1531 = _1523;
    if (!_1271)
    {
        _1531 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1533 = _1531;
    float _1535 = fma(_1331, _1421, _1511);
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1539 = _1533;
    if (_1277)
    {
        float _1541 = floor(_1413);
        _1537 = _1541;
    }
    float _1543 = _1537;
    float _1545 = _1387 * _1493;
    float _1547 = _1361 * _1493;
    float _1549 = _1401 * _1493;
    float _1551 = fma(_1287, _1421, _1525);
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1557 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1491);
    float _1559 = 1.0 / _1435;
    if (_1271)
    {
        float _1561 = -_1519;
        float _1563 = _1397 + _1561;
        _1539 = _1563;
    }
    float _1565 = _1539;
    float _1567 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1557);
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1571 = _1565 + _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1575 = _1565 + _1573;
    float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1579 = _1565 + _1577;
    float _1581 = 1.0 / _1453;
    if (_1277)
    {
        float _1583 = -_1543;
        float _1585 = _1413 + _1583;
        _1515 = _1585;
    }
    float _1587 = _1515;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1589;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1595 = _1565 + _1593;
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1599 = _1565 + _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1603 = _1587 + _1601;
    bool _1605 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1607 = isnan(_1587);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1613 = _1609 || _1611;
    float _1615 = float(_1613);
    float _1617 = _1567 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1619 = 1.0 / _1467;
    float _1621 = _1595 * _1559;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1625 = _1565 + _1623;
    float _1627 = fma(_1479, _1603, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1631 = _1587 + _1629;
    bool _1633 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1635 = isnan(_1587);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1647 = _1617 + _1645;
    bool _1649 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1651 = isnan(_1565);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = 1.0 / _1499;
    float _1663 = _1625 * _1581;
    float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1667 = _1587 + _1665;
    float _1669 = fma(_1481, _1631, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1673 = _1587 + _1671;
    bool _1675 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1677 = isnan(_1587);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = fma(_1437, _1667, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1691 = _1587 + _1689;
    float _1693 = 1.0 / _1449;
    float _1695 = _1571 * _1619;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1699 = _1565 + _1697;
    float _1701 = fma(_1457, _1691, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1705 = _1587 + _1703;
    float _1707 = fma(_1495, _1673, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    bool _1709 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1711 = isnan(_1587);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1717 = _1713 || _1715;
    float _1719 = float(_1717);
    float _1721 = fma(_1555, _1695, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1723 = 1.0 / _1485;
    float _1725 = _1699 * _1661;
    float _1727 = fma(_1529, _1705, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1731 = _1587 + _1729;
    bool _1733 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1735 = isnan(_1587);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1741 = _1737 || _1739;
    float _1743 = float(_1741);
    bool _1745 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1747 = isnan(_1565);
    bool _1749 = _1745 || _1747;
    bool _1751 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1753 = _1749 || _1751;
    float _1755 = float(_1753);
    float _1757 = fma(_1459, _1731, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1759 = 1.0 / _1591;
    float _1761 = _1575 * _1693;
    float _1763 = -_1615;
    float _1765 = _1763 + 1.0;
    bool _1767 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1769 = isnan(_1587);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1775 = _1771 || _1773;
    float _1777 = float(_1775);
    float _1779 = -_1755;
    float _1781 = _1779 + 1.0;
    float _1783 = _1743 * _1765;
    float _1785 = -_1743;
    float _1787 = _1785 + 1.0;
    float _1789 = _1579 * _1723;
    bool _1791 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1793 = isnan(_1587);
    bool _1795 = _1791 || _1793;
    bool _1797 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1799 = _1795 || _1797;
    float _1801 = float(_1799);
    float _1803 = -_1643;
    float _1805 = _1803 + 1.0;
    float _1807 = _1777 * _1787;
    float _1809 = -_1777;
    float _1811 = _1809 + 1.0;
    bool _1813 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1815 = isnan(_1587);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = _1615 * _1805;
    float _1827 = -_1719;
    float _1829 = _1827 + 1.0;
    float _1831 = _1801 * _1811;
    float _1833 = _1599 * _1759;
    bool _1835 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1837 = isnan(_1565);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    float _1847 = -_1659;
    float _1849 = _1847 + 1.0;
    float _1851 = _1687 * _1831;
    bool _1853 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1855 = isnan(_1565);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1861 = _1857 || _1859;
    float _1863 = float(_1861);
    float _1865 = _1643 * _1829;
    float _1867 = _1845 * _1849;
    float _1869 = -_1845;
    float _1871 = _1869 + 1.0;
    float _1873 = -_1801;
    float _1875 = _1873 + 1.0;
    bool _1877 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1879 = isnan(_1565);
    bool _1881 = _1877 || _1879;
    bool _1883 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1885 = _1881 || _1883;
    float _1887 = float(_1885);
    float _1889 = -_1863;
    float _1891 = _1889 + 1.0;
    float _1893 = _1863 * _1871;
    float _1895 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1851);
    float _1897 = -_1685;
    float _1899 = _1897 + 1.0;
    bool _1901 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1903 = isnan(_1565);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1909 = _1905 || _1907;
    float _1911 = float(_1909);
    float _1913 = -_1887;
    float _1915 = _1913 + 1.0;
    float _1917 = fma(_1627, _1807, _1895);
    float _1919 = _1719 * _1899;
    bool _1921 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1923 = isnan(_1565);
    bool _1925 = _1921 || _1923;
    bool _1927 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1929 = _1925 || _1927;
    float _1931 = float(_1929);
    float _1933 = _1911 * _1915;
    float _1935 = -_1911;
    float _1937 = _1935 + 1.0;
    float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1939;
    bool _1943 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1945 = isnan(_1565);
    bool _1947 = _1943 || _1945;
    bool _1949 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1951 = _1947 || _1949;
    float _1953 = float(_1951);
    float _1955 = _1887 * _1891;
    float _1957 = -_1931;
    float _1959 = _1957 + 1.0;
    float _1961 = fma(_1941, _1621, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1965 = _1963 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1967 = _1953 * _1781;
    float _1969 = -_1953;
    float _1971 = _1969 + 1.0;
    float _1973 = fma(_1509, _1621, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1975 = _1755 * _1959;
    float _1977 = _1961 * _1967;
    float _1979 = fma(_1965, _1695, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1981 = _1973 * _1967;
    float _1983 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1977);
    float _1985 = fma(_1757, _1783, _1917);
    float _1987 = _1931 * _1937;
    float _1989 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1981);
    float _1991 = fma(_1979, _1975, _1983);
    float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1993;
    float _1997 = fma(_1701, _1825, _1985);
    float _1999 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2001 = _1545 * _1999;
    float _2003 = fma(_1721, _1975, _1989);
    float _2005 = fma(_1995, _1761, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2009 = _1549 * _2007;
    float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2013 = -_2001;
    float _2015 = fma(_1549, _2011, _2013);
    float _2017 = -_1823;
    float _2019 = _2017 + 1.0;
    float _2021 = fma(_2005, _1987, _2003);
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2023;
    float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2029 = _2027 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2033 = -_2009;
    float _2035 = fma(_1547, _2031, _2033);
    float _2037 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2039 = _1547 * _2037;
    float _2041 = _2015 * _2015;
    float _2043 = _1685 * _2019;
    float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _2047 = _2045 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2051 = -_2039;
    float _2053 = fma(_1545, _2049, _2051);
    float _2055 = fma(_2035, _2035, _2041);
    float _2057 = fma(_2025, _1761, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2059 = fma(_2047, _1663, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _2061 = fma(_2053, _2053, _2055);
    float _2063 = fma(_2057, _1987, _1991);
    float _2065 = fma(_2029, _1663, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2067 = fma(_1669, _1865, _1997);
    float _2069 = rsqrt(_2061);
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2071;
    float _2075 = fma(_2059, _1933, _2021);
    float _2077 = fma(_2065, _1933, _2063);
    float _2079 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2085 = _2083 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2087 = fma(_2073, _1789, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2089 = fma(_1727, _1919, _2067);
    float _2091 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2091;
    float _2095 = fma(_2081, _1789, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _2097 = fma(_2087, _1955, _2077);
    float _2099 = fma(_2085, _1725, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2101 = fma(_1707, _2043, _2089);
    float _2103 = fma(_2093, _1833, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2105 = fma(_2095, _1955, _2075);
    float _2107 = _2035 * _2069;
    float _2109 = fma(_2099, _1893, _2097);
    float _2111 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _2113 = _2111 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2115 = _2053 * _2069;
    float _2117 = _2015 * _2069;
    float _2119 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2101);
    float _2121 = _1547 * _2107;
    float _2123 = fma(_2113, _1725, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _2125 = fma(_2103, _1867, _2109);
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _2127;
    float _2131 = _1549 * _2117;
    float _2133 = -_2121;
    float _2135 = fma(_1545, _2117, _2133);
    float _2137 = fma(_2123, _1893, _2105);
    float _2139 = fma(_2129, _1833, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _2141 = -_2131;
    float _2143 = fma(_1547, _2115, _2141);
    float _2145 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2125);
    float _2147 = _2135 * _1535;
    float _2149 = fma(_2139, _1867, _2137);
    float _2151 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2153 = _945 + _2151;
    float _2155 = _2119 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2157 = _2143 * _1535;
    float _2159 = fma(_2115, _1527, _2147);
    float _2161 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2163 = _951 + _2161;
    float _2165 = -_2155;
    float _2167 = fma(_2145, _2153, _2165);
    float _2169 = fma(_2107, _1527, _2157);
    float _2171 = _2119 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2173 = fma(_1549, _1551, _2159);
    float _2175 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2149);
    float _2177 = fma(_1545, _1551, _2169);
    float _2179 = -_2171;
    float _2181 = fma(_2145, _2163, _2179);
    float _2183 = _1545 * _2115;
    float _2185 = fma(_2173, _2175, _2167);
    float _2187 = fma(_2177, _2175, _2181);
    float _2189 = -_2183;
    float _2191 = fma(_1549, _2107, _2189);
    float _2193 = _2185 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2195 = _2187 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2197 = _2191 * _1535;
    float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2201 = _2193 + _2199;
    float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2205 = _2195 + _2203;
    float _2207 = fma(_2117, _1527, _2197);
    float _2209 = _2201 * _2201;
    float _2211 = fma(_1547, _1551, _2207);
    float _2213 = fma(_2205, _2205, _2209);
    float _2215 = _921 + _2211;
    float _2217 = sqrt(_2213);
    float _2219 = -_1617;
    float _2221 = _2215 + _2219;
    bool _2223 = _2217 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2227 = _2217 + _2225;
    float _2229 = _2105;
    float _2231 = _2213;
    float _2233 = _2227;
    float _2235 = _1617;
    float _2237 = _2193;
    float _2239 = _2205;
    if (_2223)
    {
        float _2241 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2229 = _2241;
    }
    float _2243 = _2229;
    if (_2223)
    {
        float _2245 = rsqrt(_2213);
        _2231 = _2245;
    }
    float _2247 = _2231;
    if (_2223)
    {
        float _2249 = _2227 * _2243;
        _2233 = _2249;
    }
    float _2251 = _2233;
    float _2253 = _2119 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2255 = _2251;
    if (_2223)
    {
        float _2257 = _2251 * 0.15915493667125701904296875;
        _2255 = _2257;
    }
    float _2259 = _2255;
    float _2261 = -_2253;
    float _2263 = fma(_2145, _1647, _2261);
    float _2265 = _2119;
    if (_2223)
    {
        float _2267 = _2259 * 6.283185482025146484375;
        float _2269 = sin(_2267);
        _2265 = _2269;
    }
    float _2271 = _2265;
    float _2273 = fma(_2175, _2221, _2263);
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2277 = _2275;
    if (_2223)
    {
        float _2279 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2235 = _2279;
    }
    float _2281 = _2235;
    float _2283 = _2281;
    float _2285 = _2271;
    if (_2223)
    {
        float _2287 = fma(_2271, _2281, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2283 = _2287;
    }
    float _2289 = _2283;
    float _2291 = _2289;
    if (!_2223)
    {
        _2285 = _2195;
    }
    float _2293 = _2285;
    float _2295 = _2293;
    if (_2223)
    {
        float _2297 = _2247 * _2289;
        _2291 = _2297;
    }
    float _2299 = _2291;
    if (_2223)
    {
        float _2301 = fma(_2205, _2299, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _2295 = _2301;
    }
    float _2303 = _2295;
    float _2305 = _2303;
    if (_2223)
    {
        float _2307 = fma(_2201, _2299, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2237 = _2307;
    }
    float _2309 = _2237;
    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2313 = _2303 + _2311;
    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2317 = _2309 + _2315;
    float _2319 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2321 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _7285 = float2(_2319, _2321);
    float _2323 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_7285, float2(0.0), isnan(_7285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_7285, float2(0.0), isnan(_7285)), level(0.0)).x;
    float _2325 = _2313;
    float _2327 = _2317;
    float _2329 = _2309;
    if (_2223)
    {
        float _2331 = _2259 * 6.283185482025146484375;
        float _2333 = cos(_2331);
        _2325 = _2333;
    }
    float _2335 = _2325;
    if (_2223)
    {
        float _2337 = _2335 + (-1.0);
        _2327 = _2337;
    }
    float _2339 = _2327;
    if (_2223)
    {
        float _2341 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2341;
    }
    float _2343 = _2239;
    if (_2223)
    {
        float _2345 = fma(_2275, _2335, _2343);
        _2277 = _2345;
    }
    float _2347 = _2277;
    float _2349 = -_951;
    float _2351 = _2349 + _2303;
    float _2353 = -_945;
    float _2355 = _2353 + _2309;
    float _2357 = fma(_2323, 100.0, _921);
    float _2359 = -_921;
    float _2361 = _2359 + _2347;
    float _2363 = fma(_2323, 100.0, _2347);
    float _2365 = -_1101;
    float _2367 = _2365 + _2357;
    float _2369 = _2361 * _2361;
    float _2371 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2373 = fma(_2351, _2351, _2369);
    float _2375 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2377 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2371);
    float _2379 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2375);
    float _2381 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2377);
    float _2383 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2379);
    float _2385 = _2381 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2387 = fma(_2355, _2355, _2373);
    float _2389 = _2383 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2391 = 1.0 / _2385;
    float _2393 = _2389 + _2385;
    float _2395 = sqrt(_2387);
    float _2397 = _2393 * _2391;
    float _2399 = _2397 * 0.5;
    bool _2401 = _2395 > 0.0;
    float _2403 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2405 = fma(_2399, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2403);
    bool _2407 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2409 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2411 = _2407 || _2409;
    bool _2413 = isnan(0.5);
    bool _2415 = _2411 || _2413;
    float _2417 = 1.0 / _2405;
    bool _2419 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2421 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2423 = _2419 || _2421;
    bool _2425 = isnan(0.5);
    bool _2427 = _2423 || _2425;
    bool _2429 = !_2401;
    float _2431 = _2363;
    float _2433 = _2351;
    float _2435 = _2355;
    float _2437 = _2361;
    if (!_2429)
    {
        float _2439 = _207 * _207;
        float _2441 = rsqrt(_2387);
        float _2443 = fma(_205, _205, _2439);
        float _2445 = fma(_209, _209, _2443);
        float _2447 = sqrt(_2445);
        float _2449 = _2351 * _2441;
        float _2451 = _2361 * _2441;
        float _2453 = _2355 * _2441;
        bool _2455 = _2447 > 0.0;
        bool _2457 = !_2455;
        _2433 = _2449;
        _2435 = _2453;
        if (!_2457)
        {
            float _2459 = rsqrt(_2445);
            float _2461 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2463 = _207 * _2459;
            float _2465 = _205 * _2459;
            float _2467 = _209 * _2459;
            float _2469 = _2451 * _2463;
            float _2471 = fma(_2449, _2465, _2469);
            float _2473 = _2461 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2475 = fma(_2453, _2467, _2471);
            float _2477 = _2475 * _2473;
            float _2479 = fma(_205, _2477, _2303);
            float _2481 = fma(_207, _2477, _2363);
            float _2483 = fma(_209, _2477, _2309);
            _2305 = _2479;
            _2329 = _2483;
            _2431 = _2481;
            _2433 = _2471;
            _2435 = _2477;
            _2437 = _2465;
        }
    }
    float _2485 = _2305;
    float _2487 = _2329;
    float _2489 = _2431;
    float _2491 = _2433;
    float _2493 = _2435;
    float _2495 = _2437;
    float _2497 = -_1105;
    float _2499 = _2497 + _2485;
    float _2501 = -_1139;
    float _2503 = _2501 + _2487;
    float _2505 = -_1101;
    float _2507 = _2505 + _2489;
    float _2509 = _2495;
    float _2511 = _2499;
    float _2513 = _2507;
    float _2515 = _2493;
    if (_2427)
    {
        _2509 = 1.0;
    }
    float _2517 = _2509;
    float _2519 = _2517;
    if (_2415)
    {
        _1117 = _2499;
    }
    float _2521 = _1117;
    float _2523 = _2521;
    if (_2415)
    {
        _2511 = _2503;
    }
    float _2525 = _2511;
    float _2527 = _2525;
    if (!_2415)
    {
        float _2529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2531 = _2367 + _2529;
        float _2533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2535 = -_945;
        float _2537 = _2535 + _2487;
        float _2539 = -_2357;
        float _2541 = _2539 + _2489;
        float _2543 = _2531 * _2531;
        float _2545 = -_951;
        float _2547 = _2545 + _2485;
        float _2549 = fma(_1187, _1187, _2543);
        float _2551 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2553 = fma(_1201, _1201, _2549);
        float _2555 = 1.0 / _1279;
        float _2557 = sqrt(_2553);
        float _2559 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2561 = precise::min(_2557, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2563 = _2561 * _2533;
        float _2565 = _2563 * _2555;
        float _2567 = _2559 * _2565;
        float _2569 = _2537 * _2565;
        float _2571 = fma(_2541, _2567, _2367);
        float _2573 = fma(_2547, _2567, _1177);
        float _2575 = fma(_2559, _2569, _1191);
        _2513 = _2571;
        _2523 = _2573;
        _2527 = _2575;
        _2515 = _2543;
        _213 = _2533;
        _1067 = _2569;
    }
    float _2577 = _2513;
    float _2579 = _2523;
    float _2581 = _2527;
    float _2583 = _2515;
    float _2585 = _213;
    float _2587 = _1067;
    float _2589 = _2587;
    float _2591 = _2585;
    if (_2427)
    {
        _2589 = 1.0;
    }
    float _2593 = _2589;
    float _2595 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2597 = _2417 * _2595;
    float _2599 = _2593;
    if (!_2427)
    {
        float _2601 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2603 = _2601 * 0.15915493667125701904296875;
        float _2605 = _2603 * 6.283185482025146484375;
        float _2607 = cos(_2605);
        float _2609 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2611 = _2609 * 0.15915493667125701904296875;
        float _2613 = _2603 * 6.283185482025146484375;
        float _2615 = sin(_2613);
        float _2617 = 1.0 / _2607;
        float _2619 = _2611 * 6.283185482025146484375;
        float _2621 = cos(_2619);
        float _2623 = _2615 * _2617;
        float _2625 = _2611 * 6.283185482025146484375;
        float _2627 = sin(_2625);
        float _2629 = _2621 * _2623;
        float _2631 = 1.0 / _2629;
        float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2635 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2633;
        float _2637 = 1.0 / _2635;
        float _2639 = _2627 * _2631;
        float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2643 = fma(_2597, _2639, _2641);
        float _2645 = _2643 * _2637;
        float _2647 = precise::clamp(_2645, 0.0, 1.0);
        _2519 = _2647;
    }
    float _2649 = _2519;
    if (!_2427)
    {
        float _2651 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2653 = _2651 * 0.15915493667125701904296875;
        float _2655 = _2653 * 6.283185482025146484375;
        float _2657 = cos(_2655);
        float _2659 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2661 = _2659 * 0.15915493667125701904296875;
        float _2663 = _2653 * 6.283185482025146484375;
        float _2665 = sin(_2663);
        float _2667 = 1.0 / _2657;
        float _2669 = _2661 * 6.283185482025146484375;
        float _2671 = cos(_2669);
        float _2673 = _2665 * _2667;
        float _2675 = _2661 * 6.283185482025146484375;
        float _2677 = sin(_2675);
        float _2679 = _2671 * _2673;
        float _2681 = 1.0 / _2679;
        float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2685 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2683;
        float _2687 = 1.0 / _2685;
        float _2689 = _2677 * _2681;
        float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2693 = fma(_2597, _2689, _2691);
        float _2695 = _2693 * _2687;
        float _2697 = precise::clamp(_2695, 0.0, 1.0);
        float _2699 = -_2697;
        float _2701 = _2699 + 1.0;
        _2599 = _2701;
    }
    float _2703 = _2599;
    float _2705 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2707 = _2577 + _2705;
    float _2709 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2711 = _2579 + _2709;
    float _2713 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2715 = _2581 + _2713;
    float _2717 = _2707 * _2707;
    float _2719 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2721 = fma(_2711, _2711, _2717);
    float _2723 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2725 = fma(_2715, _2715, _2721);
    float _2727 = rsqrt(_2725);
    float _2729 = sqrt(_2725);
    float _2731 = _2727 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2733 = _2711 * _2731;
    float _2735 = _2715 * _2731;
    float _2737 = _2733 * _2733;
    float _2739 = _2735 * _2735;
    float _2741 = _2737 + _2739;
    float _2743 = sqrt(_2741);
    bool _2745 = _2743 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2749 = _2743 + _2747;
    float _2751 = _2491;
    float _2753 = _2749;
    float _2755 = _2723;
    float _2757 = _2733;
    float _2759 = _2735;
    float _2761 = _2737;
    if (_2745)
    {
        float _2763 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2751 = _2763;
    }
    float _2765 = _2751;
    if (_2745)
    {
        float _2767 = _2749 * _2765;
        _2753 = _2767;
    }
    float _2769 = _2753;
    float _2771 = precise::max(0.0, _2723);
    float _2773 = _2771;
    if (_2745)
    {
        float _2775 = rsqrt(_2741);
        _2755 = _2775;
    }
    float _2777 = _2755;
    float _2779 = _2777;
    if (_2745)
    {
        float _2781 = _2769 * 0.15915493667125701904296875;
        _2591 = _2781;
    }
    float _2783 = _2591;
    float _2785 = -_2731;
    float _2787 = -_2771;
    float _2789 = fma(_2707, _2785, _2787);
    float _2791 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2745)
    {
        float _2793 = _2789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2773 = _2793;
    }
    float _2795 = _2773;
    float _2797 = _2583;
    float _2799 = _2795;
    if (_2745)
    {
        float _2801 = _2783 * 6.283185482025146484375;
        float _2803 = sin(_2801);
        _2797 = _2803;
    }
    float _2805 = _2797;
    float _2807 = fma(_1177, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2809 = _2769;
    if (_2745)
    {
        float _2811 = _2783 * 6.283185482025146484375;
        float _2813 = cos(_2811);
        _2809 = _2813;
    }
    float _2815 = _2809;
    float _2817 = _2805;
    if (_2745)
    {
        float _2819 = fma(_2805, _2795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2799 = _2819;
    }
    float _2821 = _2799;
    float _2823 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2825 = _2821;
    if (_2745)
    {
        float _2827 = _2777 * _2821;
        _2817 = _2827;
    }
    float _2829 = _2817;
    if (!_2745)
    {
        _2779 = _2789;
    }
    float _2831 = _2779;
    float _2833 = _2831;
    float _2835 = _2815;
    if (_2745)
    {
        float _2837 = _2815 + (-1.0);
        _2791 = _2837;
    }
    float _2839 = _2791;
    if (_2745)
    {
        float _2841 = _2733 * _2829;
        _2757 = _2841;
    }
    float _2843 = _2757;
    if (_2745)
    {
        float _2845 = _2735 * _2829;
        _2759 = _2845;
    }
    float _2847 = _2759;
    if (_2745)
    {
        float _2849 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2825 = _2849;
    }
    float _2851 = _2825;
    if (_2745)
    {
        float _2853 = _2843 * _2843;
        _2761 = _2853;
    }
    float _2855 = _2761;
    float _2857 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2745)
    {
        float _2859 = fma(_2789, _2815, _2851);
        _2833 = _2859;
    }
    float _2861 = _2833;
    if (!_2745)
    {
        _2835 = _2739;
    }
    float _2863 = _2835;
    float _2865 = _2863;
    if (_2745)
    {
        float _2867 = _2847 * _2847;
        _2865 = _2867;
    }
    float _2869 = _2865;
    float _2871 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2873 = fma(_2861, _2861, _2855);
    float _2875 = floor(_2807);
    float _2877 = _2873 + _2869;
    float _2879 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2857);
    float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2883 = fma(_2729, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2881);
    float _2885 = precise::clamp(_2883, 0.0, 1.0);
    float _2887 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2719);
    float _2889 = rsqrt(_2877);
    float _2891 = fma(_2581, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2879);
    float _2893 = -_2885;
    float _2895 = _2893 + 1.0;
    float _2897 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2899 = fma(_2581, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2887);
    float _2901 = _2891 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2903 = abs(_2895);
    float _2905 = log2(_2903);
    float _2907 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2909 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2823);
    float _2911 = _2899 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2913 = -_2907;
    float _2915 = fma(_2913, _2871, 1.0);
    float _2917 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2919 = fma(_2581, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2909);
    float _2921 = _2889 * _2843;
    float _2923 = _2889 * _2861;
    float _2925 = _2889 * _2847;
    float _2927 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2917);
    float _2929 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2931 = _2919 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2933 = floor(_2897);
    float _2935 = fma(_2581, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2927);
    float _2937 = -_2929;
    float _2939 = fma(_2923, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2937);
    float _2941 = _2931 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2943 = _2905 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2945 = _2935 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2947 = -_2925;
    float _2949 = fma(_2947, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2939);
    float _2951 = _2931 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2953 = log2(_2915);
    float _2955 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2941);
    float _2957 = fma(_2949, -0.5, 0.5);
    float _2959 = _2931 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2961 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2955);
    float _2963 = exp2(_2943);
    float _2965 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2961);
    float _2967 = -_2875;
    float _2969 = _2807 + _2967;
    float _2971 = fma(_2949, 0.5, 0.5);
    float _2973 = -_2933;
    float _2975 = _2897 + _2973;
    float _2977 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2951);
    float _2979 = _2923 + 1.0;
    float _2981 = fma(_2971, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2983 = 1.0 / _2965;
    float _2985 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2959);
    float _2987 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2977);
    float _2989 = fma(_2971, _2981, -0.212114393711090087890625);
    float _2991 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2985);
    float _2993 = fma(_2971, _2989, 1.570728778839111328125);
    float _2995 = sqrt(_2957);
    float _2997 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2987);
    float _2999 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2991);
    float _3001 = -_2923;
    float _3003 = fma(_2963, _2979, _3001);
    float _3005 = _2953 * 0.693147182464599609375;
    float2 _8343 = float2(_2969, _2975);
    float _3007 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8343, float2(0.0), isnan(_8343)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8343, float2(0.0), isnan(_8343)), level(0.0)).x;
    float _3009 = fma(_3003, 0.5, 0.5);
    float _3011 = _2997 * _2983;
    float _3013 = _2999 * _2983;
    float _3015 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3017 = fma(_3011, 0.5, 0.5);
    float _3019 = fma(_3013, -0.5, 0.5);
    float _3021 = _2995 * 0.636619746685028076171875;
    float _3023 = -_2993;
    float _3025 = fma(_3021, _3023, 1.0);
    float3 _8376 = float3(_3017, _3019, _3015);
    float _3027 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8376, float3(0.0), isnan(_8376)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8376, float3(0.0), isnan(_8376)), level(0.0)).x;
    float3 _8387 = float3(_3017, _3019, _3015);
    float4 _3030 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8387, float3(0.0), isnan(_8387)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8387, float3(0.0), isnan(_8387)), level(0.0)).xyzw;
    float _3032 = _3030.x;
    float _3034 = _3030.y;
    float _3036 = _3030.z;
    float _3038 = _3030.w;
    float2 _8403 = float2(_3025, _3009);
    float3 _3042 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8403, float2(0.0), isnan(_8403)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8403, float2(0.0), isnan(_8403)), level(0.0)).xyz;
    float _3044 = _3042.x;
    float _3046 = _3042.y;
    float _3048 = _3042.z;
    out.m_76.x = _1141;
    out.m_76.y = _1143;
    out.m_76.z = _1145;
    out.m_76.w = _1083;
    float _3050 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3052 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3054 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _3056 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _3054;
    out.m_66.x = _409;
    out.m_66.y = _411;
    out.m_66.z = _393;
    out.m_66.w = _413;
    bool _3058 = _2729 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3060 = isnan(_2729);
    bool _3062 = _3058 || _3060;
    bool _3064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3066 = _3062 || _3064;
    float _3068 = fma(_3056, _1621, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _3070 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _3072 = _3070 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _3074 = _3068 * _1967;
    float _3076 = fma(_3072, _1695, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _3078 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _3080 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _3078;
    float _3082 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[167].z, _3074);
    float _3084 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _3086 = _3084 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _3088 = fma(_3080, _1761, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _3090 = fma(_3076, _1975, _3082);
    float _3092 = fma(_3086, _1663, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _3094 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _3096 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _3094;
    float _3098 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _3100 = _3098 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _3102 = fma(_3088, _1987, _3090);
    float _3104 = _1303 * _2191;
    float _3106 = fma(_3096, _1789, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _3108 = fma(_3100, _1725, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _3110 = fma(_3092, _1933, _3102);
    float _3112 = -_1265;
    float _3114 = fma(_3112, _2117, _3104);
    float _3116 = fma(_3106, _1955, _3110);
    float _3118 = _1303 * _2135;
    float _3120 = fma(_1313, _1547, _3114);
    float _3122 = _1285 * _2191;
    float _3124 = fma(_3108, _1893, _3116);
    float _3126 = _1303 * _2143;
    float _3128 = _1285 * _2143;
    float _3130 = _1331 * _2143;
    float _3132 = fma(_1301, _2117, _3122);
    float _3134 = -_1265;
    float _3136 = fma(_3134, _2107, _3126);
    float _3138 = fma(_1301, _2107, _3128);
    float _3140 = fma(_1317, _2107, _3130);
    float _3142 = fma(_1327, _1547, _3132);
    float _3144 = fma(_1313, _1545, _3136);
    float _3146 = fma(_1327, _1545, _3138);
    float _3148 = fma(_1287, _1545, _3140);
    float _3150 = _3050 * _3120;
    float _3152 = _3050 * _3144;
    float _3154 = _1285 * _2135;
    float _3156 = -_1265;
    float _3158 = fma(_3156, _2115, _3118);
    float _3160 = fma(_3052, _3142, _3150);
    float _3162 = fma(_3052, _3146, _3152);
    float _3164 = fma(_1301, _2115, _3154);
    float _3166 = _3148 + _3162;
    float _3168 = fma(_1313, _1549, _3158);
    float _3170 = abs(_2597);
    float _3172 = log2(_3170);
    float _3174 = fma(_1327, _1549, _3164);
    float _3176 = _1331 * _2191;
    float _3178 = _3050 * _3168;
    float _3180 = _1331 * _2135;
    float _3182 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _3184 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _3182;
    float _3186 = fma(_1317, _2117, _3176);
    float _3188 = fma(_3052, _3174, _3178);
    float _3190 = fma(_1317, _2115, _3180);
    float _3192 = in.m_68.x;
    bool _3194 = _2597 <= 8000.0;
    bool _3196 = isnan(_2597);
    bool _3198 = _3194 || _3196;
    bool _3200 = isnan(8000.0);
    bool _3202 = _3198 || _3200;
    float _3204 = float(_3202);
    float _3206 = fma(_1287, _1547, _3186);
    float _3208 = fma(_1287, _1549, _3190);
    float _3210 = _2965 * 0.5;
    float _3212 = fma(_3184, _1833, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _3214 = _3206 + _3160;
    float _3216 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3218 = _3208 + _3188;
    float _3220 = fma(_3212, _1867, _3124);
    float _3222 = exp2(_3216);
    float _3224 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[174].z, _3220);
    out.m_78.x = _3166;
    out.m_78.y = _3214;
    out.m_78.z = _3218;
    out.m_80.x = _3224;
    float _3226 = fma(_3222, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3228 = precise::clamp(_3226, 0.0, 1.0);
    float _3230 = _2905 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3232 = fma(_3228, -2.0, 3.0);
    float _3234 = _3228 * _3228;
    float _3236 = _2931 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3238 = exp2(_3230);
    float _3240 = _3234 * _3232;
    float _3242 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3236);
    float _3244 = -_3240;
    float _3246 = _3244 + 1.0;
    float _3248 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3242);
    float _3250 = fma(_3246, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3240);
    float _3252 = fma(_2999, -0.5, _3210);
    float _3254 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3248);
    float _3256 = _2997 + _2965;
    float _3258 = _3204 * _3250;
    float _3260 = -_3238;
    float _3262 = _3260 + 1.0;
    float _3264 = _3254 + _2965;
    float _3266 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3268 = _3256 * 0.5;
    float _3270 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3272 = _3264 * 0.5;
    out.gl_Position.x = _2997;
    out.gl_Position.y = _2999;
    out.gl_Position.z = _3254;
    out.gl_Position.w = _2965;
    out.m_82.x = _3268;
    out.m_82.y = _3252;
    out.m_82.z = _3272;
    out.m_82.w = _2965;
    float _3274 = _2997;
    float _3276 = _2965;
    float _3278 = _3272;
    float _3280 = _3252;
    float _3282 = _3268;
    if (!_3066)
    {
        _3274 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3284 = _3274;
    float _3286 = _3284;
    float _3288 = _3284;
    if (!_3066)
    {
        _3276 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3290 = _3276;
    float _3292 = _3290;
    float _3294 = _3290;
    if (!_3066)
    {
        _3278 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3296 = _3278;
    float _3298 = _3296;
    float _3300 = _3296;
    if (!_3066)
    {
        _3280 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3302 = _3280;
    float _3304 = _3302;
    float _3306 = _3302;
    if (!_3066)
    {
        _3282 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3308 = _3282;
    float _3310 = -_3007;
    float _3312 = _3310 + 1.0;
    float _3314 = _3312 * _3266;
    float _3316 = precise::clamp(_3314, 0.0, 1.0);
    float _3318 = -_3316;
    float _3320 = fma(_3318, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3322 = _3320 * _3192;
    float _3324 = _3322 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3326 = _3270 * _3027;
    float _3328 = -_3270;
    float _3330 = _3328 + 1.0;
    float _3332 = _3038 * _3326;
    float _3334 = _3048 * _3326;
    float _3336 = _3038 * _3330;
    out.m_84.x = _3324;
    float _3338 = fma(_3044, _3332, _3032);
    float _3340 = fma(_3046, _3332, _3034);
    float _3342 = fma(_3038, _3334, _3036);
    float _3344 = _2649 * _2703;
    out.m_86.x = _3338;
    out.m_86.y = _3340;
    out.m_86.z = _3342;
    out.m_86.w = _3336;
    float _3346 = _3344 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3348 = _3344;
    float _3350 = _3308;
    float _3352 = _3308;
    if (!_3066)
    {
        _3348 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3354 = _3348;
    bool _3356 = !_3066;
    float _3358 = _3354;
    float _3360 = _3354;
    if (!_3356)
    {
        bool _3362 = _2729 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3364 = isnan(_2729);
        bool _3366 = _3362 || _3364;
        bool _3368 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3370 = _3366 || _3368;
        if (!_3370)
        {
            float _3372 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3374 = _2729 + _3372;
            float _3376 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3378 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3376;
            float _3380 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3382 = _3380 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3384 = 1.0 / _3378;
            float _3386 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3388 = _3386 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3390 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3392 = _3390 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3396 = _3394 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3398 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3400 = _3398 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3402 = _3374 * _3384;
            float _3404 = precise::clamp(_3402, 0.0, 1.0);
            float _3406 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3408 = _3406 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3410 = fma(_3404, _3382, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3412 = fma(_3404, _3408, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3414 = fma(_3404, _3388, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3416 = fma(_3404, _3392, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3418 = fma(_3404, _3396, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3420 = fma(_3404, _3400, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3294 = _3414;
            _3352 = _3418;
            _3288 = _3410;
            _3306 = _3416;
            _3300 = _3412;
            _3360 = _3420;
            _3422 = true;
        }
        else
        {
            bool _3424 = _2729 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3426 = isnan(_2729);
            bool _3428 = _3424 || _3426;
            bool _3430 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3432 = _3428 || _3430;
            if (!_3432)
            {
                _3286 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3434 = _3286;
            _3288 = _3434;
            if (!_3432)
            {
                _3292 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3436 = _3292;
            _3294 = _3436;
            if (!_3432)
            {
                _3298 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3438 = _3298;
            _3300 = _3438;
            if (!_3432)
            {
                _3304 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3440 = _3304;
            _3306 = _3440;
            if (!_3432)
            {
                _3350 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3442 = _3350;
            _3352 = _3442;
            if (!_3432)
            {
                _3358 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3444 = _3358;
            bool _3446 = !_3432;
            _3360 = _3444;
            if (!_3446)
            {
                bool _3448 = _2729 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3450 = isnan(_2729);
                bool _3452 = _3448 || _3450;
                bool _3454 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3456 = _3452 || _3454;
                if (!_3456)
                {
                    float _3458 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3460 = _2729 + _3458;
                    float _3462 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3464 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3462;
                    float _3466 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3468 = _3466 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3470 = 1.0 / _3464;
                    float _3472 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3474 = _3472 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3476 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3478 = _3476 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3480 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3482 = _3480 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3484 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3486 = _3484 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3488 = _3460 * _3470;
                    float _3490 = precise::clamp(_3488, 0.0, 1.0);
                    float _3492 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3494 = _3492 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3496 = fma(_3490, _3468, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3498 = fma(_3490, _3494, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3500 = fma(_3490, _3474, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3502 = fma(_3490, _3478, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3504 = fma(_3490, _3482, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3506 = fma(_3490, _3486, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3294 = _3500;
                    _3352 = _3504;
                    _3288 = _3496;
                    _3306 = _3502;
                    _3300 = _3498;
                    _3360 = _3506;
                    _3422 = true;
                }
                else
                {
                    _3294 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3352 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3288 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3306 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3300 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3360 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3422 = false;
    float _3508 = _3294;
    float _3510 = _3352;
    float _3512 = _3288;
    float _3514 = _3306;
    float _3516 = _3300;
    float _3518 = _3360;
    float _3520 = fma(_3214, -0.5, 0.5);
    float _3522 = precise::clamp(_3520, 0.0, 1.0);
    float _3524 = -_3508;
    float _3526 = _3524 + _3510;
    float _3528 = _3346 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3530 = -_3512;
    float _3532 = _3530 + _3514;
    float _3534 = fma(_3522, _3526, _3508);
    out.m_88.x = 0.0;
    float _3536 = -_3516;
    float _3538 = _3536 + _3518;
    float _3540 = fma(_3522, _3532, _3512);
    float _3542 = _3534 * 0.586610972881317138671875;
    out.m_51.x = _3528;
    bool _3544 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3546 = fma(_3522, _3538, _3516);
    float _3548 = fma(_3540, 0.298911988735198974609375, _3542);
    bool _3550 = _2649 > 0.0;
    bool _3552 = isnan(_2649);
    bool _3554 = _3550 || _3552;
    bool _3556 = isnan(0.0);
    bool _3558 = _3554 || _3556;
    float _3560 = fma(_3546, 0.114477999508380889892578125, _3548);
    bool _3562 = _2703 <= 0.0;
    bool _3564 = !_3558;
    bool _3566 = _3562 || _3564;
    float _3568 = -_3560;
    float _3570 = _3540 + _3568;
    float _3572 = -_3560;
    float _3574 = _3534 + _3572;
    float _3576 = -_3560;
    float _3578 = _3546 + _3576;
    float _3580 = fma(_3570, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    float _3582 = fma(_3574, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    float _3584 = fma(_3578, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    bool _3586 = !_3544;
    if (!_3586)
    {
        float _3588 = -_2577;
        float _3590 = _3588 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3592 = -_2579;
        float _3594 = _3592 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3596 = -_2581;
        float _3598 = _3596 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3600 = _3590 * _3590;
        float _3602 = fma(_3594, _3594, _3600);
        float _3604 = fma(_3598, _3598, _3602);
        float _3606 = sqrt(_3604);
        float _3608 = rsqrt(_3604);
        float _3610 = -_3606;
        float _3612 = _3610 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3614 = _3612 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3616 = precise::clamp(_3614, 0.0, 1.0);
        float _3618 = _3594 * _3608;
        float _3620 = _3590 * _3608;
        float _3622 = abs(_3616);
        float _3624 = log2(_3622);
        float _3626 = _3598 * _3608;
        float _3628 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3630 = _3214 * _3620;
        float _3632 = -_3620;
        float _3634 = -_3628;
        float _3636 = fma(_3632, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3634);
        float _3638 = fma(_3166, _3618, _3630);
        float _3640 = -_3626;
        float _3642 = fma(_3640, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3636);
        float _3644 = fma(_3218, _3626, _3638);
        float _3646 = precise::clamp(_3644, 0.0, 1.0);
        float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3650 = _3642 + _3648;
        float _3652 = _3624 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3654 = _3650 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3656 = precise::clamp(_3654, 0.0, 1.0);
        float _3658 = exp2(_3652);
        float _3660 = _3658 * _3656;
        float _3662 = _3646 * _3660;
        float _3664 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3666 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3668 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3664;
        out.m_88.y = _3666;
        out.m_88.z = _3668;
    }
    out.m_90.x = _3580;
    out.m_90.y = _3582;
    out.m_90.z = _3584;
    if (!_3566)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _3670 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3670;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3422 = false;
    bool _337 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3726 = as_type<float>(_123);
        out.gl_Position.z = _3726;
    }
    if (!_113)
    {
        return out;
    }
    float _127 = in.m_53.w;
    float _129 = float(_109);
    float _131 = 1.0 / _129;
    float _133 = -_127;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_127);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = _135 * _131;
    bool _149 = _135 >= _129;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    out.m_55.x = _147;
    float _155 = _127;
    float _157 = _147;
    float _159 = _135;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _155;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _163 = _161 * 5.0;
        _125 = as_type<int>(_163);
    }
    int _165 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3799 = as_type<float>(_165);
        out.gl_Position.z = _3799;
    }
    if (_153)
    {
        return out;
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_60.x;
    float _171 = in.m_60.y;
    float _173 = in.m_60.z;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_177;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _207 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _209 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _211 = !_183;
    float _213 = _207;
    float _231;
    if (!_211)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        _231 = _147;
    }
    _233 = false;
    float _235 = _231;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    float _241 = in.m_64.x;
    float _243 = in.m_64.y;
    bool _245 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _247 = isnan(_235);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    bool _261 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _263 = isnan(_235);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -_255;
    float _275 = _273 + 1.0;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = 1.0 / _259;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = _271 * _275;
    float _287 = -_271;
    float _289 = _287 + 1.0;
    float _291 = _239 * _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _293;
    float _297 = fma(_279, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _299 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _301 = _297 * _285;
    float _303 = _299 * _285;
    float _305 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].x, _301);
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _309 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    float _313 = _309 * _241;
    float _315 = _311 * _243;
    bool _317 = !_283;
    float _335;
    if (!_317)
    {
        float _319 = in.m_62.x;
        float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _323 = _319 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _327 = _325 * _321;
        float _329 = floor(_327);
        float _331 = -_329;
        float _333 = _327 + _331;
        _335 = _333;
        _337 = true;
    }
    else
    {
        _335 = _147;
    }
    _337 = false;
    float _339 = _335;
    bool _341 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _343 = isnan(_339);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _357 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _359 = isnan(_339);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _375 = _339 + _373;
    float _377 = -_351;
    float _379 = _377 + 1.0;
    bool _381 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _383 = 1.0 / _355;
    float _385 = _367 * _379;
    float _387 = -_367;
    float _389 = _387 + 1.0;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _393 = _391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _395 = _371 * _383;
    float _397 = fma(_395, _375, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _399 = _397 * _385;
    float _401 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[115].x, _399);
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _407 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[116].x, _401);
    float _409 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _407 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _409;
    out.m_66.y = _411;
    out.m_66.z = _393;
    out.m_66.w = _413;
    bool _415 = !_381;
    if (!_415)
    {
        float _417 = in.m_62.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _157 = _431;
    }
    float _433 = _157;
    float _435 = in.m_62.x;
    float _437 = in.m_62.y;
    float _439 = in.m_62.z;
    float _441 = in.m_62.w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _445 = in.m_68.y;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _453 = _451 != 0;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _461 = _459 != 0;
    float _463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _467 = _465 != 0;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _473 = 1.0 / _457;
    float _475 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _481 = _435 > 0.5;
    float _483 = _435 * 2.0;
    bool _485 = _441 > 0.5;
    float _487 = _439 * 2.0;
    float _489 = -_193;
    int _491 = _481 ? as_type<int>(_489) : as_type<int>(_193);
    float _493 = 1.0 / _471;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _501 = _499 != 0;
    float _503 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _505 = !_449;
    float _507 = _505 ? _193 : as_type<float>(_491);
    bool _509 = _437 > 0.5;
    float _511 = floor(_487);
    float _513 = -_203;
    int _515 = _509 ? as_type<int>(_513) : as_type<int>(_203);
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _519 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _523 = !_453;
    float _525 = _523 ? _203 : as_type<float>(_515);
    float _527 = -_517;
    float _529 = fma(_503, 2.0, _527);
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _533 = _531 != 0;
    float _535 = _437 * 2.0;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _545 = 1.0 / _479;
    float _547 = -_193;
    int _549 = _509 ? as_type<int>(_547) : as_type<int>(_193);
    float _551 = fma(_519, -2.0, _521);
    bool _553 = _439 > 0.5;
    float _555 = _543 * _473;
    float _557 = _539 * _493;
    float _559 = -_193;
    int _561 = _553 ? as_type<int>(_559) : as_type<int>(_193);
    float _563 = floor(_535);
    float _565 = -_203;
    int _567 = _553 ? as_type<int>(_565) : as_type<int>(_203);
    float _569 = _437 + _435;
    bool _571 = _511 > 0.0;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _573;
    bool _577 = !_497;
    float _579 = _577 ? _193 : as_type<float>(_549);
    float _581 = _569 + (-1.0);
    bool _583 = _511 >= 0.0;
    bool _585 = isnan(_511);
    bool _587 = _583 || _585;
    bool _589 = isnan(0.0);
    bool _591 = _587 || _589;
    float _593 = _437 + _439;
    float _595 = floor(_483);
    int _597 = _591 ? 0 : 1;
    float _599 = _575 * _545;
    float _601 = _593 + (-1.0);
    float _603 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _605 = !_501;
    float _607 = _605 ? _203 : as_type<float>(_567);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _611 = _433 + _609;
    int _613 = ~_597;
    int _615 = _613 + 1;
    int _617 = _615 + 1;
    float _619 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _621 = _563 > 0.0;
    float _623 = fma(_557, _611, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _625 = _563 >= 0.0;
    bool _627 = isnan(_563);
    bool _629 = _625 || _627;
    bool _631 = isnan(0.0);
    bool _633 = _629 || _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _637 = _433 + _635;
    int _639 = _617;
    float _641 = _557;
    if (!_571)
    {
        int _643 = ~_597;
        int _645 = _643 + 1;
        _639 = _645;
    }
    int _647 = _639;
    float _649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _653 = _433 + _651;
    float _655 = _653;
    if (!_533)
    {
        _641 = _439;
    }
    float _657 = _641;
    float _659 = fma(_555, _637, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _661 = _657;
    if (_533)
    {
        _661 = _437;
    }
    float _663 = _661;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _667 = _633 ? 0 : 1;
    float _669 = fma(_599, _653, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _671 = _595 >= 0.0;
    bool _673 = isnan(_595);
    bool _675 = _671 || _673;
    bool _677 = isnan(0.0);
    bool _679 = _675 || _677;
    float _681 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[83].w, _665);
    bool _683 = _595 > 0.0;
    float _685 = _507 + 0.5;
    float _687 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _551);
    int _689 = ~_667;
    int _691 = _689 + 1;
    int _693 = _691 + 1;
    float _695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _697 = _663;
    int _699 = _693;
    if (!_533)
    {
        _655 = _437;
    }
    float _701 = _655;
    float _703 = _579 + 0.5;
    float _705 = _701;
    if (!_533)
    {
        _697 = _439;
    }
    float _707 = _697;
    float _709 = -_607;
    float _711 = _709 + 0.5;
    float _713 = _707;
    if (!_621)
    {
        int _715 = ~_667;
        int _717 = _715 + 1;
        _699 = _717;
    }
    int _719 = _699;
    float _721 = -_135;
    float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[76].x, _529);
    if (_533)
    {
        _705 = _435;
    }
    float _725 = _705;
    float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_533)
    {
        _713 = _437;
    }
    float _729 = _713;
    float _731 = _703 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _733 = _679 ? 0 : 1;
    float _735 = _725 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _739 = _737 != 0;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _743 = _741 != 0;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _747 = _745 != 0;
    float _749 = _649 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _751 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _753 = isnan(_433);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _729 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _765 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _767 = isnan(_433);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = fma(_749, _685, _723);
    bool _779 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _781 = isnan(_433);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -_761;
    float _793 = _791 + 1.0;
    bool _795 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _797 = isnan(_433);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = -_775;
    float _809 = _807 + 1.0;
    float _811 = _775 * _793;
    float _813 = _805 * _809;
    float _815 = -_805;
    float _817 = _815 + 1.0;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _823 = _789 * _817;
    float _825 = _525 + (-0.5);
    float _827 = -_789;
    float _829 = _827 + 1.0;
    float _831 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[83].z, _821);
    float _833 = fma(_763, -2.0, _819);
    float _835 = -_475;
    float _837 = -_687;
    float _839 = fma(_835, _825, _837);
    float _841 = _623 * _823;
    float _843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _847 = _711 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _849 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[131].x, _841);
    float _851 = _731 * _463;
    float _853 = in.m_48.x;
    float _855 = in.m_48.y;
    float _857 = in.m_48.z;
    float _859 = -_845;
    float _861 = fma(_735, 2.0, _859);
    float _863 = -_203;
    int _865 = _485 ? as_type<int>(_863) : as_type<int>(_203);
    float _867 = _847 * _695;
    float _869 = _727 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _871 = fma(_659, _813, _849);
    bool _873 = !_461;
    float _875 = _873 ? _203 : as_type<float>(_865);
    float _877 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _833);
    out.m_70.x = _851;
    out.m_70.y = _867;
    float _879 = _843 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _881 = _875 + (-0.5);
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _885 = !_467;
    float _887 = _885 ? _193 : as_type<float>(_561);
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _891 = -_879;
    float _893 = -_877;
    float _895 = fma(_891, _881, _893);
    float _897 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _899 = log2(_897);
    float _901 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _883);
    float _903 = _887 + 0.5;
    float _905 = -_135;
    float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[81].x, _861);
    float _909 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _889);
    float _911 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _901);
    float _913 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _831);
    float _915 = _855 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _917 = _855 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _919 = fma(_869, _903, _907);
    float _921 = _855 + _445;
    float _923 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[6].x, _915);
    float _925 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[4].x, _917);
    float _927 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _909);
    float _929 = -_913;
    float _931 = _929 + 1.0;
    float _933 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[6].z, _923);
    float _935 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[4].z, _925);
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _939 = _921 + _937;
    float _941 = -_927;
    float _943 = _941 + 1.0;
    float _945 = _933 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _947 = -_911;
    float _949 = _947 + 1.0;
    float _951 = _935 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _953 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _681);
    float _955 = -_943;
    float _957 = fma(_507, _955, _777);
    float _959 = fma(_525, _949, _839);
    bool _961 = !_739;
    int _963 = _961 ? 0 : 1;
    float _965 = -_931;
    float _967 = fma(_887, _965, _919);
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _971 = _951 + _969;
    float _973 = _939 * _939;
    float _975 = _899 * _135;
    float _977 = -_953;
    float _979 = _977 + 1.0;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _983 = _945 + _981;
    int _985 = abs(_963);
    float _987 = fma(_971, _971, _973);
    float _989 = fma(_875, _979, _895);
    float _991 = in.m_72.x;
    float _993 = in.m_72.y;
    float _995 = in.m_72.z;
    bool _997 = !_743;
    int _999 = _997 ? 0 : 1;
    float _1001 = exp2(_975);
    float _1003 = fma(_983, _983, _987);
    float _1005 = fma(_669, _811, _871);
    int _1007 = abs(_999);
    float _1009 = _939 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1011 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1013 = isnan(1.0);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1019 = _1015 || _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1023 = 1.0 + _1021;
    float _1025 = rsqrt(_1003);
    float _1027 = float(_647);
    float _1029 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1009);
    float _1031 = float(_985);
    float _1033 = _313 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_74.x = _957;
    out.m_74.y = _959;
    out.m_74.z = _967;
    out.m_74.w = _989;
    bool _1035 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1037 = isnan(0.0);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1043 = _1039 || _1041;
    float _1045 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1029);
    float _1047 = 1.0 / _1023;
    float _1049 = _1031 * _1027;
    float _1051 = -_1001;
    float _1053 = _1051 + 1.0;
    int _1055 = ~_733;
    int _1057 = _1055 + 1;
    int _1059 = _1057 + 1;
    float _1061 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1005);
    int _1063 = _1059;
    float _1065 = as_type<float>(_1007);
    float _1067 = _945;
    if (!_683)
    {
        int _1069 = ~_733;
        int _1071 = _1069 + 1;
        _1063 = _1071;
    }
    int _1073 = _1063;
    float _1075 = _1043 ? _1053 : 0.0;
    bool _1077 = _1045 >= 0.0;
    float _1079 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1081 = _1049 * (-2.0);
    float _1083 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1085 = _1079 * _1025;
    float _1087 = fma(_603, _1081, _603);
    float _1089 = fma(_1081, _991, _991);
    float _1091 = _435 + (-0.5);
    float _1093 = _995;
    if (_1019)
    {
        float _1095 = _1075 * _1047;
        _159 = _1095;
    }
    float _1097 = _159;
    float _1099 = float(_1073);
    float _1101 = _939 * _1085;
    float _1103 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1089);
    float _1105 = _971 * _1085;
    float _1107 = fma(_1087, _1097, _1103);
    float _1109 = -_1101;
    float _1111 = _939 + _1109;
    float _1113 = float(_1007);
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1117 = _1101;
    if (_1077)
    {
        _1065 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1119 = _1065;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1125 = _1113 * _1099;
    int _1127 = as_type<int>(_1119);
    if (_1077)
    {
        float _1129 = _1119 * 5.0;
        _1127 = as_type<int>(_1129);
    }
    int _1131 = _1127;
    float _1133 = -_1105;
    float _1135 = _971 + _1133;
    float _1137 = _1111 * _1111;
    float _1139 = _983 * _1085;
    float _1141 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1145 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1147 = _1125 * (-2.0);
    float _1149 = fma(_1135, _1135, _1137);
    float _1151 = -_1139;
    float _1153 = _983 + _1151;
    float _1155 = _1149;
    if (_1077)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5394 = as_type<float>(_1131);
        out.gl_Position.z = _5394;
    }
    float _1157 = fma(_619, _1147, _619);
    float _1159 = fma(_1147, _993, _993);
    float _1161 = _437 + (-0.5);
    if (_1077)
    {
        out.m_51.x = 0.0;
    }
    bool _1163 = !_747;
    int _1165 = _1163 ? 0 : 1;
    out.m_76.x = _1141;
    out.m_76.y = _1143;
    out.m_76.z = _1145;
    out.m_76.w = _1083;
    float _1167 = fma(_1153, _1153, _1149);
    if (_1077)
    {
        return out;
    }
    float _1169 = -_1101;
    float _1171 = _921 + _1169;
    int _1173 = abs(_1165);
    float _1175 = -_1105;
    float _1177 = _951 + _1175;
    float _1179 = float(_719);
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1183 = _1171 + _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1187 = _1177 + _1185;
    float _1189 = -_1139;
    float _1191 = _945 + _1189;
    float _1193 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1195 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1159);
    float _1197 = _439 + _435;
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1201 = _1191 + _1199;
    float _1203 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1193);
    float _1205 = float(_1173);
    float _1207 = _1107 * 0.15915493667125701904296875;
    float _1209 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1203);
    float _1211 = _1197 + (-1.0);
    float _1213 = _1205 * _1179;
    float _1215 = fma(_1157, _1097, _1195);
    float _1217 = _439 + (-0.5);
    bool _1219 = _1209 >= 0.0;
    float _1221 = _1213 * (-2.0);
    float _1223 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1225 = _1215 * 0.15915493667125701904296875;
    float _1227 = sqrt(_1167);
    float _1229 = fma(_1221, _995, _995);
    float _1231 = fma(_1223, _1221, _1223);
    float _1233 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1229);
    float _1235 = _1207 * 6.283185482025146484375;
    float _1237 = sin(_1235);
    float _1239 = fma(_1231, _1097, _1233);
    if (_1219)
    {
        _1093 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1241 = _1093;
    int _1243 = as_type<int>(_1241);
    if (_1219)
    {
        out.m_51.x = 0.0;
    }
    float _1245 = _1239 * 0.15915493667125701904296875;
    if (_1219)
    {
        float _1247 = _1241 * 5.0;
        _1243 = as_type<int>(_1247);
    }
    int _1249 = _1243;
    float _1251 = _1207 * 6.283185482025146484375;
    float _1253 = cos(_1251);
    if (_1219)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5572 = as_type<float>(_1249);
        out.gl_Position.z = _5572;
    }
    float _1255 = _1225 * 6.283185482025146484375;
    float _1257 = sin(_1255);
    float _1259 = _1225 * 6.283185482025146484375;
    float _1261 = cos(_1259);
    float _1263 = _1245 * 6.283185482025146484375;
    float _1265 = sin(_1263);
    if (_1219)
    {
        return out;
    }
    float _1267 = _1245 * 6.283185482025146484375;
    float _1269 = cos(_1267);
    bool _1271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1273 = _1237 * _1257;
    float _1275 = _1253 * _1261;
    bool _1277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1279 = _1025 * _1227;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1283 = _1281 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1285 = fma(_1265, _1275, _1273);
    float _1287 = fma(_1265, _1273, _1275);
    float _1289 = _1253 * _1257;
    float _1291 = _1237 * _1261;
    float _1293 = _1099;
    float _1295 = _1291;
    if (_1271)
    {
        float _1297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1293 = _1297;
    }
    float _1299 = _1293;
    float _1301 = _1261 * _1269;
    float _1303 = _1253 * _1269;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1309 = _1033 * _1279;
    float _1311 = _315 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1313 = _1237 * _1269;
    float _1315 = 1.0 / _1283;
    float _1317 = _1257 * _1269;
    float _1319 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1323 = _1321 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1325 = -_1289;
    float _1327 = fma(_1265, _1291, _1325);
    float _1329 = -_1291;
    float _1331 = fma(_1265, _1289, _1329);
    if (_1271)
    {
        float _1333 = _435 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _1295 = _1333;
    }
    float _1335 = _1295;
    if (_1277)
    {
        float _1337 = _435 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _1155 = _1337;
    }
    float _1339 = _1155;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1345 = _1279 * _1311;
    float _1347 = _1207;
    float _1349 = _1345;
    if (_1277)
    {
        float _1351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _1347 = _1351;
    }
    float _1353 = _1347;
    float _1355 = _1319 * _1309;
    float _1357 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1359 = -_921;
    float _1361 = _1359 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1363 = _1357 * _1345;
    float _1365 = 1.0 / _1307;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1371 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1373 = _1371 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1375 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    if (_1271)
    {
        float _1377 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1349 = _1377;
    }
    float _1379 = _1349;
    if (_1277)
    {
        float _1381 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[14].z, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1375 = _1381;
    }
    float _1383 = _1375;
    float _1385 = -_951;
    float _1387 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1389 = 1.0 / _1323;
    float _1391 = _1361 * _1361;
    float _1393 = _1299;
    if (_1271)
    {
        float _1395 = _1379 * _1299;
        _1393 = _1395;
    }
    float _1397 = _1393;
    float _1399 = -_945;
    float _1401 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1407 = fma(_1387, _1387, _1391);
    float _1409 = _1353;
    if (_1277)
    {
        float _1411 = _1383 * _1353;
        _1409 = _1411;
    }
    float _1413 = _1409;
    float _1415 = 1.0 / _1343;
    float _1417 = fma(_1401, _1401, _1407);
    float _1419 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1421 = _1419 * 0.5;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1423;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1431 = 1.0 / _1369;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1433;
    float _1437 = _1425 * _1315;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1445 = _1443 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1447;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1455 = 1.0 / _1373;
    float _1457 = _1445 * _1365;
    float _1459 = _1441 * _1415;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1461;
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1467 = _1465 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1469 = 0.0;
    if (!_1277)
    {
        _1469 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1471 = _1469;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1473;
    float _1477 = 1.0 / _1405;
    float _1479 = _1429 * _1431;
    float _1481 = _1463 * _1389;
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1483;
    float _1487 = -_1363;
    float _1489 = _1265 * _1487;
    float _1491 = _855 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1493 = rsqrt(_1417);
    float _1495 = _1475 * _1455;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1499 = _1497 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1501 = _1303 * _1363;
    float _1503 = _1313 * _1363;
    float _1505 = fma(_1301, _1355, _1489);
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1507;
    float _1511 = fma(_1285, _1355, _1501);
    float _1513 = _1425;
    float _1515 = _1471;
    if (_1271)
    {
        float _1517 = floor(_1397);
        _1513 = _1517;
    }
    float _1519 = _1513;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1523 = _1521 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1525 = fma(_1327, _1355, _1503);
    float _1527 = fma(_1317, _1421, _1505);
    float _1529 = _1523 * _1477;
    float _1531 = _1523;
    if (!_1271)
    {
        _1531 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1533 = _1531;
    float _1535 = fma(_1331, _1421, _1511);
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1539 = _1533;
    if (_1277)
    {
        float _1541 = floor(_1413);
        _1537 = _1541;
    }
    float _1543 = _1537;
    float _1545 = _1387 * _1493;
    float _1547 = _1361 * _1493;
    float _1549 = _1401 * _1493;
    float _1551 = fma(_1287, _1421, _1525);
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1557 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1491);
    float _1559 = 1.0 / _1435;
    if (_1271)
    {
        float _1561 = -_1519;
        float _1563 = _1397 + _1561;
        _1539 = _1563;
    }
    float _1565 = _1539;
    float _1567 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1557);
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1571 = _1565 + _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1575 = _1565 + _1573;
    float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1579 = _1565 + _1577;
    float _1581 = 1.0 / _1453;
    if (_1277)
    {
        float _1583 = -_1543;
        float _1585 = _1413 + _1583;
        _1515 = _1585;
    }
    float _1587 = _1515;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1589;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1595 = _1565 + _1593;
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1599 = _1565 + _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1603 = _1587 + _1601;
    bool _1605 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1607 = isnan(_1587);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1613 = _1609 || _1611;
    float _1615 = float(_1613);
    float _1617 = _1567 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1619 = 1.0 / _1467;
    float _1621 = _1595 * _1559;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1625 = _1565 + _1623;
    float _1627 = fma(_1479, _1603, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1631 = _1587 + _1629;
    bool _1633 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1635 = isnan(_1587);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1647 = _1617 + _1645;
    bool _1649 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1651 = isnan(_1565);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = 1.0 / _1499;
    float _1663 = _1625 * _1581;
    float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1667 = _1587 + _1665;
    float _1669 = fma(_1481, _1631, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1673 = _1587 + _1671;
    bool _1675 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1677 = isnan(_1587);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = fma(_1437, _1667, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1691 = _1587 + _1689;
    float _1693 = 1.0 / _1449;
    float _1695 = _1571 * _1619;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1699 = _1565 + _1697;
    float _1701 = fma(_1457, _1691, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1705 = _1587 + _1703;
    float _1707 = fma(_1495, _1673, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    bool _1709 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1711 = isnan(_1587);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1717 = _1713 || _1715;
    float _1719 = float(_1717);
    float _1721 = fma(_1555, _1695, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1723 = 1.0 / _1485;
    float _1725 = _1699 * _1661;
    float _1727 = fma(_1529, _1705, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1731 = _1587 + _1729;
    bool _1733 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1735 = isnan(_1587);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1741 = _1737 || _1739;
    float _1743 = float(_1741);
    bool _1745 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1747 = isnan(_1565);
    bool _1749 = _1745 || _1747;
    bool _1751 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1753 = _1749 || _1751;
    float _1755 = float(_1753);
    float _1757 = fma(_1459, _1731, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1759 = 1.0 / _1591;
    float _1761 = _1575 * _1693;
    float _1763 = -_1615;
    float _1765 = _1763 + 1.0;
    bool _1767 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1769 = isnan(_1587);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1775 = _1771 || _1773;
    float _1777 = float(_1775);
    float _1779 = -_1755;
    float _1781 = _1779 + 1.0;
    float _1783 = _1743 * _1765;
    float _1785 = -_1743;
    float _1787 = _1785 + 1.0;
    float _1789 = _1579 * _1723;
    bool _1791 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1793 = isnan(_1587);
    bool _1795 = _1791 || _1793;
    bool _1797 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1799 = _1795 || _1797;
    float _1801 = float(_1799);
    float _1803 = -_1643;
    float _1805 = _1803 + 1.0;
    float _1807 = _1777 * _1787;
    float _1809 = -_1777;
    float _1811 = _1809 + 1.0;
    bool _1813 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1815 = isnan(_1587);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = _1615 * _1805;
    float _1827 = -_1719;
    float _1829 = _1827 + 1.0;
    float _1831 = _1801 * _1811;
    float _1833 = _1599 * _1759;
    bool _1835 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1837 = isnan(_1565);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    float _1847 = -_1659;
    float _1849 = _1847 + 1.0;
    float _1851 = _1687 * _1831;
    bool _1853 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1855 = isnan(_1565);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1861 = _1857 || _1859;
    float _1863 = float(_1861);
    float _1865 = _1643 * _1829;
    float _1867 = _1845 * _1849;
    float _1869 = -_1845;
    float _1871 = _1869 + 1.0;
    float _1873 = -_1801;
    float _1875 = _1873 + 1.0;
    bool _1877 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1879 = isnan(_1565);
    bool _1881 = _1877 || _1879;
    bool _1883 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1885 = _1881 || _1883;
    float _1887 = float(_1885);
    float _1889 = -_1863;
    float _1891 = _1889 + 1.0;
    float _1893 = _1863 * _1871;
    float _1895 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1851);
    float _1897 = -_1685;
    float _1899 = _1897 + 1.0;
    bool _1901 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1903 = isnan(_1565);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1909 = _1905 || _1907;
    float _1911 = float(_1909);
    float _1913 = -_1887;
    float _1915 = _1913 + 1.0;
    float _1917 = fma(_1627, _1807, _1895);
    float _1919 = _1719 * _1899;
    bool _1921 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1923 = isnan(_1565);
    bool _1925 = _1921 || _1923;
    bool _1927 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1929 = _1925 || _1927;
    float _1931 = float(_1929);
    float _1933 = _1911 * _1915;
    float _1935 = -_1911;
    float _1937 = _1935 + 1.0;
    float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1939;
    bool _1943 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1945 = isnan(_1565);
    bool _1947 = _1943 || _1945;
    bool _1949 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1951 = _1947 || _1949;
    float _1953 = float(_1951);
    float _1955 = _1887 * _1891;
    float _1957 = -_1931;
    float _1959 = _1957 + 1.0;
    float _1961 = fma(_1941, _1621, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1965 = _1963 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1967 = _1953 * _1781;
    float _1969 = -_1953;
    float _1971 = _1969 + 1.0;
    float _1973 = fma(_1509, _1621, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1975 = _1755 * _1959;
    float _1977 = _1961 * _1967;
    float _1979 = fma(_1965, _1695, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1981 = _1973 * _1967;
    float _1983 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1977);
    float _1985 = fma(_1757, _1783, _1917);
    float _1987 = _1931 * _1937;
    float _1989 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1981);
    float _1991 = fma(_1979, _1975, _1983);
    float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1993;
    float _1997 = fma(_1701, _1825, _1985);
    float _1999 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2001 = _1545 * _1999;
    float _2003 = fma(_1721, _1975, _1989);
    float _2005 = fma(_1995, _1761, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2009 = _1549 * _2007;
    float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2013 = -_2001;
    float _2015 = fma(_1549, _2011, _2013);
    float _2017 = -_1823;
    float _2019 = _2017 + 1.0;
    float _2021 = fma(_2005, _1987, _2003);
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2023;
    float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2029 = _2027 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2033 = -_2009;
    float _2035 = fma(_1547, _2031, _2033);
    float _2037 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2039 = _1547 * _2037;
    float _2041 = _2015 * _2015;
    float _2043 = _1685 * _2019;
    float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _2047 = _2045 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2051 = -_2039;
    float _2053 = fma(_1545, _2049, _2051);
    float _2055 = fma(_2035, _2035, _2041);
    float _2057 = fma(_2025, _1761, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2059 = fma(_2047, _1663, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _2061 = fma(_2053, _2053, _2055);
    float _2063 = fma(_2057, _1987, _1991);
    float _2065 = fma(_2029, _1663, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2067 = fma(_1669, _1865, _1997);
    float _2069 = rsqrt(_2061);
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2071;
    float _2075 = fma(_2059, _1933, _2021);
    float _2077 = fma(_2065, _1933, _2063);
    float _2079 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2085 = _2083 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2087 = fma(_2073, _1789, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2089 = fma(_1727, _1919, _2067);
    float _2091 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2091;
    float _2095 = fma(_2081, _1789, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _2097 = fma(_2087, _1955, _2077);
    float _2099 = fma(_2085, _1725, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2101 = fma(_1707, _2043, _2089);
    float _2103 = fma(_2093, _1833, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2105 = fma(_2095, _1955, _2075);
    float _2107 = _2035 * _2069;
    float _2109 = fma(_2099, _1893, _2097);
    float _2111 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _2113 = _2111 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2115 = _2053 * _2069;
    float _2117 = _2015 * _2069;
    float _2119 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2101);
    float _2121 = _1547 * _2107;
    float _2123 = fma(_2113, _1725, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _2125 = fma(_2103, _1867, _2109);
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _2127;
    float _2131 = _1549 * _2117;
    float _2133 = -_2121;
    float _2135 = fma(_1545, _2117, _2133);
    float _2137 = fma(_2123, _1893, _2105);
    float _2139 = fma(_2129, _1833, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _2141 = -_2131;
    float _2143 = fma(_1547, _2115, _2141);
    float _2145 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2125);
    float _2147 = _2135 * _1535;
    float _2149 = fma(_2139, _1867, _2137);
    float _2151 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2153 = _945 + _2151;
    float _2155 = _2119 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2157 = _2143 * _1535;
    float _2159 = fma(_2115, _1527, _2147);
    float _2161 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2163 = _951 + _2161;
    float _2165 = -_2155;
    float _2167 = fma(_2145, _2153, _2165);
    float _2169 = fma(_2107, _1527, _2157);
    float _2171 = _2119 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2173 = fma(_1549, _1551, _2159);
    float _2175 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2149);
    float _2177 = fma(_1545, _1551, _2169);
    float _2179 = -_2171;
    float _2181 = fma(_2145, _2163, _2179);
    float _2183 = _1545 * _2115;
    float _2185 = fma(_2173, _2175, _2167);
    float _2187 = fma(_2177, _2175, _2181);
    float _2189 = -_2183;
    float _2191 = fma(_1549, _2107, _2189);
    float _2193 = _2185 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2195 = _2187 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2197 = _2191 * _1535;
    float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2201 = _2193 + _2199;
    float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2205 = _2195 + _2203;
    float _2207 = fma(_2117, _1527, _2197);
    float _2209 = _2201 * _2201;
    float _2211 = fma(_1547, _1551, _2207);
    float _2213 = fma(_2205, _2205, _2209);
    float _2215 = _921 + _2211;
    float _2217 = sqrt(_2213);
    float _2219 = -_1617;
    float _2221 = _2215 + _2219;
    bool _2223 = _2217 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2227 = _2217 + _2225;
    float _2229 = _2105;
    float _2231 = _2213;
    float _2233 = _2227;
    float _2235 = _1617;
    float _2237 = _2193;
    float _2239 = _2205;
    if (_2223)
    {
        float _2241 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2229 = _2241;
    }
    float _2243 = _2229;
    if (_2223)
    {
        float _2245 = rsqrt(_2213);
        _2231 = _2245;
    }
    float _2247 = _2231;
    if (_2223)
    {
        float _2249 = _2227 * _2243;
        _2233 = _2249;
    }
    float _2251 = _2233;
    float _2253 = _2119 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2255 = _2251;
    if (_2223)
    {
        float _2257 = _2251 * 0.15915493667125701904296875;
        _2255 = _2257;
    }
    float _2259 = _2255;
    float _2261 = -_2253;
    float _2263 = fma(_2145, _1647, _2261);
    float _2265 = _2119;
    if (_2223)
    {
        float _2267 = _2259 * 6.283185482025146484375;
        float _2269 = sin(_2267);
        _2265 = _2269;
    }
    float _2271 = _2265;
    float _2273 = fma(_2175, _2221, _2263);
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2277 = _2275;
    if (_2223)
    {
        float _2279 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2235 = _2279;
    }
    float _2281 = _2235;
    float _2283 = _2281;
    float _2285 = _2271;
    if (_2223)
    {
        float _2287 = fma(_2271, _2281, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2283 = _2287;
    }
    float _2289 = _2283;
    float _2291 = _2289;
    if (!_2223)
    {
        _2285 = _2195;
    }
    float _2293 = _2285;
    float _2295 = _2293;
    if (_2223)
    {
        float _2297 = _2247 * _2289;
        _2291 = _2297;
    }
    float _2299 = _2291;
    if (_2223)
    {
        float _2301 = fma(_2205, _2299, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _2295 = _2301;
    }
    float _2303 = _2295;
    float _2305 = _2303;
    if (_2223)
    {
        float _2307 = fma(_2201, _2299, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2237 = _2307;
    }
    float _2309 = _2237;
    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2313 = _2303 + _2311;
    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2317 = _2309 + _2315;
    float _2319 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2321 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _7285 = float2(_2319, _2321);
    float _2323 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_7285, float2(0.0), isnan(_7285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_7285, float2(0.0), isnan(_7285)), level(0.0)).x;
    float _2325 = _2313;
    float _2327 = _2317;
    float _2329 = _2309;
    if (_2223)
    {
        float _2331 = _2259 * 6.283185482025146484375;
        float _2333 = cos(_2331);
        _2325 = _2333;
    }
    float _2335 = _2325;
    if (_2223)
    {
        float _2337 = _2335 + (-1.0);
        _2327 = _2337;
    }
    float _2339 = _2327;
    if (_2223)
    {
        float _2341 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2341;
    }
    float _2343 = _2239;
    if (_2223)
    {
        float _2345 = fma(_2275, _2335, _2343);
        _2277 = _2345;
    }
    float _2347 = _2277;
    float _2349 = -_951;
    float _2351 = _2349 + _2303;
    float _2353 = -_945;
    float _2355 = _2353 + _2309;
    float _2357 = fma(_2323, 100.0, _921);
    float _2359 = -_921;
    float _2361 = _2359 + _2347;
    float _2363 = fma(_2323, 100.0, _2347);
    float _2365 = -_1101;
    float _2367 = _2365 + _2357;
    float _2369 = _2361 * _2361;
    float _2371 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2373 = fma(_2351, _2351, _2369);
    float _2375 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2377 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2371);
    float _2379 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2375);
    float _2381 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2377);
    float _2383 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2379);
    float _2385 = _2381 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2387 = fma(_2355, _2355, _2373);
    float _2389 = _2383 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2391 = 1.0 / _2385;
    float _2393 = _2389 + _2385;
    float _2395 = sqrt(_2387);
    float _2397 = _2393 * _2391;
    float _2399 = _2397 * 0.5;
    bool _2401 = _2395 > 0.0;
    float _2403 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2405 = fma(_2399, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2403);
    bool _2407 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2409 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2411 = _2407 || _2409;
    bool _2413 = isnan(0.5);
    bool _2415 = _2411 || _2413;
    float _2417 = 1.0 / _2405;
    bool _2419 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2421 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2423 = _2419 || _2421;
    bool _2425 = isnan(0.5);
    bool _2427 = _2423 || _2425;
    bool _2429 = !_2401;
    float _2431 = _2363;
    float _2433 = _2351;
    float _2435 = _2355;
    float _2437 = _2361;
    if (!_2429)
    {
        float _2439 = _207 * _207;
        float _2441 = rsqrt(_2387);
        float _2443 = fma(_205, _205, _2439);
        float _2445 = fma(_209, _209, _2443);
        float _2447 = sqrt(_2445);
        float _2449 = _2351 * _2441;
        float _2451 = _2361 * _2441;
        float _2453 = _2355 * _2441;
        bool _2455 = _2447 > 0.0;
        bool _2457 = !_2455;
        _2433 = _2449;
        _2435 = _2453;
        if (!_2457)
        {
            float _2459 = rsqrt(_2445);
            float _2461 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2463 = _207 * _2459;
            float _2465 = _205 * _2459;
            float _2467 = _209 * _2459;
            float _2469 = _2451 * _2463;
            float _2471 = fma(_2449, _2465, _2469);
            float _2473 = _2461 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2475 = fma(_2453, _2467, _2471);
            float _2477 = _2475 * _2473;
            float _2479 = fma(_205, _2477, _2303);
            float _2481 = fma(_207, _2477, _2363);
            float _2483 = fma(_209, _2477, _2309);
            _2305 = _2479;
            _2329 = _2483;
            _2431 = _2481;
            _2433 = _2471;
            _2435 = _2477;
            _2437 = _2465;
        }
    }
    float _2485 = _2305;
    float _2487 = _2329;
    float _2489 = _2431;
    float _2491 = _2433;
    float _2493 = _2435;
    float _2495 = _2437;
    float _2497 = -_1105;
    float _2499 = _2497 + _2485;
    float _2501 = -_1139;
    float _2503 = _2501 + _2487;
    float _2505 = -_1101;
    float _2507 = _2505 + _2489;
    float _2509 = _2495;
    float _2511 = _2499;
    float _2513 = _2507;
    float _2515 = _2493;
    if (_2427)
    {
        _2509 = 1.0;
    }
    float _2517 = _2509;
    float _2519 = _2517;
    if (_2415)
    {
        _1117 = _2499;
    }
    float _2521 = _1117;
    float _2523 = _2521;
    if (_2415)
    {
        _2511 = _2503;
    }
    float _2525 = _2511;
    float _2527 = _2525;
    if (!_2415)
    {
        float _2529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2531 = _2367 + _2529;
        float _2533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2535 = -_945;
        float _2537 = _2535 + _2487;
        float _2539 = -_2357;
        float _2541 = _2539 + _2489;
        float _2543 = _2531 * _2531;
        float _2545 = -_951;
        float _2547 = _2545 + _2485;
        float _2549 = fma(_1187, _1187, _2543);
        float _2551 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2553 = fma(_1201, _1201, _2549);
        float _2555 = 1.0 / _1279;
        float _2557 = sqrt(_2553);
        float _2559 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2561 = precise::min(_2557, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2563 = _2561 * _2533;
        float _2565 = _2563 * _2555;
        float _2567 = _2559 * _2565;
        float _2569 = _2537 * _2565;
        float _2571 = fma(_2541, _2567, _2367);
        float _2573 = fma(_2547, _2567, _1177);
        float _2575 = fma(_2559, _2569, _1191);
        _2513 = _2571;
        _2523 = _2573;
        _2527 = _2575;
        _2515 = _2543;
        _213 = _2533;
        _1067 = _2569;
    }
    float _2577 = _2513;
    float _2579 = _2523;
    float _2581 = _2527;
    float _2583 = _2515;
    float _2585 = _213;
    float _2587 = _1067;
    float _2589 = _2587;
    float _2591 = _2585;
    if (_2427)
    {
        _2589 = 1.0;
    }
    float _2593 = _2589;
    float _2595 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2597 = _2417 * _2595;
    float _2599 = _2593;
    if (!_2427)
    {
        float _2601 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2603 = _2601 * 0.15915493667125701904296875;
        float _2605 = _2603 * 6.283185482025146484375;
        float _2607 = cos(_2605);
        float _2609 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2611 = _2609 * 0.15915493667125701904296875;
        float _2613 = _2603 * 6.283185482025146484375;
        float _2615 = sin(_2613);
        float _2617 = 1.0 / _2607;
        float _2619 = _2611 * 6.283185482025146484375;
        float _2621 = cos(_2619);
        float _2623 = _2615 * _2617;
        float _2625 = _2611 * 6.283185482025146484375;
        float _2627 = sin(_2625);
        float _2629 = _2621 * _2623;
        float _2631 = 1.0 / _2629;
        float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2635 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2633;
        float _2637 = 1.0 / _2635;
        float _2639 = _2627 * _2631;
        float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2643 = fma(_2597, _2639, _2641);
        float _2645 = _2643 * _2637;
        float _2647 = precise::clamp(_2645, 0.0, 1.0);
        _2519 = _2647;
    }
    float _2649 = _2519;
    if (!_2427)
    {
        float _2651 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2653 = _2651 * 0.15915493667125701904296875;
        float _2655 = _2653 * 6.283185482025146484375;
        float _2657 = cos(_2655);
        float _2659 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2661 = _2659 * 0.15915493667125701904296875;
        float _2663 = _2653 * 6.283185482025146484375;
        float _2665 = sin(_2663);
        float _2667 = 1.0 / _2657;
        float _2669 = _2661 * 6.283185482025146484375;
        float _2671 = cos(_2669);
        float _2673 = _2665 * _2667;
        float _2675 = _2661 * 6.283185482025146484375;
        float _2677 = sin(_2675);
        float _2679 = _2671 * _2673;
        float _2681 = 1.0 / _2679;
        float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2685 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2683;
        float _2687 = 1.0 / _2685;
        float _2689 = _2677 * _2681;
        float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2693 = fma(_2597, _2689, _2691);
        float _2695 = _2693 * _2687;
        float _2697 = precise::clamp(_2695, 0.0, 1.0);
        float _2699 = -_2697;
        float _2701 = _2699 + 1.0;
        _2599 = _2701;
    }
    float _2703 = _2599;
    float _2705 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2707 = _2577 + _2705;
    float _2709 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2711 = _2579 + _2709;
    float _2713 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2715 = _2581 + _2713;
    float _2717 = _2707 * _2707;
    float _2719 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2721 = fma(_2711, _2711, _2717);
    float _2723 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2725 = fma(_2715, _2715, _2721);
    float _2727 = rsqrt(_2725);
    float _2729 = sqrt(_2725);
    float _2731 = _2727 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2733 = _2711 * _2731;
    float _2735 = _2715 * _2731;
    float _2737 = _2733 * _2733;
    float _2739 = _2735 * _2735;
    float _2741 = _2737 + _2739;
    float _2743 = sqrt(_2741);
    bool _2745 = _2743 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2749 = _2743 + _2747;
    float _2751 = _2491;
    float _2753 = _2749;
    float _2755 = _2723;
    float _2757 = _2733;
    float _2759 = _2735;
    float _2761 = _2737;
    if (_2745)
    {
        float _2763 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2751 = _2763;
    }
    float _2765 = _2751;
    if (_2745)
    {
        float _2767 = _2749 * _2765;
        _2753 = _2767;
    }
    float _2769 = _2753;
    float _2771 = precise::max(0.0, _2723);
    float _2773 = _2771;
    if (_2745)
    {
        float _2775 = rsqrt(_2741);
        _2755 = _2775;
    }
    float _2777 = _2755;
    float _2779 = _2777;
    if (_2745)
    {
        float _2781 = _2769 * 0.15915493667125701904296875;
        _2591 = _2781;
    }
    float _2783 = _2591;
    float _2785 = -_2731;
    float _2787 = -_2771;
    float _2789 = fma(_2707, _2785, _2787);
    float _2791 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2745)
    {
        float _2793 = _2789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2773 = _2793;
    }
    float _2795 = _2773;
    float _2797 = _2583;
    float _2799 = _2795;
    if (_2745)
    {
        float _2801 = _2783 * 6.283185482025146484375;
        float _2803 = sin(_2801);
        _2797 = _2803;
    }
    float _2805 = _2797;
    float _2807 = fma(_1177, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2809 = _2769;
    if (_2745)
    {
        float _2811 = _2783 * 6.283185482025146484375;
        float _2813 = cos(_2811);
        _2809 = _2813;
    }
    float _2815 = _2809;
    float _2817 = _2805;
    if (_2745)
    {
        float _2819 = fma(_2805, _2795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2799 = _2819;
    }
    float _2821 = _2799;
    float _2823 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2825 = _2821;
    if (_2745)
    {
        float _2827 = _2777 * _2821;
        _2817 = _2827;
    }
    float _2829 = _2817;
    if (!_2745)
    {
        _2779 = _2789;
    }
    float _2831 = _2779;
    float _2833 = _2831;
    float _2835 = _2815;
    if (_2745)
    {
        float _2837 = _2815 + (-1.0);
        _2791 = _2837;
    }
    float _2839 = _2791;
    if (_2745)
    {
        float _2841 = _2733 * _2829;
        _2757 = _2841;
    }
    float _2843 = _2757;
    if (_2745)
    {
        float _2845 = _2735 * _2829;
        _2759 = _2845;
    }
    float _2847 = _2759;
    if (_2745)
    {
        float _2849 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2825 = _2849;
    }
    float _2851 = _2825;
    if (_2745)
    {
        float _2853 = _2843 * _2843;
        _2761 = _2853;
    }
    float _2855 = _2761;
    float _2857 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2745)
    {
        float _2859 = fma(_2789, _2815, _2851);
        _2833 = _2859;
    }
    float _2861 = _2833;
    if (!_2745)
    {
        _2835 = _2739;
    }
    float _2863 = _2835;
    float _2865 = _2863;
    if (_2745)
    {
        float _2867 = _2847 * _2847;
        _2865 = _2867;
    }
    float _2869 = _2865;
    float _2871 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2873 = fma(_2861, _2861, _2855);
    float _2875 = floor(_2807);
    float _2877 = _2873 + _2869;
    float _2879 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2857);
    float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2883 = fma(_2729, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2881);
    float _2885 = precise::clamp(_2883, 0.0, 1.0);
    float _2887 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2719);
    float _2889 = rsqrt(_2877);
    float _2891 = fma(_2581, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2879);
    float _2893 = -_2885;
    float _2895 = _2893 + 1.0;
    float _2897 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2899 = fma(_2581, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2887);
    float _2901 = _2891 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2903 = abs(_2895);
    float _2905 = log2(_2903);
    float _2907 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2909 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2823);
    float _2911 = _2899 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2913 = -_2907;
    float _2915 = fma(_2913, _2871, 1.0);
    float _2917 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2919 = fma(_2581, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2909);
    float _2921 = _2889 * _2843;
    float _2923 = _2889 * _2861;
    float _2925 = _2889 * _2847;
    float _2927 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2917);
    float _2929 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2931 = _2919 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2933 = floor(_2897);
    float _2935 = fma(_2581, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2927);
    float _2937 = -_2929;
    float _2939 = fma(_2923, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2937);
    float _2941 = _2931 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2943 = _2905 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2945 = _2935 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2947 = -_2925;
    float _2949 = fma(_2947, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2939);
    float _2951 = _2931 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2953 = log2(_2915);
    float _2955 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2941);
    float _2957 = fma(_2949, -0.5, 0.5);
    float _2959 = _2931 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2961 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2955);
    float _2963 = exp2(_2943);
    float _2965 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2961);
    float _2967 = -_2875;
    float _2969 = _2807 + _2967;
    float _2971 = fma(_2949, 0.5, 0.5);
    float _2973 = -_2933;
    float _2975 = _2897 + _2973;
    float _2977 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2951);
    float _2979 = _2923 + 1.0;
    float _2981 = fma(_2971, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2983 = 1.0 / _2965;
    float _2985 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2959);
    float _2987 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2977);
    float _2989 = fma(_2971, _2981, -0.212114393711090087890625);
    float _2991 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2985);
    float _2993 = fma(_2971, _2989, 1.570728778839111328125);
    float _2995 = sqrt(_2957);
    float _2997 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2987);
    float _2999 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2991);
    float _3001 = -_2923;
    float _3003 = fma(_2963, _2979, _3001);
    float _3005 = _2953 * 0.693147182464599609375;
    float2 _8343 = float2(_2969, _2975);
    float _3007 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8343, float2(0.0), isnan(_8343)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8343, float2(0.0), isnan(_8343)), level(0.0)).x;
    float _3009 = fma(_3003, 0.5, 0.5);
    float _3011 = _2997 * _2983;
    float _3013 = _2999 * _2983;
    float _3015 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3017 = fma(_3011, 0.5, 0.5);
    float _3019 = fma(_3013, -0.5, 0.5);
    float _3021 = _2995 * 0.636619746685028076171875;
    float _3023 = -_2993;
    float _3025 = fma(_3021, _3023, 1.0);
    float3 _8376 = float3(_3017, _3019, _3015);
    float _3027 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8376, float3(0.0), isnan(_8376)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8376, float3(0.0), isnan(_8376)), level(0.0)).x;
    float3 _8387 = float3(_3017, _3019, _3015);
    float4 _3030 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8387, float3(0.0), isnan(_8387)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8387, float3(0.0), isnan(_8387)), level(0.0)).xyzw;
    float _3032 = _3030.x;
    float _3034 = _3030.y;
    float _3036 = _3030.z;
    float _3038 = _3030.w;
    float2 _8403 = float2(_3025, _3009);
    float3 _3042 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8403, float2(0.0), isnan(_8403)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8403, float2(0.0), isnan(_8403)), level(0.0)).xyz;
    float _3044 = _3042.x;
    float _3046 = _3042.y;
    float _3048 = _3042.z;
    out.m_76.x = _1141;
    out.m_76.y = _1143;
    out.m_76.z = _1145;
    out.m_76.w = _1083;
    float _3050 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3052 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3054 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _3056 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _3054;
    out.m_66.x = _409;
    out.m_66.y = _411;
    out.m_66.z = _393;
    out.m_66.w = _413;
    bool _3058 = _2729 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3060 = isnan(_2729);
    bool _3062 = _3058 || _3060;
    bool _3064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3066 = _3062 || _3064;
    float _3068 = fma(_3056, _1621, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _3070 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _3072 = _3070 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _3074 = _3068 * _1967;
    float _3076 = fma(_3072, _1695, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _3078 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _3080 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _3078;
    float _3082 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[167].z, _3074);
    float _3084 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _3086 = _3084 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _3088 = fma(_3080, _1761, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _3090 = fma(_3076, _1975, _3082);
    float _3092 = fma(_3086, _1663, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _3094 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _3096 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _3094;
    float _3098 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _3100 = _3098 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _3102 = fma(_3088, _1987, _3090);
    float _3104 = _1303 * _2191;
    float _3106 = fma(_3096, _1789, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _3108 = fma(_3100, _1725, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _3110 = fma(_3092, _1933, _3102);
    float _3112 = -_1265;
    float _3114 = fma(_3112, _2117, _3104);
    float _3116 = fma(_3106, _1955, _3110);
    float _3118 = _1303 * _2135;
    float _3120 = fma(_1313, _1547, _3114);
    float _3122 = _1285 * _2191;
    float _3124 = fma(_3108, _1893, _3116);
    float _3126 = _1303 * _2143;
    float _3128 = _1285 * _2143;
    float _3130 = _1331 * _2143;
    float _3132 = fma(_1301, _2117, _3122);
    float _3134 = -_1265;
    float _3136 = fma(_3134, _2107, _3126);
    float _3138 = fma(_1301, _2107, _3128);
    float _3140 = fma(_1317, _2107, _3130);
    float _3142 = fma(_1327, _1547, _3132);
    float _3144 = fma(_1313, _1545, _3136);
    float _3146 = fma(_1327, _1545, _3138);
    float _3148 = fma(_1287, _1545, _3140);
    float _3150 = _3050 * _3120;
    float _3152 = _3050 * _3144;
    float _3154 = _1285 * _2135;
    float _3156 = -_1265;
    float _3158 = fma(_3156, _2115, _3118);
    float _3160 = fma(_3052, _3142, _3150);
    float _3162 = fma(_3052, _3146, _3152);
    float _3164 = fma(_1301, _2115, _3154);
    float _3166 = _3148 + _3162;
    float _3168 = fma(_1313, _1549, _3158);
    float _3170 = abs(_2597);
    float _3172 = log2(_3170);
    float _3174 = fma(_1327, _1549, _3164);
    float _3176 = _1331 * _2191;
    float _3178 = _3050 * _3168;
    float _3180 = _1331 * _2135;
    float _3182 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _3184 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _3182;
    float _3186 = fma(_1317, _2117, _3176);
    float _3188 = fma(_3052, _3174, _3178);
    float _3190 = fma(_1317, _2115, _3180);
    float _3192 = in.m_68.x;
    bool _3194 = _2597 <= 8000.0;
    bool _3196 = isnan(_2597);
    bool _3198 = _3194 || _3196;
    bool _3200 = isnan(8000.0);
    bool _3202 = _3198 || _3200;
    float _3204 = float(_3202);
    float _3206 = fma(_1287, _1547, _3186);
    float _3208 = fma(_1287, _1549, _3190);
    float _3210 = _2965 * 0.5;
    float _3212 = fma(_3184, _1833, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _3214 = _3206 + _3160;
    float _3216 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3218 = _3208 + _3188;
    float _3220 = fma(_3212, _1867, _3124);
    float _3222 = exp2(_3216);
    float _3224 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[174].z, _3220);
    out.m_78.x = _3166;
    out.m_78.y = _3214;
    out.m_78.z = _3218;
    out.m_80.x = _3224;
    float _3226 = fma(_3222, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3228 = precise::clamp(_3226, 0.0, 1.0);
    float _3230 = _2905 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3232 = fma(_3228, -2.0, 3.0);
    float _3234 = _3228 * _3228;
    float _3236 = _2931 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3238 = exp2(_3230);
    float _3240 = _3234 * _3232;
    float _3242 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3236);
    float _3244 = -_3240;
    float _3246 = _3244 + 1.0;
    float _3248 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3242);
    float _3250 = fma(_3246, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3240);
    float _3252 = fma(_2999, -0.5, _3210);
    float _3254 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3248);
    float _3256 = _2997 + _2965;
    float _3258 = _3204 * _3250;
    float _3260 = -_3238;
    float _3262 = _3260 + 1.0;
    float _3264 = _3254 + _2965;
    float _3266 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3268 = _3256 * 0.5;
    float _3270 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3272 = _3264 * 0.5;
    out.gl_Position.x = _2997;
    out.gl_Position.y = _2999;
    out.gl_Position.z = _3254;
    out.gl_Position.w = _2965;
    out.m_82.x = _3268;
    out.m_82.y = _3252;
    out.m_82.z = _3272;
    out.m_82.w = _2965;
    float _3274 = _2997;
    float _3276 = _2965;
    float _3278 = _3272;
    float _3280 = _3252;
    float _3282 = _3268;
    if (!_3066)
    {
        _3274 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3284 = _3274;
    float _3286 = _3284;
    float _3288 = _3284;
    if (!_3066)
    {
        _3276 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3290 = _3276;
    float _3292 = _3290;
    float _3294 = _3290;
    if (!_3066)
    {
        _3278 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3296 = _3278;
    float _3298 = _3296;
    float _3300 = _3296;
    if (!_3066)
    {
        _3280 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3302 = _3280;
    float _3304 = _3302;
    float _3306 = _3302;
    if (!_3066)
    {
        _3282 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3308 = _3282;
    float _3310 = -_3007;
    float _3312 = _3310 + 1.0;
    float _3314 = _3312 * _3266;
    float _3316 = precise::clamp(_3314, 0.0, 1.0);
    float _3318 = -_3316;
    float _3320 = fma(_3318, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3322 = _3320 * _3192;
    float _3324 = _3322 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3326 = _3270 * _3027;
    float _3328 = -_3270;
    float _3330 = _3328 + 1.0;
    float _3332 = _3038 * _3326;
    float _3334 = _3048 * _3326;
    float _3336 = _3038 * _3330;
    out.m_84.x = _3324;
    float _3338 = fma(_3044, _3332, _3032);
    float _3340 = fma(_3046, _3332, _3034);
    float _3342 = fma(_3038, _3334, _3036);
    float _3344 = _2649 * _2703;
    out.m_86.x = _3338;
    out.m_86.y = _3340;
    out.m_86.z = _3342;
    out.m_86.w = _3336;
    float _3346 = _3344 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3348 = _3344;
    float _3350 = _3308;
    float _3352 = _3308;
    if (!_3066)
    {
        _3348 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3354 = _3348;
    bool _3356 = !_3066;
    float _3358 = _3354;
    float _3360 = _3354;
    if (!_3356)
    {
        bool _3362 = _2729 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3364 = isnan(_2729);
        bool _3366 = _3362 || _3364;
        bool _3368 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3370 = _3366 || _3368;
        if (!_3370)
        {
            float _3372 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3374 = _2729 + _3372;
            float _3376 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3378 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3376;
            float _3380 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3382 = _3380 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3384 = 1.0 / _3378;
            float _3386 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3388 = _3386 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3390 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3392 = _3390 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3396 = _3394 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3398 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3400 = _3398 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3402 = _3374 * _3384;
            float _3404 = precise::clamp(_3402, 0.0, 1.0);
            float _3406 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3408 = _3406 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3410 = fma(_3404, _3382, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3412 = fma(_3404, _3408, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3414 = fma(_3404, _3388, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3416 = fma(_3404, _3392, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3418 = fma(_3404, _3396, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3420 = fma(_3404, _3400, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3294 = _3414;
            _3352 = _3418;
            _3288 = _3410;
            _3306 = _3416;
            _3300 = _3412;
            _3360 = _3420;
            _3422 = true;
        }
        else
        {
            bool _3424 = _2729 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3426 = isnan(_2729);
            bool _3428 = _3424 || _3426;
            bool _3430 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3432 = _3428 || _3430;
            if (!_3432)
            {
                _3286 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3434 = _3286;
            _3288 = _3434;
            if (!_3432)
            {
                _3292 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3436 = _3292;
            _3294 = _3436;
            if (!_3432)
            {
                _3298 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3438 = _3298;
            _3300 = _3438;
            if (!_3432)
            {
                _3304 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3440 = _3304;
            _3306 = _3440;
            if (!_3432)
            {
                _3350 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3442 = _3350;
            _3352 = _3442;
            if (!_3432)
            {
                _3358 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3444 = _3358;
            bool _3446 = !_3432;
            _3360 = _3444;
            if (!_3446)
            {
                bool _3448 = _2729 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3450 = isnan(_2729);
                bool _3452 = _3448 || _3450;
                bool _3454 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3456 = _3452 || _3454;
                if (!_3456)
                {
                    float _3458 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3460 = _2729 + _3458;
                    float _3462 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3464 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3462;
                    float _3466 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3468 = _3466 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3470 = 1.0 / _3464;
                    float _3472 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3474 = _3472 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3476 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3478 = _3476 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3480 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3482 = _3480 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3484 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3486 = _3484 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3488 = _3460 * _3470;
                    float _3490 = precise::clamp(_3488, 0.0, 1.0);
                    float _3492 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3494 = _3492 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3496 = fma(_3490, _3468, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3498 = fma(_3490, _3494, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3500 = fma(_3490, _3474, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3502 = fma(_3490, _3478, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3504 = fma(_3490, _3482, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3506 = fma(_3490, _3486, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3294 = _3500;
                    _3352 = _3504;
                    _3288 = _3496;
                    _3306 = _3502;
                    _3300 = _3498;
                    _3360 = _3506;
                    _3422 = true;
                }
                else
                {
                    _3294 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3352 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3288 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3306 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3300 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3360 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3422 = false;
    float _3508 = _3294;
    float _3510 = _3352;
    float _3512 = _3288;
    float _3514 = _3306;
    float _3516 = _3300;
    float _3518 = _3360;
    float _3520 = fma(_3214, -0.5, 0.5);
    float _3522 = precise::clamp(_3520, 0.0, 1.0);
    float _3524 = -_3508;
    float _3526 = _3524 + _3510;
    float _3528 = _3346 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3530 = -_3512;
    float _3532 = _3530 + _3514;
    float _3534 = fma(_3522, _3526, _3508);
    out.m_88.x = 0.0;
    float _3536 = -_3516;
    float _3538 = _3536 + _3518;
    float _3540 = fma(_3522, _3532, _3512);
    float _3542 = _3534 * 0.586610972881317138671875;
    out.m_51.x = _3528;
    bool _3544 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3546 = fma(_3522, _3538, _3516);
    float _3548 = fma(_3540, 0.298911988735198974609375, _3542);
    bool _3550 = _2649 > 0.0;
    bool _3552 = isnan(_2649);
    bool _3554 = _3550 || _3552;
    bool _3556 = isnan(0.0);
    bool _3558 = _3554 || _3556;
    float _3560 = fma(_3546, 0.114477999508380889892578125, _3548);
    bool _3562 = _2703 <= 0.0;
    bool _3564 = !_3558;
    bool _3566 = _3562 || _3564;
    float _3568 = -_3560;
    float _3570 = _3540 + _3568;
    float _3572 = -_3560;
    float _3574 = _3534 + _3572;
    float _3576 = -_3560;
    float _3578 = _3546 + _3576;
    float _3580 = fma(_3570, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    float _3582 = fma(_3574, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    float _3584 = fma(_3578, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    bool _3586 = !_3544;
    if (!_3586)
    {
        float _3588 = -_2577;
        float _3590 = _3588 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3592 = -_2579;
        float _3594 = _3592 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3596 = -_2581;
        float _3598 = _3596 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3600 = _3590 * _3590;
        float _3602 = fma(_3594, _3594, _3600);
        float _3604 = fma(_3598, _3598, _3602);
        float _3606 = sqrt(_3604);
        float _3608 = rsqrt(_3604);
        float _3610 = -_3606;
        float _3612 = _3610 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3614 = _3612 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3616 = precise::clamp(_3614, 0.0, 1.0);
        float _3618 = _3594 * _3608;
        float _3620 = _3590 * _3608;
        float _3622 = abs(_3616);
        float _3624 = log2(_3622);
        float _3626 = _3598 * _3608;
        float _3628 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3630 = _3214 * _3620;
        float _3632 = -_3620;
        float _3634 = -_3628;
        float _3636 = fma(_3632, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3634);
        float _3638 = fma(_3166, _3618, _3630);
        float _3640 = -_3626;
        float _3642 = fma(_3640, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3636);
        float _3644 = fma(_3218, _3626, _3638);
        float _3646 = precise::clamp(_3644, 0.0, 1.0);
        float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3650 = _3642 + _3648;
        float _3652 = _3624 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3654 = _3650 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3656 = precise::clamp(_3654, 0.0, 1.0);
        float _3658 = exp2(_3652);
        float _3660 = _3658 * _3656;
        float _3662 = _3646 * _3660;
        float _3664 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3666 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3668 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3664;
        out.m_88.y = _3666;
        out.m_88.z = _3668;
    }
    out.m_90.x = _3580;
    out.m_90.y = _3582;
    out.m_90.z = _3584;
    if (!_3566)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _3670 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3670;
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
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3422 = false;
    bool _337 = false;
    bool _233 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _104 = in.m_48.w;
    float _106 = trunc(_104);
    int _109 = int(_106);
    bool _113 = _109 >= 1;
    float _115 = 0.0;
    if (!_113)
    {
        _115 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _117 = _115;
    if (!_113)
    {
        out.m_51.x = 0.0;
    }
    int _119 = 0;
    if (!_113)
    {
        float _121 = _117 * 5.0;
        _119 = as_type<int>(_121);
    }
    int _123 = _119;
    int _125 = _123;
    if (!_113)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3726 = as_type<float>(_123);
        out.gl_Position.z = _3726;
    }
    if (!_113)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _127 = in.m_53.w;
    float _129 = float(_109);
    float _131 = 1.0 / _129;
    float _133 = -_127;
    float _135 = _133 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = _127 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _139 = isnan(_127);
    bool _141 = _137 || _139;
    bool _143 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _145 = _141 || _143;
    float _147 = _135 * _131;
    bool _149 = _135 >= _129;
    bool _151 = !_145;
    bool _153 = _149 || _151;
    out.m_55.x = _147;
    float _155 = _127;
    float _157 = _147;
    float _159 = _135;
    if (_153)
    {
        _155 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _161 = _155;
    if (_153)
    {
        out.m_51.x = 0.0;
    }
    if (_153)
    {
        float _163 = _161 * 5.0;
        _125 = as_type<int>(_163);
    }
    int _165 = _125;
    if (_153)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3799 = as_type<float>(_165);
        out.gl_Position.z = _3799;
    }
    if (_153)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _167 = as_type<float>(int(gl_VertexIndex));
    float _169 = in.m_60.x;
    float _171 = in.m_60.y;
    float _173 = in.m_60.z;
    int _175 = as_type<int>(_167) & 1;
    bool _177 = _175 != 0;
    int _179 = as_type<int>(_167) & 2;
    bool _181 = _179 != 0;
    bool _183 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _185 = _171 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _187 = _171 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _189 = _171 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _191 = !_177;
    float _193 = _191 ? (-0.5) : 0.5;
    float _195 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].x, _185);
    float _197 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].x, _187);
    float _199 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].x, _189);
    bool _201 = !_181;
    float _203 = _201 ? (-0.5) : 0.5;
    float _205 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[4].z, _195);
    float _207 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[5].z, _197);
    float _209 = fma(_173, (*spvDescriptorSet0.vp_c10)._m0[6].z, _199);
    bool _211 = !_183;
    float _213 = _207;
    float _231;
    if (!_211)
    {
        float _215 = in.m_62.x;
        float _217 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _219 = _215 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _221 = fma(_219, (*spvDescriptorSet0.vp_c9)._m0[12].x, _135);
        float _223 = _221 * _217;
        float _225 = floor(_223);
        float _227 = -_225;
        float _229 = _223 + _227;
        _231 = _229;
        _233 = true;
    }
    else
    {
        _231 = _147;
    }
    _233 = false;
    float _235 = _231;
    float _237 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _239 = _235 + _237;
    float _241 = in.m_64.x;
    float _243 = in.m_64.y;
    bool _245 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _247 = isnan(_235);
    bool _249 = _245 || _247;
    bool _251 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _253 = _249 || _251;
    float _255 = float(_253);
    float _257 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _259 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _257;
    bool _261 = _235 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _263 = isnan(_235);
    bool _265 = _261 || _263;
    bool _267 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _269 = _265 || _267;
    float _271 = float(_269);
    float _273 = -_255;
    float _275 = _273 + 1.0;
    float _277 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _279 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _277;
    float _281 = 1.0 / _259;
    bool _283 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _285 = _271 * _275;
    float _287 = -_271;
    float _289 = _287 + 1.0;
    float _291 = _239 * _281;
    float _293 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _295 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _293;
    float _297 = fma(_279, _291, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _299 = fma(_295, _291, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _301 = _297 * _285;
    float _303 = _299 * _285;
    float _305 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].x, _301);
    float _307 = fma(_289, (*spvDescriptorSet0.vp_c9)._m0[143].y, _303);
    float _309 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].x, _305);
    float _311 = fma(_255, (*spvDescriptorSet0.vp_c9)._m0[144].y, _307);
    float _313 = _309 * _241;
    float _315 = _311 * _243;
    bool _317 = !_283;
    float _335;
    if (!_317)
    {
        float _319 = in.m_62.x;
        float _321 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _323 = _319 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _325 = fma(_323, (*spvDescriptorSet0.vp_c9)._m0[11].y, _135);
        float _327 = _325 * _321;
        float _329 = floor(_327);
        float _331 = -_329;
        float _333 = _327 + _331;
        _335 = _333;
        _337 = true;
    }
    else
    {
        _335 = _147;
    }
    _337 = false;
    float _339 = _335;
    bool _341 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _343 = isnan(_339);
    bool _345 = _341 || _343;
    bool _347 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _349 = _345 || _347;
    float _351 = float(_349);
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _357 = _339 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _359 = isnan(_339);
    bool _361 = _357 || _359;
    bool _363 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _365 = _361 || _363;
    float _367 = float(_365);
    float _369 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _371 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _369;
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _375 = _339 + _373;
    float _377 = -_351;
    float _379 = _377 + 1.0;
    bool _381 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _383 = 1.0 / _355;
    float _385 = _367 * _379;
    float _387 = -_367;
    float _389 = _387 + 1.0;
    float _391 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _393 = _391 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _395 = _371 * _383;
    float _397 = fma(_395, _375, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _399 = _397 * _385;
    float _401 = fma(_389, (*spvDescriptorSet0.vp_c9)._m0[115].x, _399);
    float _403 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _405 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _407 = fma(_351, (*spvDescriptorSet0.vp_c9)._m0[116].x, _401);
    float _409 = _403 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _411 = _405 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _413 = _407 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _409;
    out.m_66.y = _411;
    out.m_66.z = _393;
    out.m_66.w = _413;
    bool _415 = !_381;
    if (!_415)
    {
        float _417 = in.m_62.x;
        float _419 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _421 = _417 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _423 = fma(_421, (*spvDescriptorSet0.vp_c9)._m0[11].w, _135);
        float _425 = _423 * _419;
        float _427 = floor(_425);
        float _429 = -_427;
        float _431 = _425 + _429;
        _157 = _431;
    }
    float _433 = _157;
    float _435 = in.m_62.x;
    float _437 = in.m_62.y;
    float _439 = in.m_62.z;
    float _441 = in.m_62.w;
    float _443 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _445 = in.m_68.y;
    int _447 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _449 = _447 != 0;
    int _451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _453 = _451 != 0;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _457 = _455 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    int _459 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _461 = _459 != 0;
    float _463 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    int _465 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _467 = _465 != 0;
    float _469 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _471 = _469 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _473 = 1.0 / _457;
    float _475 = _443 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _477 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _479 = _477 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _481 = _435 > 0.5;
    float _483 = _435 * 2.0;
    bool _485 = _441 > 0.5;
    float _487 = _439 * 2.0;
    float _489 = -_193;
    int _491 = _481 ? as_type<int>(_489) : as_type<int>(_193);
    float _493 = 1.0 / _471;
    int _495 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _497 = _495 != 0;
    int _499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _501 = _499 != 0;
    float _503 = _435 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _505 = !_449;
    float _507 = _505 ? _193 : as_type<float>(_491);
    bool _509 = _437 > 0.5;
    float _511 = floor(_487);
    float _513 = -_203;
    int _515 = _509 ? as_type<int>(_513) : as_type<int>(_203);
    float _517 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _519 = _437 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _521 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _523 = !_453;
    float _525 = _523 ? _203 : as_type<float>(_515);
    float _527 = -_517;
    float _529 = fma(_503, 2.0, _527);
    int _531 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _533 = _531 != 0;
    float _535 = _437 * 2.0;
    float _537 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _539 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _537;
    float _541 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _543 = _541 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _545 = 1.0 / _479;
    float _547 = -_193;
    int _549 = _509 ? as_type<int>(_547) : as_type<int>(_193);
    float _551 = fma(_519, -2.0, _521);
    bool _553 = _439 > 0.5;
    float _555 = _543 * _473;
    float _557 = _539 * _493;
    float _559 = -_193;
    int _561 = _553 ? as_type<int>(_559) : as_type<int>(_193);
    float _563 = floor(_535);
    float _565 = -_203;
    int _567 = _553 ? as_type<int>(_565) : as_type<int>(_203);
    float _569 = _437 + _435;
    bool _571 = _511 > 0.0;
    float _573 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _575 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _573;
    bool _577 = !_497;
    float _579 = _577 ? _193 : as_type<float>(_549);
    float _581 = _569 + (-1.0);
    bool _583 = _511 >= 0.0;
    bool _585 = isnan(_511);
    bool _587 = _583 || _585;
    bool _589 = isnan(0.0);
    bool _591 = _587 || _589;
    float _593 = _437 + _439;
    float _595 = floor(_483);
    int _597 = _591 ? 0 : 1;
    float _599 = _575 * _545;
    float _601 = _593 + (-1.0);
    float _603 = fma(_581, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _605 = !_501;
    float _607 = _605 ? _203 : as_type<float>(_567);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _611 = _433 + _609;
    int _613 = ~_597;
    int _615 = _613 + 1;
    int _617 = _615 + 1;
    float _619 = fma(_601, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _621 = _563 > 0.0;
    float _623 = fma(_557, _611, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _625 = _563 >= 0.0;
    bool _627 = isnan(_563);
    bool _629 = _625 || _627;
    bool _631 = isnan(0.0);
    bool _633 = _629 || _631;
    float _635 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _637 = _433 + _635;
    int _639 = _617;
    float _641 = _557;
    if (!_571)
    {
        int _643 = ~_597;
        int _645 = _643 + 1;
        _639 = _645;
    }
    int _647 = _639;
    float _649 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _653 = _433 + _651;
    float _655 = _653;
    if (!_533)
    {
        _641 = _439;
    }
    float _657 = _641;
    float _659 = fma(_555, _637, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    float _661 = _657;
    if (_533)
    {
        _661 = _437;
    }
    float _663 = _661;
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _667 = _633 ? 0 : 1;
    float _669 = fma(_599, _653, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    bool _671 = _595 >= 0.0;
    bool _673 = isnan(_595);
    bool _675 = _671 || _673;
    bool _677 = isnan(0.0);
    bool _679 = _675 || _677;
    float _681 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[83].w, _665);
    bool _683 = _595 > 0.0;
    float _685 = _507 + 0.5;
    float _687 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[76].y, _551);
    int _689 = ~_667;
    int _691 = _689 + 1;
    int _693 = _691 + 1;
    float _695 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    float _697 = _663;
    int _699 = _693;
    if (!_533)
    {
        _655 = _437;
    }
    float _701 = _655;
    float _703 = _579 + 0.5;
    float _705 = _701;
    if (!_533)
    {
        _697 = _439;
    }
    float _707 = _697;
    float _709 = -_607;
    float _711 = _709 + 0.5;
    float _713 = _707;
    if (!_621)
    {
        int _715 = ~_667;
        int _717 = _715 + 1;
        _699 = _717;
    }
    int _719 = _699;
    float _721 = -_135;
    float _723 = fma(_721, (*spvDescriptorSet0.vp_c9)._m0[76].x, _529);
    if (_533)
    {
        _705 = _435;
    }
    float _725 = _705;
    float _727 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    if (_533)
    {
        _713 = _437;
    }
    float _729 = _713;
    float _731 = _703 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    int _733 = _679 ? 0 : 1;
    float _735 = _725 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _737 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _739 = _737 != 0;
    int _741 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _743 = _741 != 0;
    int _745 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _747 = _745 != 0;
    float _749 = _649 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _751 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _753 = isnan(_433);
    bool _755 = _751 || _753;
    bool _757 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _759 = _755 || _757;
    float _761 = float(_759);
    float _763 = _729 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    bool _765 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _767 = isnan(_433);
    bool _769 = _765 || _767;
    bool _771 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _773 = _769 || _771;
    float _775 = float(_773);
    float _777 = fma(_749, _685, _723);
    bool _779 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _781 = isnan(_433);
    bool _783 = _779 || _781;
    bool _785 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _787 = _783 || _785;
    float _789 = float(_787);
    float _791 = -_761;
    float _793 = _791 + 1.0;
    bool _795 = _433 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _797 = isnan(_433);
    bool _799 = _795 || _797;
    bool _801 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _803 = _799 || _801;
    float _805 = float(_803);
    float _807 = -_775;
    float _809 = _807 + 1.0;
    float _811 = _775 * _793;
    float _813 = _805 * _809;
    float _815 = -_805;
    float _817 = _815 + 1.0;
    float _819 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _821 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _823 = _789 * _817;
    float _825 = _525 + (-0.5);
    float _827 = -_789;
    float _829 = _827 + 1.0;
    float _831 = fma(_725, (*spvDescriptorSet0.vp_c9)._m0[83].z, _821);
    float _833 = fma(_763, -2.0, _819);
    float _835 = -_475;
    float _837 = -_687;
    float _839 = fma(_835, _825, _837);
    float _841 = _623 * _823;
    float _843 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _845 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _847 = _711 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _849 = fma(_829, (*spvDescriptorSet0.vp_c9)._m0[131].x, _841);
    float _851 = _731 * _463;
    float _853 = in.m_48.x;
    float _855 = in.m_48.y;
    float _857 = in.m_48.z;
    float _859 = -_845;
    float _861 = fma(_735, 2.0, _859);
    float _863 = -_203;
    int _865 = _485 ? as_type<int>(_863) : as_type<int>(_203);
    float _867 = _847 * _695;
    float _869 = _727 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _871 = fma(_659, _813, _849);
    bool _873 = !_461;
    float _875 = _873 ? _203 : as_type<float>(_865);
    float _877 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[81].y, _833);
    out.m_70.x = _851;
    out.m_70.y = _867;
    float _879 = _843 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _881 = _875 + (-0.5);
    float _883 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _885 = !_467;
    float _887 = _885 ? _193 : as_type<float>(_561);
    float _889 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _891 = -_879;
    float _893 = -_877;
    float _895 = fma(_891, _881, _893);
    float _897 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _899 = log2(_897);
    float _901 = fma(_437, (*spvDescriptorSet0.vp_c9)._m0[78].w, _883);
    float _903 = _887 + 0.5;
    float _905 = -_135;
    float _907 = fma(_905, (*spvDescriptorSet0.vp_c9)._m0[81].x, _861);
    float _909 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[78].z, _889);
    float _911 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].w, _901);
    float _913 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].z, _831);
    float _915 = _855 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _917 = _855 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _919 = fma(_869, _903, _907);
    float _921 = _855 + _445;
    float _923 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[6].x, _915);
    float _925 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[4].x, _917);
    float _927 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[77].z, _909);
    float _929 = -_913;
    float _931 = _929 + 1.0;
    float _933 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[6].z, _923);
    float _935 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[4].z, _925);
    float _937 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _939 = _921 + _937;
    float _941 = -_927;
    float _943 = _941 + 1.0;
    float _945 = _933 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _947 = -_911;
    float _949 = _947 + 1.0;
    float _951 = _935 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _953 = fma(_135, (*spvDescriptorSet0.vp_c9)._m0[82].w, _681);
    float _955 = -_943;
    float _957 = fma(_507, _955, _777);
    float _959 = fma(_525, _949, _839);
    bool _961 = !_739;
    int _963 = _961 ? 0 : 1;
    float _965 = -_931;
    float _967 = fma(_887, _965, _919);
    float _969 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _971 = _951 + _969;
    float _973 = _939 * _939;
    float _975 = _899 * _135;
    float _977 = -_953;
    float _979 = _977 + 1.0;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _983 = _945 + _981;
    int _985 = abs(_963);
    float _987 = fma(_971, _971, _973);
    float _989 = fma(_875, _979, _895);
    float _991 = in.m_72.x;
    float _993 = in.m_72.y;
    float _995 = in.m_72.z;
    bool _997 = !_743;
    int _999 = _997 ? 0 : 1;
    float _1001 = exp2(_975);
    float _1003 = fma(_983, _983, _987);
    float _1005 = fma(_669, _811, _871);
    int _1007 = abs(_999);
    float _1009 = _939 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    bool _1011 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1013 = isnan(1.0);
    bool _1015 = _1011 || _1013;
    bool _1017 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1019 = _1015 || _1017;
    float _1021 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1023 = 1.0 + _1021;
    float _1025 = rsqrt(_1003);
    float _1027 = float(_647);
    float _1029 = fma(_971, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1009);
    float _1031 = float(_985);
    float _1033 = _313 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    out.m_74.x = _957;
    out.m_74.y = _959;
    out.m_74.z = _967;
    out.m_74.w = _989;
    bool _1035 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1037 = isnan(0.0);
    bool _1039 = _1035 || _1037;
    bool _1041 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1043 = _1039 || _1041;
    float _1045 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1029);
    float _1047 = 1.0 / _1023;
    float _1049 = _1031 * _1027;
    float _1051 = -_1001;
    float _1053 = _1051 + 1.0;
    int _1055 = ~_733;
    int _1057 = _1055 + 1;
    int _1059 = _1057 + 1;
    float _1061 = fma(_761, (*spvDescriptorSet0.vp_c9)._m0[134].x, _1005);
    int _1063 = _1059;
    float _1065 = as_type<float>(_1007);
    float _1067 = _945;
    if (!_683)
    {
        int _1069 = ~_733;
        int _1071 = _1069 + 1;
        _1063 = _1071;
    }
    int _1073 = _1063;
    float _1075 = _1043 ? _1053 : 0.0;
    bool _1077 = _1045 >= 0.0;
    float _1079 = _1033 * (*spvDescriptorSet0.vp_c9)._m0[18].w;
    float _1081 = _1049 * (-2.0);
    float _1083 = _1061 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1085 = _1079 * _1025;
    float _1087 = fma(_603, _1081, _603);
    float _1089 = fma(_1081, _991, _991);
    float _1091 = _435 + (-0.5);
    float _1093 = _995;
    if (_1019)
    {
        float _1095 = _1075 * _1047;
        _159 = _1095;
    }
    float _1097 = _159;
    float _1099 = float(_1073);
    float _1101 = _939 * _1085;
    float _1103 = fma(_1091, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1089);
    float _1105 = _971 * _1085;
    float _1107 = fma(_1087, _1097, _1103);
    float _1109 = -_1101;
    float _1111 = _939 + _1109;
    float _1113 = float(_1007);
    float _1115 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1117 = _1101;
    if (_1077)
    {
        _1065 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1119 = _1065;
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1123 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1125 = _1113 * _1099;
    int _1127 = as_type<int>(_1119);
    if (_1077)
    {
        float _1129 = _1119 * 5.0;
        _1127 = as_type<int>(_1129);
    }
    int _1131 = _1127;
    float _1133 = -_1105;
    float _1135 = _971 + _1133;
    float _1137 = _1111 * _1111;
    float _1139 = _983 * _1085;
    float _1141 = _1115 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1145 = _1123 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1147 = _1125 * (-2.0);
    float _1149 = fma(_1135, _1135, _1137);
    float _1151 = -_1139;
    float _1153 = _983 + _1151;
    float _1155 = _1149;
    if (_1077)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5394 = as_type<float>(_1131);
        out.gl_Position.z = _5394;
    }
    float _1157 = fma(_619, _1147, _619);
    float _1159 = fma(_1147, _993, _993);
    float _1161 = _437 + (-0.5);
    if (_1077)
    {
        out.m_51.x = 0.0;
    }
    bool _1163 = !_747;
    int _1165 = _1163 ? 0 : 1;
    out.m_76.x = _1141;
    out.m_76.y = _1143;
    out.m_76.z = _1145;
    out.m_76.w = _1083;
    float _1167 = fma(_1153, _1153, _1149);
    if (_1077)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1169 = -_1101;
    float _1171 = _921 + _1169;
    int _1173 = abs(_1165);
    float _1175 = -_1105;
    float _1177 = _951 + _1175;
    float _1179 = float(_719);
    float _1181 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1183 = _1171 + _1181;
    float _1185 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1187 = _1177 + _1185;
    float _1189 = -_1139;
    float _1191 = _945 + _1189;
    float _1193 = _1183 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1195 = fma(_1161, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1159);
    float _1197 = _439 + _435;
    float _1199 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1201 = _1191 + _1199;
    float _1203 = fma(_1187, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1193);
    float _1205 = float(_1173);
    float _1207 = _1107 * 0.15915493667125701904296875;
    float _1209 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1203);
    float _1211 = _1197 + (-1.0);
    float _1213 = _1205 * _1179;
    float _1215 = fma(_1157, _1097, _1195);
    float _1217 = _439 + (-0.5);
    bool _1219 = _1209 >= 0.0;
    float _1221 = _1213 * (-2.0);
    float _1223 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1225 = _1215 * 0.15915493667125701904296875;
    float _1227 = sqrt(_1167);
    float _1229 = fma(_1221, _995, _995);
    float _1231 = fma(_1223, _1221, _1223);
    float _1233 = fma(_1217, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1229);
    float _1235 = _1207 * 6.283185482025146484375;
    float _1237 = sin(_1235);
    float _1239 = fma(_1231, _1097, _1233);
    if (_1219)
    {
        _1093 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1241 = _1093;
    int _1243 = as_type<int>(_1241);
    if (_1219)
    {
        out.m_51.x = 0.0;
    }
    float _1245 = _1239 * 0.15915493667125701904296875;
    if (_1219)
    {
        float _1247 = _1241 * 5.0;
        _1243 = as_type<int>(_1247);
    }
    int _1249 = _1243;
    float _1251 = _1207 * 6.283185482025146484375;
    float _1253 = cos(_1251);
    if (_1219)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _5572 = as_type<float>(_1249);
        out.gl_Position.z = _5572;
    }
    float _1255 = _1225 * 6.283185482025146484375;
    float _1257 = sin(_1255);
    float _1259 = _1225 * 6.283185482025146484375;
    float _1261 = cos(_1259);
    float _1263 = _1245 * 6.283185482025146484375;
    float _1265 = sin(_1263);
    if (_1219)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1267 = _1245 * 6.283185482025146484375;
    float _1269 = cos(_1267);
    bool _1271 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].y;
    float _1273 = _1237 * _1257;
    float _1275 = _1253 * _1261;
    bool _1277 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].z;
    float _1279 = _1025 * _1227;
    float _1281 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1283 = _1281 + (*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1285 = fma(_1265, _1275, _1273);
    float _1287 = fma(_1265, _1273, _1275);
    float _1289 = _1253 * _1257;
    float _1291 = _1237 * _1261;
    float _1293 = _1099;
    float _1295 = _1291;
    if (_1271)
    {
        float _1297 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].y;
        _1293 = _1297;
    }
    float _1299 = _1293;
    float _1301 = _1261 * _1269;
    float _1303 = _1253 * _1269;
    float _1305 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1307 = _1305 + (*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1309 = _1033 * _1279;
    float _1311 = _315 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1313 = _1237 * _1269;
    float _1315 = 1.0 / _1283;
    float _1317 = _1257 * _1269;
    float _1319 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _193);
    float _1321 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1323 = _1321 + (*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1325 = -_1289;
    float _1327 = fma(_1265, _1291, _1325);
    float _1329 = -_1291;
    float _1331 = fma(_1265, _1289, _1329);
    if (_1271)
    {
        float _1333 = _435 * (*spvDescriptorSet0.vp_c9)._m0[15].y;
        _1295 = _1333;
    }
    float _1335 = _1295;
    if (_1277)
    {
        float _1337 = _435 * (*spvDescriptorSet0.vp_c9)._m0[15].z;
        _1155 = _1337;
    }
    float _1339 = _1155;
    float _1341 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1343 = _1341 + (*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1345 = _1279 * _1311;
    float _1347 = _1207;
    float _1349 = _1345;
    if (_1277)
    {
        float _1351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].z;
        _1347 = _1351;
    }
    float _1353 = _1347;
    float _1355 = _1319 * _1309;
    float _1357 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _1359 = -_921;
    float _1361 = _1359 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1363 = _1357 * _1345;
    float _1365 = 1.0 / _1307;
    float _1367 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1369 = _1367 + (*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1371 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1373 = _1371 + (*spvDescriptorSet0.vp_c9)._m0[182].w;
    float _1375 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    if (_1271)
    {
        float _1377 = fma(_1335, (*spvDescriptorSet0.vp_c9)._m0[14].y, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1349 = _1377;
    }
    float _1379 = _1349;
    if (_1277)
    {
        float _1381 = fma(_1339, (*spvDescriptorSet0.vp_c9)._m0[14].z, (*spvDescriptorSet0.vp_c7)._m0[0].x);
        _1375 = _1381;
    }
    float _1383 = _1375;
    float _1385 = -_951;
    float _1387 = _1385 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1389 = 1.0 / _1323;
    float _1391 = _1361 * _1361;
    float _1393 = _1299;
    if (_1271)
    {
        float _1395 = _1379 * _1299;
        _1393 = _1395;
    }
    float _1397 = _1393;
    float _1399 = -_945;
    float _1401 = _1399 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1403 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1405 = _1403 + (*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1407 = fma(_1387, _1387, _1391);
    float _1409 = _1353;
    if (_1277)
    {
        float _1411 = _1383 * _1353;
        _1409 = _1411;
    }
    float _1413 = _1409;
    float _1415 = 1.0 / _1343;
    float _1417 = fma(_1401, _1401, _1407);
    float _1419 = _1279 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1421 = _1419 * 0.5;
    float _1423 = -(*spvDescriptorSet0.vp_c9)._m0[175].x;
    float _1425 = (*spvDescriptorSet0.vp_c9)._m0[176].x + _1423;
    float _1427 = -(*spvDescriptorSet0.vp_c9)._m0[176].x;
    float _1429 = _1427 + (*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1431 = 1.0 / _1369;
    float _1433 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1435 = (*spvDescriptorSet0.vp_c9)._m0[168].w + _1433;
    float _1437 = _1425 * _1315;
    float _1439 = -(*spvDescriptorSet0.vp_c9)._m0[177].x;
    float _1441 = (*spvDescriptorSet0.vp_c9)._m0[178].x + _1439;
    float _1443 = -(*spvDescriptorSet0.vp_c9)._m0[178].x;
    float _1445 = _1443 + (*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1447 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1449 = (*spvDescriptorSet0.vp_c9)._m0[170].w + _1447;
    float _1451 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1453 = _1451 + (*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1455 = 1.0 / _1373;
    float _1457 = _1445 * _1365;
    float _1459 = _1441 * _1415;
    float _1461 = -(*spvDescriptorSet0.vp_c9)._m0[179].x;
    float _1463 = (*spvDescriptorSet0.vp_c9)._m0[180].x + _1461;
    float _1465 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1467 = _1465 + (*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1469 = 0.0;
    if (!_1277)
    {
        _1469 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1471 = _1469;
    float _1473 = -(*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1475 = (*spvDescriptorSet0.vp_c9)._m0[182].x + _1473;
    float _1477 = 1.0 / _1405;
    float _1479 = _1429 * _1431;
    float _1481 = _1463 * _1389;
    float _1483 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1485 = (*spvDescriptorSet0.vp_c9)._m0[172].w + _1483;
    float _1487 = -_1363;
    float _1489 = _1265 * _1487;
    float _1491 = _855 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1493 = rsqrt(_1417);
    float _1495 = _1475 * _1455;
    float _1497 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1499 = _1497 + (*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1501 = _1303 * _1363;
    float _1503 = _1313 * _1363;
    float _1505 = fma(_1301, _1355, _1489);
    float _1507 = -(*spvDescriptorSet0.vp_c9)._m0[167].y;
    float _1509 = (*spvDescriptorSet0.vp_c9)._m0[168].y + _1507;
    float _1511 = fma(_1285, _1355, _1501);
    float _1513 = _1425;
    float _1515 = _1471;
    if (_1271)
    {
        float _1517 = floor(_1397);
        _1513 = _1517;
    }
    float _1519 = _1513;
    float _1521 = -(*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1523 = _1521 + (*spvDescriptorSet0.vp_c9)._m0[181].x;
    float _1525 = fma(_1327, _1355, _1503);
    float _1527 = fma(_1317, _1421, _1505);
    float _1529 = _1523 * _1477;
    float _1531 = _1523;
    if (!_1271)
    {
        _1531 = (*spvDescriptorSet0.vp_c7)._m0[0].x;
    }
    float _1533 = _1531;
    float _1535 = fma(_1331, _1421, _1511);
    float _1537 = (*spvDescriptorSet0.vp_c9)._m0[180].x;
    float _1539 = _1533;
    if (_1277)
    {
        float _1541 = floor(_1413);
        _1537 = _1541;
    }
    float _1543 = _1537;
    float _1545 = _1387 * _1493;
    float _1547 = _1361 * _1493;
    float _1549 = _1401 * _1493;
    float _1551 = fma(_1287, _1421, _1525);
    float _1553 = -(*spvDescriptorSet0.vp_c9)._m0[168].y;
    float _1555 = _1553 + (*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1557 = fma(_853, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1491);
    float _1559 = 1.0 / _1435;
    if (_1271)
    {
        float _1561 = -_1519;
        float _1563 = _1397 + _1561;
        _1539 = _1563;
    }
    float _1565 = _1539;
    float _1567 = fma(_857, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1557);
    float _1569 = -(*spvDescriptorSet0.vp_c9)._m0[168].w;
    float _1571 = _1565 + _1569;
    float _1573 = -(*spvDescriptorSet0.vp_c9)._m0[169].w;
    float _1575 = _1565 + _1573;
    float _1577 = -(*spvDescriptorSet0.vp_c9)._m0[171].w;
    float _1579 = _1565 + _1577;
    float _1581 = 1.0 / _1453;
    if (_1277)
    {
        float _1583 = -_1543;
        float _1585 = _1413 + _1583;
        _1515 = _1585;
    }
    float _1587 = _1515;
    float _1589 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1591 = (*spvDescriptorSet0.vp_c9)._m0[174].w + _1589;
    float _1593 = -(*spvDescriptorSet0.vp_c9)._m0[167].w;
    float _1595 = _1565 + _1593;
    float _1597 = -(*spvDescriptorSet0.vp_c9)._m0[173].w;
    float _1599 = _1565 + _1597;
    float _1601 = -(*spvDescriptorSet0.vp_c9)._m0[176].w;
    float _1603 = _1587 + _1601;
    bool _1605 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[178].w;
    bool _1607 = isnan(_1587);
    bool _1609 = _1605 || _1607;
    bool _1611 = isnan((*spvDescriptorSet0.vp_c9)._m0[178].w);
    bool _1613 = _1609 || _1611;
    float _1615 = float(_1613);
    float _1617 = _1567 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1619 = 1.0 / _1467;
    float _1621 = _1595 * _1559;
    float _1623 = -(*spvDescriptorSet0.vp_c9)._m0[170].w;
    float _1625 = _1565 + _1623;
    float _1627 = fma(_1479, _1603, (*spvDescriptorSet0.vp_c9)._m0[176].x);
    float _1629 = -(*spvDescriptorSet0.vp_c9)._m0[179].w;
    float _1631 = _1587 + _1629;
    bool _1633 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[179].w;
    bool _1635 = isnan(_1587);
    bool _1637 = _1633 || _1635;
    bool _1639 = isnan((*spvDescriptorSet0.vp_c9)._m0[179].w);
    bool _1641 = _1637 || _1639;
    float _1643 = float(_1641);
    float _1645 = -(*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _1647 = _1617 + _1645;
    bool _1649 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[174].w;
    bool _1651 = isnan(_1565);
    bool _1653 = _1649 || _1651;
    bool _1655 = isnan((*spvDescriptorSet0.vp_c9)._m0[174].w);
    bool _1657 = _1653 || _1655;
    float _1659 = float(_1657);
    float _1661 = 1.0 / _1499;
    float _1663 = _1625 * _1581;
    float _1665 = -(*spvDescriptorSet0.vp_c9)._m0[175].w;
    float _1667 = _1587 + _1665;
    float _1669 = fma(_1481, _1631, (*spvDescriptorSet0.vp_c9)._m0[179].x);
    float _1671 = -(*spvDescriptorSet0.vp_c9)._m0[181].w;
    float _1673 = _1587 + _1671;
    bool _1675 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[181].w;
    bool _1677 = isnan(_1587);
    bool _1679 = _1675 || _1677;
    bool _1681 = isnan((*spvDescriptorSet0.vp_c9)._m0[181].w);
    bool _1683 = _1679 || _1681;
    float _1685 = float(_1683);
    float _1687 = fma(_1437, _1667, (*spvDescriptorSet0.vp_c9)._m0[175].x);
    float _1689 = -(*spvDescriptorSet0.vp_c9)._m0[178].w;
    float _1691 = _1587 + _1689;
    float _1693 = 1.0 / _1449;
    float _1695 = _1571 * _1619;
    float _1697 = -(*spvDescriptorSet0.vp_c9)._m0[172].w;
    float _1699 = _1565 + _1697;
    float _1701 = fma(_1457, _1691, (*spvDescriptorSet0.vp_c9)._m0[178].x);
    float _1703 = -(*spvDescriptorSet0.vp_c9)._m0[180].w;
    float _1705 = _1587 + _1703;
    float _1707 = fma(_1495, _1673, (*spvDescriptorSet0.vp_c9)._m0[181].x);
    bool _1709 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[180].w;
    bool _1711 = isnan(_1587);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan((*spvDescriptorSet0.vp_c9)._m0[180].w);
    bool _1717 = _1713 || _1715;
    float _1719 = float(_1717);
    float _1721 = fma(_1555, _1695, (*spvDescriptorSet0.vp_c9)._m0[168].y);
    float _1723 = 1.0 / _1485;
    float _1725 = _1699 * _1661;
    float _1727 = fma(_1529, _1705, (*spvDescriptorSet0.vp_c9)._m0[180].x);
    float _1729 = -(*spvDescriptorSet0.vp_c9)._m0[177].w;
    float _1731 = _1587 + _1729;
    bool _1733 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[177].w;
    bool _1735 = isnan(_1587);
    bool _1737 = _1733 || _1735;
    bool _1739 = isnan((*spvDescriptorSet0.vp_c9)._m0[177].w);
    bool _1741 = _1737 || _1739;
    float _1743 = float(_1741);
    bool _1745 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[168].w;
    bool _1747 = isnan(_1565);
    bool _1749 = _1745 || _1747;
    bool _1751 = isnan((*spvDescriptorSet0.vp_c9)._m0[168].w);
    bool _1753 = _1749 || _1751;
    float _1755 = float(_1753);
    float _1757 = fma(_1459, _1731, (*spvDescriptorSet0.vp_c9)._m0[177].x);
    float _1759 = 1.0 / _1591;
    float _1761 = _1575 * _1693;
    float _1763 = -_1615;
    float _1765 = _1763 + 1.0;
    bool _1767 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[176].w;
    bool _1769 = isnan(_1587);
    bool _1771 = _1767 || _1769;
    bool _1773 = isnan((*spvDescriptorSet0.vp_c9)._m0[176].w);
    bool _1775 = _1771 || _1773;
    float _1777 = float(_1775);
    float _1779 = -_1755;
    float _1781 = _1779 + 1.0;
    float _1783 = _1743 * _1765;
    float _1785 = -_1743;
    float _1787 = _1785 + 1.0;
    float _1789 = _1579 * _1723;
    bool _1791 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[175].w;
    bool _1793 = isnan(_1587);
    bool _1795 = _1791 || _1793;
    bool _1797 = isnan((*spvDescriptorSet0.vp_c9)._m0[175].w);
    bool _1799 = _1795 || _1797;
    float _1801 = float(_1799);
    float _1803 = -_1643;
    float _1805 = _1803 + 1.0;
    float _1807 = _1777 * _1787;
    float _1809 = -_1777;
    float _1811 = _1809 + 1.0;
    bool _1813 = _1587 >= (*spvDescriptorSet0.vp_c9)._m0[182].w;
    bool _1815 = isnan(_1587);
    bool _1817 = _1813 || _1815;
    bool _1819 = isnan((*spvDescriptorSet0.vp_c9)._m0[182].w);
    bool _1821 = _1817 || _1819;
    float _1823 = float(_1821);
    float _1825 = _1615 * _1805;
    float _1827 = -_1719;
    float _1829 = _1827 + 1.0;
    float _1831 = _1801 * _1811;
    float _1833 = _1599 * _1759;
    bool _1835 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[173].w;
    bool _1837 = isnan(_1565);
    bool _1839 = _1835 || _1837;
    bool _1841 = isnan((*spvDescriptorSet0.vp_c9)._m0[173].w);
    bool _1843 = _1839 || _1841;
    float _1845 = float(_1843);
    float _1847 = -_1659;
    float _1849 = _1847 + 1.0;
    float _1851 = _1687 * _1831;
    bool _1853 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[172].w;
    bool _1855 = isnan(_1565);
    bool _1857 = _1853 || _1855;
    bool _1859 = isnan((*spvDescriptorSet0.vp_c9)._m0[172].w);
    bool _1861 = _1857 || _1859;
    float _1863 = float(_1861);
    float _1865 = _1643 * _1829;
    float _1867 = _1845 * _1849;
    float _1869 = -_1845;
    float _1871 = _1869 + 1.0;
    float _1873 = -_1801;
    float _1875 = _1873 + 1.0;
    bool _1877 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[171].w;
    bool _1879 = isnan(_1565);
    bool _1881 = _1877 || _1879;
    bool _1883 = isnan((*spvDescriptorSet0.vp_c9)._m0[171].w);
    bool _1885 = _1881 || _1883;
    float _1887 = float(_1885);
    float _1889 = -_1863;
    float _1891 = _1889 + 1.0;
    float _1893 = _1863 * _1871;
    float _1895 = fma(_1875, (*spvDescriptorSet0.vp_c9)._m0[175].x, _1851);
    float _1897 = -_1685;
    float _1899 = _1897 + 1.0;
    bool _1901 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[170].w;
    bool _1903 = isnan(_1565);
    bool _1905 = _1901 || _1903;
    bool _1907 = isnan((*spvDescriptorSet0.vp_c9)._m0[170].w);
    bool _1909 = _1905 || _1907;
    float _1911 = float(_1909);
    float _1913 = -_1887;
    float _1915 = _1913 + 1.0;
    float _1917 = fma(_1627, _1807, _1895);
    float _1919 = _1719 * _1899;
    bool _1921 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[169].w;
    bool _1923 = isnan(_1565);
    bool _1925 = _1921 || _1923;
    bool _1927 = isnan((*spvDescriptorSet0.vp_c9)._m0[169].w);
    bool _1929 = _1925 || _1927;
    float _1931 = float(_1929);
    float _1933 = _1911 * _1915;
    float _1935 = -_1911;
    float _1937 = _1935 + 1.0;
    float _1939 = -(*spvDescriptorSet0.vp_c9)._m0[167].x;
    float _1941 = (*spvDescriptorSet0.vp_c9)._m0[168].x + _1939;
    bool _1943 = _1565 >= (*spvDescriptorSet0.vp_c9)._m0[167].w;
    bool _1945 = isnan(_1565);
    bool _1947 = _1943 || _1945;
    bool _1949 = isnan((*spvDescriptorSet0.vp_c9)._m0[167].w);
    bool _1951 = _1947 || _1949;
    float _1953 = float(_1951);
    float _1955 = _1887 * _1891;
    float _1957 = -_1931;
    float _1959 = _1957 + 1.0;
    float _1961 = fma(_1941, _1621, (*spvDescriptorSet0.vp_c9)._m0[167].x);
    float _1963 = -(*spvDescriptorSet0.vp_c9)._m0[168].x;
    float _1965 = _1963 + (*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _1967 = _1953 * _1781;
    float _1969 = -_1953;
    float _1971 = _1969 + 1.0;
    float _1973 = fma(_1509, _1621, (*spvDescriptorSet0.vp_c9)._m0[167].y);
    float _1975 = _1755 * _1959;
    float _1977 = _1961 * _1967;
    float _1979 = fma(_1965, _1695, (*spvDescriptorSet0.vp_c9)._m0[168].x);
    float _1981 = _1973 * _1967;
    float _1983 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[167].x, _1977);
    float _1985 = fma(_1757, _1783, _1917);
    float _1987 = _1931 * _1937;
    float _1989 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[167].y, _1981);
    float _1991 = fma(_1979, _1975, _1983);
    float _1993 = -(*spvDescriptorSet0.vp_c9)._m0[169].y;
    float _1995 = (*spvDescriptorSet0.vp_c9)._m0[170].y + _1993;
    float _1997 = fma(_1701, _1825, _1985);
    float _1999 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2001 = _1545 * _1999;
    float _2003 = fma(_1721, _1975, _1989);
    float _2005 = fma(_1995, _1761, (*spvDescriptorSet0.vp_c9)._m0[169].y);
    float _2007 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2009 = _1549 * _2007;
    float _2011 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2013 = -_2001;
    float _2015 = fma(_1549, _2011, _2013);
    float _2017 = -_1823;
    float _2019 = _2017 + 1.0;
    float _2021 = fma(_2005, _1987, _2003);
    float _2023 = -(*spvDescriptorSet0.vp_c9)._m0[169].x;
    float _2025 = (*spvDescriptorSet0.vp_c9)._m0[170].x + _2023;
    float _2027 = -(*spvDescriptorSet0.vp_c9)._m0[170].x;
    float _2029 = _2027 + (*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2031 = -(*spvDescriptorSet0.vp_c8)._m0[1].z;
    float _2033 = -_2009;
    float _2035 = fma(_1547, _2031, _2033);
    float _2037 = -(*spvDescriptorSet0.vp_c8)._m0[1].x;
    float _2039 = _1547 * _2037;
    float _2041 = _2015 * _2015;
    float _2043 = _1685 * _2019;
    float _2045 = -(*spvDescriptorSet0.vp_c9)._m0[170].y;
    float _2047 = _2045 + (*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2049 = -(*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2051 = -_2039;
    float _2053 = fma(_1545, _2049, _2051);
    float _2055 = fma(_2035, _2035, _2041);
    float _2057 = fma(_2025, _1761, (*spvDescriptorSet0.vp_c9)._m0[169].x);
    float _2059 = fma(_2047, _1663, (*spvDescriptorSet0.vp_c9)._m0[170].y);
    float _2061 = fma(_2053, _2053, _2055);
    float _2063 = fma(_2057, _1987, _1991);
    float _2065 = fma(_2029, _1663, (*spvDescriptorSet0.vp_c9)._m0[170].x);
    float _2067 = fma(_1669, _1865, _1997);
    float _2069 = rsqrt(_2061);
    float _2071 = -(*spvDescriptorSet0.vp_c9)._m0[171].x;
    float _2073 = (*spvDescriptorSet0.vp_c9)._m0[172].x + _2071;
    float _2075 = fma(_2059, _1933, _2021);
    float _2077 = fma(_2065, _1933, _2063);
    float _2079 = -(*spvDescriptorSet0.vp_c9)._m0[171].y;
    float _2081 = (*spvDescriptorSet0.vp_c9)._m0[172].y + _2079;
    float _2083 = -(*spvDescriptorSet0.vp_c9)._m0[172].x;
    float _2085 = _2083 + (*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2087 = fma(_2073, _1789, (*spvDescriptorSet0.vp_c9)._m0[171].x);
    float _2089 = fma(_1727, _1919, _2067);
    float _2091 = -(*spvDescriptorSet0.vp_c9)._m0[173].x;
    float _2093 = (*spvDescriptorSet0.vp_c9)._m0[174].x + _2091;
    float _2095 = fma(_2081, _1789, (*spvDescriptorSet0.vp_c9)._m0[171].y);
    float _2097 = fma(_2087, _1955, _2077);
    float _2099 = fma(_2085, _1725, (*spvDescriptorSet0.vp_c9)._m0[172].x);
    float _2101 = fma(_1707, _2043, _2089);
    float _2103 = fma(_2093, _1833, (*spvDescriptorSet0.vp_c9)._m0[173].x);
    float _2105 = fma(_2095, _1955, _2075);
    float _2107 = _2035 * _2069;
    float _2109 = fma(_2099, _1893, _2097);
    float _2111 = -(*spvDescriptorSet0.vp_c9)._m0[172].y;
    float _2113 = _2111 + (*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2115 = _2053 * _2069;
    float _2117 = _2015 * _2069;
    float _2119 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[182].x, _2101);
    float _2121 = _1547 * _2107;
    float _2123 = fma(_2113, _1725, (*spvDescriptorSet0.vp_c9)._m0[172].y);
    float _2125 = fma(_2103, _1867, _2109);
    float _2127 = -(*spvDescriptorSet0.vp_c9)._m0[173].y;
    float _2129 = (*spvDescriptorSet0.vp_c9)._m0[174].y + _2127;
    float _2131 = _1549 * _2117;
    float _2133 = -_2121;
    float _2135 = fma(_1545, _2117, _2133);
    float _2137 = fma(_2123, _1893, _2105);
    float _2139 = fma(_2129, _1833, (*spvDescriptorSet0.vp_c9)._m0[173].y);
    float _2141 = -_2131;
    float _2143 = fma(_1547, _2115, _2141);
    float _2145 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[174].x, _2125);
    float _2147 = _2135 * _1535;
    float _2149 = fma(_2139, _1867, _2137);
    float _2151 = -(*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2153 = _945 + _2151;
    float _2155 = _2119 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _2157 = _2143 * _1535;
    float _2159 = fma(_2115, _1527, _2147);
    float _2161 = -(*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2163 = _951 + _2161;
    float _2165 = -_2155;
    float _2167 = fma(_2145, _2153, _2165);
    float _2169 = fma(_2107, _1527, _2157);
    float _2171 = _2119 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _2173 = fma(_1549, _1551, _2159);
    float _2175 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[174].y, _2149);
    float _2177 = fma(_1545, _1551, _2169);
    float _2179 = -_2171;
    float _2181 = fma(_2145, _2163, _2179);
    float _2183 = _1545 * _2115;
    float _2185 = fma(_2173, _2175, _2167);
    float _2187 = fma(_2177, _2175, _2181);
    float _2189 = -_2183;
    float _2191 = fma(_1549, _2107, _2189);
    float _2193 = _2185 + (*spvDescriptorSet0.vp_c10)._m0[10].w;
    float _2195 = _2187 + (*spvDescriptorSet0.vp_c10)._m0[8].w;
    float _2197 = _2191 * _1535;
    float _2199 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _2201 = _2193 + _2199;
    float _2203 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _2205 = _2195 + _2203;
    float _2207 = fma(_2117, _1527, _2197);
    float _2209 = _2201 * _2201;
    float _2211 = fma(_1547, _1551, _2207);
    float _2213 = fma(_2205, _2205, _2209);
    float _2215 = _921 + _2211;
    float _2217 = sqrt(_2213);
    float _2219 = -_1617;
    float _2221 = _2215 + _2219;
    bool _2223 = _2217 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2225 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2227 = _2217 + _2225;
    float _2229 = _2105;
    float _2231 = _2213;
    float _2233 = _2227;
    float _2235 = _1617;
    float _2237 = _2193;
    float _2239 = _2205;
    if (_2223)
    {
        float _2241 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2229 = _2241;
    }
    float _2243 = _2229;
    if (_2223)
    {
        float _2245 = rsqrt(_2213);
        _2231 = _2245;
    }
    float _2247 = _2231;
    if (_2223)
    {
        float _2249 = _2227 * _2243;
        _2233 = _2249;
    }
    float _2251 = _2233;
    float _2253 = _2119 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _2255 = _2251;
    if (_2223)
    {
        float _2257 = _2251 * 0.15915493667125701904296875;
        _2255 = _2257;
    }
    float _2259 = _2255;
    float _2261 = -_2253;
    float _2263 = fma(_2145, _1647, _2261);
    float _2265 = _2119;
    if (_2223)
    {
        float _2267 = _2259 * 6.283185482025146484375;
        float _2269 = sin(_2267);
        _2265 = _2269;
    }
    float _2271 = _2265;
    float _2273 = fma(_2175, _2221, _2263);
    float _2275 = _2273 + (*spvDescriptorSet0.vp_c10)._m0[9].w;
    float _2277 = _2275;
    if (_2223)
    {
        float _2279 = _2275 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2235 = _2279;
    }
    float _2281 = _2235;
    float _2283 = _2281;
    float _2285 = _2271;
    if (_2223)
    {
        float _2287 = fma(_2271, _2281, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2283 = _2287;
    }
    float _2289 = _2283;
    float _2291 = _2289;
    if (!_2223)
    {
        _2285 = _2195;
    }
    float _2293 = _2285;
    float _2295 = _2293;
    if (_2223)
    {
        float _2297 = _2247 * _2289;
        _2291 = _2297;
    }
    float _2299 = _2291;
    if (_2223)
    {
        float _2301 = fma(_2205, _2299, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        _2295 = _2301;
    }
    float _2303 = _2295;
    float _2305 = _2303;
    if (_2223)
    {
        float _2307 = fma(_2201, _2299, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _2237 = _2307;
    }
    float _2309 = _2237;
    float _2311 = -(*spvDescriptorSet0.vp_c15)._m0[630].x;
    float _2313 = _2303 + _2311;
    float _2315 = -(*spvDescriptorSet0.vp_c15)._m0[630].y;
    float _2317 = _2309 + _2315;
    float _2319 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float _2321 = fma(_2317, (*spvDescriptorSet0.vp_c15)._m0[630].z, 0.5);
    float2 _7285 = float2(_2319, _2321);
    float _2323 = dm_bs(spvDescriptorSet0.vp_t_tcb_28.sample(spvDescriptorSet0.vp_t_tcb_28Smplr, select(_7285, float2(0.0), isnan(_7285)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_28, spvDescriptorSet0.vp_t_tcb_28Smplr_w, select(_7285, float2(0.0), isnan(_7285)), level(0.0)).x;
    float _2325 = _2313;
    float _2327 = _2317;
    float _2329 = _2309;
    if (_2223)
    {
        float _2331 = _2259 * 6.283185482025146484375;
        float _2333 = cos(_2331);
        _2325 = _2333;
    }
    float _2335 = _2325;
    if (_2223)
    {
        float _2337 = _2335 + (-1.0);
        _2327 = _2337;
    }
    float _2339 = _2327;
    if (_2223)
    {
        float _2341 = _2339 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2239 = _2341;
    }
    float _2343 = _2239;
    if (_2223)
    {
        float _2345 = fma(_2275, _2335, _2343);
        _2277 = _2345;
    }
    float _2347 = _2277;
    float _2349 = -_951;
    float _2351 = _2349 + _2303;
    float _2353 = -_945;
    float _2355 = _2353 + _2309;
    float _2357 = fma(_2323, 100.0, _921);
    float _2359 = -_921;
    float _2361 = _2359 + _2347;
    float _2363 = fma(_2323, 100.0, _2347);
    float _2365 = -_1101;
    float _2367 = _2365 + _2357;
    float _2369 = _2361 * _2361;
    float _2371 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2373 = fma(_2351, _2351, _2369);
    float _2375 = _2367 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2377 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2371);
    float _2379 = fma(_1177, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2375);
    float _2381 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2377);
    float _2383 = fma(_1191, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2379);
    float _2385 = _2381 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2387 = fma(_2355, _2355, _2373);
    float _2389 = _2383 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2391 = 1.0 / _2385;
    float _2393 = _2389 + _2385;
    float _2395 = sqrt(_2387);
    float _2397 = _2393 * _2391;
    float _2399 = _2397 * 0.5;
    bool _2401 = _2395 > 0.0;
    float _2403 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2405 = fma(_2399, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2403);
    bool _2407 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _2409 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _2411 = _2407 || _2409;
    bool _2413 = isnan(0.5);
    bool _2415 = _2411 || _2413;
    float _2417 = 1.0 / _2405;
    bool _2419 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2421 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2423 = _2419 || _2421;
    bool _2425 = isnan(0.5);
    bool _2427 = _2423 || _2425;
    bool _2429 = !_2401;
    float _2431 = _2363;
    float _2433 = _2351;
    float _2435 = _2355;
    float _2437 = _2361;
    if (!_2429)
    {
        float _2439 = _207 * _207;
        float _2441 = rsqrt(_2387);
        float _2443 = fma(_205, _205, _2439);
        float _2445 = fma(_209, _209, _2443);
        float _2447 = sqrt(_2445);
        float _2449 = _2351 * _2441;
        float _2451 = _2361 * _2441;
        float _2453 = _2355 * _2441;
        bool _2455 = _2447 > 0.0;
        bool _2457 = !_2455;
        _2433 = _2449;
        _2435 = _2453;
        if (!_2457)
        {
            float _2459 = rsqrt(_2445);
            float _2461 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _2463 = _207 * _2459;
            float _2465 = _205 * _2459;
            float _2467 = _209 * _2459;
            float _2469 = _2451 * _2463;
            float _2471 = fma(_2449, _2465, _2469);
            float _2473 = _2461 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _2475 = fma(_2453, _2467, _2471);
            float _2477 = _2475 * _2473;
            float _2479 = fma(_205, _2477, _2303);
            float _2481 = fma(_207, _2477, _2363);
            float _2483 = fma(_209, _2477, _2309);
            _2305 = _2479;
            _2329 = _2483;
            _2431 = _2481;
            _2433 = _2471;
            _2435 = _2477;
            _2437 = _2465;
        }
    }
    float _2485 = _2305;
    float _2487 = _2329;
    float _2489 = _2431;
    float _2491 = _2433;
    float _2493 = _2435;
    float _2495 = _2437;
    float _2497 = -_1105;
    float _2499 = _2497 + _2485;
    float _2501 = -_1139;
    float _2503 = _2501 + _2487;
    float _2505 = -_1101;
    float _2507 = _2505 + _2489;
    float _2509 = _2495;
    float _2511 = _2499;
    float _2513 = _2507;
    float _2515 = _2493;
    if (_2427)
    {
        _2509 = 1.0;
    }
    float _2517 = _2509;
    float _2519 = _2517;
    if (_2415)
    {
        _1117 = _2499;
    }
    float _2521 = _1117;
    float _2523 = _2521;
    if (_2415)
    {
        _2511 = _2503;
    }
    float _2525 = _2511;
    float _2527 = _2525;
    if (!_2415)
    {
        float _2529 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _2531 = _2367 + _2529;
        float _2533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _2535 = -_945;
        float _2537 = _2535 + _2487;
        float _2539 = -_2357;
        float _2541 = _2539 + _2489;
        float _2543 = _2531 * _2531;
        float _2545 = -_951;
        float _2547 = _2545 + _2485;
        float _2549 = fma(_1187, _1187, _2543);
        float _2551 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _2553 = fma(_1201, _1201, _2549);
        float _2555 = 1.0 / _1279;
        float _2557 = sqrt(_2553);
        float _2559 = _2551 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _2561 = precise::min(_2557, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _2563 = _2561 * _2533;
        float _2565 = _2563 * _2555;
        float _2567 = _2559 * _2565;
        float _2569 = _2537 * _2565;
        float _2571 = fma(_2541, _2567, _2367);
        float _2573 = fma(_2547, _2567, _1177);
        float _2575 = fma(_2559, _2569, _1191);
        _2513 = _2571;
        _2523 = _2573;
        _2527 = _2575;
        _2515 = _2543;
        _213 = _2533;
        _1067 = _2569;
    }
    float _2577 = _2513;
    float _2579 = _2523;
    float _2581 = _2527;
    float _2583 = _2515;
    float _2585 = _213;
    float _2587 = _1067;
    float _2589 = _2587;
    float _2591 = _2585;
    if (_2427)
    {
        _2589 = 1.0;
    }
    float _2593 = _2589;
    float _2595 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _2597 = _2417 * _2595;
    float _2599 = _2593;
    if (!_2427)
    {
        float _2601 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2603 = _2601 * 0.15915493667125701904296875;
        float _2605 = _2603 * 6.283185482025146484375;
        float _2607 = cos(_2605);
        float _2609 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2611 = _2609 * 0.15915493667125701904296875;
        float _2613 = _2603 * 6.283185482025146484375;
        float _2615 = sin(_2613);
        float _2617 = 1.0 / _2607;
        float _2619 = _2611 * 6.283185482025146484375;
        float _2621 = cos(_2619);
        float _2623 = _2615 * _2617;
        float _2625 = _2611 * 6.283185482025146484375;
        float _2627 = sin(_2625);
        float _2629 = _2621 * _2623;
        float _2631 = 1.0 / _2629;
        float _2633 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2635 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _2633;
        float _2637 = 1.0 / _2635;
        float _2639 = _2627 * _2631;
        float _2641 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2643 = fma(_2597, _2639, _2641);
        float _2645 = _2643 * _2637;
        float _2647 = precise::clamp(_2645, 0.0, 1.0);
        _2519 = _2647;
    }
    float _2649 = _2519;
    if (!_2427)
    {
        float _2651 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2653 = _2651 * 0.15915493667125701904296875;
        float _2655 = _2653 * 6.283185482025146484375;
        float _2657 = cos(_2655);
        float _2659 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2661 = _2659 * 0.15915493667125701904296875;
        float _2663 = _2653 * 6.283185482025146484375;
        float _2665 = sin(_2663);
        float _2667 = 1.0 / _2657;
        float _2669 = _2661 * 6.283185482025146484375;
        float _2671 = cos(_2669);
        float _2673 = _2665 * _2667;
        float _2675 = _2661 * 6.283185482025146484375;
        float _2677 = sin(_2675);
        float _2679 = _2671 * _2673;
        float _2681 = 1.0 / _2679;
        float _2683 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2685 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2683;
        float _2687 = 1.0 / _2685;
        float _2689 = _2677 * _2681;
        float _2691 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2693 = fma(_2597, _2689, _2691);
        float _2695 = _2693 * _2687;
        float _2697 = precise::clamp(_2695, 0.0, 1.0);
        float _2699 = -_2697;
        float _2701 = _2699 + 1.0;
        _2599 = _2701;
    }
    float _2703 = _2599;
    float _2705 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2707 = _2577 + _2705;
    float _2709 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2711 = _2579 + _2709;
    float _2713 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2715 = _2581 + _2713;
    float _2717 = _2707 * _2707;
    float _2719 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2721 = fma(_2711, _2711, _2717);
    float _2723 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2725 = fma(_2715, _2715, _2721);
    float _2727 = rsqrt(_2725);
    float _2729 = sqrt(_2725);
    float _2731 = _2727 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2733 = _2711 * _2731;
    float _2735 = _2715 * _2731;
    float _2737 = _2733 * _2733;
    float _2739 = _2735 * _2735;
    float _2741 = _2737 + _2739;
    float _2743 = sqrt(_2741);
    bool _2745 = _2743 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2747 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2749 = _2743 + _2747;
    float _2751 = _2491;
    float _2753 = _2749;
    float _2755 = _2723;
    float _2757 = _2733;
    float _2759 = _2735;
    float _2761 = _2737;
    if (_2745)
    {
        float _2763 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2751 = _2763;
    }
    float _2765 = _2751;
    if (_2745)
    {
        float _2767 = _2749 * _2765;
        _2753 = _2767;
    }
    float _2769 = _2753;
    float _2771 = precise::max(0.0, _2723);
    float _2773 = _2771;
    if (_2745)
    {
        float _2775 = rsqrt(_2741);
        _2755 = _2775;
    }
    float _2777 = _2755;
    float _2779 = _2777;
    if (_2745)
    {
        float _2781 = _2769 * 0.15915493667125701904296875;
        _2591 = _2781;
    }
    float _2783 = _2591;
    float _2785 = -_2731;
    float _2787 = -_2771;
    float _2789 = fma(_2707, _2785, _2787);
    float _2791 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2745)
    {
        float _2793 = _2789 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2773 = _2793;
    }
    float _2795 = _2773;
    float _2797 = _2583;
    float _2799 = _2795;
    if (_2745)
    {
        float _2801 = _2783 * 6.283185482025146484375;
        float _2803 = sin(_2801);
        _2797 = _2803;
    }
    float _2805 = _2797;
    float _2807 = fma(_1177, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2809 = _2769;
    if (_2745)
    {
        float _2811 = _2783 * 6.283185482025146484375;
        float _2813 = cos(_2811);
        _2809 = _2813;
    }
    float _2815 = _2809;
    float _2817 = _2805;
    if (_2745)
    {
        float _2819 = fma(_2805, _2795, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2799 = _2819;
    }
    float _2821 = _2799;
    float _2823 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2825 = _2821;
    if (_2745)
    {
        float _2827 = _2777 * _2821;
        _2817 = _2827;
    }
    float _2829 = _2817;
    if (!_2745)
    {
        _2779 = _2789;
    }
    float _2831 = _2779;
    float _2833 = _2831;
    float _2835 = _2815;
    if (_2745)
    {
        float _2837 = _2815 + (-1.0);
        _2791 = _2837;
    }
    float _2839 = _2791;
    if (_2745)
    {
        float _2841 = _2733 * _2829;
        _2757 = _2841;
    }
    float _2843 = _2757;
    if (_2745)
    {
        float _2845 = _2735 * _2829;
        _2759 = _2845;
    }
    float _2847 = _2759;
    if (_2745)
    {
        float _2849 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2825 = _2849;
    }
    float _2851 = _2825;
    if (_2745)
    {
        float _2853 = _2843 * _2843;
        _2761 = _2853;
    }
    float _2855 = _2761;
    float _2857 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2745)
    {
        float _2859 = fma(_2789, _2815, _2851);
        _2833 = _2859;
    }
    float _2861 = _2833;
    if (!_2745)
    {
        _2835 = _2739;
    }
    float _2863 = _2835;
    float _2865 = _2863;
    if (_2745)
    {
        float _2867 = _2847 * _2847;
        _2865 = _2867;
    }
    float _2869 = _2865;
    float _2871 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2873 = fma(_2861, _2861, _2855);
    float _2875 = floor(_2807);
    float _2877 = _2873 + _2869;
    float _2879 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2857);
    float _2881 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2883 = fma(_2729, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2881);
    float _2885 = precise::clamp(_2883, 0.0, 1.0);
    float _2887 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2719);
    float _2889 = rsqrt(_2877);
    float _2891 = fma(_2581, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2879);
    float _2893 = -_2885;
    float _2895 = _2893 + 1.0;
    float _2897 = fma(_1191, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2899 = fma(_2581, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2887);
    float _2901 = _2891 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2903 = abs(_2895);
    float _2905 = log2(_2903);
    float _2907 = _2901 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2909 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2823);
    float _2911 = _2899 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2913 = -_2907;
    float _2915 = fma(_2913, _2871, 1.0);
    float _2917 = _2577 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2919 = fma(_2581, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2909);
    float _2921 = _2889 * _2843;
    float _2923 = _2889 * _2861;
    float _2925 = _2889 * _2847;
    float _2927 = fma(_2579, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2917);
    float _2929 = _2921 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2931 = _2919 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2933 = floor(_2897);
    float _2935 = fma(_2581, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2927);
    float _2937 = -_2929;
    float _2939 = fma(_2923, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2937);
    float _2941 = _2931 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2943 = _2905 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2945 = _2935 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2947 = -_2925;
    float _2949 = fma(_2947, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2939);
    float _2951 = _2931 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2953 = log2(_2915);
    float _2955 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2941);
    float _2957 = fma(_2949, -0.5, 0.5);
    float _2959 = _2931 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2961 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2955);
    float _2963 = exp2(_2943);
    float _2965 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2961);
    float _2967 = -_2875;
    float _2969 = _2807 + _2967;
    float _2971 = fma(_2949, 0.5, 0.5);
    float _2973 = -_2933;
    float _2975 = _2897 + _2973;
    float _2977 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2951);
    float _2979 = _2923 + 1.0;
    float _2981 = fma(_2971, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2983 = 1.0 / _2965;
    float _2985 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2959);
    float _2987 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2977);
    float _2989 = fma(_2971, _2981, -0.212114393711090087890625);
    float _2991 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2985);
    float _2993 = fma(_2971, _2989, 1.570728778839111328125);
    float _2995 = sqrt(_2957);
    float _2997 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2987);
    float _2999 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2991);
    float _3001 = -_2923;
    float _3003 = fma(_2963, _2979, _3001);
    float _3005 = _2953 * 0.693147182464599609375;
    float2 _8343 = float2(_2969, _2975);
    float _3007 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_8343, float2(0.0), isnan(_8343)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_8343, float2(0.0), isnan(_8343)), level(0.0)).x;
    float _3009 = fma(_3003, 0.5, 0.5);
    float _3011 = _2997 * _2983;
    float _3013 = _2999 * _2983;
    float _3015 = _3005 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _3017 = fma(_3011, 0.5, 0.5);
    float _3019 = fma(_3013, -0.5, 0.5);
    float _3021 = _2995 * 0.636619746685028076171875;
    float _3023 = -_2993;
    float _3025 = fma(_3021, _3023, 1.0);
    float3 _8376 = float3(_3017, _3019, _3015);
    float _3027 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_8376, float3(0.0), isnan(_8376)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_8376, float3(0.0), isnan(_8376)), level(0.0)).x;
    float3 _8387 = float3(_3017, _3019, _3015);
    float4 _3030 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_8387, float3(0.0), isnan(_8387)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_8387, float3(0.0), isnan(_8387)), level(0.0)).xyzw;
    float _3032 = _3030.x;
    float _3034 = _3030.y;
    float _3036 = _3030.z;
    float _3038 = _3030.w;
    float2 _8403 = float2(_3025, _3009);
    float3 _3042 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_8403, float2(0.0), isnan(_8403)), level(0.0)), spvDescriptorSet0.dm_border, 4u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_8403, float2(0.0), isnan(_8403)), level(0.0)).xyz;
    float _3044 = _3042.x;
    float _3046 = _3042.y;
    float _3048 = _3042.z;
    out.m_76.x = _1141;
    out.m_76.y = _1143;
    out.m_76.z = _1145;
    out.m_76.w = _1083;
    float _3050 = _203 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3052 = _193 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _3054 = -(*spvDescriptorSet0.vp_c9)._m0[167].z;
    float _3056 = (*spvDescriptorSet0.vp_c9)._m0[168].z + _3054;
    out.m_66.x = _409;
    out.m_66.y = _411;
    out.m_66.z = _393;
    out.m_66.w = _413;
    bool _3058 = _2729 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3060 = isnan(_2729);
    bool _3062 = _3058 || _3060;
    bool _3064 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3066 = _3062 || _3064;
    float _3068 = fma(_3056, _1621, (*spvDescriptorSet0.vp_c9)._m0[167].z);
    float _3070 = -(*spvDescriptorSet0.vp_c9)._m0[168].z;
    float _3072 = _3070 + (*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _3074 = _3068 * _1967;
    float _3076 = fma(_3072, _1695, (*spvDescriptorSet0.vp_c9)._m0[168].z);
    float _3078 = -(*spvDescriptorSet0.vp_c9)._m0[169].z;
    float _3080 = (*spvDescriptorSet0.vp_c9)._m0[170].z + _3078;
    float _3082 = fma(_1971, (*spvDescriptorSet0.vp_c9)._m0[167].z, _3074);
    float _3084 = -(*spvDescriptorSet0.vp_c9)._m0[170].z;
    float _3086 = _3084 + (*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _3088 = fma(_3080, _1761, (*spvDescriptorSet0.vp_c9)._m0[169].z);
    float _3090 = fma(_3076, _1975, _3082);
    float _3092 = fma(_3086, _1663, (*spvDescriptorSet0.vp_c9)._m0[170].z);
    float _3094 = -(*spvDescriptorSet0.vp_c9)._m0[171].z;
    float _3096 = (*spvDescriptorSet0.vp_c9)._m0[172].z + _3094;
    float _3098 = -(*spvDescriptorSet0.vp_c9)._m0[172].z;
    float _3100 = _3098 + (*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _3102 = fma(_3088, _1987, _3090);
    float _3104 = _1303 * _2191;
    float _3106 = fma(_3096, _1789, (*spvDescriptorSet0.vp_c9)._m0[171].z);
    float _3108 = fma(_3100, _1725, (*spvDescriptorSet0.vp_c9)._m0[172].z);
    float _3110 = fma(_3092, _1933, _3102);
    float _3112 = -_1265;
    float _3114 = fma(_3112, _2117, _3104);
    float _3116 = fma(_3106, _1955, _3110);
    float _3118 = _1303 * _2135;
    float _3120 = fma(_1313, _1547, _3114);
    float _3122 = _1285 * _2191;
    float _3124 = fma(_3108, _1893, _3116);
    float _3126 = _1303 * _2143;
    float _3128 = _1285 * _2143;
    float _3130 = _1331 * _2143;
    float _3132 = fma(_1301, _2117, _3122);
    float _3134 = -_1265;
    float _3136 = fma(_3134, _2107, _3126);
    float _3138 = fma(_1301, _2107, _3128);
    float _3140 = fma(_1317, _2107, _3130);
    float _3142 = fma(_1327, _1547, _3132);
    float _3144 = fma(_1313, _1545, _3136);
    float _3146 = fma(_1327, _1545, _3138);
    float _3148 = fma(_1287, _1545, _3140);
    float _3150 = _3050 * _3120;
    float _3152 = _3050 * _3144;
    float _3154 = _1285 * _2135;
    float _3156 = -_1265;
    float _3158 = fma(_3156, _2115, _3118);
    float _3160 = fma(_3052, _3142, _3150);
    float _3162 = fma(_3052, _3146, _3152);
    float _3164 = fma(_1301, _2115, _3154);
    float _3166 = _3148 + _3162;
    float _3168 = fma(_1313, _1549, _3158);
    float _3170 = abs(_2597);
    float _3172 = log2(_3170);
    float _3174 = fma(_1327, _1549, _3164);
    float _3176 = _1331 * _2191;
    float _3178 = _3050 * _3168;
    float _3180 = _1331 * _2135;
    float _3182 = -(*spvDescriptorSet0.vp_c9)._m0[173].z;
    float _3184 = (*spvDescriptorSet0.vp_c9)._m0[174].z + _3182;
    float _3186 = fma(_1317, _2117, _3176);
    float _3188 = fma(_3052, _3174, _3178);
    float _3190 = fma(_1317, _2115, _3180);
    float _3192 = in.m_68.x;
    bool _3194 = _2597 <= 8000.0;
    bool _3196 = isnan(_2597);
    bool _3198 = _3194 || _3196;
    bool _3200 = isnan(8000.0);
    bool _3202 = _3198 || _3200;
    float _3204 = float(_3202);
    float _3206 = fma(_1287, _1547, _3186);
    float _3208 = fma(_1287, _1549, _3190);
    float _3210 = _2965 * 0.5;
    float _3212 = fma(_3184, _1833, (*spvDescriptorSet0.vp_c9)._m0[173].z);
    float _3214 = _3206 + _3160;
    float _3216 = _3172 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _3218 = _3208 + _3188;
    float _3220 = fma(_3212, _1867, _3124);
    float _3222 = exp2(_3216);
    float _3224 = fma(_1659, (*spvDescriptorSet0.vp_c9)._m0[174].z, _3220);
    out.m_78.x = _3166;
    out.m_78.y = _3214;
    out.m_78.z = _3218;
    out.m_80.x = _3224;
    float _3226 = fma(_3222, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _3228 = precise::clamp(_3226, 0.0, 1.0);
    float _3230 = _2905 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _3232 = fma(_3228, -2.0, 3.0);
    float _3234 = _3228 * _3228;
    float _3236 = _2931 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _3238 = exp2(_3230);
    float _3240 = _3234 * _3232;
    float _3242 = fma(_2945, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3236);
    float _3244 = -_3240;
    float _3246 = _3244 + 1.0;
    float _3248 = fma(_2901, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3242);
    float _3250 = fma(_3246, (*spvDescriptorSet0.vp_c15)._m0[654].w, _3240);
    float _3252 = fma(_2999, -0.5, _3210);
    float _3254 = fma(_2911, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3248);
    float _3256 = _2997 + _2965;
    float _3258 = _3204 * _3250;
    float _3260 = -_3238;
    float _3262 = _3260 + 1.0;
    float _3264 = _3254 + _2965;
    float _3266 = _3258 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3268 = _3256 * 0.5;
    float _3270 = _3262 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _3272 = _3264 * 0.5;
    out.gl_Position.x = _2997;
    out.gl_Position.y = _2999;
    out.gl_Position.z = _3254;
    out.gl_Position.w = _2965;
    out.m_82.x = _3268;
    out.m_82.y = _3252;
    out.m_82.z = _3272;
    out.m_82.w = _2965;
    float _3274 = _2997;
    float _3276 = _2965;
    float _3278 = _3272;
    float _3280 = _3252;
    float _3282 = _3268;
    if (!_3066)
    {
        _3274 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3284 = _3274;
    float _3286 = _3284;
    float _3288 = _3284;
    if (!_3066)
    {
        _3276 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3290 = _3276;
    float _3292 = _3290;
    float _3294 = _3290;
    if (!_3066)
    {
        _3278 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3296 = _3278;
    float _3298 = _3296;
    float _3300 = _3296;
    if (!_3066)
    {
        _3280 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3302 = _3280;
    float _3304 = _3302;
    float _3306 = _3302;
    if (!_3066)
    {
        _3282 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3308 = _3282;
    float _3310 = -_3007;
    float _3312 = _3310 + 1.0;
    float _3314 = _3312 * _3266;
    float _3316 = precise::clamp(_3314, 0.0, 1.0);
    float _3318 = -_3316;
    float _3320 = fma(_3318, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3322 = _3320 * _3192;
    float _3324 = _3322 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _3326 = _3270 * _3027;
    float _3328 = -_3270;
    float _3330 = _3328 + 1.0;
    float _3332 = _3038 * _3326;
    float _3334 = _3048 * _3326;
    float _3336 = _3038 * _3330;
    out.m_84.x = _3324;
    float _3338 = fma(_3044, _3332, _3032);
    float _3340 = fma(_3046, _3332, _3034);
    float _3342 = fma(_3038, _3334, _3036);
    float _3344 = _2649 * _2703;
    out.m_86.x = _3338;
    out.m_86.y = _3340;
    out.m_86.z = _3342;
    out.m_86.w = _3336;
    float _3346 = _3344 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3348 = _3344;
    float _3350 = _3308;
    float _3352 = _3308;
    if (!_3066)
    {
        _3348 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3354 = _3348;
    bool _3356 = !_3066;
    float _3358 = _3354;
    float _3360 = _3354;
    if (!_3356)
    {
        bool _3362 = _2729 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3364 = isnan(_2729);
        bool _3366 = _3362 || _3364;
        bool _3368 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3370 = _3366 || _3368;
        if (!_3370)
        {
            float _3372 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3374 = _2729 + _3372;
            float _3376 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3378 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3376;
            float _3380 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3382 = _3380 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3384 = 1.0 / _3378;
            float _3386 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3388 = _3386 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3390 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3392 = _3390 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3394 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3396 = _3394 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3398 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3400 = _3398 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3402 = _3374 * _3384;
            float _3404 = precise::clamp(_3402, 0.0, 1.0);
            float _3406 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3408 = _3406 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3410 = fma(_3404, _3382, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3412 = fma(_3404, _3408, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3414 = fma(_3404, _3388, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3416 = fma(_3404, _3392, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3418 = fma(_3404, _3396, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3420 = fma(_3404, _3400, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3294 = _3414;
            _3352 = _3418;
            _3288 = _3410;
            _3306 = _3416;
            _3300 = _3412;
            _3360 = _3420;
            _3422 = true;
        }
        else
        {
            bool _3424 = _2729 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3426 = isnan(_2729);
            bool _3428 = _3424 || _3426;
            bool _3430 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3432 = _3428 || _3430;
            if (!_3432)
            {
                _3286 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3434 = _3286;
            _3288 = _3434;
            if (!_3432)
            {
                _3292 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3436 = _3292;
            _3294 = _3436;
            if (!_3432)
            {
                _3298 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3438 = _3298;
            _3300 = _3438;
            if (!_3432)
            {
                _3304 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3440 = _3304;
            _3306 = _3440;
            if (!_3432)
            {
                _3350 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3442 = _3350;
            _3352 = _3442;
            if (!_3432)
            {
                _3358 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3444 = _3358;
            bool _3446 = !_3432;
            _3360 = _3444;
            if (!_3446)
            {
                bool _3448 = _2729 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3450 = isnan(_2729);
                bool _3452 = _3448 || _3450;
                bool _3454 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3456 = _3452 || _3454;
                if (!_3456)
                {
                    float _3458 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3460 = _2729 + _3458;
                    float _3462 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3464 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3462;
                    float _3466 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3468 = _3466 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3470 = 1.0 / _3464;
                    float _3472 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3474 = _3472 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3476 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3478 = _3476 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3480 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3482 = _3480 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3484 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3486 = _3484 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3488 = _3460 * _3470;
                    float _3490 = precise::clamp(_3488, 0.0, 1.0);
                    float _3492 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3494 = _3492 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3496 = fma(_3490, _3468, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3498 = fma(_3490, _3494, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3500 = fma(_3490, _3474, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3502 = fma(_3490, _3478, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3504 = fma(_3490, _3482, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3506 = fma(_3490, _3486, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3294 = _3500;
                    _3352 = _3504;
                    _3288 = _3496;
                    _3306 = _3502;
                    _3300 = _3498;
                    _3360 = _3506;
                    _3422 = true;
                }
                else
                {
                    _3294 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3352 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3288 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3306 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3300 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3360 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3422 = false;
    float _3508 = _3294;
    float _3510 = _3352;
    float _3512 = _3288;
    float _3514 = _3306;
    float _3516 = _3300;
    float _3518 = _3360;
    float _3520 = fma(_3214, -0.5, 0.5);
    float _3522 = precise::clamp(_3520, 0.0, 1.0);
    float _3524 = -_3508;
    float _3526 = _3524 + _3510;
    float _3528 = _3346 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3530 = -_3512;
    float _3532 = _3530 + _3514;
    float _3534 = fma(_3522, _3526, _3508);
    out.m_88.x = 0.0;
    float _3536 = -_3516;
    float _3538 = _3536 + _3518;
    float _3540 = fma(_3522, _3532, _3512);
    float _3542 = _3534 * 0.586610972881317138671875;
    out.m_51.x = _3528;
    bool _3544 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3546 = fma(_3522, _3538, _3516);
    float _3548 = fma(_3540, 0.298911988735198974609375, _3542);
    bool _3550 = _2649 > 0.0;
    bool _3552 = isnan(_2649);
    bool _3554 = _3550 || _3552;
    bool _3556 = isnan(0.0);
    bool _3558 = _3554 || _3556;
    float _3560 = fma(_3546, 0.114477999508380889892578125, _3548);
    bool _3562 = _2703 <= 0.0;
    bool _3564 = !_3558;
    bool _3566 = _3562 || _3564;
    float _3568 = -_3560;
    float _3570 = _3540 + _3568;
    float _3572 = -_3560;
    float _3574 = _3534 + _3572;
    float _3576 = -_3560;
    float _3578 = _3546 + _3576;
    float _3580 = fma(_3570, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    float _3582 = fma(_3574, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    float _3584 = fma(_3578, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3560);
    bool _3586 = !_3544;
    if (!_3586)
    {
        float _3588 = -_2577;
        float _3590 = _3588 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3592 = -_2579;
        float _3594 = _3592 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3596 = -_2581;
        float _3598 = _3596 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3600 = _3590 * _3590;
        float _3602 = fma(_3594, _3594, _3600);
        float _3604 = fma(_3598, _3598, _3602);
        float _3606 = sqrt(_3604);
        float _3608 = rsqrt(_3604);
        float _3610 = -_3606;
        float _3612 = _3610 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3614 = _3612 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3616 = precise::clamp(_3614, 0.0, 1.0);
        float _3618 = _3594 * _3608;
        float _3620 = _3590 * _3608;
        float _3622 = abs(_3616);
        float _3624 = log2(_3622);
        float _3626 = _3598 * _3608;
        float _3628 = _3618 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3630 = _3214 * _3620;
        float _3632 = -_3620;
        float _3634 = -_3628;
        float _3636 = fma(_3632, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3634);
        float _3638 = fma(_3166, _3618, _3630);
        float _3640 = -_3626;
        float _3642 = fma(_3640, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3636);
        float _3644 = fma(_3218, _3626, _3638);
        float _3646 = precise::clamp(_3644, 0.0, 1.0);
        float _3648 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3650 = _3642 + _3648;
        float _3652 = _3624 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3654 = _3650 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3656 = precise::clamp(_3654, 0.0, 1.0);
        float _3658 = exp2(_3652);
        float _3660 = _3658 * _3656;
        float _3662 = _3646 * _3660;
        float _3664 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3666 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3668 = _3662 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_88.x = _3664;
        out.m_88.y = _3666;
        out.m_88.z = _3668;
    }
    out.m_90.x = _3580;
    out.m_90.y = _3582;
    out.m_90.z = _3584;
    if (!_3566)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _3670 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3670;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

