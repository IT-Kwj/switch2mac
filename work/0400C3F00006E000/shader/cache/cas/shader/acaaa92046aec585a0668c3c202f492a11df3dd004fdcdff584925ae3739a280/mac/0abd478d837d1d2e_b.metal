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
    float4 m_72 [[user(locn1)]];
    float4 m_51 [[user(locn2)]];
    float4 m_88 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_74 [[user(locn5)]];
    float4 m_80 [[user(locn6)]];
    float4 m_68 [[user(locn7)]];
    float4 m_76 [[user(locn8)]];
    float4 m_86 [[user(locn9)]];
    float4 m_82 [[user(locn10)]];
    float4 m_84 [[user(locn11)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_78 [[attribute(0)]];
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2602 = false;
    bool _1615 = false;
    bool _521 = false;
    bool _415 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2906 = as_type<float>(_121);
        out.gl_Position.z = _2906;
    }
    if (!_111)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _125 = in.m_53.w;
    float _127 = float(_107);
    float _129 = 1.0 / _127;
    float _131 = -_125;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_125);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = _133 * _129;
    bool _147 = _133 >= _127;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    out.m_55.x = _145;
    float _153 = _125;
    float _155 = _133;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _153;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2978 = as_type<float>(_161);
        out.gl_Position.z = _2978;
    }
    if (_151)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_60.x;
    float _167 = in.m_60.y;
    float _169 = in.m_60.z;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _207 = !_179;
    float _225;
    if (!_207)
    {
        float _209 = in.m_62.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        _225 = _145;
    }
    _227 = false;
    float _229 = _225;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _229 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = _229 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _229 + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _251;
    bool _255 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _257 = isnan(_229);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _269 = 1.0 / _245;
    float _271 = 1.0 / _253;
    float _273 = 1.0 / _249;
    float _275 = _233 * _269;
    bool _277 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _279 = isnan(_229);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -_265;
    float _291 = _289 + 1.0;
    bool _293 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _295 = isnan(_229);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _287 * _291;
    float _307 = _237 * _271;
    float _309 = -_287;
    float _311 = _309 + 1.0;
    float _313 = _303 * _311;
    float _315 = -_303;
    float _317 = _315 + 1.0;
    float _319 = _241 * _273;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _325 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_229);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = fma(_339, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = _335 * _317;
    float _353 = fma(_343, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _355 = fma(_323, _319, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _357 = fma(_347, _319, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _359 = -_335;
    float _361 = _359 + 1.0;
    float _363 = _349 * _351;
    float _365 = _353 * _351;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _367;
    float _371 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _363);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _373;
    float _377 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _379 = fma(_369, _307, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _381 = fma(_355, _313, _371);
    float _383 = fma(_375, _307, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _385 = fma(_357, _313, _377);
    float _387 = fma(_379, _305, _381);
    float _389 = fma(_383, _305, _385);
    float _391 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[146].x, _387);
    float _393 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[146].y, _389);
    bool _395 = !_267;
    float _413;
    if (!_395)
    {
        float _397 = in.m_62.x;
        float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _401 = _397 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _403 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _405 = _403 * _399;
        float _407 = floor(_405);
        float _409 = -_407;
        float _411 = _405 + _409;
        _413 = _411;
        _415 = true;
    }
    else
    {
        _413 = _145;
    }
    _415 = false;
    float _417 = _413;
    float _419 = in.m_64.x;
    float _421 = in.m_64.y;
    bool _423 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _425 = isnan(_417);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _439 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _441 = isnan(_417);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _417 + _455;
    float _459 = -_433;
    float _461 = _459 + 1.0;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _465 = 1.0 / _437;
    float _467 = _449 * _461;
    float _469 = -_449;
    float _471 = _469 + 1.0;
    float _473 = _393 * _421;
    float _475 = _391 * _419;
    float _477 = _453 * _465;
    float _479 = fma(_477, _457, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _481 = _479 * _467;
    float _483 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[115].x, _481);
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _491 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[116].x, _483);
    float _493 = _485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _499 = _491 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _493;
    out.m_66.y = _495;
    out.m_66.z = _497;
    out.m_66.w = _499;
    bool _501 = !_463;
    float _519;
    if (!_501)
    {
        float _503 = in.m_62.x;
        float _505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _507 = _503 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _511 = _509 * _505;
        float _513 = floor(_511);
        float _515 = -_513;
        float _517 = _511 + _515;
        _519 = _517;
        _521 = true;
    }
    else
    {
        _519 = _145;
    }
    _521 = false;
    float _523 = _519;
    float _525 = in.m_62.x;
    float _527 = in.m_62.y;
    float _529 = in.m_62.z;
    float _531 = in.m_62.w;
    float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _535 = in.m_48.x;
    float _537 = in.m_48.y;
    float _539 = in.m_48.z;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _543 = _541 != 0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _547 = _523 + _545;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _551 = _549 != 0;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _557 = _555 != 0;
    float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _563 = _561 != 0;
    float _565 = _533 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _571 = _525 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _573 = _531 > 0.5;
    float _575 = _527 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _577 = _537 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _581 = _579 != 0;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _585 = _583 != 0;
    float _587 = -_553;
    float _589 = fma(_571, 2.0, _587);
    float _591 = -_199;
    int _593 = _573 ? as_type<int>(_591) : as_type<int>(_199);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _599 = _525 > 0.5;
    float _601 = _529 * 2.0;
    float _603 = fma(_535, (*spvDescriptorSet0.vp_c10)._m0[5].x, _577);
    float _605 = 1.0 / _597;
    float _607 = -_189;
    int _609 = _599 ? as_type<int>(_607) : as_type<int>(_189);
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _615 = _613 != 0;
    float _617 = _537 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _619 = _537 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _621 = !_543;
    float _623 = _621 ? _189 : as_type<float>(_609);
    float _625 = fma(_575, -2.0, _569);
    float _627 = floor(_601);
    float _629 = fma(_535, (*spvDescriptorSet0.vp_c10)._m0[6].x, _619);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _631;
    float _635 = _525 * 2.0;
    float _637 = _527 * 2.0;
    bool _639 = _527 > 0.5;
    float _641 = fma(_535, (*spvDescriptorSet0.vp_c10)._m0[4].x, _617);
    float _643 = _633 * _605;
    float _645 = floor(_635);
    float _647 = -_199;
    int _649 = _639 ? as_type<int>(_647) : as_type<int>(_199);
    float _651 = _527 + _529;
    float _653 = -_133;
    float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[76].x, _589);
    float _657 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[4].z, _641);
    bool _659 = !_551;
    float _661 = _659 ? _199 : as_type<float>(_649);
    float _663 = _651 + (-1.0);
    bool _665 = _529 > 0.5;
    float _667 = floor(_637);
    float _669 = -_189;
    int _671 = _639 ? as_type<int>(_669) : as_type<int>(_189);
    float _673 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _675 = -_189;
    int _677 = _665 ? as_type<int>(_675) : as_type<int>(_189);
    float _679 = _527 + _525;
    bool _681 = _627 >= 0.0;
    bool _683 = isnan(_627);
    bool _685 = _681 || _683;
    bool _687 = isnan(0.0);
    bool _689 = _685 || _687;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _693 = -_199;
    int _695 = _665 ? as_type<int>(_693) : as_type<int>(_199);
    float _697 = _679 + (-1.0);
    bool _699 = !_581;
    float _701 = _699 ? _189 : as_type<float>(_671);
    float _703 = _559 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _705 = !_563;
    float _707 = _705 ? _189 : as_type<float>(_677);
    float _709 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _711 = _645 > 0.0;
    float _713 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[5].z, _603);
    bool _715 = _645 >= 0.0;
    bool _717 = isnan(_645);
    bool _719 = _715 || _717;
    bool _721 = isnan(0.0);
    bool _723 = _719 || _721;
    float _725 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _625);
    int _727 = _689 ? 0 : 1;
    float _729 = _661 + (-0.5);
    bool _731 = !_585;
    float _733 = _731 ? _199 : as_type<float>(_695);
    float _735 = _713 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _737 = _667 > 0.0;
    float _739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _741 = _667 >= 0.0;
    bool _743 = isnan(_667);
    bool _745 = _741 || _743;
    bool _747 = isnan(0.0);
    bool _749 = _745 || _747;
    float _751 = -_733;
    float _753 = _751 + 0.5;
    float _755 = _667;
    float _757 = _539;
    float _759 = _547;
    float _761 = _735;
    if (!_615)
    {
        _755 = _529;
    }
    float _763 = _755;
    float _765 = _657 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _767 = _627 > 0.0;
    float _769 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[6].z, _629);
    float _771 = _763;
    if (_615)
    {
        _771 = _527;
    }
    float _773 = _771;
    float _775 = fma(_643, _547, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _777 = ~_727;
    int _779 = _777 + 1;
    int _781 = _779 + 1;
    float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _785 = _781;
    if (!_615)
    {
        _757 = _527;
    }
    float _787 = _757;
    float _789 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[83].w, _611);
    float _791 = _623 + 0.5;
    float _793 = _787;
    if (!_615)
    {
        _759 = _529;
    }
    float _795 = _759;
    float _797 = _753 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _799 = _795;
    if (_615)
    {
        _793 = _525;
    }
    float _801 = _793;
    float _803 = fma(_565, _791, _655);
    bool _805 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _807 = isnan(_523);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = _739 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_767)
    {
        int _819 = ~_727;
        int _821 = _819 + 1;
        _785 = _821;
    }
    int _823 = _785;
    float _825 = _801 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _827 = -_815;
    float _829 = _827 + 1.0;
    bool _831 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _833 = isnan(_523);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = _769 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_615)
    {
        _799 = _527;
    }
    float _845 = _799;
    float _847 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _849 = log2(_847);
    int _851 = _723 ? 0 : 1;
    float _853 = _841 * _829;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _857 = _855 != 0;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _861 = _859 != 0;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _865 = _863 != 0;
    float _867 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _789);
    float _869 = _775 * _853;
    float _871 = -_691;
    float _873 = fma(_825, 2.0, _871);
    float _875 = -_841;
    float _877 = _875 + 1.0;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _883 = !_557;
    float _885 = _883 ? _199 : as_type<float>(_593);
    float _887 = -_133;
    float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[81].x, _873);
    float _891 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[83].z, _879);
    float _893 = -_703;
    float _895 = -_725;
    float _897 = fma(_893, _729, _895);
    float _899 = _701 + 0.5;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _903 = _845 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _905 = _707 + 0.5;
    float _907 = _899 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _909 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[131].x, _869);
    float _911 = fma(_903, -2.0, _901);
    float _913 = _885 + (-0.5);
    float _915 = _907 * _567;
    float _917 = _783 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _919 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _911);
    float _921 = fma(_817, _905, _889);
    bool _923 = !_857;
    int _925 = _923 ? 0 : 1;
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _929 = _735 + _927;
    float _931 = _797 * _881;
    float _933 = -_917;
    float _935 = -_919;
    float _937 = fma(_933, _913, _935);
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _941 = _765 + _939;
    int _943 = abs(_925);
    float _945 = _929 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _947 = _749 ? 0 : 1;
    out.m_68.x = _915;
    out.m_68.y = _931;
    float _949 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _891);
    int _951 = ~_947;
    int _953 = _951 + 1;
    int _955 = _953 + 1;
    float _957 = _849 * _133;
    int _959 = _955;
    if (!_737)
    {
        int _961 = ~_947;
        int _963 = _961 + 1;
        _959 = _963;
    }
    int _965 = _959;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _969 = -_949;
    float _971 = _969 + 1.0;
    int _973 = ~_851;
    int _975 = _973 + 1;
    int _977 = _975 + 1;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _983 = _843 + _981;
    float _985 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[28].x, _945);
    float _987 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[78].z, _967);
    float _989 = -_971;
    float _991 = fma(_707, _989, _921);
    bool _993 = !_861;
    int _995 = _993 ? 0 : 1;
    float _997 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[28].z, _985);
    float _999 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[78].w, _979);
    float _1001 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _987);
    int _1003 = abs(_995);
    float _1005 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[132].x, _909);
    float _1007 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _999);
    float _1009 = -_1001;
    float _1011 = _1009 + 1.0;
    bool _1013 = _997 >= 0.0;
    float _1015 = _929 * _929;
    float _1017 = -_1007;
    float _1019 = _1017 + 1.0;
    float _1021 = -_1011;
    float _1023 = fma(_623, _1021, _803);
    float _1025 = fma(_941, _941, _1015);
    float _1027 = fma(_661, _1019, _897);
    int _1029 = _977;
    if (!_711)
    {
        int _1031 = ~_851;
        int _1033 = _1031 + 1;
        _1029 = _1033;
    }
    int _1035 = _1029;
    float _1037 = in.m_70.x;
    float _1039 = in.m_70.y;
    float _1041 = in.m_70.z;
    float _1043 = float(_823);
    float _1045 = fma(_983, _983, _1025);
    float _1047 = float(_943);
    float _1049 = exp2(_957);
    bool _1051 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1053 = isnan(1.0);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1059 = _1055 || _1057;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1063 = 1.0 + _1061;
    float _1065 = _1047 * _1043;
    float _1067 = -_867;
    float _1069 = _1067 + 1.0;
    if (_1013)
    {
        out.m_51.x = 0.0;
    }
    float _1071 = 1.0 / _1063;
    float _1073 = fma(_885, _1069, _937);
    float _1075 = _1065 * (-2.0);
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1081 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1083 = isnan(0.0);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1089 = _1085 || _1087;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1093 = rsqrt(_1045);
    float _1095 = _1005 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1097 = float(_1035);
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1101 = float(_1003);
    float _1103 = fma(_1075, _1037, _1037);
    float _1105 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1107 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1109 = fma(_709, _1075, _709);
    float _1111 = _1101 * _1097;
    float _1113 = _1097;
    if (_1013)
    {
        _1113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1115 = _1113;
    float _1117 = -_1049;
    float _1119 = _1117 + 1.0;
    out.m_72.x = _1099;
    out.m_72.y = _1105;
    out.m_72.z = _1107;
    out.m_72.w = _1095;
    float _1121 = _1111 * (-2.0);
    int _1123 = as_type<int>(_1115);
    if (_1013)
    {
        float _1125 = _1115 * 5.0;
        _1123 = as_type<int>(_1125);
    }
    int _1127 = _1123;
    float _1129 = fma(_673, _1121, _673);
    float _1131 = fma(_1121, _1039, _1039);
    float _1133 = _929 * _1093;
    float _1135 = _1089 ? _1119 : 0.0;
    out.m_74.x = _1023;
    out.m_74.y = _1027;
    out.m_74.z = _991;
    out.m_74.w = _1073;
    float _1137 = -_1133;
    float _1139 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[18].w, _929);
    if (_1013)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4583 = as_type<float>(_1127);
        out.gl_Position.z = _4583;
    }
    float _1141 = _525 + (-0.5);
    if (_1059)
    {
        float _1143 = _1135 * _1071;
        _155 = _1143;
    }
    float _1145 = _155;
    float _1147 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1103);
    float _1149 = _1139 * _1139;
    float _1151 = _941 * _1093;
    bool _1153 = !_865;
    int _1155 = _1153 ? 0 : 1;
    float _1157 = -_1151;
    float _1159 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[18].w, _941);
    float _1161 = _1151;
    if (_1013)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1163 = -_1133;
    float _1165 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _1167 = _983 * _1093;
    float _1169 = -_1151;
    float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[18].w, _765);
    float _1173 = fma(_1159, _1159, _1149);
    float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1177 = _1165 + _1175;
    float _1179 = -_1167;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[18].w, _843);
    float _1183 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1185 = _1171 + _1183;
    int _1187 = abs(_1155);
    float _1189 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1193 = _1181 + _1191;
    float _1195 = fma(_1109, _1145, _1147);
    float _1197 = _527 + (-0.5);
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1189);
    float _1201 = _1195 * 0.15915493667125701904296875;
    float _1203 = float(_965);
    float _1205 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1199);
    float _1207 = float(_1187);
    float _1209 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1131);
    float _1211 = -_1167;
    float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[18].w, _983);
    float _1215 = _529 + _525;
    bool _1217 = _1205 >= 0.0;
    float _1219 = _1207 * _1203;
    float _1221 = fma(_1129, _1145, _1209);
    float _1223 = fma(_1213, _1213, _1173);
    float _1225 = _1215 + (-1.0);
    float _1227 = _1219 * (-2.0);
    float _1229 = _1221 * 0.15915493667125701904296875;
    float _1231 = _529 + (-0.5);
    float _1233 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1235 = fma(_1227, _1041, _1041);
    float _1237 = sqrt(_1223);
    float _1239 = _1219;
    int _1241 = as_type<int>(_1231);
    float _1243 = _1167;
    float _1245 = _1185;
    if (_1217)
    {
        _1239 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1247 = _1239;
    float _1249 = fma(_1233, _1227, _1233);
    float _1251 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1235);
    if (_1217)
    {
        out.m_51.x = 0.0;
    }
    if (_1217)
    {
        float _1253 = _1247 * 5.0;
        _1241 = as_type<int>(_1253);
    }
    int _1255 = _1241;
    float _1257 = _1201 * 6.283185482025146484375;
    float _1259 = sin(_1257);
    float _1261 = fma(_1249, _1145, _1251);
    if (_1217)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4792 = as_type<float>(_1255);
        out.gl_Position.z = _4792;
    }
    float _1263 = _1261 * 0.15915493667125701904296875;
    float _1265 = _1201 * 6.283185482025146484375;
    float _1267 = cos(_1265);
    float _1269 = _1229 * 6.283185482025146484375;
    float _1271 = sin(_1269);
    float _1273 = _1229 * 6.283185482025146484375;
    float _1275 = cos(_1273);
    if (_1217)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _1277 = _1263 * 6.283185482025146484375;
    float _1279 = cos(_1277);
    float _1281 = _1093 * _1237;
    float _1283 = _473 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1285 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1287 = _475 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1289 = _1267 * _1275;
    float _1291 = _1281 * _1283;
    float _1293 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1295 = _1263 * 6.283185482025146484375;
    float _1297 = sin(_1295);
    float _1299 = _1281 * _1287;
    float _1301 = _1285 * _1291;
    float _1303 = _1259 * _1271;
    float _1305 = _1267 * _1271;
    float _1307 = _1259 * _1275;
    float _1309 = _1293 * _1299;
    float _1311 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1313 = _1311 * 0.5;
    float _1315 = _1267 * _1279;
    float _1317 = _1275 * _1279;
    float _1319 = _1259 * _1279;
    float _1321 = _1271 * _1279;
    float _1323 = _1315 * _1301;
    float _1325 = _1319 * _1301;
    float _1327 = fma(_1297, _1289, _1303);
    float _1329 = -_1307;
    float _1331 = fma(_1297, _1305, _1329);
    float _1333 = -_1301;
    float _1335 = _1297 * _1333;
    float _1337 = fma(_1297, _1303, _1289);
    float _1339 = fma(_1327, _1309, _1323);
    float _1341 = -_1305;
    float _1343 = fma(_1297, _1307, _1341);
    float _1345 = fma(_1317, _1309, _1335);
    float _1347 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1349 = fma(_1331, _1313, _1339);
    float _1351 = fma(_1343, _1309, _1325);
    float _1353 = fma(_1321, _1313, _1345);
    float _1355 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1357 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1359 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1361 = fma(_1337, _1313, _1351);
    float _1363 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1365 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1357);
    float _1367 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1359);
    float _1369 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1371 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1363);
    float _1373 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1365);
    float _1375 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1367);
    float _1377 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1355);
    float _1379 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1371);
    float _1381 = _1373 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1383 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1385 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1369);
    float _1387 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1347);
    float _1389 = _765 + _1381;
    float _1391 = _843 + _1383;
    float _1393 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1395 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1397 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1399 = _1389 + _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1403 = _1391 + _1401;
    float _1405 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1407 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1409 = _1399 * _1399;
    float _1411 = _1403 * _1403;
    float _1413 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1415 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1417 = _735 + _1393;
    float _1419 = _1409 + _1411;
    float _1421 = -_1297;
    float _1423 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1395);
    float _1425 = -_1297;
    float _1427 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1405);
    float _1429 = -_1297;
    float _1431 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1407);
    float _1433 = sqrt(_1419);
    float _1435 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1437 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1377);
    float _1439 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1385);
    float _1441 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1387);
    float _1443 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1413);
    float _1445 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1415);
    float _1447 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1435);
    bool _1449 = _1433 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1451 = _1331;
    float _1453 = _1409;
    float _1455 = _1411;
    float _1457 = _1389;
    float _1459 = _1391;
    if (!_1449)
    {
        _1451 = _1417;
    }
    float _1461 = _1451;
    bool _1463 = !_1449;
    float _1465 = _1461;
    if (!_1463)
    {
        float _1467 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1471 = _1433 + _1469;
        float _1473 = rsqrt(_1419);
        float _1475 = _1471 * _1467;
        float _1477 = _1417 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = _1475 * 0.15915493667125701904296875;
        float _1481 = _1479 * 6.283185482025146484375;
        float _1483 = sin(_1481);
        float _1485 = _1479 * 6.283185482025146484375;
        float _1487 = cos(_1485);
        float _1489 = fma(_1483, _1477, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1491 = _1473 * _1489;
        float _1493 = fma(_1399, _1491, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1495 = _1487 + (-1.0);
        float _1497 = fma(_1403, _1491, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1501 = _1493 + _1499;
        float _1503 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1507 = _1497 + _1505;
        float _1509 = _1501 * _1501;
        float _1511 = fma(_1417, _1487, _1503);
        float _1513 = _1507 * _1507;
        _1465 = _1511;
        _1453 = _1509;
        _1455 = _1513;
        _1457 = _1493;
        _1459 = _1497;
    }
    float _1515 = _1465;
    float _1517 = _1453;
    float _1519 = _1455;
    float _1521 = _1457;
    float _1523 = _1459;
    float _1525 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1527 = _1515 + _1525;
    float _1529 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1423);
    float _1531 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1427);
    float _1533 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1535 = fma(_1527, _1527, _1517);
    float _1537 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1431);
    float _1539 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1541 = _1533 * _1529;
    float _1543 = _1535 + _1519;
    float _1545 = _1533 * _1531;
    float _1547 = _1533 * _1537;
    float _1549 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1443);
    float _1551 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1445);
    float _1553 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1447);
    float _1555 = sqrt(_1543);
    float _1557 = fma(_1539, _1437, _1541);
    float _1559 = fma(_1539, _1439, _1545);
    float _1561 = fma(_1539, _1441, _1547);
    float _1563 = _1549 + _1557;
    float _1565 = _1551 + _1559;
    float _1567 = _1553 + _1561;
    out.m_76.x = _1563;
    out.m_76.y = _1565;
    out.m_76.z = _1567;
    bool _1569 = _1555 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1571 = isnan(_1555);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1577 = _1573 || _1575;
    float _1579 = _1531;
    if (!_1577)
    {
        _1579 = 1.0;
    }
    float _1581 = _1579;
    bool _1583 = !_1577;
    float _1585 = _1581;
    if (!_1583)
    {
        bool _1587 = _1555 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1589 = isnan(_1555);
        bool _1591 = _1587 || _1589;
        bool _1593 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1595 = _1591 || _1593;
        if (!_1595)
        {
            float _1597 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1599 = _1555 + _1597;
            float _1601 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1603 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1601;
            float _1605 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1607 = _1605 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1609 = 1.0 / _1603;
            float _1611 = _1599 * _1609;
            float _1613 = fma(_1611, _1607, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1585 = _1613;
            _1615 = true;
        }
        else
        {
            bool _1617 = _1555 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1619 = isnan(_1555);
            bool _1621 = _1617 || _1619;
            bool _1623 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1625 = _1621 || _1623;
            if (!_1625)
            {
                float _1627 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1629 = _1555 + _1627;
                float _1631 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1633 = _1631 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1635 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1637 = _1635 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1639 = 1.0 / _1633;
                float _1641 = _1629 * _1639;
                float _1643 = fma(_1641, _1637, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1585 = _1643;
                _1615 = true;
            }
            else
            {
                _1585 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1615 = false;
    float _1645 = _1585;
    float _1647 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1649 = _1515 + _1647;
    float _1651 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1653 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1655 = _1521 + _1653;
    float _1657 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1659 = _1523 + _1657;
    float _1661 = fma(_1649, _1645, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1663 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1651);
    float _1665 = fma(_1655, _1645, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1667 = fma(_1659, _1645, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1669 = -_735;
    float _1671 = _1669 + _1661;
    float _1673 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1663);
    float _1675 = -_765;
    float _1677 = _1675 + _1665;
    float _1679 = -_843;
    float _1681 = _1679 + _1667;
    float _1683 = _1671 * _1671;
    float _1685 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1687 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1689 = fma(_1677, _1677, _1683);
    float _1691 = 1.0 / _1685;
    float _1693 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1687);
    float _1695 = fma(_1681, _1681, _1689);
    float _1697 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1693);
    float _1699 = sqrt(_1695);
    float _1701 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1703 = _1701 + _1685;
    float _1705 = _1703 * _1691;
    float _1707 = _1705 * 0.5;
    bool _1709 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan(0.5);
    bool _1717 = _1713 || _1715;
    bool _1719 = _1699 > 0.0;
    float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1723 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1721);
    bool _1725 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1727 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1729 = _1725 || _1727;
    bool _1731 = isnan(0.5);
    bool _1733 = _1729 || _1731;
    float _1735 = 1.0 / _1723;
    float _1737 = _1691;
    float _1739 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1741 = _1667;
    if (!_1719)
    {
        _1737 = _1665;
    }
    float _1743 = _1737;
    float _1745 = _1743;
    float _1747 = _1743;
    if (!_1719)
    {
        _1739 = _1661;
    }
    float _1749 = _1739;
    bool _1751 = !_1719;
    float _1753 = _1749;
    float _1755 = _1735;
    if (!_1751)
    {
        float _1757 = _203 * _203;
        float _1759 = fma(_201, _201, _1757);
        float _1761 = fma(_205, _205, _1759);
        float _1763 = rsqrt(_1695);
        float _1765 = sqrt(_1761);
        float _1767 = _1677 * _1763;
        float _1769 = _1671 * _1763;
        float _1771 = _1681 * _1763;
        bool _1773 = _1765 > 0.0;
        float _1775 = _1765;
        if (!_1773)
        {
            _1745 = _1665;
        }
        float _1777 = _1745;
        _1747 = _1777;
        if (!_1773)
        {
            _1775 = _1661;
        }
        float _1779 = _1775;
        bool _1781 = !_1773;
        _1753 = _1779;
        if (!_1781)
        {
            float _1783 = rsqrt(_1761);
            float _1785 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1787 = _203 * _1783;
            float _1789 = _201 * _1783;
            float _1791 = _1769 * _1787;
            float _1793 = _205 * _1783;
            float _1795 = fma(_1767, _1789, _1791);
            float _1797 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1799 = fma(_1771, _1793, _1795);
            float _1801 = _1799 * _1797;
            float _1803 = fma(_201, _1801, _1665);
            float _1805 = fma(_203, _1801, _1661);
            float _1807 = fma(_205, _1801, _1667);
            _1747 = _1803;
            _1741 = _1807;
            _1753 = _1805;
        }
    }
    float _1809 = _1747;
    float _1811 = _1741;
    float _1813 = _1753;
    float _1815 = -_1151;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1809);
    float _1819 = -_1167;
    float _1821 = fma(_1819, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1811);
    float _1823 = -_1133;
    float _1825 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1813);
    float _1827 = _1825;
    float _1829 = _1821;
    if (_1717)
    {
        _1161 = 1.0;
    }
    float _1831 = _1161;
    float _1833 = _1831;
    if (_1733)
    {
        _1243 = _1817;
    }
    float _1835 = _1243;
    float _1837 = _1835;
    if (!_1733)
    {
        float _1839 = _1177 * _1177;
        float _1841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1843 = -_843;
        float _1845 = _1843 + _1811;
        float _1847 = -_735;
        float _1849 = _1847 + _1813;
        float _1851 = fma(_1185, _1185, _1839);
        float _1853 = fma(_1193, _1193, _1851);
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1857 = sqrt(_1853);
        float _1859 = 1.0 / _1281;
        float _1861 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1863 = precise::min(_1857, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1865 = _1863 * _1841;
        float _1867 = _1865 * _1859;
        float _1869 = -_765;
        float _1871 = _1869 + _1809;
        float _1873 = _1861 * _1867;
        float _1875 = _1845 * _1867;
        float _1877 = fma(_1849, _1873, _1165);
        float _1879 = fma(_1871, _1873, _1171);
        float _1881 = fma(_1861, _1875, _1181);
        _1245 = _1857;
        _1827 = _1877;
        _1837 = _1879;
        _1829 = _1881;
        _761 = _1849;
    }
    float _1883 = _1245;
    float _1885 = _1827;
    float _1887 = _1837;
    float _1889 = _1829;
    float _1891 = _761;
    float _1893 = _1891;
    float _1895 = _1883;
    if (_1717)
    {
        _1893 = 1.0;
    }
    float _1897 = _1893;
    float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1901 = _1735 * _1899;
    float _1903 = _1897;
    if (!_1717)
    {
        float _1905 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1907 = _1905 * 0.15915493667125701904296875;
        float _1909 = _1907 * 6.283185482025146484375;
        float _1911 = cos(_1909);
        float _1913 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1915 = _1913 * 0.15915493667125701904296875;
        float _1917 = _1907 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        float _1921 = 1.0 / _1911;
        float _1923 = _1915 * 6.283185482025146484375;
        float _1925 = cos(_1923);
        float _1927 = _1919 * _1921;
        float _1929 = _1915 * 6.283185482025146484375;
        float _1931 = sin(_1929);
        float _1933 = _1925 * _1927;
        float _1935 = 1.0 / _1933;
        float _1937 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1939 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1937;
        float _1941 = 1.0 / _1939;
        float _1943 = _1931 * _1935;
        float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1947 = fma(_1901, _1943, _1945);
        float _1949 = _1947 * _1941;
        float _1951 = precise::clamp(_1949, 0.0, 1.0);
        _1895 = _1915;
        _1833 = _1951;
    }
    float _1953 = _1895;
    float _1955 = _1833;
    float _1957 = _1953;
    if (!_1717)
    {
        float _1959 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1961 = _1959 * 0.15915493667125701904296875;
        float _1963 = _1961 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        float _1967 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1969 = _1967 * 0.15915493667125701904296875;
        float _1971 = _1961 * 6.283185482025146484375;
        float _1973 = sin(_1971);
        float _1975 = 1.0 / _1965;
        float _1977 = _1969 * 6.283185482025146484375;
        float _1979 = cos(_1977);
        float _1981 = _1973 * _1975;
        float _1983 = _1969 * 6.283185482025146484375;
        float _1985 = sin(_1983);
        float _1987 = _1979 * _1981;
        float _1989 = 1.0 / _1987;
        float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1993 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1991;
        float _1995 = 1.0 / _1993;
        float _1997 = _1985 * _1989;
        float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2001 = fma(_1901, _1997, _1999);
        float _2003 = _2001 * _1995;
        float _2005 = precise::clamp(_2003, 0.0, 1.0);
        float _2007 = -_2005;
        float _2009 = _2007 + 1.0;
        _1957 = _1989;
        _1903 = _2009;
    }
    float _2011 = _1957;
    float _2013 = _1903;
    float _2015 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2017 = _1885 + _2015;
    float _2019 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2021 = _1887 + _2019;
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2025 = _1889 + _2023;
    float _2027 = _2017 * _2017;
    float _2029 = fma(_2021, _2021, _2027);
    float _2031 = fma(_2025, _2025, _2029);
    float _2033 = rsqrt(_2031);
    float _2035 = _2033 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2037 = _2021 * _2035;
    float _2039 = _2025 * _2035;
    float _2041 = _2037 * _2037;
    float _2043 = _2039 * _2039;
    float _2045 = _2041 + _2043;
    float _2047 = sqrt(_2045);
    bool _2049 = _2047 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2053 = _2047 + _2051;
    float _2055 = _2033;
    float _2057 = _2045;
    float _2059 = _2053;
    float _2061 = _2011;
    float _2063 = _2017;
    float _2065 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2049)
    {
        float _2067 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2055 = _2067;
    }
    float _2069 = _2055;
    if (_2049)
    {
        float _2071 = rsqrt(_2045);
        _2057 = _2071;
    }
    float _2073 = _2057;
    float _2075 = _2073;
    if (_2049)
    {
        float _2077 = _2053 * _2069;
        _2059 = _2077;
    }
    float _2079 = _2059;
    if (_2049)
    {
        float _2081 = _2079 * 0.15915493667125701904296875;
        _1755 = _2081;
    }
    float _2083 = _1755;
    float _2085 = _2069;
    float _2087 = _2083;
    if (_2049)
    {
        float _2089 = _2083 * 6.283185482025146484375;
        float _2091 = sin(_2089);
        _2085 = _2091;
    }
    float _2093 = _2085;
    float _2095 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2097 = precise::max(0.0, _2095);
    float _2099 = _2025;
    float _2101 = _2097;
    if (_2049)
    {
        float _2103 = _2083 * 6.283185482025146484375;
        float _2105 = cos(_2103);
        _2099 = _2105;
    }
    float _2107 = _2099;
    float _2109 = -_2035;
    float _2111 = -_2097;
    float _2113 = fma(_2017, _2109, _2111);
    if (_2049)
    {
        float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2101 = _2115;
    }
    float _2117 = _2101;
    if (!_2049)
    {
        _2087 = _2037;
    }
    float _2119 = _2087;
    float _2121 = _2093;
    float _2123 = _2119;
    if (_2049)
    {
        float _2125 = fma(_2093, _2117, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2061 = _2125;
    }
    float _2127 = _2061;
    float _2129 = fma(_1171, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2131 = _2127;
    if (!_2049)
    {
        _2121 = _2039;
    }
    float _2133 = _2121;
    float _2135 = sqrt(_2031);
    float _2137 = _2133;
    float _2139 = _2107;
    if (_2049)
    {
        float _2141 = _2107 + (-1.0);
        _2063 = _2141;
    }
    float _2143 = _2063;
    float _2145 = _2143;
    if (_2049)
    {
        float _2147 = _2073 * _2127;
        _2065 = _2147;
    }
    float _2149 = _2065;
    if (!_2049)
    {
        _2131 = _2113;
    }
    float _2151 = _2131;
    float _2153 = _2151;
    if (_2049)
    {
        float _2155 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2145 = _2155;
    }
    float _2157 = _2145;
    if (_2049)
    {
        float _2159 = _2037 * _2149;
        _2123 = _2159;
    }
    float _2161 = _2123;
    if (!_2049)
    {
        _2075 = _2041;
    }
    float _2163 = _2075;
    float _2165 = _2163;
    if (_2049)
    {
        float _2167 = _2039 * _2149;
        _2137 = _2167;
    }
    float _2169 = _2137;
    if (_2049)
    {
        float _2171 = fma(_2113, _2107, _2157);
        _2153 = _2171;
    }
    float _2173 = _2153;
    if (_2049)
    {
        float _2175 = _2161 * _2161;
        _2165 = _2175;
    }
    float _2177 = _2165;
    if (!_2049)
    {
        _2139 = _2043;
    }
    float _2179 = _2139;
    float _2181 = _2179;
    if (_2049)
    {
        float _2183 = _2169 * _2169;
        _2181 = _2183;
    }
    float _2185 = _2181;
    float _2187 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2189 = fma(_2173, _2173, _2177);
    float _2191 = floor(_2129);
    float _2193 = _2189 + _2185;
    float _2195 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2187);
    float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2199 = fma(_2135, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2197);
    float _2201 = precise::clamp(_2199, 0.0, 1.0);
    float _2203 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2205 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2195);
    float _2207 = rsqrt(_2193);
    float _2209 = -_2201;
    float _2211 = _2209 + 1.0;
    float _2213 = fma(_1181, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2215 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2217 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2219 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2221 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2223 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2217);
    float _2225 = abs(_2211);
    float _2227 = log2(_2225);
    float _2229 = -_2221;
    float _2231 = fma(_2229, _2203, 1.0);
    float _2233 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2235 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2223);
    float _2237 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2219);
    float _2239 = _2207 * _2161;
    float _2241 = _2207 * _2173;
    float _2243 = _2207 * _2169;
    float _2245 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2233);
    float _2247 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2249 = _2235 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2251 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2237);
    float _2253 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2245);
    float _2255 = -_2247;
    float _2257 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2255);
    float _2259 = _2249 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2261 = floor(_2213);
    float _2263 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2265 = -_2243;
    float _2267 = fma(_2265, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2257);
    float _2269 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2271 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2273 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2259);
    float _2275 = fma(_2267, -0.5, 0.5);
    float _2277 = fma(_2267, 0.5, 0.5);
    float _2279 = log2(_2231);
    float _2281 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2273);
    float _2283 = _2249 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2285 = _2241 + 1.0;
    float _2287 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2281);
    float _2289 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2283);
    float _2291 = exp2(_2271);
    float _2293 = -_2191;
    float _2295 = _2129 + _2293;
    float _2297 = _2249 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2299 = -_2261;
    float _2301 = _2213 + _2299;
    float _2303 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2289);
    float _2305 = fma(_2277, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2307 = 1.0 / _2287;
    float _2309 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2297);
    float _2311 = _2279 * 0.693147182464599609375;
    float _2313 = fma(_2277, _2305, -0.212114393711090087890625);
    float _2315 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2309);
    float _2317 = sqrt(_2275);
    float _2319 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2315);
    float _2321 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2303);
    float _2323 = -_2241;
    float _2325 = fma(_2291, _2285, _2323);
    float2 _6526 = float2(_2295, _2301);
    float _2327 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6526, float2(0.0), isnan(_6526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6526, float2(0.0), isnan(_6526)), level(0.0)).x;
    float _2329 = fma(_2277, _2313, 1.570728778839111328125);
    float _2331 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2333 = fma(_2325, 0.5, 0.5);
    float _2335 = _2319 * _2307;
    float _2337 = _2321 * _2307;
    float _2339 = fma(_2335, 0.5, 0.5);
    float _2341 = fma(_2337, -0.5, 0.5);
    float _2343 = _2317 * 0.636619746685028076171875;
    float _2345 = -_2329;
    float _2347 = fma(_2343, _2345, 1.0);
    float3 _6565 = float3(_2339, _2341, _2331);
    float _2349 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6565, float3(0.0), isnan(_6565)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6565, float3(0.0), isnan(_6565)), level(0.0)).x;
    float3 _6576 = float3(_2339, _2341, _2331);
    float4 _2352 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6576, float3(0.0), isnan(_6576)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6576, float3(0.0), isnan(_6576)), level(0.0)).xyzw;
    float _2354 = _2352.x;
    float _2356 = _2352.y;
    float _2358 = _2352.z;
    float _2360 = _2352.w;
    float2 _6592 = float2(_2347, _2333);
    float3 _2364 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6592, float2(0.0), isnan(_6592)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6592, float2(0.0), isnan(_6592)), level(0.0)).xyz;
    float _2366 = _2364.x;
    float _2368 = _2364.y;
    float _2370 = _2364.z;
    float _2372 = abs(_1901);
    float _2374 = log2(_2372);
    bool _2376 = _2135 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2378 = isnan(_2135);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2384 = _2380 || _2382;
    float _2386 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2388 = exp2(_2386);
    float _2390 = _2249 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2392 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2390);
    float _2394 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2396 = in.m_78.x;
    float _2398 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2392);
    float _2400 = exp2(_2394);
    float _2402 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2398);
    bool _2404 = _1901 <= 8000.0;
    bool _2406 = isnan(_1901);
    bool _2408 = _2404 || _2406;
    bool _2410 = isnan(8000.0);
    bool _2412 = _2408 || _2410;
    float _2414 = float(_2412);
    float _2416 = _2287 * 0.5;
    float _2418 = fma(_2388, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2420 = precise::clamp(_2418, 0.0, 1.0);
    float _2422 = _2402 + _2287;
    float _2424 = _2319 + _2287;
    float _2426 = fma(_2321, -0.5, _2416);
    float _2428 = fma(_2420, -2.0, 3.0);
    float _2430 = _2420 * _2420;
    float _2432 = _2422 * 0.5;
    float _2434 = _2424 * 0.5;
    float _2436 = _2430 * _2428;
    out.gl_Position.x = _2319;
    out.gl_Position.y = _2321;
    out.gl_Position.z = _2402;
    out.gl_Position.w = _2287;
    float _2438 = -_2400;
    float _2440 = _2438 + 1.0;
    float _2442 = -_2436;
    float _2444 = _2442 + 1.0;
    out.m_80.x = _2434;
    out.m_80.y = _2426;
    out.m_80.z = _2432;
    out.m_80.w = _2287;
    float _2446 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2448 = fma(_2444, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2436);
    float _2450 = _2414 * _2448;
    float _2452 = _1955 * _2013;
    float _2454 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2456 = _2287;
    float _2458 = _2402;
    float _2460 = _2321;
    float _2462 = _2452;
    if (!_2384)
    {
        _2456 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2464 = _2456;
    float _2466 = _2464;
    float _2468 = _2464;
    if (!_2384)
    {
        _2458 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2470 = _2458;
    float _2472 = _2470;
    float _2474 = _2470;
    if (!_2384)
    {
        _2460 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2476 = _2460;
    float _2478 = -_2327;
    float _2480 = _2478 + 1.0;
    float _2482 = _2480 * _2454;
    float _2484 = precise::clamp(_2482, 0.0, 1.0);
    float _2486 = -_2484;
    float _2488 = fma(_2486, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2490 = _2488 * _2396;
    float _2492 = _2446 * _2349;
    float _2494 = -_2446;
    float _2496 = _2494 + 1.0;
    float _2498 = _2360 * _2492;
    float _2500 = _2370 * _2492;
    float _2502 = _2360 * _2496;
    float _2504 = _2496;
    float _2506 = _2490;
    float _2508 = _2476;
    float _2510 = _2476;
    if (!_2384)
    {
        _2504 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2512 = _2504;
    float _2514 = fma(_2366, _2498, _2354);
    float _2516 = fma(_2368, _2498, _2356);
    float _2518 = _2490 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2520 = fma(_2360, _2500, _2358);
    float _2522 = _2452 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2524 = _2512;
    float _2526 = _2512;
    if (!_2384)
    {
        _2506 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2528 = _2506;
    out.m_82.x = _2518;
    float _2530 = _2528;
    float _2532 = _2528;
    if (!_2384)
    {
        _2462 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2534 = _2462;
    out.m_84.x = _2514;
    out.m_84.y = _2516;
    out.m_84.z = _2520;
    out.m_84.w = _2502;
    bool _2536 = !_2384;
    float _2538 = _2534;
    float _2540 = _2534;
    if (!_2536)
    {
        bool _2542 = _2135 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2544 = isnan(_2135);
        bool _2546 = _2542 || _2544;
        bool _2548 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2550 = _2546 || _2548;
        if (!_2550)
        {
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2554 = _2135 + _2552;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2558 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2556;
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2564 = 1.0 / _2558;
            float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2582 = _2554 * _2564;
            float _2584 = precise::clamp(_2582, 0.0, 1.0);
            float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2590 = fma(_2584, _2562, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2592 = fma(_2584, _2588, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2594 = fma(_2584, _2568, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2596 = fma(_2584, _2572, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2598 = fma(_2584, _2576, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2600 = fma(_2584, _2580, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2526 = _2594;
            _2510 = _2598;
            _2532 = _2590;
            _2474 = _2596;
            _2468 = _2592;
            _2540 = _2600;
            _2602 = true;
        }
        else
        {
            bool _2604 = _2135 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2606 = isnan(_2135);
            bool _2608 = _2604 || _2606;
            bool _2610 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2612 = _2608 || _2610;
            if (!_2612)
            {
                _2530 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2614 = _2530;
            _2532 = _2614;
            if (!_2612)
            {
                _2524 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2616 = _2524;
            _2526 = _2616;
            if (!_2612)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2618 = _2466;
            _2468 = _2618;
            if (!_2612)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2620 = _2472;
            _2474 = _2620;
            if (!_2612)
            {
                _2508 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2622 = _2508;
            _2510 = _2622;
            if (!_2612)
            {
                _2538 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2624 = _2538;
            bool _2626 = !_2612;
            _2540 = _2624;
            if (!_2626)
            {
                bool _2628 = _2135 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2630 = isnan(_2135);
                bool _2632 = _2628 || _2630;
                bool _2634 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2636 = _2632 || _2634;
                if (!_2636)
                {
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2640 = _2135 + _2638;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2644 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2642;
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2650 = 1.0 / _2644;
                    float _2652 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2668 = _2640 * _2650;
                    float _2670 = precise::clamp(_2668, 0.0, 1.0);
                    float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2676 = fma(_2670, _2648, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2678 = fma(_2670, _2674, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2680 = fma(_2670, _2654, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2682 = fma(_2670, _2658, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2684 = fma(_2670, _2662, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2686 = fma(_2670, _2666, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2526 = _2680;
                    _2510 = _2684;
                    _2532 = _2676;
                    _2474 = _2682;
                    _2468 = _2678;
                    _2540 = _2686;
                    _2602 = true;
                }
                else
                {
                    _2526 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2510 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2532 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2540 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2602 = false;
    float _2688 = _2526;
    float _2690 = _2510;
    float _2692 = _2532;
    float _2694 = _2474;
    float _2696 = _2468;
    float _2698 = _2540;
    float _2700 = _2522 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2702 = fma(_1565, -0.5, 0.5);
    float _2704 = precise::clamp(_2702, 0.0, 1.0);
    float _2706 = -_2688;
    float _2708 = _2706 + _2690;
    float _2710 = -_2692;
    float _2712 = _2710 + _2694;
    out.m_51.x = _2700;
    float _2714 = fma(_2704, _2708, _2688);
    float _2716 = -_2696;
    float _2718 = _2716 + _2698;
    float _2720 = fma(_2704, _2712, _2692);
    float _2722 = _2714 * 0.586610972881317138671875;
    bool _2724 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2726 = fma(_2704, _2718, _2696);
    out.m_86.x = 0.0;
    float _2728 = fma(_2720, 0.298911988735198974609375, _2722);
    bool _2730 = _1955 > 0.0;
    bool _2732 = isnan(_1955);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan(0.0);
    bool _2738 = _2734 || _2736;
    float _2740 = fma(_2726, 0.114477999508380889892578125, _2728);
    bool _2742 = _2013 <= 0.0;
    bool _2744 = !_2738;
    bool _2746 = _2742 || _2744;
    float _2748 = -_2740;
    float _2750 = _2720 + _2748;
    float _2752 = -_2740;
    float _2754 = _2714 + _2752;
    float _2756 = -_2740;
    float _2758 = _2726 + _2756;
    float _2760 = fma(_2750, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2740);
    float _2762 = fma(_2754, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2740);
    float _2764 = fma(_2758, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2740);
    bool _2766 = !_2724;
    if (!_2766)
    {
        float _2768 = -_1885;
        float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2772 = -_1887;
        float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2776 = -_1889;
        float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2780 = _2770 * _2770;
        float _2782 = fma(_2774, _2774, _2780);
        float _2784 = fma(_2778, _2778, _2782);
        float _2786 = sqrt(_2784);
        float _2788 = rsqrt(_2784);
        float _2790 = -_2786;
        float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2794 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2796 = precise::clamp(_2794, 0.0, 1.0);
        float _2798 = _2774 * _2788;
        float _2800 = _2770 * _2788;
        float _2802 = abs(_2796);
        float _2804 = log2(_2802);
        float _2806 = _2778 * _2788;
        float _2808 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2810 = _1565 * _2800;
        float _2812 = -_2800;
        float _2814 = -_2808;
        float _2816 = fma(_2812, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2814);
        float _2818 = fma(_1563, _2798, _2810);
        float _2820 = -_2806;
        float _2822 = fma(_2820, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2816);
        float _2824 = fma(_1567, _2806, _2818);
        float _2826 = precise::clamp(_2824, 0.0, 1.0);
        float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2830 = _2822 + _2828;
        float _2832 = _2804 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2834 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2836 = precise::clamp(_2834, 0.0, 1.0);
        float _2838 = exp2(_2832);
        float _2840 = _2838 * _2836;
        float _2842 = _2826 * _2840;
        float _2844 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2846 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2848 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2844;
        out.m_86.y = _2846;
        out.m_86.z = _2848;
    }
    out.m_88.x = _2760;
    out.m_88.y = _2762;
    out.m_88.z = _2764;
    if (!_2746)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_51.x = 0.0;
    float _2850 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2850;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2602 = false;
    bool _1615 = false;
    bool _521 = false;
    bool _415 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2906 = as_type<float>(_121);
        out.gl_Position.z = _2906;
    }
    if (!_111)
    {
        return out;
    }
    float _125 = in.m_53.w;
    float _127 = float(_107);
    float _129 = 1.0 / _127;
    float _131 = -_125;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_125);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = _133 * _129;
    bool _147 = _133 >= _127;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    out.m_55.x = _145;
    float _153 = _125;
    float _155 = _133;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _153;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2978 = as_type<float>(_161);
        out.gl_Position.z = _2978;
    }
    if (_151)
    {
        return out;
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_60.x;
    float _167 = in.m_60.y;
    float _169 = in.m_60.z;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _207 = !_179;
    float _225;
    if (!_207)
    {
        float _209 = in.m_62.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        _225 = _145;
    }
    _227 = false;
    float _229 = _225;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _229 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = _229 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _229 + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _251;
    bool _255 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _257 = isnan(_229);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _269 = 1.0 / _245;
    float _271 = 1.0 / _253;
    float _273 = 1.0 / _249;
    float _275 = _233 * _269;
    bool _277 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _279 = isnan(_229);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -_265;
    float _291 = _289 + 1.0;
    bool _293 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _295 = isnan(_229);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _287 * _291;
    float _307 = _237 * _271;
    float _309 = -_287;
    float _311 = _309 + 1.0;
    float _313 = _303 * _311;
    float _315 = -_303;
    float _317 = _315 + 1.0;
    float _319 = _241 * _273;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _325 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_229);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = fma(_339, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = _335 * _317;
    float _353 = fma(_343, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _355 = fma(_323, _319, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _357 = fma(_347, _319, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _359 = -_335;
    float _361 = _359 + 1.0;
    float _363 = _349 * _351;
    float _365 = _353 * _351;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _367;
    float _371 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _363);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _373;
    float _377 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _379 = fma(_369, _307, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _381 = fma(_355, _313, _371);
    float _383 = fma(_375, _307, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _385 = fma(_357, _313, _377);
    float _387 = fma(_379, _305, _381);
    float _389 = fma(_383, _305, _385);
    float _391 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[146].x, _387);
    float _393 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[146].y, _389);
    bool _395 = !_267;
    float _413;
    if (!_395)
    {
        float _397 = in.m_62.x;
        float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _401 = _397 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _403 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _405 = _403 * _399;
        float _407 = floor(_405);
        float _409 = -_407;
        float _411 = _405 + _409;
        _413 = _411;
        _415 = true;
    }
    else
    {
        _413 = _145;
    }
    _415 = false;
    float _417 = _413;
    float _419 = in.m_64.x;
    float _421 = in.m_64.y;
    bool _423 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _425 = isnan(_417);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _439 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _441 = isnan(_417);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _417 + _455;
    float _459 = -_433;
    float _461 = _459 + 1.0;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _465 = 1.0 / _437;
    float _467 = _449 * _461;
    float _469 = -_449;
    float _471 = _469 + 1.0;
    float _473 = _393 * _421;
    float _475 = _391 * _419;
    float _477 = _453 * _465;
    float _479 = fma(_477, _457, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _481 = _479 * _467;
    float _483 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[115].x, _481);
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _491 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[116].x, _483);
    float _493 = _485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _499 = _491 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _493;
    out.m_66.y = _495;
    out.m_66.z = _497;
    out.m_66.w = _499;
    bool _501 = !_463;
    float _519;
    if (!_501)
    {
        float _503 = in.m_62.x;
        float _505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _507 = _503 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _511 = _509 * _505;
        float _513 = floor(_511);
        float _515 = -_513;
        float _517 = _511 + _515;
        _519 = _517;
        _521 = true;
    }
    else
    {
        _519 = _145;
    }
    _521 = false;
    float _523 = _519;
    float _525 = in.m_62.x;
    float _527 = in.m_62.y;
    float _529 = in.m_62.z;
    float _531 = in.m_62.w;
    float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _535 = in.m_48.x;
    float _537 = in.m_48.y;
    float _539 = in.m_48.z;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _543 = _541 != 0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _547 = _523 + _545;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _551 = _549 != 0;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _557 = _555 != 0;
    float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _563 = _561 != 0;
    float _565 = _533 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _571 = _525 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _573 = _531 > 0.5;
    float _575 = _527 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _577 = _537 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _581 = _579 != 0;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _585 = _583 != 0;
    float _587 = -_553;
    float _589 = fma(_571, 2.0, _587);
    float _591 = -_199;
    int _593 = _573 ? as_type<int>(_591) : as_type<int>(_199);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _599 = _525 > 0.5;
    float _601 = _529 * 2.0;
    float _603 = fma(_535, (*spvDescriptorSet0.vp_c10)._m0[5].x, _577);
    float _605 = 1.0 / _597;
    float _607 = -_189;
    int _609 = _599 ? as_type<int>(_607) : as_type<int>(_189);
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _615 = _613 != 0;
    float _617 = _537 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _619 = _537 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _621 = !_543;
    float _623 = _621 ? _189 : as_type<float>(_609);
    float _625 = fma(_575, -2.0, _569);
    float _627 = floor(_601);
    float _629 = fma(_535, (*spvDescriptorSet0.vp_c10)._m0[6].x, _619);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _631;
    float _635 = _525 * 2.0;
    float _637 = _527 * 2.0;
    bool _639 = _527 > 0.5;
    float _641 = fma(_535, (*spvDescriptorSet0.vp_c10)._m0[4].x, _617);
    float _643 = _633 * _605;
    float _645 = floor(_635);
    float _647 = -_199;
    int _649 = _639 ? as_type<int>(_647) : as_type<int>(_199);
    float _651 = _527 + _529;
    float _653 = -_133;
    float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[76].x, _589);
    float _657 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[4].z, _641);
    bool _659 = !_551;
    float _661 = _659 ? _199 : as_type<float>(_649);
    float _663 = _651 + (-1.0);
    bool _665 = _529 > 0.5;
    float _667 = floor(_637);
    float _669 = -_189;
    int _671 = _639 ? as_type<int>(_669) : as_type<int>(_189);
    float _673 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _675 = -_189;
    int _677 = _665 ? as_type<int>(_675) : as_type<int>(_189);
    float _679 = _527 + _525;
    bool _681 = _627 >= 0.0;
    bool _683 = isnan(_627);
    bool _685 = _681 || _683;
    bool _687 = isnan(0.0);
    bool _689 = _685 || _687;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _693 = -_199;
    int _695 = _665 ? as_type<int>(_693) : as_type<int>(_199);
    float _697 = _679 + (-1.0);
    bool _699 = !_581;
    float _701 = _699 ? _189 : as_type<float>(_671);
    float _703 = _559 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _705 = !_563;
    float _707 = _705 ? _189 : as_type<float>(_677);
    float _709 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _711 = _645 > 0.0;
    float _713 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[5].z, _603);
    bool _715 = _645 >= 0.0;
    bool _717 = isnan(_645);
    bool _719 = _715 || _717;
    bool _721 = isnan(0.0);
    bool _723 = _719 || _721;
    float _725 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _625);
    int _727 = _689 ? 0 : 1;
    float _729 = _661 + (-0.5);
    bool _731 = !_585;
    float _733 = _731 ? _199 : as_type<float>(_695);
    float _735 = _713 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _737 = _667 > 0.0;
    float _739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _741 = _667 >= 0.0;
    bool _743 = isnan(_667);
    bool _745 = _741 || _743;
    bool _747 = isnan(0.0);
    bool _749 = _745 || _747;
    float _751 = -_733;
    float _753 = _751 + 0.5;
    float _755 = _667;
    float _757 = _539;
    float _759 = _547;
    float _761 = _735;
    if (!_615)
    {
        _755 = _529;
    }
    float _763 = _755;
    float _765 = _657 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _767 = _627 > 0.0;
    float _769 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[6].z, _629);
    float _771 = _763;
    if (_615)
    {
        _771 = _527;
    }
    float _773 = _771;
    float _775 = fma(_643, _547, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _777 = ~_727;
    int _779 = _777 + 1;
    int _781 = _779 + 1;
    float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _785 = _781;
    if (!_615)
    {
        _757 = _527;
    }
    float _787 = _757;
    float _789 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[83].w, _611);
    float _791 = _623 + 0.5;
    float _793 = _787;
    if (!_615)
    {
        _759 = _529;
    }
    float _795 = _759;
    float _797 = _753 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _799 = _795;
    if (_615)
    {
        _793 = _525;
    }
    float _801 = _793;
    float _803 = fma(_565, _791, _655);
    bool _805 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _807 = isnan(_523);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = _739 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_767)
    {
        int _819 = ~_727;
        int _821 = _819 + 1;
        _785 = _821;
    }
    int _823 = _785;
    float _825 = _801 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _827 = -_815;
    float _829 = _827 + 1.0;
    bool _831 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _833 = isnan(_523);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = _769 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_615)
    {
        _799 = _527;
    }
    float _845 = _799;
    float _847 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _849 = log2(_847);
    int _851 = _723 ? 0 : 1;
    float _853 = _841 * _829;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _857 = _855 != 0;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _861 = _859 != 0;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _865 = _863 != 0;
    float _867 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _789);
    float _869 = _775 * _853;
    float _871 = -_691;
    float _873 = fma(_825, 2.0, _871);
    float _875 = -_841;
    float _877 = _875 + 1.0;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _883 = !_557;
    float _885 = _883 ? _199 : as_type<float>(_593);
    float _887 = -_133;
    float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[81].x, _873);
    float _891 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[83].z, _879);
    float _893 = -_703;
    float _895 = -_725;
    float _897 = fma(_893, _729, _895);
    float _899 = _701 + 0.5;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _903 = _845 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _905 = _707 + 0.5;
    float _907 = _899 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _909 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[131].x, _869);
    float _911 = fma(_903, -2.0, _901);
    float _913 = _885 + (-0.5);
    float _915 = _907 * _567;
    float _917 = _783 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _919 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _911);
    float _921 = fma(_817, _905, _889);
    bool _923 = !_857;
    int _925 = _923 ? 0 : 1;
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _929 = _735 + _927;
    float _931 = _797 * _881;
    float _933 = -_917;
    float _935 = -_919;
    float _937 = fma(_933, _913, _935);
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _941 = _765 + _939;
    int _943 = abs(_925);
    float _945 = _929 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _947 = _749 ? 0 : 1;
    out.m_68.x = _915;
    out.m_68.y = _931;
    float _949 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _891);
    int _951 = ~_947;
    int _953 = _951 + 1;
    int _955 = _953 + 1;
    float _957 = _849 * _133;
    int _959 = _955;
    if (!_737)
    {
        int _961 = ~_947;
        int _963 = _961 + 1;
        _959 = _963;
    }
    int _965 = _959;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _969 = -_949;
    float _971 = _969 + 1.0;
    int _973 = ~_851;
    int _975 = _973 + 1;
    int _977 = _975 + 1;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _983 = _843 + _981;
    float _985 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[28].x, _945);
    float _987 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[78].z, _967);
    float _989 = -_971;
    float _991 = fma(_707, _989, _921);
    bool _993 = !_861;
    int _995 = _993 ? 0 : 1;
    float _997 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[28].z, _985);
    float _999 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[78].w, _979);
    float _1001 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _987);
    int _1003 = abs(_995);
    float _1005 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[132].x, _909);
    float _1007 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _999);
    float _1009 = -_1001;
    float _1011 = _1009 + 1.0;
    bool _1013 = _997 >= 0.0;
    float _1015 = _929 * _929;
    float _1017 = -_1007;
    float _1019 = _1017 + 1.0;
    float _1021 = -_1011;
    float _1023 = fma(_623, _1021, _803);
    float _1025 = fma(_941, _941, _1015);
    float _1027 = fma(_661, _1019, _897);
    int _1029 = _977;
    if (!_711)
    {
        int _1031 = ~_851;
        int _1033 = _1031 + 1;
        _1029 = _1033;
    }
    int _1035 = _1029;
    float _1037 = in.m_70.x;
    float _1039 = in.m_70.y;
    float _1041 = in.m_70.z;
    float _1043 = float(_823);
    float _1045 = fma(_983, _983, _1025);
    float _1047 = float(_943);
    float _1049 = exp2(_957);
    bool _1051 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1053 = isnan(1.0);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1059 = _1055 || _1057;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1063 = 1.0 + _1061;
    float _1065 = _1047 * _1043;
    float _1067 = -_867;
    float _1069 = _1067 + 1.0;
    if (_1013)
    {
        out.m_51.x = 0.0;
    }
    float _1071 = 1.0 / _1063;
    float _1073 = fma(_885, _1069, _937);
    float _1075 = _1065 * (-2.0);
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1081 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1083 = isnan(0.0);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1089 = _1085 || _1087;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1093 = rsqrt(_1045);
    float _1095 = _1005 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1097 = float(_1035);
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1101 = float(_1003);
    float _1103 = fma(_1075, _1037, _1037);
    float _1105 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1107 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1109 = fma(_709, _1075, _709);
    float _1111 = _1101 * _1097;
    float _1113 = _1097;
    if (_1013)
    {
        _1113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1115 = _1113;
    float _1117 = -_1049;
    float _1119 = _1117 + 1.0;
    out.m_72.x = _1099;
    out.m_72.y = _1105;
    out.m_72.z = _1107;
    out.m_72.w = _1095;
    float _1121 = _1111 * (-2.0);
    int _1123 = as_type<int>(_1115);
    if (_1013)
    {
        float _1125 = _1115 * 5.0;
        _1123 = as_type<int>(_1125);
    }
    int _1127 = _1123;
    float _1129 = fma(_673, _1121, _673);
    float _1131 = fma(_1121, _1039, _1039);
    float _1133 = _929 * _1093;
    float _1135 = _1089 ? _1119 : 0.0;
    out.m_74.x = _1023;
    out.m_74.y = _1027;
    out.m_74.z = _991;
    out.m_74.w = _1073;
    float _1137 = -_1133;
    float _1139 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[18].w, _929);
    if (_1013)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4583 = as_type<float>(_1127);
        out.gl_Position.z = _4583;
    }
    float _1141 = _525 + (-0.5);
    if (_1059)
    {
        float _1143 = _1135 * _1071;
        _155 = _1143;
    }
    float _1145 = _155;
    float _1147 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1103);
    float _1149 = _1139 * _1139;
    float _1151 = _941 * _1093;
    bool _1153 = !_865;
    int _1155 = _1153 ? 0 : 1;
    float _1157 = -_1151;
    float _1159 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[18].w, _941);
    float _1161 = _1151;
    if (_1013)
    {
        return out;
    }
    float _1163 = -_1133;
    float _1165 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _1167 = _983 * _1093;
    float _1169 = -_1151;
    float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[18].w, _765);
    float _1173 = fma(_1159, _1159, _1149);
    float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1177 = _1165 + _1175;
    float _1179 = -_1167;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[18].w, _843);
    float _1183 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1185 = _1171 + _1183;
    int _1187 = abs(_1155);
    float _1189 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1193 = _1181 + _1191;
    float _1195 = fma(_1109, _1145, _1147);
    float _1197 = _527 + (-0.5);
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1189);
    float _1201 = _1195 * 0.15915493667125701904296875;
    float _1203 = float(_965);
    float _1205 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1199);
    float _1207 = float(_1187);
    float _1209 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1131);
    float _1211 = -_1167;
    float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[18].w, _983);
    float _1215 = _529 + _525;
    bool _1217 = _1205 >= 0.0;
    float _1219 = _1207 * _1203;
    float _1221 = fma(_1129, _1145, _1209);
    float _1223 = fma(_1213, _1213, _1173);
    float _1225 = _1215 + (-1.0);
    float _1227 = _1219 * (-2.0);
    float _1229 = _1221 * 0.15915493667125701904296875;
    float _1231 = _529 + (-0.5);
    float _1233 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1235 = fma(_1227, _1041, _1041);
    float _1237 = sqrt(_1223);
    float _1239 = _1219;
    int _1241 = as_type<int>(_1231);
    float _1243 = _1167;
    float _1245 = _1185;
    if (_1217)
    {
        _1239 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1247 = _1239;
    float _1249 = fma(_1233, _1227, _1233);
    float _1251 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1235);
    if (_1217)
    {
        out.m_51.x = 0.0;
    }
    if (_1217)
    {
        float _1253 = _1247 * 5.0;
        _1241 = as_type<int>(_1253);
    }
    int _1255 = _1241;
    float _1257 = _1201 * 6.283185482025146484375;
    float _1259 = sin(_1257);
    float _1261 = fma(_1249, _1145, _1251);
    if (_1217)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4792 = as_type<float>(_1255);
        out.gl_Position.z = _4792;
    }
    float _1263 = _1261 * 0.15915493667125701904296875;
    float _1265 = _1201 * 6.283185482025146484375;
    float _1267 = cos(_1265);
    float _1269 = _1229 * 6.283185482025146484375;
    float _1271 = sin(_1269);
    float _1273 = _1229 * 6.283185482025146484375;
    float _1275 = cos(_1273);
    if (_1217)
    {
        return out;
    }
    float _1277 = _1263 * 6.283185482025146484375;
    float _1279 = cos(_1277);
    float _1281 = _1093 * _1237;
    float _1283 = _473 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1285 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1287 = _475 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1289 = _1267 * _1275;
    float _1291 = _1281 * _1283;
    float _1293 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1295 = _1263 * 6.283185482025146484375;
    float _1297 = sin(_1295);
    float _1299 = _1281 * _1287;
    float _1301 = _1285 * _1291;
    float _1303 = _1259 * _1271;
    float _1305 = _1267 * _1271;
    float _1307 = _1259 * _1275;
    float _1309 = _1293 * _1299;
    float _1311 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1313 = _1311 * 0.5;
    float _1315 = _1267 * _1279;
    float _1317 = _1275 * _1279;
    float _1319 = _1259 * _1279;
    float _1321 = _1271 * _1279;
    float _1323 = _1315 * _1301;
    float _1325 = _1319 * _1301;
    float _1327 = fma(_1297, _1289, _1303);
    float _1329 = -_1307;
    float _1331 = fma(_1297, _1305, _1329);
    float _1333 = -_1301;
    float _1335 = _1297 * _1333;
    float _1337 = fma(_1297, _1303, _1289);
    float _1339 = fma(_1327, _1309, _1323);
    float _1341 = -_1305;
    float _1343 = fma(_1297, _1307, _1341);
    float _1345 = fma(_1317, _1309, _1335);
    float _1347 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1349 = fma(_1331, _1313, _1339);
    float _1351 = fma(_1343, _1309, _1325);
    float _1353 = fma(_1321, _1313, _1345);
    float _1355 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1357 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1359 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1361 = fma(_1337, _1313, _1351);
    float _1363 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1365 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1357);
    float _1367 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1359);
    float _1369 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1371 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1363);
    float _1373 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1365);
    float _1375 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1367);
    float _1377 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1355);
    float _1379 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1371);
    float _1381 = _1373 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1383 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1385 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1369);
    float _1387 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1347);
    float _1389 = _765 + _1381;
    float _1391 = _843 + _1383;
    float _1393 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1395 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1397 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1399 = _1389 + _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1403 = _1391 + _1401;
    float _1405 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1407 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1409 = _1399 * _1399;
    float _1411 = _1403 * _1403;
    float _1413 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1415 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1417 = _735 + _1393;
    float _1419 = _1409 + _1411;
    float _1421 = -_1297;
    float _1423 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1395);
    float _1425 = -_1297;
    float _1427 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1405);
    float _1429 = -_1297;
    float _1431 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1407);
    float _1433 = sqrt(_1419);
    float _1435 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1437 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1377);
    float _1439 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1385);
    float _1441 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1387);
    float _1443 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1413);
    float _1445 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1415);
    float _1447 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1435);
    bool _1449 = _1433 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1451 = _1331;
    float _1453 = _1409;
    float _1455 = _1411;
    float _1457 = _1389;
    float _1459 = _1391;
    if (!_1449)
    {
        _1451 = _1417;
    }
    float _1461 = _1451;
    bool _1463 = !_1449;
    float _1465 = _1461;
    if (!_1463)
    {
        float _1467 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1471 = _1433 + _1469;
        float _1473 = rsqrt(_1419);
        float _1475 = _1471 * _1467;
        float _1477 = _1417 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = _1475 * 0.15915493667125701904296875;
        float _1481 = _1479 * 6.283185482025146484375;
        float _1483 = sin(_1481);
        float _1485 = _1479 * 6.283185482025146484375;
        float _1487 = cos(_1485);
        float _1489 = fma(_1483, _1477, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1491 = _1473 * _1489;
        float _1493 = fma(_1399, _1491, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1495 = _1487 + (-1.0);
        float _1497 = fma(_1403, _1491, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1501 = _1493 + _1499;
        float _1503 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1507 = _1497 + _1505;
        float _1509 = _1501 * _1501;
        float _1511 = fma(_1417, _1487, _1503);
        float _1513 = _1507 * _1507;
        _1465 = _1511;
        _1453 = _1509;
        _1455 = _1513;
        _1457 = _1493;
        _1459 = _1497;
    }
    float _1515 = _1465;
    float _1517 = _1453;
    float _1519 = _1455;
    float _1521 = _1457;
    float _1523 = _1459;
    float _1525 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1527 = _1515 + _1525;
    float _1529 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1423);
    float _1531 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1427);
    float _1533 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1535 = fma(_1527, _1527, _1517);
    float _1537 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1431);
    float _1539 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1541 = _1533 * _1529;
    float _1543 = _1535 + _1519;
    float _1545 = _1533 * _1531;
    float _1547 = _1533 * _1537;
    float _1549 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1443);
    float _1551 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1445);
    float _1553 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1447);
    float _1555 = sqrt(_1543);
    float _1557 = fma(_1539, _1437, _1541);
    float _1559 = fma(_1539, _1439, _1545);
    float _1561 = fma(_1539, _1441, _1547);
    float _1563 = _1549 + _1557;
    float _1565 = _1551 + _1559;
    float _1567 = _1553 + _1561;
    out.m_76.x = _1563;
    out.m_76.y = _1565;
    out.m_76.z = _1567;
    bool _1569 = _1555 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1571 = isnan(_1555);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1577 = _1573 || _1575;
    float _1579 = _1531;
    if (!_1577)
    {
        _1579 = 1.0;
    }
    float _1581 = _1579;
    bool _1583 = !_1577;
    float _1585 = _1581;
    if (!_1583)
    {
        bool _1587 = _1555 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1589 = isnan(_1555);
        bool _1591 = _1587 || _1589;
        bool _1593 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1595 = _1591 || _1593;
        if (!_1595)
        {
            float _1597 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1599 = _1555 + _1597;
            float _1601 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1603 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1601;
            float _1605 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1607 = _1605 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1609 = 1.0 / _1603;
            float _1611 = _1599 * _1609;
            float _1613 = fma(_1611, _1607, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1585 = _1613;
            _1615 = true;
        }
        else
        {
            bool _1617 = _1555 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1619 = isnan(_1555);
            bool _1621 = _1617 || _1619;
            bool _1623 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1625 = _1621 || _1623;
            if (!_1625)
            {
                float _1627 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1629 = _1555 + _1627;
                float _1631 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1633 = _1631 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1635 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1637 = _1635 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1639 = 1.0 / _1633;
                float _1641 = _1629 * _1639;
                float _1643 = fma(_1641, _1637, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1585 = _1643;
                _1615 = true;
            }
            else
            {
                _1585 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1615 = false;
    float _1645 = _1585;
    float _1647 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1649 = _1515 + _1647;
    float _1651 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1653 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1655 = _1521 + _1653;
    float _1657 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1659 = _1523 + _1657;
    float _1661 = fma(_1649, _1645, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1663 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1651);
    float _1665 = fma(_1655, _1645, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1667 = fma(_1659, _1645, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1669 = -_735;
    float _1671 = _1669 + _1661;
    float _1673 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1663);
    float _1675 = -_765;
    float _1677 = _1675 + _1665;
    float _1679 = -_843;
    float _1681 = _1679 + _1667;
    float _1683 = _1671 * _1671;
    float _1685 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1687 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1689 = fma(_1677, _1677, _1683);
    float _1691 = 1.0 / _1685;
    float _1693 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1687);
    float _1695 = fma(_1681, _1681, _1689);
    float _1697 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1693);
    float _1699 = sqrt(_1695);
    float _1701 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1703 = _1701 + _1685;
    float _1705 = _1703 * _1691;
    float _1707 = _1705 * 0.5;
    bool _1709 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan(0.5);
    bool _1717 = _1713 || _1715;
    bool _1719 = _1699 > 0.0;
    float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1723 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1721);
    bool _1725 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1727 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1729 = _1725 || _1727;
    bool _1731 = isnan(0.5);
    bool _1733 = _1729 || _1731;
    float _1735 = 1.0 / _1723;
    float _1737 = _1691;
    float _1739 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1741 = _1667;
    if (!_1719)
    {
        _1737 = _1665;
    }
    float _1743 = _1737;
    float _1745 = _1743;
    float _1747 = _1743;
    if (!_1719)
    {
        _1739 = _1661;
    }
    float _1749 = _1739;
    bool _1751 = !_1719;
    float _1753 = _1749;
    float _1755 = _1735;
    if (!_1751)
    {
        float _1757 = _203 * _203;
        float _1759 = fma(_201, _201, _1757);
        float _1761 = fma(_205, _205, _1759);
        float _1763 = rsqrt(_1695);
        float _1765 = sqrt(_1761);
        float _1767 = _1677 * _1763;
        float _1769 = _1671 * _1763;
        float _1771 = _1681 * _1763;
        bool _1773 = _1765 > 0.0;
        float _1775 = _1765;
        if (!_1773)
        {
            _1745 = _1665;
        }
        float _1777 = _1745;
        _1747 = _1777;
        if (!_1773)
        {
            _1775 = _1661;
        }
        float _1779 = _1775;
        bool _1781 = !_1773;
        _1753 = _1779;
        if (!_1781)
        {
            float _1783 = rsqrt(_1761);
            float _1785 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1787 = _203 * _1783;
            float _1789 = _201 * _1783;
            float _1791 = _1769 * _1787;
            float _1793 = _205 * _1783;
            float _1795 = fma(_1767, _1789, _1791);
            float _1797 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1799 = fma(_1771, _1793, _1795);
            float _1801 = _1799 * _1797;
            float _1803 = fma(_201, _1801, _1665);
            float _1805 = fma(_203, _1801, _1661);
            float _1807 = fma(_205, _1801, _1667);
            _1747 = _1803;
            _1741 = _1807;
            _1753 = _1805;
        }
    }
    float _1809 = _1747;
    float _1811 = _1741;
    float _1813 = _1753;
    float _1815 = -_1151;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1809);
    float _1819 = -_1167;
    float _1821 = fma(_1819, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1811);
    float _1823 = -_1133;
    float _1825 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1813);
    float _1827 = _1825;
    float _1829 = _1821;
    if (_1717)
    {
        _1161 = 1.0;
    }
    float _1831 = _1161;
    float _1833 = _1831;
    if (_1733)
    {
        _1243 = _1817;
    }
    float _1835 = _1243;
    float _1837 = _1835;
    if (!_1733)
    {
        float _1839 = _1177 * _1177;
        float _1841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1843 = -_843;
        float _1845 = _1843 + _1811;
        float _1847 = -_735;
        float _1849 = _1847 + _1813;
        float _1851 = fma(_1185, _1185, _1839);
        float _1853 = fma(_1193, _1193, _1851);
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1857 = sqrt(_1853);
        float _1859 = 1.0 / _1281;
        float _1861 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1863 = precise::min(_1857, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1865 = _1863 * _1841;
        float _1867 = _1865 * _1859;
        float _1869 = -_765;
        float _1871 = _1869 + _1809;
        float _1873 = _1861 * _1867;
        float _1875 = _1845 * _1867;
        float _1877 = fma(_1849, _1873, _1165);
        float _1879 = fma(_1871, _1873, _1171);
        float _1881 = fma(_1861, _1875, _1181);
        _1245 = _1857;
        _1827 = _1877;
        _1837 = _1879;
        _1829 = _1881;
        _761 = _1849;
    }
    float _1883 = _1245;
    float _1885 = _1827;
    float _1887 = _1837;
    float _1889 = _1829;
    float _1891 = _761;
    float _1893 = _1891;
    float _1895 = _1883;
    if (_1717)
    {
        _1893 = 1.0;
    }
    float _1897 = _1893;
    float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1901 = _1735 * _1899;
    float _1903 = _1897;
    if (!_1717)
    {
        float _1905 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1907 = _1905 * 0.15915493667125701904296875;
        float _1909 = _1907 * 6.283185482025146484375;
        float _1911 = cos(_1909);
        float _1913 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1915 = _1913 * 0.15915493667125701904296875;
        float _1917 = _1907 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        float _1921 = 1.0 / _1911;
        float _1923 = _1915 * 6.283185482025146484375;
        float _1925 = cos(_1923);
        float _1927 = _1919 * _1921;
        float _1929 = _1915 * 6.283185482025146484375;
        float _1931 = sin(_1929);
        float _1933 = _1925 * _1927;
        float _1935 = 1.0 / _1933;
        float _1937 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1939 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1937;
        float _1941 = 1.0 / _1939;
        float _1943 = _1931 * _1935;
        float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1947 = fma(_1901, _1943, _1945);
        float _1949 = _1947 * _1941;
        float _1951 = precise::clamp(_1949, 0.0, 1.0);
        _1895 = _1915;
        _1833 = _1951;
    }
    float _1953 = _1895;
    float _1955 = _1833;
    float _1957 = _1953;
    if (!_1717)
    {
        float _1959 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1961 = _1959 * 0.15915493667125701904296875;
        float _1963 = _1961 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        float _1967 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1969 = _1967 * 0.15915493667125701904296875;
        float _1971 = _1961 * 6.283185482025146484375;
        float _1973 = sin(_1971);
        float _1975 = 1.0 / _1965;
        float _1977 = _1969 * 6.283185482025146484375;
        float _1979 = cos(_1977);
        float _1981 = _1973 * _1975;
        float _1983 = _1969 * 6.283185482025146484375;
        float _1985 = sin(_1983);
        float _1987 = _1979 * _1981;
        float _1989 = 1.0 / _1987;
        float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1993 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1991;
        float _1995 = 1.0 / _1993;
        float _1997 = _1985 * _1989;
        float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2001 = fma(_1901, _1997, _1999);
        float _2003 = _2001 * _1995;
        float _2005 = precise::clamp(_2003, 0.0, 1.0);
        float _2007 = -_2005;
        float _2009 = _2007 + 1.0;
        _1957 = _1989;
        _1903 = _2009;
    }
    float _2011 = _1957;
    float _2013 = _1903;
    float _2015 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2017 = _1885 + _2015;
    float _2019 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2021 = _1887 + _2019;
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2025 = _1889 + _2023;
    float _2027 = _2017 * _2017;
    float _2029 = fma(_2021, _2021, _2027);
    float _2031 = fma(_2025, _2025, _2029);
    float _2033 = rsqrt(_2031);
    float _2035 = _2033 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2037 = _2021 * _2035;
    float _2039 = _2025 * _2035;
    float _2041 = _2037 * _2037;
    float _2043 = _2039 * _2039;
    float _2045 = _2041 + _2043;
    float _2047 = sqrt(_2045);
    bool _2049 = _2047 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2053 = _2047 + _2051;
    float _2055 = _2033;
    float _2057 = _2045;
    float _2059 = _2053;
    float _2061 = _2011;
    float _2063 = _2017;
    float _2065 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2049)
    {
        float _2067 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2055 = _2067;
    }
    float _2069 = _2055;
    if (_2049)
    {
        float _2071 = rsqrt(_2045);
        _2057 = _2071;
    }
    float _2073 = _2057;
    float _2075 = _2073;
    if (_2049)
    {
        float _2077 = _2053 * _2069;
        _2059 = _2077;
    }
    float _2079 = _2059;
    if (_2049)
    {
        float _2081 = _2079 * 0.15915493667125701904296875;
        _1755 = _2081;
    }
    float _2083 = _1755;
    float _2085 = _2069;
    float _2087 = _2083;
    if (_2049)
    {
        float _2089 = _2083 * 6.283185482025146484375;
        float _2091 = sin(_2089);
        _2085 = _2091;
    }
    float _2093 = _2085;
    float _2095 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2097 = precise::max(0.0, _2095);
    float _2099 = _2025;
    float _2101 = _2097;
    if (_2049)
    {
        float _2103 = _2083 * 6.283185482025146484375;
        float _2105 = cos(_2103);
        _2099 = _2105;
    }
    float _2107 = _2099;
    float _2109 = -_2035;
    float _2111 = -_2097;
    float _2113 = fma(_2017, _2109, _2111);
    if (_2049)
    {
        float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2101 = _2115;
    }
    float _2117 = _2101;
    if (!_2049)
    {
        _2087 = _2037;
    }
    float _2119 = _2087;
    float _2121 = _2093;
    float _2123 = _2119;
    if (_2049)
    {
        float _2125 = fma(_2093, _2117, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2061 = _2125;
    }
    float _2127 = _2061;
    float _2129 = fma(_1171, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2131 = _2127;
    if (!_2049)
    {
        _2121 = _2039;
    }
    float _2133 = _2121;
    float _2135 = sqrt(_2031);
    float _2137 = _2133;
    float _2139 = _2107;
    if (_2049)
    {
        float _2141 = _2107 + (-1.0);
        _2063 = _2141;
    }
    float _2143 = _2063;
    float _2145 = _2143;
    if (_2049)
    {
        float _2147 = _2073 * _2127;
        _2065 = _2147;
    }
    float _2149 = _2065;
    if (!_2049)
    {
        _2131 = _2113;
    }
    float _2151 = _2131;
    float _2153 = _2151;
    if (_2049)
    {
        float _2155 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2145 = _2155;
    }
    float _2157 = _2145;
    if (_2049)
    {
        float _2159 = _2037 * _2149;
        _2123 = _2159;
    }
    float _2161 = _2123;
    if (!_2049)
    {
        _2075 = _2041;
    }
    float _2163 = _2075;
    float _2165 = _2163;
    if (_2049)
    {
        float _2167 = _2039 * _2149;
        _2137 = _2167;
    }
    float _2169 = _2137;
    if (_2049)
    {
        float _2171 = fma(_2113, _2107, _2157);
        _2153 = _2171;
    }
    float _2173 = _2153;
    if (_2049)
    {
        float _2175 = _2161 * _2161;
        _2165 = _2175;
    }
    float _2177 = _2165;
    if (!_2049)
    {
        _2139 = _2043;
    }
    float _2179 = _2139;
    float _2181 = _2179;
    if (_2049)
    {
        float _2183 = _2169 * _2169;
        _2181 = _2183;
    }
    float _2185 = _2181;
    float _2187 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2189 = fma(_2173, _2173, _2177);
    float _2191 = floor(_2129);
    float _2193 = _2189 + _2185;
    float _2195 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2187);
    float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2199 = fma(_2135, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2197);
    float _2201 = precise::clamp(_2199, 0.0, 1.0);
    float _2203 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2205 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2195);
    float _2207 = rsqrt(_2193);
    float _2209 = -_2201;
    float _2211 = _2209 + 1.0;
    float _2213 = fma(_1181, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2215 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2217 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2219 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2221 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2223 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2217);
    float _2225 = abs(_2211);
    float _2227 = log2(_2225);
    float _2229 = -_2221;
    float _2231 = fma(_2229, _2203, 1.0);
    float _2233 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2235 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2223);
    float _2237 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2219);
    float _2239 = _2207 * _2161;
    float _2241 = _2207 * _2173;
    float _2243 = _2207 * _2169;
    float _2245 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2233);
    float _2247 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2249 = _2235 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2251 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2237);
    float _2253 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2245);
    float _2255 = -_2247;
    float _2257 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2255);
    float _2259 = _2249 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2261 = floor(_2213);
    float _2263 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2265 = -_2243;
    float _2267 = fma(_2265, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2257);
    float _2269 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2271 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2273 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2259);
    float _2275 = fma(_2267, -0.5, 0.5);
    float _2277 = fma(_2267, 0.5, 0.5);
    float _2279 = log2(_2231);
    float _2281 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2273);
    float _2283 = _2249 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2285 = _2241 + 1.0;
    float _2287 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2281);
    float _2289 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2283);
    float _2291 = exp2(_2271);
    float _2293 = -_2191;
    float _2295 = _2129 + _2293;
    float _2297 = _2249 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2299 = -_2261;
    float _2301 = _2213 + _2299;
    float _2303 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2289);
    float _2305 = fma(_2277, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2307 = 1.0 / _2287;
    float _2309 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2297);
    float _2311 = _2279 * 0.693147182464599609375;
    float _2313 = fma(_2277, _2305, -0.212114393711090087890625);
    float _2315 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2309);
    float _2317 = sqrt(_2275);
    float _2319 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2315);
    float _2321 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2303);
    float _2323 = -_2241;
    float _2325 = fma(_2291, _2285, _2323);
    float2 _6526 = float2(_2295, _2301);
    float _2327 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6526, float2(0.0), isnan(_6526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6526, float2(0.0), isnan(_6526)), level(0.0)).x;
    float _2329 = fma(_2277, _2313, 1.570728778839111328125);
    float _2331 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2333 = fma(_2325, 0.5, 0.5);
    float _2335 = _2319 * _2307;
    float _2337 = _2321 * _2307;
    float _2339 = fma(_2335, 0.5, 0.5);
    float _2341 = fma(_2337, -0.5, 0.5);
    float _2343 = _2317 * 0.636619746685028076171875;
    float _2345 = -_2329;
    float _2347 = fma(_2343, _2345, 1.0);
    float3 _6565 = float3(_2339, _2341, _2331);
    float _2349 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6565, float3(0.0), isnan(_6565)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6565, float3(0.0), isnan(_6565)), level(0.0)).x;
    float3 _6576 = float3(_2339, _2341, _2331);
    float4 _2352 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6576, float3(0.0), isnan(_6576)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6576, float3(0.0), isnan(_6576)), level(0.0)).xyzw;
    float _2354 = _2352.x;
    float _2356 = _2352.y;
    float _2358 = _2352.z;
    float _2360 = _2352.w;
    float2 _6592 = float2(_2347, _2333);
    float3 _2364 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6592, float2(0.0), isnan(_6592)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6592, float2(0.0), isnan(_6592)), level(0.0)).xyz;
    float _2366 = _2364.x;
    float _2368 = _2364.y;
    float _2370 = _2364.z;
    float _2372 = abs(_1901);
    float _2374 = log2(_2372);
    bool _2376 = _2135 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2378 = isnan(_2135);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2384 = _2380 || _2382;
    float _2386 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2388 = exp2(_2386);
    float _2390 = _2249 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2392 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2390);
    float _2394 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2396 = in.m_78.x;
    float _2398 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2392);
    float _2400 = exp2(_2394);
    float _2402 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2398);
    bool _2404 = _1901 <= 8000.0;
    bool _2406 = isnan(_1901);
    bool _2408 = _2404 || _2406;
    bool _2410 = isnan(8000.0);
    bool _2412 = _2408 || _2410;
    float _2414 = float(_2412);
    float _2416 = _2287 * 0.5;
    float _2418 = fma(_2388, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2420 = precise::clamp(_2418, 0.0, 1.0);
    float _2422 = _2402 + _2287;
    float _2424 = _2319 + _2287;
    float _2426 = fma(_2321, -0.5, _2416);
    float _2428 = fma(_2420, -2.0, 3.0);
    float _2430 = _2420 * _2420;
    float _2432 = _2422 * 0.5;
    float _2434 = _2424 * 0.5;
    float _2436 = _2430 * _2428;
    out.gl_Position.x = _2319;
    out.gl_Position.y = _2321;
    out.gl_Position.z = _2402;
    out.gl_Position.w = _2287;
    float _2438 = -_2400;
    float _2440 = _2438 + 1.0;
    float _2442 = -_2436;
    float _2444 = _2442 + 1.0;
    out.m_80.x = _2434;
    out.m_80.y = _2426;
    out.m_80.z = _2432;
    out.m_80.w = _2287;
    float _2446 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2448 = fma(_2444, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2436);
    float _2450 = _2414 * _2448;
    float _2452 = _1955 * _2013;
    float _2454 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2456 = _2287;
    float _2458 = _2402;
    float _2460 = _2321;
    float _2462 = _2452;
    if (!_2384)
    {
        _2456 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2464 = _2456;
    float _2466 = _2464;
    float _2468 = _2464;
    if (!_2384)
    {
        _2458 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2470 = _2458;
    float _2472 = _2470;
    float _2474 = _2470;
    if (!_2384)
    {
        _2460 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2476 = _2460;
    float _2478 = -_2327;
    float _2480 = _2478 + 1.0;
    float _2482 = _2480 * _2454;
    float _2484 = precise::clamp(_2482, 0.0, 1.0);
    float _2486 = -_2484;
    float _2488 = fma(_2486, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2490 = _2488 * _2396;
    float _2492 = _2446 * _2349;
    float _2494 = -_2446;
    float _2496 = _2494 + 1.0;
    float _2498 = _2360 * _2492;
    float _2500 = _2370 * _2492;
    float _2502 = _2360 * _2496;
    float _2504 = _2496;
    float _2506 = _2490;
    float _2508 = _2476;
    float _2510 = _2476;
    if (!_2384)
    {
        _2504 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2512 = _2504;
    float _2514 = fma(_2366, _2498, _2354);
    float _2516 = fma(_2368, _2498, _2356);
    float _2518 = _2490 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2520 = fma(_2360, _2500, _2358);
    float _2522 = _2452 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2524 = _2512;
    float _2526 = _2512;
    if (!_2384)
    {
        _2506 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2528 = _2506;
    out.m_82.x = _2518;
    float _2530 = _2528;
    float _2532 = _2528;
    if (!_2384)
    {
        _2462 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2534 = _2462;
    out.m_84.x = _2514;
    out.m_84.y = _2516;
    out.m_84.z = _2520;
    out.m_84.w = _2502;
    bool _2536 = !_2384;
    float _2538 = _2534;
    float _2540 = _2534;
    if (!_2536)
    {
        bool _2542 = _2135 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2544 = isnan(_2135);
        bool _2546 = _2542 || _2544;
        bool _2548 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2550 = _2546 || _2548;
        if (!_2550)
        {
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2554 = _2135 + _2552;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2558 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2556;
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2564 = 1.0 / _2558;
            float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2582 = _2554 * _2564;
            float _2584 = precise::clamp(_2582, 0.0, 1.0);
            float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2590 = fma(_2584, _2562, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2592 = fma(_2584, _2588, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2594 = fma(_2584, _2568, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2596 = fma(_2584, _2572, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2598 = fma(_2584, _2576, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2600 = fma(_2584, _2580, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2526 = _2594;
            _2510 = _2598;
            _2532 = _2590;
            _2474 = _2596;
            _2468 = _2592;
            _2540 = _2600;
            _2602 = true;
        }
        else
        {
            bool _2604 = _2135 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2606 = isnan(_2135);
            bool _2608 = _2604 || _2606;
            bool _2610 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2612 = _2608 || _2610;
            if (!_2612)
            {
                _2530 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2614 = _2530;
            _2532 = _2614;
            if (!_2612)
            {
                _2524 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2616 = _2524;
            _2526 = _2616;
            if (!_2612)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2618 = _2466;
            _2468 = _2618;
            if (!_2612)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2620 = _2472;
            _2474 = _2620;
            if (!_2612)
            {
                _2508 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2622 = _2508;
            _2510 = _2622;
            if (!_2612)
            {
                _2538 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2624 = _2538;
            bool _2626 = !_2612;
            _2540 = _2624;
            if (!_2626)
            {
                bool _2628 = _2135 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2630 = isnan(_2135);
                bool _2632 = _2628 || _2630;
                bool _2634 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2636 = _2632 || _2634;
                if (!_2636)
                {
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2640 = _2135 + _2638;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2644 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2642;
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2650 = 1.0 / _2644;
                    float _2652 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2668 = _2640 * _2650;
                    float _2670 = precise::clamp(_2668, 0.0, 1.0);
                    float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2676 = fma(_2670, _2648, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2678 = fma(_2670, _2674, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2680 = fma(_2670, _2654, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2682 = fma(_2670, _2658, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2684 = fma(_2670, _2662, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2686 = fma(_2670, _2666, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2526 = _2680;
                    _2510 = _2684;
                    _2532 = _2676;
                    _2474 = _2682;
                    _2468 = _2678;
                    _2540 = _2686;
                    _2602 = true;
                }
                else
                {
                    _2526 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2510 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2532 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2540 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2602 = false;
    float _2688 = _2526;
    float _2690 = _2510;
    float _2692 = _2532;
    float _2694 = _2474;
    float _2696 = _2468;
    float _2698 = _2540;
    float _2700 = _2522 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2702 = fma(_1565, -0.5, 0.5);
    float _2704 = precise::clamp(_2702, 0.0, 1.0);
    float _2706 = -_2688;
    float _2708 = _2706 + _2690;
    float _2710 = -_2692;
    float _2712 = _2710 + _2694;
    out.m_51.x = _2700;
    float _2714 = fma(_2704, _2708, _2688);
    float _2716 = -_2696;
    float _2718 = _2716 + _2698;
    float _2720 = fma(_2704, _2712, _2692);
    float _2722 = _2714 * 0.586610972881317138671875;
    bool _2724 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2726 = fma(_2704, _2718, _2696);
    out.m_86.x = 0.0;
    float _2728 = fma(_2720, 0.298911988735198974609375, _2722);
    bool _2730 = _1955 > 0.0;
    bool _2732 = isnan(_1955);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan(0.0);
    bool _2738 = _2734 || _2736;
    float _2740 = fma(_2726, 0.114477999508380889892578125, _2728);
    bool _2742 = _2013 <= 0.0;
    bool _2744 = !_2738;
    bool _2746 = _2742 || _2744;
    float _2748 = -_2740;
    float _2750 = _2720 + _2748;
    float _2752 = -_2740;
    float _2754 = _2714 + _2752;
    float _2756 = -_2740;
    float _2758 = _2726 + _2756;
    float _2760 = fma(_2750, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2740);
    float _2762 = fma(_2754, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2740);
    float _2764 = fma(_2758, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2740);
    bool _2766 = !_2724;
    if (!_2766)
    {
        float _2768 = -_1885;
        float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2772 = -_1887;
        float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2776 = -_1889;
        float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2780 = _2770 * _2770;
        float _2782 = fma(_2774, _2774, _2780);
        float _2784 = fma(_2778, _2778, _2782);
        float _2786 = sqrt(_2784);
        float _2788 = rsqrt(_2784);
        float _2790 = -_2786;
        float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2794 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2796 = precise::clamp(_2794, 0.0, 1.0);
        float _2798 = _2774 * _2788;
        float _2800 = _2770 * _2788;
        float _2802 = abs(_2796);
        float _2804 = log2(_2802);
        float _2806 = _2778 * _2788;
        float _2808 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2810 = _1565 * _2800;
        float _2812 = -_2800;
        float _2814 = -_2808;
        float _2816 = fma(_2812, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2814);
        float _2818 = fma(_1563, _2798, _2810);
        float _2820 = -_2806;
        float _2822 = fma(_2820, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2816);
        float _2824 = fma(_1567, _2806, _2818);
        float _2826 = precise::clamp(_2824, 0.0, 1.0);
        float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2830 = _2822 + _2828;
        float _2832 = _2804 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2834 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2836 = precise::clamp(_2834, 0.0, 1.0);
        float _2838 = exp2(_2832);
        float _2840 = _2838 * _2836;
        float _2842 = _2826 * _2840;
        float _2844 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2846 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2848 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2844;
        out.m_86.y = _2846;
        out.m_86.z = _2848;
    }
    out.m_88.x = _2760;
    out.m_88.y = _2762;
    out.m_88.z = _2764;
    if (!_2746)
    {
        return out;
    }
    out.m_51.x = 0.0;
    float _2850 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2850;
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
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_51 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_88 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_80 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_86 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_82 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_84 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2602 = false;
    bool _1615 = false;
    bool _521 = false;
    bool _415 = false;
    bool _227 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _102 = in.m_48.w;
    float _104 = trunc(_102);
    int _107 = int(_104);
    bool _111 = _107 >= 1;
    float _113 = 0.0;
    if (!_111)
    {
        _113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _115 = _113;
    if (!_111)
    {
        out.m_51.x = 0.0;
    }
    int _117 = 0;
    if (!_111)
    {
        float _119 = _115 * 5.0;
        _117 = as_type<int>(_119);
    }
    int _121 = _117;
    int _123 = _121;
    if (!_111)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2906 = as_type<float>(_121);
        out.gl_Position.z = _2906;
    }
    if (!_111)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _125 = in.m_53.w;
    float _127 = float(_107);
    float _129 = 1.0 / _127;
    float _131 = -_125;
    float _133 = _131 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _135 = _125 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _137 = isnan(_125);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _143 = _139 || _141;
    float _145 = _133 * _129;
    bool _147 = _133 >= _127;
    bool _149 = !_143;
    bool _151 = _147 || _149;
    out.m_55.x = _145;
    float _153 = _125;
    float _155 = _133;
    if (_151)
    {
        _153 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _157 = _153;
    if (_151)
    {
        out.m_51.x = 0.0;
    }
    if (_151)
    {
        float _159 = _157 * 5.0;
        _123 = as_type<int>(_159);
    }
    int _161 = _123;
    if (_151)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2978 = as_type<float>(_161);
        out.gl_Position.z = _2978;
    }
    if (_151)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _163 = as_type<float>(int(gl_VertexIndex));
    float _165 = in.m_60.x;
    float _167 = in.m_60.y;
    float _169 = in.m_60.z;
    int _171 = as_type<int>(_163) & 1;
    bool _173 = _171 != 0;
    int _175 = as_type<int>(_163) & 2;
    bool _177 = _175 != 0;
    bool _179 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _181 = _167 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _183 = _167 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _185 = _167 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _187 = !_173;
    float _189 = _187 ? (-0.5) : 0.5;
    float _191 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[4].x, _181);
    float _193 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[5].x, _183);
    float _195 = fma(_165, (*spvDescriptorSet0.vp_c10)._m0[6].x, _185);
    bool _197 = !_177;
    float _199 = _197 ? (-0.5) : 0.5;
    float _201 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[4].z, _191);
    float _203 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[5].z, _193);
    float _205 = fma(_169, (*spvDescriptorSet0.vp_c10)._m0[6].z, _195);
    bool _207 = !_179;
    float _225;
    if (!_207)
    {
        float _209 = in.m_62.x;
        float _211 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _213 = _209 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _215 = fma(_213, (*spvDescriptorSet0.vp_c9)._m0[12].x, _133);
        float _217 = _215 * _211;
        float _219 = floor(_217);
        float _221 = -_219;
        float _223 = _217 + _221;
        _225 = _223;
        _227 = true;
    }
    else
    {
        _225 = _145;
    }
    _227 = false;
    float _229 = _225;
    float _231 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _233 = _229 + _231;
    float _235 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _237 = _229 + _235;
    float _239 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _241 = _229 + _239;
    float _243 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _245 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _243;
    float _247 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _249 = _247 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _251 = -(*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _253 = (*spvDescriptorSet0.vp_c9)._m0[146].w + _251;
    bool _255 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[146].w;
    bool _257 = isnan(_229);
    bool _259 = _255 || _257;
    bool _261 = isnan((*spvDescriptorSet0.vp_c9)._m0[146].w);
    bool _263 = _259 || _261;
    float _265 = float(_263);
    bool _267 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _269 = 1.0 / _245;
    float _271 = 1.0 / _253;
    float _273 = 1.0 / _249;
    float _275 = _233 * _269;
    bool _277 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _279 = isnan(_229);
    bool _281 = _277 || _279;
    bool _283 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _285 = _281 || _283;
    float _287 = float(_285);
    float _289 = -_265;
    float _291 = _289 + 1.0;
    bool _293 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _295 = isnan(_229);
    bool _297 = _293 || _295;
    bool _299 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _301 = _297 || _299;
    float _303 = float(_301);
    float _305 = _287 * _291;
    float _307 = _237 * _271;
    float _309 = -_287;
    float _311 = _309 + 1.0;
    float _313 = _303 * _311;
    float _315 = -_303;
    float _317 = _315 + 1.0;
    float _319 = _241 * _273;
    float _321 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _323 = _321 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    bool _325 = _229 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _327 = isnan(_229);
    bool _329 = _325 || _327;
    bool _331 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _333 = _329 || _331;
    float _335 = float(_333);
    float _337 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _339 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _337;
    float _341 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _343 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _341;
    float _345 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _347 = _345 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _349 = fma(_339, _275, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _351 = _335 * _317;
    float _353 = fma(_343, _275, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _355 = fma(_323, _319, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _357 = fma(_347, _319, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _359 = -_335;
    float _361 = _359 + 1.0;
    float _363 = _349 * _351;
    float _365 = _353 * _351;
    float _367 = -(*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _369 = (*spvDescriptorSet0.vp_c9)._m0[146].x + _367;
    float _371 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].x, _363);
    float _373 = -(*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _375 = (*spvDescriptorSet0.vp_c9)._m0[146].y + _373;
    float _377 = fma(_361, (*spvDescriptorSet0.vp_c9)._m0[143].y, _365);
    float _379 = fma(_369, _307, (*spvDescriptorSet0.vp_c9)._m0[145].x);
    float _381 = fma(_355, _313, _371);
    float _383 = fma(_375, _307, (*spvDescriptorSet0.vp_c9)._m0[145].y);
    float _385 = fma(_357, _313, _377);
    float _387 = fma(_379, _305, _381);
    float _389 = fma(_383, _305, _385);
    float _391 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[146].x, _387);
    float _393 = fma(_265, (*spvDescriptorSet0.vp_c9)._m0[146].y, _389);
    bool _395 = !_267;
    float _413;
    if (!_395)
    {
        float _397 = in.m_62.x;
        float _399 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _401 = _397 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _403 = fma(_401, (*spvDescriptorSet0.vp_c9)._m0[11].y, _133);
        float _405 = _403 * _399;
        float _407 = floor(_405);
        float _409 = -_407;
        float _411 = _405 + _409;
        _413 = _411;
        _415 = true;
    }
    else
    {
        _413 = _145;
    }
    _415 = false;
    float _417 = _413;
    float _419 = in.m_64.x;
    float _421 = in.m_64.y;
    bool _423 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _425 = isnan(_417);
    bool _427 = _423 || _425;
    bool _429 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _431 = _427 || _429;
    float _433 = float(_431);
    float _435 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _437 = _435 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _439 = _417 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _441 = isnan(_417);
    bool _443 = _439 || _441;
    bool _445 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    float _451 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _453 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _451;
    float _455 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _457 = _417 + _455;
    float _459 = -_433;
    float _461 = _459 + 1.0;
    bool _463 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _465 = 1.0 / _437;
    float _467 = _449 * _461;
    float _469 = -_449;
    float _471 = _469 + 1.0;
    float _473 = _393 * _421;
    float _475 = _391 * _419;
    float _477 = _453 * _465;
    float _479 = fma(_477, _457, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _481 = _479 * _467;
    float _483 = fma(_471, (*spvDescriptorSet0.vp_c9)._m0[115].x, _481);
    float _485 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _487 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _489 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _491 = fma(_433, (*spvDescriptorSet0.vp_c9)._m0[116].x, _483);
    float _493 = _485 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _495 = _487 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _497 = _489 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _499 = _491 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    out.m_66.x = _493;
    out.m_66.y = _495;
    out.m_66.z = _497;
    out.m_66.w = _499;
    bool _501 = !_463;
    float _519;
    if (!_501)
    {
        float _503 = in.m_62.x;
        float _505 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _507 = _503 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _509 = fma(_507, (*spvDescriptorSet0.vp_c9)._m0[11].w, _133);
        float _511 = _509 * _505;
        float _513 = floor(_511);
        float _515 = -_513;
        float _517 = _511 + _515;
        _519 = _517;
        _521 = true;
    }
    else
    {
        _519 = _145;
    }
    _521 = false;
    float _523 = _519;
    float _525 = in.m_62.x;
    float _527 = in.m_62.y;
    float _529 = in.m_62.z;
    float _531 = in.m_62.w;
    float _533 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _535 = in.m_48.x;
    float _537 = in.m_48.y;
    float _539 = in.m_48.z;
    int _541 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _543 = _541 != 0;
    float _545 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _547 = _523 + _545;
    int _549 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _551 = _549 != 0;
    float _553 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    int _555 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _557 = _555 != 0;
    float _559 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    int _561 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _563 = _561 != 0;
    float _565 = _533 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    float _567 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].z;
    float _569 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _571 = _525 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _573 = _531 > 0.5;
    float _575 = _527 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _577 = _537 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    int _579 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 16;
    bool _581 = _579 != 0;
    int _583 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 32;
    bool _585 = _583 != 0;
    float _587 = -_553;
    float _589 = fma(_571, 2.0, _587);
    float _591 = -_199;
    int _593 = _573 ? as_type<int>(_591) : as_type<int>(_199);
    float _595 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _597 = _595 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _599 = _525 > 0.5;
    float _601 = _529 * 2.0;
    float _603 = fma(_535, (*spvDescriptorSet0.vp_c10)._m0[5].x, _577);
    float _605 = 1.0 / _597;
    float _607 = -_189;
    int _609 = _599 ? as_type<int>(_607) : as_type<int>(_189);
    float _611 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    int _613 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _615 = _613 != 0;
    float _617 = _537 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _619 = _537 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    bool _621 = !_543;
    float _623 = _621 ? _189 : as_type<float>(_609);
    float _625 = fma(_575, -2.0, _569);
    float _627 = floor(_601);
    float _629 = fma(_535, (*spvDescriptorSet0.vp_c10)._m0[6].x, _619);
    float _631 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _633 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _631;
    float _635 = _525 * 2.0;
    float _637 = _527 * 2.0;
    bool _639 = _527 > 0.5;
    float _641 = fma(_535, (*spvDescriptorSet0.vp_c10)._m0[4].x, _617);
    float _643 = _633 * _605;
    float _645 = floor(_635);
    float _647 = -_199;
    int _649 = _639 ? as_type<int>(_647) : as_type<int>(_199);
    float _651 = _527 + _529;
    float _653 = -_133;
    float _655 = fma(_653, (*spvDescriptorSet0.vp_c9)._m0[76].x, _589);
    float _657 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[4].z, _641);
    bool _659 = !_551;
    float _661 = _659 ? _199 : as_type<float>(_649);
    float _663 = _651 + (-1.0);
    bool _665 = _529 > 0.5;
    float _667 = floor(_637);
    float _669 = -_189;
    int _671 = _639 ? as_type<int>(_669) : as_type<int>(_189);
    float _673 = fma(_663, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _675 = -_189;
    int _677 = _665 ? as_type<int>(_675) : as_type<int>(_189);
    float _679 = _527 + _525;
    bool _681 = _627 >= 0.0;
    bool _683 = isnan(_627);
    bool _685 = _681 || _683;
    bool _687 = isnan(0.0);
    bool _689 = _685 || _687;
    float _691 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _693 = -_199;
    int _695 = _665 ? as_type<int>(_693) : as_type<int>(_199);
    float _697 = _679 + (-1.0);
    bool _699 = !_581;
    float _701 = _699 ? _189 : as_type<float>(_671);
    float _703 = _559 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    bool _705 = !_563;
    float _707 = _705 ? _189 : as_type<float>(_677);
    float _709 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    bool _711 = _645 > 0.0;
    float _713 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[5].z, _603);
    bool _715 = _645 >= 0.0;
    bool _717 = isnan(_645);
    bool _719 = _715 || _717;
    bool _721 = isnan(0.0);
    bool _723 = _719 || _721;
    float _725 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[76].y, _625);
    int _727 = _689 ? 0 : 1;
    float _729 = _661 + (-0.5);
    bool _731 = !_585;
    float _733 = _731 ? _199 : as_type<float>(_695);
    float _735 = _713 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    bool _737 = _667 > 0.0;
    float _739 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].z;
    bool _741 = _667 >= 0.0;
    bool _743 = isnan(_667);
    bool _745 = _741 || _743;
    bool _747 = isnan(0.0);
    bool _749 = _745 || _747;
    float _751 = -_733;
    float _753 = _751 + 0.5;
    float _755 = _667;
    float _757 = _539;
    float _759 = _547;
    float _761 = _735;
    if (!_615)
    {
        _755 = _529;
    }
    float _763 = _755;
    float _765 = _657 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    bool _767 = _627 > 0.0;
    float _769 = fma(_539, (*spvDescriptorSet0.vp_c10)._m0[6].z, _629);
    float _771 = _763;
    if (_615)
    {
        _771 = _527;
    }
    float _773 = _771;
    float _775 = fma(_643, _547, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _777 = ~_727;
    int _779 = _777 + 1;
    int _781 = _779 + 1;
    float _783 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[85].w;
    int _785 = _781;
    if (!_615)
    {
        _757 = _527;
    }
    float _787 = _757;
    float _789 = fma(_773, (*spvDescriptorSet0.vp_c9)._m0[83].w, _611);
    float _791 = _623 + 0.5;
    float _793 = _787;
    if (!_615)
    {
        _759 = _529;
    }
    float _795 = _759;
    float _797 = _753 * (*spvDescriptorSet0.vp_c9)._m0[90].y;
    float _799 = _795;
    if (_615)
    {
        _793 = _525;
    }
    float _801 = _793;
    float _803 = fma(_565, _791, _655);
    bool _805 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _807 = isnan(_523);
    bool _809 = _805 || _807;
    bool _811 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _813 = _809 || _811;
    float _815 = float(_813);
    float _817 = _739 * (*spvDescriptorSet0.vp_c9)._m0[85].x;
    if (!_767)
    {
        int _819 = ~_727;
        int _821 = _819 + 1;
        _785 = _821;
    }
    int _823 = _785;
    float _825 = _801 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _827 = -_815;
    float _829 = _827 + 1.0;
    bool _831 = _523 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _833 = isnan(_523);
    bool _835 = _831 || _833;
    bool _837 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _839 = _835 || _837;
    float _841 = float(_839);
    float _843 = _769 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    if (_615)
    {
        _799 = _527;
    }
    float _845 = _799;
    float _847 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _849 = log2(_847);
    int _851 = _723 ? 0 : 1;
    float _853 = _841 * _829;
    int _855 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _857 = _855 != 0;
    int _859 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _861 = _859 != 0;
    int _863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _865 = _863 != 0;
    float _867 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].w, _789);
    float _869 = _775 * _853;
    float _871 = -_691;
    float _873 = fma(_825, 2.0, _871);
    float _875 = -_841;
    float _877 = _875 + 1.0;
    float _879 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _881 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[90].w;
    bool _883 = !_557;
    float _885 = _883 ? _199 : as_type<float>(_593);
    float _887 = -_133;
    float _889 = fma(_887, (*spvDescriptorSet0.vp_c9)._m0[81].x, _873);
    float _891 = fma(_801, (*spvDescriptorSet0.vp_c9)._m0[83].z, _879);
    float _893 = -_703;
    float _895 = -_725;
    float _897 = fma(_893, _729, _895);
    float _899 = _701 + 0.5;
    float _901 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _903 = _845 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _905 = _707 + 0.5;
    float _907 = _899 * (*spvDescriptorSet0.vp_c9)._m0[90].x;
    float _909 = fma(_877, (*spvDescriptorSet0.vp_c9)._m0[131].x, _869);
    float _911 = fma(_903, -2.0, _901);
    float _913 = _885 + (-0.5);
    float _915 = _907 * _567;
    float _917 = _783 * (*spvDescriptorSet0.vp_c9)._m0[85].y;
    float _919 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[81].y, _911);
    float _921 = fma(_817, _905, _889);
    bool _923 = !_857;
    int _925 = _923 ? 0 : 1;
    float _927 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _929 = _735 + _927;
    float _931 = _797 * _881;
    float _933 = -_917;
    float _935 = -_919;
    float _937 = fma(_933, _913, _935);
    float _939 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _941 = _765 + _939;
    int _943 = abs(_925);
    float _945 = _929 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    int _947 = _749 ? 0 : 1;
    out.m_68.x = _915;
    out.m_68.y = _931;
    float _949 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[82].z, _891);
    int _951 = ~_947;
    int _953 = _951 + 1;
    int _955 = _953 + 1;
    float _957 = _849 * _133;
    int _959 = _955;
    if (!_737)
    {
        int _961 = ~_947;
        int _963 = _961 + 1;
        _959 = _963;
    }
    int _965 = _959;
    float _967 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _969 = -_949;
    float _971 = _969 + 1.0;
    int _973 = ~_851;
    int _975 = _973 + 1;
    int _977 = _975 + 1;
    float _979 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _981 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _983 = _843 + _981;
    float _985 = fma(_941, (*spvDescriptorSet0.vp_c8)._m0[28].x, _945);
    float _987 = fma(_525, (*spvDescriptorSet0.vp_c9)._m0[78].z, _967);
    float _989 = -_971;
    float _991 = fma(_707, _989, _921);
    bool _993 = !_861;
    int _995 = _993 ? 0 : 1;
    float _997 = fma(_983, (*spvDescriptorSet0.vp_c8)._m0[28].z, _985);
    float _999 = fma(_527, (*spvDescriptorSet0.vp_c9)._m0[78].w, _979);
    float _1001 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].z, _987);
    int _1003 = abs(_995);
    float _1005 = fma(_815, (*spvDescriptorSet0.vp_c9)._m0[132].x, _909);
    float _1007 = fma(_133, (*spvDescriptorSet0.vp_c9)._m0[77].w, _999);
    float _1009 = -_1001;
    float _1011 = _1009 + 1.0;
    bool _1013 = _997 >= 0.0;
    float _1015 = _929 * _929;
    float _1017 = -_1007;
    float _1019 = _1017 + 1.0;
    float _1021 = -_1011;
    float _1023 = fma(_623, _1021, _803);
    float _1025 = fma(_941, _941, _1015);
    float _1027 = fma(_661, _1019, _897);
    int _1029 = _977;
    if (!_711)
    {
        int _1031 = ~_851;
        int _1033 = _1031 + 1;
        _1029 = _1033;
    }
    int _1035 = _1029;
    float _1037 = in.m_70.x;
    float _1039 = in.m_70.y;
    float _1041 = in.m_70.z;
    float _1043 = float(_823);
    float _1045 = fma(_983, _983, _1025);
    float _1047 = float(_943);
    float _1049 = exp2(_957);
    bool _1051 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1053 = isnan(1.0);
    bool _1055 = _1051 || _1053;
    bool _1057 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1059 = _1055 || _1057;
    float _1061 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1063 = 1.0 + _1061;
    float _1065 = _1047 * _1043;
    float _1067 = -_867;
    float _1069 = _1067 + 1.0;
    if (_1013)
    {
        out.m_51.x = 0.0;
    }
    float _1071 = 1.0 / _1063;
    float _1073 = fma(_885, _1069, _937);
    float _1075 = _1065 * (-2.0);
    float _1077 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1079 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    bool _1081 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1083 = isnan(0.0);
    bool _1085 = _1081 || _1083;
    bool _1087 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1089 = _1085 || _1087;
    float _1091 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1093 = rsqrt(_1045);
    float _1095 = _1005 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1097 = float(_1035);
    float _1099 = _1091 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1101 = float(_1003);
    float _1103 = fma(_1075, _1037, _1037);
    float _1105 = _1077 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1107 = _1079 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1109 = fma(_709, _1075, _709);
    float _1111 = _1101 * _1097;
    float _1113 = _1097;
    if (_1013)
    {
        _1113 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1115 = _1113;
    float _1117 = -_1049;
    float _1119 = _1117 + 1.0;
    out.m_72.x = _1099;
    out.m_72.y = _1105;
    out.m_72.z = _1107;
    out.m_72.w = _1095;
    float _1121 = _1111 * (-2.0);
    int _1123 = as_type<int>(_1115);
    if (_1013)
    {
        float _1125 = _1115 * 5.0;
        _1123 = as_type<int>(_1125);
    }
    int _1127 = _1123;
    float _1129 = fma(_673, _1121, _673);
    float _1131 = fma(_1121, _1039, _1039);
    float _1133 = _929 * _1093;
    float _1135 = _1089 ? _1119 : 0.0;
    out.m_74.x = _1023;
    out.m_74.y = _1027;
    out.m_74.z = _991;
    out.m_74.w = _1073;
    float _1137 = -_1133;
    float _1139 = fma(_1137, (*spvDescriptorSet0.vp_c9)._m0[18].w, _929);
    if (_1013)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4583 = as_type<float>(_1127);
        out.gl_Position.z = _4583;
    }
    float _1141 = _525 + (-0.5);
    if (_1059)
    {
        float _1143 = _1135 * _1071;
        _155 = _1143;
    }
    float _1145 = _155;
    float _1147 = fma(_1141, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1103);
    float _1149 = _1139 * _1139;
    float _1151 = _941 * _1093;
    bool _1153 = !_865;
    int _1155 = _1153 ? 0 : 1;
    float _1157 = -_1151;
    float _1159 = fma(_1157, (*spvDescriptorSet0.vp_c9)._m0[18].w, _941);
    float _1161 = _1151;
    if (_1013)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1163 = -_1133;
    float _1165 = fma(_1163, (*spvDescriptorSet0.vp_c9)._m0[18].w, _735);
    float _1167 = _983 * _1093;
    float _1169 = -_1151;
    float _1171 = fma(_1169, (*spvDescriptorSet0.vp_c9)._m0[18].w, _765);
    float _1173 = fma(_1159, _1159, _1149);
    float _1175 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1177 = _1165 + _1175;
    float _1179 = -_1167;
    float _1181 = fma(_1179, (*spvDescriptorSet0.vp_c9)._m0[18].w, _843);
    float _1183 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1185 = _1171 + _1183;
    int _1187 = abs(_1155);
    float _1189 = _1177 * (*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1191 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1193 = _1181 + _1191;
    float _1195 = fma(_1109, _1145, _1147);
    float _1197 = _527 + (-0.5);
    float _1199 = fma(_1185, (*spvDescriptorSet0.vp_c8)._m0[28].x, _1189);
    float _1201 = _1195 * 0.15915493667125701904296875;
    float _1203 = float(_965);
    float _1205 = fma(_1193, (*spvDescriptorSet0.vp_c8)._m0[28].z, _1199);
    float _1207 = float(_1187);
    float _1209 = fma(_1197, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1131);
    float _1211 = -_1167;
    float _1213 = fma(_1211, (*spvDescriptorSet0.vp_c9)._m0[18].w, _983);
    float _1215 = _529 + _525;
    bool _1217 = _1205 >= 0.0;
    float _1219 = _1207 * _1203;
    float _1221 = fma(_1129, _1145, _1209);
    float _1223 = fma(_1213, _1213, _1173);
    float _1225 = _1215 + (-1.0);
    float _1227 = _1219 * (-2.0);
    float _1229 = _1221 * 0.15915493667125701904296875;
    float _1231 = _529 + (-0.5);
    float _1233 = fma(_1225, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    float _1235 = fma(_1227, _1041, _1041);
    float _1237 = sqrt(_1223);
    float _1239 = _1219;
    int _1241 = as_type<int>(_1231);
    float _1243 = _1167;
    float _1245 = _1185;
    if (_1217)
    {
        _1239 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _1247 = _1239;
    float _1249 = fma(_1233, _1227, _1233);
    float _1251 = fma(_1231, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1235);
    if (_1217)
    {
        out.m_51.x = 0.0;
    }
    if (_1217)
    {
        float _1253 = _1247 * 5.0;
        _1241 = as_type<int>(_1253);
    }
    int _1255 = _1241;
    float _1257 = _1201 * 6.283185482025146484375;
    float _1259 = sin(_1257);
    float _1261 = fma(_1249, _1145, _1251);
    if (_1217)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _4792 = as_type<float>(_1255);
        out.gl_Position.z = _4792;
    }
    float _1263 = _1261 * 0.15915493667125701904296875;
    float _1265 = _1201 * 6.283185482025146484375;
    float _1267 = cos(_1265);
    float _1269 = _1229 * 6.283185482025146484375;
    float _1271 = sin(_1269);
    float _1273 = _1229 * 6.283185482025146484375;
    float _1275 = cos(_1273);
    if (_1217)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _1277 = _1263 * 6.283185482025146484375;
    float _1279 = cos(_1277);
    float _1281 = _1093 * _1237;
    float _1283 = _473 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1285 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _199);
    float _1287 = _475 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1289 = _1267 * _1275;
    float _1291 = _1281 * _1283;
    float _1293 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _189);
    float _1295 = _1263 * 6.283185482025146484375;
    float _1297 = sin(_1295);
    float _1299 = _1281 * _1287;
    float _1301 = _1285 * _1291;
    float _1303 = _1259 * _1271;
    float _1305 = _1267 * _1271;
    float _1307 = _1259 * _1275;
    float _1309 = _1293 * _1299;
    float _1311 = _1281 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1313 = _1311 * 0.5;
    float _1315 = _1267 * _1279;
    float _1317 = _1275 * _1279;
    float _1319 = _1259 * _1279;
    float _1321 = _1271 * _1279;
    float _1323 = _1315 * _1301;
    float _1325 = _1319 * _1301;
    float _1327 = fma(_1297, _1289, _1303);
    float _1329 = -_1307;
    float _1331 = fma(_1297, _1305, _1329);
    float _1333 = -_1301;
    float _1335 = _1297 * _1333;
    float _1337 = fma(_1297, _1303, _1289);
    float _1339 = fma(_1327, _1309, _1323);
    float _1341 = -_1305;
    float _1343 = fma(_1297, _1307, _1341);
    float _1345 = fma(_1317, _1309, _1335);
    float _1347 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1349 = fma(_1331, _1313, _1339);
    float _1351 = fma(_1343, _1309, _1325);
    float _1353 = fma(_1321, _1313, _1345);
    float _1355 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1357 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1359 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1361 = fma(_1337, _1313, _1351);
    float _1363 = _1349 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1365 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1357);
    float _1367 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1359);
    float _1369 = _1327 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1371 = fma(_1353, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1363);
    float _1373 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1365);
    float _1375 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1367);
    float _1377 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1355);
    float _1379 = fma(_1361, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1371);
    float _1381 = _1373 + (*spvDescriptorSet0.vp_c8)._m0[24].w;
    float _1383 = _1375 + (*spvDescriptorSet0.vp_c8)._m0[26].w;
    float _1385 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1369);
    float _1387 = fma(_1317, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1347);
    float _1389 = _765 + _1381;
    float _1391 = _843 + _1383;
    float _1393 = _1379 + (*spvDescriptorSet0.vp_c8)._m0[25].w;
    float _1395 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1397 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1399 = _1389 + _1397;
    float _1401 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1403 = _1391 + _1401;
    float _1405 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1407 = _1315 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1409 = _1399 * _1399;
    float _1411 = _1403 * _1403;
    float _1413 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1415 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1417 = _735 + _1393;
    float _1419 = _1409 + _1411;
    float _1421 = -_1297;
    float _1423 = fma(_1421, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1395);
    float _1425 = -_1297;
    float _1427 = fma(_1425, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1405);
    float _1429 = -_1297;
    float _1431 = fma(_1429, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1407);
    float _1433 = sqrt(_1419);
    float _1435 = _1331 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1437 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1377);
    float _1439 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1385);
    float _1441 = fma(_1343, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1387);
    float _1443 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1413);
    float _1445 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1415);
    float _1447 = fma(_1321, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1435);
    bool _1449 = _1433 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1451 = _1331;
    float _1453 = _1409;
    float _1455 = _1411;
    float _1457 = _1389;
    float _1459 = _1391;
    if (!_1449)
    {
        _1451 = _1417;
    }
    float _1461 = _1451;
    bool _1463 = !_1449;
    float _1465 = _1461;
    if (!_1463)
    {
        float _1467 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1469 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1471 = _1433 + _1469;
        float _1473 = rsqrt(_1419);
        float _1475 = _1471 * _1467;
        float _1477 = _1417 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1479 = _1475 * 0.15915493667125701904296875;
        float _1481 = _1479 * 6.283185482025146484375;
        float _1483 = sin(_1481);
        float _1485 = _1479 * 6.283185482025146484375;
        float _1487 = cos(_1485);
        float _1489 = fma(_1483, _1477, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1491 = _1473 * _1489;
        float _1493 = fma(_1399, _1491, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1495 = _1487 + (-1.0);
        float _1497 = fma(_1403, _1491, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1499 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1501 = _1493 + _1499;
        float _1503 = _1495 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1505 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1507 = _1497 + _1505;
        float _1509 = _1501 * _1501;
        float _1511 = fma(_1417, _1487, _1503);
        float _1513 = _1507 * _1507;
        _1465 = _1511;
        _1453 = _1509;
        _1455 = _1513;
        _1457 = _1493;
        _1459 = _1497;
    }
    float _1515 = _1465;
    float _1517 = _1453;
    float _1519 = _1455;
    float _1521 = _1457;
    float _1523 = _1459;
    float _1525 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1527 = _1515 + _1525;
    float _1529 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1423);
    float _1531 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1427);
    float _1533 = _199 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1535 = fma(_1527, _1527, _1517);
    float _1537 = fma(_1319, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1431);
    float _1539 = _189 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _1541 = _1533 * _1529;
    float _1543 = _1535 + _1519;
    float _1545 = _1533 * _1531;
    float _1547 = _1533 * _1537;
    float _1549 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1443);
    float _1551 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1445);
    float _1553 = fma(_1337, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1447);
    float _1555 = sqrt(_1543);
    float _1557 = fma(_1539, _1437, _1541);
    float _1559 = fma(_1539, _1439, _1545);
    float _1561 = fma(_1539, _1441, _1547);
    float _1563 = _1549 + _1557;
    float _1565 = _1551 + _1559;
    float _1567 = _1553 + _1561;
    out.m_76.x = _1563;
    out.m_76.y = _1565;
    out.m_76.z = _1567;
    bool _1569 = _1555 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1571 = isnan(_1555);
    bool _1573 = _1569 || _1571;
    bool _1575 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1577 = _1573 || _1575;
    float _1579 = _1531;
    if (!_1577)
    {
        _1579 = 1.0;
    }
    float _1581 = _1579;
    bool _1583 = !_1577;
    float _1585 = _1581;
    if (!_1583)
    {
        bool _1587 = _1555 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _1589 = isnan(_1555);
        bool _1591 = _1587 || _1589;
        bool _1593 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _1595 = _1591 || _1593;
        if (!_1595)
        {
            float _1597 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1599 = _1555 + _1597;
            float _1601 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _1603 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _1601;
            float _1605 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _1607 = _1605 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _1609 = 1.0 / _1603;
            float _1611 = _1599 * _1609;
            float _1613 = fma(_1611, _1607, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _1585 = _1613;
            _1615 = true;
        }
        else
        {
            bool _1617 = _1555 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _1619 = isnan(_1555);
            bool _1621 = _1617 || _1619;
            bool _1623 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _1625 = _1621 || _1623;
            if (!_1625)
            {
                float _1627 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1629 = _1555 + _1627;
                float _1631 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _1633 = _1631 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _1635 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _1637 = _1635 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _1639 = 1.0 / _1633;
                float _1641 = _1629 * _1639;
                float _1643 = fma(_1641, _1637, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _1585 = _1643;
                _1615 = true;
            }
            else
            {
                _1585 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _1615 = false;
    float _1645 = _1585;
    float _1647 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _1649 = _1515 + _1647;
    float _1651 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1653 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _1655 = _1521 + _1653;
    float _1657 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _1659 = _1523 + _1657;
    float _1661 = fma(_1649, _1645, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _1663 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1651);
    float _1665 = fma(_1655, _1645, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _1667 = fma(_1659, _1645, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _1669 = -_735;
    float _1671 = _1669 + _1661;
    float _1673 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1663);
    float _1675 = -_765;
    float _1677 = _1675 + _1665;
    float _1679 = -_843;
    float _1681 = _1679 + _1667;
    float _1683 = _1671 * _1671;
    float _1685 = _1673 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1687 = _1165 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1689 = fma(_1677, _1677, _1683);
    float _1691 = 1.0 / _1685;
    float _1693 = fma(_1171, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1687);
    float _1695 = fma(_1681, _1681, _1689);
    float _1697 = fma(_1181, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1693);
    float _1699 = sqrt(_1695);
    float _1701 = _1697 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1703 = _1701 + _1685;
    float _1705 = _1703 * _1691;
    float _1707 = _1705 * 0.5;
    bool _1709 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1711 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1713 = _1709 || _1711;
    bool _1715 = isnan(0.5);
    bool _1717 = _1713 || _1715;
    bool _1719 = _1699 > 0.0;
    float _1721 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _1723 = fma(_1707, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1721);
    bool _1725 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1727 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1729 = _1725 || _1727;
    bool _1731 = isnan(0.5);
    bool _1733 = _1729 || _1731;
    float _1735 = 1.0 / _1723;
    float _1737 = _1691;
    float _1739 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    float _1741 = _1667;
    if (!_1719)
    {
        _1737 = _1665;
    }
    float _1743 = _1737;
    float _1745 = _1743;
    float _1747 = _1743;
    if (!_1719)
    {
        _1739 = _1661;
    }
    float _1749 = _1739;
    bool _1751 = !_1719;
    float _1753 = _1749;
    float _1755 = _1735;
    if (!_1751)
    {
        float _1757 = _203 * _203;
        float _1759 = fma(_201, _201, _1757);
        float _1761 = fma(_205, _205, _1759);
        float _1763 = rsqrt(_1695);
        float _1765 = sqrt(_1761);
        float _1767 = _1677 * _1763;
        float _1769 = _1671 * _1763;
        float _1771 = _1681 * _1763;
        bool _1773 = _1765 > 0.0;
        float _1775 = _1765;
        if (!_1773)
        {
            _1745 = _1665;
        }
        float _1777 = _1745;
        _1747 = _1777;
        if (!_1773)
        {
            _1775 = _1661;
        }
        float _1779 = _1775;
        bool _1781 = !_1773;
        _1753 = _1779;
        if (!_1781)
        {
            float _1783 = rsqrt(_1761);
            float _1785 = 1.0 / (*spvDescriptorSet0.vp_c10)._m0[2].z;
            float _1787 = _203 * _1783;
            float _1789 = _201 * _1783;
            float _1791 = _1769 * _1787;
            float _1793 = _205 * _1783;
            float _1795 = fma(_1767, _1789, _1791);
            float _1797 = _1785 * (*spvDescriptorSet0.vp_c9)._m0[142].x;
            float _1799 = fma(_1771, _1793, _1795);
            float _1801 = _1799 * _1797;
            float _1803 = fma(_201, _1801, _1665);
            float _1805 = fma(_203, _1801, _1661);
            float _1807 = fma(_205, _1801, _1667);
            _1747 = _1803;
            _1741 = _1807;
            _1753 = _1805;
        }
    }
    float _1809 = _1747;
    float _1811 = _1741;
    float _1813 = _1753;
    float _1815 = -_1151;
    float _1817 = fma(_1815, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1809);
    float _1819 = -_1167;
    float _1821 = fma(_1819, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1811);
    float _1823 = -_1133;
    float _1825 = fma(_1823, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1813);
    float _1827 = _1825;
    float _1829 = _1821;
    if (_1717)
    {
        _1161 = 1.0;
    }
    float _1831 = _1161;
    float _1833 = _1831;
    if (_1733)
    {
        _1243 = _1817;
    }
    float _1835 = _1243;
    float _1837 = _1835;
    if (!_1733)
    {
        float _1839 = _1177 * _1177;
        float _1841 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1843 = -_843;
        float _1845 = _1843 + _1811;
        float _1847 = -_735;
        float _1849 = _1847 + _1813;
        float _1851 = fma(_1185, _1185, _1839);
        float _1853 = fma(_1193, _1193, _1851);
        float _1855 = 1.0 / (*spvDescriptorSet0.vp_c8)._m0[31].x;
        float _1857 = sqrt(_1853);
        float _1859 = 1.0 / _1281;
        float _1861 = _1855 * (*spvDescriptorSet0.vp_c8)._m0[31].y;
        float _1863 = precise::min(_1857, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1865 = _1863 * _1841;
        float _1867 = _1865 * _1859;
        float _1869 = -_765;
        float _1871 = _1869 + _1809;
        float _1873 = _1861 * _1867;
        float _1875 = _1845 * _1867;
        float _1877 = fma(_1849, _1873, _1165);
        float _1879 = fma(_1871, _1873, _1171);
        float _1881 = fma(_1861, _1875, _1181);
        _1245 = _1857;
        _1827 = _1877;
        _1837 = _1879;
        _1829 = _1881;
        _761 = _1849;
    }
    float _1883 = _1245;
    float _1885 = _1827;
    float _1887 = _1837;
    float _1889 = _1829;
    float _1891 = _761;
    float _1893 = _1891;
    float _1895 = _1883;
    if (_1717)
    {
        _1893 = 1.0;
    }
    float _1897 = _1893;
    float _1899 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
    float _1901 = _1735 * _1899;
    float _1903 = _1897;
    if (!_1717)
    {
        float _1905 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1907 = _1905 * 0.15915493667125701904296875;
        float _1909 = _1907 * 6.283185482025146484375;
        float _1911 = cos(_1909);
        float _1913 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1915 = _1913 * 0.15915493667125701904296875;
        float _1917 = _1907 * 6.283185482025146484375;
        float _1919 = sin(_1917);
        float _1921 = 1.0 / _1911;
        float _1923 = _1915 * 6.283185482025146484375;
        float _1925 = cos(_1923);
        float _1927 = _1919 * _1921;
        float _1929 = _1915 * 6.283185482025146484375;
        float _1931 = sin(_1929);
        float _1933 = _1925 * _1927;
        float _1935 = 1.0 / _1933;
        float _1937 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1939 = (*spvDescriptorSet0.vp_c9)._m0[140].y + _1937;
        float _1941 = 1.0 / _1939;
        float _1943 = _1931 * _1935;
        float _1945 = -(*spvDescriptorSet0.vp_c9)._m0[140].x;
        float _1947 = fma(_1901, _1943, _1945);
        float _1949 = _1947 * _1941;
        float _1951 = precise::clamp(_1949, 0.0, 1.0);
        _1895 = _1915;
        _1833 = _1951;
    }
    float _1953 = _1895;
    float _1955 = _1833;
    float _1957 = _1953;
    if (!_1717)
    {
        float _1959 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1961 = _1959 * 0.15915493667125701904296875;
        float _1963 = _1961 * 6.283185482025146484375;
        float _1965 = cos(_1963);
        float _1967 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1969 = _1967 * 0.15915493667125701904296875;
        float _1971 = _1961 * 6.283185482025146484375;
        float _1973 = sin(_1971);
        float _1975 = 1.0 / _1965;
        float _1977 = _1969 * 6.283185482025146484375;
        float _1979 = cos(_1977);
        float _1981 = _1973 * _1975;
        float _1983 = _1969 * 6.283185482025146484375;
        float _1985 = sin(_1983);
        float _1987 = _1979 * _1981;
        float _1989 = 1.0 / _1987;
        float _1991 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1993 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1991;
        float _1995 = 1.0 / _1993;
        float _1997 = _1985 * _1989;
        float _1999 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _2001 = fma(_1901, _1997, _1999);
        float _2003 = _2001 * _1995;
        float _2005 = precise::clamp(_2003, 0.0, 1.0);
        float _2007 = -_2005;
        float _2009 = _2007 + 1.0;
        _1957 = _1989;
        _1903 = _2009;
    }
    float _2011 = _1957;
    float _2013 = _1903;
    float _2015 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2017 = _1885 + _2015;
    float _2019 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2021 = _1887 + _2019;
    float _2023 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2025 = _1889 + _2023;
    float _2027 = _2017 * _2017;
    float _2029 = fma(_2021, _2021, _2027);
    float _2031 = fma(_2025, _2025, _2029);
    float _2033 = rsqrt(_2031);
    float _2035 = _2033 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2037 = _2021 * _2035;
    float _2039 = _2025 * _2035;
    float _2041 = _2037 * _2037;
    float _2043 = _2039 * _2039;
    float _2045 = _2041 + _2043;
    float _2047 = sqrt(_2045);
    bool _2049 = _2047 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2051 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2053 = _2047 + _2051;
    float _2055 = _2033;
    float _2057 = _2045;
    float _2059 = _2053;
    float _2061 = _2011;
    float _2063 = _2017;
    float _2065 = (*spvDescriptorSet0.vp_c15)._m0[652].x;
    if (_2049)
    {
        float _2067 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2055 = _2067;
    }
    float _2069 = _2055;
    if (_2049)
    {
        float _2071 = rsqrt(_2045);
        _2057 = _2071;
    }
    float _2073 = _2057;
    float _2075 = _2073;
    if (_2049)
    {
        float _2077 = _2053 * _2069;
        _2059 = _2077;
    }
    float _2079 = _2059;
    if (_2049)
    {
        float _2081 = _2079 * 0.15915493667125701904296875;
        _1755 = _2081;
    }
    float _2083 = _1755;
    float _2085 = _2069;
    float _2087 = _2083;
    if (_2049)
    {
        float _2089 = _2083 * 6.283185482025146484375;
        float _2091 = sin(_2089);
        _2085 = _2091;
    }
    float _2093 = _2085;
    float _2095 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2097 = precise::max(0.0, _2095);
    float _2099 = _2025;
    float _2101 = _2097;
    if (_2049)
    {
        float _2103 = _2083 * 6.283185482025146484375;
        float _2105 = cos(_2103);
        _2099 = _2105;
    }
    float _2107 = _2099;
    float _2109 = -_2035;
    float _2111 = -_2097;
    float _2113 = fma(_2017, _2109, _2111);
    if (_2049)
    {
        float _2115 = _2113 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2101 = _2115;
    }
    float _2117 = _2101;
    if (!_2049)
    {
        _2087 = _2037;
    }
    float _2119 = _2087;
    float _2121 = _2093;
    float _2123 = _2119;
    if (_2049)
    {
        float _2125 = fma(_2093, _2117, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2061 = _2125;
    }
    float _2127 = _2061;
    float _2129 = fma(_1171, (*spvDescriptorSet0.vp_c15)._m0[652].x, (*spvDescriptorSet0.vp_c15)._m0[652].z);
    float _2131 = _2127;
    if (!_2049)
    {
        _2121 = _2039;
    }
    float _2133 = _2121;
    float _2135 = sqrt(_2031);
    float _2137 = _2133;
    float _2139 = _2107;
    if (_2049)
    {
        float _2141 = _2107 + (-1.0);
        _2063 = _2141;
    }
    float _2143 = _2063;
    float _2145 = _2143;
    if (_2049)
    {
        float _2147 = _2073 * _2127;
        _2065 = _2147;
    }
    float _2149 = _2065;
    if (!_2049)
    {
        _2131 = _2113;
    }
    float _2151 = _2131;
    float _2153 = _2151;
    if (_2049)
    {
        float _2155 = _2143 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2145 = _2155;
    }
    float _2157 = _2145;
    if (_2049)
    {
        float _2159 = _2037 * _2149;
        _2123 = _2159;
    }
    float _2161 = _2123;
    if (!_2049)
    {
        _2075 = _2041;
    }
    float _2163 = _2075;
    float _2165 = _2163;
    if (_2049)
    {
        float _2167 = _2039 * _2149;
        _2137 = _2167;
    }
    float _2169 = _2137;
    if (_2049)
    {
        float _2171 = fma(_2113, _2107, _2157);
        _2153 = _2171;
    }
    float _2173 = _2153;
    if (_2049)
    {
        float _2175 = _2161 * _2161;
        _2165 = _2175;
    }
    float _2177 = _2165;
    if (!_2049)
    {
        _2139 = _2043;
    }
    float _2179 = _2139;
    float _2181 = _2179;
    if (_2049)
    {
        float _2183 = _2169 * _2169;
        _2181 = _2183;
    }
    float _2185 = _2181;
    float _2187 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2189 = fma(_2173, _2173, _2177);
    float _2191 = floor(_2129);
    float _2193 = _2189 + _2185;
    float _2195 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2187);
    float _2197 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2199 = fma(_2135, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2197);
    float _2201 = precise::clamp(_2199, 0.0, 1.0);
    float _2203 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2205 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2195);
    float _2207 = rsqrt(_2193);
    float _2209 = -_2201;
    float _2211 = _2209 + 1.0;
    float _2213 = fma(_1181, (*spvDescriptorSet0.vp_c15)._m0[652].y, (*spvDescriptorSet0.vp_c15)._m0[652].w);
    float _2215 = _2205 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2217 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2219 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2221 = _2215 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2223 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2217);
    float _2225 = abs(_2211);
    float _2227 = log2(_2225);
    float _2229 = -_2221;
    float _2231 = fma(_2229, _2203, 1.0);
    float _2233 = _1885 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2235 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2223);
    float _2237 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2219);
    float _2239 = _2207 * _2161;
    float _2241 = _2207 * _2173;
    float _2243 = _2207 * _2169;
    float _2245 = fma(_1887, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2233);
    float _2247 = _2239 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2249 = _2235 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2251 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2237);
    float _2253 = fma(_1889, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2245);
    float _2255 = -_2247;
    float _2257 = fma(_2241, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2255);
    float _2259 = _2249 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2261 = floor(_2213);
    float _2263 = _2253 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2265 = -_2243;
    float _2267 = fma(_2265, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2257);
    float _2269 = _2251 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2271 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2273 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2259);
    float _2275 = fma(_2267, -0.5, 0.5);
    float _2277 = fma(_2267, 0.5, 0.5);
    float _2279 = log2(_2231);
    float _2281 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2273);
    float _2283 = _2249 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2285 = _2241 + 1.0;
    float _2287 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2281);
    float _2289 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2283);
    float _2291 = exp2(_2271);
    float _2293 = -_2191;
    float _2295 = _2129 + _2293;
    float _2297 = _2249 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2299 = -_2261;
    float _2301 = _2213 + _2299;
    float _2303 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2289);
    float _2305 = fma(_2277, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2307 = 1.0 / _2287;
    float _2309 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2297);
    float _2311 = _2279 * 0.693147182464599609375;
    float _2313 = fma(_2277, _2305, -0.212114393711090087890625);
    float _2315 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2309);
    float _2317 = sqrt(_2275);
    float _2319 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2315);
    float _2321 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2303);
    float _2323 = -_2241;
    float _2325 = fma(_2291, _2285, _2323);
    float2 _6526 = float2(_2295, _2301);
    float _2327 = dm_bs(spvDescriptorSet0.vp_t_tcb_24.sample(spvDescriptorSet0.vp_t_tcb_24Smplr, select(_6526, float2(0.0), isnan(_6526)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_24, spvDescriptorSet0.vp_t_tcb_24Smplr_w, select(_6526, float2(0.0), isnan(_6526)), level(0.0)).x;
    float _2329 = fma(_2277, _2313, 1.570728778839111328125);
    float _2331 = _2311 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2333 = fma(_2325, 0.5, 0.5);
    float _2335 = _2319 * _2307;
    float _2337 = _2321 * _2307;
    float _2339 = fma(_2335, 0.5, 0.5);
    float _2341 = fma(_2337, -0.5, 0.5);
    float _2343 = _2317 * 0.636619746685028076171875;
    float _2345 = -_2329;
    float _2347 = fma(_2343, _2345, 1.0);
    float3 _6565 = float3(_2339, _2341, _2331);
    float _2349 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6565, float3(0.0), isnan(_6565)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6565, float3(0.0), isnan(_6565)), level(0.0)).x;
    float3 _6576 = float3(_2339, _2341, _2331);
    float4 _2352 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6576, float3(0.0), isnan(_6576)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6576, float3(0.0), isnan(_6576)), level(0.0)).xyzw;
    float _2354 = _2352.x;
    float _2356 = _2352.y;
    float _2358 = _2352.z;
    float _2360 = _2352.w;
    float2 _6592 = float2(_2347, _2333);
    float3 _2364 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6592, float2(0.0), isnan(_6592)), level(0.0)), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6592, float2(0.0), isnan(_6592)), level(0.0)).xyz;
    float _2366 = _2364.x;
    float _2368 = _2364.y;
    float _2370 = _2364.z;
    float _2372 = abs(_1901);
    float _2374 = log2(_2372);
    bool _2376 = _2135 >= (*spvDescriptorSet0.vp_c15)._m0[646].x;
    bool _2378 = isnan(_2135);
    bool _2380 = _2376 || _2378;
    bool _2382 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].x);
    bool _2384 = _2380 || _2382;
    float _2386 = _2374 * (*spvDescriptorSet0.vp_c15)._m0[654].z;
    float _2388 = exp2(_2386);
    float _2390 = _2249 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2392 = fma(_2263, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2390);
    float _2394 = _2227 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2396 = in.m_78.x;
    float _2398 = fma(_2215, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2392);
    float _2400 = exp2(_2394);
    float _2402 = fma(_2269, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2398);
    bool _2404 = _1901 <= 8000.0;
    bool _2406 = isnan(_1901);
    bool _2408 = _2404 || _2406;
    bool _2410 = isnan(8000.0);
    bool _2412 = _2408 || _2410;
    float _2414 = float(_2412);
    float _2416 = _2287 * 0.5;
    float _2418 = fma(_2388, (*spvDescriptorSet0.vp_c15)._m0[654].x, (*spvDescriptorSet0.vp_c15)._m0[654].y);
    float _2420 = precise::clamp(_2418, 0.0, 1.0);
    float _2422 = _2402 + _2287;
    float _2424 = _2319 + _2287;
    float _2426 = fma(_2321, -0.5, _2416);
    float _2428 = fma(_2420, -2.0, 3.0);
    float _2430 = _2420 * _2420;
    float _2432 = _2422 * 0.5;
    float _2434 = _2424 * 0.5;
    float _2436 = _2430 * _2428;
    out.gl_Position.x = _2319;
    out.gl_Position.y = _2321;
    out.gl_Position.z = _2402;
    out.gl_Position.w = _2287;
    float _2438 = -_2400;
    float _2440 = _2438 + 1.0;
    float _2442 = -_2436;
    float _2444 = _2442 + 1.0;
    out.m_80.x = _2434;
    out.m_80.y = _2426;
    out.m_80.z = _2432;
    out.m_80.w = _2287;
    float _2446 = _2440 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2448 = fma(_2444, (*spvDescriptorSet0.vp_c15)._m0[654].w, _2436);
    float _2450 = _2414 * _2448;
    float _2452 = _1955 * _2013;
    float _2454 = _2450 * (*spvDescriptorSet0.vp_c15)._m0[653].x;
    float _2456 = _2287;
    float _2458 = _2402;
    float _2460 = _2321;
    float _2462 = _2452;
    if (!_2384)
    {
        _2456 = (*spvDescriptorSet0.vp_c15)._m0[628].z;
    }
    float _2464 = _2456;
    float _2466 = _2464;
    float _2468 = _2464;
    if (!_2384)
    {
        _2458 = (*spvDescriptorSet0.vp_c15)._m0[629].x;
    }
    float _2470 = _2458;
    float _2472 = _2470;
    float _2474 = _2470;
    if (!_2384)
    {
        _2460 = (*spvDescriptorSet0.vp_c15)._m0[629].y;
    }
    float _2476 = _2460;
    float _2478 = -_2327;
    float _2480 = _2478 + 1.0;
    float _2482 = _2480 * _2454;
    float _2484 = precise::clamp(_2482, 0.0, 1.0);
    float _2486 = -_2484;
    float _2488 = fma(_2486, (*spvDescriptorSet0.vp_c15)._m0[653].y, 1.0);
    float _2490 = _2488 * _2396;
    float _2492 = _2446 * _2349;
    float _2494 = -_2446;
    float _2496 = _2494 + 1.0;
    float _2498 = _2360 * _2492;
    float _2500 = _2370 * _2492;
    float _2502 = _2360 * _2496;
    float _2504 = _2496;
    float _2506 = _2490;
    float _2508 = _2476;
    float _2510 = _2476;
    if (!_2384)
    {
        _2504 = (*spvDescriptorSet0.vp_c15)._m0[628].y;
    }
    float _2512 = _2504;
    float _2514 = fma(_2366, _2498, _2354);
    float _2516 = fma(_2368, _2498, _2356);
    float _2518 = _2490 * (*spvDescriptorSet0.vp_c13)._m0[1].w;
    float _2520 = fma(_2360, _2500, _2358);
    float _2522 = _2452 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2524 = _2512;
    float _2526 = _2512;
    if (!_2384)
    {
        _2506 = (*spvDescriptorSet0.vp_c15)._m0[628].x;
    }
    float _2528 = _2506;
    out.m_82.x = _2518;
    float _2530 = _2528;
    float _2532 = _2528;
    if (!_2384)
    {
        _2462 = (*spvDescriptorSet0.vp_c15)._m0[629].z;
    }
    float _2534 = _2462;
    out.m_84.x = _2514;
    out.m_84.y = _2516;
    out.m_84.z = _2520;
    out.m_84.w = _2502;
    bool _2536 = !_2384;
    float _2538 = _2534;
    float _2540 = _2534;
    if (!_2536)
    {
        bool _2542 = _2135 >= (*spvDescriptorSet0.vp_c15)._m0[646].y;
        bool _2544 = isnan(_2135);
        bool _2546 = _2542 || _2544;
        bool _2548 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].y);
        bool _2550 = _2546 || _2548;
        if (!_2550)
        {
            float _2552 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2554 = _2135 + _2552;
            float _2556 = -(*spvDescriptorSet0.vp_c15)._m0[646].x;
            float _2558 = (*spvDescriptorSet0.vp_c15)._m0[646].y + _2556;
            float _2560 = -(*spvDescriptorSet0.vp_c15)._m0[628].x;
            float _2562 = _2560 + (*spvDescriptorSet0.vp_c15)._m0[644].x;
            float _2564 = 1.0 / _2558;
            float _2566 = -(*spvDescriptorSet0.vp_c15)._m0[628].y;
            float _2568 = _2566 + (*spvDescriptorSet0.vp_c15)._m0[644].y;
            float _2570 = -(*spvDescriptorSet0.vp_c15)._m0[629].x;
            float _2572 = _2570 + (*spvDescriptorSet0.vp_c15)._m0[645].x;
            float _2574 = -(*spvDescriptorSet0.vp_c15)._m0[629].y;
            float _2576 = _2574 + (*spvDescriptorSet0.vp_c15)._m0[645].y;
            float _2578 = -(*spvDescriptorSet0.vp_c15)._m0[629].z;
            float _2580 = _2578 + (*spvDescriptorSet0.vp_c15)._m0[645].z;
            float _2582 = _2554 * _2564;
            float _2584 = precise::clamp(_2582, 0.0, 1.0);
            float _2586 = -(*spvDescriptorSet0.vp_c15)._m0[628].z;
            float _2588 = _2586 + (*spvDescriptorSet0.vp_c15)._m0[644].z;
            float _2590 = fma(_2584, _2562, (*spvDescriptorSet0.vp_c15)._m0[628].x);
            float _2592 = fma(_2584, _2588, (*spvDescriptorSet0.vp_c15)._m0[628].z);
            float _2594 = fma(_2584, _2568, (*spvDescriptorSet0.vp_c15)._m0[628].y);
            float _2596 = fma(_2584, _2572, (*spvDescriptorSet0.vp_c15)._m0[629].x);
            float _2598 = fma(_2584, _2576, (*spvDescriptorSet0.vp_c15)._m0[629].y);
            float _2600 = fma(_2584, _2580, (*spvDescriptorSet0.vp_c15)._m0[629].z);
            _2526 = _2594;
            _2510 = _2598;
            _2532 = _2590;
            _2474 = _2596;
            _2468 = _2592;
            _2540 = _2600;
            _2602 = true;
        }
        else
        {
            bool _2604 = _2135 >= (*spvDescriptorSet0.vp_c15)._m0[646].z;
            bool _2606 = isnan(_2135);
            bool _2608 = _2604 || _2606;
            bool _2610 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].z);
            bool _2612 = _2608 || _2610;
            if (!_2612)
            {
                _2530 = (*spvDescriptorSet0.vp_c15)._m0[644].x;
            }
            float _2614 = _2530;
            _2532 = _2614;
            if (!_2612)
            {
                _2524 = (*spvDescriptorSet0.vp_c15)._m0[644].y;
            }
            float _2616 = _2524;
            _2526 = _2616;
            if (!_2612)
            {
                _2466 = (*spvDescriptorSet0.vp_c15)._m0[644].z;
            }
            float _2618 = _2466;
            _2468 = _2618;
            if (!_2612)
            {
                _2472 = (*spvDescriptorSet0.vp_c15)._m0[645].x;
            }
            float _2620 = _2472;
            _2474 = _2620;
            if (!_2612)
            {
                _2508 = (*spvDescriptorSet0.vp_c15)._m0[645].y;
            }
            float _2622 = _2508;
            _2510 = _2622;
            if (!_2612)
            {
                _2538 = (*spvDescriptorSet0.vp_c15)._m0[645].z;
            }
            float _2624 = _2538;
            bool _2626 = !_2612;
            _2540 = _2624;
            if (!_2626)
            {
                bool _2628 = _2135 >= (*spvDescriptorSet0.vp_c15)._m0[646].w;
                bool _2630 = isnan(_2135);
                bool _2632 = _2628 || _2630;
                bool _2634 = isnan((*spvDescriptorSet0.vp_c15)._m0[646].w);
                bool _2636 = _2632 || _2634;
                if (!_2636)
                {
                    float _2638 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2640 = _2135 + _2638;
                    float _2642 = -(*spvDescriptorSet0.vp_c15)._m0[646].z;
                    float _2644 = (*spvDescriptorSet0.vp_c15)._m0[646].w + _2642;
                    float _2646 = -(*spvDescriptorSet0.vp_c15)._m0[644].x;
                    float _2648 = _2646 + (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    float _2650 = 1.0 / _2644;
                    float _2652 = -(*spvDescriptorSet0.vp_c15)._m0[644].y;
                    float _2654 = _2652 + (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    float _2656 = -(*spvDescriptorSet0.vp_c15)._m0[645].x;
                    float _2658 = _2656 + (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    float _2660 = -(*spvDescriptorSet0.vp_c15)._m0[645].y;
                    float _2662 = _2660 + (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    float _2664 = -(*spvDescriptorSet0.vp_c15)._m0[645].z;
                    float _2666 = _2664 + (*spvDescriptorSet0.vp_c15)._m0[650].z;
                    float _2668 = _2640 * _2650;
                    float _2670 = precise::clamp(_2668, 0.0, 1.0);
                    float _2672 = -(*spvDescriptorSet0.vp_c15)._m0[644].z;
                    float _2674 = _2672 + (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    float _2676 = fma(_2670, _2648, (*spvDescriptorSet0.vp_c15)._m0[644].x);
                    float _2678 = fma(_2670, _2674, (*spvDescriptorSet0.vp_c15)._m0[644].z);
                    float _2680 = fma(_2670, _2654, (*spvDescriptorSet0.vp_c15)._m0[644].y);
                    float _2682 = fma(_2670, _2658, (*spvDescriptorSet0.vp_c15)._m0[645].x);
                    float _2684 = fma(_2670, _2662, (*spvDescriptorSet0.vp_c15)._m0[645].y);
                    float _2686 = fma(_2670, _2666, (*spvDescriptorSet0.vp_c15)._m0[645].z);
                    _2526 = _2680;
                    _2510 = _2684;
                    _2532 = _2676;
                    _2474 = _2682;
                    _2468 = _2678;
                    _2540 = _2686;
                    _2602 = true;
                }
                else
                {
                    _2526 = (*spvDescriptorSet0.vp_c15)._m0[649].y;
                    _2510 = (*spvDescriptorSet0.vp_c15)._m0[650].y;
                    _2532 = (*spvDescriptorSet0.vp_c15)._m0[649].x;
                    _2474 = (*spvDescriptorSet0.vp_c15)._m0[650].x;
                    _2468 = (*spvDescriptorSet0.vp_c15)._m0[649].z;
                    _2540 = (*spvDescriptorSet0.vp_c15)._m0[650].z;
                }
            }
        }
    }
    _2602 = false;
    float _2688 = _2526;
    float _2690 = _2510;
    float _2692 = _2532;
    float _2694 = _2474;
    float _2696 = _2468;
    float _2698 = _2540;
    float _2700 = _2522 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2702 = fma(_1565, -0.5, 0.5);
    float _2704 = precise::clamp(_2702, 0.0, 1.0);
    float _2706 = -_2688;
    float _2708 = _2706 + _2690;
    float _2710 = -_2692;
    float _2712 = _2710 + _2694;
    out.m_51.x = _2700;
    float _2714 = fma(_2704, _2708, _2688);
    float _2716 = -_2696;
    float _2718 = _2716 + _2698;
    float _2720 = fma(_2704, _2712, _2692);
    float _2722 = _2714 * 0.586610972881317138671875;
    bool _2724 = 0.0 < (*spvDescriptorSet0.vp_c15)._m0[655].w;
    float _2726 = fma(_2704, _2718, _2696);
    out.m_86.x = 0.0;
    float _2728 = fma(_2720, 0.298911988735198974609375, _2722);
    bool _2730 = _1955 > 0.0;
    bool _2732 = isnan(_1955);
    bool _2734 = _2730 || _2732;
    bool _2736 = isnan(0.0);
    bool _2738 = _2734 || _2736;
    float _2740 = fma(_2726, 0.114477999508380889892578125, _2728);
    bool _2742 = _2013 <= 0.0;
    bool _2744 = !_2738;
    bool _2746 = _2742 || _2744;
    float _2748 = -_2740;
    float _2750 = _2720 + _2748;
    float _2752 = -_2740;
    float _2754 = _2714 + _2752;
    float _2756 = -_2740;
    float _2758 = _2726 + _2756;
    float _2760 = fma(_2750, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2740);
    float _2762 = fma(_2754, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2740);
    float _2764 = fma(_2758, (*spvDescriptorSet0.vp_c13)._m0[1].z, _2740);
    bool _2766 = !_2724;
    if (!_2766)
    {
        float _2768 = -_1885;
        float _2770 = _2768 + (*spvDescriptorSet0.vp_c15)._m0[655].y;
        float _2772 = -_1887;
        float _2774 = _2772 + (*spvDescriptorSet0.vp_c15)._m0[655].x;
        float _2776 = -_1889;
        float _2778 = _2776 + (*spvDescriptorSet0.vp_c15)._m0[655].z;
        float _2780 = _2770 * _2770;
        float _2782 = fma(_2774, _2774, _2780);
        float _2784 = fma(_2778, _2778, _2782);
        float _2786 = sqrt(_2784);
        float _2788 = rsqrt(_2784);
        float _2790 = -_2786;
        float _2792 = _2790 + (*spvDescriptorSet0.vp_c15)._m0[655].w;
        float _2794 = _2792 * (*spvDescriptorSet0.vp_c15)._m0[658].y;
        float _2796 = precise::clamp(_2794, 0.0, 1.0);
        float _2798 = _2774 * _2788;
        float _2800 = _2770 * _2788;
        float _2802 = abs(_2796);
        float _2804 = log2(_2802);
        float _2806 = _2778 * _2788;
        float _2808 = _2798 * (*spvDescriptorSet0.vp_c15)._m0[656].x;
        float _2810 = _1565 * _2800;
        float _2812 = -_2800;
        float _2814 = -_2808;
        float _2816 = fma(_2812, (*spvDescriptorSet0.vp_c15)._m0[656].y, _2814);
        float _2818 = fma(_1563, _2798, _2810);
        float _2820 = -_2806;
        float _2822 = fma(_2820, (*spvDescriptorSet0.vp_c15)._m0[656].z, _2816);
        float _2824 = fma(_1567, _2806, _2818);
        float _2826 = precise::clamp(_2824, 0.0, 1.0);
        float _2828 = -(*spvDescriptorSet0.vp_c15)._m0[656].w;
        float _2830 = _2822 + _2828;
        float _2832 = _2804 * (*spvDescriptorSet0.vp_c15)._m0[657].w;
        float _2834 = _2830 * (*spvDescriptorSet0.vp_c15)._m0[658].w;
        float _2836 = precise::clamp(_2834, 0.0, 1.0);
        float _2838 = exp2(_2832);
        float _2840 = _2838 * _2836;
        float _2842 = _2826 * _2840;
        float _2844 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].x;
        float _2846 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].y;
        float _2848 = _2842 * (*spvDescriptorSet0.vp_c15)._m0[657].z;
        out.m_86.x = _2844;
        out.m_86.y = _2846;
        out.m_86.z = _2848;
    }
    out.m_88.x = _2760;
    out.m_88.y = _2762;
    out.m_88.z = _2764;
    if (!_2746)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_51.x = 0.0;
    float _2850 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _2850;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_51.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_51.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_51.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_51.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_88.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_88.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_88.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_88.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_80.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_80.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_80.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_80.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_86.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_86.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_86.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_86.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_82.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_82.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_82.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_82.w)); dm_cw(dm_gs, dm_p, 60, as_type<uint>(out.m_84.x)); dm_cw(dm_gs, dm_p, 61, as_type<uint>(out.m_84.y)); dm_cw(dm_gs, dm_p, 62, as_type<uint>(out.m_84.z)); dm_cw(dm_gs, dm_p, 63, as_type<uint>(out.m_84.w)); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

