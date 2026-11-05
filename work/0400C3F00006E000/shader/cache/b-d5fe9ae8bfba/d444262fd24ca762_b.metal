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
    constant _16* vp_c15 [[id(3)]];
    constant _16* vp_c13 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_24 [[id(6)]];
    sampler vp_t_tcb_24Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_24Smplr_w [[id(14)]];
    sampler vp_t_tcb_32Smplr_w [[id(15)]];
    sampler vp_t_tcb_30Smplr_w [[id(16)]];
    sampler vp_t_tcb_1CSmplr_w [[id(17)]];
    constant dm_border_t* dm_border [[id(18)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_88 [[user(locn2)]];
    float4 m_51 [[user(locn4)]];
    float4 m_84 [[user(locn5)]];
    float4 m_53 [[user(locn6)]];
    float4 m_72 [[user(locn7)]];
    float4 m_60 [[user(locn8)]];
    float4 m_68 [[user(locn9)]];
    float4 m_76 [[user(locn10)]];
    float4 m_82 [[user(locn11)]];
    float4 m_86 [[user(locn12)]];
    float4 m_78 [[user(locn13)]];
    float4 m_80 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
    float4 dm_pad3 [[user(locn3)]];
};

struct main0_in
{
    float4 m_70 [[attribute(0)]];
    float4 m_58 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_48 [[attribute(4)]];
    float4 m_62 [[attribute(5)]];
    float4 m_64 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.dm_pad3 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2655 = false;
    bool _539 = false;
    bool _369 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = in.m_48.w;
    float _106 = trunc(_102);
    int _109 = int(_106);
    float _111 = -_104;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _113;
    bool _117 = _109 >= 1;
    float _119 = 0.0;
    float _121 = as_type<float>(_109);
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _119;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2965 = as_type<float>(_129);
        out.gl_Position.z = _2965;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _133 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_104);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = float(_109);
    bool _145 = _113 >= _143;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    if (_149)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _121;
    if (_149)
    {
        out.m_53.x = 0.0;
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
        float _3020 = as_type<float>(_155);
        out.gl_Position.z = _3020;
    }
    if (_149)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = 1.0 / _143;
    float _161 = in.m_58.x;
    float _163 = in.m_58.y;
    float _165 = in.m_58.z;
    float _167 = _113 * _159;
    int _169 = as_type<int>(_157) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_157) & 2;
    bool _175 = _173 != 0;
    float _177 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _179 = !_175;
    int _181 = _179 ? (-1090519040) : 1056964608;
    float _183 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _189 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    out.m_60.y = as_type<float>(_181);
    float _191 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _193 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _189);
    bool _197 = !_171;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _191);
    float _203 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    bool _205 = !_185;
    float _207 = _167;
    float _225;
    if (!_205)
    {
        float _209 = in.m_62.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        _225 = _167;
    }
    _227 = false;
    float _229 = _225;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _229 + _231;
    bool _235 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _237 = isnan(_229);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    bool _247 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _249 = isnan(_229);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -_245;
    float _269 = _267 + 1.0;
    float _271 = 1.0 / _261;
    bool _273 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _275 = isnan(_229);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = _257 * _269;
    float _287 = -_257;
    float _289 = _287 + 1.0;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _293 = _283 * _289;
    float _295 = 1.0 / _265;
    float _297 = -_283;
    float _299 = _297 + 1.0;
    float _301 = _233 * _271;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _229 + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _311;
    float _315 = fma(_309, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _317 = fma(_313, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _319 = _305 * _295;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _325 = _315 * _293;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _331 = _317 * _293;
    float _333 = fma(_323, _319, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _335 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].x, _325);
    float _337 = fma(_329, _319, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].y, _331);
    float _341 = fma(_333, _285, _335);
    float _343 = fma(_337, _285, _339);
    float _345 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[145].x, _341);
    float _347 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[145].y, _343);
    bool _349 = !_291;
    float _367;
    if (!_349)
    {
        float _351 = in.m_62.x;
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _355 = _351 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        _367 = _167;
    }
    _369 = false;
    float _371 = _367;
    float _373 = in.m_64.x;
    float _375 = in.m_64.y;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _379 = _371 + _377;
    bool _381 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _383 = isnan(_371);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    bool _393 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _395 = isnan(_371);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _413 = -_391;
    float _415 = _413 + 1.0;
    float _417 = 1.0 / _411;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _421 = 1.0 / _407;
    float _423 = _347 * _375;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _427 = _371 + _425;
    bool _429 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _431 = isnan(_371);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = _345 * _373;
    float _443 = _427 * _417;
    float _445 = _439 * _415;
    float _447 = -_439;
    float _449 = _447 + 1.0;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _451;
    float _455 = _379 * _421;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _461;
    float _465 = _403 * _449;
    float _467 = fma(_453, _455, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _469 = fma(_459, _455, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _471 = fma(_463, _455, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _473 = -_403;
    float _475 = _473 + 1.0;
    float _477 = _467 * _465;
    float _479 = _469 * _465;
    float _481 = _471 * _465;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _495 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].x, _477);
    float _497 = fma(_485, _443, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _499 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].y, _479);
    float _501 = fma(_489, _443, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _503 = fma(_493, _443, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _505 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].z, _481);
    float _507 = fma(_497, _445, _499);
    float _509 = fma(_501, _445, _495);
    float _511 = fma(_503, _445, _505);
    float _513 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[109].y, _507);
    float _515 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[109].x, _509);
    float _517 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[109].z, _511);
    bool _519 = !_419;
    float _537;
    if (!_519)
    {
        float _521 = in.m_62.x;
        float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _525 = _521 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _529 = _527 * _523;
        float _531 = floor(_529);
        float _533 = -_531;
        float _535 = _529 + _533;
        _537 = _535;
        _539 = true;
    }
    else
    {
        _537 = _167;
    }
    _539 = false;
    float _541 = _537;
    float _543 = _515 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _545 = _513 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _555 = 1.0 / _549;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _561;
    bool _565 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _567 = isnan(_541);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _581 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _583 = isnan(_541);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = _517 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _595 = 1.0 / _553;
    bool _597 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _599 = isnan(_541);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -_591;
    float _611 = _609 + 1.0;
    bool _613 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _615 = isnan(_541);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    bool _625 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _627 = 1.0 / _559;
    float _629 = _563 * _555;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _541 + _631;
    float _635 = fma(_629, _633, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _637 = -_575;
    float _639 = _637 + 1.0;
    float _641 = 1.0 / _579;
    float _643 = -_607;
    float _645 = _643 + 1.0;
    float _647 = _575 * _611;
    float _649 = _607 * _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _659 = _623 * _645;
    float _661 = -_623;
    float _663 = _661 + 1.0;
    float _665 = _653 * _595;
    float _667 = _657 * _627;
    float _669 = _635 * _659;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _673 = _541 + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _677 = _541 + _675;
    bool _679 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _681 = isnan(_541);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _695 = fma(_667, _673, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _697 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[115].x, _669);
    float _699 = fma(_665, _677, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _701 = _693 * _641;
    float _703 = -_689;
    float _705 = _703 + 1.0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _709 = _541 + _707;
    float _711 = fma(_695, _649, _697);
    float _713 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _591 * _705;
    float _717 = fma(_701, _709, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _719 = fma(_699, _647, _711);
    float _721 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _723 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _725 = fma(_717, _715, _719);
    float _727 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[119].x, _725);
    float _729 = _727 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _713;
    out.m_66.y = _721;
    out.m_66.z = _723;
    out.m_66.w = _729;
    bool _731 = !_625;
    if (!_731)
    {
        float _733 = in.m_62.x;
        float _735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _737 = _733 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[11].z, _113);
        float _741 = _739 * _735;
        float _743 = floor(_741);
        float _745 = -_743;
        float _747 = _741 + _745;
        _207 = _747;
    }
    float _749 = _207;
    float _751 = in.m_46.x;
    float _753 = in.m_46.y;
    float _755 = in.m_46.z;
    float _757 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_181));
    float _761 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _763 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _765 = _757 * _759;
    float _767 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _769 = _761 * _763;
    float _771 = _765 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _773 = _765 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _775 = _765 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _777 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[26].x, _771);
    float _779 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[24].x, _773);
    float _781 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[25].x, _775);
    float _783 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[26].z, _777);
    float _785 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[24].z, _779);
    float _787 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[25].z, _781);
    float _789 = _783 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _791 = _785 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _793 = _753 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _795 = _753 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _797 = _753 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _799 = _787 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _801 = fma(_751, (*spvDescriptorSet0.vp_c10)._m0[6].x, _793);
    float _803 = fma(_751, (*spvDescriptorSet0.vp_c10)._m0[4].x, _795);
    float _805 = fma(_751, (*spvDescriptorSet0.vp_c10)._m0[5].x, _797);
    float _807 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[6].z, _801);
    float _809 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[4].z, _803);
    float _811 = _807 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _813 = _809 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _815 = _811 + _789;
    float _817 = _813 + _791;
    float _819 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _821 = _815 + _819;
    float _823 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _825 = _817 + _823;
    float _827 = _821 * _821;
    float _829 = fma(_825, _825, _827);
    float _831 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[5].z, _805);
    float _833 = sqrt(_829);
    float _835 = _831 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _837 = _835 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _839 = _835 + _799;
    float _841 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[11].x, _837);
    float _843 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[11].z, _841);
    bool _845 = _833 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _849 = _847 != 0;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _853 = _851 != 0;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _857 = _855 != 0;
    bool _859 = !_853;
    int _861 = _859 ? 0 : 1;
    bool _863 = !_849;
    int _865 = _863 ? 0 : 1;
    bool _867 = !_857;
    int _869 = _867 ? 0 : 1;
    float _871 = _787;
    float _873 = _837;
    float _875 = _799;
    float _877 = _839;
    float _879 = _825;
    if (!_845)
    {
        _871 = _817;
    }
    float _881 = _871;
    float _883 = _881;
    if (!_845)
    {
        _873 = _815;
    }
    float _885 = _873;
    float _887 = _885;
    if (!_845)
    {
        _875 = _839;
    }
    float _889 = _875;
    bool _891 = !_845;
    float _893 = _889;
    if (!_891)
    {
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _897 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _899 = _833 + _897;
        float _901 = _839 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _903 = rsqrt(_829);
        float _905 = _899 * _895;
        float _907 = _905 * 0.15915493667125701904296875;
        float _909 = _907 * 6.283185482025146484375;
        float _911 = cos(_909);
        float _913 = _907 * 6.283185482025146484375;
        float _915 = sin(_913);
        float _917 = _911 + (-1.0);
        float _919 = fma(_915, _901, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _921 = _917 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _923 = _903 * _919;
        float _925 = fma(_839, _911, _921);
        float _927 = fma(_825, _923, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _929 = fma(_821, _923, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _893 = _925;
        _883 = _927;
        _887 = _929;
    }
    float _931 = _893;
    float _933 = _883;
    float _935 = _887;
    float _937 = -_835;
    float _939 = _937 + _931;
    float _941 = -_813;
    float _943 = _941 + _933;
    float _945 = _843 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _947 = _835 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _949 = _939 * _939;
    float _951 = -_811;
    float _953 = _951 + _935;
    float _955 = 1.0 / _945;
    float _957 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[10].x, _947);
    float _959 = fma(_943, _943, _949);
    float _961 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[10].z, _957);
    float _963 = fma(_953, _953, _959);
    bool _965 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _967 = isnan(0.5);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _973 = _969 || _971;
    float _975 = _961 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _977 = sqrt(_963);
    bool _979 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _981 = isnan(0.5);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _987 = _983 || _985;
    float _989 = _975 + _945;
    float _991 = _989 * _955;
    float _993 = _991 * 0.5;
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _997 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[30].w, _995);
    float _999 = 1.0 / _997;
    bool _1001 = _977 > 0.0;
    bool _1003 = !_1001;
    float _1005 = _933;
    float _1007 = _931;
    float _1009 = _935;
    float _1011 = _955;
    float _1013 = _943;
    if (!_1003)
    {
        float _1015 = _201 * _201;
        float _1017 = rsqrt(_963);
        float _1019 = fma(_195, _195, _1015);
        float _1021 = fma(_203, _203, _1019);
        float _1023 = sqrt(_1021);
        float _1025 = _943 * _1017;
        float _1027 = _939 * _1017;
        float _1029 = _953 * _1017;
        bool _1031 = _1023 > 0.0;
        bool _1033 = !_1031;
        _877 = _1029;
        if (!_1033)
        {
            float _1035 = rsqrt(_1021);
            float _1037 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1039 = _201 * _1035;
            float _1041 = _195 * _1035;
            float _1043 = _1027 * _1039;
            float _1045 = _203 * _1035;
            float _1047 = fma(_1025, _1041, _1043);
            float _1049 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1051 = fma(_1029, _1045, _1047);
            float _1053 = _1051 * _1049;
            float _1055 = fma(_195, _1053, _933);
            float _1057 = fma(_201, _1053, _931);
            float _1059 = fma(_203, _1053, _935);
            _1005 = _1055;
            _1007 = _1057;
            _1009 = _1059;
            _1011 = _1049;
        }
    }
    float _1061 = _1005;
    float _1063 = _1007;
    float _1065 = _1009;
    float _1067 = _877;
    float _1069 = _1011;
    float _1071 = _1069;
    float _1073 = _1067;
    float _1075 = _1061;
    if (_987)
    {
        _1071 = 1.0;
    }
    float _1077 = _1071;
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1081 = _999 * _1079;
    float _1083 = _1077;
    if (_973)
    {
        _1073 = _1061;
    }
    float _1085 = _1073;
    float _1087 = _1085;
    if (_973)
    {
        _1013 = _1063;
    }
    float _1089 = _1013;
    float _1091 = _1089;
    if (_973)
    {
        _879 = _1065;
    }
    float _1093 = _879;
    float _1095 = _1093;
    if (!_973)
    {
        float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1099 = _835 + _1097;
        float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1103 = _813 + _1101;
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1107 = -_835;
        float _1109 = _1107 + _1063;
        float _1111 = _1099 * _1099;
        float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1115 = _811 + _1113;
        float _1117 = -_813;
        float _1119 = _1117 + _1061;
        float _1121 = -_811;
        float _1123 = _1121 + _1065;
        float _1125 = fma(_1103, _1103, _1111);
        float _1127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1129 = fma(_1115, _1115, _1125);
        float _1131 = sqrt(_1129);
        float _1133 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1135 = precise::min(_1131, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1137 = _1135 * _1127;
        float _1139 = _1133 * _1137;
        float _1141 = fma(_1109, _1139, _835);
        float _1143 = fma(_1119, _1139, _813);
        float _1145 = fma(_1123, _1139, _811);
        _1091 = _1141;
        _1087 = _1143;
        _1095 = _1145;
        _1075 = _1119;
    }
    float _1147 = _1091;
    float _1149 = _1087;
    float _1151 = _1095;
    float _1153 = _1075;
    float _1155 = _1153;
    if (!_987)
    {
        float _1157 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1159 = _1157 * 0.15915493667125701904296875;
        float _1161 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1163 = _1159 * 6.283185482025146484375;
        float _1165 = cos(_1163);
        float _1167 = _1161 * 0.15915493667125701904296875;
        float _1169 = _1159 * 6.283185482025146484375;
        float _1171 = sin(_1169);
        float _1173 = 1.0 / _1165;
        float _1175 = _1167 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        float _1179 = _1171 * _1173;
        float _1181 = _1167 * 6.283185482025146484375;
        float _1183 = sin(_1181);
        float _1185 = _1177 * _1179;
        float _1187 = 1.0 / _1185;
        float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1191 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1189;
        float _1193 = 1.0 / _1191;
        float _1195 = _1183 * _1187;
        float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1199 = fma(_1081, _1195, _1197);
        float _1201 = _1199 * _1193;
        float _1203 = precise::clamp(_1201, 0.0, 1.0);
        _1155 = _1199;
        _1083 = _1203;
    }
    float _1205 = _1155;
    float _1207 = _1083;
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1211 = _1147 + _1209;
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1215 = _1149 + _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1219 = _1151 + _1217;
    float _1221 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1223 = _1211 * _1211;
    float _1225 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1221);
    float _1227 = fma(_1215, _1215, _1223);
    float _1229 = fma(_1219, _1219, _1227);
    float _1231 = rsqrt(_1229);
    float _1233 = sqrt(_1229);
    float _1235 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1237 = _1215 * _1235;
    float _1239 = _1219 * _1235;
    float _1241 = _1237 * _1237;
    float _1243 = _1239 * _1239;
    float _1245 = _1241 + _1243;
    float _1247 = sqrt(_1245);
    bool _1249 = _1247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1253 = _1247 + _1251;
    float _1255 = _1231;
    float _1257 = _1245;
    float _1259 = _1253;
    float _1261 = _1205;
    float _1263 = _1235;
    float _1265 = _1237;
    if (_1249)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1255 = _1267;
    }
    float _1269 = _1255;
    if (_1249)
    {
        float _1271 = rsqrt(_1245);
        _1257 = _1271;
    }
    float _1273 = _1257;
    float _1275 = _1273;
    if (_1249)
    {
        float _1277 = _1253 * _1269;
        _1259 = _1277;
    }
    float _1279 = _1259;
    if (_1249)
    {
        float _1281 = _1279 * 0.15915493667125701904296875;
        _1261 = _1281;
    }
    float _1283 = _1261;
    float _1285 = _1269;
    float _1287 = _1283;
    if (_1249)
    {
        float _1289 = _1283 * 6.283185482025146484375;
        float _1291 = sin(_1289);
        _1285 = _1291;
    }
    float _1293 = _1285;
    float _1295 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1297 = precise::max(0.0, _1295);
    float _1299 = _1219;
    float _1301 = _1297;
    if (_1249)
    {
        float _1303 = _1283 * 6.283185482025146484375;
        float _1305 = cos(_1303);
        _1299 = _1305;
    }
    float _1307 = _1299;
    float _1309 = -_1235;
    float _1311 = -_1297;
    float _1313 = fma(_1211, _1309, _1311);
    if (_1249)
    {
        float _1315 = _1313 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1301 = _1315;
    }
    float _1317 = _1301;
    float _1319 = _1317;
    if (!_1249)
    {
        _1287 = _1313;
    }
    float _1321 = _1287;
    float _1323 = fma(_813, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1325 = _1293;
    float _1327 = _1321;
    if (_1249)
    {
        float _1329 = fma(_1293, _1317, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1325 = _1329;
    }
    float _1331 = _1325;
    float _1333 = floor(_1323);
    float _1335 = _1331;
    float _1337 = _1307;
    if (_1249)
    {
        float _1339 = _1307 + (-1.0);
        _1319 = _1339;
    }
    float _1341 = _1319;
    float _1343 = _1341;
    if (_1249)
    {
        float _1345 = _1273 * _1331;
        _1263 = _1345;
    }
    float _1347 = _1263;
    if (!_1249)
    {
        _1275 = _1239;
    }
    float _1349 = _1275;
    float _1351 = _1349;
    if (_1249)
    {
        float _1353 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1353;
    }
    float _1355 = _1335;
    if (_1249)
    {
        float _1357 = _1237 * _1347;
        _1265 = _1357;
    }
    float _1359 = _1265;
    if (!_1249)
    {
        _1343 = _1241;
    }
    float _1361 = _1343;
    float _1363 = _1361;
    if (_1249)
    {
        float _1365 = _1239 * _1347;
        _1351 = _1365;
    }
    float _1367 = _1351;
    if (_1249)
    {
        float _1369 = fma(_1313, _1307, _1355);
        _1327 = _1369;
    }
    float _1371 = _1327;
    if (_1249)
    {
        float _1373 = _1359 * _1359;
        _1363 = _1373;
    }
    float _1375 = _1363;
    if (!_1249)
    {
        _1337 = _1243;
    }
    float _1377 = _1337;
    float _1379 = _1377;
    if (_1249)
    {
        float _1381 = _1367 * _1367;
        _1379 = _1381;
    }
    float _1383 = _1379;
    float _1385 = fma(_1371, _1371, _1375);
    float _1387 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1389 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1391 = _1385 + _1383;
    float _1393 = fma(_811, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1395 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1397 = rsqrt(_1391);
    float _1399 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1387);
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1403 = fma(_1233, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1401);
    float _1405 = precise::clamp(_1403, 0.0, 1.0);
    float _1407 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1395);
    float _1409 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1389);
    float _1411 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1399);
    float _1413 = -_1405;
    float _1415 = _1413 + 1.0;
    float _1417 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1407);
    float _1419 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1409);
    float _1421 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1423 = floor(_1393);
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1427 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1429 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1431 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1225);
    float _1433 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1435 = _1397 * _1359;
    float _1437 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1429);
    float _1439 = abs(_1415);
    float _1441 = log2(_1439);
    float _1443 = _1397 * _1371;
    float _1445 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1447 = _1397 * _1367;
    float _1449 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1451 = _1431 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1453 = -_1445;
    float _1455 = fma(_1443, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1453);
    float _1457 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1437);
    float _1459 = -_1449;
    float _1461 = fma(_1459, _1433, 1.0);
    float _1463 = -_1333;
    float _1465 = _1323 + _1463;
    float _1467 = -_1447;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1455);
    float _1471 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1457);
    float _1473 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1475 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1477 = fma(_1469, -0.5, 0.5);
    float _1479 = log2(_1461);
    float _1481 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1483 = fma(_1469, 0.5, 0.5);
    float _1485 = -_1423;
    float _1487 = _1393 + _1485;
    float _1489 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1473);
    float _1491 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1475);
    float _1493 = _1443 + 1.0;
    float _1495 = exp2(_1481);
    float _1497 = fma(_1483, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1499 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1489);
    float _1501 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1491);
    float _1503 = fma(_1483, _1497, -0.212114393711090087890625);
    float _1505 = 1.0 / _1471;
    float _1507 = _1479 * 0.693147182464599609375;
    float _1509 = fma(_1483, _1503, 1.570728778839111328125);
    float _1511 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1513 = sqrt(_1477);
    float _1515 = -_1443;
    float _1517 = fma(_1495, _1493, _1515);
    float _1519 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1521 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1501);
    float _1523 = _1519 * _1505;
    float _1525 = _1521 * _1505;
    float _1527 = fma(_1523, 0.5, 0.5);
    float _1529 = fma(_1525, -0.5, 0.5);
    float _1531 = _1513 * 0.636619746685028076171875;
    float _1533 = -_1509;
    float _1535 = fma(_1531, _1533, 1.0);
    float _1537 = fma(_1517, 0.5, 0.5);
    float2 _5258 = float2(_1465, _1487);
    float _1539 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5258, float2(0.0), isnan(_5258)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5258, float2(0.0), isnan(_5258)), level(0.0)).x;
    float3 _5269 = float3(_1527, _1529, _1511);
    float _1541 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5269, float3(0.0), isnan(_5269)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5269, float3(0.0), isnan(_5269)), level(0.0)).x;
    float3 _5280 = float3(_1527, _1529, _1511);
    float4 _1544 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5280, float3(0.0), isnan(_5280)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5280, float3(0.0), isnan(_5280)), level(0.0)).xyzw;
    float _1546 = _1544.x;
    float _1548 = _1544.y;
    float _1550 = _1544.z;
    float _1552 = _1544.w;
    float2 _5296 = float2(_1535, _1537);
    float3 _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5296, float2(0.0), isnan(_5296)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5296, float2(0.0), isnan(_5296)), level(0.0)).xyz;
    float _1558 = _1556.x;
    float _1560 = _1556.y;
    float _1562 = _1556.z;
    float _1564 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1566 = int(_1564);
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1570 = _1568 != 0;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1574 = _749 + _1572;
    int _1576 = abs(_865);
    float _1578 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1580 = int(_1578);
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1588 = float(_1566);
    float _1590 = 1.0 / _1588;
    float _1592 = float(uint(_1580));
    int _1594 = ~_1580;
    int _1596 = _1594 + 1;
    int _1598 = ~_1580;
    int _1600 = _1598 + 1;
    float _1602 = 1.0 / _1592;
    int _1604 = ~_1580;
    int _1606 = _1604 + 1;
    float _1608 = _113 * _1590;
    float _1610 = trunc(_1608);
    int _1612 = int(_1610);
    int _1614 = as_type<int>(_1602) + (-2);
    int _1616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1618 = _1616 != 0;
    float _1620 = float(uint(_1612));
    bool _1622 = !_1618;
    float _1624 = _1622 ? 7.345489978790283203125 : 1.0;
    float _1626 = as_type<float>(_1614) * _1620;
    float _1628 = in.m_62.x;
    float _1630 = in.m_62.y;
    float _1632 = in.m_62.z;
    float _1634 = in.m_62.w;
    float _1636 = trunc(_1626);
    float _1638 = precise::max(_1636, 0.0);
    uint _1641 = uint(_1638);
    int _1643 = _1596 * int(_1641);
    int _1645 = _1643 + _1612;
    float _1647 = _1624 * _1628;
    float _1649 = float(uint(_1645));
    float _1651 = fma(_1628, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1586);
    bool _1653 = _1634 > 0.5;
    int _1655 = _1580 + (-1);
    float _1657 = as_type<float>(_1614) * _1649;
    float _1659 = 0.0;
    float _1661 = _1471;
    if (!_1618)
    {
        _1659 = _1632;
    }
    float _1663 = _1659;
    float _1665 = 0.0;
    float _1667 = _1663;
    if (!_1618)
    {
        _1665 = _1632;
    }
    float _1669 = _1665;
    float _1671 = trunc(_1657);
    float _1673 = precise::max(_1671, 0.0);
    uint _1675 = uint(_1673);
    float _1677 = _1669;
    if (_1618)
    {
        _1667 = _1630;
    }
    float _1679 = _1667;
    if (_1618)
    {
        _1677 = _1630;
    }
    float _1681 = _1677;
    float _1683 = _1679 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1685 = float(_1612);
    int _1687 = int(_1641) + int(_1675);
    float _1689 = float(_1580);
    float _1691 = floor(_1647);
    int _1693 = _1600 * _1687;
    int _1695 = _1693 + _1612;
    bool _1697 = _1685 >= _1689;
    bool _1699 = isnan(_1685);
    bool _1701 = _1697 || _1699;
    bool _1703 = isnan(_1689);
    bool _1705 = _1701 || _1703;
    float _1707 = float(_1705);
    bool _1709 = uint(_1695) >= uint(_1580);
    float _1711 = trunc(_1707);
    int _1713 = int(_1711);
    bool _1715 = !_1709;
    int _1717 = _1715 ? 0 : (-1);
    bool _1719 = _1580 == 0;
    int _1721 = ~_1687;
    int _1723 = _1721 + _1717;
    int _1725 = _1723 + 1;
    float _1727 = -_1691;
    float _1729 = _1647 + _1727;
    float _1731 = _113 * _1689;
    int _1733 = _1580 * _1725;
    int _1735 = _1733 + _1612;
    float _1737 = _1729 * _1689;
    float _1739 = _1731 * _159;
    out.m_68.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    int _1741 = ~_1713;
    int _1743 = _1741 + 1;
    int _1745 = _1743 + 1;
    bool _1747 = !_1719;
    int _1749 = _1747 ? _1735 : (-1);
    float _1751 = trunc(_1737);
    int _1753 = int(_1751);
    int _1755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1757 = _1755 != 0;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1761 = _1759 != 0;
    int _1763 = _1749 * _1745;
    bool _1765 = !_1757;
    int _1767 = _1765 ? 0 : 1;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1771 = _1769 != 0;
    float _1773 = trunc(_1739);
    int _1775 = int(_1773);
    int _1777 = _1713 * _1655;
    int _1779 = _1777 + _1763;
    int _1781 = abs(_861);
    int _1783 = abs(_1767);
    bool _1785 = !_1570;
    int _1787 = _1785 ? 0 : 1;
    int _1789 = _1779 * _1781;
    float _1791 = -as_type<float>(_181);
    int _1793 = _1653 ? as_type<int>(_1791) : _181;
    int _1795 = _1753 * _1783;
    int _1797 = _1795 + _1612;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1801 = _1799 != 0;
    float _1803 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1807 = _1805 != 0;
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1811 = _1809 != 0;
    float _1813 = fma(_1803, -2.0, _1584);
    int _1815 = abs(_869);
    int _1817 = _1775 * _1576;
    int _1819 = _1817 + _1789;
    int _1821 = abs(_1787);
    float _1823 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1825 = _1797 * _1815;
    int _1827 = _1825 + _1819;
    float _1829 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1831 = -_1582;
    float _1833 = fma(_1823, 2.0, _1831);
    float _1835 = as_type<float>(_1735);
    if (!_1618)
    {
        _1835 = _1630;
    }
    float _1837 = _1835;
    int _1839 = _1753 * _1821;
    int _1841 = _1839 + _1827;
    float _1843 = as_type<float>(_181) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1845;
    float _1849 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1851 = _1849 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1853 = !_1761;
    float _1855 = _1853 ? as_type<float>(_181) : as_type<float>(_1793);
    float _1857 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1859 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1861 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1863 = _1628 > 0.5;
    float _1865 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1857);
    float _1867 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1859);
    float _1869 = float(uint(_1841));
    float _1871 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1861);
    float _1873 = -_199;
    int _1875 = _1863 ? as_type<int>(_1873) : as_type<int>(_199);
    float _1877 = 1.0 / _1847;
    bool _1879 = _1630 > 0.5;
    float _1881 = as_type<float>(_1614) * _1869;
    bool _1883 = !_1801;
    float _1885 = _1883 ? _199 : as_type<float>(_1875);
    float _1887 = _1855 + (-0.5);
    float _1889 = -as_type<float>(_181);
    int _1891 = _1879 ? as_type<int>(_1889) : _181;
    bool _1893 = _1632 > 0.5;
    float _1895 = trunc(_1881);
    float _1897 = precise::max(_1895, 0.0);
    uint _1899 = uint(_1897);
    bool _1901 = !_1807;
    float _1903 = _1901 ? as_type<float>(_181) : as_type<float>(_1891);
    float _1905 = _1837;
    if (_1618)
    {
        _1905 = _1628;
    }
    float _1907 = _1905;
    float _1909 = 1.0 / _1851;
    float _1911 = _1574 * _1877;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1915 = _749 + _1913;
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1917;
    float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1923 = _1921 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1925 = fma(_1919, _1911, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1927 = -_199;
    int _1929 = _1893 ? as_type<int>(_1927) : as_type<int>(_199);
    bool _1931 = !_1811;
    float _1933 = _1931 ? _199 : as_type<float>(_1929);
    int _1935 = ~_1580;
    int _1937 = _1935 + 1;
    float _1939 = _1915 * _1909;
    float _1941 = _1933 + 0.5;
    int _1943 = _1937 * int(_1899);
    int _1945 = _1943 + _1841;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1949 = float(uint(_1945));
    float _1951 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1947);
    float _1953 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1957;
    float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1963 = _1961 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1965 = as_type<float>(_1614) * _1949;
    float _1967 = fma(_1955, _1911, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1969 = fma(_1959, _1911, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1971 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1973 = isnan(_749);
    bool _1975 = _1971 || _1973;
    bool _1977 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1979 = _1975 || _1977;
    float _1981 = float(_1979);
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1985 = _1983 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1987 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1989 = isnan(_749);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1995 = _1991 || _1993;
    float _1997 = float(_1995);
    float _1999 = trunc(_1965);
    float _2001 = precise::max(_1999, 0.0);
    uint _2003 = uint(_2001);
    float _2005 = fma(_1923, _1939, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2007 = -_1981;
    float _2009 = _2007 + 1.0;
    float _2011 = fma(_1963, _1939, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2013 = fma(_1985, _1939, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2015 = _1997 * _2009;
    bool _2017 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2019 = isnan(_749);
    bool _2021 = _2017 || _2019;
    bool _2023 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2025 = _2021 || _2023;
    float _2027 = float(_2025);
    float _2029 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2031 = -_1997;
    float _2033 = _2031 + 1.0;
    float _2035 = fma(_1681, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2029);
    float _2037 = -_113;
    float _2039 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1833);
    float _2041 = _1885 + 0.5;
    float _2043 = _2027 * _2033;
    int _2045 = int(_1899) + int(_2003);
    float _2047 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2035);
    float _2049 = fma(_2041, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2039);
    float _2051 = float(uint(_1797));
    float _2053 = _1925 * _2043;
    int _2055 = _1606 * _2045;
    int _2057 = _2055 + _1841;
    float _2059 = _1967 * _2043;
    float _2061 = as_type<float>(_1614) * _2051;
    float _2063 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1813);
    float _2065 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2067 = uint(_2057) >= uint(_1580);
    float _2069 = _1903 + (-0.5);
    float _2071 = _1969 * _2043;
    float _2073 = trunc(_2061);
    float _2075 = precise::max(_2073, 0.0);
    uint _2077 = uint(_2075);
    bool _2079 = !_2067;
    int _2081 = _2079 ? 0 : (-1);
    float _2083 = fma(_1907, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2065);
    float _2085 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2087 = -_2069;
    float _2089 = -_2063;
    float _2091 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2089);
    int _2093 = ~_2045;
    int _2095 = _2093 + _2081;
    int _2097 = _2095 + 1;
    float _2099 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2083);
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2103 = ~_1580;
    int _2105 = _2103 + 1;
    int _2107 = _1580 * _2097;
    int _2109 = _2107 + _1841;
    float _2111 = -_2027;
    float _2113 = _2111 + 1.0;
    float _2115 = fma(_1683, -2.0, _2101);
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2119 = abs(_1081);
    float _2121 = log2(_2119);
    bool _2123 = !_1719;
    int _2125 = _2123 ? _2109 : (-1);
    int _2127 = _2105 * int(_2077);
    int _2129 = _2127 + _1797;
    float _2131 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2071);
    float _2133 = -_2117;
    float _2135 = fma(_2085, 2.0, _2133);
    int _2137 = _2125 >> 31;
    float _2139 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2053);
    float _2141 = float(uint(_2129));
    float _2143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2145 = _2137 & 3;
    float _2147 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2059);
    float _2149 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1651);
    float _2151 = as_type<float>(_1614) * _2141;
    int _2153 = _2125 + _2145;
    float _2155 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1951);
    float _2157 = -_113;
    float _2159 = fma(_2157, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2135);
    float _2161 = trunc(_2151);
    float _2163 = precise::max(_2161, 0.0);
    uint _2165 = uint(_2163);
    int _2167 = _2153 >> 2;
    float _2169 = fma(_2005, _2015, _2139);
    float _2171 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2115);
    float _2173 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2175 = _2167 << 4;
    int _2177 = _2175 + 368;
    float _2179 = fma(_2011, _2015, _2147);
    int _2181 = _2125 & 3;
    bool _2183 = _2181 != 0;
    float _2185 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2189 = uint(int(uint(_2177) >> uint(2)));
    uint _2191 = uint(int(uint(int(_2189)) >> uint(2)));
    int _2193 = int(_2189) & 3;
    float _2195 = (*spvDescriptorSet0.vp_c9)._m0[int(_2191)][_2193];
    int _2197 = int(_2189) + 1;
    uint _2199 = uint(int(uint(_2197) >> uint(2)));
    int _2201 = _2197 & 3;
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[int(_2199)][_2201];
    float _2205 = fma(_2013, _2015, _2131);
    bool _2207 = uint(_2181) > 1u;
    float _2209 = fma(_1981, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2179);
    int _2211 = _2125 & 3;
    bool _2213 = _2211 != 0;
    float _2215 = -_2149;
    float _2217 = _2215 + 1.0;
    bool _2219 = _2181 != 3;
    float _2221 = exp2(_2173);
    int _2223 = _2177 + 8;
    uint _2225 = uint(int(uint(_2223) >> uint(2)));
    uint _2227 = uint(int(uint(int(_2225)) >> uint(2)));
    int _2229 = int(_2225) & 3;
    float _2231 = (*spvDescriptorSet0.vp_c9)._m0[int(_2227)][_2229];
    int _2233 = int(_2225) + 1;
    uint _2235 = uint(int(uint(_2233) >> uint(2)));
    int _2237 = _2233 & 3;
    float _2239 = (*spvDescriptorSet0.vp_c9)._m0[int(_2235)][_2237];
    int _2241 = ~_1580;
    int _2243 = _2241 + 1;
    float _2245 = fma(_1981, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2169);
    int _2247 = int(_2077) + int(_2165);
    float _2249 = fma(_1981, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2205);
    int _2251 = _2213 ? 0 : 1;
    float _2253 = fma(_2185, _1941, _2159);
    bool _2255 = uint(_2181) >= 2u;
    float _2257 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2259 = _2243 * _2247;
    int _2261 = _2259 + _1797;
    int _2263 = ~_2251;
    int _2265 = _2263 + 1;
    int _2267 = _2265 + 1;
    float _2269 = -_2155;
    float _2271 = _2269 + 1.0;
    int _2273 = _2255 ? 0 : 1;
    float _2275 = -_2257;
    float _2277 = -_2171;
    float _2279 = fma(_2275, _1887, _2277);
    int _2281 = _2267;
    if (!_2207)
    {
        int _2283 = ~_2251;
        int _2285 = _2283 + 1;
        _2281 = _2285;
    }
    int _2287 = _2281;
    float _2289 = -_2099;
    float _2291 = _2289 + 1.0;
    bool _2293 = uint(_2261) >= uint(_1580);
    float _2295 = -_2047;
    float _2297 = _2295 + 1.0;
    int _2299 = ~_2273;
    int _2301 = _2299 + 1;
    int _2303 = _2301 + 1;
    float _2305 = -_1539;
    float _2307 = _2305 + 1.0;
    int _2309 = _2303;
    float _2311 = _1550;
    if (_2219)
    {
        int _2313 = ~_2273;
        int _2315 = _2313 + 1;
        _2309 = _2315;
    }
    int _2317 = _2309;
    float _2319 = fma(_1903, _2271, _2091);
    bool _2321 = !_2183;
    int _2323 = _2321 ? 0 : 1;
    float _2325 = -_2291;
    float _2327 = fma(_1933, _2325, _2253);
    bool _2329 = _2181 != 3;
    float _2331 = fma(_1855, _2297, _2279);
    int _2333 = abs(_2287);
    bool _2335 = !_2293;
    int _2337 = _2335 ? 0 : (-1);
    int _2339 = abs(_2317);
    int _2341 = ~_2333;
    int _2343 = _2341 + 1;
    int _2345 = _2343 + 1;
    int _2347 = ~_2247;
    int _2349 = _2347 + _2337;
    int _2351 = _2349 + 1;
    int _2353 = abs(_2323);
    int _2355 = _1580 * _2351;
    int _2357 = _2355 + _1797;
    int _2359 = _2345 * as_type<int>(_2203);
    int _2361 = ~_2339;
    int _2363 = _2361 + 1;
    int _2365 = _2363 + 1;
    float _2367 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2369 = !_2329;
    int _2371 = _2369 ? 0 : (-1);
    float _2373 = fma(_2221, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2375 = precise::clamp(_2373, 0.0, 1.0);
    float _2377 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2367);
    int _2379 = abs(_2371);
    int _2381 = ~_2353;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    float _2387 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2377);
    float _2389 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2391 = fma(_2375, -2.0, 3.0);
    int _2393 = _2385 * as_type<int>(_2195);
    int _2395 = _2393 + _2359;
    float _2397 = _2375 * _2375;
    int _2399 = ~_2379;
    int _2401 = _2399 + 1;
    int _2403 = _2401 + 1;
    float _2405 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2387);
    int _2407 = _2365 * as_type<int>(_2231);
    int _2409 = _2407 + _2395;
    bool _2411 = !_1771;
    int _2413 = _2411 ? 0 : 1;
    float _2415 = exp2(_2389);
    float _2417 = _2397 * _2391;
    int _2419 = _2403 * as_type<int>(_2239);
    int _2421 = _2419 + _2409;
    int _2423 = abs(_2413);
    float _2425 = -_2217;
    float _2427 = fma(_1885, _2425, _2049);
    float _2429 = -_2417;
    float _2431 = _2429 + 1.0;
    float _2433 = in.m_70.x;
    int _2435 = ~_2423;
    int _2437 = _2435 + 1;
    int _2439 = _2437 + 1;
    bool _2441 = _1081 <= 8000.0;
    bool _2443 = isnan(_1081);
    bool _2445 = _2441 || _2443;
    bool _2447 = isnan(8000.0);
    bool _2449 = _2445 || _2447;
    float _2451 = float(_2449);
    float _2453 = fma(_2431, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2417);
    bool _2455 = !_1719;
    int _2457 = _2455 ? _2357 : (-1);
    int _2459 = _2421 * _2439;
    float _2461 = _2245 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2463 = _2451 * _2453;
    float _2465 = -_2415;
    float _2467 = _2465 + 1.0;
    int _2469 = _2457 * _2423;
    int _2471 = _2469 + _2459;
    float _2473 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2475 = _2209 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2477 = _2249 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2479 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2481 = _2307 * _2473;
    float _2483 = precise::clamp(_2481, 0.0, 1.0);
    float _2485 = _2461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2487 = _2475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2489 = _2477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2491 = _2479 * _1541;
    float _2493 = -_2483;
    float _2495 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_72.x = _2427;
    out.m_72.y = _2319;
    out.m_72.z = _2327;
    out.m_72.w = _2331;
    float _2497 = float(_2471);
    float _2499 = _1471 * 0.5;
    float _2501 = _2495 * _2433;
    out.m_74.x = _2485;
    out.m_74.y = _2487;
    out.m_74.z = _2489;
    bool _2503 = _1233 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2505 = isnan(_1233);
    bool _2507 = _2503 || _2505;
    bool _2509 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2511 = _2507 || _2509;
    float _2513 = _2501 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _1519;
    out.gl_Position.y = _1521;
    out.gl_Position.z = _2405;
    out.gl_Position.w = _1471;
    out.m_76.x = _2497;
    float _2515 = _1519 + _1471;
    float _2517 = _2405 + _1471;
    float _2519 = _1552 * _2491;
    float _2521 = _1562 * _2491;
    float _2523 = fma(_1521, -0.5, _2499);
    out.m_78.x = _2513;
    float _2525 = fma(_1558, _2519, _1546);
    float _2527 = fma(_1560, _2519, _1548);
    float _2529 = -_2479;
    float _2531 = _2529 + 1.0;
    float _2533 = fma(_1552, _2521, _1550);
    float _2535 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2537 = _1871 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2539 = _1552 * _2531;
    float _2541 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2543 = _2517 * 0.5;
    float _2545 = _2515 * 0.5;
    out.m_80.x = _2525;
    out.m_80.y = _2527;
    out.m_80.z = _2533;
    out.m_80.w = _2539;
    float _2547 = _1207 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2549 = _1471;
    float _2551 = _2543;
    float _2553 = _2523;
    float _2555 = _2545;
    if (!_2511)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2557 = _2311;
    out.m_82.x = _2541;
    out.m_82.y = _2535;
    out.m_82.z = _2537;
    float _2559 = _2557;
    float _2561 = _2557;
    if (!_2511)
    {
        _1661 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2563 = _1661;
    out.m_84.x = _2545;
    out.m_84.y = _2523;
    out.m_84.z = _2543;
    out.m_84.w = _1471;
    float _2565 = _2563;
    float _2567 = _2563;
    if (!_2511)
    {
        _2549 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2569 = _2549;
    float _2571 = _2569;
    float _2573 = _2569;
    if (!_2511)
    {
        _2551 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2575 = _2551;
    float _2577 = _2575;
    float _2579 = _2575;
    if (!_2511)
    {
        _2553 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2581 = _2553;
    float _2583 = _2581;
    float _2585 = _2581;
    if (!_2511)
    {
        _2555 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2587 = _2555;
    bool _2589 = !_2511;
    float _2591 = _2587;
    float _2593 = _2587;
    if (!_2589)
    {
        bool _2595 = _1233 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2597 = isnan(_1233);
        bool _2599 = _2595 || _2597;
        bool _2601 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2603 = _2599 || _2601;
        if (!_2603)
        {
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2607 = _1233 + _2605;
            float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2611 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2609;
            float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2617 = 1.0 / _2611;
            float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2635 = _2607 * _2617;
            float _2637 = precise::clamp(_2635, 0.0, 1.0);
            float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2643 = fma(_2637, _2615, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2645 = fma(_2637, _2641, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2647 = fma(_2637, _2621, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2649 = fma(_2637, _2625, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2651 = fma(_2637, _2629, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2653 = fma(_2637, _2633, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2573 = _2645;
            _2593 = _2651;
            _2561 = _2643;
            _2585 = _2649;
            _2579 = _2647;
            _2567 = _2653;
            _2655 = true;
        }
        else
        {
            bool _2657 = _1233 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2659 = isnan(_1233);
            bool _2661 = _2657 || _2659;
            bool _2663 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2665 = _2661 || _2663;
            if (!_2665)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2667 = _2559;
            _2561 = _2667;
            if (!_2665)
            {
                _2571 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2669 = _2571;
            _2573 = _2669;
            if (!_2665)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2671 = _2577;
            _2579 = _2671;
            if (!_2665)
            {
                _2583 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2673 = _2583;
            _2585 = _2673;
            if (!_2665)
            {
                _2591 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2675 = _2591;
            _2593 = _2675;
            if (!_2665)
            {
                _2565 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2677 = _2565;
            bool _2679 = !_2665;
            _2567 = _2677;
            if (!_2679)
            {
                bool _2681 = _1233 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2683 = isnan(_1233);
                bool _2685 = _2681 || _2683;
                bool _2687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2689 = _2685 || _2687;
                if (!_2689)
                {
                    float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2693 = _1233 + _2691;
                    float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2697 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2695;
                    float _2699 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2703 = 1.0 / _2697;
                    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2713 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2715 = _2713 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2721 = _2693 * _2703;
                    float _2723 = precise::clamp(_2721, 0.0, 1.0);
                    float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2729 = fma(_2723, _2701, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2731 = fma(_2723, _2727, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2733 = fma(_2723, _2707, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2735 = fma(_2723, _2711, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2737 = fma(_2723, _2715, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2739 = fma(_2723, _2719, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2573 = _2731;
                    _2593 = _2737;
                    _2561 = _2729;
                    _2585 = _2735;
                    _2579 = _2733;
                    _2567 = _2739;
                    _2655 = true;
                }
                else
                {
                    _2573 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2593 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2585 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2567 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2655 = false;
    float _2741 = _2573;
    float _2743 = _2593;
    float _2745 = _2561;
    float _2747 = _2585;
    float _2749 = _2579;
    float _2751 = _2567;
    float _2753 = fma(_2535, -0.5, 0.5);
    float _2755 = precise::clamp(_2753, 0.0, 1.0);
    float _2757 = -_2741;
    float _2759 = _2757 + _2743;
    float _2761 = _2547 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2763 = -_2745;
    float _2765 = _2763 + _2747;
    out.m_86.x = 0.0;
    float _2767 = fma(_2755, _2759, _2741);
    float _2769 = fma(_2755, _2765, _2745);
    out.m_53.x = _2761;
    float _2771 = -_2749;
    float _2773 = _2771 + _2751;
    float _2775 = _2767 * 0.586610972881317138671875;
    bool _2777 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2779 = fma(_2755, _2773, _2749);
    float _2781 = fma(_2769, 0.298911988735198974609375, _2775);
    bool _2783 = _1207 > 0.0;
    bool _2785 = isnan(_1207);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan(0.0);
    bool _2791 = _2787 || _2789;
    float _2793 = fma(_2779, 0.114477999508380889892578125, _2781);
    float _2795 = -_2793;
    float _2797 = _2769 + _2795;
    float _2799 = -_2793;
    float _2801 = _2767 + _2799;
    float _2803 = -_2793;
    float _2805 = _2779 + _2803;
    float _2807 = fma(_2797, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2793);
    float _2809 = fma(_2801, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2793);
    float _2811 = fma(_2805, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2793);
    bool _2813 = !_2777;
    if (!_2813)
    {
        float _2815 = -_1147;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2819 = -_1149;
        float _2821 = _2819 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2823 = -_1151;
        float _2825 = _2823 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2827 = _2817 * _2817;
        float _2829 = fma(_2821, _2821, _2827);
        float _2831 = fma(_2825, _2825, _2829);
        float _2833 = sqrt(_2831);
        float _2835 = rsqrt(_2831);
        float _2837 = -_2833;
        float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2841 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2843 = precise::clamp(_2841, 0.0, 1.0);
        float _2845 = _2821 * _2835;
        float _2847 = _2817 * _2835;
        float _2849 = abs(_2843);
        float _2851 = log2(_2849);
        float _2853 = _2825 * _2835;
        float _2855 = _2845 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2857 = _2535 * _2847;
        float _2859 = -_2847;
        float _2861 = -_2855;
        float _2863 = fma(_2859, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2861);
        float _2865 = fma(_2541, _2845, _2857);
        float _2867 = -_2853;
        float _2869 = fma(_2867, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2863);
        float _2871 = fma(_2537, _2853, _2865);
        float _2873 = precise::clamp(_2871, 0.0, 1.0);
        float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2877 = _2869 + _2875;
        float _2879 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2881 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2883 = precise::clamp(_2881, 0.0, 1.0);
        float _2885 = exp2(_2879);
        float _2887 = _2885 * _2883;
        float _2889 = _2873 * _2887;
        float _2891 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2893 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2895 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2891;
        out.m_86.y = _2893;
        out.m_86.z = _2895;
    }
    out.m_88.x = _2807;
    out.m_88.y = _2809;
    out.m_88.z = _2811;
    if (_2791)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _2897 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2897;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.dm_pad3 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2655 = false;
    bool _539 = false;
    bool _369 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = in.m_48.w;
    float _106 = trunc(_102);
    int _109 = int(_106);
    float _111 = -_104;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _113;
    bool _117 = _109 >= 1;
    float _119 = 0.0;
    float _121 = as_type<float>(_109);
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _119;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2965 = as_type<float>(_129);
        out.gl_Position.z = _2965;
    }
    if (!_117)
    {
        return out;
    }
    bool _133 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_104);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = float(_109);
    bool _145 = _113 >= _143;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    if (_149)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _121;
    if (_149)
    {
        out.m_53.x = 0.0;
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
        float _3020 = as_type<float>(_155);
        out.gl_Position.z = _3020;
    }
    if (_149)
    {
        return out;
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = 1.0 / _143;
    float _161 = in.m_58.x;
    float _163 = in.m_58.y;
    float _165 = in.m_58.z;
    float _167 = _113 * _159;
    int _169 = as_type<int>(_157) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_157) & 2;
    bool _175 = _173 != 0;
    float _177 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _179 = !_175;
    int _181 = _179 ? (-1090519040) : 1056964608;
    float _183 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _189 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    out.m_60.y = as_type<float>(_181);
    float _191 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _193 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _189);
    bool _197 = !_171;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _191);
    float _203 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    bool _205 = !_185;
    float _207 = _167;
    float _225;
    if (!_205)
    {
        float _209 = in.m_62.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        _225 = _167;
    }
    _227 = false;
    float _229 = _225;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _229 + _231;
    bool _235 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _237 = isnan(_229);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    bool _247 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _249 = isnan(_229);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -_245;
    float _269 = _267 + 1.0;
    float _271 = 1.0 / _261;
    bool _273 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _275 = isnan(_229);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = _257 * _269;
    float _287 = -_257;
    float _289 = _287 + 1.0;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _293 = _283 * _289;
    float _295 = 1.0 / _265;
    float _297 = -_283;
    float _299 = _297 + 1.0;
    float _301 = _233 * _271;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _229 + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _311;
    float _315 = fma(_309, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _317 = fma(_313, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _319 = _305 * _295;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _325 = _315 * _293;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _331 = _317 * _293;
    float _333 = fma(_323, _319, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _335 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].x, _325);
    float _337 = fma(_329, _319, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].y, _331);
    float _341 = fma(_333, _285, _335);
    float _343 = fma(_337, _285, _339);
    float _345 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[145].x, _341);
    float _347 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[145].y, _343);
    bool _349 = !_291;
    float _367;
    if (!_349)
    {
        float _351 = in.m_62.x;
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _355 = _351 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        _367 = _167;
    }
    _369 = false;
    float _371 = _367;
    float _373 = in.m_64.x;
    float _375 = in.m_64.y;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _379 = _371 + _377;
    bool _381 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _383 = isnan(_371);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    bool _393 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _395 = isnan(_371);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _413 = -_391;
    float _415 = _413 + 1.0;
    float _417 = 1.0 / _411;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _421 = 1.0 / _407;
    float _423 = _347 * _375;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _427 = _371 + _425;
    bool _429 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _431 = isnan(_371);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = _345 * _373;
    float _443 = _427 * _417;
    float _445 = _439 * _415;
    float _447 = -_439;
    float _449 = _447 + 1.0;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _451;
    float _455 = _379 * _421;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _461;
    float _465 = _403 * _449;
    float _467 = fma(_453, _455, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _469 = fma(_459, _455, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _471 = fma(_463, _455, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _473 = -_403;
    float _475 = _473 + 1.0;
    float _477 = _467 * _465;
    float _479 = _469 * _465;
    float _481 = _471 * _465;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _495 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].x, _477);
    float _497 = fma(_485, _443, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _499 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].y, _479);
    float _501 = fma(_489, _443, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _503 = fma(_493, _443, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _505 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].z, _481);
    float _507 = fma(_497, _445, _499);
    float _509 = fma(_501, _445, _495);
    float _511 = fma(_503, _445, _505);
    float _513 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[109].y, _507);
    float _515 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[109].x, _509);
    float _517 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[109].z, _511);
    bool _519 = !_419;
    float _537;
    if (!_519)
    {
        float _521 = in.m_62.x;
        float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _525 = _521 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _529 = _527 * _523;
        float _531 = floor(_529);
        float _533 = -_531;
        float _535 = _529 + _533;
        _537 = _535;
        _539 = true;
    }
    else
    {
        _537 = _167;
    }
    _539 = false;
    float _541 = _537;
    float _543 = _515 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _545 = _513 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _555 = 1.0 / _549;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _561;
    bool _565 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _567 = isnan(_541);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _581 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _583 = isnan(_541);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = _517 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _595 = 1.0 / _553;
    bool _597 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _599 = isnan(_541);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -_591;
    float _611 = _609 + 1.0;
    bool _613 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _615 = isnan(_541);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    bool _625 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _627 = 1.0 / _559;
    float _629 = _563 * _555;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _541 + _631;
    float _635 = fma(_629, _633, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _637 = -_575;
    float _639 = _637 + 1.0;
    float _641 = 1.0 / _579;
    float _643 = -_607;
    float _645 = _643 + 1.0;
    float _647 = _575 * _611;
    float _649 = _607 * _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _659 = _623 * _645;
    float _661 = -_623;
    float _663 = _661 + 1.0;
    float _665 = _653 * _595;
    float _667 = _657 * _627;
    float _669 = _635 * _659;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _673 = _541 + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _677 = _541 + _675;
    bool _679 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _681 = isnan(_541);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _695 = fma(_667, _673, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _697 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[115].x, _669);
    float _699 = fma(_665, _677, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _701 = _693 * _641;
    float _703 = -_689;
    float _705 = _703 + 1.0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _709 = _541 + _707;
    float _711 = fma(_695, _649, _697);
    float _713 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _591 * _705;
    float _717 = fma(_701, _709, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _719 = fma(_699, _647, _711);
    float _721 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _723 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _725 = fma(_717, _715, _719);
    float _727 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[119].x, _725);
    float _729 = _727 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _713;
    out.m_66.y = _721;
    out.m_66.z = _723;
    out.m_66.w = _729;
    bool _731 = !_625;
    if (!_731)
    {
        float _733 = in.m_62.x;
        float _735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _737 = _733 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[11].z, _113);
        float _741 = _739 * _735;
        float _743 = floor(_741);
        float _745 = -_743;
        float _747 = _741 + _745;
        _207 = _747;
    }
    float _749 = _207;
    float _751 = in.m_46.x;
    float _753 = in.m_46.y;
    float _755 = in.m_46.z;
    float _757 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_181));
    float _761 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _763 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _765 = _757 * _759;
    float _767 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _769 = _761 * _763;
    float _771 = _765 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _773 = _765 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _775 = _765 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _777 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[26].x, _771);
    float _779 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[24].x, _773);
    float _781 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[25].x, _775);
    float _783 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[26].z, _777);
    float _785 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[24].z, _779);
    float _787 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[25].z, _781);
    float _789 = _783 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _791 = _785 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _793 = _753 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _795 = _753 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _797 = _753 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _799 = _787 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _801 = fma(_751, (*spvDescriptorSet0.vp_c10)._m0[6].x, _793);
    float _803 = fma(_751, (*spvDescriptorSet0.vp_c10)._m0[4].x, _795);
    float _805 = fma(_751, (*spvDescriptorSet0.vp_c10)._m0[5].x, _797);
    float _807 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[6].z, _801);
    float _809 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[4].z, _803);
    float _811 = _807 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _813 = _809 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _815 = _811 + _789;
    float _817 = _813 + _791;
    float _819 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _821 = _815 + _819;
    float _823 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _825 = _817 + _823;
    float _827 = _821 * _821;
    float _829 = fma(_825, _825, _827);
    float _831 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[5].z, _805);
    float _833 = sqrt(_829);
    float _835 = _831 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _837 = _835 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _839 = _835 + _799;
    float _841 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[11].x, _837);
    float _843 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[11].z, _841);
    bool _845 = _833 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _849 = _847 != 0;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _853 = _851 != 0;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _857 = _855 != 0;
    bool _859 = !_853;
    int _861 = _859 ? 0 : 1;
    bool _863 = !_849;
    int _865 = _863 ? 0 : 1;
    bool _867 = !_857;
    int _869 = _867 ? 0 : 1;
    float _871 = _787;
    float _873 = _837;
    float _875 = _799;
    float _877 = _839;
    float _879 = _825;
    if (!_845)
    {
        _871 = _817;
    }
    float _881 = _871;
    float _883 = _881;
    if (!_845)
    {
        _873 = _815;
    }
    float _885 = _873;
    float _887 = _885;
    if (!_845)
    {
        _875 = _839;
    }
    float _889 = _875;
    bool _891 = !_845;
    float _893 = _889;
    if (!_891)
    {
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _897 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _899 = _833 + _897;
        float _901 = _839 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _903 = rsqrt(_829);
        float _905 = _899 * _895;
        float _907 = _905 * 0.15915493667125701904296875;
        float _909 = _907 * 6.283185482025146484375;
        float _911 = cos(_909);
        float _913 = _907 * 6.283185482025146484375;
        float _915 = sin(_913);
        float _917 = _911 + (-1.0);
        float _919 = fma(_915, _901, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _921 = _917 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _923 = _903 * _919;
        float _925 = fma(_839, _911, _921);
        float _927 = fma(_825, _923, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _929 = fma(_821, _923, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _893 = _925;
        _883 = _927;
        _887 = _929;
    }
    float _931 = _893;
    float _933 = _883;
    float _935 = _887;
    float _937 = -_835;
    float _939 = _937 + _931;
    float _941 = -_813;
    float _943 = _941 + _933;
    float _945 = _843 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _947 = _835 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _949 = _939 * _939;
    float _951 = -_811;
    float _953 = _951 + _935;
    float _955 = 1.0 / _945;
    float _957 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[10].x, _947);
    float _959 = fma(_943, _943, _949);
    float _961 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[10].z, _957);
    float _963 = fma(_953, _953, _959);
    bool _965 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _967 = isnan(0.5);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _973 = _969 || _971;
    float _975 = _961 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _977 = sqrt(_963);
    bool _979 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _981 = isnan(0.5);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _987 = _983 || _985;
    float _989 = _975 + _945;
    float _991 = _989 * _955;
    float _993 = _991 * 0.5;
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _997 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[30].w, _995);
    float _999 = 1.0 / _997;
    bool _1001 = _977 > 0.0;
    bool _1003 = !_1001;
    float _1005 = _933;
    float _1007 = _931;
    float _1009 = _935;
    float _1011 = _955;
    float _1013 = _943;
    if (!_1003)
    {
        float _1015 = _201 * _201;
        float _1017 = rsqrt(_963);
        float _1019 = fma(_195, _195, _1015);
        float _1021 = fma(_203, _203, _1019);
        float _1023 = sqrt(_1021);
        float _1025 = _943 * _1017;
        float _1027 = _939 * _1017;
        float _1029 = _953 * _1017;
        bool _1031 = _1023 > 0.0;
        bool _1033 = !_1031;
        _877 = _1029;
        if (!_1033)
        {
            float _1035 = rsqrt(_1021);
            float _1037 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1039 = _201 * _1035;
            float _1041 = _195 * _1035;
            float _1043 = _1027 * _1039;
            float _1045 = _203 * _1035;
            float _1047 = fma(_1025, _1041, _1043);
            float _1049 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1051 = fma(_1029, _1045, _1047);
            float _1053 = _1051 * _1049;
            float _1055 = fma(_195, _1053, _933);
            float _1057 = fma(_201, _1053, _931);
            float _1059 = fma(_203, _1053, _935);
            _1005 = _1055;
            _1007 = _1057;
            _1009 = _1059;
            _1011 = _1049;
        }
    }
    float _1061 = _1005;
    float _1063 = _1007;
    float _1065 = _1009;
    float _1067 = _877;
    float _1069 = _1011;
    float _1071 = _1069;
    float _1073 = _1067;
    float _1075 = _1061;
    if (_987)
    {
        _1071 = 1.0;
    }
    float _1077 = _1071;
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1081 = _999 * _1079;
    float _1083 = _1077;
    if (_973)
    {
        _1073 = _1061;
    }
    float _1085 = _1073;
    float _1087 = _1085;
    if (_973)
    {
        _1013 = _1063;
    }
    float _1089 = _1013;
    float _1091 = _1089;
    if (_973)
    {
        _879 = _1065;
    }
    float _1093 = _879;
    float _1095 = _1093;
    if (!_973)
    {
        float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1099 = _835 + _1097;
        float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1103 = _813 + _1101;
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1107 = -_835;
        float _1109 = _1107 + _1063;
        float _1111 = _1099 * _1099;
        float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1115 = _811 + _1113;
        float _1117 = -_813;
        float _1119 = _1117 + _1061;
        float _1121 = -_811;
        float _1123 = _1121 + _1065;
        float _1125 = fma(_1103, _1103, _1111);
        float _1127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1129 = fma(_1115, _1115, _1125);
        float _1131 = sqrt(_1129);
        float _1133 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1135 = precise::min(_1131, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1137 = _1135 * _1127;
        float _1139 = _1133 * _1137;
        float _1141 = fma(_1109, _1139, _835);
        float _1143 = fma(_1119, _1139, _813);
        float _1145 = fma(_1123, _1139, _811);
        _1091 = _1141;
        _1087 = _1143;
        _1095 = _1145;
        _1075 = _1119;
    }
    float _1147 = _1091;
    float _1149 = _1087;
    float _1151 = _1095;
    float _1153 = _1075;
    float _1155 = _1153;
    if (!_987)
    {
        float _1157 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1159 = _1157 * 0.15915493667125701904296875;
        float _1161 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1163 = _1159 * 6.283185482025146484375;
        float _1165 = cos(_1163);
        float _1167 = _1161 * 0.15915493667125701904296875;
        float _1169 = _1159 * 6.283185482025146484375;
        float _1171 = sin(_1169);
        float _1173 = 1.0 / _1165;
        float _1175 = _1167 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        float _1179 = _1171 * _1173;
        float _1181 = _1167 * 6.283185482025146484375;
        float _1183 = sin(_1181);
        float _1185 = _1177 * _1179;
        float _1187 = 1.0 / _1185;
        float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1191 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1189;
        float _1193 = 1.0 / _1191;
        float _1195 = _1183 * _1187;
        float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1199 = fma(_1081, _1195, _1197);
        float _1201 = _1199 * _1193;
        float _1203 = precise::clamp(_1201, 0.0, 1.0);
        _1155 = _1199;
        _1083 = _1203;
    }
    float _1205 = _1155;
    float _1207 = _1083;
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1211 = _1147 + _1209;
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1215 = _1149 + _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1219 = _1151 + _1217;
    float _1221 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1223 = _1211 * _1211;
    float _1225 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1221);
    float _1227 = fma(_1215, _1215, _1223);
    float _1229 = fma(_1219, _1219, _1227);
    float _1231 = rsqrt(_1229);
    float _1233 = sqrt(_1229);
    float _1235 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1237 = _1215 * _1235;
    float _1239 = _1219 * _1235;
    float _1241 = _1237 * _1237;
    float _1243 = _1239 * _1239;
    float _1245 = _1241 + _1243;
    float _1247 = sqrt(_1245);
    bool _1249 = _1247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1253 = _1247 + _1251;
    float _1255 = _1231;
    float _1257 = _1245;
    float _1259 = _1253;
    float _1261 = _1205;
    float _1263 = _1235;
    float _1265 = _1237;
    if (_1249)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1255 = _1267;
    }
    float _1269 = _1255;
    if (_1249)
    {
        float _1271 = rsqrt(_1245);
        _1257 = _1271;
    }
    float _1273 = _1257;
    float _1275 = _1273;
    if (_1249)
    {
        float _1277 = _1253 * _1269;
        _1259 = _1277;
    }
    float _1279 = _1259;
    if (_1249)
    {
        float _1281 = _1279 * 0.15915493667125701904296875;
        _1261 = _1281;
    }
    float _1283 = _1261;
    float _1285 = _1269;
    float _1287 = _1283;
    if (_1249)
    {
        float _1289 = _1283 * 6.283185482025146484375;
        float _1291 = sin(_1289);
        _1285 = _1291;
    }
    float _1293 = _1285;
    float _1295 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1297 = precise::max(0.0, _1295);
    float _1299 = _1219;
    float _1301 = _1297;
    if (_1249)
    {
        float _1303 = _1283 * 6.283185482025146484375;
        float _1305 = cos(_1303);
        _1299 = _1305;
    }
    float _1307 = _1299;
    float _1309 = -_1235;
    float _1311 = -_1297;
    float _1313 = fma(_1211, _1309, _1311);
    if (_1249)
    {
        float _1315 = _1313 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1301 = _1315;
    }
    float _1317 = _1301;
    float _1319 = _1317;
    if (!_1249)
    {
        _1287 = _1313;
    }
    float _1321 = _1287;
    float _1323 = fma(_813, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1325 = _1293;
    float _1327 = _1321;
    if (_1249)
    {
        float _1329 = fma(_1293, _1317, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1325 = _1329;
    }
    float _1331 = _1325;
    float _1333 = floor(_1323);
    float _1335 = _1331;
    float _1337 = _1307;
    if (_1249)
    {
        float _1339 = _1307 + (-1.0);
        _1319 = _1339;
    }
    float _1341 = _1319;
    float _1343 = _1341;
    if (_1249)
    {
        float _1345 = _1273 * _1331;
        _1263 = _1345;
    }
    float _1347 = _1263;
    if (!_1249)
    {
        _1275 = _1239;
    }
    float _1349 = _1275;
    float _1351 = _1349;
    if (_1249)
    {
        float _1353 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1353;
    }
    float _1355 = _1335;
    if (_1249)
    {
        float _1357 = _1237 * _1347;
        _1265 = _1357;
    }
    float _1359 = _1265;
    if (!_1249)
    {
        _1343 = _1241;
    }
    float _1361 = _1343;
    float _1363 = _1361;
    if (_1249)
    {
        float _1365 = _1239 * _1347;
        _1351 = _1365;
    }
    float _1367 = _1351;
    if (_1249)
    {
        float _1369 = fma(_1313, _1307, _1355);
        _1327 = _1369;
    }
    float _1371 = _1327;
    if (_1249)
    {
        float _1373 = _1359 * _1359;
        _1363 = _1373;
    }
    float _1375 = _1363;
    if (!_1249)
    {
        _1337 = _1243;
    }
    float _1377 = _1337;
    float _1379 = _1377;
    if (_1249)
    {
        float _1381 = _1367 * _1367;
        _1379 = _1381;
    }
    float _1383 = _1379;
    float _1385 = fma(_1371, _1371, _1375);
    float _1387 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1389 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1391 = _1385 + _1383;
    float _1393 = fma(_811, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1395 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1397 = rsqrt(_1391);
    float _1399 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1387);
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1403 = fma(_1233, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1401);
    float _1405 = precise::clamp(_1403, 0.0, 1.0);
    float _1407 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1395);
    float _1409 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1389);
    float _1411 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1399);
    float _1413 = -_1405;
    float _1415 = _1413 + 1.0;
    float _1417 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1407);
    float _1419 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1409);
    float _1421 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1423 = floor(_1393);
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1427 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1429 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1431 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1225);
    float _1433 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1435 = _1397 * _1359;
    float _1437 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1429);
    float _1439 = abs(_1415);
    float _1441 = log2(_1439);
    float _1443 = _1397 * _1371;
    float _1445 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1447 = _1397 * _1367;
    float _1449 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1451 = _1431 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1453 = -_1445;
    float _1455 = fma(_1443, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1453);
    float _1457 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1437);
    float _1459 = -_1449;
    float _1461 = fma(_1459, _1433, 1.0);
    float _1463 = -_1333;
    float _1465 = _1323 + _1463;
    float _1467 = -_1447;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1455);
    float _1471 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1457);
    float _1473 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1475 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1477 = fma(_1469, -0.5, 0.5);
    float _1479 = log2(_1461);
    float _1481 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1483 = fma(_1469, 0.5, 0.5);
    float _1485 = -_1423;
    float _1487 = _1393 + _1485;
    float _1489 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1473);
    float _1491 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1475);
    float _1493 = _1443 + 1.0;
    float _1495 = exp2(_1481);
    float _1497 = fma(_1483, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1499 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1489);
    float _1501 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1491);
    float _1503 = fma(_1483, _1497, -0.212114393711090087890625);
    float _1505 = 1.0 / _1471;
    float _1507 = _1479 * 0.693147182464599609375;
    float _1509 = fma(_1483, _1503, 1.570728778839111328125);
    float _1511 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1513 = sqrt(_1477);
    float _1515 = -_1443;
    float _1517 = fma(_1495, _1493, _1515);
    float _1519 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1521 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1501);
    float _1523 = _1519 * _1505;
    float _1525 = _1521 * _1505;
    float _1527 = fma(_1523, 0.5, 0.5);
    float _1529 = fma(_1525, -0.5, 0.5);
    float _1531 = _1513 * 0.636619746685028076171875;
    float _1533 = -_1509;
    float _1535 = fma(_1531, _1533, 1.0);
    float _1537 = fma(_1517, 0.5, 0.5);
    float2 _5258 = float2(_1465, _1487);
    float _1539 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5258, float2(0.0), isnan(_5258)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5258, float2(0.0), isnan(_5258)), level(0.0)).x;
    float3 _5269 = float3(_1527, _1529, _1511);
    float _1541 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5269, float3(0.0), isnan(_5269)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5269, float3(0.0), isnan(_5269)), level(0.0)).x;
    float3 _5280 = float3(_1527, _1529, _1511);
    float4 _1544 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5280, float3(0.0), isnan(_5280)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5280, float3(0.0), isnan(_5280)), level(0.0)).xyzw;
    float _1546 = _1544.x;
    float _1548 = _1544.y;
    float _1550 = _1544.z;
    float _1552 = _1544.w;
    float2 _5296 = float2(_1535, _1537);
    float3 _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5296, float2(0.0), isnan(_5296)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5296, float2(0.0), isnan(_5296)), level(0.0)).xyz;
    float _1558 = _1556.x;
    float _1560 = _1556.y;
    float _1562 = _1556.z;
    float _1564 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1566 = int(_1564);
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1570 = _1568 != 0;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1574 = _749 + _1572;
    int _1576 = abs(_865);
    float _1578 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1580 = int(_1578);
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1588 = float(_1566);
    float _1590 = 1.0 / _1588;
    float _1592 = float(uint(_1580));
    int _1594 = ~_1580;
    int _1596 = _1594 + 1;
    int _1598 = ~_1580;
    int _1600 = _1598 + 1;
    float _1602 = 1.0 / _1592;
    int _1604 = ~_1580;
    int _1606 = _1604 + 1;
    float _1608 = _113 * _1590;
    float _1610 = trunc(_1608);
    int _1612 = int(_1610);
    int _1614 = as_type<int>(_1602) + (-2);
    int _1616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1618 = _1616 != 0;
    float _1620 = float(uint(_1612));
    bool _1622 = !_1618;
    float _1624 = _1622 ? 7.345489978790283203125 : 1.0;
    float _1626 = as_type<float>(_1614) * _1620;
    float _1628 = in.m_62.x;
    float _1630 = in.m_62.y;
    float _1632 = in.m_62.z;
    float _1634 = in.m_62.w;
    float _1636 = trunc(_1626);
    float _1638 = precise::max(_1636, 0.0);
    uint _1641 = uint(_1638);
    int _1643 = _1596 * int(_1641);
    int _1645 = _1643 + _1612;
    float _1647 = _1624 * _1628;
    float _1649 = float(uint(_1645));
    float _1651 = fma(_1628, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1586);
    bool _1653 = _1634 > 0.5;
    int _1655 = _1580 + (-1);
    float _1657 = as_type<float>(_1614) * _1649;
    float _1659 = 0.0;
    float _1661 = _1471;
    if (!_1618)
    {
        _1659 = _1632;
    }
    float _1663 = _1659;
    float _1665 = 0.0;
    float _1667 = _1663;
    if (!_1618)
    {
        _1665 = _1632;
    }
    float _1669 = _1665;
    float _1671 = trunc(_1657);
    float _1673 = precise::max(_1671, 0.0);
    uint _1675 = uint(_1673);
    float _1677 = _1669;
    if (_1618)
    {
        _1667 = _1630;
    }
    float _1679 = _1667;
    if (_1618)
    {
        _1677 = _1630;
    }
    float _1681 = _1677;
    float _1683 = _1679 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1685 = float(_1612);
    int _1687 = int(_1641) + int(_1675);
    float _1689 = float(_1580);
    float _1691 = floor(_1647);
    int _1693 = _1600 * _1687;
    int _1695 = _1693 + _1612;
    bool _1697 = _1685 >= _1689;
    bool _1699 = isnan(_1685);
    bool _1701 = _1697 || _1699;
    bool _1703 = isnan(_1689);
    bool _1705 = _1701 || _1703;
    float _1707 = float(_1705);
    bool _1709 = uint(_1695) >= uint(_1580);
    float _1711 = trunc(_1707);
    int _1713 = int(_1711);
    bool _1715 = !_1709;
    int _1717 = _1715 ? 0 : (-1);
    bool _1719 = _1580 == 0;
    int _1721 = ~_1687;
    int _1723 = _1721 + _1717;
    int _1725 = _1723 + 1;
    float _1727 = -_1691;
    float _1729 = _1647 + _1727;
    float _1731 = _113 * _1689;
    int _1733 = _1580 * _1725;
    int _1735 = _1733 + _1612;
    float _1737 = _1729 * _1689;
    float _1739 = _1731 * _159;
    out.m_68.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    int _1741 = ~_1713;
    int _1743 = _1741 + 1;
    int _1745 = _1743 + 1;
    bool _1747 = !_1719;
    int _1749 = _1747 ? _1735 : (-1);
    float _1751 = trunc(_1737);
    int _1753 = int(_1751);
    int _1755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1757 = _1755 != 0;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1761 = _1759 != 0;
    int _1763 = _1749 * _1745;
    bool _1765 = !_1757;
    int _1767 = _1765 ? 0 : 1;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1771 = _1769 != 0;
    float _1773 = trunc(_1739);
    int _1775 = int(_1773);
    int _1777 = _1713 * _1655;
    int _1779 = _1777 + _1763;
    int _1781 = abs(_861);
    int _1783 = abs(_1767);
    bool _1785 = !_1570;
    int _1787 = _1785 ? 0 : 1;
    int _1789 = _1779 * _1781;
    float _1791 = -as_type<float>(_181);
    int _1793 = _1653 ? as_type<int>(_1791) : _181;
    int _1795 = _1753 * _1783;
    int _1797 = _1795 + _1612;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1801 = _1799 != 0;
    float _1803 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1807 = _1805 != 0;
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1811 = _1809 != 0;
    float _1813 = fma(_1803, -2.0, _1584);
    int _1815 = abs(_869);
    int _1817 = _1775 * _1576;
    int _1819 = _1817 + _1789;
    int _1821 = abs(_1787);
    float _1823 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1825 = _1797 * _1815;
    int _1827 = _1825 + _1819;
    float _1829 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1831 = -_1582;
    float _1833 = fma(_1823, 2.0, _1831);
    float _1835 = as_type<float>(_1735);
    if (!_1618)
    {
        _1835 = _1630;
    }
    float _1837 = _1835;
    int _1839 = _1753 * _1821;
    int _1841 = _1839 + _1827;
    float _1843 = as_type<float>(_181) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1845;
    float _1849 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1851 = _1849 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1853 = !_1761;
    float _1855 = _1853 ? as_type<float>(_181) : as_type<float>(_1793);
    float _1857 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1859 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1861 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1863 = _1628 > 0.5;
    float _1865 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1857);
    float _1867 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1859);
    float _1869 = float(uint(_1841));
    float _1871 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1861);
    float _1873 = -_199;
    int _1875 = _1863 ? as_type<int>(_1873) : as_type<int>(_199);
    float _1877 = 1.0 / _1847;
    bool _1879 = _1630 > 0.5;
    float _1881 = as_type<float>(_1614) * _1869;
    bool _1883 = !_1801;
    float _1885 = _1883 ? _199 : as_type<float>(_1875);
    float _1887 = _1855 + (-0.5);
    float _1889 = -as_type<float>(_181);
    int _1891 = _1879 ? as_type<int>(_1889) : _181;
    bool _1893 = _1632 > 0.5;
    float _1895 = trunc(_1881);
    float _1897 = precise::max(_1895, 0.0);
    uint _1899 = uint(_1897);
    bool _1901 = !_1807;
    float _1903 = _1901 ? as_type<float>(_181) : as_type<float>(_1891);
    float _1905 = _1837;
    if (_1618)
    {
        _1905 = _1628;
    }
    float _1907 = _1905;
    float _1909 = 1.0 / _1851;
    float _1911 = _1574 * _1877;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1915 = _749 + _1913;
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1917;
    float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1923 = _1921 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1925 = fma(_1919, _1911, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1927 = -_199;
    int _1929 = _1893 ? as_type<int>(_1927) : as_type<int>(_199);
    bool _1931 = !_1811;
    float _1933 = _1931 ? _199 : as_type<float>(_1929);
    int _1935 = ~_1580;
    int _1937 = _1935 + 1;
    float _1939 = _1915 * _1909;
    float _1941 = _1933 + 0.5;
    int _1943 = _1937 * int(_1899);
    int _1945 = _1943 + _1841;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1949 = float(uint(_1945));
    float _1951 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1947);
    float _1953 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1957;
    float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1963 = _1961 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1965 = as_type<float>(_1614) * _1949;
    float _1967 = fma(_1955, _1911, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1969 = fma(_1959, _1911, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1971 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1973 = isnan(_749);
    bool _1975 = _1971 || _1973;
    bool _1977 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1979 = _1975 || _1977;
    float _1981 = float(_1979);
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1985 = _1983 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1987 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1989 = isnan(_749);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1995 = _1991 || _1993;
    float _1997 = float(_1995);
    float _1999 = trunc(_1965);
    float _2001 = precise::max(_1999, 0.0);
    uint _2003 = uint(_2001);
    float _2005 = fma(_1923, _1939, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2007 = -_1981;
    float _2009 = _2007 + 1.0;
    float _2011 = fma(_1963, _1939, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2013 = fma(_1985, _1939, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2015 = _1997 * _2009;
    bool _2017 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2019 = isnan(_749);
    bool _2021 = _2017 || _2019;
    bool _2023 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2025 = _2021 || _2023;
    float _2027 = float(_2025);
    float _2029 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2031 = -_1997;
    float _2033 = _2031 + 1.0;
    float _2035 = fma(_1681, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2029);
    float _2037 = -_113;
    float _2039 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1833);
    float _2041 = _1885 + 0.5;
    float _2043 = _2027 * _2033;
    int _2045 = int(_1899) + int(_2003);
    float _2047 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2035);
    float _2049 = fma(_2041, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2039);
    float _2051 = float(uint(_1797));
    float _2053 = _1925 * _2043;
    int _2055 = _1606 * _2045;
    int _2057 = _2055 + _1841;
    float _2059 = _1967 * _2043;
    float _2061 = as_type<float>(_1614) * _2051;
    float _2063 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1813);
    float _2065 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2067 = uint(_2057) >= uint(_1580);
    float _2069 = _1903 + (-0.5);
    float _2071 = _1969 * _2043;
    float _2073 = trunc(_2061);
    float _2075 = precise::max(_2073, 0.0);
    uint _2077 = uint(_2075);
    bool _2079 = !_2067;
    int _2081 = _2079 ? 0 : (-1);
    float _2083 = fma(_1907, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2065);
    float _2085 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2087 = -_2069;
    float _2089 = -_2063;
    float _2091 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2089);
    int _2093 = ~_2045;
    int _2095 = _2093 + _2081;
    int _2097 = _2095 + 1;
    float _2099 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2083);
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2103 = ~_1580;
    int _2105 = _2103 + 1;
    int _2107 = _1580 * _2097;
    int _2109 = _2107 + _1841;
    float _2111 = -_2027;
    float _2113 = _2111 + 1.0;
    float _2115 = fma(_1683, -2.0, _2101);
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2119 = abs(_1081);
    float _2121 = log2(_2119);
    bool _2123 = !_1719;
    int _2125 = _2123 ? _2109 : (-1);
    int _2127 = _2105 * int(_2077);
    int _2129 = _2127 + _1797;
    float _2131 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2071);
    float _2133 = -_2117;
    float _2135 = fma(_2085, 2.0, _2133);
    int _2137 = _2125 >> 31;
    float _2139 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2053);
    float _2141 = float(uint(_2129));
    float _2143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2145 = _2137 & 3;
    float _2147 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2059);
    float _2149 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1651);
    float _2151 = as_type<float>(_1614) * _2141;
    int _2153 = _2125 + _2145;
    float _2155 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1951);
    float _2157 = -_113;
    float _2159 = fma(_2157, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2135);
    float _2161 = trunc(_2151);
    float _2163 = precise::max(_2161, 0.0);
    uint _2165 = uint(_2163);
    int _2167 = _2153 >> 2;
    float _2169 = fma(_2005, _2015, _2139);
    float _2171 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2115);
    float _2173 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2175 = _2167 << 4;
    int _2177 = _2175 + 368;
    float _2179 = fma(_2011, _2015, _2147);
    int _2181 = _2125 & 3;
    bool _2183 = _2181 != 0;
    float _2185 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2189 = uint(int(uint(_2177) >> uint(2)));
    uint _2191 = uint(int(uint(int(_2189)) >> uint(2)));
    int _2193 = int(_2189) & 3;
    float _2195 = (*spvDescriptorSet0.vp_c9)._m0[int(_2191)][_2193];
    int _2197 = int(_2189) + 1;
    uint _2199 = uint(int(uint(_2197) >> uint(2)));
    int _2201 = _2197 & 3;
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[int(_2199)][_2201];
    float _2205 = fma(_2013, _2015, _2131);
    bool _2207 = uint(_2181) > 1u;
    float _2209 = fma(_1981, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2179);
    int _2211 = _2125 & 3;
    bool _2213 = _2211 != 0;
    float _2215 = -_2149;
    float _2217 = _2215 + 1.0;
    bool _2219 = _2181 != 3;
    float _2221 = exp2(_2173);
    int _2223 = _2177 + 8;
    uint _2225 = uint(int(uint(_2223) >> uint(2)));
    uint _2227 = uint(int(uint(int(_2225)) >> uint(2)));
    int _2229 = int(_2225) & 3;
    float _2231 = (*spvDescriptorSet0.vp_c9)._m0[int(_2227)][_2229];
    int _2233 = int(_2225) + 1;
    uint _2235 = uint(int(uint(_2233) >> uint(2)));
    int _2237 = _2233 & 3;
    float _2239 = (*spvDescriptorSet0.vp_c9)._m0[int(_2235)][_2237];
    int _2241 = ~_1580;
    int _2243 = _2241 + 1;
    float _2245 = fma(_1981, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2169);
    int _2247 = int(_2077) + int(_2165);
    float _2249 = fma(_1981, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2205);
    int _2251 = _2213 ? 0 : 1;
    float _2253 = fma(_2185, _1941, _2159);
    bool _2255 = uint(_2181) >= 2u;
    float _2257 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2259 = _2243 * _2247;
    int _2261 = _2259 + _1797;
    int _2263 = ~_2251;
    int _2265 = _2263 + 1;
    int _2267 = _2265 + 1;
    float _2269 = -_2155;
    float _2271 = _2269 + 1.0;
    int _2273 = _2255 ? 0 : 1;
    float _2275 = -_2257;
    float _2277 = -_2171;
    float _2279 = fma(_2275, _1887, _2277);
    int _2281 = _2267;
    if (!_2207)
    {
        int _2283 = ~_2251;
        int _2285 = _2283 + 1;
        _2281 = _2285;
    }
    int _2287 = _2281;
    float _2289 = -_2099;
    float _2291 = _2289 + 1.0;
    bool _2293 = uint(_2261) >= uint(_1580);
    float _2295 = -_2047;
    float _2297 = _2295 + 1.0;
    int _2299 = ~_2273;
    int _2301 = _2299 + 1;
    int _2303 = _2301 + 1;
    float _2305 = -_1539;
    float _2307 = _2305 + 1.0;
    int _2309 = _2303;
    float _2311 = _1550;
    if (_2219)
    {
        int _2313 = ~_2273;
        int _2315 = _2313 + 1;
        _2309 = _2315;
    }
    int _2317 = _2309;
    float _2319 = fma(_1903, _2271, _2091);
    bool _2321 = !_2183;
    int _2323 = _2321 ? 0 : 1;
    float _2325 = -_2291;
    float _2327 = fma(_1933, _2325, _2253);
    bool _2329 = _2181 != 3;
    float _2331 = fma(_1855, _2297, _2279);
    int _2333 = abs(_2287);
    bool _2335 = !_2293;
    int _2337 = _2335 ? 0 : (-1);
    int _2339 = abs(_2317);
    int _2341 = ~_2333;
    int _2343 = _2341 + 1;
    int _2345 = _2343 + 1;
    int _2347 = ~_2247;
    int _2349 = _2347 + _2337;
    int _2351 = _2349 + 1;
    int _2353 = abs(_2323);
    int _2355 = _1580 * _2351;
    int _2357 = _2355 + _1797;
    int _2359 = _2345 * as_type<int>(_2203);
    int _2361 = ~_2339;
    int _2363 = _2361 + 1;
    int _2365 = _2363 + 1;
    float _2367 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2369 = !_2329;
    int _2371 = _2369 ? 0 : (-1);
    float _2373 = fma(_2221, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2375 = precise::clamp(_2373, 0.0, 1.0);
    float _2377 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2367);
    int _2379 = abs(_2371);
    int _2381 = ~_2353;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    float _2387 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2377);
    float _2389 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2391 = fma(_2375, -2.0, 3.0);
    int _2393 = _2385 * as_type<int>(_2195);
    int _2395 = _2393 + _2359;
    float _2397 = _2375 * _2375;
    int _2399 = ~_2379;
    int _2401 = _2399 + 1;
    int _2403 = _2401 + 1;
    float _2405 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2387);
    int _2407 = _2365 * as_type<int>(_2231);
    int _2409 = _2407 + _2395;
    bool _2411 = !_1771;
    int _2413 = _2411 ? 0 : 1;
    float _2415 = exp2(_2389);
    float _2417 = _2397 * _2391;
    int _2419 = _2403 * as_type<int>(_2239);
    int _2421 = _2419 + _2409;
    int _2423 = abs(_2413);
    float _2425 = -_2217;
    float _2427 = fma(_1885, _2425, _2049);
    float _2429 = -_2417;
    float _2431 = _2429 + 1.0;
    float _2433 = in.m_70.x;
    int _2435 = ~_2423;
    int _2437 = _2435 + 1;
    int _2439 = _2437 + 1;
    bool _2441 = _1081 <= 8000.0;
    bool _2443 = isnan(_1081);
    bool _2445 = _2441 || _2443;
    bool _2447 = isnan(8000.0);
    bool _2449 = _2445 || _2447;
    float _2451 = float(_2449);
    float _2453 = fma(_2431, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2417);
    bool _2455 = !_1719;
    int _2457 = _2455 ? _2357 : (-1);
    int _2459 = _2421 * _2439;
    float _2461 = _2245 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2463 = _2451 * _2453;
    float _2465 = -_2415;
    float _2467 = _2465 + 1.0;
    int _2469 = _2457 * _2423;
    int _2471 = _2469 + _2459;
    float _2473 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2475 = _2209 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2477 = _2249 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2479 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2481 = _2307 * _2473;
    float _2483 = precise::clamp(_2481, 0.0, 1.0);
    float _2485 = _2461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2487 = _2475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2489 = _2477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2491 = _2479 * _1541;
    float _2493 = -_2483;
    float _2495 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_72.x = _2427;
    out.m_72.y = _2319;
    out.m_72.z = _2327;
    out.m_72.w = _2331;
    float _2497 = float(_2471);
    float _2499 = _1471 * 0.5;
    float _2501 = _2495 * _2433;
    out.m_74.x = _2485;
    out.m_74.y = _2487;
    out.m_74.z = _2489;
    bool _2503 = _1233 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2505 = isnan(_1233);
    bool _2507 = _2503 || _2505;
    bool _2509 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2511 = _2507 || _2509;
    float _2513 = _2501 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _1519;
    out.gl_Position.y = _1521;
    out.gl_Position.z = _2405;
    out.gl_Position.w = _1471;
    out.m_76.x = _2497;
    float _2515 = _1519 + _1471;
    float _2517 = _2405 + _1471;
    float _2519 = _1552 * _2491;
    float _2521 = _1562 * _2491;
    float _2523 = fma(_1521, -0.5, _2499);
    out.m_78.x = _2513;
    float _2525 = fma(_1558, _2519, _1546);
    float _2527 = fma(_1560, _2519, _1548);
    float _2529 = -_2479;
    float _2531 = _2529 + 1.0;
    float _2533 = fma(_1552, _2521, _1550);
    float _2535 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2537 = _1871 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2539 = _1552 * _2531;
    float _2541 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2543 = _2517 * 0.5;
    float _2545 = _2515 * 0.5;
    out.m_80.x = _2525;
    out.m_80.y = _2527;
    out.m_80.z = _2533;
    out.m_80.w = _2539;
    float _2547 = _1207 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2549 = _1471;
    float _2551 = _2543;
    float _2553 = _2523;
    float _2555 = _2545;
    if (!_2511)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2557 = _2311;
    out.m_82.x = _2541;
    out.m_82.y = _2535;
    out.m_82.z = _2537;
    float _2559 = _2557;
    float _2561 = _2557;
    if (!_2511)
    {
        _1661 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2563 = _1661;
    out.m_84.x = _2545;
    out.m_84.y = _2523;
    out.m_84.z = _2543;
    out.m_84.w = _1471;
    float _2565 = _2563;
    float _2567 = _2563;
    if (!_2511)
    {
        _2549 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2569 = _2549;
    float _2571 = _2569;
    float _2573 = _2569;
    if (!_2511)
    {
        _2551 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2575 = _2551;
    float _2577 = _2575;
    float _2579 = _2575;
    if (!_2511)
    {
        _2553 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2581 = _2553;
    float _2583 = _2581;
    float _2585 = _2581;
    if (!_2511)
    {
        _2555 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2587 = _2555;
    bool _2589 = !_2511;
    float _2591 = _2587;
    float _2593 = _2587;
    if (!_2589)
    {
        bool _2595 = _1233 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2597 = isnan(_1233);
        bool _2599 = _2595 || _2597;
        bool _2601 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2603 = _2599 || _2601;
        if (!_2603)
        {
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2607 = _1233 + _2605;
            float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2611 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2609;
            float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2617 = 1.0 / _2611;
            float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2635 = _2607 * _2617;
            float _2637 = precise::clamp(_2635, 0.0, 1.0);
            float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2643 = fma(_2637, _2615, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2645 = fma(_2637, _2641, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2647 = fma(_2637, _2621, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2649 = fma(_2637, _2625, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2651 = fma(_2637, _2629, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2653 = fma(_2637, _2633, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2573 = _2645;
            _2593 = _2651;
            _2561 = _2643;
            _2585 = _2649;
            _2579 = _2647;
            _2567 = _2653;
            _2655 = true;
        }
        else
        {
            bool _2657 = _1233 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2659 = isnan(_1233);
            bool _2661 = _2657 || _2659;
            bool _2663 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2665 = _2661 || _2663;
            if (!_2665)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2667 = _2559;
            _2561 = _2667;
            if (!_2665)
            {
                _2571 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2669 = _2571;
            _2573 = _2669;
            if (!_2665)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2671 = _2577;
            _2579 = _2671;
            if (!_2665)
            {
                _2583 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2673 = _2583;
            _2585 = _2673;
            if (!_2665)
            {
                _2591 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2675 = _2591;
            _2593 = _2675;
            if (!_2665)
            {
                _2565 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2677 = _2565;
            bool _2679 = !_2665;
            _2567 = _2677;
            if (!_2679)
            {
                bool _2681 = _1233 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2683 = isnan(_1233);
                bool _2685 = _2681 || _2683;
                bool _2687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2689 = _2685 || _2687;
                if (!_2689)
                {
                    float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2693 = _1233 + _2691;
                    float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2697 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2695;
                    float _2699 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2703 = 1.0 / _2697;
                    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2713 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2715 = _2713 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2721 = _2693 * _2703;
                    float _2723 = precise::clamp(_2721, 0.0, 1.0);
                    float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2729 = fma(_2723, _2701, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2731 = fma(_2723, _2727, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2733 = fma(_2723, _2707, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2735 = fma(_2723, _2711, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2737 = fma(_2723, _2715, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2739 = fma(_2723, _2719, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2573 = _2731;
                    _2593 = _2737;
                    _2561 = _2729;
                    _2585 = _2735;
                    _2579 = _2733;
                    _2567 = _2739;
                    _2655 = true;
                }
                else
                {
                    _2573 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2593 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2585 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2567 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2655 = false;
    float _2741 = _2573;
    float _2743 = _2593;
    float _2745 = _2561;
    float _2747 = _2585;
    float _2749 = _2579;
    float _2751 = _2567;
    float _2753 = fma(_2535, -0.5, 0.5);
    float _2755 = precise::clamp(_2753, 0.0, 1.0);
    float _2757 = -_2741;
    float _2759 = _2757 + _2743;
    float _2761 = _2547 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2763 = -_2745;
    float _2765 = _2763 + _2747;
    out.m_86.x = 0.0;
    float _2767 = fma(_2755, _2759, _2741);
    float _2769 = fma(_2755, _2765, _2745);
    out.m_53.x = _2761;
    float _2771 = -_2749;
    float _2773 = _2771 + _2751;
    float _2775 = _2767 * 0.586610972881317138671875;
    bool _2777 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2779 = fma(_2755, _2773, _2749);
    float _2781 = fma(_2769, 0.298911988735198974609375, _2775);
    bool _2783 = _1207 > 0.0;
    bool _2785 = isnan(_1207);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan(0.0);
    bool _2791 = _2787 || _2789;
    float _2793 = fma(_2779, 0.114477999508380889892578125, _2781);
    float _2795 = -_2793;
    float _2797 = _2769 + _2795;
    float _2799 = -_2793;
    float _2801 = _2767 + _2799;
    float _2803 = -_2793;
    float _2805 = _2779 + _2803;
    float _2807 = fma(_2797, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2793);
    float _2809 = fma(_2801, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2793);
    float _2811 = fma(_2805, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2793);
    bool _2813 = !_2777;
    if (!_2813)
    {
        float _2815 = -_1147;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2819 = -_1149;
        float _2821 = _2819 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2823 = -_1151;
        float _2825 = _2823 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2827 = _2817 * _2817;
        float _2829 = fma(_2821, _2821, _2827);
        float _2831 = fma(_2825, _2825, _2829);
        float _2833 = sqrt(_2831);
        float _2835 = rsqrt(_2831);
        float _2837 = -_2833;
        float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2841 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2843 = precise::clamp(_2841, 0.0, 1.0);
        float _2845 = _2821 * _2835;
        float _2847 = _2817 * _2835;
        float _2849 = abs(_2843);
        float _2851 = log2(_2849);
        float _2853 = _2825 * _2835;
        float _2855 = _2845 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2857 = _2535 * _2847;
        float _2859 = -_2847;
        float _2861 = -_2855;
        float _2863 = fma(_2859, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2861);
        float _2865 = fma(_2541, _2845, _2857);
        float _2867 = -_2853;
        float _2869 = fma(_2867, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2863);
        float _2871 = fma(_2537, _2853, _2865);
        float _2873 = precise::clamp(_2871, 0.0, 1.0);
        float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2877 = _2869 + _2875;
        float _2879 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2881 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2883 = precise::clamp(_2881, 0.0, 1.0);
        float _2885 = exp2(_2879);
        float _2887 = _2885 * _2883;
        float _2889 = _2873 * _2887;
        float _2891 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2893 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2895 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2891;
        out.m_86.y = _2893;
        out.m_86.z = _2895;
    }
    out.m_88.x = _2807;
    out.m_88.y = _2809;
    out.m_88.z = _2811;
    if (_2791)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _2897 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2897;
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
    out.dm_pad3 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2655 = false;
    bool _539 = false;
    bool _369 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_46.w;
    float _104 = in.m_48.w;
    float _106 = trunc(_102);
    int _109 = int(_106);
    float _111 = -_104;
    float _113 = _111 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _113;
    bool _117 = _109 >= 1;
    float _119 = 0.0;
    float _121 = as_type<float>(_109);
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _123 = _119;
    if (!_117)
    {
        out.m_53.x = 0.0;
    }
    int _125 = 0;
    if (!_117)
    {
        float _127 = _123 * 5.0;
        _125 = as_type<int>(_127);
    }
    int _129 = _125;
    int _131 = _129;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2965 = as_type<float>(_129);
        out.gl_Position.z = _2965;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.dm_pad3.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.dm_pad3.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.dm_pad3.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.dm_pad3.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _133 = _104 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = isnan(_104);
    bool _137 = _133 || _135;
    bool _139 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _141 = _137 || _139;
    float _143 = float(_109);
    bool _145 = _113 >= _143;
    bool _147 = !_141;
    bool _149 = _145 || _147;
    if (_149)
    {
        _121 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _151 = _121;
    if (_149)
    {
        out.m_53.x = 0.0;
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
        float _3020 = as_type<float>(_155);
        out.gl_Position.z = _3020;
    }
    if (_149)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.dm_pad3.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.dm_pad3.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.dm_pad3.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.dm_pad3.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _157 = as_type<float>(int(gl_VertexIndex));
    float _159 = 1.0 / _143;
    float _161 = in.m_58.x;
    float _163 = in.m_58.y;
    float _165 = in.m_58.z;
    float _167 = _113 * _159;
    int _169 = as_type<int>(_157) & 1;
    bool _171 = _169 != 0;
    int _173 = as_type<int>(_157) & 2;
    bool _175 = _173 != 0;
    float _177 = _163 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    bool _179 = !_175;
    int _181 = _179 ? (-1090519040) : 1056964608;
    float _183 = _163 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _163 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _189 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[4].x, _177);
    out.m_60.y = as_type<float>(_181);
    float _191 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _193 = fma(_161, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].z, _189);
    bool _197 = !_171;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].z, _191);
    float _203 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    bool _205 = !_185;
    float _207 = _167;
    float _225;
    if (!_205)
    {
        float _209 = in.m_62.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _113);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        _225 = _167;
    }
    _227 = false;
    float _229 = _225;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _229 + _231;
    bool _235 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _237 = isnan(_229);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _243 = _239 || _241;
    float _245 = float(_243);
    bool _247 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _249 = isnan(_229);
    bool _251 = _247 || _249;
    bool _253 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _255 = _251 || _253;
    float _257 = float(_255);
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _259;
    float _263 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _265 = _263 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _267 = -_245;
    float _269 = _267 + 1.0;
    float _271 = 1.0 / _261;
    bool _273 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _275 = isnan(_229);
    bool _277 = _273 || _275;
    bool _279 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _281 = _277 || _279;
    float _283 = float(_281);
    float _285 = _257 * _269;
    float _287 = -_257;
    float _289 = _287 + 1.0;
    bool _291 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _293 = _283 * _289;
    float _295 = 1.0 / _265;
    float _297 = -_283;
    float _299 = _297 + 1.0;
    float _301 = _233 * _271;
    float _303 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _305 = _229 + _303;
    float _307 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _309 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _307;
    float _311 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _313 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _311;
    float _315 = fma(_309, _301, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _317 = fma(_313, _301, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _319 = _305 * _295;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _325 = _315 * _293;
    float _327 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _329 = _327 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _331 = _317 * _293;
    float _333 = fma(_323, _319, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _335 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].x, _325);
    float _337 = fma(_329, _319, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _339 = fma(_299, (*spvDescriptorSet0.vp_c9)._m0[143].y, _331);
    float _341 = fma(_333, _285, _335);
    float _343 = fma(_337, _285, _339);
    float _345 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[145].x, _341);
    float _347 = fma(_245, (*spvDescriptorSet0.vp_c9)._m0[145].y, _343);
    bool _349 = !_291;
    float _367;
    if (!_349)
    {
        float _351 = in.m_62.x;
        float _353 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _355 = _351 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _357 = fma(_355, (*spvDescriptorSet0.vp_c9)._m0[11].x, _113);
        float _359 = _357 * _353;
        float _361 = floor(_359);
        float _363 = -_361;
        float _365 = _359 + _363;
        _367 = _365;
        _369 = true;
    }
    else
    {
        _367 = _167;
    }
    _369 = false;
    float _371 = _367;
    float _373 = in.m_64.x;
    float _375 = in.m_64.y;
    float _377 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _379 = _371 + _377;
    bool _381 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[109].w;
    bool _383 = isnan(_371);
    bool _385 = _381 || _383;
    bool _387 = isnan((*spvDescriptorSet0.vp_c9)._m0[109].w);
    bool _389 = _385 || _387;
    float _391 = float(_389);
    bool _393 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _395 = isnan(_371);
    bool _397 = _393 || _395;
    bool _399 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _401 = _397 || _399;
    float _403 = float(_401);
    float _405 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _407 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _405;
    float _409 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _411 = _409 + (*spvDescriptorSet0.vp_c9)._m0[109].w;
    float _413 = -_391;
    float _415 = _413 + 1.0;
    float _417 = 1.0 / _411;
    bool _419 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _421 = 1.0 / _407;
    float _423 = _347 * _375;
    float _425 = -(*spvDescriptorSet0.vp_c9)._m0[108].w;
    float _427 = _371 + _425;
    bool _429 = _371 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _431 = isnan(_371);
    bool _433 = _429 || _431;
    bool _435 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _437 = _433 || _435;
    float _439 = float(_437);
    float _441 = _345 * _373;
    float _443 = _427 * _417;
    float _445 = _439 * _415;
    float _447 = -_439;
    float _449 = _447 + 1.0;
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _451;
    float _455 = _379 * _421;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _457;
    float _461 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _463 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _461;
    float _465 = _403 * _449;
    float _467 = fma(_453, _455, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _469 = fma(_459, _455, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _471 = fma(_463, _455, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _473 = -_403;
    float _475 = _473 + 1.0;
    float _477 = _467 * _465;
    float _479 = _469 * _465;
    float _481 = _471 * _465;
    float _483 = -(*spvDescriptorSet0.vp_c9)._m0[108].y;
    float _485 = _483 + (*spvDescriptorSet0.vp_c9)._m0[109].y;
    float _487 = -(*spvDescriptorSet0.vp_c9)._m0[108].x;
    float _489 = _487 + (*spvDescriptorSet0.vp_c9)._m0[109].x;
    float _491 = -(*spvDescriptorSet0.vp_c9)._m0[108].z;
    float _493 = _491 + (*spvDescriptorSet0.vp_c9)._m0[109].z;
    float _495 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].x, _477);
    float _497 = fma(_485, _443, (*spvDescriptorSet0.vp_c9)._m0[108].y);
    float _499 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].y, _479);
    float _501 = fma(_489, _443, (*spvDescriptorSet0.vp_c9)._m0[108].x);
    float _503 = fma(_493, _443, (*spvDescriptorSet0.vp_c9)._m0[108].z);
    float _505 = fma(_475, (*spvDescriptorSet0.vp_c9)._m0[107].z, _481);
    float _507 = fma(_497, _445, _499);
    float _509 = fma(_501, _445, _495);
    float _511 = fma(_503, _445, _505);
    float _513 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[109].y, _507);
    float _515 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[109].x, _509);
    float _517 = fma(_391, (*spvDescriptorSet0.vp_c9)._m0[109].z, _511);
    bool _519 = !_419;
    float _537;
    if (!_519)
    {
        float _521 = in.m_62.x;
        float _523 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _525 = _521 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _527 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[11].y, _113);
        float _529 = _527 * _523;
        float _531 = floor(_529);
        float _533 = -_531;
        float _535 = _529 + _533;
        _537 = _535;
        _539 = true;
    }
    else
    {
        _537 = _167;
    }
    _539 = false;
    float _541 = _537;
    float _543 = _515 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _545 = _513 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _547 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _549 = _547 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _555 = 1.0 / _549;
    float _557 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _559 = _557 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _561 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _563 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _561;
    bool _565 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _567 = isnan(_541);
    bool _569 = _565 || _567;
    bool _571 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _573 = _569 || _571;
    float _575 = float(_573);
    float _577 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _579 = _577 + (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _581 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _583 = isnan(_541);
    bool _585 = _581 || _583;
    bool _587 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _589 = _585 || _587;
    float _591 = float(_589);
    float _593 = _517 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _595 = 1.0 / _553;
    bool _597 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _599 = isnan(_541);
    bool _601 = _597 || _599;
    bool _603 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _605 = _601 || _603;
    float _607 = float(_605);
    float _609 = -_591;
    float _611 = _609 + 1.0;
    bool _613 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _615 = isnan(_541);
    bool _617 = _613 || _615;
    bool _619 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _621 = _617 || _619;
    float _623 = float(_621);
    bool _625 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].z;
    float _627 = 1.0 / _559;
    float _629 = _563 * _555;
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _633 = _541 + _631;
    float _635 = fma(_629, _633, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _637 = -_575;
    float _639 = _637 + 1.0;
    float _641 = 1.0 / _579;
    float _643 = -_607;
    float _645 = _643 + 1.0;
    float _647 = _575 * _611;
    float _649 = _607 * _639;
    float _651 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _653 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _651;
    float _655 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _657 = _655 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _659 = _623 * _645;
    float _661 = -_623;
    float _663 = _661 + 1.0;
    float _665 = _653 * _595;
    float _667 = _657 * _627;
    float _669 = _635 * _659;
    float _671 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _673 = _541 + _671;
    float _675 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _677 = _541 + _675;
    bool _679 = _541 >= (*spvDescriptorSet0.vp_c9)._m0[119].w;
    bool _681 = isnan(_541);
    bool _683 = _679 || _681;
    bool _685 = isnan((*spvDescriptorSet0.vp_c9)._m0[119].w);
    bool _687 = _683 || _685;
    float _689 = float(_687);
    float _691 = -(*spvDescriptorSet0.vp_c9)._m0[118].x;
    float _693 = _691 + (*spvDescriptorSet0.vp_c9)._m0[119].x;
    float _695 = fma(_667, _673, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _697 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[115].x, _669);
    float _699 = fma(_665, _677, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _701 = _693 * _641;
    float _703 = -_689;
    float _705 = _703 + 1.0;
    float _707 = -(*spvDescriptorSet0.vp_c9)._m0[118].w;
    float _709 = _541 + _707;
    float _711 = fma(_695, _649, _697);
    float _713 = _543 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _715 = _591 * _705;
    float _717 = fma(_701, _709, (*spvDescriptorSet0.vp_c9)._m0[118].x);
    float _719 = fma(_699, _647, _711);
    float _721 = _545 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _723 = _593 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _725 = fma(_717, _715, _719);
    float _727 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[119].x, _725);
    float _729 = _727 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _713;
    out.m_66.y = _721;
    out.m_66.z = _723;
    out.m_66.w = _729;
    bool _731 = !_625;
    if (!_731)
    {
        float _733 = in.m_62.x;
        float _735 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].z;
        float _737 = _733 * (*spvDescriptorSet0.vp_c9)._m0[12].w;
        float _739 = fma(_737, (*spvDescriptorSet0.vp_c9)._m0[11].z, _113);
        float _741 = _739 * _735;
        float _743 = floor(_741);
        float _745 = -_743;
        float _747 = _741 + _745;
        _207 = _747;
    }
    float _749 = _207;
    float _751 = in.m_46.x;
    float _753 = in.m_46.y;
    float _755 = in.m_46.z;
    float _757 = _423 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _759 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_181));
    float _761 = _441 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _763 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _765 = _757 * _759;
    float _767 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _769 = _761 * _763;
    float _771 = _765 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _773 = _765 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _775 = _765 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _777 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[26].x, _771);
    float _779 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[24].x, _773);
    float _781 = fma(_769, (*spvDescriptorSet0.vp_c8)._m0[25].x, _775);
    float _783 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[26].z, _777);
    float _785 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[24].z, _779);
    float _787 = fma(_767, (*spvDescriptorSet0.vp_c8)._m0[25].z, _781);
    float _789 = _783 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _791 = _785 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _793 = _753 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _795 = _753 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _797 = _753 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _799 = _787 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _801 = fma(_751, (*spvDescriptorSet0.vp_c10)._m0[6].x, _793);
    float _803 = fma(_751, (*spvDescriptorSet0.vp_c10)._m0[4].x, _795);
    float _805 = fma(_751, (*spvDescriptorSet0.vp_c10)._m0[5].x, _797);
    float _807 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[6].z, _801);
    float _809 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[4].z, _803);
    float _811 = _807 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _813 = _809 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _815 = _811 + _789;
    float _817 = _813 + _791;
    float _819 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _821 = _815 + _819;
    float _823 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _825 = _817 + _823;
    float _827 = _821 * _821;
    float _829 = fma(_825, _825, _827);
    float _831 = fma(_755, (*spvDescriptorSet0.vp_c10)._m0[5].z, _805);
    float _833 = sqrt(_829);
    float _835 = _831 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _837 = _835 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _839 = _835 + _799;
    float _841 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[11].x, _837);
    float _843 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[11].z, _841);
    bool _845 = _833 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _847 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _849 = _847 != 0;
    int _851 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _853 = _851 != 0;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _857 = _855 != 0;
    bool _859 = !_853;
    int _861 = _859 ? 0 : 1;
    bool _863 = !_849;
    int _865 = _863 ? 0 : 1;
    bool _867 = !_857;
    int _869 = _867 ? 0 : 1;
    float _871 = _787;
    float _873 = _837;
    float _875 = _799;
    float _877 = _839;
    float _879 = _825;
    if (!_845)
    {
        _871 = _817;
    }
    float _881 = _871;
    float _883 = _881;
    if (!_845)
    {
        _873 = _815;
    }
    float _885 = _873;
    float _887 = _885;
    if (!_845)
    {
        _875 = _839;
    }
    float _889 = _875;
    bool _891 = !_845;
    float _893 = _889;
    if (!_891)
    {
        float _895 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _897 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _899 = _833 + _897;
        float _901 = _839 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _903 = rsqrt(_829);
        float _905 = _899 * _895;
        float _907 = _905 * 0.15915493667125701904296875;
        float _909 = _907 * 6.283185482025146484375;
        float _911 = cos(_909);
        float _913 = _907 * 6.283185482025146484375;
        float _915 = sin(_913);
        float _917 = _911 + (-1.0);
        float _919 = fma(_915, _901, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _921 = _917 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _923 = _903 * _919;
        float _925 = fma(_839, _911, _921);
        float _927 = fma(_825, _923, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _929 = fma(_821, _923, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _893 = _925;
        _883 = _927;
        _887 = _929;
    }
    float _931 = _893;
    float _933 = _883;
    float _935 = _887;
    float _937 = -_835;
    float _939 = _937 + _931;
    float _941 = -_813;
    float _943 = _941 + _933;
    float _945 = _843 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _947 = _835 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _949 = _939 * _939;
    float _951 = -_811;
    float _953 = _951 + _935;
    float _955 = 1.0 / _945;
    float _957 = fma(_813, (*spvDescriptorSet0.vp_c8)._m0[10].x, _947);
    float _959 = fma(_943, _943, _949);
    float _961 = fma(_811, (*spvDescriptorSet0.vp_c8)._m0[10].z, _957);
    float _963 = fma(_953, _953, _959);
    bool _965 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _967 = isnan(0.5);
    bool _969 = _965 || _967;
    bool _971 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _973 = _969 || _971;
    float _975 = _961 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _977 = sqrt(_963);
    bool _979 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _981 = isnan(0.5);
    bool _983 = _979 || _981;
    bool _985 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _987 = _983 || _985;
    float _989 = _975 + _945;
    float _991 = _989 * _955;
    float _993 = _991 * 0.5;
    float _995 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _997 = fma(_993, (*spvDescriptorSet0.vp_c8)._m0[30].w, _995);
    float _999 = 1.0 / _997;
    bool _1001 = _977 > 0.0;
    bool _1003 = !_1001;
    float _1005 = _933;
    float _1007 = _931;
    float _1009 = _935;
    float _1011 = _955;
    float _1013 = _943;
    if (!_1003)
    {
        float _1015 = _201 * _201;
        float _1017 = rsqrt(_963);
        float _1019 = fma(_195, _195, _1015);
        float _1021 = fma(_203, _203, _1019);
        float _1023 = sqrt(_1021);
        float _1025 = _943 * _1017;
        float _1027 = _939 * _1017;
        float _1029 = _953 * _1017;
        bool _1031 = _1023 > 0.0;
        bool _1033 = !_1031;
        _877 = _1029;
        if (!_1033)
        {
            float _1035 = rsqrt(_1021);
            float _1037 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1039 = _201 * _1035;
            float _1041 = _195 * _1035;
            float _1043 = _1027 * _1039;
            float _1045 = _203 * _1035;
            float _1047 = fma(_1025, _1041, _1043);
            float _1049 = _1037 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1051 = fma(_1029, _1045, _1047);
            float _1053 = _1051 * _1049;
            float _1055 = fma(_195, _1053, _933);
            float _1057 = fma(_201, _1053, _931);
            float _1059 = fma(_203, _1053, _935);
            _1005 = _1055;
            _1007 = _1057;
            _1009 = _1059;
            _1011 = _1049;
        }
    }
    float _1061 = _1005;
    float _1063 = _1007;
    float _1065 = _1009;
    float _1067 = _877;
    float _1069 = _1011;
    float _1071 = _1069;
    float _1073 = _1067;
    float _1075 = _1061;
    if (_987)
    {
        _1071 = 1.0;
    }
    float _1077 = _1071;
    float _1079 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1081 = _999 * _1079;
    float _1083 = _1077;
    if (_973)
    {
        _1073 = _1061;
    }
    float _1085 = _1073;
    float _1087 = _1085;
    if (_973)
    {
        _1013 = _1063;
    }
    float _1089 = _1013;
    float _1091 = _1089;
    if (_973)
    {
        _879 = _1065;
    }
    float _1093 = _879;
    float _1095 = _1093;
    if (!_973)
    {
        float _1097 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1099 = _835 + _1097;
        float _1101 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1103 = _813 + _1101;
        float _1105 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1107 = -_835;
        float _1109 = _1107 + _1063;
        float _1111 = _1099 * _1099;
        float _1113 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1115 = _811 + _1113;
        float _1117 = -_813;
        float _1119 = _1117 + _1061;
        float _1121 = -_811;
        float _1123 = _1121 + _1065;
        float _1125 = fma(_1103, _1103, _1111);
        float _1127 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1129 = fma(_1115, _1115, _1125);
        float _1131 = sqrt(_1129);
        float _1133 = _1105 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1135 = precise::min(_1131, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1137 = _1135 * _1127;
        float _1139 = _1133 * _1137;
        float _1141 = fma(_1109, _1139, _835);
        float _1143 = fma(_1119, _1139, _813);
        float _1145 = fma(_1123, _1139, _811);
        _1091 = _1141;
        _1087 = _1143;
        _1095 = _1145;
        _1075 = _1119;
    }
    float _1147 = _1091;
    float _1149 = _1087;
    float _1151 = _1095;
    float _1153 = _1075;
    float _1155 = _1153;
    if (!_987)
    {
        float _1157 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1159 = _1157 * 0.15915493667125701904296875;
        float _1161 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1163 = _1159 * 6.283185482025146484375;
        float _1165 = cos(_1163);
        float _1167 = _1161 * 0.15915493667125701904296875;
        float _1169 = _1159 * 6.283185482025146484375;
        float _1171 = sin(_1169);
        float _1173 = 1.0 / _1165;
        float _1175 = _1167 * 6.283185482025146484375;
        float _1177 = cos(_1175);
        float _1179 = _1171 * _1173;
        float _1181 = _1167 * 6.283185482025146484375;
        float _1183 = sin(_1181);
        float _1185 = _1177 * _1179;
        float _1187 = 1.0 / _1185;
        float _1189 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1191 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1189;
        float _1193 = 1.0 / _1191;
        float _1195 = _1183 * _1187;
        float _1197 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1199 = fma(_1081, _1195, _1197);
        float _1201 = _1199 * _1193;
        float _1203 = precise::clamp(_1201, 0.0, 1.0);
        _1155 = _1199;
        _1083 = _1203;
    }
    float _1205 = _1155;
    float _1207 = _1083;
    float _1209 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1211 = _1147 + _1209;
    float _1213 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1215 = _1149 + _1213;
    float _1217 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1219 = _1151 + _1217;
    float _1221 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1223 = _1211 * _1211;
    float _1225 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1221);
    float _1227 = fma(_1215, _1215, _1223);
    float _1229 = fma(_1219, _1219, _1227);
    float _1231 = rsqrt(_1229);
    float _1233 = sqrt(_1229);
    float _1235 = _1231 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1237 = _1215 * _1235;
    float _1239 = _1219 * _1235;
    float _1241 = _1237 * _1237;
    float _1243 = _1239 * _1239;
    float _1245 = _1241 + _1243;
    float _1247 = sqrt(_1245);
    bool _1249 = _1247 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1251 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1253 = _1247 + _1251;
    float _1255 = _1231;
    float _1257 = _1245;
    float _1259 = _1253;
    float _1261 = _1205;
    float _1263 = _1235;
    float _1265 = _1237;
    if (_1249)
    {
        float _1267 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1255 = _1267;
    }
    float _1269 = _1255;
    if (_1249)
    {
        float _1271 = rsqrt(_1245);
        _1257 = _1271;
    }
    float _1273 = _1257;
    float _1275 = _1273;
    if (_1249)
    {
        float _1277 = _1253 * _1269;
        _1259 = _1277;
    }
    float _1279 = _1259;
    if (_1249)
    {
        float _1281 = _1279 * 0.15915493667125701904296875;
        _1261 = _1281;
    }
    float _1283 = _1261;
    float _1285 = _1269;
    float _1287 = _1283;
    if (_1249)
    {
        float _1289 = _1283 * 6.283185482025146484375;
        float _1291 = sin(_1289);
        _1285 = _1291;
    }
    float _1293 = _1285;
    float _1295 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1297 = precise::max(0.0, _1295);
    float _1299 = _1219;
    float _1301 = _1297;
    if (_1249)
    {
        float _1303 = _1283 * 6.283185482025146484375;
        float _1305 = cos(_1303);
        _1299 = _1305;
    }
    float _1307 = _1299;
    float _1309 = -_1235;
    float _1311 = -_1297;
    float _1313 = fma(_1211, _1309, _1311);
    if (_1249)
    {
        float _1315 = _1313 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1301 = _1315;
    }
    float _1317 = _1301;
    float _1319 = _1317;
    if (!_1249)
    {
        _1287 = _1313;
    }
    float _1321 = _1287;
    float _1323 = fma(_813, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1325 = _1293;
    float _1327 = _1321;
    if (_1249)
    {
        float _1329 = fma(_1293, _1317, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1325 = _1329;
    }
    float _1331 = _1325;
    float _1333 = floor(_1323);
    float _1335 = _1331;
    float _1337 = _1307;
    if (_1249)
    {
        float _1339 = _1307 + (-1.0);
        _1319 = _1339;
    }
    float _1341 = _1319;
    float _1343 = _1341;
    if (_1249)
    {
        float _1345 = _1273 * _1331;
        _1263 = _1345;
    }
    float _1347 = _1263;
    if (!_1249)
    {
        _1275 = _1239;
    }
    float _1349 = _1275;
    float _1351 = _1349;
    if (_1249)
    {
        float _1353 = _1341 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1335 = _1353;
    }
    float _1355 = _1335;
    if (_1249)
    {
        float _1357 = _1237 * _1347;
        _1265 = _1357;
    }
    float _1359 = _1265;
    if (!_1249)
    {
        _1343 = _1241;
    }
    float _1361 = _1343;
    float _1363 = _1361;
    if (_1249)
    {
        float _1365 = _1239 * _1347;
        _1351 = _1365;
    }
    float _1367 = _1351;
    if (_1249)
    {
        float _1369 = fma(_1313, _1307, _1355);
        _1327 = _1369;
    }
    float _1371 = _1327;
    if (_1249)
    {
        float _1373 = _1359 * _1359;
        _1363 = _1373;
    }
    float _1375 = _1363;
    if (!_1249)
    {
        _1337 = _1243;
    }
    float _1377 = _1337;
    float _1379 = _1377;
    if (_1249)
    {
        float _1381 = _1367 * _1367;
        _1379 = _1381;
    }
    float _1383 = _1379;
    float _1385 = fma(_1371, _1371, _1375);
    float _1387 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1389 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1391 = _1385 + _1383;
    float _1393 = fma(_811, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1395 = _1147 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1397 = rsqrt(_1391);
    float _1399 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1387);
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1403 = fma(_1233, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1401);
    float _1405 = precise::clamp(_1403, 0.0, 1.0);
    float _1407 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1395);
    float _1409 = fma(_1149, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1389);
    float _1411 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1399);
    float _1413 = -_1405;
    float _1415 = _1413 + 1.0;
    float _1417 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1407);
    float _1419 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1409);
    float _1421 = _1411 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1423 = floor(_1393);
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1427 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1429 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1431 = fma(_1151, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1225);
    float _1433 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1435 = _1397 * _1359;
    float _1437 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1429);
    float _1439 = abs(_1415);
    float _1441 = log2(_1439);
    float _1443 = _1397 * _1371;
    float _1445 = _1435 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1447 = _1397 * _1367;
    float _1449 = _1427 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1451 = _1431 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1453 = -_1445;
    float _1455 = fma(_1443, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1453);
    float _1457 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1437);
    float _1459 = -_1449;
    float _1461 = fma(_1459, _1433, 1.0);
    float _1463 = -_1333;
    float _1465 = _1323 + _1463;
    float _1467 = -_1447;
    float _1469 = fma(_1467, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1455);
    float _1471 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1457);
    float _1473 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1475 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1477 = fma(_1469, -0.5, 0.5);
    float _1479 = log2(_1461);
    float _1481 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1483 = fma(_1469, 0.5, 0.5);
    float _1485 = -_1423;
    float _1487 = _1393 + _1485;
    float _1489 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1473);
    float _1491 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1475);
    float _1493 = _1443 + 1.0;
    float _1495 = exp2(_1481);
    float _1497 = fma(_1483, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1499 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1489);
    float _1501 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1491);
    float _1503 = fma(_1483, _1497, -0.212114393711090087890625);
    float _1505 = 1.0 / _1471;
    float _1507 = _1479 * 0.693147182464599609375;
    float _1509 = fma(_1483, _1503, 1.570728778839111328125);
    float _1511 = _1507 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1513 = sqrt(_1477);
    float _1515 = -_1443;
    float _1517 = fma(_1495, _1493, _1515);
    float _1519 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1499);
    float _1521 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1501);
    float _1523 = _1519 * _1505;
    float _1525 = _1521 * _1505;
    float _1527 = fma(_1523, 0.5, 0.5);
    float _1529 = fma(_1525, -0.5, 0.5);
    float _1531 = _1513 * 0.636619746685028076171875;
    float _1533 = -_1509;
    float _1535 = fma(_1531, _1533, 1.0);
    float _1537 = fma(_1517, 0.5, 0.5);
    float2 _5258 = float2(_1465, _1487);
    float _1539 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_5258, float2(0.0), isnan(_5258)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_5258, float2(0.0), isnan(_5258)), level(0.0)).x;
    float3 _5269 = float3(_1527, _1529, _1511);
    float _1541 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_5269, float3(0.0), isnan(_5269)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_5269, float3(0.0), isnan(_5269)), level(0.0)).x;
    float3 _5280 = float3(_1527, _1529, _1511);
    float4 _1544 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_5280, float3(0.0), isnan(_5280)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_5280, float3(0.0), isnan(_5280)), level(0.0)).xyzw;
    float _1546 = _1544.x;
    float _1548 = _1544.y;
    float _1550 = _1544.z;
    float _1552 = _1544.w;
    float2 _5296 = float2(_1535, _1537);
    float3 _1556 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_5296, float2(0.0), isnan(_5296)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_5296, float2(0.0), isnan(_5296)), level(0.0)).xyz;
    float _1558 = _1556.x;
    float _1560 = _1556.y;
    float _1562 = _1556.z;
    float _1564 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _1566 = int(_1564);
    int _1568 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1570 = _1568 != 0;
    float _1572 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1574 = _749 + _1572;
    int _1576 = abs(_865);
    float _1578 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _1580 = int(_1578);
    float _1582 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _1584 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _1586 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _1588 = float(_1566);
    float _1590 = 1.0 / _1588;
    float _1592 = float(uint(_1580));
    int _1594 = ~_1580;
    int _1596 = _1594 + 1;
    int _1598 = ~_1580;
    int _1600 = _1598 + 1;
    float _1602 = 1.0 / _1592;
    int _1604 = ~_1580;
    int _1606 = _1604 + 1;
    float _1608 = _113 * _1590;
    float _1610 = trunc(_1608);
    int _1612 = int(_1610);
    int _1614 = as_type<int>(_1602) + (-2);
    int _1616 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _1618 = _1616 != 0;
    float _1620 = float(uint(_1612));
    bool _1622 = !_1618;
    float _1624 = _1622 ? 7.345489978790283203125 : 1.0;
    float _1626 = as_type<float>(_1614) * _1620;
    float _1628 = in.m_62.x;
    float _1630 = in.m_62.y;
    float _1632 = in.m_62.z;
    float _1634 = in.m_62.w;
    float _1636 = trunc(_1626);
    float _1638 = precise::max(_1636, 0.0);
    uint _1641 = uint(_1638);
    int _1643 = _1596 * int(_1641);
    int _1645 = _1643 + _1612;
    float _1647 = _1624 * _1628;
    float _1649 = float(uint(_1645));
    float _1651 = fma(_1628, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1586);
    bool _1653 = _1634 > 0.5;
    int _1655 = _1580 + (-1);
    float _1657 = as_type<float>(_1614) * _1649;
    float _1659 = 0.0;
    float _1661 = _1471;
    if (!_1618)
    {
        _1659 = _1632;
    }
    float _1663 = _1659;
    float _1665 = 0.0;
    float _1667 = _1663;
    if (!_1618)
    {
        _1665 = _1632;
    }
    float _1669 = _1665;
    float _1671 = trunc(_1657);
    float _1673 = precise::max(_1671, 0.0);
    uint _1675 = uint(_1673);
    float _1677 = _1669;
    if (_1618)
    {
        _1667 = _1630;
    }
    float _1679 = _1667;
    if (_1618)
    {
        _1677 = _1630;
    }
    float _1681 = _1677;
    float _1683 = _1679 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _1685 = float(_1612);
    int _1687 = int(_1641) + int(_1675);
    float _1689 = float(_1580);
    float _1691 = floor(_1647);
    int _1693 = _1600 * _1687;
    int _1695 = _1693 + _1612;
    bool _1697 = _1685 >= _1689;
    bool _1699 = isnan(_1685);
    bool _1701 = _1697 || _1699;
    bool _1703 = isnan(_1689);
    bool _1705 = _1701 || _1703;
    float _1707 = float(_1705);
    bool _1709 = uint(_1695) >= uint(_1580);
    float _1711 = trunc(_1707);
    int _1713 = int(_1711);
    bool _1715 = !_1709;
    int _1717 = _1715 ? 0 : (-1);
    bool _1719 = _1580 == 0;
    int _1721 = ~_1687;
    int _1723 = _1721 + _1717;
    int _1725 = _1723 + 1;
    float _1727 = -_1691;
    float _1729 = _1647 + _1727;
    float _1731 = _113 * _1689;
    int _1733 = _1580 * _1725;
    int _1735 = _1733 + _1612;
    float _1737 = _1729 * _1689;
    float _1739 = _1731 * _159;
    out.m_68.x = (*spvDescriptorSet0.vp_c9)._m0[159].x;
    int _1741 = ~_1713;
    int _1743 = _1741 + 1;
    int _1745 = _1743 + 1;
    bool _1747 = !_1719;
    int _1749 = _1747 ? _1735 : (-1);
    float _1751 = trunc(_1737);
    int _1753 = int(_1751);
    int _1755 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1757 = _1755 != 0;
    int _1759 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _1761 = _1759 != 0;
    int _1763 = _1749 * _1745;
    bool _1765 = !_1757;
    int _1767 = _1765 ? 0 : 1;
    int _1769 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1771 = _1769 != 0;
    float _1773 = trunc(_1739);
    int _1775 = int(_1773);
    int _1777 = _1713 * _1655;
    int _1779 = _1777 + _1763;
    int _1781 = abs(_861);
    int _1783 = abs(_1767);
    bool _1785 = !_1570;
    int _1787 = _1785 ? 0 : 1;
    int _1789 = _1779 * _1781;
    float _1791 = -as_type<float>(_181);
    int _1793 = _1653 ? as_type<int>(_1791) : _181;
    int _1795 = _1753 * _1783;
    int _1797 = _1795 + _1612;
    int _1799 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1801 = _1799 != 0;
    float _1803 = _1630 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1805 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1807 = _1805 != 0;
    int _1809 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _1811 = _1809 != 0;
    float _1813 = fma(_1803, -2.0, _1584);
    int _1815 = abs(_869);
    int _1817 = _1775 * _1576;
    int _1819 = _1817 + _1789;
    int _1821 = abs(_1787);
    float _1823 = _1628 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    int _1825 = _1797 * _1815;
    int _1827 = _1825 + _1819;
    float _1829 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1831 = -_1582;
    float _1833 = fma(_1823, 2.0, _1831);
    float _1835 = as_type<float>(_1735);
    if (!_1618)
    {
        _1835 = _1630;
    }
    float _1837 = _1835;
    int _1839 = _1753 * _1821;
    int _1841 = _1839 + _1827;
    float _1843 = as_type<float>(_181) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1845 = -(*spvDescriptorSet0.vp_c9)._m0[123].w;
    float _1847 = (*spvDescriptorSet0.vp_c9)._m0[124].w + _1845;
    float _1849 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1851 = _1849 + (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1853 = !_1761;
    float _1855 = _1853 ? as_type<float>(_181) : as_type<float>(_1793);
    float _1857 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1859 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1861 = _1843 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _1863 = _1628 > 0.5;
    float _1865 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1857);
    float _1867 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1859);
    float _1869 = float(uint(_1841));
    float _1871 = fma(_1829, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1861);
    float _1873 = -_199;
    int _1875 = _1863 ? as_type<int>(_1873) : as_type<int>(_199);
    float _1877 = 1.0 / _1847;
    bool _1879 = _1630 > 0.5;
    float _1881 = as_type<float>(_1614) * _1869;
    bool _1883 = !_1801;
    float _1885 = _1883 ? _199 : as_type<float>(_1875);
    float _1887 = _1855 + (-0.5);
    float _1889 = -as_type<float>(_181);
    int _1891 = _1879 ? as_type<int>(_1889) : _181;
    bool _1893 = _1632 > 0.5;
    float _1895 = trunc(_1881);
    float _1897 = precise::max(_1895, 0.0);
    uint _1899 = uint(_1897);
    bool _1901 = !_1807;
    float _1903 = _1901 ? as_type<float>(_181) : as_type<float>(_1891);
    float _1905 = _1837;
    if (_1618)
    {
        _1905 = _1628;
    }
    float _1907 = _1905;
    float _1909 = 1.0 / _1851;
    float _1911 = _1574 * _1877;
    float _1913 = -(*spvDescriptorSet0.vp_c9)._m0[124].w;
    float _1915 = _749 + _1913;
    float _1917 = -(*spvDescriptorSet0.vp_c9)._m0[123].x;
    float _1919 = (*spvDescriptorSet0.vp_c9)._m0[124].x + _1917;
    float _1921 = -(*spvDescriptorSet0.vp_c9)._m0[124].x;
    float _1923 = _1921 + (*spvDescriptorSet0.vp_c9)._m0[125].x;
    float _1925 = fma(_1919, _1911, (*spvDescriptorSet0.vp_c9)._m0[123].x);
    float _1927 = -_199;
    int _1929 = _1893 ? as_type<int>(_1927) : as_type<int>(_199);
    bool _1931 = !_1811;
    float _1933 = _1931 ? _199 : as_type<float>(_1929);
    int _1935 = ~_1580;
    int _1937 = _1935 + 1;
    float _1939 = _1915 * _1909;
    float _1941 = _1933 + 0.5;
    int _1943 = _1937 * int(_1899);
    int _1945 = _1943 + _1841;
    float _1947 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1949 = float(uint(_1945));
    float _1951 = fma(_1630, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1947);
    float _1953 = -(*spvDescriptorSet0.vp_c9)._m0[123].y;
    float _1955 = (*spvDescriptorSet0.vp_c9)._m0[124].y + _1953;
    float _1957 = -(*spvDescriptorSet0.vp_c9)._m0[123].z;
    float _1959 = (*spvDescriptorSet0.vp_c9)._m0[124].z + _1957;
    float _1961 = -(*spvDescriptorSet0.vp_c9)._m0[124].y;
    float _1963 = _1961 + (*spvDescriptorSet0.vp_c9)._m0[125].y;
    float _1965 = as_type<float>(_1614) * _1949;
    float _1967 = fma(_1955, _1911, (*spvDescriptorSet0.vp_c9)._m0[123].y);
    float _1969 = fma(_1959, _1911, (*spvDescriptorSet0.vp_c9)._m0[123].z);
    bool _1971 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[125].w;
    bool _1973 = isnan(_749);
    bool _1975 = _1971 || _1973;
    bool _1977 = isnan((*spvDescriptorSet0.vp_c9)._m0[125].w);
    bool _1979 = _1975 || _1977;
    float _1981 = float(_1979);
    float _1983 = -(*spvDescriptorSet0.vp_c9)._m0[124].z;
    float _1985 = _1983 + (*spvDescriptorSet0.vp_c9)._m0[125].z;
    bool _1987 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[124].w;
    bool _1989 = isnan(_749);
    bool _1991 = _1987 || _1989;
    bool _1993 = isnan((*spvDescriptorSet0.vp_c9)._m0[124].w);
    bool _1995 = _1991 || _1993;
    float _1997 = float(_1995);
    float _1999 = trunc(_1965);
    float _2001 = precise::max(_1999, 0.0);
    uint _2003 = uint(_2001);
    float _2005 = fma(_1923, _1939, (*spvDescriptorSet0.vp_c9)._m0[124].x);
    float _2007 = -_1981;
    float _2009 = _2007 + 1.0;
    float _2011 = fma(_1963, _1939, (*spvDescriptorSet0.vp_c9)._m0[124].y);
    float _2013 = fma(_1985, _1939, (*spvDescriptorSet0.vp_c9)._m0[124].z);
    float _2015 = _1997 * _2009;
    bool _2017 = _749 >= (*spvDescriptorSet0.vp_c9)._m0[123].w;
    bool _2019 = isnan(_749);
    bool _2021 = _2017 || _2019;
    bool _2023 = isnan((*spvDescriptorSet0.vp_c9)._m0[123].w);
    bool _2025 = _2021 || _2023;
    float _2027 = float(_2025);
    float _2029 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2031 = -_1997;
    float _2033 = _2031 + 1.0;
    float _2035 = fma(_1681, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2029);
    float _2037 = -_113;
    float _2039 = fma(_2037, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1833);
    float _2041 = _1885 + 0.5;
    float _2043 = _2027 * _2033;
    int _2045 = int(_1899) + int(_2003);
    float _2047 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2035);
    float _2049 = fma(_2041, (*spvDescriptorSet0.vp_c9)._m0[80].x, _2039);
    float _2051 = float(uint(_1797));
    float _2053 = _1925 * _2043;
    int _2055 = _1606 * _2045;
    int _2057 = _2055 + _1841;
    float _2059 = _1967 * _2043;
    float _2061 = as_type<float>(_1614) * _2051;
    float _2063 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1813);
    float _2065 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    bool _2067 = uint(_2057) >= uint(_1580);
    float _2069 = _1903 + (-0.5);
    float _2071 = _1969 * _2043;
    float _2073 = trunc(_2061);
    float _2075 = precise::max(_2073, 0.0);
    uint _2077 = uint(_2075);
    bool _2079 = !_2067;
    int _2081 = _2079 ? 0 : (-1);
    float _2083 = fma(_1907, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2065);
    float _2085 = _1907 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2087 = -_2069;
    float _2089 = -_2063;
    float _2091 = fma(_2087, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2089);
    int _2093 = ~_2045;
    int _2095 = _2093 + _2081;
    int _2097 = _2095 + 1;
    float _2099 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2083);
    float _2101 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2103 = ~_1580;
    int _2105 = _2103 + 1;
    int _2107 = _1580 * _2097;
    int _2109 = _2107 + _1841;
    float _2111 = -_2027;
    float _2113 = _2111 + 1.0;
    float _2115 = fma(_1683, -2.0, _2101);
    float _2117 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2119 = abs(_1081);
    float _2121 = log2(_2119);
    bool _2123 = !_1719;
    int _2125 = _2123 ? _2109 : (-1);
    int _2127 = _2105 * int(_2077);
    int _2129 = _2127 + _1797;
    float _2131 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[123].z, _2071);
    float _2133 = -_2117;
    float _2135 = fma(_2085, 2.0, _2133);
    int _2137 = _2125 >> 31;
    float _2139 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[123].x, _2053);
    float _2141 = float(uint(_2129));
    float _2143 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    int _2145 = _2137 & 3;
    float _2147 = fma(_2113, (*spvDescriptorSet0.vp_c9)._m0[123].y, _2059);
    float _2149 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1651);
    float _2151 = as_type<float>(_1614) * _2141;
    int _2153 = _2125 + _2145;
    float _2155 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1951);
    float _2157 = -_113;
    float _2159 = fma(_2157, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2135);
    float _2161 = trunc(_2151);
    float _2163 = precise::max(_2161, 0.0);
    uint _2165 = uint(_2163);
    int _2167 = _2153 >> 2;
    float _2169 = fma(_2005, _2015, _2139);
    float _2171 = fma(_113, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2115);
    float _2173 = _2121 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2175 = _2167 << 4;
    int _2177 = _2175 + 368;
    float _2179 = fma(_2011, _2015, _2147);
    int _2181 = _2125 & 3;
    bool _2183 = _2181 != 0;
    float _2185 = _2143 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _2187 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    uint _2189 = uint(int(uint(_2177) >> uint(2)));
    uint _2191 = uint(int(uint(int(_2189)) >> uint(2)));
    int _2193 = int(_2189) & 3;
    float _2195 = (*spvDescriptorSet0.vp_c9)._m0[int(_2191)][_2193];
    int _2197 = int(_2189) + 1;
    uint _2199 = uint(int(uint(_2197) >> uint(2)));
    int _2201 = _2197 & 3;
    float _2203 = (*spvDescriptorSet0.vp_c9)._m0[int(_2199)][_2201];
    float _2205 = fma(_2013, _2015, _2131);
    bool _2207 = uint(_2181) > 1u;
    float _2209 = fma(_1981, (*spvDescriptorSet0.vp_c9)._m0[125].y, _2179);
    int _2211 = _2125 & 3;
    bool _2213 = _2211 != 0;
    float _2215 = -_2149;
    float _2217 = _2215 + 1.0;
    bool _2219 = _2181 != 3;
    float _2221 = exp2(_2173);
    int _2223 = _2177 + 8;
    uint _2225 = uint(int(uint(_2223) >> uint(2)));
    uint _2227 = uint(int(uint(int(_2225)) >> uint(2)));
    int _2229 = int(_2225) & 3;
    float _2231 = (*spvDescriptorSet0.vp_c9)._m0[int(_2227)][_2229];
    int _2233 = int(_2225) + 1;
    uint _2235 = uint(int(uint(_2233) >> uint(2)));
    int _2237 = _2233 & 3;
    float _2239 = (*spvDescriptorSet0.vp_c9)._m0[int(_2235)][_2237];
    int _2241 = ~_1580;
    int _2243 = _2241 + 1;
    float _2245 = fma(_1981, (*spvDescriptorSet0.vp_c9)._m0[125].x, _2169);
    int _2247 = int(_2077) + int(_2165);
    float _2249 = fma(_1981, (*spvDescriptorSet0.vp_c9)._m0[125].z, _2205);
    int _2251 = _2213 ? 0 : 1;
    float _2253 = fma(_2185, _1941, _2159);
    bool _2255 = uint(_2181) >= 2u;
    float _2257 = _2187 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    int _2259 = _2243 * _2247;
    int _2261 = _2259 + _1797;
    int _2263 = ~_2251;
    int _2265 = _2263 + 1;
    int _2267 = _2265 + 1;
    float _2269 = -_2155;
    float _2271 = _2269 + 1.0;
    int _2273 = _2255 ? 0 : 1;
    float _2275 = -_2257;
    float _2277 = -_2171;
    float _2279 = fma(_2275, _1887, _2277);
    int _2281 = _2267;
    if (!_2207)
    {
        int _2283 = ~_2251;
        int _2285 = _2283 + 1;
        _2281 = _2285;
    }
    int _2287 = _2281;
    float _2289 = -_2099;
    float _2291 = _2289 + 1.0;
    bool _2293 = uint(_2261) >= uint(_1580);
    float _2295 = -_2047;
    float _2297 = _2295 + 1.0;
    int _2299 = ~_2273;
    int _2301 = _2299 + 1;
    int _2303 = _2301 + 1;
    float _2305 = -_1539;
    float _2307 = _2305 + 1.0;
    int _2309 = _2303;
    float _2311 = _1550;
    if (_2219)
    {
        int _2313 = ~_2273;
        int _2315 = _2313 + 1;
        _2309 = _2315;
    }
    int _2317 = _2309;
    float _2319 = fma(_1903, _2271, _2091);
    bool _2321 = !_2183;
    int _2323 = _2321 ? 0 : 1;
    float _2325 = -_2291;
    float _2327 = fma(_1933, _2325, _2253);
    bool _2329 = _2181 != 3;
    float _2331 = fma(_1855, _2297, _2279);
    int _2333 = abs(_2287);
    bool _2335 = !_2293;
    int _2337 = _2335 ? 0 : (-1);
    int _2339 = abs(_2317);
    int _2341 = ~_2333;
    int _2343 = _2341 + 1;
    int _2345 = _2343 + 1;
    int _2347 = ~_2247;
    int _2349 = _2347 + _2337;
    int _2351 = _2349 + 1;
    int _2353 = abs(_2323);
    int _2355 = _1580 * _2351;
    int _2357 = _2355 + _1797;
    int _2359 = _2345 * as_type<int>(_2203);
    int _2361 = ~_2339;
    int _2363 = _2361 + 1;
    int _2365 = _2363 + 1;
    float _2367 = _1421 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _2369 = !_2329;
    int _2371 = _2369 ? 0 : (-1);
    float _2373 = fma(_2221, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2375 = precise::clamp(_2373, 0.0, 1.0);
    float _2377 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2367);
    int _2379 = abs(_2371);
    int _2381 = ~_2353;
    int _2383 = _2381 + 1;
    int _2385 = _2383 + 1;
    float _2387 = fma(_1427, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2377);
    float _2389 = _1441 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2391 = fma(_2375, -2.0, 3.0);
    int _2393 = _2385 * as_type<int>(_2195);
    int _2395 = _2393 + _2359;
    float _2397 = _2375 * _2375;
    int _2399 = ~_2379;
    int _2401 = _2399 + 1;
    int _2403 = _2401 + 1;
    float _2405 = fma(_1451, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2387);
    int _2407 = _2365 * as_type<int>(_2231);
    int _2409 = _2407 + _2395;
    bool _2411 = !_1771;
    int _2413 = _2411 ? 0 : 1;
    float _2415 = exp2(_2389);
    float _2417 = _2397 * _2391;
    int _2419 = _2403 * as_type<int>(_2239);
    int _2421 = _2419 + _2409;
    int _2423 = abs(_2413);
    float _2425 = -_2217;
    float _2427 = fma(_1885, _2425, _2049);
    float _2429 = -_2417;
    float _2431 = _2429 + 1.0;
    float _2433 = in.m_70.x;
    int _2435 = ~_2423;
    int _2437 = _2435 + 1;
    int _2439 = _2437 + 1;
    bool _2441 = _1081 <= 8000.0;
    bool _2443 = isnan(_1081);
    bool _2445 = _2441 || _2443;
    bool _2447 = isnan(8000.0);
    bool _2449 = _2445 || _2447;
    float _2451 = float(_2449);
    float _2453 = fma(_2431, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2417);
    bool _2455 = !_1719;
    int _2457 = _2455 ? _2357 : (-1);
    int _2459 = _2421 * _2439;
    float _2461 = _2245 * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _2463 = _2451 * _2453;
    float _2465 = -_2415;
    float _2467 = _2465 + 1.0;
    int _2469 = _2457 * _2423;
    int _2471 = _2469 + _2459;
    float _2473 = _2463 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2475 = _2209 * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _2477 = _2249 * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _2479 = _2467 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2481 = _2307 * _2473;
    float _2483 = precise::clamp(_2481, 0.0, 1.0);
    float _2485 = _2461 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2487 = _2475 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2489 = _2477 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _2491 = _2479 * _1541;
    float _2493 = -_2483;
    float _2495 = fma(_2493, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    out.m_72.x = _2427;
    out.m_72.y = _2319;
    out.m_72.z = _2327;
    out.m_72.w = _2331;
    float _2497 = float(_2471);
    float _2499 = _1471 * 0.5;
    float _2501 = _2495 * _2433;
    out.m_74.x = _2485;
    out.m_74.y = _2487;
    out.m_74.z = _2489;
    bool _2503 = _1233 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2505 = isnan(_1233);
    bool _2507 = _2503 || _2505;
    bool _2509 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2511 = _2507 || _2509;
    float _2513 = _2501 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.gl_Position.x = _1519;
    out.gl_Position.y = _1521;
    out.gl_Position.z = _2405;
    out.gl_Position.w = _1471;
    out.m_76.x = _2497;
    float _2515 = _1519 + _1471;
    float _2517 = _2405 + _1471;
    float _2519 = _1552 * _2491;
    float _2521 = _1562 * _2491;
    float _2523 = fma(_1521, -0.5, _2499);
    out.m_78.x = _2513;
    float _2525 = fma(_1558, _2519, _1546);
    float _2527 = fma(_1560, _2519, _1548);
    float _2529 = -_2479;
    float _2531 = _2529 + 1.0;
    float _2533 = fma(_1552, _2521, _1550);
    float _2535 = _1867 + (*spvDescriptorSet0.vp_c8)._m0[25].z;
    float _2537 = _1871 + (*spvDescriptorSet0.vp_c8)._m0[26].z;
    float _2539 = _1552 * _2531;
    float _2541 = _1865 + (*spvDescriptorSet0.vp_c8)._m0[24].z;
    float _2543 = _2517 * 0.5;
    float _2545 = _2515 * 0.5;
    out.m_80.x = _2525;
    out.m_80.y = _2527;
    out.m_80.z = _2533;
    out.m_80.w = _2539;
    float _2547 = _1207 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2549 = _1471;
    float _2551 = _2543;
    float _2553 = _2523;
    float _2555 = _2545;
    if (!_2511)
    {
        _2311 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2557 = _2311;
    out.m_82.x = _2541;
    out.m_82.y = _2535;
    out.m_82.z = _2537;
    float _2559 = _2557;
    float _2561 = _2557;
    if (!_2511)
    {
        _1661 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2563 = _1661;
    out.m_84.x = _2545;
    out.m_84.y = _2523;
    out.m_84.z = _2543;
    out.m_84.w = _1471;
    float _2565 = _2563;
    float _2567 = _2563;
    if (!_2511)
    {
        _2549 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2569 = _2549;
    float _2571 = _2569;
    float _2573 = _2569;
    if (!_2511)
    {
        _2551 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2575 = _2551;
    float _2577 = _2575;
    float _2579 = _2575;
    if (!_2511)
    {
        _2553 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2581 = _2553;
    float _2583 = _2581;
    float _2585 = _2581;
    if (!_2511)
    {
        _2555 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2587 = _2555;
    bool _2589 = !_2511;
    float _2591 = _2587;
    float _2593 = _2587;
    if (!_2589)
    {
        bool _2595 = _1233 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2597 = isnan(_1233);
        bool _2599 = _2595 || _2597;
        bool _2601 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2603 = _2599 || _2601;
        if (!_2603)
        {
            float _2605 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2607 = _1233 + _2605;
            float _2609 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2611 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2609;
            float _2613 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2615 = _2613 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2617 = 1.0 / _2611;
            float _2619 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2621 = _2619 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2623 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2625 = _2623 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2627 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2629 = _2627 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2631 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2633 = _2631 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2635 = _2607 * _2617;
            float _2637 = precise::clamp(_2635, 0.0, 1.0);
            float _2639 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2641 = _2639 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2643 = fma(_2637, _2615, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2645 = fma(_2637, _2641, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2647 = fma(_2637, _2621, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2649 = fma(_2637, _2625, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2651 = fma(_2637, _2629, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2653 = fma(_2637, _2633, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2573 = _2645;
            _2593 = _2651;
            _2561 = _2643;
            _2585 = _2649;
            _2579 = _2647;
            _2567 = _2653;
            _2655 = true;
        }
        else
        {
            bool _2657 = _1233 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2659 = isnan(_1233);
            bool _2661 = _2657 || _2659;
            bool _2663 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2665 = _2661 || _2663;
            if (!_2665)
            {
                _2559 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2667 = _2559;
            _2561 = _2667;
            if (!_2665)
            {
                _2571 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2669 = _2571;
            _2573 = _2669;
            if (!_2665)
            {
                _2577 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2671 = _2577;
            _2579 = _2671;
            if (!_2665)
            {
                _2583 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2673 = _2583;
            _2585 = _2673;
            if (!_2665)
            {
                _2591 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2675 = _2591;
            _2593 = _2675;
            if (!_2665)
            {
                _2565 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2677 = _2565;
            bool _2679 = !_2665;
            _2567 = _2677;
            if (!_2679)
            {
                bool _2681 = _1233 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2683 = isnan(_1233);
                bool _2685 = _2681 || _2683;
                bool _2687 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2689 = _2685 || _2687;
                if (!_2689)
                {
                    float _2691 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2693 = _1233 + _2691;
                    float _2695 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2697 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2695;
                    float _2699 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2701 = _2699 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2703 = 1.0 / _2697;
                    float _2705 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2707 = _2705 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2709 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2711 = _2709 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2713 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2715 = _2713 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2717 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2719 = _2717 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2721 = _2693 * _2703;
                    float _2723 = precise::clamp(_2721, 0.0, 1.0);
                    float _2725 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2727 = _2725 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2729 = fma(_2723, _2701, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2731 = fma(_2723, _2727, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2733 = fma(_2723, _2707, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2735 = fma(_2723, _2711, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2737 = fma(_2723, _2715, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2739 = fma(_2723, _2719, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2573 = _2731;
                    _2593 = _2737;
                    _2561 = _2729;
                    _2585 = _2735;
                    _2579 = _2733;
                    _2567 = _2739;
                    _2655 = true;
                }
                else
                {
                    _2573 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2593 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2561 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2585 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2579 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2567 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2655 = false;
    float _2741 = _2573;
    float _2743 = _2593;
    float _2745 = _2561;
    float _2747 = _2585;
    float _2749 = _2579;
    float _2751 = _2567;
    float _2753 = fma(_2535, -0.5, 0.5);
    float _2755 = precise::clamp(_2753, 0.0, 1.0);
    float _2757 = -_2741;
    float _2759 = _2757 + _2743;
    float _2761 = _2547 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2763 = -_2745;
    float _2765 = _2763 + _2747;
    out.m_86.x = 0.0;
    float _2767 = fma(_2755, _2759, _2741);
    float _2769 = fma(_2755, _2765, _2745);
    out.m_53.x = _2761;
    float _2771 = -_2749;
    float _2773 = _2771 + _2751;
    float _2775 = _2767 * 0.586610972881317138671875;
    bool _2777 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2779 = fma(_2755, _2773, _2749);
    float _2781 = fma(_2769, 0.298911988735198974609375, _2775);
    bool _2783 = _1207 > 0.0;
    bool _2785 = isnan(_1207);
    bool _2787 = _2783 || _2785;
    bool _2789 = isnan(0.0);
    bool _2791 = _2787 || _2789;
    float _2793 = fma(_2779, 0.114477999508380889892578125, _2781);
    float _2795 = -_2793;
    float _2797 = _2769 + _2795;
    float _2799 = -_2793;
    float _2801 = _2767 + _2799;
    float _2803 = -_2793;
    float _2805 = _2779 + _2803;
    float _2807 = fma(_2797, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2793);
    float _2809 = fma(_2801, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2793);
    float _2811 = fma(_2805, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2793);
    bool _2813 = !_2777;
    if (!_2813)
    {
        float _2815 = -_1147;
        float _2817 = _2815 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2819 = -_1149;
        float _2821 = _2819 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2823 = -_1151;
        float _2825 = _2823 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2827 = _2817 * _2817;
        float _2829 = fma(_2821, _2821, _2827);
        float _2831 = fma(_2825, _2825, _2829);
        float _2833 = sqrt(_2831);
        float _2835 = rsqrt(_2831);
        float _2837 = -_2833;
        float _2839 = _2837 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2841 = _2839 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2843 = precise::clamp(_2841, 0.0, 1.0);
        float _2845 = _2821 * _2835;
        float _2847 = _2817 * _2835;
        float _2849 = abs(_2843);
        float _2851 = log2(_2849);
        float _2853 = _2825 * _2835;
        float _2855 = _2845 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2857 = _2535 * _2847;
        float _2859 = -_2847;
        float _2861 = -_2855;
        float _2863 = fma(_2859, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2861);
        float _2865 = fma(_2541, _2845, _2857);
        float _2867 = -_2853;
        float _2869 = fma(_2867, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2863);
        float _2871 = fma(_2537, _2853, _2865);
        float _2873 = precise::clamp(_2871, 0.0, 1.0);
        float _2875 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2877 = _2869 + _2875;
        float _2879 = _2851 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2881 = _2877 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2883 = precise::clamp(_2881, 0.0, 1.0);
        float _2885 = exp2(_2879);
        float _2887 = _2885 * _2883;
        float _2889 = _2873 * _2887;
        float _2891 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2893 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2895 = _2889 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2891;
        out.m_86.y = _2893;
        out.m_86.z = _2895;
    }
    out.m_88.x = _2807;
    out.m_88.y = _2809;
    out.m_88.z = _2811;
    if (_2791)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.dm_pad3.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.dm_pad3.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.dm_pad3.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.dm_pad3.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _2897 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2897;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.dm_pad3.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.dm_pad3.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.dm_pad3.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.dm_pad3.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

