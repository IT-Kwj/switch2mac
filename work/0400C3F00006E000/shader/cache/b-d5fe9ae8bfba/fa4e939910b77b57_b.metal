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
    constant _16* vp_c13 [[id(5)]];
    constant _16* vp_c7 [[id(6)]];
    texture2d<float> vp_t_tcb_24 [[id(7)]];
    sampler vp_t_tcb_24Smplr [[id(8)]];
    texture3d<float> vp_t_tcb_32 [[id(9)]];
    sampler vp_t_tcb_32Smplr [[id(10)]];
    texture3d<float> vp_t_tcb_30 [[id(11)]];
    sampler vp_t_tcb_30Smplr [[id(12)]];
    texture2d<float> vp_t_tcb_1C [[id(13)]];
    sampler vp_t_tcb_1CSmplr [[id(14)]];
    sampler vp_t_tcb_24Smplr_w [[id(15)]];
    sampler vp_t_tcb_32Smplr_w [[id(16)]];
    sampler vp_t_tcb_30Smplr_w [[id(17)]];
    sampler vp_t_tcb_1CSmplr_w [[id(18)]];
    constant dm_border_t* dm_border [[id(19)]];
};

struct main0_out
{
    float4 m_66 [[user(locn0)]];
    float4 m_74 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_94 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_72 [[user(locn5)]];
    float4 m_86 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_78 [[user(locn8)]];
    float4 m_80 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_76 [[user(locn11)]];
    float4 m_92 [[user(locn12)]];
    float4 m_88 [[user(locn13)]];
    float4 m_90 [[user(locn14)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_84 [[attribute(0)]];
    float4 m_70 [[attribute(1)]];
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2666 = false;
    bool _1687 = false;
    bool _567 = false;
    bool _423 = false;
    bool _235 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2970 = as_type<float>(_127);
        out.gl_Position.z = _2970;
    }
    if (!_117)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _131 = in.m_53.w;
    float _133 = float(_113);
    float _135 = 1.0 / _133;
    float _137 = -_131;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_131);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = _139 * _135;
    bool _153 = _139 >= _133;
    bool _155 = !_149;
    bool _157 = _153 || _155;
    out.m_55.x = _151;
    float _159 = _131;
    float _161 = _139;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _159;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _165 = _163 * 5.0;
        _129 = as_type<int>(_165);
    }
    int _167 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3042 = as_type<float>(_167);
        out.gl_Position.z = _3042;
    }
    if (_157)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _193 = !_179;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _201 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    bool _203 = !_183;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _209 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    bool _213 = !_185;
    float _215 = _207;
    float _233;
    if (!_213)
    {
        float _217 = in.m_62.x;
        float _219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _221 = _217 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _223 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _225 = _223 * _219;
        float _227 = floor(_225);
        float _229 = -_227;
        float _231 = _225 + _229;
        _233 = _231;
        _235 = true;
    }
    else
    {
        _233 = _151;
    }
    _235 = false;
    float _237 = _233;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _237 + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = _237 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _237 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _259;
    bool _263 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _265 = isnan(_237);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _277 = 1.0 / _253;
    float _279 = 1.0 / _261;
    float _281 = 1.0 / _257;
    float _283 = _241 * _277;
    bool _285 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _287 = isnan(_237);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -_273;
    float _299 = _297 + 1.0;
    bool _301 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _303 = isnan(_237);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = _295 * _299;
    float _315 = _245 * _279;
    float _317 = -_295;
    float _319 = _317 + 1.0;
    float _321 = _311 * _319;
    float _323 = -_311;
    float _325 = _323 + 1.0;
    float _327 = _249 * _281;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _333 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_237);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = fma(_347, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = _343 * _325;
    float _361 = fma(_351, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = fma(_331, _327, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _365 = fma(_355, _327, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = -_343;
    float _369 = _367 + 1.0;
    float _371 = _357 * _359;
    float _373 = _361 * _359;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _375;
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _381;
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _387 = fma(_377, _315, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _389 = fma(_363, _321, _379);
    float _391 = fma(_383, _315, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = fma(_365, _321, _385);
    float _395 = fma(_387, _313, _389);
    float _397 = fma(_391, _313, _393);
    float _399 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[146].x, _395);
    float _401 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[146].y, _397);
    bool _403 = !_275;
    float _421;
    if (!_403)
    {
        float _405 = in.m_62.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        _421 = _151;
    }
    _423 = false;
    float _425 = _421;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _429 = _425 + _427;
    float _431 = in.m_64.x;
    float _433 = in.m_64.y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _439 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_425);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _455 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _457 = isnan(_425);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    bool _471 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = isnan(_425);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _437;
    float _485 = -_449;
    float _487 = _485 + 1.0;
    bool _489 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _491 = _465 * _487;
    float _493 = -_465;
    float _495 = _493 + 1.0;
    float _497 = 1.0 / _453;
    float _499 = _469 * _483;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _505 = _401 * _433;
    float _507 = _399 * _431;
    float _509 = fma(_499, _429, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _511 = -_481;
    float _513 = _511 + 1.0;
    float _515 = _509 * _491;
    float _517 = _503 * _497;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = _425 + _519;
    float _523 = _449 * _513;
    float _525 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[115].x, _515);
    float _527 = fma(_517, _521, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _529 = fma(_527, _523, _525);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _535 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[117].x, _529);
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _539 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _545 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _539;
    out.m_66.y = _541;
    out.m_66.z = _545;
    out.m_66.w = _543;
    bool _547 = !_489;
    float _565;
    if (!_547)
    {
        float _549 = in.m_62.x;
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _553 = _549 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        _565 = _151;
    }
    _567 = false;
    float _569 = _565;
    float _571 = in.m_62.x;
    float _573 = in.m_62.y;
    float _575 = in.m_62.z;
    float _577 = in.m_62.w;
    float _579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _581 = in.m_48.x;
    float _583 = in.m_48.y;
    float _585 = in.m_48.z;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _589 = _587 != 0;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _593 = _569 + _591;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _597 = _595 != 0;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _603 = _601 != 0;
    float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _609 = _607 != 0;
    float _611 = _579 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _619 = _577 > 0.5;
    float _621 = _571 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _623 = _573 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _627 = _625 != 0;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _631 = _629 != 0;
    float _633 = _583 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _635 = -_205;
    int _637 = _619 ? as_type<int>(_635) : as_type<int>(_205);
    float _639 = -_599;
    float _641 = fma(_621, 2.0, _639);
    bool _643 = _571 > 0.5;
    float _645 = _575 * 2.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _651 = fma(_581, (*spvDescriptorSet0.vp_c10)._m0[5].x, _633);
    float _653 = -_195;
    int _655 = _643 ? as_type<int>(_653) : as_type<int>(_195);
    float _657 = _573 * 2.0;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _661 = _659 != 0;
    float _663 = floor(_645);
    float _665 = _583 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _667 = _583 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _669 = !_589;
    float _671 = _669 ? _195 : as_type<float>(_655);
    float _673 = fma(_623, -2.0, _613);
    bool _675 = _573 > 0.5;
    float _677 = fma(_581, (*spvDescriptorSet0.vp_c10)._m0[4].x, _665);
    float _679 = fma(_581, (*spvDescriptorSet0.vp_c10)._m0[6].x, _667);
    float _681 = 1.0 / _649;
    float _683 = _571 * 2.0;
    float _685 = -_205;
    int _687 = _675 ? as_type<int>(_685) : as_type<int>(_205);
    float _689 = -_139;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[76].x, _641);
    float _693 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[4].z, _677);
    bool _695 = !_597;
    float _697 = _695 ? _205 : as_type<float>(_687);
    float _699 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[5].z, _651);
    float _701 = floor(_657);
    bool _703 = _575 > 0.5;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _705;
    float _709 = -_195;
    int _711 = _675 ? as_type<int>(_709) : as_type<int>(_195);
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _715 = -_195;
    int _717 = _703 ? as_type<int>(_715) : as_type<int>(_195);
    float _719 = _605 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _721 = _663 >= 0.0;
    bool _723 = isnan(_663);
    bool _725 = _721 || _723;
    bool _727 = isnan(0.0);
    bool _729 = _725 || _727;
    float _731 = floor(_683);
    float _733 = _707 * _681;
    float _735 = _573 + _575;
    bool _737 = !_609;
    float _739 = _737 ? _195 : as_type<float>(_717);
    float _741 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _673);
    int _743 = _729 ? 0 : 1;
    float _745 = _735 + (-1.0);
    float _747 = -_205;
    int _749 = _703 ? as_type<int>(_747) : as_type<int>(_205);
    float _751 = _699 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _753 = _701 > 0.0;
    float _755 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _757 = _701 >= 0.0;
    bool _759 = isnan(_701);
    bool _761 = _757 || _759;
    bool _763 = isnan(0.0);
    bool _765 = _761 || _763;
    float _767 = _573 + _571;
    float _769 = _701;
    float _771 = _585;
    float _773 = _593;
    if (!_661)
    {
        _769 = _575;
    }
    float _775 = _769;
    float _777 = _693 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _779 = _775;
    if (_661)
    {
        _779 = _573;
    }
    float _781 = _779;
    float _783 = _767 + (-1.0);
    bool _785 = !_627;
    float _787 = _785 ? _195 : as_type<float>(_711);
    float _789 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _791 = log2(_789);
    bool _793 = _731 > 0.0;
    float _795 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[83].w, _615);
    bool _797 = _731 >= 0.0;
    bool _799 = isnan(_731);
    bool _801 = _797 || _799;
    bool _803 = isnan(0.0);
    bool _805 = _801 || _803;
    float _807 = _671 + 0.5;
    bool _809 = !_631;
    float _811 = _809 ? _205 : as_type<float>(_749);
    float _813 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _795);
    float _815 = fma(_611, _807, _691);
    bool _817 = _663 > 0.0;
    float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _821 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _823 = isnan(_569);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _835 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[6].z, _679);
    if (!_661)
    {
        _771 = _573;
    }
    float _837 = _771;
    float _839 = fma(_733, _593, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _841 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _843 = isnan(_569);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -_831;
    float _855 = _853 + 1.0;
    float _857 = _837;
    if (_661)
    {
        _857 = _571;
    }
    float _859 = _857;
    float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _863 = _851 * _855;
    int _865 = ~_743;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    float _871 = _859 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _873 = _869;
    if (!_661)
    {
        _773 = _575;
    }
    float _875 = _773;
    float _877 = _839 * _863;
    float _879 = _875;
    if (!_817)
    {
        int _881 = ~_743;
        int _883 = _881 + 1;
        _873 = _883;
    }
    int _885 = _873;
    float _887 = -_713;
    float _889 = fma(_871, 2.0, _887);
    if (_661)
    {
        _879 = _573;
    }
    float _891 = _879;
    float _893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _895 = _805 ? 0 : 1;
    float _897 = _697 + (-0.5);
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _901 = _899 != 0;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _905 = _903 != 0;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _909 = _907 != 0;
    float _911 = -_811;
    float _913 = _911 + 0.5;
    float _915 = -_851;
    float _917 = _915 + 1.0;
    float _919 = _913 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _921 = !_603;
    float _923 = _921 ? _205 : as_type<float>(_637);
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _927 = _819 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _929 = -_139;
    float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[81].x, _889);
    float _933 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[131].x, _877);
    float _935 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[83].z, _925);
    float _937 = -_719;
    float _939 = -_741;
    float _941 = fma(_937, _897, _939);
    float _943 = _787 + 0.5;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _947 = _891 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _949 = _739 + 0.5;
    float _951 = _943 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _953 = _919 * _893;
    float _955 = fma(_947, -2.0, _945);
    float _957 = _923 + (-0.5);
    float _959 = _951 * _617;
    float _961 = _861 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _963 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _955);
    float _965 = fma(_927, _949, _931);
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _969 = _751 + _967;
    float _971 = -_961;
    float _973 = -_963;
    float _975 = fma(_971, _957, _973);
    out.m_68.x = _959;
    out.m_68.y = _953;
    bool _977 = !_901;
    int _979 = _977 ? 0 : 1;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _983 = _777 + _981;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _987 = _835 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _989 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _935);
    int _991 = _765 ? 0 : 1;
    float _993 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[78].z, _985);
    int _995 = abs(_979);
    float _997 = -_989;
    float _999 = _997 + 1.0;
    float _1001 = _969 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1007 = _987 + _1005;
    int _1009 = ~_991;
    int _1011 = _1009 + 1;
    int _1013 = _1011 + 1;
    float _1015 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1001);
    float _1017 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1003);
    int _1019 = _1013;
    if (!_753)
    {
        int _1021 = ~_991;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    float _1027 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _993);
    float _1029 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1015);
    float _1031 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1017);
    float _1033 = -_999;
    float _1035 = fma(_739, _1033, _965);
    float _1037 = _969 * _969;
    float _1039 = -_1027;
    float _1041 = _1039 + 1.0;
    float _1043 = -_1031;
    float _1045 = _1043 + 1.0;
    bool _1047 = _1029 >= 0.0;
    float _1049 = fma(_983, _983, _1037);
    float _1051 = float(_885);
    float _1053 = -_1041;
    float _1055 = fma(_671, _1053, _815);
    float _1057 = float(_995);
    float _1059 = _791 * _139;
    float _1061 = fma(_697, _1045, _941);
    float _1063 = in.m_70.x;
    float _1065 = in.m_70.y;
    float _1067 = in.m_70.z;
    float _1069 = fma(_1007, _1007, _1049);
    int _1071 = ~_895;
    int _1073 = _1071 + 1;
    int _1075 = _1073 + 1;
    float _1077 = _1057 * _1051;
    int _1079 = _1075;
    if (!_793)
    {
        int _1081 = ~_895;
        int _1083 = _1081 + 1;
        _1079 = _1083;
    }
    int _1085 = _1079;
    float _1087 = -_813;
    float _1089 = _1087 + 1.0;
    bool _1091 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1093 = isnan(1.0);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1099 = _1095 || _1097;
    float _1101 = exp2(_1059);
    bool _1103 = !_905;
    int _1105 = _1103 ? 0 : 1;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1109 = 1.0 + _1107;
    float _1111 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[132].x, _933);
    float _1113 = fma(_923, _1089, _975);
    if (_1047)
    {
        out.m_51.x = 0.0;
    }
    float _1115 = rsqrt(_1069);
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1119 = abs(_1105);
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1123 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1125 = isnan(0.0);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1131 = _1127 || _1129;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1135 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1137 = 1.0 / _1109;
    float _1139 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1141 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = -_1101;
    float _1145 = _1143 + 1.0;
    out.m_72.x = _1055;
    out.m_72.y = _1061;
    out.m_72.z = _1035;
    out.m_72.w = _1113;
    float _1147 = _1131 ? _1145 : 0.0;
    float _1149 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1151 = float(_1085);
    float _1153 = float(_1119);
    float _1155 = _1077 * (-2.0);
    out.m_74.x = _1135;
    out.m_74.y = _1139;
    out.m_74.z = _1141;
    out.m_74.w = _1149;
    float _1157 = _1151;
    if (_1099)
    {
        float _1159 = _1147 * _1137;
        _161 = _1159;
    }
    float _1161 = _161;
    float _1163 = _1153 * _1151;
    if (_1047)
    {
        _1157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1165 = _1157;
    float _1167 = fma(_833, _1155, _833);
    float _1169 = fma(_1155, _1063, _1063);
    float _1171 = _1163 * (-2.0);
    float _1173 = _571 + (-0.5);
    int _1175 = as_type<int>(_1165);
    if (_1047)
    {
        float _1177 = _1165 * 5.0;
        _1175 = as_type<int>(_1177);
    }
    int _1179 = _1175;
    float _1181 = fma(_755, _1171, _755);
    float _1183 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1169);
    float _1185 = fma(_1171, _1065, _1065);
    float _1187 = _969 * _1115;
    float _1189 = _983 * _1115;
    float _1191 = _1187;
    float _1193 = _1189;
    if (_1047)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4719 = as_type<float>(_1179);
        out.gl_Position.z = _4719;
    }
    bool _1195 = !_909;
    int _1197 = _1195 ? 0 : 1;
    float _1199 = -_1187;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _1203 = -_1189;
    float _1205 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[18].w, _983);
    float _1207 = _1201 * _1201;
    if (_1047)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1209 = -_1187;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _751);
    float _1213 = _1007 * _1115;
    float _1215 = -_1189;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _777);
    float _1219 = fma(_1167, _1161, _1183);
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1223 = _1211 + _1221;
    float _1225 = -_1213;
    float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[18].w, _987);
    float _1229 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1231 = _1217 + _1229;
    int _1233 = abs(_1197);
    float _1235 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1239 = _1227 + _1237;
    float _1241 = _573 + (-0.5);
    float _1243 = float(_1025);
    float _1245 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1235);
    float _1247 = _1219 * 0.15915493667125701904296875;
    float _1249 = float(_1233);
    float _1251 = fma(_1241, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1185);
    float _1253 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1245);
    float _1255 = fma(_1205, _1205, _1207);
    float _1257 = -_1213;
    float _1259 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1007);
    float _1261 = _575 + _571;
    float _1263 = _1249 * _1243;
    bool _1265 = _1253 >= 0.0;
    float _1267 = fma(_1181, _1161, _1251);
    float _1269 = fma(_1259, _1259, _1255);
    float _1271 = _1261 + (-1.0);
    float _1273 = _1263 * (-2.0);
    float _1275 = _1267 * 0.15915493667125701904296875;
    float _1277 = _575 + (-0.5);
    float _1279 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1281 = fma(_1273, _1067, _1067);
    float _1283 = sqrt(_1269);
    float _1285 = fma(_1279, _1273, _1279);
    float _1287 = _1263;
    int _1289 = as_type<int>(_1277);
    float _1291 = _1217;
    if (_1265)
    {
        _1287 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1293 = _1287;
    float _1295 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1281);
    if (_1265)
    {
        out.m_51.x = 0.0;
    }
    float _1297 = _1247 * 6.283185482025146484375;
    float _1299 = sin(_1297);
    if (_1265)
    {
        float _1301 = _1293 * 5.0;
        _1289 = as_type<int>(_1301);
    }
    int _1303 = _1289;
    float _1305 = fma(_1285, _1161, _1295);
    if (_1265)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4915 = as_type<float>(_1303);
        out.gl_Position.z = _4915;
    }
    float _1307 = _1305 * 0.15915493667125701904296875;
    float _1309 = _1247 * 6.283185482025146484375;
    float _1311 = cos(_1309);
    float _1313 = _1275 * 6.283185482025146484375;
    float _1315 = sin(_1313);
    float _1317 = _1275 * 6.283185482025146484375;
    float _1319 = cos(_1317);
    if (_1265)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1321 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1323 = _1115 * _1283;
    float _1325 = _1307 * 6.283185482025146484375;
    float _1327 = cos(_1325);
    float _1329 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1331 = _1299 * _1315;
    float _1333 = _1323 * _1321;
    float _1335 = _1311 * _1319;
    float _1337 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1339 = _1299 * _1319;
    float _1341 = _1329 * _1333;
    float _1343 = _1307 * 6.283185482025146484375;
    float _1345 = sin(_1343);
    float _1347 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1349 = _1311 * _1315;
    float _1351 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1353 = _1323 * _1347;
    float _1355 = _1311 * _1327;
    float _1357 = _1319 * _1327;
    float _1359 = _1299 * _1327;
    float _1361 = _1315 * _1327;
    float _1363 = _1337 * _1353;
    float _1365 = _1355 * _1341;
    float _1367 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1369 = _1367 * 0.5;
    float _1371 = fma(_1345, _1335, _1331);
    float _1373 = -_1339;
    float _1375 = fma(_1345, _1349, _1373);
    float _1377 = -_1341;
    float _1379 = _1345 * _1377;
    float _1381 = -_1349;
    float _1383 = fma(_1345, _1339, _1381);
    float _1385 = fma(_1371, _1363, _1365);
    float _1387 = _1359 * _1341;
    float _1389 = fma(_1357, _1363, _1379);
    float _1391 = fma(_1345, _1331, _1335);
    float _1393 = fma(_1375, _1369, _1385);
    float _1395 = fma(_1383, _1363, _1387);
    float _1397 = fma(_1361, _1369, _1389);
    float _1399 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1401 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1403 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1405 = fma(_1391, _1369, _1395);
    float _1407 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1409 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1401);
    float _1411 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1403);
    float _1413 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1415 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1417 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1409);
    float _1419 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1411);
    float _1421 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1399);
    float _1423 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1407);
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1427 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1429 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1413);
    float _1431 = _1355 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1433 = _777 + _1425;
    float _1435 = _987 + _1427;
    float _1437 = _1355 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1439 = _1355 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1443 = _1433 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1447 = _1435 + _1445;
    float _1449 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1415);
    float _1451 = fma(_1351, _1351, 1.0);
    float _1453 = _1443 * _1443;
    float _1455 = _1447 * _1447;
    float _1457 = -_1345;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1431);
    float _1461 = -_1345;
    float _1463 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1437);
    float _1465 = -_1345;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1439);
    float _1469 = _1453 + _1455;
    float _1471 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1449);
    float _1473 = rsqrt(_1451);
    float _1475 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1477 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1479 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1481 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1483 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1475);
    float _1485 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1477);
    float _1487 = _751 + _1479;
    float _1489 = sqrt(_1469);
    float _1491 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1481);
    bool _1493 = _1489 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1495 = _1481;
    float _1497 = _1433;
    float _1499 = _1453;
    float _1501 = _1455;
    float _1503 = _1435;
    if (!_1493)
    {
        _1495 = _1433;
    }
    float _1505 = _1495;
    float _1507 = _1505;
    if (!_1493)
    {
        _1497 = _1487;
    }
    float _1509 = _1497;
    bool _1511 = !_1493;
    float _1513 = _1509;
    if (!_1511)
    {
        float _1515 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1519 = _1489 + _1517;
        float _1521 = rsqrt(_1469);
        float _1523 = _1519 * _1515;
        float _1525 = _1487 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1527 = _1523 * 0.15915493667125701904296875;
        float _1529 = _1527 * 6.283185482025146484375;
        float _1531 = sin(_1529);
        float _1533 = _1527 * 6.283185482025146484375;
        float _1535 = cos(_1533);
        float _1537 = fma(_1531, _1525, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1539 = _1521 * _1537;
        float _1541 = _1535 + (-1.0);
        float _1543 = fma(_1443, _1539, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1545 = fma(_1447, _1539, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1547 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1551 = _1543 + _1549;
        float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1555 = _1545 + _1553;
        float _1557 = fma(_1487, _1535, _1547);
        float _1559 = _1551 * _1551;
        float _1561 = _1555 * _1555;
        _1513 = _1557;
        _1499 = _1559;
        _1501 = _1561;
        _1507 = _1543;
        _1503 = _1545;
    }
    float _1563 = _1513;
    float _1565 = _1499;
    float _1567 = _1501;
    float _1569 = _1507;
    float _1571 = _1503;
    float _1573 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1575 = _1563 + _1573;
    float _1577 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1467);
    float _1579 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1459);
    float _1581 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1463);
    float _1583 = fma(_1575, _1575, _1565);
    float _1585 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1483);
    float _1587 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1485);
    float _1589 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1491);
    float _1591 = _1583 + _1567;
    float _1593 = _1351 * _1473;
    float _1595 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1421);
    float _1597 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1599 = _1351 * _1579;
    float _1601 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1423);
    float _1603 = _1351 * _1581;
    float _1605 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1429);
    float _1607 = _1351 * _1577;
    float _1609 = -_1585;
    float _1611 = _1593 * _1609;
    float _1613 = -_1587;
    float _1615 = _1593 * _1613;
    float _1617 = -_1589;
    float _1619 = _1593 * _1617;
    float _1621 = fma(_1597, _1595, _1599);
    float _1623 = sqrt(_1591);
    float _1625 = fma(_1597, _1601, _1603);
    float _1627 = fma(_1597, _1605, _1607);
    float _1629 = fma(_1473, _1579, _1611);
    float _1631 = fma(_1473, _1581, _1615);
    float _1633 = _1587 + _1625;
    float _1635 = fma(_1473, _1577, _1619);
    float _1637 = _1585 + _1621;
    float _1639 = _1589 + _1627;
    out.m_76.x = _1595;
    out.m_76.y = _1601;
    out.m_76.z = _1605;
    out.m_78.x = _1629;
    out.m_78.y = _1631;
    out.m_78.z = _1635;
    bool _1641 = _1623 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1643 = isnan(_1623);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1649 = _1645 || _1647;
    out.m_80.x = _1637;
    out.m_80.y = _1633;
    out.m_80.z = _1639;
    float _1651 = _1627;
    if (!_1649)
    {
        _1651 = 1.0;
    }
    float _1653 = _1651;
    bool _1655 = !_1649;
    float _1657 = _1653;
    if (!_1655)
    {
        bool _1659 = _1623 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1661 = isnan(_1623);
        bool _1663 = _1659 || _1661;
        bool _1665 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1667 = _1663 || _1665;
        if (!_1667)
        {
            float _1669 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1671 = _1623 + _1669;
            float _1673 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1675 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1673;
            float _1677 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1679 = _1677 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1681 = 1.0 / _1675;
            float _1683 = _1671 * _1681;
            float _1685 = fma(_1683, _1679, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1657 = _1685;
            _1687 = true;
        }
        else
        {
            bool _1689 = _1623 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1691 = isnan(_1623);
            bool _1693 = _1689 || _1691;
            bool _1695 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1697 = _1693 || _1695;
            if (!_1697)
            {
                float _1699 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1701 = _1623 + _1699;
                float _1703 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1705 = _1703 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1707 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1709 = _1707 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1711 = 1.0 / _1705;
                float _1713 = _1701 * _1711;
                float _1715 = fma(_1713, _1709, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1657 = _1715;
                _1687 = true;
            }
            else
            {
                _1657 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1687 = false;
    float _1717 = _1657;
    float _1719 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1721 = _1563 + _1719;
    float _1723 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1725 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1727 = _1569 + _1725;
    float _1729 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1731 = _1571 + _1729;
    float _1733 = fma(_1721, _1717, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1735 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1723);
    float _1737 = fma(_1727, _1717, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1739 = fma(_1731, _1717, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1741 = -_751;
    float _1743 = _1741 + _1733;
    float _1745 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1735);
    float _1747 = -_777;
    float _1749 = _1747 + _1737;
    float _1751 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1753 = _1743 * _1743;
    float _1755 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1757 = -_987;
    float _1759 = _1757 + _1739;
    float _1761 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1751);
    float _1763 = fma(_1749, _1749, _1753);
    float _1765 = 1.0 / _1755;
    float _1767 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1761);
    float _1769 = fma(_1759, _1759, _1763);
    float _1771 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1773 = sqrt(_1769);
    float _1775 = _1771 + _1755;
    float _1777 = _1775 * _1765;
    float _1779 = _1777 * 0.5;
    float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1783 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1781);
    bool _1785 = _1773 > 0.0;
    float _1787 = 1.0 / _1783;
    bool _1789 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1791 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1793 = _1789 || _1791;
    bool _1795 = isnan(0.5);
    bool _1797 = _1793 || _1795;
    bool _1799 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan(0.5);
    bool _1807 = _1803 || _1805;
    float _1809 = _1755;
    float _1811 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1813 = _1739;
    float _1815 = _1765;
    if (!_1785)
    {
        _1809 = _1737;
    }
    float _1817 = _1809;
    float _1819 = _1817;
    if (!_1785)
    {
        _1811 = _1733;
    }
    float _1821 = _1811;
    bool _1823 = !_1785;
    float _1825 = _1821;
    if (!_1823)
    {
        float _1827 = _209 * _209;
        float _1829 = rsqrt(_1769);
        float _1831 = fma(_207, _207, _1827);
        float _1833 = fma(_211, _211, _1831);
        float _1835 = sqrt(_1833);
        float _1837 = _1749 * _1829;
        float _1839 = _1743 * _1829;
        float _1841 = _1759 * _1829;
        bool _1843 = _1835 > 0.0;
        float _1845 = _1831;
        float _1847 = _1835;
        _1815 = _1839;
        if (!_1843)
        {
            _1845 = _1737;
        }
        float _1849 = _1845;
        _1819 = _1849;
        if (!_1843)
        {
            _1847 = _1733;
        }
        float _1851 = _1847;
        bool _1853 = !_1843;
        _1825 = _1851;
        if (!_1853)
        {
            float _1855 = rsqrt(_1833);
            float _1857 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1859 = _209 * _1855;
            float _1861 = _207 * _1855;
            float _1863 = _211 * _1855;
            float _1865 = _1839 * _1859;
            float _1867 = fma(_1837, _1861, _1865);
            float _1869 = _1857 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1871 = fma(_1841, _1863, _1867);
            float _1873 = _1871 * _1869;
            float _1875 = fma(_207, _1873, _1737);
            float _1877 = fma(_209, _1873, _1733);
            float _1879 = fma(_211, _1873, _1739);
            _1819 = _1875;
            _1825 = _1877;
            _1813 = _1879;
            _1815 = _1869;
        }
    }
    float _1881 = _1819;
    float _1883 = _1825;
    float _1885 = _1813;
    float _1887 = _1815;
    float _1889 = -_1189;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1881);
    float _1893 = -_1187;
    float _1895 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1883);
    float _1897 = -_1213;
    float _1899 = fma(_1897, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1885);
    float _1901 = _1895;
    float _1903 = _1891;
    float _1905 = _1899;
    float _1907 = _1887;
    if (_1797)
    {
        _215 = 1.0;
    }
    float _1909 = _215;
    float _1911 = _1909;
    if (!_1807)
    {
        float _1913 = _1223 * _1223;
        float _1915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1917 = -_987;
        float _1919 = _1917 + _1885;
        float _1921 = -_751;
        float _1923 = _1921 + _1883;
        float _1925 = fma(_1231, _1231, _1913);
        float _1927 = fma(_1239, _1239, _1925);
        float _1929 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1931 = sqrt(_1927);
        float _1933 = 1.0 / _1323;
        float _1935 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1937 = precise::min(_1931, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1939 = _1937 * _1915;
        float _1941 = _1939 * _1933;
        float _1943 = -_777;
        float _1945 = _1943 + _1881;
        float _1947 = _1935 * _1941;
        float _1949 = _1919 * _1941;
        float _1951 = fma(_1923, _1947, _1211);
        float _1953 = fma(_1945, _1947, _1217);
        float _1955 = fma(_1935, _1949, _1227);
        _1191 = _1941;
        _1901 = _1951;
        _1903 = _1953;
        _1905 = _1955;
        _1193 = _1935;
    }
    float _1957 = _1191;
    float _1959 = _1901;
    float _1961 = _1903;
    float _1963 = _1905;
    float _1965 = _1193;
    float _1967 = _1957;
    float _1969 = _1965;
    if (_1797)
    {
        _1967 = 1.0;
    }
    float _1971 = _1967;
    float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1975 = _1787 * _1973;
    float _1977 = _1971;
    if (!_1797)
    {
        float _1979 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1983 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1981;
        float _1985 = _1979 * 0.15915493667125701904296875;
        float _1987 = _1985 * 6.283185482025146484375;
        float _1989 = cos(_1987);
        float _1991 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1993 = _1991 * 0.15915493667125701904296875;
        float _1995 = _1985 * 6.283185482025146484375;
        float _1997 = sin(_1995);
        float _1999 = 1.0 / _1989;
        float _2001 = _1993 * 6.283185482025146484375;
        float _2003 = cos(_2001);
        float _2005 = _1997 * _1999;
        float _2007 = _1993 * 6.283185482025146484375;
        float _2009 = sin(_2007);
        float _2011 = _2003 * _2005;
        float _2013 = 1.0 / _1983;
        float _2015 = 1.0 / _2011;
        float _2017 = _2009 * _2015;
        float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2021 = fma(_1975, _2017, _2019);
        float _2023 = _2021 * _2013;
        float _2025 = precise::clamp(_2023, 0.0, 1.0);
        _1969 = _1985;
        _1911 = _2025;
    }
    float _2027 = _1969;
    float _2029 = _1911;
    float _2031 = _2027;
    if (!_1797)
    {
        float _2033 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2035 = _2033 * 0.15915493667125701904296875;
        float _2037 = _2035 * 6.283185482025146484375;
        float _2039 = cos(_2037);
        float _2041 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2043 = _2041 * 0.15915493667125701904296875;
        float _2045 = _2035 * 6.283185482025146484375;
        float _2047 = sin(_2045);
        float _2049 = 1.0 / _2039;
        float _2051 = _2043 * 6.283185482025146484375;
        float _2053 = cos(_2051);
        float _2055 = _2047 * _2049;
        float _2057 = _2043 * 6.283185482025146484375;
        float _2059 = sin(_2057);
        float _2061 = _2053 * _2055;
        float _2063 = 1.0 / _2061;
        float _2065 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2067 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2065;
        float _2069 = 1.0 / _2067;
        float _2071 = _2059 * _2063;
        float _2073 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2075 = fma(_1975, _2071, _2073);
        float _2077 = _2075 * _2069;
        float _2079 = precise::clamp(_2077, 0.0, 1.0);
        float _2081 = -_2079;
        float _2083 = _2081 + 1.0;
        _1977 = _2083;
    }
    float _2085 = _1977;
    float _2087 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2089 = _1959 + _2087;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2093 = _1961 + _2091;
    float _2095 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2097 = _1963 + _2095;
    float _2099 = _2089 * _2089;
    float _2101 = fma(_2093, _2093, _2099);
    float _2103 = fma(_2097, _2097, _2101);
    float _2105 = rsqrt(_2103);
    float _2107 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2109 = _2093 * _2107;
    float _2111 = _2097 * _2107;
    float _2113 = _2109 * _2109;
    float _2115 = _2111 * _2111;
    float _2117 = _2113 + _2115;
    float _2119 = sqrt(_2117);
    bool _2121 = _2119 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2125 = _2119 + _2123;
    float _2127 = _2105;
    float _2129 = _2117;
    float _2131 = _2125;
    float _2133 = _2107;
    float _2135 = _2109;
    if (_2121)
    {
        float _2137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2127 = _2137;
    }
    float _2139 = _2127;
    if (_2121)
    {
        float _2141 = rsqrt(_2117);
        _2129 = _2141;
    }
    float _2143 = _2129;
    float _2145 = _2143;
    if (_2121)
    {
        float _2147 = _2125 * _2139;
        _2131 = _2147;
    }
    float _2149 = _2131;
    if (_2121)
    {
        float _2151 = _2149 * 0.15915493667125701904296875;
        _2031 = _2151;
    }
    float _2153 = _2031;
    float _2155 = _2139;
    float _2157 = _2153;
    if (_2121)
    {
        float _2159 = _2153 * 6.283185482025146484375;
        float _2161 = sin(_2159);
        _2155 = _2161;
    }
    float _2163 = _2155;
    float _2165 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2167 = precise::max(0.0, _2165);
    float _2169 = _2097;
    float _2171 = _2167;
    if (_2121)
    {
        float _2173 = _2153 * 6.283185482025146484375;
        float _2175 = cos(_2173);
        _2169 = _2175;
    }
    float _2177 = _2169;
    float _2179 = -_2107;
    float _2181 = -_2167;
    float _2183 = fma(_2089, _2179, _2181);
    if (_2121)
    {
        float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2171 = _2185;
    }
    float _2187 = _2171;
    if (!_2121)
    {
        _2157 = _2183;
    }
    float _2189 = _2157;
    float _2191 = fma(_1217, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2193 = _2189;
    if (!_2121)
    {
        _1291 = _2115;
    }
    float _2195 = _1291;
    float _2197 = _2163;
    float _2199 = _2195;
    if (_2121)
    {
        float _2201 = fma(_2163, _2187, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2133 = _2201;
    }
    float _2203 = _2133;
    float _2205 = sqrt(_2103);
    float _2207 = _2203;
    if (_2121)
    {
        float _2209 = _2177 + (-1.0);
        _2197 = _2209;
    }
    float _2211 = _2197;
    float _2213 = _2211;
    if (_2121)
    {
        float _2215 = _2143 * _2203;
        _1907 = _2215;
    }
    float _2217 = _1907;
    if (!_2121)
    {
        _2145 = _2111;
    }
    float _2219 = _2145;
    float _2221 = _2219;
    if (_2121)
    {
        float _2223 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2207 = _2223;
    }
    float _2225 = _2207;
    if (_2121)
    {
        float _2227 = _2109 * _2217;
        _2135 = _2227;
    }
    float _2229 = _2135;
    if (!_2121)
    {
        _2213 = _2113;
    }
    float _2231 = _2213;
    float _2233 = _2231;
    if (_2121)
    {
        float _2235 = _2111 * _2217;
        _2221 = _2235;
    }
    float _2237 = _2221;
    if (_2121)
    {
        float _2239 = fma(_2183, _2177, _2225);
        _2193 = _2239;
    }
    float _2241 = _2193;
    if (_2121)
    {
        float _2243 = _2229 * _2229;
        _2233 = _2243;
    }
    float _2245 = _2233;
    float _2247 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2121)
    {
        float _2249 = _2237 * _2237;
        _2199 = _2249;
    }
    float _2251 = _2199;
    float _2253 = fma(_2241, _2241, _2245);
    float _2255 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2247);
    float _2257 = floor(_2191);
    float _2259 = _2253 + _2251;
    float _2261 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2255);
    float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2265 = fma(_2205, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2263);
    float _2267 = precise::clamp(_2265, 0.0, 1.0);
    float _2269 = fma(_1227, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2271 = _2261 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2273 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2275 = rsqrt(_2259);
    float _2277 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2279 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2281 = -_2267;
    float _2283 = _2281 + 1.0;
    float _2285 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2273);
    float _2287 = -_2279;
    float _2289 = fma(_2287, _2277, 1.0);
    float _2291 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2293 = floor(_2269);
    float _2295 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2297 = -_2257;
    float _2299 = _2191 + _2297;
    float _2301 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2291);
    float _2303 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2295);
    float _2305 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2301);
    float _2307 = abs(_2283);
    float _2309 = log2(_2307);
    float _2311 = _2275 * _2229;
    float _2313 = _2275 * _2241;
    float _2315 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2303);
    float _2317 = _2275 * _2237;
    float _2319 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2321 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2323 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2325 = log2(_2289);
    float _2327 = -_2319;
    float _2329 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2327);
    float _2331 = -_2293;
    float _2333 = _2269 + _2331;
    float _2335 = _2323 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2337 = _2323 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2339 = -_2317;
    float _2341 = fma(_2339, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2329);
    float _2343 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2285);
    float _2345 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2335);
    float _2347 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2349 = fma(_2341, -0.5, 0.5);
    float _2351 = _2343 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2353 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2345);
    float _2355 = exp2(_2347);
    float _2357 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2353);
    float _2359 = _2325 * 0.693147182464599609375;
    float _2361 = 1.0 / _2357;
    float _2363 = fma(_2341, 0.5, 0.5);
    float _2365 = _2323 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float2 _6642 = float2(_2299, _2333);
    float _2367 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6642, float2(0.0), isnan(_6642)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6642, float2(0.0), isnan(_6642)), level(0.0)).x;
    float _2369 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2371 = fma(_2363, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2373 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2337);
    float _2375 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2365);
    float _2377 = sqrt(_2349);
    float _2379 = _2313 + 1.0;
    float _2381 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2373);
    float _2383 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2375);
    float _2385 = fma(_2363, _2371, -0.212114393711090087890625);
    float _2387 = -_2313;
    float _2389 = fma(_2355, _2379, _2387);
    float _2391 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2381);
    float _2393 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2383);
    float _2395 = fma(_2363, _2385, 1.570728778839111328125);
    float _2397 = fma(_2389, 0.5, 0.5);
    float _2399 = _2391 * _2361;
    float _2401 = _2393 * _2361;
    float _2403 = fma(_2399, 0.5, 0.5);
    float _2405 = fma(_2401, -0.5, 0.5);
    float _2407 = _2377 * 0.636619746685028076171875;
    float _2409 = -_2395;
    float _2411 = fma(_2407, _2409, 1.0);
    float3 _6729 = float3(_2403, _2405, _2369);
    float _2413 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6729, float3(0.0), isnan(_6729)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6729, float3(0.0), isnan(_6729)), level(0.0)).x;
    float3 _6740 = float3(_2403, _2405, _2369);
    float4 _2416 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6740, float3(0.0), isnan(_6740)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6740, float3(0.0), isnan(_6740)), level(0.0)).xyzw;
    float _2418 = _2416.x;
    float _2420 = _2416.y;
    float _2422 = _2416.z;
    float _2424 = _2416.w;
    float2 _6756 = float2(_2411, _2397);
    float3 _2428 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6756, float2(0.0), isnan(_6756)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6756, float2(0.0), isnan(_6756)), level(0.0)).xyz;
    float _2430 = _2428.x;
    float _2432 = _2428.y;
    float _2434 = _2428.z;
    float _2436 = abs(_1975);
    float _2438 = log2(_2436);
    float _2440 = _2323 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _1961;
    out.m_82.y = _1959;
    out.m_82.z = _1963;
    bool _2442 = _2205 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2444 = isnan(_2205);
    bool _2446 = _2442 || _2444;
    bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2450 = _2446 || _2448;
    float _2452 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2440);
    float _2454 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2456 = in.m_84.x;
    float _2458 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2452);
    bool _2460 = _1975 <= 8000.0;
    bool _2462 = isnan(_1975);
    bool _2464 = _2460 || _2462;
    bool _2466 = isnan(8000.0);
    bool _2468 = _2464 || _2466;
    float _2470 = float(_2468);
    float _2472 = _2357 * 0.5;
    float _2474 = exp2(_2454);
    float _2476 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2458);
    float _2478 = _2391 + _2357;
    float _2480 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2482 = fma(_2393, -0.5, _2472);
    float _2484 = _2478 * 0.5;
    out.gl_Position.x = _2391;
    out.gl_Position.y = _2393;
    out.gl_Position.z = _2476;
    out.gl_Position.w = _2357;
    float _2486 = exp2(_2480);
    float _2488 = -_2474;
    float _2490 = _2488 + 1.0;
    float _2492 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2494 = _2393;
    float _2496 = _2476;
    float _2498 = _2357;
    if (!_2450)
    {
        _2494 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2500 = _2494;
    float _2502 = -_2492;
    float _2504 = _2502 + 1.0;
    float _2506 = fma(_2486, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2508 = precise::clamp(_2506, 0.0, 1.0);
    float _2510 = _2476 + _2357;
    float _2512 = _2500;
    float _2514 = _2500;
    if (!_2450)
    {
        _2496 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2516 = _2496;
    float _2518 = fma(_2508, -2.0, 3.0);
    float _2520 = _2508 * _2508;
    float _2522 = _2510 * 0.5;
    float _2524 = _2520 * _2518;
    float _2526 = -_2524;
    float _2528 = _2526 + 1.0;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2524);
    float _2532 = _2516;
    float _2534 = _2516;
    if (!_2450)
    {
        _2498 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2536 = _2498;
    float _2538 = _2470 * _2530;
    out.m_86.x = _2484;
    out.m_86.y = _2482;
    out.m_86.z = _2522;
    out.m_86.w = _2357;
    float _2540 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2542 = -_2367;
    float _2544 = _2542 + 1.0;
    float _2546 = _2544 * _2540;
    float _2548 = precise::clamp(_2546, 0.0, 1.0);
    float _2550 = -_2548;
    float _2552 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2554 = _2552 * _2456;
    float _2556 = _2492 * _2413;
    float _2558 = _2554 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2560 = _2424 * _2504;
    float _2562 = _2029 * _2085;
    float _2564 = _2424 * _2556;
    float _2566 = _2434 * _2556;
    out.m_88.x = _2558;
    float _2568 = _2554;
    float _2570 = _2564;
    float _2572 = _2562;
    float _2574 = _2536;
    float _2576 = _2536;
    if (!_2450)
    {
        _2568 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2578 = _2568;
    float _2580 = fma(_2430, _2564, _2418);
    float _2582 = fma(_2432, _2564, _2420);
    float _2584 = fma(_2424, _2566, _2422);
    float _2586 = _2562 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2588 = _2578;
    float _2590 = _2578;
    if (!_2450)
    {
        _2570 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2592 = _2570;
    float _2594 = _2592;
    float _2596 = _2592;
    if (!_2450)
    {
        _2572 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2598 = _2572;
    out.m_90.x = _2580;
    out.m_90.y = _2582;
    out.m_90.z = _2584;
    out.m_90.w = _2560;
    bool _2600 = !_2450;
    float _2602 = _2598;
    float _2604 = _2598;
    if (!_2600)
    {
        bool _2606 = _2205 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2608 = isnan(_2205);
        bool _2610 = _2606 || _2608;
        bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2614 = _2610 || _2612;
        if (!_2614)
        {
            float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2618 = _2205 + _2616;
            float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2622 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2620;
            float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2628 = 1.0 / _2622;
            float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2646 = _2618 * _2628;
            float _2648 = precise::clamp(_2646, 0.0, 1.0);
            float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2654 = fma(_2648, _2626, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2656 = fma(_2648, _2652, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2658 = fma(_2648, _2632, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2660 = fma(_2648, _2636, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2662 = fma(_2648, _2640, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2664 = fma(_2648, _2644, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2590 = _2658;
            _2514 = _2662;
            _2596 = _2654;
            _2534 = _2660;
            _2576 = _2656;
            _2604 = _2664;
            _2666 = true;
        }
        else
        {
            bool _2668 = _2205 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2670 = isnan(_2205);
            bool _2672 = _2668 || _2670;
            bool _2674 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2676 = _2672 || _2674;
            if (!_2676)
            {
                _2594 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2678 = _2594;
            _2596 = _2678;
            if (!_2676)
            {
                _2588 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2680 = _2588;
            _2590 = _2680;
            if (!_2676)
            {
                _2574 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2682 = _2574;
            _2576 = _2682;
            if (!_2676)
            {
                _2532 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2684 = _2532;
            _2534 = _2684;
            if (!_2676)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2686 = _2512;
            _2514 = _2686;
            if (!_2676)
            {
                _2602 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2688 = _2602;
            bool _2690 = !_2676;
            _2604 = _2688;
            if (!_2690)
            {
                bool _2692 = _2205 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2694 = isnan(_2205);
                bool _2696 = _2692 || _2694;
                bool _2698 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2700 = _2696 || _2698;
                if (!_2700)
                {
                    float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2704 = _2205 + _2702;
                    float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2708 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2706;
                    float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2714 = 1.0 / _2708;
                    float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2732 = _2704 * _2714;
                    float _2734 = precise::clamp(_2732, 0.0, 1.0);
                    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2740 = fma(_2734, _2712, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2742 = fma(_2734, _2738, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2744 = fma(_2734, _2718, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2746 = fma(_2734, _2722, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2748 = fma(_2734, _2726, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2750 = fma(_2734, _2730, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2590 = _2744;
                    _2514 = _2748;
                    _2596 = _2740;
                    _2534 = _2746;
                    _2576 = _2742;
                    _2604 = _2750;
                    _2666 = true;
                }
                else
                {
                    _2590 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2596 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2534 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2576 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2604 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2666 = false;
    float _2752 = _2590;
    float _2754 = _2514;
    float _2756 = _2596;
    float _2758 = _2534;
    float _2760 = _2576;
    float _2762 = _2604;
    float _2764 = fma(_1633, -0.5, 0.5);
    float _2766 = precise::clamp(_2764, 0.0, 1.0);
    float _2768 = -_2752;
    float _2770 = _2768 + _2754;
    float _2772 = _2586 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2774 = -_2756;
    float _2776 = _2774 + _2758;
    float _2778 = fma(_2766, _2770, _2752);
    out.m_92.x = 0.0;
    float _2780 = -_2760;
    float _2782 = _2780 + _2762;
    float _2784 = fma(_2766, _2776, _2756);
    float _2786 = _2778 * 0.586610972881317138671875;
    out.m_51.x = _2772;
    bool _2788 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2790 = fma(_2766, _2782, _2760);
    float _2792 = fma(_2784, 0.298911988735198974609375, _2786);
    bool _2794 = _2029 > 0.0;
    bool _2796 = isnan(_2029);
    bool _2798 = _2794 || _2796;
    bool _2800 = isnan(0.0);
    bool _2802 = _2798 || _2800;
    float _2804 = fma(_2790, 0.114477999508380889892578125, _2792);
    bool _2806 = _2085 <= 0.0;
    bool _2808 = !_2802;
    bool _2810 = _2806 || _2808;
    float _2812 = -_2804;
    float _2814 = _2784 + _2812;
    float _2816 = -_2804;
    float _2818 = _2778 + _2816;
    float _2820 = -_2804;
    float _2822 = _2790 + _2820;
    float _2824 = fma(_2814, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2804);
    float _2826 = fma(_2818, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2804);
    float _2828 = fma(_2822, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2804);
    bool _2830 = !_2788;
    if (!_2830)
    {
        float _2832 = -_1959;
        float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2836 = -_1961;
        float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2840 = -_1963;
        float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2844 = _2834 * _2834;
        float _2846 = fma(_2838, _2838, _2844);
        float _2848 = fma(_2842, _2842, _2846);
        float _2850 = sqrt(_2848);
        float _2852 = rsqrt(_2848);
        float _2854 = -_2850;
        float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2858 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2860 = precise::clamp(_2858, 0.0, 1.0);
        float _2862 = _2838 * _2852;
        float _2864 = _2834 * _2852;
        float _2866 = abs(_2860);
        float _2868 = log2(_2866);
        float _2870 = _2842 * _2852;
        float _2872 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2874 = _1633 * _2864;
        float _2876 = -_2864;
        float _2878 = -_2872;
        float _2880 = fma(_2876, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2878);
        float _2882 = fma(_1637, _2862, _2874);
        float _2884 = -_2870;
        float _2886 = fma(_2884, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2880);
        float _2888 = fma(_1639, _2870, _2882);
        float _2890 = precise::clamp(_2888, 0.0, 1.0);
        float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2894 = _2886 + _2892;
        float _2896 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2898 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2900 = precise::clamp(_2898, 0.0, 1.0);
        float _2902 = exp2(_2896);
        float _2904 = _2902 * _2900;
        float _2906 = _2890 * _2904;
        float _2908 = _2906 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2910 = _2906 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2912 = _2906 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2908;
        out.m_92.y = _2910;
        out.m_92.z = _2912;
    }
    out.m_94.x = _2824;
    out.m_94.y = _2826;
    out.m_94.z = _2828;
    if (!_2810)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2914 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2914;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2666 = false;
    bool _1687 = false;
    bool _567 = false;
    bool _423 = false;
    bool _235 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2970 = as_type<float>(_127);
        out.gl_Position.z = _2970;
    }
    if (!_117)
    {
        return out;
    }
    float _131 = in.m_53.w;
    float _133 = float(_113);
    float _135 = 1.0 / _133;
    float _137 = -_131;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_131);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = _139 * _135;
    bool _153 = _139 >= _133;
    bool _155 = !_149;
    bool _157 = _153 || _155;
    out.m_55.x = _151;
    float _159 = _131;
    float _161 = _139;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _159;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _165 = _163 * 5.0;
        _129 = as_type<int>(_165);
    }
    int _167 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3042 = as_type<float>(_167);
        out.gl_Position.z = _3042;
    }
    if (_157)
    {
        return out;
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _193 = !_179;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _201 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    bool _203 = !_183;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _209 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    bool _213 = !_185;
    float _215 = _207;
    float _233;
    if (!_213)
    {
        float _217 = in.m_62.x;
        float _219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _221 = _217 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _223 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _225 = _223 * _219;
        float _227 = floor(_225);
        float _229 = -_227;
        float _231 = _225 + _229;
        _233 = _231;
        _235 = true;
    }
    else
    {
        _233 = _151;
    }
    _235 = false;
    float _237 = _233;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _237 + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = _237 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _237 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _259;
    bool _263 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _265 = isnan(_237);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _277 = 1.0 / _253;
    float _279 = 1.0 / _261;
    float _281 = 1.0 / _257;
    float _283 = _241 * _277;
    bool _285 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _287 = isnan(_237);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -_273;
    float _299 = _297 + 1.0;
    bool _301 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _303 = isnan(_237);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = _295 * _299;
    float _315 = _245 * _279;
    float _317 = -_295;
    float _319 = _317 + 1.0;
    float _321 = _311 * _319;
    float _323 = -_311;
    float _325 = _323 + 1.0;
    float _327 = _249 * _281;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _333 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_237);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = fma(_347, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = _343 * _325;
    float _361 = fma(_351, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = fma(_331, _327, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _365 = fma(_355, _327, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = -_343;
    float _369 = _367 + 1.0;
    float _371 = _357 * _359;
    float _373 = _361 * _359;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _375;
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _381;
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _387 = fma(_377, _315, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _389 = fma(_363, _321, _379);
    float _391 = fma(_383, _315, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = fma(_365, _321, _385);
    float _395 = fma(_387, _313, _389);
    float _397 = fma(_391, _313, _393);
    float _399 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[146].x, _395);
    float _401 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[146].y, _397);
    bool _403 = !_275;
    float _421;
    if (!_403)
    {
        float _405 = in.m_62.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        _421 = _151;
    }
    _423 = false;
    float _425 = _421;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _429 = _425 + _427;
    float _431 = in.m_64.x;
    float _433 = in.m_64.y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _439 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_425);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _455 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _457 = isnan(_425);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    bool _471 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = isnan(_425);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _437;
    float _485 = -_449;
    float _487 = _485 + 1.0;
    bool _489 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _491 = _465 * _487;
    float _493 = -_465;
    float _495 = _493 + 1.0;
    float _497 = 1.0 / _453;
    float _499 = _469 * _483;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _505 = _401 * _433;
    float _507 = _399 * _431;
    float _509 = fma(_499, _429, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _511 = -_481;
    float _513 = _511 + 1.0;
    float _515 = _509 * _491;
    float _517 = _503 * _497;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = _425 + _519;
    float _523 = _449 * _513;
    float _525 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[115].x, _515);
    float _527 = fma(_517, _521, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _529 = fma(_527, _523, _525);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _535 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[117].x, _529);
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _539 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _545 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _539;
    out.m_66.y = _541;
    out.m_66.z = _545;
    out.m_66.w = _543;
    bool _547 = !_489;
    float _565;
    if (!_547)
    {
        float _549 = in.m_62.x;
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _553 = _549 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        _565 = _151;
    }
    _567 = false;
    float _569 = _565;
    float _571 = in.m_62.x;
    float _573 = in.m_62.y;
    float _575 = in.m_62.z;
    float _577 = in.m_62.w;
    float _579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _581 = in.m_48.x;
    float _583 = in.m_48.y;
    float _585 = in.m_48.z;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _589 = _587 != 0;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _593 = _569 + _591;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _597 = _595 != 0;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _603 = _601 != 0;
    float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _609 = _607 != 0;
    float _611 = _579 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _619 = _577 > 0.5;
    float _621 = _571 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _623 = _573 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _627 = _625 != 0;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _631 = _629 != 0;
    float _633 = _583 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _635 = -_205;
    int _637 = _619 ? as_type<int>(_635) : as_type<int>(_205);
    float _639 = -_599;
    float _641 = fma(_621, 2.0, _639);
    bool _643 = _571 > 0.5;
    float _645 = _575 * 2.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _651 = fma(_581, (*spvDescriptorSet0.vp_c10)._m0[5].x, _633);
    float _653 = -_195;
    int _655 = _643 ? as_type<int>(_653) : as_type<int>(_195);
    float _657 = _573 * 2.0;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _661 = _659 != 0;
    float _663 = floor(_645);
    float _665 = _583 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _667 = _583 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _669 = !_589;
    float _671 = _669 ? _195 : as_type<float>(_655);
    float _673 = fma(_623, -2.0, _613);
    bool _675 = _573 > 0.5;
    float _677 = fma(_581, (*spvDescriptorSet0.vp_c10)._m0[4].x, _665);
    float _679 = fma(_581, (*spvDescriptorSet0.vp_c10)._m0[6].x, _667);
    float _681 = 1.0 / _649;
    float _683 = _571 * 2.0;
    float _685 = -_205;
    int _687 = _675 ? as_type<int>(_685) : as_type<int>(_205);
    float _689 = -_139;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[76].x, _641);
    float _693 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[4].z, _677);
    bool _695 = !_597;
    float _697 = _695 ? _205 : as_type<float>(_687);
    float _699 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[5].z, _651);
    float _701 = floor(_657);
    bool _703 = _575 > 0.5;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _705;
    float _709 = -_195;
    int _711 = _675 ? as_type<int>(_709) : as_type<int>(_195);
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _715 = -_195;
    int _717 = _703 ? as_type<int>(_715) : as_type<int>(_195);
    float _719 = _605 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _721 = _663 >= 0.0;
    bool _723 = isnan(_663);
    bool _725 = _721 || _723;
    bool _727 = isnan(0.0);
    bool _729 = _725 || _727;
    float _731 = floor(_683);
    float _733 = _707 * _681;
    float _735 = _573 + _575;
    bool _737 = !_609;
    float _739 = _737 ? _195 : as_type<float>(_717);
    float _741 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _673);
    int _743 = _729 ? 0 : 1;
    float _745 = _735 + (-1.0);
    float _747 = -_205;
    int _749 = _703 ? as_type<int>(_747) : as_type<int>(_205);
    float _751 = _699 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _753 = _701 > 0.0;
    float _755 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _757 = _701 >= 0.0;
    bool _759 = isnan(_701);
    bool _761 = _757 || _759;
    bool _763 = isnan(0.0);
    bool _765 = _761 || _763;
    float _767 = _573 + _571;
    float _769 = _701;
    float _771 = _585;
    float _773 = _593;
    if (!_661)
    {
        _769 = _575;
    }
    float _775 = _769;
    float _777 = _693 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _779 = _775;
    if (_661)
    {
        _779 = _573;
    }
    float _781 = _779;
    float _783 = _767 + (-1.0);
    bool _785 = !_627;
    float _787 = _785 ? _195 : as_type<float>(_711);
    float _789 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _791 = log2(_789);
    bool _793 = _731 > 0.0;
    float _795 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[83].w, _615);
    bool _797 = _731 >= 0.0;
    bool _799 = isnan(_731);
    bool _801 = _797 || _799;
    bool _803 = isnan(0.0);
    bool _805 = _801 || _803;
    float _807 = _671 + 0.5;
    bool _809 = !_631;
    float _811 = _809 ? _205 : as_type<float>(_749);
    float _813 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _795);
    float _815 = fma(_611, _807, _691);
    bool _817 = _663 > 0.0;
    float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _821 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _823 = isnan(_569);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _835 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[6].z, _679);
    if (!_661)
    {
        _771 = _573;
    }
    float _837 = _771;
    float _839 = fma(_733, _593, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _841 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _843 = isnan(_569);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -_831;
    float _855 = _853 + 1.0;
    float _857 = _837;
    if (_661)
    {
        _857 = _571;
    }
    float _859 = _857;
    float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _863 = _851 * _855;
    int _865 = ~_743;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    float _871 = _859 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _873 = _869;
    if (!_661)
    {
        _773 = _575;
    }
    float _875 = _773;
    float _877 = _839 * _863;
    float _879 = _875;
    if (!_817)
    {
        int _881 = ~_743;
        int _883 = _881 + 1;
        _873 = _883;
    }
    int _885 = _873;
    float _887 = -_713;
    float _889 = fma(_871, 2.0, _887);
    if (_661)
    {
        _879 = _573;
    }
    float _891 = _879;
    float _893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _895 = _805 ? 0 : 1;
    float _897 = _697 + (-0.5);
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _901 = _899 != 0;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _905 = _903 != 0;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _909 = _907 != 0;
    float _911 = -_811;
    float _913 = _911 + 0.5;
    float _915 = -_851;
    float _917 = _915 + 1.0;
    float _919 = _913 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _921 = !_603;
    float _923 = _921 ? _205 : as_type<float>(_637);
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _927 = _819 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _929 = -_139;
    float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[81].x, _889);
    float _933 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[131].x, _877);
    float _935 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[83].z, _925);
    float _937 = -_719;
    float _939 = -_741;
    float _941 = fma(_937, _897, _939);
    float _943 = _787 + 0.5;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _947 = _891 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _949 = _739 + 0.5;
    float _951 = _943 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _953 = _919 * _893;
    float _955 = fma(_947, -2.0, _945);
    float _957 = _923 + (-0.5);
    float _959 = _951 * _617;
    float _961 = _861 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _963 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _955);
    float _965 = fma(_927, _949, _931);
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _969 = _751 + _967;
    float _971 = -_961;
    float _973 = -_963;
    float _975 = fma(_971, _957, _973);
    out.m_68.x = _959;
    out.m_68.y = _953;
    bool _977 = !_901;
    int _979 = _977 ? 0 : 1;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _983 = _777 + _981;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _987 = _835 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _989 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _935);
    int _991 = _765 ? 0 : 1;
    float _993 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[78].z, _985);
    int _995 = abs(_979);
    float _997 = -_989;
    float _999 = _997 + 1.0;
    float _1001 = _969 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1007 = _987 + _1005;
    int _1009 = ~_991;
    int _1011 = _1009 + 1;
    int _1013 = _1011 + 1;
    float _1015 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1001);
    float _1017 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1003);
    int _1019 = _1013;
    if (!_753)
    {
        int _1021 = ~_991;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    float _1027 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _993);
    float _1029 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1015);
    float _1031 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1017);
    float _1033 = -_999;
    float _1035 = fma(_739, _1033, _965);
    float _1037 = _969 * _969;
    float _1039 = -_1027;
    float _1041 = _1039 + 1.0;
    float _1043 = -_1031;
    float _1045 = _1043 + 1.0;
    bool _1047 = _1029 >= 0.0;
    float _1049 = fma(_983, _983, _1037);
    float _1051 = float(_885);
    float _1053 = -_1041;
    float _1055 = fma(_671, _1053, _815);
    float _1057 = float(_995);
    float _1059 = _791 * _139;
    float _1061 = fma(_697, _1045, _941);
    float _1063 = in.m_70.x;
    float _1065 = in.m_70.y;
    float _1067 = in.m_70.z;
    float _1069 = fma(_1007, _1007, _1049);
    int _1071 = ~_895;
    int _1073 = _1071 + 1;
    int _1075 = _1073 + 1;
    float _1077 = _1057 * _1051;
    int _1079 = _1075;
    if (!_793)
    {
        int _1081 = ~_895;
        int _1083 = _1081 + 1;
        _1079 = _1083;
    }
    int _1085 = _1079;
    float _1087 = -_813;
    float _1089 = _1087 + 1.0;
    bool _1091 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1093 = isnan(1.0);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1099 = _1095 || _1097;
    float _1101 = exp2(_1059);
    bool _1103 = !_905;
    int _1105 = _1103 ? 0 : 1;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1109 = 1.0 + _1107;
    float _1111 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[132].x, _933);
    float _1113 = fma(_923, _1089, _975);
    if (_1047)
    {
        out.m_51.x = 0.0;
    }
    float _1115 = rsqrt(_1069);
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1119 = abs(_1105);
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1123 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1125 = isnan(0.0);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1131 = _1127 || _1129;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1135 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1137 = 1.0 / _1109;
    float _1139 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1141 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = -_1101;
    float _1145 = _1143 + 1.0;
    out.m_72.x = _1055;
    out.m_72.y = _1061;
    out.m_72.z = _1035;
    out.m_72.w = _1113;
    float _1147 = _1131 ? _1145 : 0.0;
    float _1149 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1151 = float(_1085);
    float _1153 = float(_1119);
    float _1155 = _1077 * (-2.0);
    out.m_74.x = _1135;
    out.m_74.y = _1139;
    out.m_74.z = _1141;
    out.m_74.w = _1149;
    float _1157 = _1151;
    if (_1099)
    {
        float _1159 = _1147 * _1137;
        _161 = _1159;
    }
    float _1161 = _161;
    float _1163 = _1153 * _1151;
    if (_1047)
    {
        _1157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1165 = _1157;
    float _1167 = fma(_833, _1155, _833);
    float _1169 = fma(_1155, _1063, _1063);
    float _1171 = _1163 * (-2.0);
    float _1173 = _571 + (-0.5);
    int _1175 = as_type<int>(_1165);
    if (_1047)
    {
        float _1177 = _1165 * 5.0;
        _1175 = as_type<int>(_1177);
    }
    int _1179 = _1175;
    float _1181 = fma(_755, _1171, _755);
    float _1183 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1169);
    float _1185 = fma(_1171, _1065, _1065);
    float _1187 = _969 * _1115;
    float _1189 = _983 * _1115;
    float _1191 = _1187;
    float _1193 = _1189;
    if (_1047)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4719 = as_type<float>(_1179);
        out.gl_Position.z = _4719;
    }
    bool _1195 = !_909;
    int _1197 = _1195 ? 0 : 1;
    float _1199 = -_1187;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _1203 = -_1189;
    float _1205 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[18].w, _983);
    float _1207 = _1201 * _1201;
    if (_1047)
    {
        return out;
    }
    float _1209 = -_1187;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _751);
    float _1213 = _1007 * _1115;
    float _1215 = -_1189;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _777);
    float _1219 = fma(_1167, _1161, _1183);
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1223 = _1211 + _1221;
    float _1225 = -_1213;
    float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[18].w, _987);
    float _1229 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1231 = _1217 + _1229;
    int _1233 = abs(_1197);
    float _1235 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1239 = _1227 + _1237;
    float _1241 = _573 + (-0.5);
    float _1243 = float(_1025);
    float _1245 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1235);
    float _1247 = _1219 * 0.15915493667125701904296875;
    float _1249 = float(_1233);
    float _1251 = fma(_1241, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1185);
    float _1253 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1245);
    float _1255 = fma(_1205, _1205, _1207);
    float _1257 = -_1213;
    float _1259 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1007);
    float _1261 = _575 + _571;
    float _1263 = _1249 * _1243;
    bool _1265 = _1253 >= 0.0;
    float _1267 = fma(_1181, _1161, _1251);
    float _1269 = fma(_1259, _1259, _1255);
    float _1271 = _1261 + (-1.0);
    float _1273 = _1263 * (-2.0);
    float _1275 = _1267 * 0.15915493667125701904296875;
    float _1277 = _575 + (-0.5);
    float _1279 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1281 = fma(_1273, _1067, _1067);
    float _1283 = sqrt(_1269);
    float _1285 = fma(_1279, _1273, _1279);
    float _1287 = _1263;
    int _1289 = as_type<int>(_1277);
    float _1291 = _1217;
    if (_1265)
    {
        _1287 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1293 = _1287;
    float _1295 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1281);
    if (_1265)
    {
        out.m_51.x = 0.0;
    }
    float _1297 = _1247 * 6.283185482025146484375;
    float _1299 = sin(_1297);
    if (_1265)
    {
        float _1301 = _1293 * 5.0;
        _1289 = as_type<int>(_1301);
    }
    int _1303 = _1289;
    float _1305 = fma(_1285, _1161, _1295);
    if (_1265)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4915 = as_type<float>(_1303);
        out.gl_Position.z = _4915;
    }
    float _1307 = _1305 * 0.15915493667125701904296875;
    float _1309 = _1247 * 6.283185482025146484375;
    float _1311 = cos(_1309);
    float _1313 = _1275 * 6.283185482025146484375;
    float _1315 = sin(_1313);
    float _1317 = _1275 * 6.283185482025146484375;
    float _1319 = cos(_1317);
    if (_1265)
    {
        return out;
    }
    float _1321 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1323 = _1115 * _1283;
    float _1325 = _1307 * 6.283185482025146484375;
    float _1327 = cos(_1325);
    float _1329 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1331 = _1299 * _1315;
    float _1333 = _1323 * _1321;
    float _1335 = _1311 * _1319;
    float _1337 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1339 = _1299 * _1319;
    float _1341 = _1329 * _1333;
    float _1343 = _1307 * 6.283185482025146484375;
    float _1345 = sin(_1343);
    float _1347 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1349 = _1311 * _1315;
    float _1351 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1353 = _1323 * _1347;
    float _1355 = _1311 * _1327;
    float _1357 = _1319 * _1327;
    float _1359 = _1299 * _1327;
    float _1361 = _1315 * _1327;
    float _1363 = _1337 * _1353;
    float _1365 = _1355 * _1341;
    float _1367 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1369 = _1367 * 0.5;
    float _1371 = fma(_1345, _1335, _1331);
    float _1373 = -_1339;
    float _1375 = fma(_1345, _1349, _1373);
    float _1377 = -_1341;
    float _1379 = _1345 * _1377;
    float _1381 = -_1349;
    float _1383 = fma(_1345, _1339, _1381);
    float _1385 = fma(_1371, _1363, _1365);
    float _1387 = _1359 * _1341;
    float _1389 = fma(_1357, _1363, _1379);
    float _1391 = fma(_1345, _1331, _1335);
    float _1393 = fma(_1375, _1369, _1385);
    float _1395 = fma(_1383, _1363, _1387);
    float _1397 = fma(_1361, _1369, _1389);
    float _1399 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1401 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1403 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1405 = fma(_1391, _1369, _1395);
    float _1407 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1409 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1401);
    float _1411 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1403);
    float _1413 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1415 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1417 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1409);
    float _1419 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1411);
    float _1421 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1399);
    float _1423 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1407);
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1427 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1429 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1413);
    float _1431 = _1355 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1433 = _777 + _1425;
    float _1435 = _987 + _1427;
    float _1437 = _1355 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1439 = _1355 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1443 = _1433 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1447 = _1435 + _1445;
    float _1449 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1415);
    float _1451 = fma(_1351, _1351, 1.0);
    float _1453 = _1443 * _1443;
    float _1455 = _1447 * _1447;
    float _1457 = -_1345;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1431);
    float _1461 = -_1345;
    float _1463 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1437);
    float _1465 = -_1345;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1439);
    float _1469 = _1453 + _1455;
    float _1471 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1449);
    float _1473 = rsqrt(_1451);
    float _1475 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1477 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1479 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1481 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1483 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1475);
    float _1485 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1477);
    float _1487 = _751 + _1479;
    float _1489 = sqrt(_1469);
    float _1491 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1481);
    bool _1493 = _1489 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1495 = _1481;
    float _1497 = _1433;
    float _1499 = _1453;
    float _1501 = _1455;
    float _1503 = _1435;
    if (!_1493)
    {
        _1495 = _1433;
    }
    float _1505 = _1495;
    float _1507 = _1505;
    if (!_1493)
    {
        _1497 = _1487;
    }
    float _1509 = _1497;
    bool _1511 = !_1493;
    float _1513 = _1509;
    if (!_1511)
    {
        float _1515 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1519 = _1489 + _1517;
        float _1521 = rsqrt(_1469);
        float _1523 = _1519 * _1515;
        float _1525 = _1487 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1527 = _1523 * 0.15915493667125701904296875;
        float _1529 = _1527 * 6.283185482025146484375;
        float _1531 = sin(_1529);
        float _1533 = _1527 * 6.283185482025146484375;
        float _1535 = cos(_1533);
        float _1537 = fma(_1531, _1525, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1539 = _1521 * _1537;
        float _1541 = _1535 + (-1.0);
        float _1543 = fma(_1443, _1539, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1545 = fma(_1447, _1539, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1547 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1551 = _1543 + _1549;
        float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1555 = _1545 + _1553;
        float _1557 = fma(_1487, _1535, _1547);
        float _1559 = _1551 * _1551;
        float _1561 = _1555 * _1555;
        _1513 = _1557;
        _1499 = _1559;
        _1501 = _1561;
        _1507 = _1543;
        _1503 = _1545;
    }
    float _1563 = _1513;
    float _1565 = _1499;
    float _1567 = _1501;
    float _1569 = _1507;
    float _1571 = _1503;
    float _1573 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1575 = _1563 + _1573;
    float _1577 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1467);
    float _1579 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1459);
    float _1581 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1463);
    float _1583 = fma(_1575, _1575, _1565);
    float _1585 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1483);
    float _1587 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1485);
    float _1589 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1491);
    float _1591 = _1583 + _1567;
    float _1593 = _1351 * _1473;
    float _1595 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1421);
    float _1597 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1599 = _1351 * _1579;
    float _1601 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1423);
    float _1603 = _1351 * _1581;
    float _1605 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1429);
    float _1607 = _1351 * _1577;
    float _1609 = -_1585;
    float _1611 = _1593 * _1609;
    float _1613 = -_1587;
    float _1615 = _1593 * _1613;
    float _1617 = -_1589;
    float _1619 = _1593 * _1617;
    float _1621 = fma(_1597, _1595, _1599);
    float _1623 = sqrt(_1591);
    float _1625 = fma(_1597, _1601, _1603);
    float _1627 = fma(_1597, _1605, _1607);
    float _1629 = fma(_1473, _1579, _1611);
    float _1631 = fma(_1473, _1581, _1615);
    float _1633 = _1587 + _1625;
    float _1635 = fma(_1473, _1577, _1619);
    float _1637 = _1585 + _1621;
    float _1639 = _1589 + _1627;
    out.m_76.x = _1595;
    out.m_76.y = _1601;
    out.m_76.z = _1605;
    out.m_78.x = _1629;
    out.m_78.y = _1631;
    out.m_78.z = _1635;
    bool _1641 = _1623 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1643 = isnan(_1623);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1649 = _1645 || _1647;
    out.m_80.x = _1637;
    out.m_80.y = _1633;
    out.m_80.z = _1639;
    float _1651 = _1627;
    if (!_1649)
    {
        _1651 = 1.0;
    }
    float _1653 = _1651;
    bool _1655 = !_1649;
    float _1657 = _1653;
    if (!_1655)
    {
        bool _1659 = _1623 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1661 = isnan(_1623);
        bool _1663 = _1659 || _1661;
        bool _1665 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1667 = _1663 || _1665;
        if (!_1667)
        {
            float _1669 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1671 = _1623 + _1669;
            float _1673 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1675 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1673;
            float _1677 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1679 = _1677 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1681 = 1.0 / _1675;
            float _1683 = _1671 * _1681;
            float _1685 = fma(_1683, _1679, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1657 = _1685;
            _1687 = true;
        }
        else
        {
            bool _1689 = _1623 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1691 = isnan(_1623);
            bool _1693 = _1689 || _1691;
            bool _1695 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1697 = _1693 || _1695;
            if (!_1697)
            {
                float _1699 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1701 = _1623 + _1699;
                float _1703 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1705 = _1703 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1707 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1709 = _1707 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1711 = 1.0 / _1705;
                float _1713 = _1701 * _1711;
                float _1715 = fma(_1713, _1709, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1657 = _1715;
                _1687 = true;
            }
            else
            {
                _1657 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1687 = false;
    float _1717 = _1657;
    float _1719 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1721 = _1563 + _1719;
    float _1723 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1725 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1727 = _1569 + _1725;
    float _1729 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1731 = _1571 + _1729;
    float _1733 = fma(_1721, _1717, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1735 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1723);
    float _1737 = fma(_1727, _1717, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1739 = fma(_1731, _1717, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1741 = -_751;
    float _1743 = _1741 + _1733;
    float _1745 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1735);
    float _1747 = -_777;
    float _1749 = _1747 + _1737;
    float _1751 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1753 = _1743 * _1743;
    float _1755 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1757 = -_987;
    float _1759 = _1757 + _1739;
    float _1761 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1751);
    float _1763 = fma(_1749, _1749, _1753);
    float _1765 = 1.0 / _1755;
    float _1767 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1761);
    float _1769 = fma(_1759, _1759, _1763);
    float _1771 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1773 = sqrt(_1769);
    float _1775 = _1771 + _1755;
    float _1777 = _1775 * _1765;
    float _1779 = _1777 * 0.5;
    float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1783 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1781);
    bool _1785 = _1773 > 0.0;
    float _1787 = 1.0 / _1783;
    bool _1789 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1791 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1793 = _1789 || _1791;
    bool _1795 = isnan(0.5);
    bool _1797 = _1793 || _1795;
    bool _1799 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan(0.5);
    bool _1807 = _1803 || _1805;
    float _1809 = _1755;
    float _1811 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1813 = _1739;
    float _1815 = _1765;
    if (!_1785)
    {
        _1809 = _1737;
    }
    float _1817 = _1809;
    float _1819 = _1817;
    if (!_1785)
    {
        _1811 = _1733;
    }
    float _1821 = _1811;
    bool _1823 = !_1785;
    float _1825 = _1821;
    if (!_1823)
    {
        float _1827 = _209 * _209;
        float _1829 = rsqrt(_1769);
        float _1831 = fma(_207, _207, _1827);
        float _1833 = fma(_211, _211, _1831);
        float _1835 = sqrt(_1833);
        float _1837 = _1749 * _1829;
        float _1839 = _1743 * _1829;
        float _1841 = _1759 * _1829;
        bool _1843 = _1835 > 0.0;
        float _1845 = _1831;
        float _1847 = _1835;
        _1815 = _1839;
        if (!_1843)
        {
            _1845 = _1737;
        }
        float _1849 = _1845;
        _1819 = _1849;
        if (!_1843)
        {
            _1847 = _1733;
        }
        float _1851 = _1847;
        bool _1853 = !_1843;
        _1825 = _1851;
        if (!_1853)
        {
            float _1855 = rsqrt(_1833);
            float _1857 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1859 = _209 * _1855;
            float _1861 = _207 * _1855;
            float _1863 = _211 * _1855;
            float _1865 = _1839 * _1859;
            float _1867 = fma(_1837, _1861, _1865);
            float _1869 = _1857 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1871 = fma(_1841, _1863, _1867);
            float _1873 = _1871 * _1869;
            float _1875 = fma(_207, _1873, _1737);
            float _1877 = fma(_209, _1873, _1733);
            float _1879 = fma(_211, _1873, _1739);
            _1819 = _1875;
            _1825 = _1877;
            _1813 = _1879;
            _1815 = _1869;
        }
    }
    float _1881 = _1819;
    float _1883 = _1825;
    float _1885 = _1813;
    float _1887 = _1815;
    float _1889 = -_1189;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1881);
    float _1893 = -_1187;
    float _1895 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1883);
    float _1897 = -_1213;
    float _1899 = fma(_1897, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1885);
    float _1901 = _1895;
    float _1903 = _1891;
    float _1905 = _1899;
    float _1907 = _1887;
    if (_1797)
    {
        _215 = 1.0;
    }
    float _1909 = _215;
    float _1911 = _1909;
    if (!_1807)
    {
        float _1913 = _1223 * _1223;
        float _1915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1917 = -_987;
        float _1919 = _1917 + _1885;
        float _1921 = -_751;
        float _1923 = _1921 + _1883;
        float _1925 = fma(_1231, _1231, _1913);
        float _1927 = fma(_1239, _1239, _1925);
        float _1929 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1931 = sqrt(_1927);
        float _1933 = 1.0 / _1323;
        float _1935 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1937 = precise::min(_1931, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1939 = _1937 * _1915;
        float _1941 = _1939 * _1933;
        float _1943 = -_777;
        float _1945 = _1943 + _1881;
        float _1947 = _1935 * _1941;
        float _1949 = _1919 * _1941;
        float _1951 = fma(_1923, _1947, _1211);
        float _1953 = fma(_1945, _1947, _1217);
        float _1955 = fma(_1935, _1949, _1227);
        _1191 = _1941;
        _1901 = _1951;
        _1903 = _1953;
        _1905 = _1955;
        _1193 = _1935;
    }
    float _1957 = _1191;
    float _1959 = _1901;
    float _1961 = _1903;
    float _1963 = _1905;
    float _1965 = _1193;
    float _1967 = _1957;
    float _1969 = _1965;
    if (_1797)
    {
        _1967 = 1.0;
    }
    float _1971 = _1967;
    float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1975 = _1787 * _1973;
    float _1977 = _1971;
    if (!_1797)
    {
        float _1979 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1983 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1981;
        float _1985 = _1979 * 0.15915493667125701904296875;
        float _1987 = _1985 * 6.283185482025146484375;
        float _1989 = cos(_1987);
        float _1991 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1993 = _1991 * 0.15915493667125701904296875;
        float _1995 = _1985 * 6.283185482025146484375;
        float _1997 = sin(_1995);
        float _1999 = 1.0 / _1989;
        float _2001 = _1993 * 6.283185482025146484375;
        float _2003 = cos(_2001);
        float _2005 = _1997 * _1999;
        float _2007 = _1993 * 6.283185482025146484375;
        float _2009 = sin(_2007);
        float _2011 = _2003 * _2005;
        float _2013 = 1.0 / _1983;
        float _2015 = 1.0 / _2011;
        float _2017 = _2009 * _2015;
        float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2021 = fma(_1975, _2017, _2019);
        float _2023 = _2021 * _2013;
        float _2025 = precise::clamp(_2023, 0.0, 1.0);
        _1969 = _1985;
        _1911 = _2025;
    }
    float _2027 = _1969;
    float _2029 = _1911;
    float _2031 = _2027;
    if (!_1797)
    {
        float _2033 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2035 = _2033 * 0.15915493667125701904296875;
        float _2037 = _2035 * 6.283185482025146484375;
        float _2039 = cos(_2037);
        float _2041 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2043 = _2041 * 0.15915493667125701904296875;
        float _2045 = _2035 * 6.283185482025146484375;
        float _2047 = sin(_2045);
        float _2049 = 1.0 / _2039;
        float _2051 = _2043 * 6.283185482025146484375;
        float _2053 = cos(_2051);
        float _2055 = _2047 * _2049;
        float _2057 = _2043 * 6.283185482025146484375;
        float _2059 = sin(_2057);
        float _2061 = _2053 * _2055;
        float _2063 = 1.0 / _2061;
        float _2065 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2067 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2065;
        float _2069 = 1.0 / _2067;
        float _2071 = _2059 * _2063;
        float _2073 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2075 = fma(_1975, _2071, _2073);
        float _2077 = _2075 * _2069;
        float _2079 = precise::clamp(_2077, 0.0, 1.0);
        float _2081 = -_2079;
        float _2083 = _2081 + 1.0;
        _1977 = _2083;
    }
    float _2085 = _1977;
    float _2087 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2089 = _1959 + _2087;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2093 = _1961 + _2091;
    float _2095 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2097 = _1963 + _2095;
    float _2099 = _2089 * _2089;
    float _2101 = fma(_2093, _2093, _2099);
    float _2103 = fma(_2097, _2097, _2101);
    float _2105 = rsqrt(_2103);
    float _2107 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2109 = _2093 * _2107;
    float _2111 = _2097 * _2107;
    float _2113 = _2109 * _2109;
    float _2115 = _2111 * _2111;
    float _2117 = _2113 + _2115;
    float _2119 = sqrt(_2117);
    bool _2121 = _2119 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2125 = _2119 + _2123;
    float _2127 = _2105;
    float _2129 = _2117;
    float _2131 = _2125;
    float _2133 = _2107;
    float _2135 = _2109;
    if (_2121)
    {
        float _2137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2127 = _2137;
    }
    float _2139 = _2127;
    if (_2121)
    {
        float _2141 = rsqrt(_2117);
        _2129 = _2141;
    }
    float _2143 = _2129;
    float _2145 = _2143;
    if (_2121)
    {
        float _2147 = _2125 * _2139;
        _2131 = _2147;
    }
    float _2149 = _2131;
    if (_2121)
    {
        float _2151 = _2149 * 0.15915493667125701904296875;
        _2031 = _2151;
    }
    float _2153 = _2031;
    float _2155 = _2139;
    float _2157 = _2153;
    if (_2121)
    {
        float _2159 = _2153 * 6.283185482025146484375;
        float _2161 = sin(_2159);
        _2155 = _2161;
    }
    float _2163 = _2155;
    float _2165 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2167 = precise::max(0.0, _2165);
    float _2169 = _2097;
    float _2171 = _2167;
    if (_2121)
    {
        float _2173 = _2153 * 6.283185482025146484375;
        float _2175 = cos(_2173);
        _2169 = _2175;
    }
    float _2177 = _2169;
    float _2179 = -_2107;
    float _2181 = -_2167;
    float _2183 = fma(_2089, _2179, _2181);
    if (_2121)
    {
        float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2171 = _2185;
    }
    float _2187 = _2171;
    if (!_2121)
    {
        _2157 = _2183;
    }
    float _2189 = _2157;
    float _2191 = fma(_1217, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2193 = _2189;
    if (!_2121)
    {
        _1291 = _2115;
    }
    float _2195 = _1291;
    float _2197 = _2163;
    float _2199 = _2195;
    if (_2121)
    {
        float _2201 = fma(_2163, _2187, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2133 = _2201;
    }
    float _2203 = _2133;
    float _2205 = sqrt(_2103);
    float _2207 = _2203;
    if (_2121)
    {
        float _2209 = _2177 + (-1.0);
        _2197 = _2209;
    }
    float _2211 = _2197;
    float _2213 = _2211;
    if (_2121)
    {
        float _2215 = _2143 * _2203;
        _1907 = _2215;
    }
    float _2217 = _1907;
    if (!_2121)
    {
        _2145 = _2111;
    }
    float _2219 = _2145;
    float _2221 = _2219;
    if (_2121)
    {
        float _2223 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2207 = _2223;
    }
    float _2225 = _2207;
    if (_2121)
    {
        float _2227 = _2109 * _2217;
        _2135 = _2227;
    }
    float _2229 = _2135;
    if (!_2121)
    {
        _2213 = _2113;
    }
    float _2231 = _2213;
    float _2233 = _2231;
    if (_2121)
    {
        float _2235 = _2111 * _2217;
        _2221 = _2235;
    }
    float _2237 = _2221;
    if (_2121)
    {
        float _2239 = fma(_2183, _2177, _2225);
        _2193 = _2239;
    }
    float _2241 = _2193;
    if (_2121)
    {
        float _2243 = _2229 * _2229;
        _2233 = _2243;
    }
    float _2245 = _2233;
    float _2247 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2121)
    {
        float _2249 = _2237 * _2237;
        _2199 = _2249;
    }
    float _2251 = _2199;
    float _2253 = fma(_2241, _2241, _2245);
    float _2255 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2247);
    float _2257 = floor(_2191);
    float _2259 = _2253 + _2251;
    float _2261 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2255);
    float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2265 = fma(_2205, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2263);
    float _2267 = precise::clamp(_2265, 0.0, 1.0);
    float _2269 = fma(_1227, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2271 = _2261 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2273 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2275 = rsqrt(_2259);
    float _2277 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2279 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2281 = -_2267;
    float _2283 = _2281 + 1.0;
    float _2285 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2273);
    float _2287 = -_2279;
    float _2289 = fma(_2287, _2277, 1.0);
    float _2291 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2293 = floor(_2269);
    float _2295 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2297 = -_2257;
    float _2299 = _2191 + _2297;
    float _2301 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2291);
    float _2303 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2295);
    float _2305 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2301);
    float _2307 = abs(_2283);
    float _2309 = log2(_2307);
    float _2311 = _2275 * _2229;
    float _2313 = _2275 * _2241;
    float _2315 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2303);
    float _2317 = _2275 * _2237;
    float _2319 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2321 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2323 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2325 = log2(_2289);
    float _2327 = -_2319;
    float _2329 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2327);
    float _2331 = -_2293;
    float _2333 = _2269 + _2331;
    float _2335 = _2323 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2337 = _2323 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2339 = -_2317;
    float _2341 = fma(_2339, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2329);
    float _2343 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2285);
    float _2345 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2335);
    float _2347 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2349 = fma(_2341, -0.5, 0.5);
    float _2351 = _2343 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2353 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2345);
    float _2355 = exp2(_2347);
    float _2357 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2353);
    float _2359 = _2325 * 0.693147182464599609375;
    float _2361 = 1.0 / _2357;
    float _2363 = fma(_2341, 0.5, 0.5);
    float _2365 = _2323 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float2 _6642 = float2(_2299, _2333);
    float _2367 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6642, float2(0.0), isnan(_6642)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6642, float2(0.0), isnan(_6642)), level(0.0)).x;
    float _2369 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2371 = fma(_2363, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2373 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2337);
    float _2375 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2365);
    float _2377 = sqrt(_2349);
    float _2379 = _2313 + 1.0;
    float _2381 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2373);
    float _2383 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2375);
    float _2385 = fma(_2363, _2371, -0.212114393711090087890625);
    float _2387 = -_2313;
    float _2389 = fma(_2355, _2379, _2387);
    float _2391 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2381);
    float _2393 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2383);
    float _2395 = fma(_2363, _2385, 1.570728778839111328125);
    float _2397 = fma(_2389, 0.5, 0.5);
    float _2399 = _2391 * _2361;
    float _2401 = _2393 * _2361;
    float _2403 = fma(_2399, 0.5, 0.5);
    float _2405 = fma(_2401, -0.5, 0.5);
    float _2407 = _2377 * 0.636619746685028076171875;
    float _2409 = -_2395;
    float _2411 = fma(_2407, _2409, 1.0);
    float3 _6729 = float3(_2403, _2405, _2369);
    float _2413 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6729, float3(0.0), isnan(_6729)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6729, float3(0.0), isnan(_6729)), level(0.0)).x;
    float3 _6740 = float3(_2403, _2405, _2369);
    float4 _2416 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6740, float3(0.0), isnan(_6740)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6740, float3(0.0), isnan(_6740)), level(0.0)).xyzw;
    float _2418 = _2416.x;
    float _2420 = _2416.y;
    float _2422 = _2416.z;
    float _2424 = _2416.w;
    float2 _6756 = float2(_2411, _2397);
    float3 _2428 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6756, float2(0.0), isnan(_6756)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6756, float2(0.0), isnan(_6756)), level(0.0)).xyz;
    float _2430 = _2428.x;
    float _2432 = _2428.y;
    float _2434 = _2428.z;
    float _2436 = abs(_1975);
    float _2438 = log2(_2436);
    float _2440 = _2323 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _1961;
    out.m_82.y = _1959;
    out.m_82.z = _1963;
    bool _2442 = _2205 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2444 = isnan(_2205);
    bool _2446 = _2442 || _2444;
    bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2450 = _2446 || _2448;
    float _2452 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2440);
    float _2454 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2456 = in.m_84.x;
    float _2458 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2452);
    bool _2460 = _1975 <= 8000.0;
    bool _2462 = isnan(_1975);
    bool _2464 = _2460 || _2462;
    bool _2466 = isnan(8000.0);
    bool _2468 = _2464 || _2466;
    float _2470 = float(_2468);
    float _2472 = _2357 * 0.5;
    float _2474 = exp2(_2454);
    float _2476 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2458);
    float _2478 = _2391 + _2357;
    float _2480 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2482 = fma(_2393, -0.5, _2472);
    float _2484 = _2478 * 0.5;
    out.gl_Position.x = _2391;
    out.gl_Position.y = _2393;
    out.gl_Position.z = _2476;
    out.gl_Position.w = _2357;
    float _2486 = exp2(_2480);
    float _2488 = -_2474;
    float _2490 = _2488 + 1.0;
    float _2492 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2494 = _2393;
    float _2496 = _2476;
    float _2498 = _2357;
    if (!_2450)
    {
        _2494 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2500 = _2494;
    float _2502 = -_2492;
    float _2504 = _2502 + 1.0;
    float _2506 = fma(_2486, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2508 = precise::clamp(_2506, 0.0, 1.0);
    float _2510 = _2476 + _2357;
    float _2512 = _2500;
    float _2514 = _2500;
    if (!_2450)
    {
        _2496 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2516 = _2496;
    float _2518 = fma(_2508, -2.0, 3.0);
    float _2520 = _2508 * _2508;
    float _2522 = _2510 * 0.5;
    float _2524 = _2520 * _2518;
    float _2526 = -_2524;
    float _2528 = _2526 + 1.0;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2524);
    float _2532 = _2516;
    float _2534 = _2516;
    if (!_2450)
    {
        _2498 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2536 = _2498;
    float _2538 = _2470 * _2530;
    out.m_86.x = _2484;
    out.m_86.y = _2482;
    out.m_86.z = _2522;
    out.m_86.w = _2357;
    float _2540 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2542 = -_2367;
    float _2544 = _2542 + 1.0;
    float _2546 = _2544 * _2540;
    float _2548 = precise::clamp(_2546, 0.0, 1.0);
    float _2550 = -_2548;
    float _2552 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2554 = _2552 * _2456;
    float _2556 = _2492 * _2413;
    float _2558 = _2554 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2560 = _2424 * _2504;
    float _2562 = _2029 * _2085;
    float _2564 = _2424 * _2556;
    float _2566 = _2434 * _2556;
    out.m_88.x = _2558;
    float _2568 = _2554;
    float _2570 = _2564;
    float _2572 = _2562;
    float _2574 = _2536;
    float _2576 = _2536;
    if (!_2450)
    {
        _2568 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2578 = _2568;
    float _2580 = fma(_2430, _2564, _2418);
    float _2582 = fma(_2432, _2564, _2420);
    float _2584 = fma(_2424, _2566, _2422);
    float _2586 = _2562 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2588 = _2578;
    float _2590 = _2578;
    if (!_2450)
    {
        _2570 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2592 = _2570;
    float _2594 = _2592;
    float _2596 = _2592;
    if (!_2450)
    {
        _2572 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2598 = _2572;
    out.m_90.x = _2580;
    out.m_90.y = _2582;
    out.m_90.z = _2584;
    out.m_90.w = _2560;
    bool _2600 = !_2450;
    float _2602 = _2598;
    float _2604 = _2598;
    if (!_2600)
    {
        bool _2606 = _2205 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2608 = isnan(_2205);
        bool _2610 = _2606 || _2608;
        bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2614 = _2610 || _2612;
        if (!_2614)
        {
            float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2618 = _2205 + _2616;
            float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2622 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2620;
            float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2628 = 1.0 / _2622;
            float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2646 = _2618 * _2628;
            float _2648 = precise::clamp(_2646, 0.0, 1.0);
            float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2654 = fma(_2648, _2626, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2656 = fma(_2648, _2652, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2658 = fma(_2648, _2632, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2660 = fma(_2648, _2636, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2662 = fma(_2648, _2640, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2664 = fma(_2648, _2644, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2590 = _2658;
            _2514 = _2662;
            _2596 = _2654;
            _2534 = _2660;
            _2576 = _2656;
            _2604 = _2664;
            _2666 = true;
        }
        else
        {
            bool _2668 = _2205 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2670 = isnan(_2205);
            bool _2672 = _2668 || _2670;
            bool _2674 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2676 = _2672 || _2674;
            if (!_2676)
            {
                _2594 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2678 = _2594;
            _2596 = _2678;
            if (!_2676)
            {
                _2588 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2680 = _2588;
            _2590 = _2680;
            if (!_2676)
            {
                _2574 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2682 = _2574;
            _2576 = _2682;
            if (!_2676)
            {
                _2532 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2684 = _2532;
            _2534 = _2684;
            if (!_2676)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2686 = _2512;
            _2514 = _2686;
            if (!_2676)
            {
                _2602 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2688 = _2602;
            bool _2690 = !_2676;
            _2604 = _2688;
            if (!_2690)
            {
                bool _2692 = _2205 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2694 = isnan(_2205);
                bool _2696 = _2692 || _2694;
                bool _2698 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2700 = _2696 || _2698;
                if (!_2700)
                {
                    float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2704 = _2205 + _2702;
                    float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2708 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2706;
                    float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2714 = 1.0 / _2708;
                    float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2732 = _2704 * _2714;
                    float _2734 = precise::clamp(_2732, 0.0, 1.0);
                    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2740 = fma(_2734, _2712, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2742 = fma(_2734, _2738, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2744 = fma(_2734, _2718, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2746 = fma(_2734, _2722, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2748 = fma(_2734, _2726, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2750 = fma(_2734, _2730, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2590 = _2744;
                    _2514 = _2748;
                    _2596 = _2740;
                    _2534 = _2746;
                    _2576 = _2742;
                    _2604 = _2750;
                    _2666 = true;
                }
                else
                {
                    _2590 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2596 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2534 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2576 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2604 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2666 = false;
    float _2752 = _2590;
    float _2754 = _2514;
    float _2756 = _2596;
    float _2758 = _2534;
    float _2760 = _2576;
    float _2762 = _2604;
    float _2764 = fma(_1633, -0.5, 0.5);
    float _2766 = precise::clamp(_2764, 0.0, 1.0);
    float _2768 = -_2752;
    float _2770 = _2768 + _2754;
    float _2772 = _2586 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2774 = -_2756;
    float _2776 = _2774 + _2758;
    float _2778 = fma(_2766, _2770, _2752);
    out.m_92.x = 0.0;
    float _2780 = -_2760;
    float _2782 = _2780 + _2762;
    float _2784 = fma(_2766, _2776, _2756);
    float _2786 = _2778 * 0.586610972881317138671875;
    out.m_51.x = _2772;
    bool _2788 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2790 = fma(_2766, _2782, _2760);
    float _2792 = fma(_2784, 0.298911988735198974609375, _2786);
    bool _2794 = _2029 > 0.0;
    bool _2796 = isnan(_2029);
    bool _2798 = _2794 || _2796;
    bool _2800 = isnan(0.0);
    bool _2802 = _2798 || _2800;
    float _2804 = fma(_2790, 0.114477999508380889892578125, _2792);
    bool _2806 = _2085 <= 0.0;
    bool _2808 = !_2802;
    bool _2810 = _2806 || _2808;
    float _2812 = -_2804;
    float _2814 = _2784 + _2812;
    float _2816 = -_2804;
    float _2818 = _2778 + _2816;
    float _2820 = -_2804;
    float _2822 = _2790 + _2820;
    float _2824 = fma(_2814, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2804);
    float _2826 = fma(_2818, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2804);
    float _2828 = fma(_2822, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2804);
    bool _2830 = !_2788;
    if (!_2830)
    {
        float _2832 = -_1959;
        float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2836 = -_1961;
        float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2840 = -_1963;
        float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2844 = _2834 * _2834;
        float _2846 = fma(_2838, _2838, _2844);
        float _2848 = fma(_2842, _2842, _2846);
        float _2850 = sqrt(_2848);
        float _2852 = rsqrt(_2848);
        float _2854 = -_2850;
        float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2858 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2860 = precise::clamp(_2858, 0.0, 1.0);
        float _2862 = _2838 * _2852;
        float _2864 = _2834 * _2852;
        float _2866 = abs(_2860);
        float _2868 = log2(_2866);
        float _2870 = _2842 * _2852;
        float _2872 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2874 = _1633 * _2864;
        float _2876 = -_2864;
        float _2878 = -_2872;
        float _2880 = fma(_2876, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2878);
        float _2882 = fma(_1637, _2862, _2874);
        float _2884 = -_2870;
        float _2886 = fma(_2884, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2880);
        float _2888 = fma(_1639, _2870, _2882);
        float _2890 = precise::clamp(_2888, 0.0, 1.0);
        float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2894 = _2886 + _2892;
        float _2896 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2898 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2900 = precise::clamp(_2898, 0.0, 1.0);
        float _2902 = exp2(_2896);
        float _2904 = _2902 * _2900;
        float _2906 = _2890 * _2904;
        float _2908 = _2906 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2910 = _2906 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2912 = _2906 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2908;
        out.m_92.y = _2910;
        out.m_92.z = _2912;
    }
    out.m_94.x = _2824;
    out.m_94.y = _2826;
    out.m_94.z = _2828;
    if (!_2810)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2914 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2914;
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
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_94 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_78 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_92 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_90 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2666 = false;
    bool _1687 = false;
    bool _567 = false;
    bool _423 = false;
    bool _235 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _108 = in.m_48.w;
    float _110 = trunc(_108);
    int _113 = int(_110);
    bool _117 = _113 >= 1;
    float _119 = 0.0;
    if (!_117)
    {
        _119 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _121 = _119;
    if (!_117)
    {
        out.m_51.x = 0.0;
    }
    int _123 = 0;
    if (!_117)
    {
        float _125 = _121 * 5.0;
        _123 = as_type<int>(_125);
    }
    int _127 = _123;
    int _129 = _127;
    if (!_117)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2970 = as_type<float>(_127);
        out.gl_Position.z = _2970;
    }
    if (!_117)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _131 = in.m_53.w;
    float _133 = float(_113);
    float _135 = 1.0 / _133;
    float _137 = -_131;
    float _139 = _137 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _141 = _131 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _143 = isnan(_131);
    bool _145 = _141 || _143;
    bool _147 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _149 = _145 || _147;
    float _151 = _139 * _135;
    bool _153 = _139 >= _133;
    bool _155 = !_149;
    bool _157 = _153 || _155;
    out.m_55.x = _151;
    float _159 = _131;
    float _161 = _139;
    if (_157)
    {
        _159 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _163 = _159;
    if (_157)
    {
        out.m_51.x = 0.0;
    }
    if (_157)
    {
        float _165 = _163 * 5.0;
        _129 = as_type<int>(_165);
    }
    int _167 = _129;
    if (_157)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3042 = as_type<float>(_167);
        out.gl_Position.z = _3042;
    }
    if (_157)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _169 = as_type<float>(int(gl_VertexIndex));
    float _171 = in.m_60.x;
    float _173 = in.m_60.y;
    float _175 = in.m_60.z;
    int _177 = as_type<int>(_169) & 1;
    bool _179 = _177 != 0;
    int _181 = as_type<int>(_169) & 2;
    bool _183 = _181 != 0;
    bool _185 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _187 = _173 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _189 = _173 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _191 = _173 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _193 = !_179;
    float _195 = _193 ? (-0.5) : 0.5;
    float _197 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[4].x, _187);
    float _199 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[5].x, _189);
    float _201 = fma(_171, (*spvDescriptorSet0.vp_c10)._m0[6].x, _191);
    bool _203 = !_183;
    float _205 = _203 ? (-0.5) : 0.5;
    float _207 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[4].z, _197);
    float _209 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[5].z, _199);
    float _211 = fma(_175, (*spvDescriptorSet0.vp_c10)._m0[6].z, _201);
    bool _213 = !_185;
    float _215 = _207;
    float _233;
    if (!_213)
    {
        float _217 = in.m_62.x;
        float _219 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _221 = _217 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _223 = fma(_221, (*spvDescriptorSet0.vp_c9)._m0[12].x, _139);
        float _225 = _223 * _219;
        float _227 = floor(_225);
        float _229 = -_227;
        float _231 = _225 + _229;
        _233 = _231;
        _235 = true;
    }
    else
    {
        _233 = _151;
    }
    _235 = false;
    float _237 = _233;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _241 = _237 + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _245 = _237 + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _237 + _247;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _251;
    float _255 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _257 = _255 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _259 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _261 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _259;
    bool _263 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _265 = isnan(_237);
    bool _267 = _263 || _265;
    bool _269 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _271 = _267 || _269;
    float _273 = float(_271);
    bool _275 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _277 = 1.0 / _253;
    float _279 = 1.0 / _261;
    float _281 = 1.0 / _257;
    float _283 = _241 * _277;
    bool _285 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _287 = isnan(_237);
    bool _289 = _285 || _287;
    bool _291 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _293 = _289 || _291;
    float _295 = float(_293);
    float _297 = -_273;
    float _299 = _297 + 1.0;
    bool _301 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _303 = isnan(_237);
    bool _305 = _301 || _303;
    bool _307 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _309 = _305 || _307;
    float _311 = float(_309);
    float _313 = _295 * _299;
    float _315 = _245 * _279;
    float _317 = -_295;
    float _319 = _317 + 1.0;
    float _321 = _311 * _319;
    float _323 = -_311;
    float _325 = _323 + 1.0;
    float _327 = _249 * _281;
    float _329 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _331 = _329 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _333 = _237 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _335 = isnan(_237);
    bool _337 = _333 || _335;
    bool _339 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _341 = _337 || _339;
    float _343 = float(_341);
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _347 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _345;
    float _349 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _351 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _349;
    float _353 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _355 = _353 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _357 = fma(_347, _283, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _359 = _343 * _325;
    float _361 = fma(_351, _283, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _363 = fma(_331, _327, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _365 = fma(_355, _327, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _367 = -_343;
    float _369 = _367 + 1.0;
    float _371 = _357 * _359;
    float _373 = _361 * _359;
    float _375 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _377 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _375;
    float _379 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].x, _371);
    float _381 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _383 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _381;
    float _385 = fma(_369, (*spvDescriptorSet0.vp_c9)._m0[143].y, _373);
    float _387 = fma(_377, _315, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _389 = fma(_363, _321, _379);
    float _391 = fma(_383, _315, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _393 = fma(_365, _321, _385);
    float _395 = fma(_387, _313, _389);
    float _397 = fma(_391, _313, _393);
    float _399 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[146].x, _395);
    float _401 = fma(_273, (*spvDescriptorSet0.vp_c9)._m0[146].y, _397);
    bool _403 = !_275;
    float _421;
    if (!_403)
    {
        float _405 = in.m_62.x;
        float _407 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _409 = _405 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _411 = fma(_409, (*spvDescriptorSet0.vp_c9)._m0[11].y, _139);
        float _413 = _411 * _407;
        float _415 = floor(_413);
        float _417 = -_415;
        float _419 = _413 + _417;
        _421 = _419;
        _423 = true;
    }
    else
    {
        _421 = _151;
    }
    _423 = false;
    float _425 = _421;
    float _427 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _429 = _425 + _427;
    float _431 = in.m_64.x;
    float _433 = in.m_64.y;
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _439 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _441 = isnan(_425);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _453 = _451 + (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _455 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _457 = isnan(_425);
    bool _459 = _455 || _457;
    bool _461 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _463 = _459 || _461;
    float _465 = float(_463);
    float _467 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _469 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _467;
    bool _471 = _425 >= (*spvDescriptorSet0.vp_c9)._m0[117].w;
    bool _473 = isnan(_425);
    bool _475 = _471 || _473;
    bool _477 = isnan((*spvDescriptorSet0.vp_c9)._m0[117].w);
    bool _479 = _475 || _477;
    float _481 = float(_479);
    float _483 = 1.0 / _437;
    float _485 = -_449;
    float _487 = _485 + 1.0;
    bool _489 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _491 = _465 * _487;
    float _493 = -_465;
    float _495 = _493 + 1.0;
    float _497 = 1.0 / _453;
    float _499 = _469 * _483;
    float _501 = -(*spvDescriptorSet0.vp_c9)._m0[116].x;
    float _503 = _501 + (*spvDescriptorSet0.vp_c9)._m0[117].x;
    float _505 = _401 * _433;
    float _507 = _399 * _431;
    float _509 = fma(_499, _429, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _511 = -_481;
    float _513 = _511 + 1.0;
    float _515 = _509 * _491;
    float _517 = _503 * _497;
    float _519 = -(*spvDescriptorSet0.vp_c9)._m0[116].w;
    float _521 = _425 + _519;
    float _523 = _449 * _513;
    float _525 = fma(_495, (*spvDescriptorSet0.vp_c9)._m0[115].x, _515);
    float _527 = fma(_517, _521, (*spvDescriptorSet0.vp_c9)._m0[116].x);
    float _529 = fma(_527, _523, _525);
    float _531 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _533 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _535 = fma(_481, (*spvDescriptorSet0.vp_c9)._m0[117].x, _529);
    float _537 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _539 = _531 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _541 = _533 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _543 = _535 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _545 = _537 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_66.x = _539;
    out.m_66.y = _541;
    out.m_66.z = _545;
    out.m_66.w = _543;
    bool _547 = !_489;
    float _565;
    if (!_547)
    {
        float _549 = in.m_62.x;
        float _551 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _553 = _549 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _555 = fma(_553, (*spvDescriptorSet0.vp_c9)._m0[11].w, _139);
        float _557 = _555 * _551;
        float _559 = floor(_557);
        float _561 = -_559;
        float _563 = _557 + _561;
        _565 = _563;
        _567 = true;
    }
    else
    {
        _565 = _151;
    }
    _567 = false;
    float _569 = _565;
    float _571 = in.m_62.x;
    float _573 = in.m_62.y;
    float _575 = in.m_62.z;
    float _577 = in.m_62.w;
    float _579 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _581 = in.m_48.x;
    float _583 = in.m_48.y;
    float _585 = in.m_48.z;
    int _587 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _589 = _587 != 0;
    float _591 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _593 = _569 + _591;
    int _595 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _597 = _595 != 0;
    float _599 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _601 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _603 = _601 != 0;
    float _605 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _607 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _609 = _607 != 0;
    float _611 = _579 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _613 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _615 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _617 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    bool _619 = _577 > 0.5;
    float _621 = _571 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _623 = _573 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _625 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _627 = _625 != 0;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _631 = _629 != 0;
    float _633 = _583 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _635 = -_205;
    int _637 = _619 ? as_type<int>(_635) : as_type<int>(_205);
    float _639 = -_599;
    float _641 = fma(_621, 2.0, _639);
    bool _643 = _571 > 0.5;
    float _645 = _575 * 2.0;
    float _647 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _649 = _647 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _651 = fma(_581, (*spvDescriptorSet0.vp_c10)._m0[5].x, _633);
    float _653 = -_195;
    int _655 = _643 ? as_type<int>(_653) : as_type<int>(_195);
    float _657 = _573 * 2.0;
    int _659 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _661 = _659 != 0;
    float _663 = floor(_645);
    float _665 = _583 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _667 = _583 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _669 = !_589;
    float _671 = _669 ? _195 : as_type<float>(_655);
    float _673 = fma(_623, -2.0, _613);
    bool _675 = _573 > 0.5;
    float _677 = fma(_581, (*spvDescriptorSet0.vp_c10)._m0[4].x, _665);
    float _679 = fma(_581, (*spvDescriptorSet0.vp_c10)._m0[6].x, _667);
    float _681 = 1.0 / _649;
    float _683 = _571 * 2.0;
    float _685 = -_205;
    int _687 = _675 ? as_type<int>(_685) : as_type<int>(_205);
    float _689 = -_139;
    float _691 = fma(_689, (*spvDescriptorSet0.vp_c9)._m0[76].x, _641);
    float _693 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[4].z, _677);
    bool _695 = !_597;
    float _697 = _695 ? _205 : as_type<float>(_687);
    float _699 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[5].z, _651);
    float _701 = floor(_657);
    bool _703 = _575 > 0.5;
    float _705 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _707 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _705;
    float _709 = -_195;
    int _711 = _675 ? as_type<int>(_709) : as_type<int>(_195);
    float _713 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _715 = -_195;
    int _717 = _703 ? as_type<int>(_715) : as_type<int>(_195);
    float _719 = _605 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _721 = _663 >= 0.0;
    bool _723 = isnan(_663);
    bool _725 = _721 || _723;
    bool _727 = isnan(0.0);
    bool _729 = _725 || _727;
    float _731 = floor(_683);
    float _733 = _707 * _681;
    float _735 = _573 + _575;
    bool _737 = !_609;
    float _739 = _737 ? _195 : as_type<float>(_717);
    float _741 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[76].y, _673);
    int _743 = _729 ? 0 : 1;
    float _745 = _735 + (-1.0);
    float _747 = -_205;
    int _749 = _703 ? as_type<int>(_747) : as_type<int>(_205);
    float _751 = _699 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _753 = _701 > 0.0;
    float _755 = fma(_745, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    bool _757 = _701 >= 0.0;
    bool _759 = isnan(_701);
    bool _761 = _757 || _759;
    bool _763 = isnan(0.0);
    bool _765 = _761 || _763;
    float _767 = _573 + _571;
    float _769 = _701;
    float _771 = _585;
    float _773 = _593;
    if (!_661)
    {
        _769 = _575;
    }
    float _775 = _769;
    float _777 = _693 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _779 = _775;
    if (_661)
    {
        _779 = _573;
    }
    float _781 = _779;
    float _783 = _767 + (-1.0);
    bool _785 = !_627;
    float _787 = _785 ? _195 : as_type<float>(_711);
    float _789 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _791 = log2(_789);
    bool _793 = _731 > 0.0;
    float _795 = fma(_781, (*spvDescriptorSet0.vp_c9)._m0[83].w, _615);
    bool _797 = _731 >= 0.0;
    bool _799 = isnan(_731);
    bool _801 = _797 || _799;
    bool _803 = isnan(0.0);
    bool _805 = _801 || _803;
    float _807 = _671 + 0.5;
    bool _809 = !_631;
    float _811 = _809 ? _205 : as_type<float>(_749);
    float _813 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].w, _795);
    float _815 = fma(_611, _807, _691);
    bool _817 = _663 > 0.0;
    float _819 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _821 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _823 = isnan(_569);
    bool _825 = _821 || _823;
    bool _827 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _829 = _825 || _827;
    float _831 = float(_829);
    float _833 = fma(_783, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _835 = fma(_585, (*spvDescriptorSet0.vp_c10)._m0[6].z, _679);
    if (!_661)
    {
        _771 = _573;
    }
    float _837 = _771;
    float _839 = fma(_733, _593, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _841 = _569 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _843 = isnan(_569);
    bool _845 = _841 || _843;
    bool _847 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _849 = _845 || _847;
    float _851 = float(_849);
    float _853 = -_831;
    float _855 = _853 + 1.0;
    float _857 = _837;
    if (_661)
    {
        _857 = _571;
    }
    float _859 = _857;
    float _861 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    float _863 = _851 * _855;
    int _865 = ~_743;
    int _867 = _865 + 1;
    int _869 = _867 + 1;
    float _871 = _859 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    int _873 = _869;
    if (!_661)
    {
        _773 = _575;
    }
    float _875 = _773;
    float _877 = _839 * _863;
    float _879 = _875;
    if (!_817)
    {
        int _881 = ~_743;
        int _883 = _881 + 1;
        _873 = _883;
    }
    int _885 = _873;
    float _887 = -_713;
    float _889 = fma(_871, 2.0, _887);
    if (_661)
    {
        _879 = _573;
    }
    float _891 = _879;
    float _893 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    int _895 = _805 ? 0 : 1;
    float _897 = _697 + (-0.5);
    int _899 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _901 = _899 != 0;
    int _903 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _905 = _903 != 0;
    int _907 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _909 = _907 != 0;
    float _911 = -_811;
    float _913 = _911 + 0.5;
    float _915 = -_851;
    float _917 = _915 + 1.0;
    float _919 = _913 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    bool _921 = !_603;
    float _923 = _921 ? _205 : as_type<float>(_637);
    float _925 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _927 = _819 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    float _929 = -_139;
    float _931 = fma(_929, (*spvDescriptorSet0.vp_c9)._m0[81].x, _889);
    float _933 = fma(_917, (*spvDescriptorSet0.vp_c9)._m0[131].x, _877);
    float _935 = fma(_859, (*spvDescriptorSet0.vp_c9)._m0[83].z, _925);
    float _937 = -_719;
    float _939 = -_741;
    float _941 = fma(_937, _897, _939);
    float _943 = _787 + 0.5;
    float _945 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _947 = _891 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _949 = _739 + 0.5;
    float _951 = _943 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _953 = _919 * _893;
    float _955 = fma(_947, -2.0, _945);
    float _957 = _923 + (-0.5);
    float _959 = _951 * _617;
    float _961 = _861 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _963 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[81].y, _955);
    float _965 = fma(_927, _949, _931);
    float _967 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _969 = _751 + _967;
    float _971 = -_961;
    float _973 = -_963;
    float _975 = fma(_971, _957, _973);
    out.m_68.x = _959;
    out.m_68.y = _953;
    bool _977 = !_901;
    int _979 = _977 ? 0 : 1;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _983 = _777 + _981;
    float _985 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _987 = _835 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _989 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[82].z, _935);
    int _991 = _765 ? 0 : 1;
    float _993 = fma(_571, (*spvDescriptorSet0.vp_c9)._m0[78].z, _985);
    int _995 = abs(_979);
    float _997 = -_989;
    float _999 = _997 + 1.0;
    float _1001 = _969 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1003 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _1005 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1007 = _987 + _1005;
    int _1009 = ~_991;
    int _1011 = _1009 + 1;
    int _1013 = _1011 + 1;
    float _1015 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1001);
    float _1017 = fma(_573, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1003);
    int _1019 = _1013;
    if (!_753)
    {
        int _1021 = ~_991;
        int _1023 = _1021 + 1;
        _1019 = _1023;
    }
    int _1025 = _1019;
    float _1027 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].z, _993);
    float _1029 = fma(_1007, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1015);
    float _1031 = fma(_139, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1017);
    float _1033 = -_999;
    float _1035 = fma(_739, _1033, _965);
    float _1037 = _969 * _969;
    float _1039 = -_1027;
    float _1041 = _1039 + 1.0;
    float _1043 = -_1031;
    float _1045 = _1043 + 1.0;
    bool _1047 = _1029 >= 0.0;
    float _1049 = fma(_983, _983, _1037);
    float _1051 = float(_885);
    float _1053 = -_1041;
    float _1055 = fma(_671, _1053, _815);
    float _1057 = float(_995);
    float _1059 = _791 * _139;
    float _1061 = fma(_697, _1045, _941);
    float _1063 = in.m_70.x;
    float _1065 = in.m_70.y;
    float _1067 = in.m_70.z;
    float _1069 = fma(_1007, _1007, _1049);
    int _1071 = ~_895;
    int _1073 = _1071 + 1;
    int _1075 = _1073 + 1;
    float _1077 = _1057 * _1051;
    int _1079 = _1075;
    if (!_793)
    {
        int _1081 = ~_895;
        int _1083 = _1081 + 1;
        _1079 = _1083;
    }
    int _1085 = _1079;
    float _1087 = -_813;
    float _1089 = _1087 + 1.0;
    bool _1091 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1093 = isnan(1.0);
    bool _1095 = _1091 || _1093;
    bool _1097 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1099 = _1095 || _1097;
    float _1101 = exp2(_1059);
    bool _1103 = !_905;
    int _1105 = _1103 ? 0 : 1;
    float _1107 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1109 = 1.0 + _1107;
    float _1111 = fma(_831, (*spvDescriptorSet0.vp_c9)._m0[132].x, _933);
    float _1113 = fma(_923, _1089, _975);
    if (_1047)
    {
        out.m_51.x = 0.0;
    }
    float _1115 = rsqrt(_1069);
    float _1117 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    int _1119 = abs(_1105);
    float _1121 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    bool _1123 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1125 = isnan(0.0);
    bool _1127 = _1123 || _1125;
    bool _1129 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1131 = _1127 || _1129;
    float _1133 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1135 = _1117 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1137 = 1.0 / _1109;
    float _1139 = _1121 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1141 = _1133 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1143 = -_1101;
    float _1145 = _1143 + 1.0;
    out.m_72.x = _1055;
    out.m_72.y = _1061;
    out.m_72.z = _1035;
    out.m_72.w = _1113;
    float _1147 = _1131 ? _1145 : 0.0;
    float _1149 = _1111 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1151 = float(_1085);
    float _1153 = float(_1119);
    float _1155 = _1077 * (-2.0);
    out.m_74.x = _1135;
    out.m_74.y = _1139;
    out.m_74.z = _1141;
    out.m_74.w = _1149;
    float _1157 = _1151;
    if (_1099)
    {
        float _1159 = _1147 * _1137;
        _161 = _1159;
    }
    float _1161 = _161;
    float _1163 = _1153 * _1151;
    if (_1047)
    {
        _1157 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1165 = _1157;
    float _1167 = fma(_833, _1155, _833);
    float _1169 = fma(_1155, _1063, _1063);
    float _1171 = _1163 * (-2.0);
    float _1173 = _571 + (-0.5);
    int _1175 = as_type<int>(_1165);
    if (_1047)
    {
        float _1177 = _1165 * 5.0;
        _1175 = as_type<int>(_1177);
    }
    int _1179 = _1175;
    float _1181 = fma(_755, _1171, _755);
    float _1183 = fma(_1173, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1169);
    float _1185 = fma(_1171, _1065, _1065);
    float _1187 = _969 * _1115;
    float _1189 = _983 * _1115;
    float _1191 = _1187;
    float _1193 = _1189;
    if (_1047)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4719 = as_type<float>(_1179);
        out.gl_Position.z = _4719;
    }
    bool _1195 = !_909;
    int _1197 = _1195 ? 0 : 1;
    float _1199 = -_1187;
    float _1201 = fma(_1199, (*spvDescriptorSet0.vp_c9)._m0[18].w, _969);
    float _1203 = -_1189;
    float _1205 = fma(_1203, (*spvDescriptorSet0.vp_c9)._m0[18].w, _983);
    float _1207 = _1201 * _1201;
    if (_1047)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1209 = -_1187;
    float _1211 = fma(_1209, (*spvDescriptorSet0.vp_c9)._m0[18].w, _751);
    float _1213 = _1007 * _1115;
    float _1215 = -_1189;
    float _1217 = fma(_1215, (*spvDescriptorSet0.vp_c9)._m0[18].w, _777);
    float _1219 = fma(_1167, _1161, _1183);
    float _1221 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1223 = _1211 + _1221;
    float _1225 = -_1213;
    float _1227 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[18].w, _987);
    float _1229 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1231 = _1217 + _1229;
    int _1233 = abs(_1197);
    float _1235 = _1223 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1237 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1239 = _1227 + _1237;
    float _1241 = _573 + (-0.5);
    float _1243 = float(_1025);
    float _1245 = fma(_1231, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1235);
    float _1247 = _1219 * 0.15915493667125701904296875;
    float _1249 = float(_1233);
    float _1251 = fma(_1241, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1185);
    float _1253 = fma(_1239, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1245);
    float _1255 = fma(_1205, _1205, _1207);
    float _1257 = -_1213;
    float _1259 = fma(_1257, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1007);
    float _1261 = _575 + _571;
    float _1263 = _1249 * _1243;
    bool _1265 = _1253 >= 0.0;
    float _1267 = fma(_1181, _1161, _1251);
    float _1269 = fma(_1259, _1259, _1255);
    float _1271 = _1261 + (-1.0);
    float _1273 = _1263 * (-2.0);
    float _1275 = _1267 * 0.15915493667125701904296875;
    float _1277 = _575 + (-0.5);
    float _1279 = fma(_1271, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1281 = fma(_1273, _1067, _1067);
    float _1283 = sqrt(_1269);
    float _1285 = fma(_1279, _1273, _1279);
    float _1287 = _1263;
    int _1289 = as_type<int>(_1277);
    float _1291 = _1217;
    if (_1265)
    {
        _1287 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1293 = _1287;
    float _1295 = fma(_1277, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1281);
    if (_1265)
    {
        out.m_51.x = 0.0;
    }
    float _1297 = _1247 * 6.283185482025146484375;
    float _1299 = sin(_1297);
    if (_1265)
    {
        float _1301 = _1293 * 5.0;
        _1289 = as_type<int>(_1301);
    }
    int _1303 = _1289;
    float _1305 = fma(_1285, _1161, _1295);
    if (_1265)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4915 = as_type<float>(_1303);
        out.gl_Position.z = _4915;
    }
    float _1307 = _1305 * 0.15915493667125701904296875;
    float _1309 = _1247 * 6.283185482025146484375;
    float _1311 = cos(_1309);
    float _1313 = _1275 * 6.283185482025146484375;
    float _1315 = sin(_1313);
    float _1317 = _1275 * 6.283185482025146484375;
    float _1319 = cos(_1317);
    if (_1265)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1321 = _505 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1323 = _1115 * _1283;
    float _1325 = _1307 * 6.283185482025146484375;
    float _1327 = cos(_1325);
    float _1329 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _205);
    float _1331 = _1299 * _1315;
    float _1333 = _1323 * _1321;
    float _1335 = _1311 * _1319;
    float _1337 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _195);
    float _1339 = _1299 * _1319;
    float _1341 = _1329 * _1333;
    float _1343 = _1307 * 6.283185482025146484375;
    float _1345 = sin(_1343);
    float _1347 = _507 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1349 = _1311 * _1315;
    float _1351 = _205 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1353 = _1323 * _1347;
    float _1355 = _1311 * _1327;
    float _1357 = _1319 * _1327;
    float _1359 = _1299 * _1327;
    float _1361 = _1315 * _1327;
    float _1363 = _1337 * _1353;
    float _1365 = _1355 * _1341;
    float _1367 = _1323 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1369 = _1367 * 0.5;
    float _1371 = fma(_1345, _1335, _1331);
    float _1373 = -_1339;
    float _1375 = fma(_1345, _1349, _1373);
    float _1377 = -_1341;
    float _1379 = _1345 * _1377;
    float _1381 = -_1349;
    float _1383 = fma(_1345, _1339, _1381);
    float _1385 = fma(_1371, _1363, _1365);
    float _1387 = _1359 * _1341;
    float _1389 = fma(_1357, _1363, _1379);
    float _1391 = fma(_1345, _1331, _1335);
    float _1393 = fma(_1375, _1369, _1385);
    float _1395 = fma(_1383, _1363, _1387);
    float _1397 = fma(_1361, _1369, _1389);
    float _1399 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1401 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1403 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1405 = fma(_1391, _1369, _1395);
    float _1407 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1409 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1401);
    float _1411 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1403);
    float _1413 = _1371 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1415 = _1393 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1417 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1409);
    float _1419 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1411);
    float _1421 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1399);
    float _1423 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1407);
    float _1425 = _1417 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1427 = _1419 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1429 = fma(_1357, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1413);
    float _1431 = _1355 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1433 = _777 + _1425;
    float _1435 = _987 + _1427;
    float _1437 = _1355 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1439 = _1355 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1441 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1443 = _1433 + _1441;
    float _1445 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1447 = _1435 + _1445;
    float _1449 = fma(_1397, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1415);
    float _1451 = fma(_1351, _1351, 1.0);
    float _1453 = _1443 * _1443;
    float _1455 = _1447 * _1447;
    float _1457 = -_1345;
    float _1459 = fma(_1457, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1431);
    float _1461 = -_1345;
    float _1463 = fma(_1461, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1437);
    float _1465 = -_1345;
    float _1467 = fma(_1465, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1439);
    float _1469 = _1453 + _1455;
    float _1471 = fma(_1405, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1449);
    float _1473 = rsqrt(_1451);
    float _1475 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1477 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1479 = _1471 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1481 = _1375 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1483 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1475);
    float _1485 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1477);
    float _1487 = _751 + _1479;
    float _1489 = sqrt(_1469);
    float _1491 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1481);
    bool _1493 = _1489 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1495 = _1481;
    float _1497 = _1433;
    float _1499 = _1453;
    float _1501 = _1455;
    float _1503 = _1435;
    if (!_1493)
    {
        _1495 = _1433;
    }
    float _1505 = _1495;
    float _1507 = _1505;
    if (!_1493)
    {
        _1497 = _1487;
    }
    float _1509 = _1497;
    bool _1511 = !_1493;
    float _1513 = _1509;
    if (!_1511)
    {
        float _1515 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1517 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1519 = _1489 + _1517;
        float _1521 = rsqrt(_1469);
        float _1523 = _1519 * _1515;
        float _1525 = _1487 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1527 = _1523 * 0.15915493667125701904296875;
        float _1529 = _1527 * 6.283185482025146484375;
        float _1531 = sin(_1529);
        float _1533 = _1527 * 6.283185482025146484375;
        float _1535 = cos(_1533);
        float _1537 = fma(_1531, _1525, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1539 = _1521 * _1537;
        float _1541 = _1535 + (-1.0);
        float _1543 = fma(_1443, _1539, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1545 = fma(_1447, _1539, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1547 = _1541 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1549 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1551 = _1543 + _1549;
        float _1553 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1555 = _1545 + _1553;
        float _1557 = fma(_1487, _1535, _1547);
        float _1559 = _1551 * _1551;
        float _1561 = _1555 * _1555;
        _1513 = _1557;
        _1499 = _1559;
        _1501 = _1561;
        _1507 = _1543;
        _1503 = _1545;
    }
    float _1563 = _1513;
    float _1565 = _1499;
    float _1567 = _1501;
    float _1569 = _1507;
    float _1571 = _1503;
    float _1573 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1575 = _1563 + _1573;
    float _1577 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1467);
    float _1579 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1459);
    float _1581 = fma(_1359, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1463);
    float _1583 = fma(_1575, _1575, _1565);
    float _1585 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1483);
    float _1587 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1485);
    float _1589 = fma(_1391, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1491);
    float _1591 = _1583 + _1567;
    float _1593 = _1351 * _1473;
    float _1595 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1421);
    float _1597 = _195 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1599 = _1351 * _1579;
    float _1601 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1423);
    float _1603 = _1351 * _1581;
    float _1605 = fma(_1383, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1429);
    float _1607 = _1351 * _1577;
    float _1609 = -_1585;
    float _1611 = _1593 * _1609;
    float _1613 = -_1587;
    float _1615 = _1593 * _1613;
    float _1617 = -_1589;
    float _1619 = _1593 * _1617;
    float _1621 = fma(_1597, _1595, _1599);
    float _1623 = sqrt(_1591);
    float _1625 = fma(_1597, _1601, _1603);
    float _1627 = fma(_1597, _1605, _1607);
    float _1629 = fma(_1473, _1579, _1611);
    float _1631 = fma(_1473, _1581, _1615);
    float _1633 = _1587 + _1625;
    float _1635 = fma(_1473, _1577, _1619);
    float _1637 = _1585 + _1621;
    float _1639 = _1589 + _1627;
    out.m_76.x = _1595;
    out.m_76.y = _1601;
    out.m_76.z = _1605;
    out.m_78.x = _1629;
    out.m_78.y = _1631;
    out.m_78.z = _1635;
    bool _1641 = _1623 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1643 = isnan(_1623);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1649 = _1645 || _1647;
    out.m_80.x = _1637;
    out.m_80.y = _1633;
    out.m_80.z = _1639;
    float _1651 = _1627;
    if (!_1649)
    {
        _1651 = 1.0;
    }
    float _1653 = _1651;
    bool _1655 = !_1649;
    float _1657 = _1653;
    if (!_1655)
    {
        bool _1659 = _1623 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1661 = isnan(_1623);
        bool _1663 = _1659 || _1661;
        bool _1665 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1667 = _1663 || _1665;
        if (!_1667)
        {
            float _1669 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1671 = _1623 + _1669;
            float _1673 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1675 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1673;
            float _1677 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1679 = _1677 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1681 = 1.0 / _1675;
            float _1683 = _1671 * _1681;
            float _1685 = fma(_1683, _1679, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1657 = _1685;
            _1687 = true;
        }
        else
        {
            bool _1689 = _1623 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1691 = isnan(_1623);
            bool _1693 = _1689 || _1691;
            bool _1695 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1697 = _1693 || _1695;
            if (!_1697)
            {
                float _1699 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1701 = _1623 + _1699;
                float _1703 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1705 = _1703 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1707 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1709 = _1707 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1711 = 1.0 / _1705;
                float _1713 = _1701 * _1711;
                float _1715 = fma(_1713, _1709, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1657 = _1715;
                _1687 = true;
            }
            else
            {
                _1657 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1687 = false;
    float _1717 = _1657;
    float _1719 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1721 = _1563 + _1719;
    float _1723 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1725 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1727 = _1569 + _1725;
    float _1729 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1731 = _1571 + _1729;
    float _1733 = fma(_1721, _1717, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1735 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1723);
    float _1737 = fma(_1727, _1717, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1739 = fma(_1731, _1717, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1741 = -_751;
    float _1743 = _1741 + _1733;
    float _1745 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1735);
    float _1747 = -_777;
    float _1749 = _1747 + _1737;
    float _1751 = _1211 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1753 = _1743 * _1743;
    float _1755 = _1745 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1757 = -_987;
    float _1759 = _1757 + _1739;
    float _1761 = fma(_1217, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1751);
    float _1763 = fma(_1749, _1749, _1753);
    float _1765 = 1.0 / _1755;
    float _1767 = fma(_1227, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1761);
    float _1769 = fma(_1759, _1759, _1763);
    float _1771 = _1767 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1773 = sqrt(_1769);
    float _1775 = _1771 + _1755;
    float _1777 = _1775 * _1765;
    float _1779 = _1777 * 0.5;
    float _1781 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1783 = fma(_1779, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1781);
    bool _1785 = _1773 > 0.0;
    float _1787 = 1.0 / _1783;
    bool _1789 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1791 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1793 = _1789 || _1791;
    bool _1795 = isnan(0.5);
    bool _1797 = _1793 || _1795;
    bool _1799 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1801 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1803 = _1799 || _1801;
    bool _1805 = isnan(0.5);
    bool _1807 = _1803 || _1805;
    float _1809 = _1755;
    float _1811 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1813 = _1739;
    float _1815 = _1765;
    if (!_1785)
    {
        _1809 = _1737;
    }
    float _1817 = _1809;
    float _1819 = _1817;
    if (!_1785)
    {
        _1811 = _1733;
    }
    float _1821 = _1811;
    bool _1823 = !_1785;
    float _1825 = _1821;
    if (!_1823)
    {
        float _1827 = _209 * _209;
        float _1829 = rsqrt(_1769);
        float _1831 = fma(_207, _207, _1827);
        float _1833 = fma(_211, _211, _1831);
        float _1835 = sqrt(_1833);
        float _1837 = _1749 * _1829;
        float _1839 = _1743 * _1829;
        float _1841 = _1759 * _1829;
        bool _1843 = _1835 > 0.0;
        float _1845 = _1831;
        float _1847 = _1835;
        _1815 = _1839;
        if (!_1843)
        {
            _1845 = _1737;
        }
        float _1849 = _1845;
        _1819 = _1849;
        if (!_1843)
        {
            _1847 = _1733;
        }
        float _1851 = _1847;
        bool _1853 = !_1843;
        _1825 = _1851;
        if (!_1853)
        {
            float _1855 = rsqrt(_1833);
            float _1857 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1859 = _209 * _1855;
            float _1861 = _207 * _1855;
            float _1863 = _211 * _1855;
            float _1865 = _1839 * _1859;
            float _1867 = fma(_1837, _1861, _1865);
            float _1869 = _1857 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1871 = fma(_1841, _1863, _1867);
            float _1873 = _1871 * _1869;
            float _1875 = fma(_207, _1873, _1737);
            float _1877 = fma(_209, _1873, _1733);
            float _1879 = fma(_211, _1873, _1739);
            _1819 = _1875;
            _1825 = _1877;
            _1813 = _1879;
            _1815 = _1869;
        }
    }
    float _1881 = _1819;
    float _1883 = _1825;
    float _1885 = _1813;
    float _1887 = _1815;
    float _1889 = -_1189;
    float _1891 = fma(_1889, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1881);
    float _1893 = -_1187;
    float _1895 = fma(_1893, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1883);
    float _1897 = -_1213;
    float _1899 = fma(_1897, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1885);
    float _1901 = _1895;
    float _1903 = _1891;
    float _1905 = _1899;
    float _1907 = _1887;
    if (_1797)
    {
        _215 = 1.0;
    }
    float _1909 = _215;
    float _1911 = _1909;
    if (!_1807)
    {
        float _1913 = _1223 * _1223;
        float _1915 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1917 = -_987;
        float _1919 = _1917 + _1885;
        float _1921 = -_751;
        float _1923 = _1921 + _1883;
        float _1925 = fma(_1231, _1231, _1913);
        float _1927 = fma(_1239, _1239, _1925);
        float _1929 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1931 = sqrt(_1927);
        float _1933 = 1.0 / _1323;
        float _1935 = _1929 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1937 = precise::min(_1931, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1939 = _1937 * _1915;
        float _1941 = _1939 * _1933;
        float _1943 = -_777;
        float _1945 = _1943 + _1881;
        float _1947 = _1935 * _1941;
        float _1949 = _1919 * _1941;
        float _1951 = fma(_1923, _1947, _1211);
        float _1953 = fma(_1945, _1947, _1217);
        float _1955 = fma(_1935, _1949, _1227);
        _1191 = _1941;
        _1901 = _1951;
        _1903 = _1953;
        _1905 = _1955;
        _1193 = _1935;
    }
    float _1957 = _1191;
    float _1959 = _1901;
    float _1961 = _1903;
    float _1963 = _1905;
    float _1965 = _1193;
    float _1967 = _1957;
    float _1969 = _1965;
    if (_1797)
    {
        _1967 = 1.0;
    }
    float _1971 = _1967;
    float _1973 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1975 = _1787 * _1973;
    float _1977 = _1971;
    if (!_1797)
    {
        float _1979 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1981 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1983 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1981;
        float _1985 = _1979 * 0.15915493667125701904296875;
        float _1987 = _1985 * 6.283185482025146484375;
        float _1989 = cos(_1987);
        float _1991 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1993 = _1991 * 0.15915493667125701904296875;
        float _1995 = _1985 * 6.283185482025146484375;
        float _1997 = sin(_1995);
        float _1999 = 1.0 / _1989;
        float _2001 = _1993 * 6.283185482025146484375;
        float _2003 = cos(_2001);
        float _2005 = _1997 * _1999;
        float _2007 = _1993 * 6.283185482025146484375;
        float _2009 = sin(_2007);
        float _2011 = _2003 * _2005;
        float _2013 = 1.0 / _1983;
        float _2015 = 1.0 / _2011;
        float _2017 = _2009 * _2015;
        float _2019 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _2021 = fma(_1975, _2017, _2019);
        float _2023 = _2021 * _2013;
        float _2025 = precise::clamp(_2023, 0.0, 1.0);
        _1969 = _1985;
        _1911 = _2025;
    }
    float _2027 = _1969;
    float _2029 = _1911;
    float _2031 = _2027;
    if (!_1797)
    {
        float _2033 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _2035 = _2033 * 0.15915493667125701904296875;
        float _2037 = _2035 * 6.283185482025146484375;
        float _2039 = cos(_2037);
        float _2041 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _2043 = _2041 * 0.15915493667125701904296875;
        float _2045 = _2035 * 6.283185482025146484375;
        float _2047 = sin(_2045);
        float _2049 = 1.0 / _2039;
        float _2051 = _2043 * 6.283185482025146484375;
        float _2053 = cos(_2051);
        float _2055 = _2047 * _2049;
        float _2057 = _2043 * 6.283185482025146484375;
        float _2059 = sin(_2057);
        float _2061 = _2053 * _2055;
        float _2063 = 1.0 / _2061;
        float _2065 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2067 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _2065;
        float _2069 = 1.0 / _2067;
        float _2071 = _2059 * _2063;
        float _2073 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2075 = fma(_1975, _2071, _2073);
        float _2077 = _2075 * _2069;
        float _2079 = precise::clamp(_2077, 0.0, 1.0);
        float _2081 = -_2079;
        float _2083 = _2081 + 1.0;
        _1977 = _2083;
    }
    float _2085 = _1977;
    float _2087 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2089 = _1959 + _2087;
    float _2091 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2093 = _1961 + _2091;
    float _2095 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2097 = _1963 + _2095;
    float _2099 = _2089 * _2089;
    float _2101 = fma(_2093, _2093, _2099);
    float _2103 = fma(_2097, _2097, _2101);
    float _2105 = rsqrt(_2103);
    float _2107 = _2105 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2109 = _2093 * _2107;
    float _2111 = _2097 * _2107;
    float _2113 = _2109 * _2109;
    float _2115 = _2111 * _2111;
    float _2117 = _2113 + _2115;
    float _2119 = sqrt(_2117);
    bool _2121 = _2119 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2123 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2125 = _2119 + _2123;
    float _2127 = _2105;
    float _2129 = _2117;
    float _2131 = _2125;
    float _2133 = _2107;
    float _2135 = _2109;
    if (_2121)
    {
        float _2137 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2127 = _2137;
    }
    float _2139 = _2127;
    if (_2121)
    {
        float _2141 = rsqrt(_2117);
        _2129 = _2141;
    }
    float _2143 = _2129;
    float _2145 = _2143;
    if (_2121)
    {
        float _2147 = _2125 * _2139;
        _2131 = _2147;
    }
    float _2149 = _2131;
    if (_2121)
    {
        float _2151 = _2149 * 0.15915493667125701904296875;
        _2031 = _2151;
    }
    float _2153 = _2031;
    float _2155 = _2139;
    float _2157 = _2153;
    if (_2121)
    {
        float _2159 = _2153 * 6.283185482025146484375;
        float _2161 = sin(_2159);
        _2155 = _2161;
    }
    float _2163 = _2155;
    float _2165 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2167 = precise::max(0.0, _2165);
    float _2169 = _2097;
    float _2171 = _2167;
    if (_2121)
    {
        float _2173 = _2153 * 6.283185482025146484375;
        float _2175 = cos(_2173);
        _2169 = _2175;
    }
    float _2177 = _2169;
    float _2179 = -_2107;
    float _2181 = -_2167;
    float _2183 = fma(_2089, _2179, _2181);
    if (_2121)
    {
        float _2185 = _2183 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2171 = _2185;
    }
    float _2187 = _2171;
    if (!_2121)
    {
        _2157 = _2183;
    }
    float _2189 = _2157;
    float _2191 = fma(_1217, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2193 = _2189;
    if (!_2121)
    {
        _1291 = _2115;
    }
    float _2195 = _1291;
    float _2197 = _2163;
    float _2199 = _2195;
    if (_2121)
    {
        float _2201 = fma(_2163, _2187, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2133 = _2201;
    }
    float _2203 = _2133;
    float _2205 = sqrt(_2103);
    float _2207 = _2203;
    if (_2121)
    {
        float _2209 = _2177 + (-1.0);
        _2197 = _2209;
    }
    float _2211 = _2197;
    float _2213 = _2211;
    if (_2121)
    {
        float _2215 = _2143 * _2203;
        _1907 = _2215;
    }
    float _2217 = _1907;
    if (!_2121)
    {
        _2145 = _2111;
    }
    float _2219 = _2145;
    float _2221 = _2219;
    if (_2121)
    {
        float _2223 = _2211 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2207 = _2223;
    }
    float _2225 = _2207;
    if (_2121)
    {
        float _2227 = _2109 * _2217;
        _2135 = _2227;
    }
    float _2229 = _2135;
    if (!_2121)
    {
        _2213 = _2113;
    }
    float _2231 = _2213;
    float _2233 = _2231;
    if (_2121)
    {
        float _2235 = _2111 * _2217;
        _2221 = _2235;
    }
    float _2237 = _2221;
    if (_2121)
    {
        float _2239 = fma(_2183, _2177, _2225);
        _2193 = _2239;
    }
    float _2241 = _2193;
    if (_2121)
    {
        float _2243 = _2229 * _2229;
        _2233 = _2243;
    }
    float _2245 = _2233;
    float _2247 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_2121)
    {
        float _2249 = _2237 * _2237;
        _2199 = _2249;
    }
    float _2251 = _2199;
    float _2253 = fma(_2241, _2241, _2245);
    float _2255 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2247);
    float _2257 = floor(_2191);
    float _2259 = _2253 + _2251;
    float _2261 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2255);
    float _2263 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2265 = fma(_2205, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2263);
    float _2267 = precise::clamp(_2265, 0.0, 1.0);
    float _2269 = fma(_1227, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2271 = _2261 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2273 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2275 = rsqrt(_2259);
    float _2277 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2279 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2281 = -_2267;
    float _2283 = _2281 + 1.0;
    float _2285 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2273);
    float _2287 = -_2279;
    float _2289 = fma(_2287, _2277, 1.0);
    float _2291 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2293 = floor(_2269);
    float _2295 = _1959 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2297 = -_2257;
    float _2299 = _2191 + _2297;
    float _2301 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2291);
    float _2303 = fma(_1961, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2295);
    float _2305 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2301);
    float _2307 = abs(_2283);
    float _2309 = log2(_2307);
    float _2311 = _2275 * _2229;
    float _2313 = _2275 * _2241;
    float _2315 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2303);
    float _2317 = _2275 * _2237;
    float _2319 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2321 = _2305 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2323 = _2315 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2325 = log2(_2289);
    float _2327 = -_2319;
    float _2329 = fma(_2313, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2327);
    float _2331 = -_2293;
    float _2333 = _2269 + _2331;
    float _2335 = _2323 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2337 = _2323 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2339 = -_2317;
    float _2341 = fma(_2339, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2329);
    float _2343 = fma(_1963, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2285);
    float _2345 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2335);
    float _2347 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2349 = fma(_2341, -0.5, 0.5);
    float _2351 = _2343 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2353 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2345);
    float _2355 = exp2(_2347);
    float _2357 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2353);
    float _2359 = _2325 * 0.693147182464599609375;
    float _2361 = 1.0 / _2357;
    float _2363 = fma(_2341, 0.5, 0.5);
    float _2365 = _2323 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float2 _6642 = float2(_2299, _2333);
    float _2367 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6642, float2(0.0), isnan(_6642)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6642, float2(0.0), isnan(_6642)), level(0.0)).x;
    float _2369 = _2359 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2371 = fma(_2363, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2373 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2337);
    float _2375 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2365);
    float _2377 = sqrt(_2349);
    float _2379 = _2313 + 1.0;
    float _2381 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2373);
    float _2383 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2375);
    float _2385 = fma(_2363, _2371, -0.212114393711090087890625);
    float _2387 = -_2313;
    float _2389 = fma(_2355, _2379, _2387);
    float _2391 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2381);
    float _2393 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2383);
    float _2395 = fma(_2363, _2385, 1.570728778839111328125);
    float _2397 = fma(_2389, 0.5, 0.5);
    float _2399 = _2391 * _2361;
    float _2401 = _2393 * _2361;
    float _2403 = fma(_2399, 0.5, 0.5);
    float _2405 = fma(_2401, -0.5, 0.5);
    float _2407 = _2377 * 0.636619746685028076171875;
    float _2409 = -_2395;
    float _2411 = fma(_2407, _2409, 1.0);
    float3 _6729 = float3(_2403, _2405, _2369);
    float _2413 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6729, float3(0.0), isnan(_6729)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6729, float3(0.0), isnan(_6729)), level(0.0)).x;
    float3 _6740 = float3(_2403, _2405, _2369);
    float4 _2416 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6740, float3(0.0), isnan(_6740)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6740, float3(0.0), isnan(_6740)), level(0.0)).xyzw;
    float _2418 = _2416.x;
    float _2420 = _2416.y;
    float _2422 = _2416.z;
    float _2424 = _2416.w;
    float2 _6756 = float2(_2411, _2397);
    float3 _2428 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6756, float2(0.0), isnan(_6756)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6756, float2(0.0), isnan(_6756)), level(0.0)).xyz;
    float _2430 = _2428.x;
    float _2432 = _2428.y;
    float _2434 = _2428.z;
    float _2436 = abs(_1975);
    float _2438 = log2(_2436);
    float _2440 = _2323 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    out.m_82.x = _1961;
    out.m_82.y = _1959;
    out.m_82.z = _1963;
    bool _2442 = _2205 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2444 = isnan(_2205);
    bool _2446 = _2442 || _2444;
    bool _2448 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2450 = _2446 || _2448;
    float _2452 = fma(_2321, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2440);
    float _2454 = _2309 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2456 = in.m_84.x;
    float _2458 = fma(_2271, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2452);
    bool _2460 = _1975 <= 8000.0;
    bool _2462 = isnan(_1975);
    bool _2464 = _2460 || _2462;
    bool _2466 = isnan(8000.0);
    bool _2468 = _2464 || _2466;
    float _2470 = float(_2468);
    float _2472 = _2357 * 0.5;
    float _2474 = exp2(_2454);
    float _2476 = fma(_2351, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2458);
    float _2478 = _2391 + _2357;
    float _2480 = _2438 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2482 = fma(_2393, -0.5, _2472);
    float _2484 = _2478 * 0.5;
    out.gl_Position.x = _2391;
    out.gl_Position.y = _2393;
    out.gl_Position.z = _2476;
    out.gl_Position.w = _2357;
    float _2486 = exp2(_2480);
    float _2488 = -_2474;
    float _2490 = _2488 + 1.0;
    float _2492 = _2490 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2494 = _2393;
    float _2496 = _2476;
    float _2498 = _2357;
    if (!_2450)
    {
        _2494 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2500 = _2494;
    float _2502 = -_2492;
    float _2504 = _2502 + 1.0;
    float _2506 = fma(_2486, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2508 = precise::clamp(_2506, 0.0, 1.0);
    float _2510 = _2476 + _2357;
    float _2512 = _2500;
    float _2514 = _2500;
    if (!_2450)
    {
        _2496 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2516 = _2496;
    float _2518 = fma(_2508, -2.0, 3.0);
    float _2520 = _2508 * _2508;
    float _2522 = _2510 * 0.5;
    float _2524 = _2520 * _2518;
    float _2526 = -_2524;
    float _2528 = _2526 + 1.0;
    float _2530 = fma(_2528, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2524);
    float _2532 = _2516;
    float _2534 = _2516;
    if (!_2450)
    {
        _2498 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2536 = _2498;
    float _2538 = _2470 * _2530;
    out.m_86.x = _2484;
    out.m_86.y = _2482;
    out.m_86.z = _2522;
    out.m_86.w = _2357;
    float _2540 = _2538 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2542 = -_2367;
    float _2544 = _2542 + 1.0;
    float _2546 = _2544 * _2540;
    float _2548 = precise::clamp(_2546, 0.0, 1.0);
    float _2550 = -_2548;
    float _2552 = fma(_2550, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2554 = _2552 * _2456;
    float _2556 = _2492 * _2413;
    float _2558 = _2554 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2560 = _2424 * _2504;
    float _2562 = _2029 * _2085;
    float _2564 = _2424 * _2556;
    float _2566 = _2434 * _2556;
    out.m_88.x = _2558;
    float _2568 = _2554;
    float _2570 = _2564;
    float _2572 = _2562;
    float _2574 = _2536;
    float _2576 = _2536;
    if (!_2450)
    {
        _2568 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2578 = _2568;
    float _2580 = fma(_2430, _2564, _2418);
    float _2582 = fma(_2432, _2564, _2420);
    float _2584 = fma(_2424, _2566, _2422);
    float _2586 = _2562 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2588 = _2578;
    float _2590 = _2578;
    if (!_2450)
    {
        _2570 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2592 = _2570;
    float _2594 = _2592;
    float _2596 = _2592;
    if (!_2450)
    {
        _2572 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2598 = _2572;
    out.m_90.x = _2580;
    out.m_90.y = _2582;
    out.m_90.z = _2584;
    out.m_90.w = _2560;
    bool _2600 = !_2450;
    float _2602 = _2598;
    float _2604 = _2598;
    if (!_2600)
    {
        bool _2606 = _2205 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2608 = isnan(_2205);
        bool _2610 = _2606 || _2608;
        bool _2612 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2614 = _2610 || _2612;
        if (!_2614)
        {
            float _2616 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2618 = _2205 + _2616;
            float _2620 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2622 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2620;
            float _2624 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2626 = _2624 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2628 = 1.0 / _2622;
            float _2630 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2632 = _2630 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2634 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2636 = _2634 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2640 = _2638 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2644 = _2642 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2646 = _2618 * _2628;
            float _2648 = precise::clamp(_2646, 0.0, 1.0);
            float _2650 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2652 = _2650 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2654 = fma(_2648, _2626, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2656 = fma(_2648, _2652, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2658 = fma(_2648, _2632, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2660 = fma(_2648, _2636, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2662 = fma(_2648, _2640, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2664 = fma(_2648, _2644, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2590 = _2658;
            _2514 = _2662;
            _2596 = _2654;
            _2534 = _2660;
            _2576 = _2656;
            _2604 = _2664;
            _2666 = true;
        }
        else
        {
            bool _2668 = _2205 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2670 = isnan(_2205);
            bool _2672 = _2668 || _2670;
            bool _2674 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2676 = _2672 || _2674;
            if (!_2676)
            {
                _2594 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2678 = _2594;
            _2596 = _2678;
            if (!_2676)
            {
                _2588 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2680 = _2588;
            _2590 = _2680;
            if (!_2676)
            {
                _2574 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2682 = _2574;
            _2576 = _2682;
            if (!_2676)
            {
                _2532 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2684 = _2532;
            _2534 = _2684;
            if (!_2676)
            {
                _2512 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2686 = _2512;
            _2514 = _2686;
            if (!_2676)
            {
                _2602 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2688 = _2602;
            bool _2690 = !_2676;
            _2604 = _2688;
            if (!_2690)
            {
                bool _2692 = _2205 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2694 = isnan(_2205);
                bool _2696 = _2692 || _2694;
                bool _2698 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2700 = _2696 || _2698;
                if (!_2700)
                {
                    float _2702 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2704 = _2205 + _2702;
                    float _2706 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2708 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2706;
                    float _2710 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2712 = _2710 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2714 = 1.0 / _2708;
                    float _2716 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2718 = _2716 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2720 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2722 = _2720 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2724 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2726 = _2724 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2728 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2730 = _2728 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2732 = _2704 * _2714;
                    float _2734 = precise::clamp(_2732, 0.0, 1.0);
                    float _2736 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2738 = _2736 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2740 = fma(_2734, _2712, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2742 = fma(_2734, _2738, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2744 = fma(_2734, _2718, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2746 = fma(_2734, _2722, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2748 = fma(_2734, _2726, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2750 = fma(_2734, _2730, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2590 = _2744;
                    _2514 = _2748;
                    _2596 = _2740;
                    _2534 = _2746;
                    _2576 = _2742;
                    _2604 = _2750;
                    _2666 = true;
                }
                else
                {
                    _2590 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2514 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2596 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2534 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2576 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2604 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2666 = false;
    float _2752 = _2590;
    float _2754 = _2514;
    float _2756 = _2596;
    float _2758 = _2534;
    float _2760 = _2576;
    float _2762 = _2604;
    float _2764 = fma(_1633, -0.5, 0.5);
    float _2766 = precise::clamp(_2764, 0.0, 1.0);
    float _2768 = -_2752;
    float _2770 = _2768 + _2754;
    float _2772 = _2586 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2774 = -_2756;
    float _2776 = _2774 + _2758;
    float _2778 = fma(_2766, _2770, _2752);
    out.m_92.x = 0.0;
    float _2780 = -_2760;
    float _2782 = _2780 + _2762;
    float _2784 = fma(_2766, _2776, _2756);
    float _2786 = _2778 * 0.586610972881317138671875;
    out.m_51.x = _2772;
    bool _2788 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2790 = fma(_2766, _2782, _2760);
    float _2792 = fma(_2784, 0.298911988735198974609375, _2786);
    bool _2794 = _2029 > 0.0;
    bool _2796 = isnan(_2029);
    bool _2798 = _2794 || _2796;
    bool _2800 = isnan(0.0);
    bool _2802 = _2798 || _2800;
    float _2804 = fma(_2790, 0.114477999508380889892578125, _2792);
    bool _2806 = _2085 <= 0.0;
    bool _2808 = !_2802;
    bool _2810 = _2806 || _2808;
    float _2812 = -_2804;
    float _2814 = _2784 + _2812;
    float _2816 = -_2804;
    float _2818 = _2778 + _2816;
    float _2820 = -_2804;
    float _2822 = _2790 + _2820;
    float _2824 = fma(_2814, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2804);
    float _2826 = fma(_2818, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2804);
    float _2828 = fma(_2822, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2804);
    bool _2830 = !_2788;
    if (!_2830)
    {
        float _2832 = -_1959;
        float _2834 = _2832 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2836 = -_1961;
        float _2838 = _2836 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2840 = -_1963;
        float _2842 = _2840 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2844 = _2834 * _2834;
        float _2846 = fma(_2838, _2838, _2844);
        float _2848 = fma(_2842, _2842, _2846);
        float _2850 = sqrt(_2848);
        float _2852 = rsqrt(_2848);
        float _2854 = -_2850;
        float _2856 = _2854 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2858 = _2856 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2860 = precise::clamp(_2858, 0.0, 1.0);
        float _2862 = _2838 * _2852;
        float _2864 = _2834 * _2852;
        float _2866 = abs(_2860);
        float _2868 = log2(_2866);
        float _2870 = _2842 * _2852;
        float _2872 = _2862 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2874 = _1633 * _2864;
        float _2876 = -_2864;
        float _2878 = -_2872;
        float _2880 = fma(_2876, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2878);
        float _2882 = fma(_1637, _2862, _2874);
        float _2884 = -_2870;
        float _2886 = fma(_2884, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2880);
        float _2888 = fma(_1639, _2870, _2882);
        float _2890 = precise::clamp(_2888, 0.0, 1.0);
        float _2892 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2894 = _2886 + _2892;
        float _2896 = _2868 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2898 = _2894 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2900 = precise::clamp(_2898, 0.0, 1.0);
        float _2902 = exp2(_2896);
        float _2904 = _2902 * _2900;
        float _2906 = _2890 * _2904;
        float _2908 = _2906 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2910 = _2906 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2912 = _2906 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_92.x = _2908;
        out.m_92.y = _2910;
        out.m_92.z = _2912;
    }
    out.m_94.x = _2824;
    out.m_94.y = _2826;
    out.m_94.z = _2828;
    if (!_2810)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2914 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2914;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_94.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_94.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_94.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_94.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_78.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_78.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_78.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_78.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 64, as_type<uint>(out.m_92.x)); dm_cw(dm_gs, dm_p, 65, as_type<uint>(out.m_92.y)); dm_cw(dm_gs, dm_p, 66, as_type<uint>(out.m_92.z)); dm_cw(dm_gs, dm_p, 67, as_type<uint>(out.m_92.w)); dm_cw(dm_gs, dm_p, 68, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 69, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 70, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 71, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 72, as_type<uint>(out.m_90.x)); dm_cw(dm_gs, dm_p, 73, as_type<uint>(out.m_90.y)); dm_cw(dm_gs, dm_p, 74, as_type<uint>(out.m_90.z)); dm_cw(dm_gs, dm_p, 75, as_type<uint>(out.m_90.w)); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

