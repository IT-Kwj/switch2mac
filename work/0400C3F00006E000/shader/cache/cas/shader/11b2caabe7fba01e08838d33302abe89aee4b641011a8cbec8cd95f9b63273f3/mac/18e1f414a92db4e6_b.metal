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
    float4 m_65 [[user(locn0)]];
    float4 m_63 [[user(locn1)]];
    float4 m_78 [[user(locn2)]];
    float4 m_96 [[user(locn3)]];
    float4 m_92 [[user(locn4)]];
    float4 m_94 [[user(locn5)]];
    float4 m_51 [[user(locn6)]];
    float4 m_76 [[user(locn7)]];
    float4 m_82 [[user(locn8)]];
    float4 m_72 [[user(locn9)]];
    float4 m_74 [[user(locn10)]];
    float4 m_88 [[user(locn11)]];
    float4 m_53 [[user(locn12)]];
    float4 m_57 [[user(locn13)]];
    float4 m_80 [[user(locn14)]];
    float4 m_86 [[user(locn15)]];
    float4 m_90 [[user(locn16)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_84 [[attribute(0)]];
    float4 m_67 [[attribute(1)]];
    float4 m_59 [[attribute(2)]];
    float4 m_46 [[attribute(3)]];
    float4 m_48 [[attribute(4)]];
    float4 m_55 [[attribute(5)]];
    float4 m_61 [[attribute(6)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3199 = false;
    bool _523 = false;
    bool _417 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = in.m_48.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = _112;
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_53.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3515 = as_type<float>(_139);
        out.gl_Position.z = _3515;
    }
    if (!_125)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = in.m_55.x;
    float _155 = float(_117);
    bool _157 = _121 >= _155;
    bool _159 = !_151;
    bool _161 = _157 || _159;
    float _163 = 1.0 / _155;
    if (_161)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _129;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    float _167 = _121 * _163;
    float _169 = _167;
    if (_161)
    {
        float _171 = _165 * 5.0;
        _141 = as_type<int>(_171);
    }
    int _173 = _141;
    out.m_57.x = _153;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3580 = as_type<float>(_173);
        out.gl_Position.z = _3580;
    }
    out.m_51.x = _167;
    if (_161)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _175 = in.m_59.x;
    float _177 = in.m_59.y;
    float _179 = in.m_59.z;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _177 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _177 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _177 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _189 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _191 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _193 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    float _195 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].z, _189);
    float _197 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].z, _191);
    float _199 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    bool _201 = !_181;
    float _203 = _197;
    float _205 = _199;
    float _221;
    if (!_201)
    {
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        _221 = _167;
    }
    _223 = false;
    float _225 = _221;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = _225 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = _225 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _243;
    float _247 = 1.0 / _241;
    bool _249 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _251 = isnan(_225);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _263 = 1.0 / _237;
    bool _265 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _267 = isnan(_225);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = 1.0 / _245;
    float _279 = _229 * _263;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _225 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = _283 * _247;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _291;
    float _295 = fma(_287, _279, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _297 = _233 * _277;
    bool _299 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_225);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = fma(_293, _279, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _313 = -_275;
    float _315 = _313 + 1.0;
    float _317 = -_259;
    float _319 = _317 + 1.0;
    bool _321 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _323 = isnan(_225);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = _309 * _315;
    float _339 = -_309;
    float _341 = _339 + 1.0;
    float _343 = _275 * _319;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = fma(_335, _289, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _351 = _331 * _341;
    float _353 = in.m_61.x;
    float _355 = in.m_61.y;
    float _357 = fma(_347, _289, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _359 = _295 * _351;
    float _361 = -_331;
    float _363 = _361 + 1.0;
    float _365 = _311 * _351;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _371;
    float _375 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    float _377 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _379 = fma(_369, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _381 = fma(_373, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _383 = fma(_349, _337, _375);
    float _385 = fma(_357, _337, _377);
    float _387 = fma(_379, _343, _383);
    float _389 = fma(_381, _343, _385);
    float _391 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[146].x, _387);
    float _393 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[146].y, _389);
    float _395 = _391 * _353;
    float _397 = _393 * _355;
    bool _399 = !_261;
    float _415;
    if (!_399)
    {
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _403 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _415 = _413;
        _417 = true;
    }
    else
    {
        _415 = _167;
    }
    _417 = false;
    float _419 = _415;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _423 = _419 + _421;
    bool _425 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _427 = isnan(_419);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _437;
    bool _441 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _443 = isnan(_419);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -_435;
    float _455 = _453 + 1.0;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _457;
    float _461 = 1.0 / _439;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _465 = _451 * _455;
    float _467 = -_451;
    float _469 = _467 + 1.0;
    float _471 = _423 * _461;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _473;
    float _477 = fma(_459, _471, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _479;
    float _483 = fma(_475, _471, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _485 = _477 * _465;
    float _487 = fma(_481, _471, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _489 = _483 * _465;
    float _491 = _487 * _465;
    float _493 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[107].x, _485);
    float _495 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[107].y, _491);
    float _497 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[107].z, _489);
    float _499 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[108].x, _493);
    float _501 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[108].y, _495);
    float _503 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[108].z, _497);
    bool _505 = !_463;
    float _521;
    if (!_505)
    {
        float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _509 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _511 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _513 = _511 * _507;
        float _515 = floor(_513);
        float _517 = -_515;
        float _519 = _513 + _517;
        _521 = _519;
        _523 = true;
    }
    else
    {
        _521 = _167;
    }
    _523 = false;
    float _525 = _521;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _529 = _525 + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _539 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _541 = isnan(_525);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _555 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _557 = isnan(_525);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = 1.0 / _533;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _569;
    float _573 = -_549;
    float _575 = _573 + 1.0;
    bool _577 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _579 = isnan(_525);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    bool _589 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _591 = 1.0 / _537;
    float _593 = 1.0 / _553;
    float _595 = _571 * _567;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _601 = _565 * _575;
    float _603 = -_565;
    float _605 = _603 + 1.0;
    float _607 = fma(_595, _529, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _609;
    float _613 = _587 * _605;
    float _615 = _599 * _591;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _619 = _525 + _617;
    bool _621 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _623 = isnan(_525);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = _607 * _613;
    float _635 = -_587;
    float _637 = _635 + 1.0;
    float _639 = fma(_615, _619, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _643 = _525 + _641;
    float _645 = _611 * _593;
    float _647 = -_631;
    float _649 = _647 + 1.0;
    float _651 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[115].x, _633);
    float _653 = _499 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _655 = fma(_645, _643, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _657 = _549 * _649;
    float _659 = fma(_639, _601, _651);
    float _661 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = fma(_655, _657, _659);
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _667 = _501 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _669 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[118].x, _663);
    float _671 = _503 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _675 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _681 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _685 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _685;
    out.m_63.y = _687;
    out.m_63.z = _675;
    out.m_63.w = _683;
    out.m_65.x = _661;
    out.m_65.y = _677;
    out.m_65.z = _681;
    out.m_65.w = _689;
    bool _691 = !_589;
    if (!_691)
    {
        float _693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _695 = _153 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[14].x, _121);
        float _699 = _697 * _693;
        float _701 = floor(_699);
        float _703 = -_701;
        float _705 = _699 + _703;
        _169 = _705;
    }
    float _707 = _169;
    float _709 = in.m_55.z;
    float _711 = _153 * 2.0;
    float _713 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _715 = log2(_713);
    float _717 = in.m_55.y;
    float _719 = _153 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _721 = in.m_46.x;
    float _723 = in.m_46.y;
    float _725 = in.m_46.z;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _729 = floor(_711);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _733 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _735 = -_727;
    float _737 = fma(_719, 2.0, _735);
    float _739 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _741 = -_121;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[76].x, _737);
    float _745 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _747 = int(_745);
    float _749 = _709 * 2.0;
    bool _751 = _729 > 0.0;
    bool _753 = _729 >= 0.0;
    bool _755 = isnan(_729);
    bool _757 = _753 || _755;
    bool _759 = isnan(0.0);
    bool _761 = _757 || _759;
    float _763 = floor(_749);
    float _765 = _715 * _121;
    float _767 = _717 * 2.0;
    float _769 = _717 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _771 = _723 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _773 = _717 + _709;
    float _775 = _723 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _777 = fma(_769, -2.0, _731);
    float _779 = exp2(_765);
    float _781 = _723 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _785 = _783 != 0;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _789 = _787 != 0;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _793 = _791 != 0;
    float _795 = fma(_721, (*spvDescriptorSet0.vp_c10)._m0[6].x, _771);
    int _797 = _761 ? 0 : 1;
    float _799 = _773 + (-1.0);
    float _801 = fma(_721, (*spvDescriptorSet0.vp_c10)._m0[4].x, _775);
    float _803 = floor(_767);
    bool _805 = _763 > 0.0;
    float _807 = fma(_721, (*spvDescriptorSet0.vp_c10)._m0[5].x, _781);
    bool _809 = !_785;
    int _811 = _809 ? 0 : 1;
    float _813 = _153 + _717;
    bool _815 = _763 >= 0.0;
    bool _817 = isnan(_763);
    bool _819 = _815 || _817;
    bool _821 = isnan(0.0);
    bool _823 = _819 || _821;
    float _825 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _827 = float(_747);
    float _829 = fma(_725, (*spvDescriptorSet0.vp_c10)._m0[4].z, _801);
    float _831 = fma(_725, (*spvDescriptorSet0.vp_c10)._m0[5].z, _807);
    float _833 = -_779;
    float _835 = _833 + 1.0;
    bool _837 = !_789;
    int _839 = _837 ? 0 : 1;
    float _841 = _813 + (-1.0);
    float _843 = 1.0 / _827;
    bool _845 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _847 = isnan(0.0);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _853 = _849 || _851;
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _857 = _823 ? 0 : 1;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _861 = _803 > 0.0;
    float _863 = fma(_725, (*spvDescriptorSet0.vp_c10)._m0[6].z, _795);
    bool _865 = _803 >= 0.0;
    bool _867 = isnan(_803);
    bool _869 = _865 || _867;
    bool _871 = isnan(0.0);
    bool _873 = _869 || _871;
    float _875 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _877 = int(_875);
    float _879 = _831 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _881 = !_793;
    int _883 = _881 ? 0 : 1;
    float _885 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _777);
    int _887 = ~_857;
    int _889 = _887 + 1;
    int _891 = _889 + 1;
    float _893 = _829 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _895 = _853 ? _835 : 0.0;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _899 = _879 + _897;
    float _901 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[78].z, _859);
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _905 = _903 != 0;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _909 = _907 != 0;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _913 = _911 != 0;
    float _915 = _863 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _917 = _891;
    if (!_805)
    {
        int _919 = ~_857;
        int _921 = _919 + 1;
        _917 = _921;
    }
    int _923 = _917;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _927 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _929 = isnan(1.0);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _935 = _931 || _933;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _939 = 1.0 + _937;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _943 = _893 + _941;
    float _945 = _899 * _899;
    bool _947 = !_905;
    int _949 = _947 ? 0 : 1;
    float _951 = 1.0 / _939;
    float _953 = in.m_67.x;
    float _955 = in.m_67.y;
    float _957 = in.m_67.z;
    float _959 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[78].w, _925);
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _963 = _915 + _961;
    float _965 = fma(_943, _943, _945);
    int _967 = abs(_949);
    float _969 = _843 * _121;
    float _971 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _959);
    float _973 = fma(_963, _963, _965);
    bool _975 = !_909;
    int _977 = _975 ? 0 : 1;
    float _979 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _901);
    float _981 = sqrt(_973);
    float _983 = float(_877);
    int _985 = abs(_977);
    float _987 = float(_967);
    float _989 = _983 * _121;
    float _991 = float(_923);
    if (_935)
    {
        float _993 = _895 * _951;
        _131 = _993;
    }
    float _995 = _131;
    int _997 = ~_797;
    int _999 = _997 + 1;
    int _1001 = _999 + 1;
    float _1003 = _733 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1005 = _1001;
    if (!_751)
    {
        int _1007 = ~_797;
        int _1009 = _1007 + 1;
        _1005 = _1009;
    }
    int _1011 = _1005;
    float _1013 = _987 * _991;
    float _1015 = rsqrt(_973);
    int _1017 = _873 ? 0 : 1;
    float _1019 = _1013 * (-2.0);
    float _1021 = float(_1011);
    float _1023 = float(_985);
    float _1025 = fma(_1019, _953, _953);
    int _1027 = ~_1017;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    float _1033 = fma(_855, _1019, _855);
    int _1035 = _1031;
    if (!_861)
    {
        int _1037 = ~_1017;
        int _1039 = _1037 + 1;
        _1035 = _1039;
    }
    int _1041 = _1035;
    float _1043 = _1023 * _1021;
    float _1045 = _153 + (-0.5);
    float _1047 = _981 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    bool _1049 = !_913;
    int _1051 = _1049 ? 0 : 1;
    float _1053 = _1043 * (-2.0);
    float _1055 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1025);
    float _1057 = float(_1041);
    float _1059 = precise::min(_1003, _1047);
    float _1061 = fma(_825, _1053, _825);
    float _1063 = fma(_1053, _955, _955);
    float _1065 = fma(_1033, _995, _1055);
    int _1067 = abs(_1051);
    float _1069 = _1015 * _1059;
    float _1071 = _717 + (-0.5);
    float _1073 = _1065 * 0.15915493667125701904296875;
    float _1075 = float(_1067);
    float _1077 = _899 * _1069;
    float _1079 = _943 * _1069;
    float _1081 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1063);
    float _1083 = _153 + _709;
    float _1085 = -_1077;
    float _1087 = _899 + _1085;
    float _1089 = -_1079;
    float _1091 = _943 + _1089;
    float _1093 = _1075 * _1057;
    float _1095 = fma(_1061, _995, _1081);
    float _1097 = _1087 * _1087;
    float _1099 = _1083 + (-1.0);
    float _1101 = _1093 * (-2.0);
    float _1103 = fma(_1091, _1091, _1097);
    float _1105 = _963 * _1069;
    float _1107 = as_type<float>(int(gl_VertexIndex));
    float _1109 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1111 = fma(_1101, _957, _957);
    float _1113 = -_1105;
    float _1115 = _963 + _1113;
    float _1117 = _709 + (-0.5);
    float _1119 = fma(_1109, _1101, _1109);
    float _1121 = _1095 * 0.15915493667125701904296875;
    float _1123 = fma(_1115, _1115, _1103);
    float _1125 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1111);
    float _1127 = _1073 * 6.283185482025146484375;
    float _1129 = cos(_1127);
    float _1131 = fma(_1119, _995, _1125);
    float _1133 = _1131 * 0.15915493667125701904296875;
    float _1135 = sqrt(_1123);
    int _1137 = as_type<int>(_1107) & 1;
    bool _1139 = _1137 != 0;
    int _1141 = as_type<int>(_1107) & 2;
    bool _1143 = _1141 != 0;
    float _1145 = _1121 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    bool _1149 = !_1143;
    float _1151 = _1149 ? (-0.5) : 0.5;
    bool _1153 = !_1139;
    float _1155 = _1153 ? (-0.5) : 0.5;
    float _1157 = _1121 * 6.283185482025146484375;
    float _1159 = cos(_1157);
    float _1161 = _1015 * _1135;
    float _1163 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1151);
    float _1165 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1155);
    float _1167 = _739 * _1161;
    float _1169 = _733 * _1161;
    float _1171 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1173 = _1171 * 0.5;
    float _1175 = _1073 * 6.283185482025146484375;
    float _1177 = sin(_1175);
    float _1179 = _1167 * _1163;
    float _1181 = _1129 * _1147;
    float _1183 = _1169 * _1165;
    float _1185 = _1133 * 6.283185482025146484375;
    float _1187 = cos(_1185);
    float _1189 = _1129 * _1159;
    float _1191 = _1133 * 6.283185482025146484375;
    float _1193 = sin(_1191);
    float _1195 = _1177 * _1147;
    float _1197 = _1177 * _1159;
    float _1199 = _1129 * _1187;
    float _1201 = _1177 * _1187;
    float _1203 = _1159 * _1187;
    float _1205 = _1147 * _1187;
    float _1207 = _1199 * _1179;
    float _1209 = fma(_1193, _1189, _1195);
    float _1211 = -_1197;
    float _1213 = fma(_1193, _1181, _1211);
    float _1215 = -_1179;
    float _1217 = _1193 * _1215;
    float _1219 = -_1181;
    float _1221 = fma(_1193, _1197, _1219);
    float _1223 = fma(_1209, _1183, _1207);
    float _1225 = _1201 * _1179;
    float _1227 = fma(_1203, _1183, _1217);
    float _1229 = fma(_1193, _1195, _1189);
    float _1231 = fma(_1213, _1173, _1223);
    float _1233 = fma(_1221, _1183, _1225);
    float _1235 = fma(_1205, _1173, _1227);
    float _1237 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1239 = fma(_1229, _1173, _1233);
    float _1241 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1243 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1237);
    float _1245 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1241);
    float _1247 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1243);
    float _1249 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1245);
    float _1251 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1253 = _1249 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1255 = _915 + _1251;
    float _1257 = _893 + _1253;
    float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1261 = _1255 + _1259;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1265 = _1257 + _1263;
    float _1267 = _1261 * _1261;
    float _1269 = fma(_1265, _1265, _1267);
    float _1271 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1273 = sqrt(_1269);
    float _1275 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1271);
    float _1277 = -_1077;
    float _1279 = _879 + _1277;
    float _1281 = -_1105;
    float _1283 = _915 + _1281;
    float _1285 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1275);
    float _1287 = -_1079;
    float _1289 = _893 + _1287;
    float _1291 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1293 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1295 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1291);
    float _1297 = _879 + _1293;
    float _1299 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1295);
    bool _1301 = _1273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1303 = _1293;
    float _1305 = _1285;
    float _1307 = _1257;
    float _1309 = _1077;
    float _1311 = _1297;
    if (!_1301)
    {
        _1303 = _1255;
    }
    float _1313 = _1303;
    float _1315 = _1313;
    if (!_1301)
    {
        _1305 = _1297;
    }
    float _1317 = _1305;
    bool _1319 = !_1301;
    float _1321 = _1317;
    if (!_1319)
    {
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1327 = _1273 + _1325;
        float _1329 = rsqrt(_1269);
        float _1331 = _1327 * _1323;
        float _1333 = _1297 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1335 = _1331 * 0.15915493667125701904296875;
        float _1337 = _1335 * 6.283185482025146484375;
        float _1339 = cos(_1337);
        float _1341 = _1335 * 6.283185482025146484375;
        float _1343 = sin(_1341);
        float _1345 = _1339 + (-1.0);
        float _1347 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1349 = fma(_1343, _1333, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1351 = fma(_1297, _1339, _1347);
        float _1353 = _1329 * _1349;
        float _1355 = fma(_1265, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1357 = fma(_1261, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1321 = _1351;
        _1307 = _1355;
        _1315 = _1357;
    }
    float _1359 = _1321;
    float _1361 = _1307;
    float _1363 = _1315;
    float _1365 = -_879;
    float _1367 = _1365 + _1359;
    float _1369 = -_893;
    float _1371 = _1369 + _1361;
    float _1373 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1375 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1377 = _1367 * _1367;
    float _1379 = -_915;
    float _1381 = _1379 + _1363;
    float _1383 = 1.0 / _1373;
    float _1385 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1375);
    float _1387 = fma(_1371, _1371, _1377);
    float _1389 = -_1077;
    float _1391 = _1389 + _1359;
    float _1393 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1385);
    float _1395 = fma(_1381, _1381, _1387);
    float _1397 = -_1105;
    float _1399 = _1397 + _1363;
    float _1401 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1403 = sqrt(_1395);
    bool _1405 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1407 = isnan(0.5);
    bool _1409 = _1405 || _1407;
    bool _1411 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1413 = _1409 || _1411;
    float _1415 = _1401 + _1373;
    bool _1417 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1419 = isnan(0.5);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1425 = _1421 || _1423;
    float _1427 = _1415 * _1383;
    float _1429 = _1427 * 0.5;
    float _1431 = -_1079;
    float _1433 = _1431 + _1361;
    float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1437 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1435);
    float _1439 = 1.0 / _1437;
    bool _1441 = _1403 > 0.0;
    float _1443 = _1359;
    float _1445 = _1361;
    float _1447 = _1363;
    float _1449 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1451 = _1391;
    if (!_1441)
    {
        _1443 = _1433;
    }
    float _1453 = _1443;
    float _1455 = _1453;
    if (!_1441)
    {
        _1445 = _1391;
    }
    float _1457 = _1445;
    float _1459 = _1457;
    float _1461 = _1457;
    if (!_1441)
    {
        _1447 = _1399;
    }
    float _1463 = _1447;
    bool _1465 = !_1441;
    float _1467 = _1463;
    if (!_1465)
    {
        float _1469 = _197 * _197;
        float _1471 = fma(_195, _195, _1469);
        float _1473 = fma(_199, _199, _1471);
        float _1475 = rsqrt(_1395);
        float _1477 = sqrt(_1473);
        float _1479 = _1371 * _1475;
        float _1481 = _1367 * _1475;
        float _1483 = _1381 * _1475;
        bool _1485 = _1477 > 0.0;
        float _1487 = _1477;
        float _1489 = _1475;
        if (!_1485)
        {
            _1487 = _1433;
        }
        float _1491 = _1487;
        _1455 = _1491;
        if (!_1485)
        {
            _1459 = _1391;
        }
        float _1493 = _1459;
        _1461 = _1493;
        if (!_1485)
        {
            _1489 = _1399;
        }
        float _1495 = _1489;
        bool _1497 = !_1485;
        _1467 = _1495;
        if (!_1497)
        {
            float _1499 = rsqrt(_1473);
            float _1501 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1503 = _197 * _1499;
            float _1505 = _195 * _1499;
            float _1507 = _199 * _1499;
            float _1509 = _1481 * _1503;
            float _1511 = fma(_1479, _1505, _1509);
            float _1513 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1515 = fma(_1483, _1507, _1511);
            float _1517 = _1515 * _1513;
            float _1519 = fma(_195, _1517, _1433);
            float _1521 = fma(_197, _1517, _1391);
            float _1523 = fma(_199, _1517, _1399);
            _1455 = _1519;
            _1461 = _1521;
            _1467 = _1523;
        }
    }
    float _1525 = _1455;
    float _1527 = _1461;
    float _1529 = _1467;
    float _1531 = _1525;
    float _1533 = _1529;
    if (_1425)
    {
        _1449 = 1.0;
    }
    float _1535 = _1449;
    float _1537 = _1535;
    if (_1413)
    {
        _203 = _1525;
    }
    float _1539 = _203;
    float _1541 = _1539;
    if (_1413)
    {
        _205 = _1527;
    }
    float _1543 = _205;
    float _1545 = _1543;
    if (!_1413)
    {
        float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1549 = _1279 + _1547;
        float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1553 = _1289 + _1551;
        float _1555 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1557 = -_1289;
        float _1559 = _1557 + _1525;
        float _1561 = _1549 * _1549;
        float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1565 = _1283 + _1563;
        float _1567 = -_1279;
        float _1569 = _1567 + _1527;
        float _1571 = fma(_1553, _1553, _1561);
        float _1573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1575 = fma(_1565, _1565, _1571);
        float _1577 = sqrt(_1575);
        float _1579 = _1555 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1581 = -_1283;
        float _1583 = _1581 + _1529;
        float _1585 = precise::min(_1577, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1587 = _1585 * _1573;
        float _1589 = _1579 * _1587;
        float _1591 = fma(_1559, _1589, _1289);
        float _1593 = fma(_1569, _1589, _1279);
        float _1595 = fma(_1583, _1589, _1283);
        _1531 = _1559;
        _1545 = _1593;
        _1541 = _1591;
        _1533 = _1595;
    }
    float _1597 = _1531;
    float _1599 = _1545;
    float _1601 = _1541;
    float _1603 = _1533;
    float _1605 = _1597;
    if (_1425)
    {
        _1605 = 1.0;
    }
    float _1607 = _1605;
    float _1609 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1611 = _1439 * _1609;
    float _1613 = _1607;
    if (!_1425)
    {
        float _1615 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1617 = _1615 * 0.15915493667125701904296875;
        float _1619 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1621 = _1617 * 6.283185482025146484375;
        float _1623 = cos(_1621);
        float _1625 = _1619 * 0.15915493667125701904296875;
        float _1627 = _1617 * 6.283185482025146484375;
        float _1629 = sin(_1627);
        float _1631 = 1.0 / _1623;
        float _1633 = _1625 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        float _1637 = _1629 * _1631;
        float _1639 = _1625 * 6.283185482025146484375;
        float _1641 = sin(_1639);
        float _1643 = _1635 * _1637;
        float _1645 = 1.0 / _1643;
        float _1647 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1649 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1647;
        float _1651 = 1.0 / _1649;
        float _1653 = _1641 * _1645;
        float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1657 = fma(_1611, _1653, _1655);
        float _1659 = _1657 * _1651;
        float _1661 = precise::clamp(_1659, 0.0, 1.0);
        _1451 = _1625;
        _1309 = _1617;
        _1537 = _1661;
    }
    float _1663 = _1451;
    float _1665 = _1309;
    float _1667 = _1537;
    float _1669 = _1663;
    float _1671 = _1665;
    if (!_1425)
    {
        float _1673 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1675 = _1673 * 0.15915493667125701904296875;
        float _1677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1679 = _1675 * 6.283185482025146484375;
        float _1681 = cos(_1679);
        float _1683 = _1677 * 0.15915493667125701904296875;
        float _1685 = _1675 * 6.283185482025146484375;
        float _1687 = sin(_1685);
        float _1689 = 1.0 / _1681;
        float _1691 = _1683 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        float _1695 = _1687 * _1689;
        float _1697 = _1683 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        float _1701 = _1693 * _1695;
        float _1703 = 1.0 / _1701;
        float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1707 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1705;
        float _1709 = 1.0 / _1707;
        float _1711 = _1699 * _1703;
        float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1715 = fma(_1611, _1711, _1713);
        float _1717 = _1715 * _1709;
        float _1719 = precise::clamp(_1717, 0.0, 1.0);
        float _1721 = -_1719;
        float _1723 = _1721 + 1.0;
        _1669 = _1701;
        _1671 = _1711;
        _1613 = _1723;
    }
    float _1725 = _1669;
    float _1727 = _1671;
    float _1729 = _1613;
    float _1731 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1733 = _1599 + _1731;
    float _1735 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1737 = _1601 + _1735;
    float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1741 = _1603 + _1739;
    float _1743 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1745 = _1733 * _1733;
    float _1747 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1743);
    float _1749 = fma(_1737, _1737, _1745);
    float _1751 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1753 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1747);
    float _1755 = fma(_1741, _1741, _1749);
    float _1757 = rsqrt(_1755);
    float _1759 = _1757 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1761 = _1737 * _1759;
    float _1763 = _1741 * _1759;
    float _1765 = _1761 * _1761;
    float _1767 = _1763 * _1763;
    float _1769 = _1765 + _1767;
    float _1771 = sqrt(_1769);
    bool _1773 = _1771 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1777 = _1771 + _1775;
    float _1779 = _1749;
    float _1781 = _1757;
    float _1783 = _1777;
    float _1785 = _1725;
    float _1787 = _1765;
    float _1789 = _1761;
    if (_1773)
    {
        float _1791 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1779 = _1791;
    }
    float _1793 = _1779;
    if (_1773)
    {
        float _1795 = rsqrt(_1769);
        _1781 = _1795;
    }
    float _1797 = _1781;
    float _1799 = _1793;
    float _1801 = _1797;
    if (_1773)
    {
        float _1803 = _1777 * _1793;
        _1783 = _1803;
    }
    float _1805 = _1783;
    if (_1773)
    {
        float _1807 = _1805 * 0.15915493667125701904296875;
        _1785 = _1807;
    }
    float _1809 = _1785;
    float _1811 = _1741;
    float _1813 = _1809;
    if (_1773)
    {
        float _1815 = _1809 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        _1811 = _1817;
    }
    float _1819 = _1811;
    float _1821 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1823 = precise::max(0.0, _1821);
    float _1825 = _1727;
    if (_1773)
    {
        float _1827 = _1809 * 6.283185482025146484375;
        float _1829 = cos(_1827);
        _1825 = _1829;
    }
    float _1831 = _1825;
    float _1833 = -_1759;
    float _1835 = -_1823;
    float _1837 = fma(_1733, _1833, _1835);
    float _1839 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1773)
    {
        float _1841 = _1837 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1799 = _1841;
    }
    float _1843 = _1799;
    float _1845 = _1843;
    if (!_1773)
    {
        _1813 = _1763;
    }
    float _1847 = _1813;
    float _1849 = fma(_1289, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1851 = _1847;
    if (_1773)
    {
        float _1853 = fma(_1819, _1843, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1845 = _1853;
    }
    float _1855 = _1845;
    float _1857 = floor(_1849);
    float _1859 = _1855;
    if (_1773)
    {
        float _1861 = _1831 + (-1.0);
        _1839 = _1861;
    }
    float _1863 = _1839;
    float _1865 = _1863;
    if (_1773)
    {
        float _1867 = _1797 * _1855;
        _1311 = _1867;
    }
    float _1869 = _1311;
    if (!_1773)
    {
        _1801 = _1761;
    }
    float _1871 = _1801;
    float _1873 = _1871;
    if (_1773)
    {
        float _1875 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1865 = _1875;
    }
    float _1877 = _1865;
    if (_1773)
    {
        float _1879 = _1761 * _1869;
        _1873 = _1879;
    }
    float _1881 = _1873;
    if (!_1773)
    {
        _1859 = _1837;
    }
    float _1883 = _1859;
    float _1885 = _1883;
    if (_1773)
    {
        float _1887 = _1763 * _1869;
        _1851 = _1887;
    }
    float _1889 = _1851;
    if (_1773)
    {
        float _1891 = fma(_1837, _1831, _1877);
        _1885 = _1891;
    }
    float _1893 = _1885;
    if (_1773)
    {
        float _1895 = _1881 * _1881;
        _1787 = _1895;
    }
    float _1897 = _1787;
    float _1899 = sqrt(_1755);
    if (!_1773)
    {
        _1789 = _1767;
    }
    float _1901 = _1789;
    float _1903 = _1901;
    if (_1773)
    {
        float _1905 = _1889 * _1889;
        _1903 = _1905;
    }
    float _1907 = _1903;
    float _1909 = fma(_1893, _1893, _1897);
    float _1911 = fma(_1283, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1913 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1915 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1917 = _1909 + _1907;
    float _1919 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1921 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1913);
    float _1923 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1915);
    float _1925 = floor(_1911);
    float _1927 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1919);
    float _1929 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1921);
    float _1931 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1923);
    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1935 = fma(_1899, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1933);
    float _1937 = precise::clamp(_1935, 0.0, 1.0);
    float _1939 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1927);
    float _1941 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1943 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1945 = rsqrt(_1917);
    float _1947 = -_1937;
    float _1949 = _1947 + 1.0;
    float _1951 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1953 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1955 = _1943 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1957 = -_1857;
    float _1959 = _1849 + _1957;
    float _1961 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1963 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1953);
    float _1965 = abs(_1949);
    float _1967 = log2(_1965);
    float _1969 = -_1955;
    float _1971 = fma(_1969, _1751, 1.0);
    float _1973 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1975 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1963);
    float _1977 = -_1925;
    float _1979 = _1911 + _1977;
    float _1981 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1961);
    float _1983 = _1945 * _1881;
    float _1985 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1975);
    float _1987 = _1945 * _1893;
    float _1989 = _1945 * _1889;
    float _1991 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1993 = log2(_1971);
    float _1995 = _1987 + 1.0;
    float _1997 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1981);
    float _1999 = -_1991;
    float _2001 = fma(_1987, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1999);
    float _2003 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2005 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1997);
    float _2007 = -_1989;
    float _2009 = fma(_2007, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2001);
    float _2011 = 1.0 / _1985;
    float _2013 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2015 = fma(_2009, -0.5, 0.5);
    float _2017 = fma(_2009, 0.5, 0.5);
    float _2019 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2013);
    float _2021 = exp2(_2003);
    float _2023 = fma(_2017, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2025 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2019);
    float _2027 = _1993 * 0.693147182464599609375;
    float _2029 = fma(_2017, _2023, -0.212114393711090087890625);
    float _2031 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2033 = sqrt(_2015);
    float _2035 = fma(_2017, _2029, 1.570728778839111328125);
    float _2037 = _2005 * _2011;
    float _2039 = -_1987;
    float _2041 = fma(_2021, _1995, _2039);
    float _2043 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2025);
    float _2045 = fma(_2037, 0.5, 0.5);
    float _2047 = fma(_2041, 0.5, 0.5);
    float _2049 = _2043 * _2011;
    float _2051 = _2033 * 0.636619746685028076171875;
    float _2053 = fma(_2049, -0.5, 0.5);
    float _2055 = -_2035;
    float _2057 = fma(_2051, _2055, 1.0);
    float2 _6548 = float2(_1959, _1979);
    float _2059 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6548, float2(0.0), isnan(_6548)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6548, float2(0.0), isnan(_6548)), level(0.0)).x;
    float3 _6559 = float3(_2045, _2053, _2031);
    float _2061 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6559, float3(0.0), isnan(_6559)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6559, float3(0.0), isnan(_6559)), level(0.0)).x;
    float3 _6570 = float3(_2045, _2053, _2031);
    float4 _2064 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6570, float3(0.0), isnan(_6570)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6570, float3(0.0), isnan(_6570)), level(0.0)).xyzw;
    float _2066 = _2064.x;
    float _2068 = _2064.y;
    float _2070 = _2064.z;
    float _2072 = _2064.w;
    float2 _6586 = float2(_2057, _2047);
    float3 _2076 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6586, float2(0.0), isnan(_6586)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6586, float2(0.0), isnan(_6586)), level(0.0)).xyz;
    float _2078 = _2076.x;
    float _2080 = _2076.y;
    float _2082 = _2076.z;
    float _2084 = float(uint(_877));
    float _2086 = trunc(_969);
    int _2088 = int(_2086);
    int _2090 = ~_877;
    int _2092 = _2090 + 1;
    float _2094 = -_971;
    float _2096 = _2094 + 1.0;
    int _2098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2100 = _2098 != 0;
    float _2102 = _989 * _163;
    int _2104 = ~_877;
    int _2106 = _2104 + 1;
    out.m_72.w = _1059;
    bool _2108 = _153 > 0.5;
    float _2110 = 1.0 / _2084;
    out.m_74.x = _1289;
    out.m_74.y = _1279;
    out.m_74.z = _1283;
    bool _2112 = _717 > 0.5;
    float _2114 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2118 = _2116 != 0;
    out.m_76.x = _1169;
    float _2120 = trunc(_2102);
    int _2122 = int(_2120);
    float _2124 = float(uint(_2088));
    out.m_78.x = _1601;
    out.m_78.y = _1599;
    out.m_78.z = _1603;
    bool _2126 = !_2118;
    float _2128 = _2126 ? 7.345489978790283203125 : 1.0;
    int _2130 = abs(_839);
    float _2132 = _2128 * _153;
    int _2134 = as_type<int>(_2110) + (-2);
    float _2136 = exp2(_2114);
    float _2138 = float(_2088);
    int _2140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2142 = _2140 != 0;
    float _2144 = as_type<float>(_2134) * _2124;
    bool _2146 = _2138 >= _983;
    bool _2148 = isnan(_2138);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan(_983);
    bool _2154 = _2150 || _2152;
    float _2156 = float(_2154);
    float _2158 = trunc(_2144);
    float _2160 = precise::max(_2158, 0.0);
    uint _2163 = uint(_2160);
    bool _2165 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2167 = isnan(_707);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2173 = _2169 || _2171;
    float _2175 = float(_2173);
    float _2177 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2179 = _2177 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2181 = -_2175;
    float _2183 = _2181 + 1.0;
    int _2185 = ~_877;
    int _2187 = _2185 + 1;
    float _2189 = floor(_2132);
    float _2191 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2193 = _2191 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2195 = -_2136;
    float _2197 = _2195 + 1.0;
    float _2199 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2201 = _2106 * int(_2163);
    int _2203 = _2201 + _2088;
    float _2205 = trunc(_2156);
    int _2207 = int(_2205);
    float _2209 = float(uint(_2203));
    float _2211 = -_2189;
    float _2213 = _2132 + _2211;
    float _2215 = as_type<float>(_2134) * _2209;
    float _2217 = _2213 * _983;
    float _2219 = 1.0 / _2179;
    float _2221 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2223 = _2221 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2225 = ~_2207;
    int _2227 = _2225 + 1;
    int _2229 = _2227 + 1;
    float _2231 = trunc(_2215);
    float _2233 = precise::max(_2231, 0.0);
    uint _2235 = uint(_2233);
    float _2237 = 1.0 / _2223;
    float _2239 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2241 = _2239 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2243 = int(_2163) + int(_2235);
    float _2245 = trunc(_2217);
    int _2247 = int(_2245);
    int _2249 = _2092 * _2243;
    int _2251 = _2249 + _2088;
    float _2253 = 1.0 / _2241;
    bool _2255 = uint(_2251) >= uint(_877);
    bool _2257 = !_2255;
    int _2259 = _2257 ? 0 : (-1);
    float _2261 = 1.0 / _2193;
    bool _2263 = _877 == 0;
    int _2265 = ~_2243;
    int _2267 = _2265 + _2259;
    int _2269 = _2267 + 1;
    int _2271 = _877 * _2269;
    int _2273 = _2271 + _2088;
    float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2275;
    float _2279 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2281 = _2279 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2283 = !_2263;
    int _2285 = _2283 ? _2273 : (-1);
    float _2287 = _2277 * _2237;
    bool _2289 = !_2142;
    int _2291 = _2289 ? 0 : 1;
    int _2293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2295 = _2293 != 0;
    int _2297 = _2285 * _2229;
    float _2299 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2301 = _2299 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2303 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2305 = _2303 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2307 = _877 + (-1);
    float _2309 = 1.0 / _2281;
    int _2311 = abs(_2291);
    float _2313 = _2305 * _2253;
    int _2315 = abs(_811);
    int _2317 = _2207 * _2307;
    int _2319 = _2317 + _2297;
    float _2321 = 1.0 / _2301;
    int _2323 = _2247 * _2311;
    int _2325 = _2323 + _2088;
    int _2327 = abs(_883);
    int _2329 = _2319 * _2130;
    float _2331 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2333 = _707 + _2331;
    float _2335 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2337 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2335;
    bool _2339 = !_2100;
    int _2341 = _2339 ? 0 : 1;
    float _2343 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2345 = _2343 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2347 = _2122 * _2315;
    int _2349 = _2347 + _2329;
    float _2351 = fma(_2287, _2333, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2353 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2355 = isnan(_707);
    bool _2357 = _2353 || _2355;
    bool _2359 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2361 = _2357 || _2359;
    float _2363 = float(_2361);
    bool _2365 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2367 = isnan(_707);
    bool _2369 = _2365 || _2367;
    bool _2371 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2373 = _2369 || _2371;
    float _2375 = float(_2373);
    float _2377 = _2337 * _2321;
    int _2379 = _2325 * _2327;
    int _2381 = _2379 + _2349;
    bool _2383 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2385 = isnan(_707);
    bool _2387 = _2383 || _2385;
    bool _2389 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2391 = _2387 || _2389;
    float _2393 = float(_2391);
    float _2395 = -_2363;
    float _2397 = _2395 + 1.0;
    int _2399 = abs(_2341);
    float _2401 = -_2375;
    float _2403 = _2401 + 1.0;
    float _2405 = _2393 * _2397;
    float _2407 = -_2393;
    float _2409 = _2407 + 1.0;
    bool _2411 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2413 = isnan(_707);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2419 = _2415 || _2417;
    float _2421 = float(_2419);
    float _2423 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2425 = _2423 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2427 = _2375 * _2409;
    int _2429 = _2247 * _2399;
    int _2431 = _2429 + _2381;
    bool _2433 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2435 = isnan(_707);
    bool _2437 = _2433 || _2435;
    bool _2439 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2441 = _2437 || _2439;
    float _2443 = float(_2441);
    float _2445 = _2421 * _2403;
    float _2447 = -_2421;
    float _2449 = _2447 + 1.0;
    float _2451 = 1.0 / _2425;
    float _2453 = float(uint(_2431));
    bool _2455 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2457 = isnan(_707);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2463 = _2459 || _2461;
    float _2465 = float(_2463);
    float _2467 = _2443 * _2449;
    float _2469 = -_2443;
    float _2471 = _2469 + 1.0;
    float _2473 = as_type<float>(_2134) * _2453;
    bool _2475 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2477 = isnan(_707);
    bool _2479 = _2475 || _2477;
    bool _2481 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2483 = _2479 || _2481;
    float _2485 = float(_2483);
    float _2487 = _2465 * _2471;
    float _2489 = -_2465;
    float _2491 = _2489 + 1.0;
    int _2493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2495 = _2493 != 0;
    float _2497 = trunc(_2473);
    float _2499 = precise::max(_2497, 0.0);
    uint _2501 = uint(_2499);
    float _2503 = _2485 * _2183;
    float _2505 = _2175 * _2491;
    float _2507 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2509 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2507;
    float _2511 = _2345 * _2451;
    float _2513 = -_2485;
    float _2515 = _2513 + 1.0;
    float _2517 = _2509 * _2219;
    float _2519 = _2351 * _2503;
    float _2521 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2523 = _707 + _2521;
    float _2525 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2527 = _2525 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2529;
    float _2533 = fma(_2313, _2523, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2535 = fma(_2515, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2519);
    float _2537 = _2527 * _2309;
    int _2539 = _2187 * int(_2501);
    int _2541 = _2539 + _2431;
    float _2543 = _2531 * _2261;
    float _2545 = float(uint(_2325));
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2549 = _707 + _2547;
    float _2551 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2553 = _707 + _2551;
    float _2555 = float(uint(_2541));
    float _2557 = fma(_2533, _2505, _2535);
    float _2559 = fma(_2377, _2549, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2561 = fma(_2511, _2553, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2565 = _707 + _2563;
    float _2567 = as_type<float>(_2134) * _2555;
    float _2569 = as_type<float>(_2134) * _2545;
    float _2571 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2573 = _707 + _2571;
    float _2575 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2577 = _707 + _2575;
    float _2579 = fma(_2517, _2565, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2581 = trunc(_2569);
    float _2583 = precise::max(_2581, 0.0);
    uint _2585 = uint(_2583);
    float _2587 = fma(_2537, _2573, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2589 = ~_877;
    int _2591 = _2589 + 1;
    float _2593 = fma(_2559, _2487, _2557);
    float _2595 = -_1151;
    int _2597 = _2112 ? as_type<int>(_2595) : as_type<int>(_1151);
    float _2599 = fma(_2543, _2577, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2601 = -_1155;
    int _2603 = _2108 ? as_type<int>(_2601) : as_type<int>(_1155);
    float _2605 = fma(_2561, _2467, _2593);
    float _2607 = trunc(_2567);
    float _2609 = precise::max(_2607, 0.0);
    uint _2611 = uint(_2609);
    bool _2613 = !_2295;
    float _2615 = _2613 ? _1151 : as_type<float>(_2597);
    int _2617 = ~_877;
    int _2619 = _2617 + 1;
    float _2621 = fma(_2579, _2445, _2605);
    float _2623 = fma(_2587, _2427, _2621);
    float _2625 = -_979;
    float _2627 = _2625 + 1.0;
    float _2629 = fma(_2599, _2405, _2623);
    int _2631 = int(_2501) + int(_2611);
    int _2633 = _2619 * int(_2585);
    int _2635 = _2633 + _2325;
    bool _2637 = !_2495;
    float _2639 = _2637 ? _1155 : as_type<float>(_2603);
    float _2641 = _2615 + (-0.5);
    float _2643 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2629);
    int _2645 = _2591 * _2631;
    int _2647 = _2645 + _2431;
    float _2649 = float(uint(_2635));
    float _2651 = -_2641;
    float _2653 = -_885;
    float _2655 = fma(_2651, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2653);
    float _2657 = _2639 + 0.5;
    out.m_80.x = _2643;
    bool _2659 = uint(_2647) >= uint(_877);
    float _2661 = as_type<float>(_2134) * _2649;
    float _2663 = fma(_2615, _2096, _2655);
    float _2665 = fma(_2657, (*spvDescriptorSet0.vp_c9)._m0[80].x, _743);
    bool _2667 = !_2659;
    int _2669 = _2667 ? 0 : (-1);
    float _2671 = trunc(_2661);
    float _2673 = precise::max(_2671, 0.0);
    uint _2675 = uint(_2673);
    int _2677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2679 = _2677 != 0;
    float _2681 = -_2627;
    float _2683 = fma(_2639, _2681, _2665);
    int _2685 = ~_2631;
    int _2687 = _2685 + _2669;
    int _2689 = _2687 + 1;
    int _2691 = ~_877;
    int _2693 = _2691 + 1;
    out.m_82.x = _2683;
    out.m_82.y = _2663;
    int _2695 = _877 * _2689;
    int _2697 = _2695 + _2431;
    float _2699 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2701 = !_2263;
    int _2703 = _2701 ? _2697 : (-1);
    int _2705 = int(_2585) + int(_2675);
    float _2707 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2709 = _2703 >> 31;
    float _2711 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2713 = _2709 & 3;
    float _2715 = -_1193;
    float _2717 = fma(_2715, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2699);
    float _2719 = -_1193;
    float _2721 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2707);
    float _2723 = -_1193;
    float _2725 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2711);
    int _2727 = _2703 + _2713;
    float _2729 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2717);
    int _2731 = _2693 * _2705;
    int _2733 = _2731 + _2325;
    float _2735 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2725);
    int _2737 = _2727 >> 2;
    float _2739 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2721);
    float _2741 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2743 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2745 = _2737 << 4;
    int _2747 = _2745 + 368;
    float _2749 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2751 = uint(_2733) >= uint(_877);
    float _2753 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _2755 = uint(int(uint(_2747) >> uint(2)));
    uint _2757 = uint(int(uint(int(_2755)) >> uint(2)));
    int _2759 = int(_2755) & 3;
    float _2761 = (*spvDescriptorSet0.vp_c9)._m0[int(_2757)][_2759];
    int _2763 = int(_2755) + 1;
    uint _2765 = uint(int(uint(_2763) >> uint(2)));
    int _2767 = _2763 & 3;
    float _2769 = (*spvDescriptorSet0.vp_c9)._m0[int(_2765)][_2767];
    float _2771 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2741);
    float _2773 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2743);
    float _2775 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2749);
    float _2777 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2779 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2781 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2783 = abs(_1611);
    float _2785 = log2(_2783);
    float _2787 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2777);
    float _2789 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2779);
    float _2791 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2781);
    float _2793 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2771);
    int _2795 = _2703 & 3;
    bool _2797 = _2795 != 0;
    int _2799 = _2747 + 8;
    uint _2801 = uint(int(uint(_2799) >> uint(2)));
    uint _2803 = uint(int(uint(int(_2801)) >> uint(2)));
    int _2805 = int(_2801) & 3;
    float _2807 = (*spvDescriptorSet0.vp_c9)._m0[int(_2803)][_2805];
    int _2809 = int(_2801) + 1;
    uint _2811 = uint(int(uint(_2809) >> uint(2)));
    int _2813 = _2809 & 3;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[int(_2811)][_2813];
    int _2817 = _2703 & 3;
    bool _2819 = _2817 != 0;
    float _2821 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2773);
    bool _2823 = uint(_2795) > 1u;
    float _2825 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2827 = _2819 ? 0 : 1;
    float _2829 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2787);
    float _2831 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2789);
    bool _2833 = !_2751;
    int _2835 = _2833 ? 0 : (-1);
    float _2837 = _2753 * _2735;
    int _2839 = ~_2827;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    float _2845 = _2785 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2847 = ~_2705;
    int _2849 = _2847 + _2835;
    int _2851 = _2849 + 1;
    float _2853 = _2753 * _2729;
    bool _2855 = uint(_2795) >= 2u;
    float _2857 = fma(_2825, _2793, _2837);
    int _2859 = _2843;
    float _2861 = _2068;
    float _2863 = _2066;
    float _2865 = _1985;
    float _2867 = _2043;
    if (!_2823)
    {
        int _2869 = ~_2827;
        int _2871 = _2869 + 1;
        _2859 = _2871;
    }
    int _2873 = _2859;
    int _2875 = _877 * _2851;
    int _2877 = _2875 + _2325;
    bool _2879 = _2795 != 3;
    float _2881 = exp2(_2845);
    bool _2883 = !_2797;
    int _2885 = _2883 ? 0 : 1;
    float _2887 = fma(_2825, _2821, _2853);
    int _2889 = _2855 ? 0 : 1;
    float _2891 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2791);
    int _2893 = abs(_2873);
    float _2895 = in.m_84.x;
    int _2897 = abs(_2885);
    float _2899 = -_2059;
    float _2901 = _2899 + 1.0;
    int _2903 = ~_2889;
    int _2905 = _2903 + 1;
    int _2907 = _2905 + 1;
    float _2909 = _2753 * _2739;
    bool _2911 = _2795 != 3;
    float _2913 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2775);
    int _2915 = _2907;
    if (_2879)
    {
        int _2917 = ~_2889;
        int _2919 = _2917 + 1;
        _2915 = _2919;
    }
    int _2921 = _2915;
    float _2923 = _2199 * _2061;
    int _2925 = ~_2893;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    float _2931 = fma(_2825, _2913, _2909);
    float _2933 = _2005 + _1985;
    bool _2935 = !_2911;
    int _2937 = _2935 ? 0 : (-1);
    int _2939 = _2929 * as_type<int>(_2769);
    int _2941 = abs(_2921);
    bool _2943 = _1611 <= 8000.0;
    bool _2945 = isnan(_1611);
    bool _2947 = _2943 || _2945;
    bool _2949 = isnan(8000.0);
    bool _2951 = _2947 || _2949;
    float _2953 = float(_2951);
    float _2955 = fma(_2881, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2957 = precise::clamp(_2955, 0.0, 1.0);
    int _2959 = ~_2897;
    int _2961 = _2959 + 1;
    int _2963 = _2961 + 1;
    float _2965 = _2082 * _2923;
    bool _2967 = !_2679;
    int _2969 = _2967 ? 0 : 1;
    float _2971 = fma(_2957, -2.0, 3.0);
    int _2973 = abs(_2937);
    int _2975 = _2963 * as_type<int>(_2761);
    int _2977 = _2975 + _2939;
    float _2979 = _2957 * _2957;
    int _2981 = abs(_2969);
    float _2983 = -_2199;
    float _2985 = _2983 + 1.0;
    float _2987 = _2979 * _2971;
    int _2989 = ~_2941;
    int _2991 = _2989 + 1;
    int _2993 = _2991 + 1;
    float _2995 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2997 = _2933 * 0.5;
    int _2999 = ~_2973;
    int _3001 = _2999 + 1;
    int _3003 = _3001 + 1;
    int _3005 = _2993 * as_type<int>(_2807);
    int _3007 = _3005 + _2977;
    int _3009 = ~_2981;
    int _3011 = _3009 + 1;
    int _3013 = _3011 + 1;
    float _3015 = -_2987;
    float _3017 = _3015 + 1.0;
    float _3019 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2995);
    int _3021 = _3003 * as_type<int>(_2815);
    int _3023 = _3021 + _3007;
    bool _3025 = !_2263;
    int _3027 = _3025 ? _2877 : (-1);
    float _3029 = fma(_3017, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2987);
    float _3031 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3019);
    int _3033 = _3023 * _3013;
    float _3035 = _2953 * _3029;
    float _3037 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3031);
    int _3039 = _3027 * _2981;
    int _3041 = _3039 + _3033;
    float _3043 = _2831 + _2887;
    float _3045 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3047 = _3037 + _1985;
    out.gl_Position.x = _2005;
    out.gl_Position.y = _2043;
    out.gl_Position.z = _3037;
    out.gl_Position.w = _1985;
    float _3049 = float(_3041);
    float _3051 = _1985 * 0.5;
    float _3053 = _2901 * _3045;
    float _3055 = precise::clamp(_3053, 0.0, 1.0);
    float _3057 = _3047 * 0.5;
    float _3059 = _2891 + _2931;
    float _3061 = fma(_2043, -0.5, _3051);
    float _3063 = _2829 + _2857;
    out.m_86.x = _3049;
    float _3065 = _2072 * _2985;
    bool _3067 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3069 = isnan(_1899);
    bool _3071 = _3067 || _3069;
    bool _3073 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3075 = _3071 || _3073;
    float _3077 = -_3055;
    float _3079 = fma(_3077, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3081 = _2072 * _2923;
    out.m_88.x = _2997;
    out.m_88.y = _3061;
    out.m_88.z = _3057;
    out.m_88.w = _1985;
    float _3083 = _3079 * _2895;
    float _3085 = fma(_2078, _3081, _2066);
    float _3087 = fma(_2080, _3081, _2068);
    float _3089 = fma(_2072, _2965, _2070);
    float _3091 = _3083 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.x = _3063;
    out.m_90.y = _3043;
    out.m_90.z = _3059;
    float _3093 = _1667 * _1729;
    float _3095 = _3037;
    float _3097 = _3093;
    if (!_3075)
    {
        _2861 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3099 = _2861;
    out.m_92.x = _3091;
    float _3101 = _3093 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3103 = _3099;
    float _3105 = _3099;
    if (!_3075)
    {
        _2863 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3107 = _2863;
    out.m_94.x = _3085;
    out.m_94.y = _3087;
    out.m_94.z = _3089;
    out.m_94.w = _3065;
    float _3109 = _3107;
    float _3111 = _3107;
    if (!_3075)
    {
        _2865 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3113 = _2865;
    float _3115 = _3113;
    float _3117 = _3113;
    if (!_3075)
    {
        _3095 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3119 = _3095;
    float _3121 = _3119;
    float _3123 = _3119;
    if (!_3075)
    {
        _2867 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3125 = _2867;
    float _3127 = _3125;
    float _3129 = _3125;
    if (!_3075)
    {
        _3097 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3131 = _3097;
    bool _3133 = !_3075;
    float _3135 = _3131;
    float _3137 = _3131;
    if (!_3133)
    {
        bool _3139 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3141 = isnan(_1899);
        bool _3143 = _3139 || _3141;
        bool _3145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3147 = _3143 || _3145;
        if (!_3147)
        {
            float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3151 = _1899 + _3149;
            float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3155 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3153;
            float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3161 = 1.0 / _3155;
            float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3179 = _3151 * _3161;
            float _3181 = precise::clamp(_3179, 0.0, 1.0);
            float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3187 = fma(_3181, _3159, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3189 = fma(_3181, _3185, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3191 = fma(_3181, _3165, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3193 = fma(_3181, _3169, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3195 = fma(_3181, _3173, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3197 = fma(_3181, _3177, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3111 = _3191;
            _3129 = _3195;
            _3105 = _3187;
            _3123 = _3193;
            _3117 = _3189;
            _3137 = _3197;
            _3199 = true;
        }
        else
        {
            bool _3201 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3203 = isnan(_1899);
            bool _3205 = _3201 || _3203;
            bool _3207 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3209 = _3205 || _3207;
            if (!_3209)
            {
                _3103 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3211 = _3103;
            _3105 = _3211;
            if (!_3209)
            {
                _3109 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3213 = _3109;
            _3111 = _3213;
            if (!_3209)
            {
                _3115 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3215 = _3115;
            _3117 = _3215;
            if (!_3209)
            {
                _3121 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3217 = _3121;
            _3123 = _3217;
            if (!_3209)
            {
                _3127 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3219 = _3127;
            _3129 = _3219;
            if (!_3209)
            {
                _3135 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3221 = _3135;
            bool _3223 = !_3209;
            _3137 = _3221;
            if (!_3223)
            {
                bool _3225 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3227 = isnan(_1899);
                bool _3229 = _3225 || _3227;
                bool _3231 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3233 = _3229 || _3231;
                if (!_3233)
                {
                    float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3237 = _1899 + _3235;
                    float _3239 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3241 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3239;
                    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3247 = 1.0 / _3241;
                    float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3265 = _3237 * _3247;
                    float _3267 = precise::clamp(_3265, 0.0, 1.0);
                    float _3269 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3271 = _3269 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3273 = fma(_3267, _3245, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3275 = fma(_3267, _3271, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3277 = fma(_3267, _3251, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3279 = fma(_3267, _3255, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3281 = fma(_3267, _3259, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3283 = fma(_3267, _3263, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3111 = _3277;
                    _3129 = _3281;
                    _3105 = _3273;
                    _3123 = _3279;
                    _3117 = _3275;
                    _3137 = _3283;
                    _3199 = true;
                }
                else
                {
                    _3111 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3129 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3105 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3123 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3117 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3137 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3199 = false;
    float _3285 = _3111;
    float _3287 = _3129;
    float _3289 = _3105;
    float _3291 = _3123;
    float _3293 = _3117;
    float _3295 = _3137;
    float _3297 = _3101 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3299 = fma(_3043, -0.5, 0.5);
    float _3301 = precise::clamp(_3299, 0.0, 1.0);
    float _3303 = -_3285;
    float _3305 = _3303 + _3287;
    float _3307 = -_3289;
    float _3309 = _3307 + _3291;
    out.m_96.x = 0.0;
    float _3311 = fma(_3301, _3305, _3285);
    float _3313 = -_3293;
    float _3315 = _3313 + _3295;
    float _3317 = fma(_3301, _3309, _3289);
    float _3319 = _3311 * 0.586610972881317138671875;
    bool _3321 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3323 = fma(_3301, _3315, _3293);
    out.m_53.x = _3297;
    float _3325 = fma(_3317, 0.298911988735198974609375, _3319);
    bool _3327 = _1667 > 0.0;
    bool _3329 = isnan(_1667);
    bool _3331 = _3327 || _3329;
    bool _3333 = isnan(0.0);
    bool _3335 = _3331 || _3333;
    float _3337 = fma(_3323, 0.114477999508380889892578125, _3325);
    bool _3339 = _1729 <= 0.0;
    bool _3341 = !_3335;
    bool _3343 = _3339 || _3341;
    float _3345 = -_3337;
    float _3347 = _3317 + _3345;
    float _3349 = -_3337;
    float _3351 = _3311 + _3349;
    float _3353 = -_3337;
    float _3355 = _3323 + _3353;
    float _3357 = fma(_3347, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3359 = fma(_3351, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3361 = fma(_3355, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    bool _3363 = !_3321;
    if (!_3363)
    {
        float _3365 = -_1599;
        float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3369 = -_1601;
        float _3371 = _3369 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3373 = -_1603;
        float _3375 = _3373 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3377 = _3367 * _3367;
        float _3379 = fma(_3371, _3371, _3377);
        float _3381 = fma(_3375, _3375, _3379);
        float _3383 = sqrt(_3381);
        float _3385 = rsqrt(_3381);
        float _3387 = -_3383;
        float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3391 = _3389 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3393 = precise::clamp(_3391, 0.0, 1.0);
        float _3395 = _3371 * _3385;
        float _3397 = _3367 * _3385;
        float _3399 = abs(_3393);
        float _3401 = log2(_3399);
        float _3403 = _3375 * _3385;
        float _3405 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3407 = _3043 * _3397;
        float _3409 = -_3397;
        float _3411 = -_3405;
        float _3413 = fma(_3409, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3411);
        float _3415 = fma(_3063, _3395, _3407);
        float _3417 = -_3403;
        float _3419 = fma(_3417, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3413);
        float _3421 = fma(_3059, _3403, _3415);
        float _3423 = precise::clamp(_3421, 0.0, 1.0);
        float _3425 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3427 = _3419 + _3425;
        float _3429 = _3401 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3431 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3433 = precise::clamp(_3431, 0.0, 1.0);
        float _3435 = exp2(_3429);
        float _3437 = _3435 * _3433;
        float _3439 = _3423 * _3437;
        float _3441 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3443 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3445 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3441;
        out.m_96.y = _3443;
        out.m_96.z = _3445;
    }
    out.m_72.x = _3357;
    out.m_72.y = _3359;
    out.m_72.z = _3361;
    if (!_3343)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_53.x = 0.0;
    float _3447 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3447;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3199 = false;
    bool _523 = false;
    bool _417 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = in.m_48.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = _112;
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_53.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3515 = as_type<float>(_139);
        out.gl_Position.z = _3515;
    }
    if (!_125)
    {
        return out;
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = in.m_55.x;
    float _155 = float(_117);
    bool _157 = _121 >= _155;
    bool _159 = !_151;
    bool _161 = _157 || _159;
    float _163 = 1.0 / _155;
    if (_161)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _129;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    float _167 = _121 * _163;
    float _169 = _167;
    if (_161)
    {
        float _171 = _165 * 5.0;
        _141 = as_type<int>(_171);
    }
    int _173 = _141;
    out.m_57.x = _153;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3580 = as_type<float>(_173);
        out.gl_Position.z = _3580;
    }
    out.m_51.x = _167;
    if (_161)
    {
        return out;
    }
    float _175 = in.m_59.x;
    float _177 = in.m_59.y;
    float _179 = in.m_59.z;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _177 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _177 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _177 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _189 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _191 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _193 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    float _195 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].z, _189);
    float _197 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].z, _191);
    float _199 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    bool _201 = !_181;
    float _203 = _197;
    float _205 = _199;
    float _221;
    if (!_201)
    {
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        _221 = _167;
    }
    _223 = false;
    float _225 = _221;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = _225 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = _225 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _243;
    float _247 = 1.0 / _241;
    bool _249 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _251 = isnan(_225);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _263 = 1.0 / _237;
    bool _265 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _267 = isnan(_225);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = 1.0 / _245;
    float _279 = _229 * _263;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _225 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = _283 * _247;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _291;
    float _295 = fma(_287, _279, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _297 = _233 * _277;
    bool _299 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_225);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = fma(_293, _279, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _313 = -_275;
    float _315 = _313 + 1.0;
    float _317 = -_259;
    float _319 = _317 + 1.0;
    bool _321 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _323 = isnan(_225);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = _309 * _315;
    float _339 = -_309;
    float _341 = _339 + 1.0;
    float _343 = _275 * _319;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = fma(_335, _289, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _351 = _331 * _341;
    float _353 = in.m_61.x;
    float _355 = in.m_61.y;
    float _357 = fma(_347, _289, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _359 = _295 * _351;
    float _361 = -_331;
    float _363 = _361 + 1.0;
    float _365 = _311 * _351;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _371;
    float _375 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    float _377 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _379 = fma(_369, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _381 = fma(_373, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _383 = fma(_349, _337, _375);
    float _385 = fma(_357, _337, _377);
    float _387 = fma(_379, _343, _383);
    float _389 = fma(_381, _343, _385);
    float _391 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[146].x, _387);
    float _393 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[146].y, _389);
    float _395 = _391 * _353;
    float _397 = _393 * _355;
    bool _399 = !_261;
    float _415;
    if (!_399)
    {
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _403 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _415 = _413;
        _417 = true;
    }
    else
    {
        _415 = _167;
    }
    _417 = false;
    float _419 = _415;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _423 = _419 + _421;
    bool _425 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _427 = isnan(_419);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _437;
    bool _441 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _443 = isnan(_419);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -_435;
    float _455 = _453 + 1.0;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _457;
    float _461 = 1.0 / _439;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _465 = _451 * _455;
    float _467 = -_451;
    float _469 = _467 + 1.0;
    float _471 = _423 * _461;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _473;
    float _477 = fma(_459, _471, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _479;
    float _483 = fma(_475, _471, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _485 = _477 * _465;
    float _487 = fma(_481, _471, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _489 = _483 * _465;
    float _491 = _487 * _465;
    float _493 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[107].x, _485);
    float _495 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[107].y, _491);
    float _497 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[107].z, _489);
    float _499 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[108].x, _493);
    float _501 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[108].y, _495);
    float _503 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[108].z, _497);
    bool _505 = !_463;
    float _521;
    if (!_505)
    {
        float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _509 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _511 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _513 = _511 * _507;
        float _515 = floor(_513);
        float _517 = -_515;
        float _519 = _513 + _517;
        _521 = _519;
        _523 = true;
    }
    else
    {
        _521 = _167;
    }
    _523 = false;
    float _525 = _521;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _529 = _525 + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _539 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _541 = isnan(_525);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _555 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _557 = isnan(_525);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = 1.0 / _533;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _569;
    float _573 = -_549;
    float _575 = _573 + 1.0;
    bool _577 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _579 = isnan(_525);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    bool _589 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _591 = 1.0 / _537;
    float _593 = 1.0 / _553;
    float _595 = _571 * _567;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _601 = _565 * _575;
    float _603 = -_565;
    float _605 = _603 + 1.0;
    float _607 = fma(_595, _529, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _609;
    float _613 = _587 * _605;
    float _615 = _599 * _591;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _619 = _525 + _617;
    bool _621 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _623 = isnan(_525);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = _607 * _613;
    float _635 = -_587;
    float _637 = _635 + 1.0;
    float _639 = fma(_615, _619, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _643 = _525 + _641;
    float _645 = _611 * _593;
    float _647 = -_631;
    float _649 = _647 + 1.0;
    float _651 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[115].x, _633);
    float _653 = _499 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _655 = fma(_645, _643, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _657 = _549 * _649;
    float _659 = fma(_639, _601, _651);
    float _661 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = fma(_655, _657, _659);
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _667 = _501 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _669 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[118].x, _663);
    float _671 = _503 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _675 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _681 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _685 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _685;
    out.m_63.y = _687;
    out.m_63.z = _675;
    out.m_63.w = _683;
    out.m_65.x = _661;
    out.m_65.y = _677;
    out.m_65.z = _681;
    out.m_65.w = _689;
    bool _691 = !_589;
    if (!_691)
    {
        float _693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _695 = _153 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[14].x, _121);
        float _699 = _697 * _693;
        float _701 = floor(_699);
        float _703 = -_701;
        float _705 = _699 + _703;
        _169 = _705;
    }
    float _707 = _169;
    float _709 = in.m_55.z;
    float _711 = _153 * 2.0;
    float _713 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _715 = log2(_713);
    float _717 = in.m_55.y;
    float _719 = _153 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _721 = in.m_46.x;
    float _723 = in.m_46.y;
    float _725 = in.m_46.z;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _729 = floor(_711);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _733 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _735 = -_727;
    float _737 = fma(_719, 2.0, _735);
    float _739 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _741 = -_121;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[76].x, _737);
    float _745 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _747 = int(_745);
    float _749 = _709 * 2.0;
    bool _751 = _729 > 0.0;
    bool _753 = _729 >= 0.0;
    bool _755 = isnan(_729);
    bool _757 = _753 || _755;
    bool _759 = isnan(0.0);
    bool _761 = _757 || _759;
    float _763 = floor(_749);
    float _765 = _715 * _121;
    float _767 = _717 * 2.0;
    float _769 = _717 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _771 = _723 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _773 = _717 + _709;
    float _775 = _723 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _777 = fma(_769, -2.0, _731);
    float _779 = exp2(_765);
    float _781 = _723 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _785 = _783 != 0;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _789 = _787 != 0;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _793 = _791 != 0;
    float _795 = fma(_721, (*spvDescriptorSet0.vp_c10)._m0[6].x, _771);
    int _797 = _761 ? 0 : 1;
    float _799 = _773 + (-1.0);
    float _801 = fma(_721, (*spvDescriptorSet0.vp_c10)._m0[4].x, _775);
    float _803 = floor(_767);
    bool _805 = _763 > 0.0;
    float _807 = fma(_721, (*spvDescriptorSet0.vp_c10)._m0[5].x, _781);
    bool _809 = !_785;
    int _811 = _809 ? 0 : 1;
    float _813 = _153 + _717;
    bool _815 = _763 >= 0.0;
    bool _817 = isnan(_763);
    bool _819 = _815 || _817;
    bool _821 = isnan(0.0);
    bool _823 = _819 || _821;
    float _825 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _827 = float(_747);
    float _829 = fma(_725, (*spvDescriptorSet0.vp_c10)._m0[4].z, _801);
    float _831 = fma(_725, (*spvDescriptorSet0.vp_c10)._m0[5].z, _807);
    float _833 = -_779;
    float _835 = _833 + 1.0;
    bool _837 = !_789;
    int _839 = _837 ? 0 : 1;
    float _841 = _813 + (-1.0);
    float _843 = 1.0 / _827;
    bool _845 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _847 = isnan(0.0);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _853 = _849 || _851;
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _857 = _823 ? 0 : 1;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _861 = _803 > 0.0;
    float _863 = fma(_725, (*spvDescriptorSet0.vp_c10)._m0[6].z, _795);
    bool _865 = _803 >= 0.0;
    bool _867 = isnan(_803);
    bool _869 = _865 || _867;
    bool _871 = isnan(0.0);
    bool _873 = _869 || _871;
    float _875 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _877 = int(_875);
    float _879 = _831 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _881 = !_793;
    int _883 = _881 ? 0 : 1;
    float _885 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _777);
    int _887 = ~_857;
    int _889 = _887 + 1;
    int _891 = _889 + 1;
    float _893 = _829 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _895 = _853 ? _835 : 0.0;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _899 = _879 + _897;
    float _901 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[78].z, _859);
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _905 = _903 != 0;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _909 = _907 != 0;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _913 = _911 != 0;
    float _915 = _863 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _917 = _891;
    if (!_805)
    {
        int _919 = ~_857;
        int _921 = _919 + 1;
        _917 = _921;
    }
    int _923 = _917;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _927 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _929 = isnan(1.0);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _935 = _931 || _933;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _939 = 1.0 + _937;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _943 = _893 + _941;
    float _945 = _899 * _899;
    bool _947 = !_905;
    int _949 = _947 ? 0 : 1;
    float _951 = 1.0 / _939;
    float _953 = in.m_67.x;
    float _955 = in.m_67.y;
    float _957 = in.m_67.z;
    float _959 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[78].w, _925);
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _963 = _915 + _961;
    float _965 = fma(_943, _943, _945);
    int _967 = abs(_949);
    float _969 = _843 * _121;
    float _971 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _959);
    float _973 = fma(_963, _963, _965);
    bool _975 = !_909;
    int _977 = _975 ? 0 : 1;
    float _979 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _901);
    float _981 = sqrt(_973);
    float _983 = float(_877);
    int _985 = abs(_977);
    float _987 = float(_967);
    float _989 = _983 * _121;
    float _991 = float(_923);
    if (_935)
    {
        float _993 = _895 * _951;
        _131 = _993;
    }
    float _995 = _131;
    int _997 = ~_797;
    int _999 = _997 + 1;
    int _1001 = _999 + 1;
    float _1003 = _733 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1005 = _1001;
    if (!_751)
    {
        int _1007 = ~_797;
        int _1009 = _1007 + 1;
        _1005 = _1009;
    }
    int _1011 = _1005;
    float _1013 = _987 * _991;
    float _1015 = rsqrt(_973);
    int _1017 = _873 ? 0 : 1;
    float _1019 = _1013 * (-2.0);
    float _1021 = float(_1011);
    float _1023 = float(_985);
    float _1025 = fma(_1019, _953, _953);
    int _1027 = ~_1017;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    float _1033 = fma(_855, _1019, _855);
    int _1035 = _1031;
    if (!_861)
    {
        int _1037 = ~_1017;
        int _1039 = _1037 + 1;
        _1035 = _1039;
    }
    int _1041 = _1035;
    float _1043 = _1023 * _1021;
    float _1045 = _153 + (-0.5);
    float _1047 = _981 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    bool _1049 = !_913;
    int _1051 = _1049 ? 0 : 1;
    float _1053 = _1043 * (-2.0);
    float _1055 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1025);
    float _1057 = float(_1041);
    float _1059 = precise::min(_1003, _1047);
    float _1061 = fma(_825, _1053, _825);
    float _1063 = fma(_1053, _955, _955);
    float _1065 = fma(_1033, _995, _1055);
    int _1067 = abs(_1051);
    float _1069 = _1015 * _1059;
    float _1071 = _717 + (-0.5);
    float _1073 = _1065 * 0.15915493667125701904296875;
    float _1075 = float(_1067);
    float _1077 = _899 * _1069;
    float _1079 = _943 * _1069;
    float _1081 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1063);
    float _1083 = _153 + _709;
    float _1085 = -_1077;
    float _1087 = _899 + _1085;
    float _1089 = -_1079;
    float _1091 = _943 + _1089;
    float _1093 = _1075 * _1057;
    float _1095 = fma(_1061, _995, _1081);
    float _1097 = _1087 * _1087;
    float _1099 = _1083 + (-1.0);
    float _1101 = _1093 * (-2.0);
    float _1103 = fma(_1091, _1091, _1097);
    float _1105 = _963 * _1069;
    float _1107 = as_type<float>(int(gl_VertexIndex));
    float _1109 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1111 = fma(_1101, _957, _957);
    float _1113 = -_1105;
    float _1115 = _963 + _1113;
    float _1117 = _709 + (-0.5);
    float _1119 = fma(_1109, _1101, _1109);
    float _1121 = _1095 * 0.15915493667125701904296875;
    float _1123 = fma(_1115, _1115, _1103);
    float _1125 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1111);
    float _1127 = _1073 * 6.283185482025146484375;
    float _1129 = cos(_1127);
    float _1131 = fma(_1119, _995, _1125);
    float _1133 = _1131 * 0.15915493667125701904296875;
    float _1135 = sqrt(_1123);
    int _1137 = as_type<int>(_1107) & 1;
    bool _1139 = _1137 != 0;
    int _1141 = as_type<int>(_1107) & 2;
    bool _1143 = _1141 != 0;
    float _1145 = _1121 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    bool _1149 = !_1143;
    float _1151 = _1149 ? (-0.5) : 0.5;
    bool _1153 = !_1139;
    float _1155 = _1153 ? (-0.5) : 0.5;
    float _1157 = _1121 * 6.283185482025146484375;
    float _1159 = cos(_1157);
    float _1161 = _1015 * _1135;
    float _1163 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1151);
    float _1165 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1155);
    float _1167 = _739 * _1161;
    float _1169 = _733 * _1161;
    float _1171 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1173 = _1171 * 0.5;
    float _1175 = _1073 * 6.283185482025146484375;
    float _1177 = sin(_1175);
    float _1179 = _1167 * _1163;
    float _1181 = _1129 * _1147;
    float _1183 = _1169 * _1165;
    float _1185 = _1133 * 6.283185482025146484375;
    float _1187 = cos(_1185);
    float _1189 = _1129 * _1159;
    float _1191 = _1133 * 6.283185482025146484375;
    float _1193 = sin(_1191);
    float _1195 = _1177 * _1147;
    float _1197 = _1177 * _1159;
    float _1199 = _1129 * _1187;
    float _1201 = _1177 * _1187;
    float _1203 = _1159 * _1187;
    float _1205 = _1147 * _1187;
    float _1207 = _1199 * _1179;
    float _1209 = fma(_1193, _1189, _1195);
    float _1211 = -_1197;
    float _1213 = fma(_1193, _1181, _1211);
    float _1215 = -_1179;
    float _1217 = _1193 * _1215;
    float _1219 = -_1181;
    float _1221 = fma(_1193, _1197, _1219);
    float _1223 = fma(_1209, _1183, _1207);
    float _1225 = _1201 * _1179;
    float _1227 = fma(_1203, _1183, _1217);
    float _1229 = fma(_1193, _1195, _1189);
    float _1231 = fma(_1213, _1173, _1223);
    float _1233 = fma(_1221, _1183, _1225);
    float _1235 = fma(_1205, _1173, _1227);
    float _1237 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1239 = fma(_1229, _1173, _1233);
    float _1241 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1243 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1237);
    float _1245 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1241);
    float _1247 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1243);
    float _1249 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1245);
    float _1251 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1253 = _1249 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1255 = _915 + _1251;
    float _1257 = _893 + _1253;
    float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1261 = _1255 + _1259;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1265 = _1257 + _1263;
    float _1267 = _1261 * _1261;
    float _1269 = fma(_1265, _1265, _1267);
    float _1271 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1273 = sqrt(_1269);
    float _1275 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1271);
    float _1277 = -_1077;
    float _1279 = _879 + _1277;
    float _1281 = -_1105;
    float _1283 = _915 + _1281;
    float _1285 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1275);
    float _1287 = -_1079;
    float _1289 = _893 + _1287;
    float _1291 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1293 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1295 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1291);
    float _1297 = _879 + _1293;
    float _1299 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1295);
    bool _1301 = _1273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1303 = _1293;
    float _1305 = _1285;
    float _1307 = _1257;
    float _1309 = _1077;
    float _1311 = _1297;
    if (!_1301)
    {
        _1303 = _1255;
    }
    float _1313 = _1303;
    float _1315 = _1313;
    if (!_1301)
    {
        _1305 = _1297;
    }
    float _1317 = _1305;
    bool _1319 = !_1301;
    float _1321 = _1317;
    if (!_1319)
    {
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1327 = _1273 + _1325;
        float _1329 = rsqrt(_1269);
        float _1331 = _1327 * _1323;
        float _1333 = _1297 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1335 = _1331 * 0.15915493667125701904296875;
        float _1337 = _1335 * 6.283185482025146484375;
        float _1339 = cos(_1337);
        float _1341 = _1335 * 6.283185482025146484375;
        float _1343 = sin(_1341);
        float _1345 = _1339 + (-1.0);
        float _1347 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1349 = fma(_1343, _1333, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1351 = fma(_1297, _1339, _1347);
        float _1353 = _1329 * _1349;
        float _1355 = fma(_1265, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1357 = fma(_1261, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1321 = _1351;
        _1307 = _1355;
        _1315 = _1357;
    }
    float _1359 = _1321;
    float _1361 = _1307;
    float _1363 = _1315;
    float _1365 = -_879;
    float _1367 = _1365 + _1359;
    float _1369 = -_893;
    float _1371 = _1369 + _1361;
    float _1373 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1375 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1377 = _1367 * _1367;
    float _1379 = -_915;
    float _1381 = _1379 + _1363;
    float _1383 = 1.0 / _1373;
    float _1385 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1375);
    float _1387 = fma(_1371, _1371, _1377);
    float _1389 = -_1077;
    float _1391 = _1389 + _1359;
    float _1393 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1385);
    float _1395 = fma(_1381, _1381, _1387);
    float _1397 = -_1105;
    float _1399 = _1397 + _1363;
    float _1401 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1403 = sqrt(_1395);
    bool _1405 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1407 = isnan(0.5);
    bool _1409 = _1405 || _1407;
    bool _1411 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1413 = _1409 || _1411;
    float _1415 = _1401 + _1373;
    bool _1417 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1419 = isnan(0.5);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1425 = _1421 || _1423;
    float _1427 = _1415 * _1383;
    float _1429 = _1427 * 0.5;
    float _1431 = -_1079;
    float _1433 = _1431 + _1361;
    float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1437 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1435);
    float _1439 = 1.0 / _1437;
    bool _1441 = _1403 > 0.0;
    float _1443 = _1359;
    float _1445 = _1361;
    float _1447 = _1363;
    float _1449 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1451 = _1391;
    if (!_1441)
    {
        _1443 = _1433;
    }
    float _1453 = _1443;
    float _1455 = _1453;
    if (!_1441)
    {
        _1445 = _1391;
    }
    float _1457 = _1445;
    float _1459 = _1457;
    float _1461 = _1457;
    if (!_1441)
    {
        _1447 = _1399;
    }
    float _1463 = _1447;
    bool _1465 = !_1441;
    float _1467 = _1463;
    if (!_1465)
    {
        float _1469 = _197 * _197;
        float _1471 = fma(_195, _195, _1469);
        float _1473 = fma(_199, _199, _1471);
        float _1475 = rsqrt(_1395);
        float _1477 = sqrt(_1473);
        float _1479 = _1371 * _1475;
        float _1481 = _1367 * _1475;
        float _1483 = _1381 * _1475;
        bool _1485 = _1477 > 0.0;
        float _1487 = _1477;
        float _1489 = _1475;
        if (!_1485)
        {
            _1487 = _1433;
        }
        float _1491 = _1487;
        _1455 = _1491;
        if (!_1485)
        {
            _1459 = _1391;
        }
        float _1493 = _1459;
        _1461 = _1493;
        if (!_1485)
        {
            _1489 = _1399;
        }
        float _1495 = _1489;
        bool _1497 = !_1485;
        _1467 = _1495;
        if (!_1497)
        {
            float _1499 = rsqrt(_1473);
            float _1501 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1503 = _197 * _1499;
            float _1505 = _195 * _1499;
            float _1507 = _199 * _1499;
            float _1509 = _1481 * _1503;
            float _1511 = fma(_1479, _1505, _1509);
            float _1513 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1515 = fma(_1483, _1507, _1511);
            float _1517 = _1515 * _1513;
            float _1519 = fma(_195, _1517, _1433);
            float _1521 = fma(_197, _1517, _1391);
            float _1523 = fma(_199, _1517, _1399);
            _1455 = _1519;
            _1461 = _1521;
            _1467 = _1523;
        }
    }
    float _1525 = _1455;
    float _1527 = _1461;
    float _1529 = _1467;
    float _1531 = _1525;
    float _1533 = _1529;
    if (_1425)
    {
        _1449 = 1.0;
    }
    float _1535 = _1449;
    float _1537 = _1535;
    if (_1413)
    {
        _203 = _1525;
    }
    float _1539 = _203;
    float _1541 = _1539;
    if (_1413)
    {
        _205 = _1527;
    }
    float _1543 = _205;
    float _1545 = _1543;
    if (!_1413)
    {
        float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1549 = _1279 + _1547;
        float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1553 = _1289 + _1551;
        float _1555 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1557 = -_1289;
        float _1559 = _1557 + _1525;
        float _1561 = _1549 * _1549;
        float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1565 = _1283 + _1563;
        float _1567 = -_1279;
        float _1569 = _1567 + _1527;
        float _1571 = fma(_1553, _1553, _1561);
        float _1573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1575 = fma(_1565, _1565, _1571);
        float _1577 = sqrt(_1575);
        float _1579 = _1555 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1581 = -_1283;
        float _1583 = _1581 + _1529;
        float _1585 = precise::min(_1577, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1587 = _1585 * _1573;
        float _1589 = _1579 * _1587;
        float _1591 = fma(_1559, _1589, _1289);
        float _1593 = fma(_1569, _1589, _1279);
        float _1595 = fma(_1583, _1589, _1283);
        _1531 = _1559;
        _1545 = _1593;
        _1541 = _1591;
        _1533 = _1595;
    }
    float _1597 = _1531;
    float _1599 = _1545;
    float _1601 = _1541;
    float _1603 = _1533;
    float _1605 = _1597;
    if (_1425)
    {
        _1605 = 1.0;
    }
    float _1607 = _1605;
    float _1609 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1611 = _1439 * _1609;
    float _1613 = _1607;
    if (!_1425)
    {
        float _1615 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1617 = _1615 * 0.15915493667125701904296875;
        float _1619 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1621 = _1617 * 6.283185482025146484375;
        float _1623 = cos(_1621);
        float _1625 = _1619 * 0.15915493667125701904296875;
        float _1627 = _1617 * 6.283185482025146484375;
        float _1629 = sin(_1627);
        float _1631 = 1.0 / _1623;
        float _1633 = _1625 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        float _1637 = _1629 * _1631;
        float _1639 = _1625 * 6.283185482025146484375;
        float _1641 = sin(_1639);
        float _1643 = _1635 * _1637;
        float _1645 = 1.0 / _1643;
        float _1647 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1649 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1647;
        float _1651 = 1.0 / _1649;
        float _1653 = _1641 * _1645;
        float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1657 = fma(_1611, _1653, _1655);
        float _1659 = _1657 * _1651;
        float _1661 = precise::clamp(_1659, 0.0, 1.0);
        _1451 = _1625;
        _1309 = _1617;
        _1537 = _1661;
    }
    float _1663 = _1451;
    float _1665 = _1309;
    float _1667 = _1537;
    float _1669 = _1663;
    float _1671 = _1665;
    if (!_1425)
    {
        float _1673 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1675 = _1673 * 0.15915493667125701904296875;
        float _1677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1679 = _1675 * 6.283185482025146484375;
        float _1681 = cos(_1679);
        float _1683 = _1677 * 0.15915493667125701904296875;
        float _1685 = _1675 * 6.283185482025146484375;
        float _1687 = sin(_1685);
        float _1689 = 1.0 / _1681;
        float _1691 = _1683 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        float _1695 = _1687 * _1689;
        float _1697 = _1683 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        float _1701 = _1693 * _1695;
        float _1703 = 1.0 / _1701;
        float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1707 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1705;
        float _1709 = 1.0 / _1707;
        float _1711 = _1699 * _1703;
        float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1715 = fma(_1611, _1711, _1713);
        float _1717 = _1715 * _1709;
        float _1719 = precise::clamp(_1717, 0.0, 1.0);
        float _1721 = -_1719;
        float _1723 = _1721 + 1.0;
        _1669 = _1701;
        _1671 = _1711;
        _1613 = _1723;
    }
    float _1725 = _1669;
    float _1727 = _1671;
    float _1729 = _1613;
    float _1731 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1733 = _1599 + _1731;
    float _1735 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1737 = _1601 + _1735;
    float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1741 = _1603 + _1739;
    float _1743 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1745 = _1733 * _1733;
    float _1747 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1743);
    float _1749 = fma(_1737, _1737, _1745);
    float _1751 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1753 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1747);
    float _1755 = fma(_1741, _1741, _1749);
    float _1757 = rsqrt(_1755);
    float _1759 = _1757 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1761 = _1737 * _1759;
    float _1763 = _1741 * _1759;
    float _1765 = _1761 * _1761;
    float _1767 = _1763 * _1763;
    float _1769 = _1765 + _1767;
    float _1771 = sqrt(_1769);
    bool _1773 = _1771 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1777 = _1771 + _1775;
    float _1779 = _1749;
    float _1781 = _1757;
    float _1783 = _1777;
    float _1785 = _1725;
    float _1787 = _1765;
    float _1789 = _1761;
    if (_1773)
    {
        float _1791 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1779 = _1791;
    }
    float _1793 = _1779;
    if (_1773)
    {
        float _1795 = rsqrt(_1769);
        _1781 = _1795;
    }
    float _1797 = _1781;
    float _1799 = _1793;
    float _1801 = _1797;
    if (_1773)
    {
        float _1803 = _1777 * _1793;
        _1783 = _1803;
    }
    float _1805 = _1783;
    if (_1773)
    {
        float _1807 = _1805 * 0.15915493667125701904296875;
        _1785 = _1807;
    }
    float _1809 = _1785;
    float _1811 = _1741;
    float _1813 = _1809;
    if (_1773)
    {
        float _1815 = _1809 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        _1811 = _1817;
    }
    float _1819 = _1811;
    float _1821 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1823 = precise::max(0.0, _1821);
    float _1825 = _1727;
    if (_1773)
    {
        float _1827 = _1809 * 6.283185482025146484375;
        float _1829 = cos(_1827);
        _1825 = _1829;
    }
    float _1831 = _1825;
    float _1833 = -_1759;
    float _1835 = -_1823;
    float _1837 = fma(_1733, _1833, _1835);
    float _1839 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1773)
    {
        float _1841 = _1837 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1799 = _1841;
    }
    float _1843 = _1799;
    float _1845 = _1843;
    if (!_1773)
    {
        _1813 = _1763;
    }
    float _1847 = _1813;
    float _1849 = fma(_1289, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1851 = _1847;
    if (_1773)
    {
        float _1853 = fma(_1819, _1843, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1845 = _1853;
    }
    float _1855 = _1845;
    float _1857 = floor(_1849);
    float _1859 = _1855;
    if (_1773)
    {
        float _1861 = _1831 + (-1.0);
        _1839 = _1861;
    }
    float _1863 = _1839;
    float _1865 = _1863;
    if (_1773)
    {
        float _1867 = _1797 * _1855;
        _1311 = _1867;
    }
    float _1869 = _1311;
    if (!_1773)
    {
        _1801 = _1761;
    }
    float _1871 = _1801;
    float _1873 = _1871;
    if (_1773)
    {
        float _1875 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1865 = _1875;
    }
    float _1877 = _1865;
    if (_1773)
    {
        float _1879 = _1761 * _1869;
        _1873 = _1879;
    }
    float _1881 = _1873;
    if (!_1773)
    {
        _1859 = _1837;
    }
    float _1883 = _1859;
    float _1885 = _1883;
    if (_1773)
    {
        float _1887 = _1763 * _1869;
        _1851 = _1887;
    }
    float _1889 = _1851;
    if (_1773)
    {
        float _1891 = fma(_1837, _1831, _1877);
        _1885 = _1891;
    }
    float _1893 = _1885;
    if (_1773)
    {
        float _1895 = _1881 * _1881;
        _1787 = _1895;
    }
    float _1897 = _1787;
    float _1899 = sqrt(_1755);
    if (!_1773)
    {
        _1789 = _1767;
    }
    float _1901 = _1789;
    float _1903 = _1901;
    if (_1773)
    {
        float _1905 = _1889 * _1889;
        _1903 = _1905;
    }
    float _1907 = _1903;
    float _1909 = fma(_1893, _1893, _1897);
    float _1911 = fma(_1283, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1913 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1915 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1917 = _1909 + _1907;
    float _1919 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1921 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1913);
    float _1923 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1915);
    float _1925 = floor(_1911);
    float _1927 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1919);
    float _1929 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1921);
    float _1931 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1923);
    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1935 = fma(_1899, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1933);
    float _1937 = precise::clamp(_1935, 0.0, 1.0);
    float _1939 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1927);
    float _1941 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1943 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1945 = rsqrt(_1917);
    float _1947 = -_1937;
    float _1949 = _1947 + 1.0;
    float _1951 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1953 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1955 = _1943 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1957 = -_1857;
    float _1959 = _1849 + _1957;
    float _1961 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1963 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1953);
    float _1965 = abs(_1949);
    float _1967 = log2(_1965);
    float _1969 = -_1955;
    float _1971 = fma(_1969, _1751, 1.0);
    float _1973 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1975 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1963);
    float _1977 = -_1925;
    float _1979 = _1911 + _1977;
    float _1981 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1961);
    float _1983 = _1945 * _1881;
    float _1985 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1975);
    float _1987 = _1945 * _1893;
    float _1989 = _1945 * _1889;
    float _1991 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1993 = log2(_1971);
    float _1995 = _1987 + 1.0;
    float _1997 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1981);
    float _1999 = -_1991;
    float _2001 = fma(_1987, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1999);
    float _2003 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2005 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1997);
    float _2007 = -_1989;
    float _2009 = fma(_2007, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2001);
    float _2011 = 1.0 / _1985;
    float _2013 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2015 = fma(_2009, -0.5, 0.5);
    float _2017 = fma(_2009, 0.5, 0.5);
    float _2019 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2013);
    float _2021 = exp2(_2003);
    float _2023 = fma(_2017, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2025 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2019);
    float _2027 = _1993 * 0.693147182464599609375;
    float _2029 = fma(_2017, _2023, -0.212114393711090087890625);
    float _2031 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2033 = sqrt(_2015);
    float _2035 = fma(_2017, _2029, 1.570728778839111328125);
    float _2037 = _2005 * _2011;
    float _2039 = -_1987;
    float _2041 = fma(_2021, _1995, _2039);
    float _2043 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2025);
    float _2045 = fma(_2037, 0.5, 0.5);
    float _2047 = fma(_2041, 0.5, 0.5);
    float _2049 = _2043 * _2011;
    float _2051 = _2033 * 0.636619746685028076171875;
    float _2053 = fma(_2049, -0.5, 0.5);
    float _2055 = -_2035;
    float _2057 = fma(_2051, _2055, 1.0);
    float2 _6548 = float2(_1959, _1979);
    float _2059 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6548, float2(0.0), isnan(_6548)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6548, float2(0.0), isnan(_6548)), level(0.0)).x;
    float3 _6559 = float3(_2045, _2053, _2031);
    float _2061 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6559, float3(0.0), isnan(_6559)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6559, float3(0.0), isnan(_6559)), level(0.0)).x;
    float3 _6570 = float3(_2045, _2053, _2031);
    float4 _2064 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6570, float3(0.0), isnan(_6570)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6570, float3(0.0), isnan(_6570)), level(0.0)).xyzw;
    float _2066 = _2064.x;
    float _2068 = _2064.y;
    float _2070 = _2064.z;
    float _2072 = _2064.w;
    float2 _6586 = float2(_2057, _2047);
    float3 _2076 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6586, float2(0.0), isnan(_6586)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6586, float2(0.0), isnan(_6586)), level(0.0)).xyz;
    float _2078 = _2076.x;
    float _2080 = _2076.y;
    float _2082 = _2076.z;
    float _2084 = float(uint(_877));
    float _2086 = trunc(_969);
    int _2088 = int(_2086);
    int _2090 = ~_877;
    int _2092 = _2090 + 1;
    float _2094 = -_971;
    float _2096 = _2094 + 1.0;
    int _2098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2100 = _2098 != 0;
    float _2102 = _989 * _163;
    int _2104 = ~_877;
    int _2106 = _2104 + 1;
    out.m_72.w = _1059;
    bool _2108 = _153 > 0.5;
    float _2110 = 1.0 / _2084;
    out.m_74.x = _1289;
    out.m_74.y = _1279;
    out.m_74.z = _1283;
    bool _2112 = _717 > 0.5;
    float _2114 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2118 = _2116 != 0;
    out.m_76.x = _1169;
    float _2120 = trunc(_2102);
    int _2122 = int(_2120);
    float _2124 = float(uint(_2088));
    out.m_78.x = _1601;
    out.m_78.y = _1599;
    out.m_78.z = _1603;
    bool _2126 = !_2118;
    float _2128 = _2126 ? 7.345489978790283203125 : 1.0;
    int _2130 = abs(_839);
    float _2132 = _2128 * _153;
    int _2134 = as_type<int>(_2110) + (-2);
    float _2136 = exp2(_2114);
    float _2138 = float(_2088);
    int _2140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2142 = _2140 != 0;
    float _2144 = as_type<float>(_2134) * _2124;
    bool _2146 = _2138 >= _983;
    bool _2148 = isnan(_2138);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan(_983);
    bool _2154 = _2150 || _2152;
    float _2156 = float(_2154);
    float _2158 = trunc(_2144);
    float _2160 = precise::max(_2158, 0.0);
    uint _2163 = uint(_2160);
    bool _2165 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2167 = isnan(_707);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2173 = _2169 || _2171;
    float _2175 = float(_2173);
    float _2177 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2179 = _2177 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2181 = -_2175;
    float _2183 = _2181 + 1.0;
    int _2185 = ~_877;
    int _2187 = _2185 + 1;
    float _2189 = floor(_2132);
    float _2191 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2193 = _2191 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2195 = -_2136;
    float _2197 = _2195 + 1.0;
    float _2199 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2201 = _2106 * int(_2163);
    int _2203 = _2201 + _2088;
    float _2205 = trunc(_2156);
    int _2207 = int(_2205);
    float _2209 = float(uint(_2203));
    float _2211 = -_2189;
    float _2213 = _2132 + _2211;
    float _2215 = as_type<float>(_2134) * _2209;
    float _2217 = _2213 * _983;
    float _2219 = 1.0 / _2179;
    float _2221 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2223 = _2221 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2225 = ~_2207;
    int _2227 = _2225 + 1;
    int _2229 = _2227 + 1;
    float _2231 = trunc(_2215);
    float _2233 = precise::max(_2231, 0.0);
    uint _2235 = uint(_2233);
    float _2237 = 1.0 / _2223;
    float _2239 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2241 = _2239 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2243 = int(_2163) + int(_2235);
    float _2245 = trunc(_2217);
    int _2247 = int(_2245);
    int _2249 = _2092 * _2243;
    int _2251 = _2249 + _2088;
    float _2253 = 1.0 / _2241;
    bool _2255 = uint(_2251) >= uint(_877);
    bool _2257 = !_2255;
    int _2259 = _2257 ? 0 : (-1);
    float _2261 = 1.0 / _2193;
    bool _2263 = _877 == 0;
    int _2265 = ~_2243;
    int _2267 = _2265 + _2259;
    int _2269 = _2267 + 1;
    int _2271 = _877 * _2269;
    int _2273 = _2271 + _2088;
    float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2275;
    float _2279 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2281 = _2279 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2283 = !_2263;
    int _2285 = _2283 ? _2273 : (-1);
    float _2287 = _2277 * _2237;
    bool _2289 = !_2142;
    int _2291 = _2289 ? 0 : 1;
    int _2293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2295 = _2293 != 0;
    int _2297 = _2285 * _2229;
    float _2299 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2301 = _2299 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2303 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2305 = _2303 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2307 = _877 + (-1);
    float _2309 = 1.0 / _2281;
    int _2311 = abs(_2291);
    float _2313 = _2305 * _2253;
    int _2315 = abs(_811);
    int _2317 = _2207 * _2307;
    int _2319 = _2317 + _2297;
    float _2321 = 1.0 / _2301;
    int _2323 = _2247 * _2311;
    int _2325 = _2323 + _2088;
    int _2327 = abs(_883);
    int _2329 = _2319 * _2130;
    float _2331 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2333 = _707 + _2331;
    float _2335 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2337 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2335;
    bool _2339 = !_2100;
    int _2341 = _2339 ? 0 : 1;
    float _2343 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2345 = _2343 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2347 = _2122 * _2315;
    int _2349 = _2347 + _2329;
    float _2351 = fma(_2287, _2333, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2353 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2355 = isnan(_707);
    bool _2357 = _2353 || _2355;
    bool _2359 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2361 = _2357 || _2359;
    float _2363 = float(_2361);
    bool _2365 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2367 = isnan(_707);
    bool _2369 = _2365 || _2367;
    bool _2371 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2373 = _2369 || _2371;
    float _2375 = float(_2373);
    float _2377 = _2337 * _2321;
    int _2379 = _2325 * _2327;
    int _2381 = _2379 + _2349;
    bool _2383 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2385 = isnan(_707);
    bool _2387 = _2383 || _2385;
    bool _2389 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2391 = _2387 || _2389;
    float _2393 = float(_2391);
    float _2395 = -_2363;
    float _2397 = _2395 + 1.0;
    int _2399 = abs(_2341);
    float _2401 = -_2375;
    float _2403 = _2401 + 1.0;
    float _2405 = _2393 * _2397;
    float _2407 = -_2393;
    float _2409 = _2407 + 1.0;
    bool _2411 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2413 = isnan(_707);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2419 = _2415 || _2417;
    float _2421 = float(_2419);
    float _2423 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2425 = _2423 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2427 = _2375 * _2409;
    int _2429 = _2247 * _2399;
    int _2431 = _2429 + _2381;
    bool _2433 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2435 = isnan(_707);
    bool _2437 = _2433 || _2435;
    bool _2439 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2441 = _2437 || _2439;
    float _2443 = float(_2441);
    float _2445 = _2421 * _2403;
    float _2447 = -_2421;
    float _2449 = _2447 + 1.0;
    float _2451 = 1.0 / _2425;
    float _2453 = float(uint(_2431));
    bool _2455 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2457 = isnan(_707);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2463 = _2459 || _2461;
    float _2465 = float(_2463);
    float _2467 = _2443 * _2449;
    float _2469 = -_2443;
    float _2471 = _2469 + 1.0;
    float _2473 = as_type<float>(_2134) * _2453;
    bool _2475 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2477 = isnan(_707);
    bool _2479 = _2475 || _2477;
    bool _2481 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2483 = _2479 || _2481;
    float _2485 = float(_2483);
    float _2487 = _2465 * _2471;
    float _2489 = -_2465;
    float _2491 = _2489 + 1.0;
    int _2493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2495 = _2493 != 0;
    float _2497 = trunc(_2473);
    float _2499 = precise::max(_2497, 0.0);
    uint _2501 = uint(_2499);
    float _2503 = _2485 * _2183;
    float _2505 = _2175 * _2491;
    float _2507 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2509 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2507;
    float _2511 = _2345 * _2451;
    float _2513 = -_2485;
    float _2515 = _2513 + 1.0;
    float _2517 = _2509 * _2219;
    float _2519 = _2351 * _2503;
    float _2521 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2523 = _707 + _2521;
    float _2525 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2527 = _2525 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2529;
    float _2533 = fma(_2313, _2523, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2535 = fma(_2515, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2519);
    float _2537 = _2527 * _2309;
    int _2539 = _2187 * int(_2501);
    int _2541 = _2539 + _2431;
    float _2543 = _2531 * _2261;
    float _2545 = float(uint(_2325));
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2549 = _707 + _2547;
    float _2551 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2553 = _707 + _2551;
    float _2555 = float(uint(_2541));
    float _2557 = fma(_2533, _2505, _2535);
    float _2559 = fma(_2377, _2549, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2561 = fma(_2511, _2553, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2565 = _707 + _2563;
    float _2567 = as_type<float>(_2134) * _2555;
    float _2569 = as_type<float>(_2134) * _2545;
    float _2571 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2573 = _707 + _2571;
    float _2575 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2577 = _707 + _2575;
    float _2579 = fma(_2517, _2565, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2581 = trunc(_2569);
    float _2583 = precise::max(_2581, 0.0);
    uint _2585 = uint(_2583);
    float _2587 = fma(_2537, _2573, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2589 = ~_877;
    int _2591 = _2589 + 1;
    float _2593 = fma(_2559, _2487, _2557);
    float _2595 = -_1151;
    int _2597 = _2112 ? as_type<int>(_2595) : as_type<int>(_1151);
    float _2599 = fma(_2543, _2577, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2601 = -_1155;
    int _2603 = _2108 ? as_type<int>(_2601) : as_type<int>(_1155);
    float _2605 = fma(_2561, _2467, _2593);
    float _2607 = trunc(_2567);
    float _2609 = precise::max(_2607, 0.0);
    uint _2611 = uint(_2609);
    bool _2613 = !_2295;
    float _2615 = _2613 ? _1151 : as_type<float>(_2597);
    int _2617 = ~_877;
    int _2619 = _2617 + 1;
    float _2621 = fma(_2579, _2445, _2605);
    float _2623 = fma(_2587, _2427, _2621);
    float _2625 = -_979;
    float _2627 = _2625 + 1.0;
    float _2629 = fma(_2599, _2405, _2623);
    int _2631 = int(_2501) + int(_2611);
    int _2633 = _2619 * int(_2585);
    int _2635 = _2633 + _2325;
    bool _2637 = !_2495;
    float _2639 = _2637 ? _1155 : as_type<float>(_2603);
    float _2641 = _2615 + (-0.5);
    float _2643 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2629);
    int _2645 = _2591 * _2631;
    int _2647 = _2645 + _2431;
    float _2649 = float(uint(_2635));
    float _2651 = -_2641;
    float _2653 = -_885;
    float _2655 = fma(_2651, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2653);
    float _2657 = _2639 + 0.5;
    out.m_80.x = _2643;
    bool _2659 = uint(_2647) >= uint(_877);
    float _2661 = as_type<float>(_2134) * _2649;
    float _2663 = fma(_2615, _2096, _2655);
    float _2665 = fma(_2657, (*spvDescriptorSet0.vp_c9)._m0[80].x, _743);
    bool _2667 = !_2659;
    int _2669 = _2667 ? 0 : (-1);
    float _2671 = trunc(_2661);
    float _2673 = precise::max(_2671, 0.0);
    uint _2675 = uint(_2673);
    int _2677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2679 = _2677 != 0;
    float _2681 = -_2627;
    float _2683 = fma(_2639, _2681, _2665);
    int _2685 = ~_2631;
    int _2687 = _2685 + _2669;
    int _2689 = _2687 + 1;
    int _2691 = ~_877;
    int _2693 = _2691 + 1;
    out.m_82.x = _2683;
    out.m_82.y = _2663;
    int _2695 = _877 * _2689;
    int _2697 = _2695 + _2431;
    float _2699 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2701 = !_2263;
    int _2703 = _2701 ? _2697 : (-1);
    int _2705 = int(_2585) + int(_2675);
    float _2707 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2709 = _2703 >> 31;
    float _2711 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2713 = _2709 & 3;
    float _2715 = -_1193;
    float _2717 = fma(_2715, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2699);
    float _2719 = -_1193;
    float _2721 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2707);
    float _2723 = -_1193;
    float _2725 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2711);
    int _2727 = _2703 + _2713;
    float _2729 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2717);
    int _2731 = _2693 * _2705;
    int _2733 = _2731 + _2325;
    float _2735 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2725);
    int _2737 = _2727 >> 2;
    float _2739 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2721);
    float _2741 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2743 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2745 = _2737 << 4;
    int _2747 = _2745 + 368;
    float _2749 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2751 = uint(_2733) >= uint(_877);
    float _2753 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _2755 = uint(int(uint(_2747) >> uint(2)));
    uint _2757 = uint(int(uint(int(_2755)) >> uint(2)));
    int _2759 = int(_2755) & 3;
    float _2761 = (*spvDescriptorSet0.vp_c9)._m0[int(_2757)][_2759];
    int _2763 = int(_2755) + 1;
    uint _2765 = uint(int(uint(_2763) >> uint(2)));
    int _2767 = _2763 & 3;
    float _2769 = (*spvDescriptorSet0.vp_c9)._m0[int(_2765)][_2767];
    float _2771 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2741);
    float _2773 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2743);
    float _2775 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2749);
    float _2777 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2779 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2781 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2783 = abs(_1611);
    float _2785 = log2(_2783);
    float _2787 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2777);
    float _2789 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2779);
    float _2791 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2781);
    float _2793 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2771);
    int _2795 = _2703 & 3;
    bool _2797 = _2795 != 0;
    int _2799 = _2747 + 8;
    uint _2801 = uint(int(uint(_2799) >> uint(2)));
    uint _2803 = uint(int(uint(int(_2801)) >> uint(2)));
    int _2805 = int(_2801) & 3;
    float _2807 = (*spvDescriptorSet0.vp_c9)._m0[int(_2803)][_2805];
    int _2809 = int(_2801) + 1;
    uint _2811 = uint(int(uint(_2809) >> uint(2)));
    int _2813 = _2809 & 3;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[int(_2811)][_2813];
    int _2817 = _2703 & 3;
    bool _2819 = _2817 != 0;
    float _2821 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2773);
    bool _2823 = uint(_2795) > 1u;
    float _2825 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2827 = _2819 ? 0 : 1;
    float _2829 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2787);
    float _2831 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2789);
    bool _2833 = !_2751;
    int _2835 = _2833 ? 0 : (-1);
    float _2837 = _2753 * _2735;
    int _2839 = ~_2827;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    float _2845 = _2785 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2847 = ~_2705;
    int _2849 = _2847 + _2835;
    int _2851 = _2849 + 1;
    float _2853 = _2753 * _2729;
    bool _2855 = uint(_2795) >= 2u;
    float _2857 = fma(_2825, _2793, _2837);
    int _2859 = _2843;
    float _2861 = _2068;
    float _2863 = _2066;
    float _2865 = _1985;
    float _2867 = _2043;
    if (!_2823)
    {
        int _2869 = ~_2827;
        int _2871 = _2869 + 1;
        _2859 = _2871;
    }
    int _2873 = _2859;
    int _2875 = _877 * _2851;
    int _2877 = _2875 + _2325;
    bool _2879 = _2795 != 3;
    float _2881 = exp2(_2845);
    bool _2883 = !_2797;
    int _2885 = _2883 ? 0 : 1;
    float _2887 = fma(_2825, _2821, _2853);
    int _2889 = _2855 ? 0 : 1;
    float _2891 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2791);
    int _2893 = abs(_2873);
    float _2895 = in.m_84.x;
    int _2897 = abs(_2885);
    float _2899 = -_2059;
    float _2901 = _2899 + 1.0;
    int _2903 = ~_2889;
    int _2905 = _2903 + 1;
    int _2907 = _2905 + 1;
    float _2909 = _2753 * _2739;
    bool _2911 = _2795 != 3;
    float _2913 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2775);
    int _2915 = _2907;
    if (_2879)
    {
        int _2917 = ~_2889;
        int _2919 = _2917 + 1;
        _2915 = _2919;
    }
    int _2921 = _2915;
    float _2923 = _2199 * _2061;
    int _2925 = ~_2893;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    float _2931 = fma(_2825, _2913, _2909);
    float _2933 = _2005 + _1985;
    bool _2935 = !_2911;
    int _2937 = _2935 ? 0 : (-1);
    int _2939 = _2929 * as_type<int>(_2769);
    int _2941 = abs(_2921);
    bool _2943 = _1611 <= 8000.0;
    bool _2945 = isnan(_1611);
    bool _2947 = _2943 || _2945;
    bool _2949 = isnan(8000.0);
    bool _2951 = _2947 || _2949;
    float _2953 = float(_2951);
    float _2955 = fma(_2881, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2957 = precise::clamp(_2955, 0.0, 1.0);
    int _2959 = ~_2897;
    int _2961 = _2959 + 1;
    int _2963 = _2961 + 1;
    float _2965 = _2082 * _2923;
    bool _2967 = !_2679;
    int _2969 = _2967 ? 0 : 1;
    float _2971 = fma(_2957, -2.0, 3.0);
    int _2973 = abs(_2937);
    int _2975 = _2963 * as_type<int>(_2761);
    int _2977 = _2975 + _2939;
    float _2979 = _2957 * _2957;
    int _2981 = abs(_2969);
    float _2983 = -_2199;
    float _2985 = _2983 + 1.0;
    float _2987 = _2979 * _2971;
    int _2989 = ~_2941;
    int _2991 = _2989 + 1;
    int _2993 = _2991 + 1;
    float _2995 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2997 = _2933 * 0.5;
    int _2999 = ~_2973;
    int _3001 = _2999 + 1;
    int _3003 = _3001 + 1;
    int _3005 = _2993 * as_type<int>(_2807);
    int _3007 = _3005 + _2977;
    int _3009 = ~_2981;
    int _3011 = _3009 + 1;
    int _3013 = _3011 + 1;
    float _3015 = -_2987;
    float _3017 = _3015 + 1.0;
    float _3019 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2995);
    int _3021 = _3003 * as_type<int>(_2815);
    int _3023 = _3021 + _3007;
    bool _3025 = !_2263;
    int _3027 = _3025 ? _2877 : (-1);
    float _3029 = fma(_3017, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2987);
    float _3031 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3019);
    int _3033 = _3023 * _3013;
    float _3035 = _2953 * _3029;
    float _3037 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3031);
    int _3039 = _3027 * _2981;
    int _3041 = _3039 + _3033;
    float _3043 = _2831 + _2887;
    float _3045 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3047 = _3037 + _1985;
    out.gl_Position.x = _2005;
    out.gl_Position.y = _2043;
    out.gl_Position.z = _3037;
    out.gl_Position.w = _1985;
    float _3049 = float(_3041);
    float _3051 = _1985 * 0.5;
    float _3053 = _2901 * _3045;
    float _3055 = precise::clamp(_3053, 0.0, 1.0);
    float _3057 = _3047 * 0.5;
    float _3059 = _2891 + _2931;
    float _3061 = fma(_2043, -0.5, _3051);
    float _3063 = _2829 + _2857;
    out.m_86.x = _3049;
    float _3065 = _2072 * _2985;
    bool _3067 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3069 = isnan(_1899);
    bool _3071 = _3067 || _3069;
    bool _3073 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3075 = _3071 || _3073;
    float _3077 = -_3055;
    float _3079 = fma(_3077, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3081 = _2072 * _2923;
    out.m_88.x = _2997;
    out.m_88.y = _3061;
    out.m_88.z = _3057;
    out.m_88.w = _1985;
    float _3083 = _3079 * _2895;
    float _3085 = fma(_2078, _3081, _2066);
    float _3087 = fma(_2080, _3081, _2068);
    float _3089 = fma(_2072, _2965, _2070);
    float _3091 = _3083 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.x = _3063;
    out.m_90.y = _3043;
    out.m_90.z = _3059;
    float _3093 = _1667 * _1729;
    float _3095 = _3037;
    float _3097 = _3093;
    if (!_3075)
    {
        _2861 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3099 = _2861;
    out.m_92.x = _3091;
    float _3101 = _3093 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3103 = _3099;
    float _3105 = _3099;
    if (!_3075)
    {
        _2863 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3107 = _2863;
    out.m_94.x = _3085;
    out.m_94.y = _3087;
    out.m_94.z = _3089;
    out.m_94.w = _3065;
    float _3109 = _3107;
    float _3111 = _3107;
    if (!_3075)
    {
        _2865 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3113 = _2865;
    float _3115 = _3113;
    float _3117 = _3113;
    if (!_3075)
    {
        _3095 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3119 = _3095;
    float _3121 = _3119;
    float _3123 = _3119;
    if (!_3075)
    {
        _2867 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3125 = _2867;
    float _3127 = _3125;
    float _3129 = _3125;
    if (!_3075)
    {
        _3097 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3131 = _3097;
    bool _3133 = !_3075;
    float _3135 = _3131;
    float _3137 = _3131;
    if (!_3133)
    {
        bool _3139 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3141 = isnan(_1899);
        bool _3143 = _3139 || _3141;
        bool _3145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3147 = _3143 || _3145;
        if (!_3147)
        {
            float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3151 = _1899 + _3149;
            float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3155 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3153;
            float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3161 = 1.0 / _3155;
            float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3179 = _3151 * _3161;
            float _3181 = precise::clamp(_3179, 0.0, 1.0);
            float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3187 = fma(_3181, _3159, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3189 = fma(_3181, _3185, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3191 = fma(_3181, _3165, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3193 = fma(_3181, _3169, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3195 = fma(_3181, _3173, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3197 = fma(_3181, _3177, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3111 = _3191;
            _3129 = _3195;
            _3105 = _3187;
            _3123 = _3193;
            _3117 = _3189;
            _3137 = _3197;
            _3199 = true;
        }
        else
        {
            bool _3201 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3203 = isnan(_1899);
            bool _3205 = _3201 || _3203;
            bool _3207 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3209 = _3205 || _3207;
            if (!_3209)
            {
                _3103 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3211 = _3103;
            _3105 = _3211;
            if (!_3209)
            {
                _3109 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3213 = _3109;
            _3111 = _3213;
            if (!_3209)
            {
                _3115 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3215 = _3115;
            _3117 = _3215;
            if (!_3209)
            {
                _3121 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3217 = _3121;
            _3123 = _3217;
            if (!_3209)
            {
                _3127 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3219 = _3127;
            _3129 = _3219;
            if (!_3209)
            {
                _3135 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3221 = _3135;
            bool _3223 = !_3209;
            _3137 = _3221;
            if (!_3223)
            {
                bool _3225 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3227 = isnan(_1899);
                bool _3229 = _3225 || _3227;
                bool _3231 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3233 = _3229 || _3231;
                if (!_3233)
                {
                    float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3237 = _1899 + _3235;
                    float _3239 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3241 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3239;
                    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3247 = 1.0 / _3241;
                    float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3265 = _3237 * _3247;
                    float _3267 = precise::clamp(_3265, 0.0, 1.0);
                    float _3269 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3271 = _3269 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3273 = fma(_3267, _3245, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3275 = fma(_3267, _3271, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3277 = fma(_3267, _3251, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3279 = fma(_3267, _3255, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3281 = fma(_3267, _3259, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3283 = fma(_3267, _3263, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3111 = _3277;
                    _3129 = _3281;
                    _3105 = _3273;
                    _3123 = _3279;
                    _3117 = _3275;
                    _3137 = _3283;
                    _3199 = true;
                }
                else
                {
                    _3111 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3129 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3105 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3123 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3117 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3137 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3199 = false;
    float _3285 = _3111;
    float _3287 = _3129;
    float _3289 = _3105;
    float _3291 = _3123;
    float _3293 = _3117;
    float _3295 = _3137;
    float _3297 = _3101 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3299 = fma(_3043, -0.5, 0.5);
    float _3301 = precise::clamp(_3299, 0.0, 1.0);
    float _3303 = -_3285;
    float _3305 = _3303 + _3287;
    float _3307 = -_3289;
    float _3309 = _3307 + _3291;
    out.m_96.x = 0.0;
    float _3311 = fma(_3301, _3305, _3285);
    float _3313 = -_3293;
    float _3315 = _3313 + _3295;
    float _3317 = fma(_3301, _3309, _3289);
    float _3319 = _3311 * 0.586610972881317138671875;
    bool _3321 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3323 = fma(_3301, _3315, _3293);
    out.m_53.x = _3297;
    float _3325 = fma(_3317, 0.298911988735198974609375, _3319);
    bool _3327 = _1667 > 0.0;
    bool _3329 = isnan(_1667);
    bool _3331 = _3327 || _3329;
    bool _3333 = isnan(0.0);
    bool _3335 = _3331 || _3333;
    float _3337 = fma(_3323, 0.114477999508380889892578125, _3325);
    bool _3339 = _1729 <= 0.0;
    bool _3341 = !_3335;
    bool _3343 = _3339 || _3341;
    float _3345 = -_3337;
    float _3347 = _3317 + _3345;
    float _3349 = -_3337;
    float _3351 = _3311 + _3349;
    float _3353 = -_3337;
    float _3355 = _3323 + _3353;
    float _3357 = fma(_3347, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3359 = fma(_3351, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3361 = fma(_3355, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    bool _3363 = !_3321;
    if (!_3363)
    {
        float _3365 = -_1599;
        float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3369 = -_1601;
        float _3371 = _3369 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3373 = -_1603;
        float _3375 = _3373 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3377 = _3367 * _3367;
        float _3379 = fma(_3371, _3371, _3377);
        float _3381 = fma(_3375, _3375, _3379);
        float _3383 = sqrt(_3381);
        float _3385 = rsqrt(_3381);
        float _3387 = -_3383;
        float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3391 = _3389 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3393 = precise::clamp(_3391, 0.0, 1.0);
        float _3395 = _3371 * _3385;
        float _3397 = _3367 * _3385;
        float _3399 = abs(_3393);
        float _3401 = log2(_3399);
        float _3403 = _3375 * _3385;
        float _3405 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3407 = _3043 * _3397;
        float _3409 = -_3397;
        float _3411 = -_3405;
        float _3413 = fma(_3409, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3411);
        float _3415 = fma(_3063, _3395, _3407);
        float _3417 = -_3403;
        float _3419 = fma(_3417, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3413);
        float _3421 = fma(_3059, _3403, _3415);
        float _3423 = precise::clamp(_3421, 0.0, 1.0);
        float _3425 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3427 = _3419 + _3425;
        float _3429 = _3401 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3431 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3433 = precise::clamp(_3431, 0.0, 1.0);
        float _3435 = exp2(_3429);
        float _3437 = _3435 * _3433;
        float _3439 = _3423 * _3437;
        float _3441 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3443 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3445 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3441;
        out.m_96.y = _3443;
        out.m_96.z = _3445;
    }
    out.m_72.x = _3357;
    out.m_72.y = _3359;
    out.m_72.z = _3361;
    if (!_3343)
    {
        return out;
    }
    out.m_53.x = 0.0;
    float _3447 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3447;
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
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_96 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_53 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_57 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _3199 = false;
    bool _523 = false;
    bool _417 = false;
    bool _223 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _110 = in.m_46.w;
    float _112 = in.m_48.w;
    float _114 = trunc(_110);
    int _117 = int(_114);
    float _119 = -_112;
    float _121 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    out.m_51.y = _121;
    bool _125 = _117 >= 1;
    float _127 = 0.0;
    float _129 = _112;
    float _131 = _121;
    if (!_125)
    {
        _127 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _127;
    if (!_125)
    {
        out.m_53.x = 0.0;
    }
    int _135 = 0;
    if (!_125)
    {
        float _137 = _133 * 5.0;
        _135 = as_type<int>(_137);
    }
    int _139 = _135;
    int _141 = _139;
    if (!_125)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3515 = as_type<float>(_139);
        out.gl_Position.z = _3515;
    }
    if (!_125)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    bool _143 = _112 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _145 = isnan(_112);
    bool _147 = _143 || _145;
    bool _149 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _151 = _147 || _149;
    float _153 = in.m_55.x;
    float _155 = float(_117);
    bool _157 = _121 >= _155;
    bool _159 = !_151;
    bool _161 = _157 || _159;
    float _163 = 1.0 / _155;
    if (_161)
    {
        _129 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _165 = _129;
    if (_161)
    {
        out.m_53.x = 0.0;
    }
    float _167 = _121 * _163;
    float _169 = _167;
    if (_161)
    {
        float _171 = _165 * 5.0;
        _141 = as_type<int>(_171);
    }
    int _173 = _141;
    out.m_57.x = _153;
    if (_161)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3580 = as_type<float>(_173);
        out.gl_Position.z = _3580;
    }
    out.m_51.x = _167;
    if (_161)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _175 = in.m_59.x;
    float _177 = in.m_59.y;
    float _179 = in.m_59.z;
    bool _181 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _183 = _177 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _185 = _177 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _187 = _177 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _189 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].x, _183);
    float _191 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].x, _185);
    float _193 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].x, _187);
    float _195 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[4].z, _189);
    float _197 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[5].z, _191);
    float _199 = fma(_179, (*spvDescriptorSet0.vp_c10)._m0[6].z, _193);
    bool _201 = !_181;
    float _203 = _197;
    float _205 = _199;
    float _221;
    if (!_201)
    {
        float _207 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _209 = _153 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _211 = fma(_209, (*spvDescriptorSet0.vp_c9)._m0[12].x, _121);
        float _213 = _211 * _207;
        float _215 = floor(_213);
        float _217 = -_215;
        float _219 = _213 + _217;
        _221 = _219;
        _223 = true;
    }
    else
    {
        _221 = _167;
    }
    _223 = false;
    float _225 = _221;
    float _227 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _229 = _225 + _227;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _233 = _225 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _237 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _239 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _243;
    float _247 = 1.0 / _241;
    bool _249 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _251 = isnan(_225);
    bool _253 = _249 || _251;
    bool _255 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _257 = _253 || _255;
    float _259 = float(_257);
    bool _261 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].x;
    float _263 = 1.0 / _237;
    bool _265 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _267 = isnan(_225);
    bool _269 = _265 || _267;
    bool _271 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _273 = _269 || _271;
    float _275 = float(_273);
    float _277 = 1.0 / _245;
    float _279 = _229 * _263;
    float _281 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _283 = _225 + _281;
    float _285 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _287 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _285;
    float _289 = _283 * _247;
    float _291 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _293 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _291;
    float _295 = fma(_287, _279, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _297 = _233 * _277;
    bool _299 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _301 = isnan(_225);
    bool _303 = _299 || _301;
    bool _305 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _307 = _303 || _305;
    float _309 = float(_307);
    float _311 = fma(_293, _279, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _313 = -_275;
    float _315 = _313 + 1.0;
    float _317 = -_259;
    float _319 = _317 + 1.0;
    bool _321 = _225 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _323 = isnan(_225);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _329 = _325 || _327;
    float _331 = float(_329);
    float _333 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _335 = _333 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _337 = _309 * _315;
    float _339 = -_309;
    float _341 = _339 + 1.0;
    float _343 = _275 * _319;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = fma(_335, _289, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _351 = _331 * _341;
    float _353 = in.m_61.x;
    float _355 = in.m_61.y;
    float _357 = fma(_347, _289, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _359 = _295 * _351;
    float _361 = -_331;
    float _363 = _361 + 1.0;
    float _365 = _311 * _351;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _367;
    float _371 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _373 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _371;
    float _375 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].x, _359);
    float _377 = fma(_363, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _379 = fma(_369, _297, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _381 = fma(_373, _297, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _383 = fma(_349, _337, _375);
    float _385 = fma(_357, _337, _377);
    float _387 = fma(_379, _343, _383);
    float _389 = fma(_381, _343, _385);
    float _391 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[146].x, _387);
    float _393 = fma(_259, (*spvDescriptorSet0.vp_c9)._m0[146].y, _389);
    float _395 = _391 * _353;
    float _397 = _393 * _355;
    bool _399 = !_261;
    float _415;
    if (!_399)
    {
        float _401 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].x;
        float _403 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].y;
        float _405 = fma(_403, (*spvDescriptorSet0.vp_c9)._m0[11].x, _121);
        float _407 = _405 * _401;
        float _409 = floor(_407);
        float _411 = -_409;
        float _413 = _407 + _411;
        _415 = _413;
        _417 = true;
    }
    else
    {
        _415 = _167;
    }
    _417 = false;
    float _419 = _415;
    float _421 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _423 = _419 + _421;
    bool _425 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[108].w;
    bool _427 = isnan(_419);
    bool _429 = _425 || _427;
    bool _431 = isnan((*spvDescriptorSet0.vp_c9)._m0[108].w);
    bool _433 = _429 || _431;
    float _435 = float(_433);
    float _437 = -(*spvDescriptorSet0.vp_c9)._m0[107].w;
    float _439 = (*spvDescriptorSet0.vp_c9)._m0[108].w + _437;
    bool _441 = _419 >= (*spvDescriptorSet0.vp_c9)._m0[107].w;
    bool _443 = isnan(_419);
    bool _445 = _441 || _443;
    bool _447 = isnan((*spvDescriptorSet0.vp_c9)._m0[107].w);
    bool _449 = _445 || _447;
    float _451 = float(_449);
    float _453 = -_435;
    float _455 = _453 + 1.0;
    float _457 = -(*spvDescriptorSet0.vp_c9)._m0[107].x;
    float _459 = (*spvDescriptorSet0.vp_c9)._m0[108].x + _457;
    float _461 = 1.0 / _439;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _465 = _451 * _455;
    float _467 = -_451;
    float _469 = _467 + 1.0;
    float _471 = _423 * _461;
    float _473 = -(*spvDescriptorSet0.vp_c9)._m0[107].z;
    float _475 = (*spvDescriptorSet0.vp_c9)._m0[108].z + _473;
    float _477 = fma(_459, _471, (*spvDescriptorSet0.vp_c9)._m0[107].x);
    float _479 = -(*spvDescriptorSet0.vp_c9)._m0[107].y;
    float _481 = (*spvDescriptorSet0.vp_c9)._m0[108].y + _479;
    float _483 = fma(_475, _471, (*spvDescriptorSet0.vp_c9)._m0[107].z);
    float _485 = _477 * _465;
    float _487 = fma(_481, _471, (*spvDescriptorSet0.vp_c9)._m0[107].y);
    float _489 = _483 * _465;
    float _491 = _487 * _465;
    float _493 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[107].x, _485);
    float _495 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[107].y, _491);
    float _497 = fma(_469, (*spvDescriptorSet0.vp_c9)._m0[107].z, _489);
    float _499 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[108].x, _493);
    float _501 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[108].y, _495);
    float _503 = fma(_435, (*spvDescriptorSet0.vp_c9)._m0[108].z, _497);
    bool _505 = !_463;
    float _521;
    if (!_505)
    {
        float _507 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _509 = _153 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _511 = fma(_509, (*spvDescriptorSet0.vp_c9)._m0[11].y, _121);
        float _513 = _511 * _507;
        float _515 = floor(_513);
        float _517 = -_515;
        float _519 = _513 + _517;
        _521 = _519;
        _523 = true;
    }
    else
    {
        _521 = _167;
    }
    _523 = false;
    float _525 = _521;
    float _527 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _529 = _525 + _527;
    float _531 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _533 = _531 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _535 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _537 = _535 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _539 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _541 = isnan(_525);
    bool _543 = _539 || _541;
    bool _545 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _547 = _543 || _545;
    float _549 = float(_547);
    float _551 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _553 = _551 + (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _555 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _557 = isnan(_525);
    bool _559 = _555 || _557;
    bool _561 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _563 = _559 || _561;
    float _565 = float(_563);
    float _567 = 1.0 / _533;
    float _569 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _571 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _569;
    float _573 = -_549;
    float _575 = _573 + 1.0;
    bool _577 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _579 = isnan(_525);
    bool _581 = _577 || _579;
    bool _583 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _585 = _581 || _583;
    float _587 = float(_585);
    bool _589 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[14].x;
    float _591 = 1.0 / _537;
    float _593 = 1.0 / _553;
    float _595 = _571 * _567;
    float _597 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _599 = _597 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _601 = _565 * _575;
    float _603 = -_565;
    float _605 = _603 + 1.0;
    float _607 = fma(_595, _529, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _609 = -(*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[118].x + _609;
    float _613 = _587 * _605;
    float _615 = _599 * _591;
    float _617 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _619 = _525 + _617;
    bool _621 = _525 >= (*spvDescriptorSet0.vp_c9)._m0[118].w;
    bool _623 = isnan(_525);
    bool _625 = _621 || _623;
    bool _627 = isnan((*spvDescriptorSet0.vp_c9)._m0[118].w);
    bool _629 = _625 || _627;
    float _631 = float(_629);
    float _633 = _607 * _613;
    float _635 = -_587;
    float _637 = _635 + 1.0;
    float _639 = fma(_615, _619, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _641 = -(*spvDescriptorSet0.vp_c9)._m0[117].w;
    float _643 = _525 + _641;
    float _645 = _611 * _593;
    float _647 = -_631;
    float _649 = _647 + 1.0;
    float _651 = fma(_637, (*spvDescriptorSet0.vp_c9)._m0[115].x, _633);
    float _653 = _499 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _655 = fma(_645, _643, (*spvDescriptorSet0.vp_c9)._m0[117].x);
    float _657 = _549 * _649;
    float _659 = fma(_639, _601, _651);
    float _661 = _653 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _663 = fma(_655, _657, _659);
    float _665 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _667 = _501 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _669 = fma(_631, (*spvDescriptorSet0.vp_c9)._m0[118].x, _663);
    float _671 = _503 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _673 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _675 = _665 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _677 = _667 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _679 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _681 = _671 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _683 = (*spvDescriptorSet0.vp_c9)._m0[131].x * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _685 = _673 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _687 = _679 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _689 = _669 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_63.x = _685;
    out.m_63.y = _687;
    out.m_63.z = _675;
    out.m_63.w = _683;
    out.m_65.x = _661;
    out.m_65.y = _677;
    out.m_65.z = _681;
    out.m_65.w = _689;
    bool _691 = !_589;
    if (!_691)
    {
        float _693 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[14].x;
        float _695 = _153 * (*spvDescriptorSet0.vp_c9)._m0[15].x;
        float _697 = fma(_695, (*spvDescriptorSet0.vp_c9)._m0[14].x, _121);
        float _699 = _697 * _693;
        float _701 = floor(_699);
        float _703 = -_701;
        float _705 = _699 + _703;
        _169 = _705;
    }
    float _707 = _169;
    float _709 = in.m_55.z;
    float _711 = _153 * 2.0;
    float _713 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _715 = log2(_713);
    float _717 = in.m_55.y;
    float _719 = _153 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _721 = in.m_46.x;
    float _723 = in.m_46.y;
    float _725 = in.m_46.z;
    float _727 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _729 = floor(_711);
    float _731 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _733 = _395 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _735 = -_727;
    float _737 = fma(_719, 2.0, _735);
    float _739 = _397 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _741 = -_121;
    float _743 = fma(_741, (*spvDescriptorSet0.vp_c9)._m0[76].x, _737);
    float _745 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _747 = int(_745);
    float _749 = _709 * 2.0;
    bool _751 = _729 > 0.0;
    bool _753 = _729 >= 0.0;
    bool _755 = isnan(_729);
    bool _757 = _753 || _755;
    bool _759 = isnan(0.0);
    bool _761 = _757 || _759;
    float _763 = floor(_749);
    float _765 = _715 * _121;
    float _767 = _717 * 2.0;
    float _769 = _717 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _771 = _723 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _773 = _717 + _709;
    float _775 = _723 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _777 = fma(_769, -2.0, _731);
    float _779 = exp2(_765);
    float _781 = _723 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _783 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _785 = _783 != 0;
    int _787 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _789 = _787 != 0;
    int _791 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _793 = _791 != 0;
    float _795 = fma(_721, (*spvDescriptorSet0.vp_c10)._m0[6].x, _771);
    int _797 = _761 ? 0 : 1;
    float _799 = _773 + (-1.0);
    float _801 = fma(_721, (*spvDescriptorSet0.vp_c10)._m0[4].x, _775);
    float _803 = floor(_767);
    bool _805 = _763 > 0.0;
    float _807 = fma(_721, (*spvDescriptorSet0.vp_c10)._m0[5].x, _781);
    bool _809 = !_785;
    int _811 = _809 ? 0 : 1;
    float _813 = _153 + _717;
    bool _815 = _763 >= 0.0;
    bool _817 = isnan(_763);
    bool _819 = _815 || _817;
    bool _821 = isnan(0.0);
    bool _823 = _819 || _821;
    float _825 = fma(_799, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _827 = float(_747);
    float _829 = fma(_725, (*spvDescriptorSet0.vp_c10)._m0[4].z, _801);
    float _831 = fma(_725, (*spvDescriptorSet0.vp_c10)._m0[5].z, _807);
    float _833 = -_779;
    float _835 = _833 + 1.0;
    bool _837 = !_789;
    int _839 = _837 ? 0 : 1;
    float _841 = _813 + (-1.0);
    float _843 = 1.0 / _827;
    bool _845 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _847 = isnan(0.0);
    bool _849 = _845 || _847;
    bool _851 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _853 = _849 || _851;
    float _855 = fma(_841, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    int _857 = _823 ? 0 : 1;
    float _859 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _861 = _803 > 0.0;
    float _863 = fma(_725, (*spvDescriptorSet0.vp_c10)._m0[6].z, _795);
    bool _865 = _803 >= 0.0;
    bool _867 = isnan(_803);
    bool _869 = _865 || _867;
    bool _871 = isnan(0.0);
    bool _873 = _869 || _871;
    float _875 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _877 = int(_875);
    float _879 = _831 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _881 = !_793;
    int _883 = _881 ? 0 : 1;
    float _885 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[76].y, _777);
    int _887 = ~_857;
    int _889 = _887 + 1;
    int _891 = _889 + 1;
    float _893 = _829 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _895 = _853 ? _835 : 0.0;
    float _897 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _899 = _879 + _897;
    float _901 = fma(_153, (*spvDescriptorSet0.vp_c9)._m0[78].z, _859);
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _905 = _903 != 0;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _909 = _907 != 0;
    int _911 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _913 = _911 != 0;
    float _915 = _863 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _917 = _891;
    if (!_805)
    {
        int _919 = ~_857;
        int _921 = _919 + 1;
        _917 = _921;
    }
    int _923 = _917;
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    bool _927 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _929 = isnan(1.0);
    bool _931 = _927 || _929;
    bool _933 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _935 = _931 || _933;
    float _937 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _939 = 1.0 + _937;
    float _941 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _943 = _893 + _941;
    float _945 = _899 * _899;
    bool _947 = !_905;
    int _949 = _947 ? 0 : 1;
    float _951 = 1.0 / _939;
    float _953 = in.m_67.x;
    float _955 = in.m_67.y;
    float _957 = in.m_67.z;
    float _959 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[78].w, _925);
    float _961 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _963 = _915 + _961;
    float _965 = fma(_943, _943, _945);
    int _967 = abs(_949);
    float _969 = _843 * _121;
    float _971 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].w, _959);
    float _973 = fma(_963, _963, _965);
    bool _975 = !_909;
    int _977 = _975 ? 0 : 1;
    float _979 = fma(_121, (*spvDescriptorSet0.vp_c9)._m0[77].z, _901);
    float _981 = sqrt(_973);
    float _983 = float(_877);
    int _985 = abs(_977);
    float _987 = float(_967);
    float _989 = _983 * _121;
    float _991 = float(_923);
    if (_935)
    {
        float _993 = _895 * _951;
        _131 = _993;
    }
    float _995 = _131;
    int _997 = ~_797;
    int _999 = _997 + 1;
    int _1001 = _999 + 1;
    float _1003 = _733 * (*spvDescriptorSet0.vp_c13)._m0[2].y;
    int _1005 = _1001;
    if (!_751)
    {
        int _1007 = ~_797;
        int _1009 = _1007 + 1;
        _1005 = _1009;
    }
    int _1011 = _1005;
    float _1013 = _987 * _991;
    float _1015 = rsqrt(_973);
    int _1017 = _873 ? 0 : 1;
    float _1019 = _1013 * (-2.0);
    float _1021 = float(_1011);
    float _1023 = float(_985);
    float _1025 = fma(_1019, _953, _953);
    int _1027 = ~_1017;
    int _1029 = _1027 + 1;
    int _1031 = _1029 + 1;
    float _1033 = fma(_855, _1019, _855);
    int _1035 = _1031;
    if (!_861)
    {
        int _1037 = ~_1017;
        int _1039 = _1037 + 1;
        _1035 = _1039;
    }
    int _1041 = _1035;
    float _1043 = _1023 * _1021;
    float _1045 = _153 + (-0.5);
    float _1047 = _981 * (*spvDescriptorSet0.vp_c13)._m0[2].x;
    bool _1049 = !_913;
    int _1051 = _1049 ? 0 : 1;
    float _1053 = _1043 * (-2.0);
    float _1055 = fma(_1045, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1025);
    float _1057 = float(_1041);
    float _1059 = precise::min(_1003, _1047);
    float _1061 = fma(_825, _1053, _825);
    float _1063 = fma(_1053, _955, _955);
    float _1065 = fma(_1033, _995, _1055);
    int _1067 = abs(_1051);
    float _1069 = _1015 * _1059;
    float _1071 = _717 + (-0.5);
    float _1073 = _1065 * 0.15915493667125701904296875;
    float _1075 = float(_1067);
    float _1077 = _899 * _1069;
    float _1079 = _943 * _1069;
    float _1081 = fma(_1071, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1063);
    float _1083 = _153 + _709;
    float _1085 = -_1077;
    float _1087 = _899 + _1085;
    float _1089 = -_1079;
    float _1091 = _943 + _1089;
    float _1093 = _1075 * _1057;
    float _1095 = fma(_1061, _995, _1081);
    float _1097 = _1087 * _1087;
    float _1099 = _1083 + (-1.0);
    float _1101 = _1093 * (-2.0);
    float _1103 = fma(_1091, _1091, _1097);
    float _1105 = _963 * _1069;
    float _1107 = as_type<float>(int(gl_VertexIndex));
    float _1109 = fma(_1099, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1111 = fma(_1101, _957, _957);
    float _1113 = -_1105;
    float _1115 = _963 + _1113;
    float _1117 = _709 + (-0.5);
    float _1119 = fma(_1109, _1101, _1109);
    float _1121 = _1095 * 0.15915493667125701904296875;
    float _1123 = fma(_1115, _1115, _1103);
    float _1125 = fma(_1117, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1111);
    float _1127 = _1073 * 6.283185482025146484375;
    float _1129 = cos(_1127);
    float _1131 = fma(_1119, _995, _1125);
    float _1133 = _1131 * 0.15915493667125701904296875;
    float _1135 = sqrt(_1123);
    int _1137 = as_type<int>(_1107) & 1;
    bool _1139 = _1137 != 0;
    int _1141 = as_type<int>(_1107) & 2;
    bool _1143 = _1141 != 0;
    float _1145 = _1121 * 6.283185482025146484375;
    float _1147 = sin(_1145);
    bool _1149 = !_1143;
    float _1151 = _1149 ? (-0.5) : 0.5;
    bool _1153 = !_1139;
    float _1155 = _1153 ? (-0.5) : 0.5;
    float _1157 = _1121 * 6.283185482025146484375;
    float _1159 = cos(_1157);
    float _1161 = _1015 * _1135;
    float _1163 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _1151);
    float _1165 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _1155);
    float _1167 = _739 * _1161;
    float _1169 = _733 * _1161;
    float _1171 = _1161 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1173 = _1171 * 0.5;
    float _1175 = _1073 * 6.283185482025146484375;
    float _1177 = sin(_1175);
    float _1179 = _1167 * _1163;
    float _1181 = _1129 * _1147;
    float _1183 = _1169 * _1165;
    float _1185 = _1133 * 6.283185482025146484375;
    float _1187 = cos(_1185);
    float _1189 = _1129 * _1159;
    float _1191 = _1133 * 6.283185482025146484375;
    float _1193 = sin(_1191);
    float _1195 = _1177 * _1147;
    float _1197 = _1177 * _1159;
    float _1199 = _1129 * _1187;
    float _1201 = _1177 * _1187;
    float _1203 = _1159 * _1187;
    float _1205 = _1147 * _1187;
    float _1207 = _1199 * _1179;
    float _1209 = fma(_1193, _1189, _1195);
    float _1211 = -_1197;
    float _1213 = fma(_1193, _1181, _1211);
    float _1215 = -_1179;
    float _1217 = _1193 * _1215;
    float _1219 = -_1181;
    float _1221 = fma(_1193, _1197, _1219);
    float _1223 = fma(_1209, _1183, _1207);
    float _1225 = _1201 * _1179;
    float _1227 = fma(_1203, _1183, _1217);
    float _1229 = fma(_1193, _1195, _1189);
    float _1231 = fma(_1213, _1173, _1223);
    float _1233 = fma(_1221, _1183, _1225);
    float _1235 = fma(_1205, _1173, _1227);
    float _1237 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1239 = fma(_1229, _1173, _1233);
    float _1241 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1243 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1237);
    float _1245 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1241);
    float _1247 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1243);
    float _1249 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1245);
    float _1251 = _1247 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1253 = _1249 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1255 = _915 + _1251;
    float _1257 = _893 + _1253;
    float _1259 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1261 = _1255 + _1259;
    float _1263 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1265 = _1257 + _1263;
    float _1267 = _1261 * _1261;
    float _1269 = fma(_1265, _1265, _1267);
    float _1271 = _1231 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1273 = sqrt(_1269);
    float _1275 = fma(_1235, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1271);
    float _1277 = -_1077;
    float _1279 = _879 + _1277;
    float _1281 = -_1105;
    float _1283 = _915 + _1281;
    float _1285 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1275);
    float _1287 = -_1079;
    float _1289 = _893 + _1287;
    float _1291 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1293 = _1285 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1295 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1291);
    float _1297 = _879 + _1293;
    float _1299 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1295);
    bool _1301 = _1273 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1303 = _1293;
    float _1305 = _1285;
    float _1307 = _1257;
    float _1309 = _1077;
    float _1311 = _1297;
    if (!_1301)
    {
        _1303 = _1255;
    }
    float _1313 = _1303;
    float _1315 = _1313;
    if (!_1301)
    {
        _1305 = _1297;
    }
    float _1317 = _1305;
    bool _1319 = !_1301;
    float _1321 = _1317;
    if (!_1319)
    {
        float _1323 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1325 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1327 = _1273 + _1325;
        float _1329 = rsqrt(_1269);
        float _1331 = _1327 * _1323;
        float _1333 = _1297 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1335 = _1331 * 0.15915493667125701904296875;
        float _1337 = _1335 * 6.283185482025146484375;
        float _1339 = cos(_1337);
        float _1341 = _1335 * 6.283185482025146484375;
        float _1343 = sin(_1341);
        float _1345 = _1339 + (-1.0);
        float _1347 = _1345 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1349 = fma(_1343, _1333, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1351 = fma(_1297, _1339, _1347);
        float _1353 = _1329 * _1349;
        float _1355 = fma(_1265, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1357 = fma(_1261, _1353, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1321 = _1351;
        _1307 = _1355;
        _1315 = _1357;
    }
    float _1359 = _1321;
    float _1361 = _1307;
    float _1363 = _1315;
    float _1365 = -_879;
    float _1367 = _1365 + _1359;
    float _1369 = -_893;
    float _1371 = _1369 + _1361;
    float _1373 = _1299 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1375 = _1279 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1377 = _1367 * _1367;
    float _1379 = -_915;
    float _1381 = _1379 + _1363;
    float _1383 = 1.0 / _1373;
    float _1385 = fma(_1289, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1375);
    float _1387 = fma(_1371, _1371, _1377);
    float _1389 = -_1077;
    float _1391 = _1389 + _1359;
    float _1393 = fma(_1283, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1385);
    float _1395 = fma(_1381, _1381, _1387);
    float _1397 = -_1105;
    float _1399 = _1397 + _1363;
    float _1401 = _1393 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1403 = sqrt(_1395);
    bool _1405 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[660].y;
    bool _1407 = isnan(0.5);
    bool _1409 = _1405 || _1407;
    bool _1411 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1413 = _1409 || _1411;
    float _1415 = _1401 + _1373;
    bool _1417 = 0.5 <= (*spvDescriptorSet0.vp_c15)._m0[653].w;
    bool _1419 = isnan(0.5);
    bool _1421 = _1417 || _1419;
    bool _1423 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1425 = _1421 || _1423;
    float _1427 = _1415 * _1383;
    float _1429 = _1427 * 0.5;
    float _1431 = -_1079;
    float _1433 = _1431 + _1361;
    float _1435 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1437 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1435);
    float _1439 = 1.0 / _1437;
    bool _1441 = _1403 > 0.0;
    float _1443 = _1359;
    float _1445 = _1361;
    float _1447 = _1363;
    float _1449 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    float _1451 = _1391;
    if (!_1441)
    {
        _1443 = _1433;
    }
    float _1453 = _1443;
    float _1455 = _1453;
    if (!_1441)
    {
        _1445 = _1391;
    }
    float _1457 = _1445;
    float _1459 = _1457;
    float _1461 = _1457;
    if (!_1441)
    {
        _1447 = _1399;
    }
    float _1463 = _1447;
    bool _1465 = !_1441;
    float _1467 = _1463;
    if (!_1465)
    {
        float _1469 = _197 * _197;
        float _1471 = fma(_195, _195, _1469);
        float _1473 = fma(_199, _199, _1471);
        float _1475 = rsqrt(_1395);
        float _1477 = sqrt(_1473);
        float _1479 = _1371 * _1475;
        float _1481 = _1367 * _1475;
        float _1483 = _1381 * _1475;
        bool _1485 = _1477 > 0.0;
        float _1487 = _1477;
        float _1489 = _1475;
        if (!_1485)
        {
            _1487 = _1433;
        }
        float _1491 = _1487;
        _1455 = _1491;
        if (!_1485)
        {
            _1459 = _1391;
        }
        float _1493 = _1459;
        _1461 = _1493;
        if (!_1485)
        {
            _1489 = _1399;
        }
        float _1495 = _1489;
        bool _1497 = !_1485;
        _1467 = _1495;
        if (!_1497)
        {
            float _1499 = rsqrt(_1473);
            float _1501 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1503 = _197 * _1499;
            float _1505 = _195 * _1499;
            float _1507 = _199 * _1499;
            float _1509 = _1481 * _1503;
            float _1511 = fma(_1479, _1505, _1509);
            float _1513 = _1501 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1515 = fma(_1483, _1507, _1511);
            float _1517 = _1515 * _1513;
            float _1519 = fma(_195, _1517, _1433);
            float _1521 = fma(_197, _1517, _1391);
            float _1523 = fma(_199, _1517, _1399);
            _1455 = _1519;
            _1461 = _1521;
            _1467 = _1523;
        }
    }
    float _1525 = _1455;
    float _1527 = _1461;
    float _1529 = _1467;
    float _1531 = _1525;
    float _1533 = _1529;
    if (_1425)
    {
        _1449 = 1.0;
    }
    float _1535 = _1449;
    float _1537 = _1535;
    if (_1413)
    {
        _203 = _1525;
    }
    float _1539 = _203;
    float _1541 = _1539;
    if (_1413)
    {
        _205 = _1527;
    }
    float _1543 = _205;
    float _1545 = _1543;
    if (!_1413)
    {
        float _1547 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1549 = _1279 + _1547;
        float _1551 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1553 = _1289 + _1551;
        float _1555 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1557 = -_1289;
        float _1559 = _1557 + _1525;
        float _1561 = _1549 * _1549;
        float _1563 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1565 = _1283 + _1563;
        float _1567 = -_1279;
        float _1569 = _1567 + _1527;
        float _1571 = fma(_1553, _1553, _1561);
        float _1573 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1575 = fma(_1565, _1565, _1571);
        float _1577 = sqrt(_1575);
        float _1579 = _1555 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1581 = -_1283;
        float _1583 = _1581 + _1529;
        float _1585 = precise::min(_1577, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1587 = _1585 * _1573;
        float _1589 = _1579 * _1587;
        float _1591 = fma(_1559, _1589, _1289);
        float _1593 = fma(_1569, _1589, _1279);
        float _1595 = fma(_1583, _1589, _1283);
        _1531 = _1559;
        _1545 = _1593;
        _1541 = _1591;
        _1533 = _1595;
    }
    float _1597 = _1531;
    float _1599 = _1545;
    float _1601 = _1541;
    float _1603 = _1533;
    float _1605 = _1597;
    if (_1425)
    {
        _1605 = 1.0;
    }
    float _1607 = _1605;
    float _1609 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1611 = _1439 * _1609;
    float _1613 = _1607;
    if (!_1425)
    {
        float _1615 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1617 = _1615 * 0.15915493667125701904296875;
        float _1619 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1621 = _1617 * 6.283185482025146484375;
        float _1623 = cos(_1621);
        float _1625 = _1619 * 0.15915493667125701904296875;
        float _1627 = _1617 * 6.283185482025146484375;
        float _1629 = sin(_1627);
        float _1631 = 1.0 / _1623;
        float _1633 = _1625 * 6.283185482025146484375;
        float _1635 = cos(_1633);
        float _1637 = _1629 * _1631;
        float _1639 = _1625 * 6.283185482025146484375;
        float _1641 = sin(_1639);
        float _1643 = _1635 * _1637;
        float _1645 = 1.0 / _1643;
        float _1647 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1649 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1647;
        float _1651 = 1.0 / _1649;
        float _1653 = _1641 * _1645;
        float _1655 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1657 = fma(_1611, _1653, _1655);
        float _1659 = _1657 * _1651;
        float _1661 = precise::clamp(_1659, 0.0, 1.0);
        _1451 = _1625;
        _1309 = _1617;
        _1537 = _1661;
    }
    float _1663 = _1451;
    float _1665 = _1309;
    float _1667 = _1537;
    float _1669 = _1663;
    float _1671 = _1665;
    if (!_1425)
    {
        float _1673 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1675 = _1673 * 0.15915493667125701904296875;
        float _1677 = 0.5 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1679 = _1675 * 6.283185482025146484375;
        float _1681 = cos(_1679);
        float _1683 = _1677 * 0.15915493667125701904296875;
        float _1685 = _1675 * 6.283185482025146484375;
        float _1687 = sin(_1685);
        float _1689 = 1.0 / _1681;
        float _1691 = _1683 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        float _1695 = _1687 * _1689;
        float _1697 = _1683 * 6.283185482025146484375;
        float _1699 = sin(_1697);
        float _1701 = _1693 * _1695;
        float _1703 = 1.0 / _1701;
        float _1705 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1707 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1705;
        float _1709 = 1.0 / _1707;
        float _1711 = _1699 * _1703;
        float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1715 = fma(_1611, _1711, _1713);
        float _1717 = _1715 * _1709;
        float _1719 = precise::clamp(_1717, 0.0, 1.0);
        float _1721 = -_1719;
        float _1723 = _1721 + 1.0;
        _1669 = _1701;
        _1671 = _1711;
        _1613 = _1723;
    }
    float _1725 = _1669;
    float _1727 = _1671;
    float _1729 = _1613;
    float _1731 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1733 = _1599 + _1731;
    float _1735 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1737 = _1601 + _1735;
    float _1739 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1741 = _1603 + _1739;
    float _1743 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1745 = _1733 * _1733;
    float _1747 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1743);
    float _1749 = fma(_1737, _1737, _1745);
    float _1751 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1753 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1747);
    float _1755 = fma(_1741, _1741, _1749);
    float _1757 = rsqrt(_1755);
    float _1759 = _1757 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1761 = _1737 * _1759;
    float _1763 = _1741 * _1759;
    float _1765 = _1761 * _1761;
    float _1767 = _1763 * _1763;
    float _1769 = _1765 + _1767;
    float _1771 = sqrt(_1769);
    bool _1773 = _1771 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1775 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1777 = _1771 + _1775;
    float _1779 = _1749;
    float _1781 = _1757;
    float _1783 = _1777;
    float _1785 = _1725;
    float _1787 = _1765;
    float _1789 = _1761;
    if (_1773)
    {
        float _1791 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1779 = _1791;
    }
    float _1793 = _1779;
    if (_1773)
    {
        float _1795 = rsqrt(_1769);
        _1781 = _1795;
    }
    float _1797 = _1781;
    float _1799 = _1793;
    float _1801 = _1797;
    if (_1773)
    {
        float _1803 = _1777 * _1793;
        _1783 = _1803;
    }
    float _1805 = _1783;
    if (_1773)
    {
        float _1807 = _1805 * 0.15915493667125701904296875;
        _1785 = _1807;
    }
    float _1809 = _1785;
    float _1811 = _1741;
    float _1813 = _1809;
    if (_1773)
    {
        float _1815 = _1809 * 6.283185482025146484375;
        float _1817 = sin(_1815);
        _1811 = _1817;
    }
    float _1819 = _1811;
    float _1821 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1823 = precise::max(0.0, _1821);
    float _1825 = _1727;
    if (_1773)
    {
        float _1827 = _1809 * 6.283185482025146484375;
        float _1829 = cos(_1827);
        _1825 = _1829;
    }
    float _1831 = _1825;
    float _1833 = -_1759;
    float _1835 = -_1823;
    float _1837 = fma(_1733, _1833, _1835);
    float _1839 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_1773)
    {
        float _1841 = _1837 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1799 = _1841;
    }
    float _1843 = _1799;
    float _1845 = _1843;
    if (!_1773)
    {
        _1813 = _1763;
    }
    float _1847 = _1813;
    float _1849 = fma(_1289, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _1851 = _1847;
    if (_1773)
    {
        float _1853 = fma(_1819, _1843, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1845 = _1853;
    }
    float _1855 = _1845;
    float _1857 = floor(_1849);
    float _1859 = _1855;
    if (_1773)
    {
        float _1861 = _1831 + (-1.0);
        _1839 = _1861;
    }
    float _1863 = _1839;
    float _1865 = _1863;
    if (_1773)
    {
        float _1867 = _1797 * _1855;
        _1311 = _1867;
    }
    float _1869 = _1311;
    if (!_1773)
    {
        _1801 = _1761;
    }
    float _1871 = _1801;
    float _1873 = _1871;
    if (_1773)
    {
        float _1875 = _1863 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1865 = _1875;
    }
    float _1877 = _1865;
    if (_1773)
    {
        float _1879 = _1761 * _1869;
        _1873 = _1879;
    }
    float _1881 = _1873;
    if (!_1773)
    {
        _1859 = _1837;
    }
    float _1883 = _1859;
    float _1885 = _1883;
    if (_1773)
    {
        float _1887 = _1763 * _1869;
        _1851 = _1887;
    }
    float _1889 = _1851;
    if (_1773)
    {
        float _1891 = fma(_1837, _1831, _1877);
        _1885 = _1891;
    }
    float _1893 = _1885;
    if (_1773)
    {
        float _1895 = _1881 * _1881;
        _1787 = _1895;
    }
    float _1897 = _1787;
    float _1899 = sqrt(_1755);
    if (!_1773)
    {
        _1789 = _1767;
    }
    float _1901 = _1789;
    float _1903 = _1901;
    if (_1773)
    {
        float _1905 = _1889 * _1889;
        _1903 = _1905;
    }
    float _1907 = _1903;
    float _1909 = fma(_1893, _1893, _1897);
    float _1911 = fma(_1283, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _1913 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1915 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1917 = _1909 + _1907;
    float _1919 = _1599 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1921 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1913);
    float _1923 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1915);
    float _1925 = floor(_1911);
    float _1927 = fma(_1601, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1919);
    float _1929 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1921);
    float _1931 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1923);
    float _1933 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1935 = fma(_1899, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1933);
    float _1937 = precise::clamp(_1935, 0.0, 1.0);
    float _1939 = fma(_1603, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1927);
    float _1941 = _1929 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1943 = _1931 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1945 = rsqrt(_1917);
    float _1947 = -_1937;
    float _1949 = _1947 + 1.0;
    float _1951 = _1939 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1953 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1955 = _1943 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1957 = -_1857;
    float _1959 = _1849 + _1957;
    float _1961 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1963 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1953);
    float _1965 = abs(_1949);
    float _1967 = log2(_1965);
    float _1969 = -_1955;
    float _1971 = fma(_1969, _1751, 1.0);
    float _1973 = _1753 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1975 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1963);
    float _1977 = -_1925;
    float _1979 = _1911 + _1977;
    float _1981 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1961);
    float _1983 = _1945 * _1881;
    float _1985 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1975);
    float _1987 = _1945 * _1893;
    float _1989 = _1945 * _1889;
    float _1991 = _1983 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1993 = log2(_1971);
    float _1995 = _1987 + 1.0;
    float _1997 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1981);
    float _1999 = -_1991;
    float _2001 = fma(_1987, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1999);
    float _2003 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2005 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1997);
    float _2007 = -_1989;
    float _2009 = fma(_2007, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2001);
    float _2011 = 1.0 / _1985;
    float _2013 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2015 = fma(_2009, -0.5, 0.5);
    float _2017 = fma(_2009, 0.5, 0.5);
    float _2019 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2013);
    float _2021 = exp2(_2003);
    float _2023 = fma(_2017, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2025 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2019);
    float _2027 = _1993 * 0.693147182464599609375;
    float _2029 = fma(_2017, _2023, -0.212114393711090087890625);
    float _2031 = _2027 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2033 = sqrt(_2015);
    float _2035 = fma(_2017, _2029, 1.570728778839111328125);
    float _2037 = _2005 * _2011;
    float _2039 = -_1987;
    float _2041 = fma(_2021, _1995, _2039);
    float _2043 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2025);
    float _2045 = fma(_2037, 0.5, 0.5);
    float _2047 = fma(_2041, 0.5, 0.5);
    float _2049 = _2043 * _2011;
    float _2051 = _2033 * 0.636619746685028076171875;
    float _2053 = fma(_2049, -0.5, 0.5);
    float _2055 = -_2035;
    float _2057 = fma(_2051, _2055, 1.0);
    float2 _6548 = float2(_1959, _1979);
    float _2059 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6548, float2(0.0), isnan(_6548)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6548, float2(0.0), isnan(_6548)), level(0.0)).x;
    float3 _6559 = float3(_2045, _2053, _2031);
    float _2061 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6559, float3(0.0), isnan(_6559)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6559, float3(0.0), isnan(_6559)), level(0.0)).x;
    float3 _6570 = float3(_2045, _2053, _2031);
    float4 _2064 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6570, float3(0.0), isnan(_6570)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6570, float3(0.0), isnan(_6570)), level(0.0)).xyzw;
    float _2066 = _2064.x;
    float _2068 = _2064.y;
    float _2070 = _2064.z;
    float _2072 = _2064.w;
    float2 _6586 = float2(_2057, _2047);
    float3 _2076 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6586, float2(0.0), isnan(_6586)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6586, float2(0.0), isnan(_6586)), level(0.0)).xyz;
    float _2078 = _2076.x;
    float _2080 = _2076.y;
    float _2082 = _2076.z;
    float _2084 = float(uint(_877));
    float _2086 = trunc(_969);
    int _2088 = int(_2086);
    int _2090 = ~_877;
    int _2092 = _2090 + 1;
    float _2094 = -_971;
    float _2096 = _2094 + 1.0;
    int _2098 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _2100 = _2098 != 0;
    float _2102 = _989 * _163;
    int _2104 = ~_877;
    int _2106 = _2104 + 1;
    out.m_72.w = _1059;
    bool _2108 = _153 > 0.5;
    float _2110 = 1.0 / _2084;
    out.m_74.x = _1289;
    out.m_74.y = _1279;
    out.m_74.z = _1283;
    bool _2112 = _717 > 0.5;
    float _2114 = _1967 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    int _2116 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2118 = _2116 != 0;
    out.m_76.x = _1169;
    float _2120 = trunc(_2102);
    int _2122 = int(_2120);
    float _2124 = float(uint(_2088));
    out.m_78.x = _1601;
    out.m_78.y = _1599;
    out.m_78.z = _1603;
    bool _2126 = !_2118;
    float _2128 = _2126 ? 7.345489978790283203125 : 1.0;
    int _2130 = abs(_839);
    float _2132 = _2128 * _153;
    int _2134 = as_type<int>(_2110) + (-2);
    float _2136 = exp2(_2114);
    float _2138 = float(_2088);
    int _2140 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _2142 = _2140 != 0;
    float _2144 = as_type<float>(_2134) * _2124;
    bool _2146 = _2138 >= _983;
    bool _2148 = isnan(_2138);
    bool _2150 = _2146 || _2148;
    bool _2152 = isnan(_983);
    bool _2154 = _2150 || _2152;
    float _2156 = float(_2154);
    float _2158 = trunc(_2144);
    float _2160 = precise::max(_2158, 0.0);
    uint _2163 = uint(_2160);
    bool _2165 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[160].w;
    bool _2167 = isnan(_707);
    bool _2169 = _2165 || _2167;
    bool _2171 = isnan((*spvDescriptorSet0.vp_c9)._m0[160].w);
    bool _2173 = _2169 || _2171;
    float _2175 = float(_2173);
    float _2177 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2179 = _2177 + (*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2181 = -_2175;
    float _2183 = _2181 + 1.0;
    int _2185 = ~_877;
    int _2187 = _2185 + 1;
    float _2189 = floor(_2132);
    float _2191 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2193 = _2191 + (*spvDescriptorSet0.vp_c9)._m0[166].w;
    float _2195 = -_2136;
    float _2197 = _2195 + 1.0;
    float _2199 = _2197 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    int _2201 = _2106 * int(_2163);
    int _2203 = _2201 + _2088;
    float _2205 = trunc(_2156);
    int _2207 = int(_2205);
    float _2209 = float(uint(_2203));
    float _2211 = -_2189;
    float _2213 = _2132 + _2211;
    float _2215 = as_type<float>(_2134) * _2209;
    float _2217 = _2213 * _983;
    float _2219 = 1.0 / _2179;
    float _2221 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2223 = _2221 + (*spvDescriptorSet0.vp_c9)._m0[160].w;
    int _2225 = ~_2207;
    int _2227 = _2225 + 1;
    int _2229 = _2227 + 1;
    float _2231 = trunc(_2215);
    float _2233 = precise::max(_2231, 0.0);
    uint _2235 = uint(_2233);
    float _2237 = 1.0 / _2223;
    float _2239 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2241 = _2239 + (*spvDescriptorSet0.vp_c9)._m0[161].w;
    int _2243 = int(_2163) + int(_2235);
    float _2245 = trunc(_2217);
    int _2247 = int(_2245);
    int _2249 = _2092 * _2243;
    int _2251 = _2249 + _2088;
    float _2253 = 1.0 / _2241;
    bool _2255 = uint(_2251) >= uint(_877);
    bool _2257 = !_2255;
    int _2259 = _2257 ? 0 : (-1);
    float _2261 = 1.0 / _2193;
    bool _2263 = _877 == 0;
    int _2265 = ~_2243;
    int _2267 = _2265 + _2259;
    int _2269 = _2267 + 1;
    int _2271 = _877 * _2269;
    int _2273 = _2271 + _2088;
    float _2275 = -(*spvDescriptorSet0.vp_c9)._m0[159].x;
    float _2277 = (*spvDescriptorSet0.vp_c9)._m0[160].x + _2275;
    float _2279 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2281 = _2279 + (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2283 = !_2263;
    int _2285 = _2283 ? _2273 : (-1);
    float _2287 = _2277 * _2237;
    bool _2289 = !_2142;
    int _2291 = _2289 ? 0 : 1;
    int _2293 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2295 = _2293 != 0;
    int _2297 = _2285 * _2229;
    float _2299 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2301 = _2299 + (*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2303 = -(*spvDescriptorSet0.vp_c9)._m0[160].x;
    float _2305 = _2303 + (*spvDescriptorSet0.vp_c9)._m0[161].x;
    int _2307 = _877 + (-1);
    float _2309 = 1.0 / _2281;
    int _2311 = abs(_2291);
    float _2313 = _2305 * _2253;
    int _2315 = abs(_811);
    int _2317 = _2207 * _2307;
    int _2319 = _2317 + _2297;
    float _2321 = 1.0 / _2301;
    int _2323 = _2247 * _2311;
    int _2325 = _2323 + _2088;
    int _2327 = abs(_883);
    int _2329 = _2319 * _2130;
    float _2331 = -(*spvDescriptorSet0.vp_c9)._m0[159].w;
    float _2333 = _707 + _2331;
    float _2335 = -(*spvDescriptorSet0.vp_c9)._m0[161].x;
    float _2337 = (*spvDescriptorSet0.vp_c9)._m0[162].x + _2335;
    bool _2339 = !_2100;
    int _2341 = _2339 ? 0 : 1;
    float _2343 = -(*spvDescriptorSet0.vp_c9)._m0[162].x;
    float _2345 = _2343 + (*spvDescriptorSet0.vp_c9)._m0[163].x;
    int _2347 = _2122 * _2315;
    int _2349 = _2347 + _2329;
    float _2351 = fma(_2287, _2333, (*spvDescriptorSet0.vp_c9)._m0[159].x);
    bool _2353 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[166].w;
    bool _2355 = isnan(_707);
    bool _2357 = _2353 || _2355;
    bool _2359 = isnan((*spvDescriptorSet0.vp_c9)._m0[166].w);
    bool _2361 = _2357 || _2359;
    float _2363 = float(_2361);
    bool _2365 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[164].w;
    bool _2367 = isnan(_707);
    bool _2369 = _2365 || _2367;
    bool _2371 = isnan((*spvDescriptorSet0.vp_c9)._m0[164].w);
    bool _2373 = _2369 || _2371;
    float _2375 = float(_2373);
    float _2377 = _2337 * _2321;
    int _2379 = _2325 * _2327;
    int _2381 = _2379 + _2349;
    bool _2383 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[165].w;
    bool _2385 = isnan(_707);
    bool _2387 = _2383 || _2385;
    bool _2389 = isnan((*spvDescriptorSet0.vp_c9)._m0[165].w);
    bool _2391 = _2387 || _2389;
    float _2393 = float(_2391);
    float _2395 = -_2363;
    float _2397 = _2395 + 1.0;
    int _2399 = abs(_2341);
    float _2401 = -_2375;
    float _2403 = _2401 + 1.0;
    float _2405 = _2393 * _2397;
    float _2407 = -_2393;
    float _2409 = _2407 + 1.0;
    bool _2411 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[163].w;
    bool _2413 = isnan(_707);
    bool _2415 = _2411 || _2413;
    bool _2417 = isnan((*spvDescriptorSet0.vp_c9)._m0[163].w);
    bool _2419 = _2415 || _2417;
    float _2421 = float(_2419);
    float _2423 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2425 = _2423 + (*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2427 = _2375 * _2409;
    int _2429 = _2247 * _2399;
    int _2431 = _2429 + _2381;
    bool _2433 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[162].w;
    bool _2435 = isnan(_707);
    bool _2437 = _2433 || _2435;
    bool _2439 = isnan((*spvDescriptorSet0.vp_c9)._m0[162].w);
    bool _2441 = _2437 || _2439;
    float _2443 = float(_2441);
    float _2445 = _2421 * _2403;
    float _2447 = -_2421;
    float _2449 = _2447 + 1.0;
    float _2451 = 1.0 / _2425;
    float _2453 = float(uint(_2431));
    bool _2455 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[161].w;
    bool _2457 = isnan(_707);
    bool _2459 = _2455 || _2457;
    bool _2461 = isnan((*spvDescriptorSet0.vp_c9)._m0[161].w);
    bool _2463 = _2459 || _2461;
    float _2465 = float(_2463);
    float _2467 = _2443 * _2449;
    float _2469 = -_2443;
    float _2471 = _2469 + 1.0;
    float _2473 = as_type<float>(_2134) * _2453;
    bool _2475 = _707 >= (*spvDescriptorSet0.vp_c9)._m0[159].w;
    bool _2477 = isnan(_707);
    bool _2479 = _2475 || _2477;
    bool _2481 = isnan((*spvDescriptorSet0.vp_c9)._m0[159].w);
    bool _2483 = _2479 || _2481;
    float _2485 = float(_2483);
    float _2487 = _2465 * _2471;
    float _2489 = -_2465;
    float _2491 = _2489 + 1.0;
    int _2493 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2495 = _2493 != 0;
    float _2497 = trunc(_2473);
    float _2499 = precise::max(_2497, 0.0);
    uint _2501 = uint(_2499);
    float _2503 = _2485 * _2183;
    float _2505 = _2175 * _2491;
    float _2507 = -(*spvDescriptorSet0.vp_c9)._m0[163].x;
    float _2509 = (*spvDescriptorSet0.vp_c9)._m0[164].x + _2507;
    float _2511 = _2345 * _2451;
    float _2513 = -_2485;
    float _2515 = _2513 + 1.0;
    float _2517 = _2509 * _2219;
    float _2519 = _2351 * _2503;
    float _2521 = -(*spvDescriptorSet0.vp_c9)._m0[160].w;
    float _2523 = _707 + _2521;
    float _2525 = -(*spvDescriptorSet0.vp_c9)._m0[164].x;
    float _2527 = _2525 + (*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2529 = -(*spvDescriptorSet0.vp_c9)._m0[165].x;
    float _2531 = (*spvDescriptorSet0.vp_c9)._m0[166].x + _2529;
    float _2533 = fma(_2313, _2523, (*spvDescriptorSet0.vp_c9)._m0[160].x);
    float _2535 = fma(_2515, (*spvDescriptorSet0.vp_c9)._m0[159].x, _2519);
    float _2537 = _2527 * _2309;
    int _2539 = _2187 * int(_2501);
    int _2541 = _2539 + _2431;
    float _2543 = _2531 * _2261;
    float _2545 = float(uint(_2325));
    float _2547 = -(*spvDescriptorSet0.vp_c9)._m0[161].w;
    float _2549 = _707 + _2547;
    float _2551 = -(*spvDescriptorSet0.vp_c9)._m0[162].w;
    float _2553 = _707 + _2551;
    float _2555 = float(uint(_2541));
    float _2557 = fma(_2533, _2505, _2535);
    float _2559 = fma(_2377, _2549, (*spvDescriptorSet0.vp_c9)._m0[161].x);
    float _2561 = fma(_2511, _2553, (*spvDescriptorSet0.vp_c9)._m0[162].x);
    float _2563 = -(*spvDescriptorSet0.vp_c9)._m0[163].w;
    float _2565 = _707 + _2563;
    float _2567 = as_type<float>(_2134) * _2555;
    float _2569 = as_type<float>(_2134) * _2545;
    float _2571 = -(*spvDescriptorSet0.vp_c9)._m0[164].w;
    float _2573 = _707 + _2571;
    float _2575 = -(*spvDescriptorSet0.vp_c9)._m0[165].w;
    float _2577 = _707 + _2575;
    float _2579 = fma(_2517, _2565, (*spvDescriptorSet0.vp_c9)._m0[163].x);
    float _2581 = trunc(_2569);
    float _2583 = precise::max(_2581, 0.0);
    uint _2585 = uint(_2583);
    float _2587 = fma(_2537, _2573, (*spvDescriptorSet0.vp_c9)._m0[164].x);
    int _2589 = ~_877;
    int _2591 = _2589 + 1;
    float _2593 = fma(_2559, _2487, _2557);
    float _2595 = -_1151;
    int _2597 = _2112 ? as_type<int>(_2595) : as_type<int>(_1151);
    float _2599 = fma(_2543, _2577, (*spvDescriptorSet0.vp_c9)._m0[165].x);
    float _2601 = -_1155;
    int _2603 = _2108 ? as_type<int>(_2601) : as_type<int>(_1155);
    float _2605 = fma(_2561, _2467, _2593);
    float _2607 = trunc(_2567);
    float _2609 = precise::max(_2607, 0.0);
    uint _2611 = uint(_2609);
    bool _2613 = !_2295;
    float _2615 = _2613 ? _1151 : as_type<float>(_2597);
    int _2617 = ~_877;
    int _2619 = _2617 + 1;
    float _2621 = fma(_2579, _2445, _2605);
    float _2623 = fma(_2587, _2427, _2621);
    float _2625 = -_979;
    float _2627 = _2625 + 1.0;
    float _2629 = fma(_2599, _2405, _2623);
    int _2631 = int(_2501) + int(_2611);
    int _2633 = _2619 * int(_2585);
    int _2635 = _2633 + _2325;
    bool _2637 = !_2495;
    float _2639 = _2637 ? _1155 : as_type<float>(_2603);
    float _2641 = _2615 + (-0.5);
    float _2643 = fma(_2363, (*spvDescriptorSet0.vp_c9)._m0[166].x, _2629);
    int _2645 = _2591 * _2631;
    int _2647 = _2645 + _2431;
    float _2649 = float(uint(_2635));
    float _2651 = -_2641;
    float _2653 = -_885;
    float _2655 = fma(_2651, (*spvDescriptorSet0.vp_c9)._m0[80].y, _2653);
    float _2657 = _2639 + 0.5;
    out.m_80.x = _2643;
    bool _2659 = uint(_2647) >= uint(_877);
    float _2661 = as_type<float>(_2134) * _2649;
    float _2663 = fma(_2615, _2096, _2655);
    float _2665 = fma(_2657, (*spvDescriptorSet0.vp_c9)._m0[80].x, _743);
    bool _2667 = !_2659;
    int _2669 = _2667 ? 0 : (-1);
    float _2671 = trunc(_2661);
    float _2673 = precise::max(_2671, 0.0);
    uint _2675 = uint(_2673);
    int _2677 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _2679 = _2677 != 0;
    float _2681 = -_2627;
    float _2683 = fma(_2639, _2681, _2665);
    int _2685 = ~_2631;
    int _2687 = _2685 + _2669;
    int _2689 = _2687 + 1;
    int _2691 = ~_877;
    int _2693 = _2691 + 1;
    out.m_82.x = _2683;
    out.m_82.y = _2663;
    int _2695 = _877 * _2689;
    int _2697 = _2695 + _2431;
    float _2699 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    bool _2701 = !_2263;
    int _2703 = _2701 ? _2697 : (-1);
    int _2705 = int(_2585) + int(_2675);
    float _2707 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    int _2709 = _2703 >> 31;
    float _2711 = _1199 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    int _2713 = _2709 & 3;
    float _2715 = -_1193;
    float _2717 = fma(_2715, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2699);
    float _2719 = -_1193;
    float _2721 = fma(_2719, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2707);
    float _2723 = -_1193;
    float _2725 = fma(_2723, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2711);
    int _2727 = _2703 + _2713;
    float _2729 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2717);
    int _2731 = _2693 * _2705;
    int _2733 = _2731 + _2325;
    float _2735 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2725);
    int _2737 = _2727 >> 2;
    float _2739 = fma(_1201, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2721);
    float _2741 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2743 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    int _2745 = _2737 << 4;
    int _2747 = _2745 + 368;
    float _2749 = _1209 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    bool _2751 = uint(_2733) >= uint(_877);
    float _2753 = _1151 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    uint _2755 = uint(int(uint(_2747) >> uint(2)));
    uint _2757 = uint(int(uint(int(_2755)) >> uint(2)));
    int _2759 = int(_2755) & 3;
    float _2761 = (*spvDescriptorSet0.vp_c9)._m0[int(_2757)][_2759];
    int _2763 = int(_2755) + 1;
    uint _2765 = uint(int(uint(_2763) >> uint(2)));
    int _2767 = _2763 & 3;
    float _2769 = (*spvDescriptorSet0.vp_c9)._m0[int(_2765)][_2767];
    float _2771 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2741);
    float _2773 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2743);
    float _2775 = fma(_1203, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2749);
    float _2777 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _2779 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _2781 = _1213 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _2783 = abs(_1611);
    float _2785 = log2(_2783);
    float _2787 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[24].x, _2777);
    float _2789 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[25].x, _2779);
    float _2791 = fma(_1205, (*spvDescriptorSet0.vp_c8)._m0[26].x, _2781);
    float _2793 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2771);
    int _2795 = _2703 & 3;
    bool _2797 = _2795 != 0;
    int _2799 = _2747 + 8;
    uint _2801 = uint(int(uint(_2799) >> uint(2)));
    uint _2803 = uint(int(uint(int(_2801)) >> uint(2)));
    int _2805 = int(_2801) & 3;
    float _2807 = (*spvDescriptorSet0.vp_c9)._m0[int(_2803)][_2805];
    int _2809 = int(_2801) + 1;
    uint _2811 = uint(int(uint(_2809) >> uint(2)));
    int _2813 = _2809 & 3;
    float _2815 = (*spvDescriptorSet0.vp_c9)._m0[int(_2811)][_2813];
    int _2817 = _2703 & 3;
    bool _2819 = _2817 != 0;
    float _2821 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2773);
    bool _2823 = uint(_2795) > 1u;
    float _2825 = _1155 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2827 = _2819 ? 0 : 1;
    float _2829 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[24].z, _2787);
    float _2831 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[25].z, _2789);
    bool _2833 = !_2751;
    int _2835 = _2833 ? 0 : (-1);
    float _2837 = _2753 * _2735;
    int _2839 = ~_2827;
    int _2841 = _2839 + 1;
    int _2843 = _2841 + 1;
    float _2845 = _2785 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    int _2847 = ~_2705;
    int _2849 = _2847 + _2835;
    int _2851 = _2849 + 1;
    float _2853 = _2753 * _2729;
    bool _2855 = uint(_2795) >= 2u;
    float _2857 = fma(_2825, _2793, _2837);
    int _2859 = _2843;
    float _2861 = _2068;
    float _2863 = _2066;
    float _2865 = _1985;
    float _2867 = _2043;
    if (!_2823)
    {
        int _2869 = ~_2827;
        int _2871 = _2869 + 1;
        _2859 = _2871;
    }
    int _2873 = _2859;
    int _2875 = _877 * _2851;
    int _2877 = _2875 + _2325;
    bool _2879 = _2795 != 3;
    float _2881 = exp2(_2845);
    bool _2883 = !_2797;
    int _2885 = _2883 ? 0 : 1;
    float _2887 = fma(_2825, _2821, _2853);
    int _2889 = _2855 ? 0 : 1;
    float _2891 = fma(_1229, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2791);
    int _2893 = abs(_2873);
    float _2895 = in.m_84.x;
    int _2897 = abs(_2885);
    float _2899 = -_2059;
    float _2901 = _2899 + 1.0;
    int _2903 = ~_2889;
    int _2905 = _2903 + 1;
    int _2907 = _2905 + 1;
    float _2909 = _2753 * _2739;
    bool _2911 = _2795 != 3;
    float _2913 = fma(_1221, (*spvDescriptorSet0.vp_c8)._m0[26].z, _2775);
    int _2915 = _2907;
    if (_2879)
    {
        int _2917 = ~_2889;
        int _2919 = _2917 + 1;
        _2915 = _2919;
    }
    int _2921 = _2915;
    float _2923 = _2199 * _2061;
    int _2925 = ~_2893;
    int _2927 = _2925 + 1;
    int _2929 = _2927 + 1;
    float _2931 = fma(_2825, _2913, _2909);
    float _2933 = _2005 + _1985;
    bool _2935 = !_2911;
    int _2937 = _2935 ? 0 : (-1);
    int _2939 = _2929 * as_type<int>(_2769);
    int _2941 = abs(_2921);
    bool _2943 = _1611 <= 8000.0;
    bool _2945 = isnan(_1611);
    bool _2947 = _2943 || _2945;
    bool _2949 = isnan(8000.0);
    bool _2951 = _2947 || _2949;
    float _2953 = float(_2951);
    float _2955 = fma(_2881, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2957 = precise::clamp(_2955, 0.0, 1.0);
    int _2959 = ~_2897;
    int _2961 = _2959 + 1;
    int _2963 = _2961 + 1;
    float _2965 = _2082 * _2923;
    bool _2967 = !_2679;
    int _2969 = _2967 ? 0 : 1;
    float _2971 = fma(_2957, -2.0, 3.0);
    int _2973 = abs(_2937);
    int _2975 = _2963 * as_type<int>(_2761);
    int _2977 = _2975 + _2939;
    float _2979 = _2957 * _2957;
    int _2981 = abs(_2969);
    float _2983 = -_2199;
    float _2985 = _2983 + 1.0;
    float _2987 = _2979 * _2971;
    int _2989 = ~_2941;
    int _2991 = _2989 + 1;
    int _2993 = _2991 + 1;
    float _2995 = _1941 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2997 = _2933 * 0.5;
    int _2999 = ~_2973;
    int _3001 = _2999 + 1;
    int _3003 = _3001 + 1;
    int _3005 = _2993 * as_type<int>(_2807);
    int _3007 = _3005 + _2977;
    int _3009 = ~_2981;
    int _3011 = _3009 + 1;
    int _3013 = _3011 + 1;
    float _3015 = -_2987;
    float _3017 = _3015 + 1.0;
    float _3019 = fma(_1951, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2995);
    int _3021 = _3003 * as_type<int>(_2815);
    int _3023 = _3021 + _3007;
    bool _3025 = !_2263;
    int _3027 = _3025 ? _2877 : (-1);
    float _3029 = fma(_3017, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2987);
    float _3031 = fma(_1943, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3019);
    int _3033 = _3023 * _3013;
    float _3035 = _2953 * _3029;
    float _3037 = fma(_1973, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3031);
    int _3039 = _3027 * _2981;
    int _3041 = _3039 + _3033;
    float _3043 = _2831 + _2887;
    float _3045 = _3035 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _3047 = _3037 + _1985;
    out.gl_Position.x = _2005;
    out.gl_Position.y = _2043;
    out.gl_Position.z = _3037;
    out.gl_Position.w = _1985;
    float _3049 = float(_3041);
    float _3051 = _1985 * 0.5;
    float _3053 = _2901 * _3045;
    float _3055 = precise::clamp(_3053, 0.0, 1.0);
    float _3057 = _3047 * 0.5;
    float _3059 = _2891 + _2931;
    float _3061 = fma(_2043, -0.5, _3051);
    float _3063 = _2829 + _2857;
    out.m_86.x = _3049;
    float _3065 = _2072 * _2985;
    bool _3067 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _3069 = isnan(_1899);
    bool _3071 = _3067 || _3069;
    bool _3073 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _3075 = _3071 || _3073;
    float _3077 = -_3055;
    float _3079 = fma(_3077, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _3081 = _2072 * _2923;
    out.m_88.x = _2997;
    out.m_88.y = _3061;
    out.m_88.z = _3057;
    out.m_88.w = _1985;
    float _3083 = _3079 * _2895;
    float _3085 = fma(_2078, _3081, _2066);
    float _3087 = fma(_2080, _3081, _2068);
    float _3089 = fma(_2072, _2965, _2070);
    float _3091 = _3083 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    out.m_90.x = _3063;
    out.m_90.y = _3043;
    out.m_90.z = _3059;
    float _3093 = _1667 * _1729;
    float _3095 = _3037;
    float _3097 = _3093;
    if (!_3075)
    {
        _2861 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _3099 = _2861;
    out.m_92.x = _3091;
    float _3101 = _3093 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _3103 = _3099;
    float _3105 = _3099;
    if (!_3075)
    {
        _2863 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _3107 = _2863;
    out.m_94.x = _3085;
    out.m_94.y = _3087;
    out.m_94.z = _3089;
    out.m_94.w = _3065;
    float _3109 = _3107;
    float _3111 = _3107;
    if (!_3075)
    {
        _2865 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _3113 = _2865;
    float _3115 = _3113;
    float _3117 = _3113;
    if (!_3075)
    {
        _3095 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _3119 = _3095;
    float _3121 = _3119;
    float _3123 = _3119;
    if (!_3075)
    {
        _2867 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _3125 = _2867;
    float _3127 = _3125;
    float _3129 = _3125;
    if (!_3075)
    {
        _3097 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _3131 = _3097;
    bool _3133 = !_3075;
    float _3135 = _3131;
    float _3137 = _3131;
    if (!_3133)
    {
        bool _3139 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _3141 = isnan(_1899);
        bool _3143 = _3139 || _3141;
        bool _3145 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _3147 = _3143 || _3145;
        if (!_3147)
        {
            float _3149 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3151 = _1899 + _3149;
            float _3153 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _3155 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _3153;
            float _3157 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _3159 = _3157 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _3161 = 1.0 / _3155;
            float _3163 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _3165 = _3163 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _3167 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _3169 = _3167 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _3171 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _3173 = _3171 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _3175 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _3177 = _3175 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _3179 = _3151 * _3161;
            float _3181 = precise::clamp(_3179, 0.0, 1.0);
            float _3183 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _3185 = _3183 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _3187 = fma(_3181, _3159, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _3189 = fma(_3181, _3185, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _3191 = fma(_3181, _3165, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _3193 = fma(_3181, _3169, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _3195 = fma(_3181, _3173, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _3197 = fma(_3181, _3177, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _3111 = _3191;
            _3129 = _3195;
            _3105 = _3187;
            _3123 = _3193;
            _3117 = _3189;
            _3137 = _3197;
            _3199 = true;
        }
        else
        {
            bool _3201 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _3203 = isnan(_1899);
            bool _3205 = _3201 || _3203;
            bool _3207 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _3209 = _3205 || _3207;
            if (!_3209)
            {
                _3103 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _3211 = _3103;
            _3105 = _3211;
            if (!_3209)
            {
                _3109 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _3213 = _3109;
            _3111 = _3213;
            if (!_3209)
            {
                _3115 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _3215 = _3115;
            _3117 = _3215;
            if (!_3209)
            {
                _3121 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _3217 = _3121;
            _3123 = _3217;
            if (!_3209)
            {
                _3127 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _3219 = _3127;
            _3129 = _3219;
            if (!_3209)
            {
                _3135 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _3221 = _3135;
            bool _3223 = !_3209;
            _3137 = _3221;
            if (!_3223)
            {
                bool _3225 = _1899 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _3227 = isnan(_1899);
                bool _3229 = _3225 || _3227;
                bool _3231 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _3233 = _3229 || _3231;
                if (!_3233)
                {
                    float _3235 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3237 = _1899 + _3235;
                    float _3239 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _3241 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _3239;
                    float _3243 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _3245 = _3243 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _3247 = 1.0 / _3241;
                    float _3249 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _3251 = _3249 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _3253 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _3255 = _3253 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _3257 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _3259 = _3257 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _3261 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _3263 = _3261 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _3265 = _3237 * _3247;
                    float _3267 = precise::clamp(_3265, 0.0, 1.0);
                    float _3269 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _3271 = _3269 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _3273 = fma(_3267, _3245, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _3275 = fma(_3267, _3271, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _3277 = fma(_3267, _3251, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _3279 = fma(_3267, _3255, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _3281 = fma(_3267, _3259, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _3283 = fma(_3267, _3263, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _3111 = _3277;
                    _3129 = _3281;
                    _3105 = _3273;
                    _3123 = _3279;
                    _3117 = _3275;
                    _3137 = _3283;
                    _3199 = true;
                }
                else
                {
                    _3111 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _3129 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _3105 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _3123 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _3117 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _3137 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _3199 = false;
    float _3285 = _3111;
    float _3287 = _3129;
    float _3289 = _3105;
    float _3291 = _3123;
    float _3293 = _3117;
    float _3295 = _3137;
    float _3297 = _3101 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _3299 = fma(_3043, -0.5, 0.5);
    float _3301 = precise::clamp(_3299, 0.0, 1.0);
    float _3303 = -_3285;
    float _3305 = _3303 + _3287;
    float _3307 = -_3289;
    float _3309 = _3307 + _3291;
    out.m_96.x = 0.0;
    float _3311 = fma(_3301, _3305, _3285);
    float _3313 = -_3293;
    float _3315 = _3313 + _3295;
    float _3317 = fma(_3301, _3309, _3289);
    float _3319 = _3311 * 0.586610972881317138671875;
    bool _3321 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _3323 = fma(_3301, _3315, _3293);
    out.m_53.x = _3297;
    float _3325 = fma(_3317, 0.298911988735198974609375, _3319);
    bool _3327 = _1667 > 0.0;
    bool _3329 = isnan(_1667);
    bool _3331 = _3327 || _3329;
    bool _3333 = isnan(0.0);
    bool _3335 = _3331 || _3333;
    float _3337 = fma(_3323, 0.114477999508380889892578125, _3325);
    bool _3339 = _1729 <= 0.0;
    bool _3341 = !_3335;
    bool _3343 = _3339 || _3341;
    float _3345 = -_3337;
    float _3347 = _3317 + _3345;
    float _3349 = -_3337;
    float _3351 = _3311 + _3349;
    float _3353 = -_3337;
    float _3355 = _3323 + _3353;
    float _3357 = fma(_3347, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3359 = fma(_3351, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    float _3361 = fma(_3355, (*spvDescriptorSet0.vp_c13)._m0[1].z, _3337);
    bool _3363 = !_3321;
    if (!_3363)
    {
        float _3365 = -_1599;
        float _3367 = _3365 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _3369 = -_1601;
        float _3371 = _3369 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _3373 = -_1603;
        float _3375 = _3373 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _3377 = _3367 * _3367;
        float _3379 = fma(_3371, _3371, _3377);
        float _3381 = fma(_3375, _3375, _3379);
        float _3383 = sqrt(_3381);
        float _3385 = rsqrt(_3381);
        float _3387 = -_3383;
        float _3389 = _3387 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _3391 = _3389 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _3393 = precise::clamp(_3391, 0.0, 1.0);
        float _3395 = _3371 * _3385;
        float _3397 = _3367 * _3385;
        float _3399 = abs(_3393);
        float _3401 = log2(_3399);
        float _3403 = _3375 * _3385;
        float _3405 = _3395 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _3407 = _3043 * _3397;
        float _3409 = -_3397;
        float _3411 = -_3405;
        float _3413 = fma(_3409, (*spvDescriptorSet0.vp_c15)._m0[656].y, _3411);
        float _3415 = fma(_3063, _3395, _3407);
        float _3417 = -_3403;
        float _3419 = fma(_3417, (*spvDescriptorSet0.vp_c15)._m0[656].z, _3413);
        float _3421 = fma(_3059, _3403, _3415);
        float _3423 = precise::clamp(_3421, 0.0, 1.0);
        float _3425 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _3427 = _3419 + _3425;
        float _3429 = _3401 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _3431 = _3427 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _3433 = precise::clamp(_3431, 0.0, 1.0);
        float _3435 = exp2(_3429);
        float _3437 = _3435 * _3433;
        float _3439 = _3423 * _3437;
        float _3441 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _3443 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _3445 = _3439 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_96.x = _3441;
        out.m_96.y = _3443;
        out.m_96.z = _3445;
    }
    out.m_72.x = _3357;
    out.m_72.y = _3359;
    out.m_72.z = _3361;
    if (!_3343)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_53.x = 0.0;
    float _3447 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3447;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_96.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_96.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_96.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_96.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_53.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_53.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_53.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_53.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_57.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_57.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_57.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_57.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 76, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 77, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 78, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 79, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 80, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 81, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 82, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 83, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

