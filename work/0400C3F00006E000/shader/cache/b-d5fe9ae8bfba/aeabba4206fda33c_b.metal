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
    texture3d<float> vp_t_tcb_32 [[id(6)]];
    sampler vp_t_tcb_32Smplr [[id(7)]];
    texture3d<float> vp_t_tcb_30 [[id(8)]];
    sampler vp_t_tcb_30Smplr [[id(9)]];
    texture2d<float> vp_t_tcb_1C [[id(10)]];
    sampler vp_t_tcb_1CSmplr [[id(11)]];
    sampler vp_t_tcb_32Smplr_w [[id(12)]];
    sampler vp_t_tcb_30Smplr_w [[id(13)]];
    sampler vp_t_tcb_1CSmplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_56 [[user(locn0)]];
    float4 m_60 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_62 [[user(locn4)]];
    float4 m_66 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_58 [[attribute(4)]];
    float4 m_54 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2042 = false;
    bool _843 = false;
    bool _573 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2520 = as_type<float>(_101);
        out.gl_Position.z = _2520;
    }
    if (!_89)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2588 = as_type<float>(_137);
        out.gl_Position.z = _2588;
    }
    if (_131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _161 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _159);
    float _163 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _165 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _161);
    float _167 = _161;
    float _169 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _171 = _141;
    if (!_157)
    {
        float _173 = _141 * _141;
        float _175 = _173 * 0.5;
        _167 = _175;
    }
    float _177 = _167;
    float _179 = _177;
    if (!_157)
    {
        float _181 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    int _185 = as_type<int>(_139) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_139) & 2;
    bool _191 = _189 != 0;
    float _193 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _163);
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _193);
    bool _197 = !_187;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_191;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_157;
    float _207 = _183;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _141 * _211;
        float _221 = exp2(_219);
        float _223 = _217 * 0.693147182464599609375;
        float _225 = 1.0 / _223;
        float _227 = 1.0 / _215;
        float _229 = _221 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _225, _141);
        float _235 = _233 * _227;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
        _169 = _221;
    }
    float _239 = _207;
    float _241 = _169;
    bool _243 = !_157;
    float _245 = _241;
    if (!_243)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _141 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _171 = _265;
        _245 = _253;
    }
    float _267 = _171;
    float _269 = _245;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _277 = _269;
    float _279 = _271;
    float _281 = _275;
    if (!_157)
    {
        float _283 = _119 * _119;
        float _285 = _283 * 0.5;
        _277 = _285;
    }
    float _287 = _277;
    float _289 = fma(_267, _143, _271);
    float _291 = fma(_267, _145, _273);
    float _293 = fma(_267, _147, _275);
    if (!_157)
    {
        float _295 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _295;
    }
    float _297 = _279;
    bool _299 = !_157;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _309 = _307 + 1.0;
        float _311 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = _119 * _305;
        float _315 = exp2(_313);
        float _317 = _311 * 0.693147182464599609375;
        float _319 = 1.0 / _317;
        float _321 = 1.0 / _309;
        float _323 = _315 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _319, _119);
        float _329 = _327 * _321;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _331;
        _281 = _315;
    }
    float _333 = _301;
    float _335 = _281;
    float _337 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = _335;
    if (!_157)
    {
        _339 = _119;
    }
    float _341 = _339;
    bool _343 = !_157;
    float _345 = _341;
    if (!_343)
    {
        float _347 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = log2(_347);
        float _351 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _353 = _351 + 1.0;
        float _355 = 1.0 / _353;
        float _357 = _119 * _349;
        float _359 = exp2(_357);
        float _361 = -_359;
        float _363 = _361 + 1.0;
        float _365 = _363 * _355;
        _345 = _365;
    }
    float _367 = _345;
    float _369 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _371 = fma(_367, _145, _337);
    float _373 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _375 = fma(_367, _143, _369);
    float _377 = -_371;
    float _379 = _291 + _377;
    float _381 = fma(_367, _147, _373);
    float _383 = -_375;
    float _385 = _289 + _383;
    float _387 = _379 * _379;
    float _389 = sqrt(_195);
    float _391 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _393 = -_381;
    float _395 = _293 + _393;
    float _397 = fma(_385, _385, _387);
    float _399 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _391);
    float _401 = _379 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _403 = fma(_395, _395, _397);
    float _405 = sqrt(_165);
    float _407 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _399);
    float _409 = _379 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _411 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[14].y, _401);
    float _413 = _379 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _415 = _379 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _417 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[14].x, _409);
    float _419 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[16].y, _411);
    float _421 = sqrt(_403);
    float _423 = in.m_54.w;
    float _425 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[14].z, _413);
    float _427 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[16].x, _417);
    float _429 = _389 * _419;
    float _431 = in.m_44.x;
    float _433 = in.m_44.y;
    float _435 = in.m_44.z;
    float _437 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[16].z, _425);
    float _439 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[14].w, _415);
    float _441 = sqrt(_407);
    float _443 = _405 * _427;
    float _445 = _429 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _447 = _429 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _449 = _429 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _451 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[16].w, _439);
    float _453 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[24].x, _445);
    float _455 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[25].x, _447);
    bool _457 = _421 >= 9.9999999747524270787835121154785e-07;
    bool _459 = isnan(_421);
    bool _461 = _457 || _459;
    bool _463 = isnan(9.9999999747524270787835121154785e-07);
    bool _465 = _461 || _463;
    float _467 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[26].x, _449);
    float _469 = _441 * _437;
    float _471 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[24].z, _453);
    float _473 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[26].z, _467);
    float _475 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[25].z, _455);
    float _477 = fma(_289, _423, _431);
    float _479 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[24].w, _471);
    float _481 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[26].w, _473);
    float _483 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[25].w, _475);
    float _485 = fma(_291, _423, _433);
    float _487 = fma(_293, _423, _435);
    float _489 = _473;
    float _491 = _483;
    float _493 = _481;
    if (_465)
    {
        _489 = _479;
    }
    float _495 = _489;
    float _497 = _495;
    if (!_465)
    {
        bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _501 = !_499;
        if (!_501)
        {
            float _503 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _505 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _507 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _509 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _503);
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _505);
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _507);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _509);
            float _517 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _511);
            float _519 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _513);
            float _521 = _389 * _515;
            float _523 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _525 = _405 * _517;
            float _527 = _441 * _519;
            float _529 = _521 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _531 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _523);
            float _533 = _521 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _535 = _521 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _537 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].x, _529);
            float _539 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _531);
            float _541 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].x, _533);
            float _543 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].x, _535);
            float _545 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[25].z, _537);
            float _547 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[24].z, _541);
            float _549 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[26].z, _543);
            float _551 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[25].w, _545);
            float _553 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[24].w, _547);
            float _555 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[26].w, _549);
            float _557 = _551 * _551;
            float _559 = fma(_553, _553, _557);
            float _561 = fma(_555, _555, _559);
            float _563 = rsqrt(_561);
            float _565 = _563 * 9.9999999747524270787835121154785e-07;
            float _567 = _553 * _565;
            float _569 = _551 * _565;
            float _571 = _555 * _565;
            _491 = _569;
            _497 = _567;
            _493 = _571;
            _573 = true;
        }
        else
        {
            float _575 = _145 * _145;
            float _577 = fma(_143, _143, _575);
            float _579 = fma(_147, _147, _577);
            float _581 = sqrt(_579);
            bool _583 = _581 >= 9.9999999747524270787835121154785e-07;
            bool _585 = isnan(_581);
            bool _587 = _583 || _585;
            bool _589 = isnan(9.9999999747524270787835121154785e-07);
            bool _591 = _587 || _589;
            if (!_591)
            {
                float _593 = _433 * _433;
                float _595 = fma(_431, _431, _593);
                float _597 = fma(_435, _435, _595);
                float _599 = sqrt(_597);
                bool _601 = _599 >= 9.9999999747524270787835121154785e-07;
                bool _603 = isnan(_599);
                bool _605 = _601 || _603;
                bool _607 = isnan(9.9999999747524270787835121154785e-07);
                bool _609 = _605 || _607;
                if (!_609)
                {
                    float _611 = _389 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _613 = _405 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _615 = _441 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _617 = _611 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _619 = _611 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _621 = _611 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _623 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _617);
                    float _625 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[24].x, _619);
                    float _627 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[26].x, _621);
                    float _629 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _623);
                    float _631 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _625);
                    float _633 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _627);
                    float _635 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _629);
                    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _631);
                    float _639 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _633);
                    float _641 = _635 * _635;
                    float _643 = fma(_637, _637, _641);
                    float _645 = fma(_639, _639, _643);
                    float _647 = rsqrt(_645);
                    float _649 = _647 * 9.9999999747524270787835121154785e-07;
                    float _651 = _637 * _649;
                    float _653 = _635 * _649;
                    float _655 = _639 * _649;
                    _491 = _653;
                    _497 = _651;
                    _493 = _655;
                    _573 = true;
                }
                else
                {
                    float _657 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _659 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _661 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _663 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _665 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[14].y, _657);
                    float _667 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[14].x, _659);
                    float _669 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[14].z, _661);
                    float _671 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[14].w, _663);
                    float _673 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[16].y, _665);
                    float _675 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[16].x, _667);
                    float _677 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[16].z, _669);
                    float _679 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[16].w, _671);
                    float _681 = _389 * _673;
                    float _683 = _405 * _675;
                    float _685 = _441 * _677;
                    float _687 = _681 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _689 = _681 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _691 = _681 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _693 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[25].x, _687);
                    float _695 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[24].x, _689);
                    float _697 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[26].x, _691);
                    float _699 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].z, _693);
                    float _701 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].z, _695);
                    float _703 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].z, _697);
                    float _705 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[25].w, _699);
                    float _707 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[24].w, _701);
                    float _709 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[26].w, _703);
                    float _711 = _705 * _705;
                    float _713 = fma(_707, _707, _711);
                    float _715 = fma(_709, _709, _713);
                    float _717 = rsqrt(_715);
                    float _719 = _717 * 9.9999999747524270787835121154785e-07;
                    float _721 = _707 * _719;
                    float _723 = _705 * _719;
                    float _725 = _709 * _719;
                    _491 = _723;
                    _497 = _721;
                    _493 = _725;
                    _573 = true;
                }
            }
            else
            {
                float _727 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _729 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _731 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _733 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _735 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].y, _727);
                float _737 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].x, _729);
                float _739 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].z, _731);
                float _741 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].w, _733);
                float _743 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].y, _735);
                float _745 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].x, _737);
                float _747 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].z, _739);
                float _749 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].w, _741);
                float _751 = _389 * _743;
                float _753 = _405 * _745;
                float _755 = _441 * _747;
                float _757 = _751 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _759 = _751 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _761 = _751 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _763 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[25].x, _757);
                float _765 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[24].x, _759);
                float _767 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[26].x, _761);
                float _769 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].z, _763);
                float _771 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].z, _765);
                float _773 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].z, _767);
                float _775 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[25].w, _769);
                float _777 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[24].w, _771);
                float _779 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[26].w, _773);
                float _781 = _775 * _775;
                float _783 = fma(_777, _777, _781);
                float _785 = fma(_779, _779, _783);
                float _787 = rsqrt(_785);
                float _789 = _787 * 9.9999999747524270787835121154785e-07;
                float _791 = _777 * _789;
                float _793 = _775 * _789;
                float _795 = _779 * _789;
                _491 = _793;
                _497 = _791;
                _493 = _795;
            }
        }
    }
    _573 = false;
    float _797 = _491;
    float _799 = _497;
    float _801 = _493;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _807 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _811 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _815 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _811;
    out.m_56.y = _815;
    out.m_56.z = _817;
    out.m_56.w = _813;
    bool _819 = !_807;
    float _839;
    float _841;
    if (!_819)
    {
        float _821 = in.m_58.x;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _825 = float(_85);
        float _827 = _821 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _831 = _829 * _823;
        float _833 = floor(_831);
        float _835 = -_833;
        float _837 = _831 + _835;
        _839 = _825;
        _841 = _837;
        _843 = true;
    }
    else
    {
        float _845 = float(_85);
        float _847 = 1.0 / _845;
        float _849 = _119 * _847;
        _839 = _845;
        _841 = _849;
    }
    _843 = false;
    float _851 = _839;
    float _853 = _841;
    float _855 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _857 = int(_855);
    float _859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _861 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _863 = int(_861);
    float _865 = float(_857);
    float _867 = 1.0 / _865;
    float _869 = float(uint(_863));
    int _871 = ~_863;
    int _873 = _871 + 1;
    float _875 = 1.0 / _869;
    int _877 = ~_863;
    int _879 = _877 + 1;
    float _881 = float(_863);
    float _883 = _119 * _867;
    float _885 = trunc(_883);
    int _887 = int(_885);
    int _889 = as_type<int>(_875) + (-2);
    float _891 = float(uint(_887));
    float _893 = as_type<float>(_889) * _891;
    float _895 = in.m_58.x;
    float _897 = in.m_58.y;
    float _899 = trunc(_893);
    float _901 = precise::max(_899, 0.0);
    uint _904 = uint(_901);
    int _906 = _873 * int(_904);
    int _908 = _906 + _887;
    float _910 = float(uint(_908));
    float _912 = as_type<float>(_889) * _910;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _916 = _914 != 0;
    float _918 = float(_887);
    float _920 = trunc(_912);
    float _922 = precise::max(_920, 0.0);
    uint _924 = uint(_922);
    bool _926 = !_916;
    float _928 = _926 ? 7.345489978790283203125 : 1.0;
    bool _930 = _918 >= _881;
    bool _932 = isnan(_918);
    bool _934 = _930 || _932;
    bool _936 = isnan(_881);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = _928 * _895;
    float _944 = trunc(_940);
    int _946 = int(_944);
    int _948 = int(_904) + int(_924);
    float _950 = floor(_942);
    int _952 = _879 * _948;
    int _954 = _952 + _887;
    bool _956 = uint(_954) >= uint(_863);
    float _958 = 1.0 / _851;
    bool _960 = !_956;
    int _962 = _960 ? 0 : (-1);
    bool _964 = _863 == 0;
    float _966 = -_950;
    float _968 = _942 + _966;
    int _970 = ~_948;
    int _972 = _970 + _962;
    int _974 = _972 + 1;
    float _976 = _968 * _881;
    float _978 = _119 * _881;
    int _980 = _863 * _974;
    int _982 = _980 + _887;
    int _984 = ~_946;
    int _986 = _984 + 1;
    int _988 = _986 + 1;
    float _990 = trunc(_976);
    int _992 = int(_990);
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _996 = _994 != 0;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1000 = _998 != 0;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1004 = _1002 != 0;
    bool _1006 = !_964;
    int _1008 = _1006 ? _982 : (-1);
    float _1010 = _978 * _958;
    int _1012 = _863 + (-1);
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1016 = _1014 != 0;
    int _1018 = _1008 * _988;
    bool _1020 = !_1000;
    int _1022 = _1020 ? 0 : 1;
    float _1024 = trunc(_1010);
    int _1026 = int(_1024);
    bool _1028 = !_1016;
    int _1030 = _1028 ? 0 : 1;
    int _1032 = _946 * _1012;
    int _1034 = _1032 + _1018;
    bool _1036 = !_996;
    int _1038 = _1036 ? 0 : 1;
    int _1040 = abs(_1022);
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1044 = _1042 != 0;
    bool _1046 = !_1004;
    int _1048 = _1046 ? 0 : 1;
    int _1050 = _1034 * _1040;
    int _1052 = abs(_1038);
    int _1054 = abs(_1030);
    bool _1056 = !_1044;
    int _1058 = _1056 ? 0 : 1;
    int _1060 = abs(_1048);
    int _1062 = _992 * _1054;
    int _1064 = _1062 + _887;
    float _1066 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    int _1068 = abs(_1058);
    int _1070 = _1026 * _1052;
    int _1072 = _1070 + _1050;
    float _1074 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1078 = _1076 != 0;
    int _1080 = _1064 * _1060;
    int _1082 = _1080 + _1072;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1086 = _1084 != 0;
    float _1088 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1092 = _1090 != 0;
    int _1094 = _992 * _1068;
    int _1096 = _1094 + _1082;
    int _1098 = ~_863;
    int _1100 = _1098 + 1;
    float _1102 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1066);
    float _1104 = float(uint(_1064));
    float _1106 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1074);
    float _1108 = float(uint(_1096));
    float _1110 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1088);
    int _1112 = ~_863;
    int _1114 = _1112 + 1;
    float _1116 = as_type<float>(_889) * _1104;
    bool _1118 = _895 > 0.5;
    float _1120 = as_type<float>(_889) * _1108;
    float _1122 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1102);
    float _1124 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1106);
    float _1126 = trunc(_1116);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = trunc(_1120);
    float _1134 = precise::max(_1132, 0.0);
    uint _1136 = uint(_1134);
    int _1138 = _1100 * int(_1136);
    int _1140 = _1138 + _1096;
    float _1142 = float(uint(_1140));
    float _1144 = as_type<float>(_889) * _1142;
    float _1146 = trunc(_1144);
    float _1148 = precise::max(_1146, 0.0);
    uint _1150 = uint(_1148);
    int _1152 = ~_863;
    int _1154 = _1152 + 1;
    int _1156 = int(_1136) + int(_1150);
    float _1158 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    int _1160 = _1114 * _1156;
    int _1162 = _1160 + _1096;
    float _1164 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1158);
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1168 = uint(_1162) >= uint(_863);
    float _1170 = _895 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1174 = !_1168;
    int _1176 = _1174 ? 0 : (-1);
    float _1178 = -_1166;
    float _1180 = fma(_1170, 2.0, _1178);
    float _1182 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1172);
    int _1184 = ~_1156;
    int _1186 = _1184 + _1176;
    int _1188 = _1186 + 1;
    float _1190 = _897 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1192 = _1154 * int(_1130);
    int _1194 = _1192 + _1064;
    int _1196 = _863 * _1188;
    int _1198 = _1196 + _1096;
    bool _1200 = _897 > 0.5;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1206 = float(uint(_1194));
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1210 = !_964;
    int _1212 = _1210 ? _1198 : (-1);
    float _1214 = 1.0 / _1204;
    float _1216 = as_type<float>(_889) * _1206;
    float _1218 = fma(_1190, -2.0, _1208);
    int _1220 = _1212 >> 31;
    int _1222 = _1212 & 3;
    bool _1224 = _1222 != 0;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1228 = _1220 & 3;
    float _1230 = trunc(_1216);
    float _1232 = precise::max(_1230, 0.0);
    uint _1234 = uint(_1232);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1236;
    float _1240 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1226);
    int _1242 = _1212 + _1228;
    float _1244 = in.m_54.x;
    float _1246 = in.m_54.y;
    float _1248 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1164);
    int _1250 = ~_863;
    int _1252 = _1250 + 1;
    float _1254 = _797 * _797;
    int _1256 = _1242 >> 2;
    float _1258 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1110);
    float _1260 = _1238 * _1214;
    float _1262 = -_119;
    float _1264 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1180);
    int _1266 = _1256 << 4;
    int _1268 = _1266 + 368;
    float _1270 = -_199;
    int _1272 = _1118 ? as_type<int>(_1270) : as_type<int>(_199);
    uint _1274 = uint(int(uint(_1268) >> uint(2)));
    uint _1276 = uint(int(uint(int(_1274)) >> uint(2)));
    int _1278 = int(_1274) & 3;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[int(_1276)][_1278];
    int _1282 = int(_1274) + 1;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    int _1286 = _1282 & 3;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[int(_1284)][_1286];
    int _1290 = int(_1130) + int(_1234);
    float _1292 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1182);
    float _1294 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1218);
    float _1296 = fma(_799, _799, _1254);
    float _1298 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1240);
    bool _1300 = !_1086;
    float _1302 = _1300 ? _199 : as_type<float>(_1272);
    int _1304 = _1252 * _1290;
    int _1306 = _1304 + _1064;
    float _1308 = fma(_801, _801, _1296);
    int _1310 = _1212 & 3;
    bool _1312 = _1310 != 0;
    float _1314 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1316 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1318 = -_203;
    int _1320 = _1200 ? as_type<int>(_1318) : as_type<int>(_203);
    float _1322 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _1324 = uint(_1310) > 1u;
    float _1326 = rsqrt(_1308);
    bool _1328 = !_1092;
    float _1330 = _1328 ? _203 : as_type<float>(_1320);
    float _1332 = _1322 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1334 = _1268 + 8;
    uint _1336 = uint(int(uint(_1334) >> uint(2)));
    uint _1338 = uint(int(uint(int(_1336)) >> uint(2)));
    int _1340 = int(_1336) & 3;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[int(_1338)][_1340];
    int _1344 = int(_1336) + 1;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    int _1348 = _1344 & 3;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[int(_1346)][_1348];
    bool _1352 = uint(_1306) >= uint(_863);
    float _1354 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1356 = _1224 ? 0 : 1;
    float _1358 = _1332 * _1314;
    bool _1360 = !_1352;
    int _1362 = _1360 ? 0 : (-1);
    float _1364 = _1354 * _859;
    int _1366 = ~_1356;
    int _1368 = _1366 + 1;
    int _1370 = _1368 + 1;
    int _1372 = _1370;
    if (!_1324)
    {
        int _1374 = ~_1356;
        int _1376 = _1374 + 1;
        _1372 = _1376;
    }
    int _1378 = _1372;
    int _1380 = ~_1290;
    int _1382 = _1380 + _1362;
    int _1384 = _1382 + 1;
    float _1386 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1388 = int(_1386);
    bool _1390 = !_1312;
    int _1392 = _1390 ? 0 : 1;
    float _1394 = _1326 * _801;
    int _1396 = abs(_1378);
    float _1398 = _1326 * _799;
    bool _1400 = _1310 != 3;
    int _1402 = abs(_1392);
    float _1404 = _1326 * _797;
    int _1406 = ~_1396;
    int _1408 = _1406 + 1;
    int _1410 = _1408 + 1;
    int _1412 = _863 * _1384;
    int _1414 = _1412 + _1064;
    bool _1416 = uint(_1310) >= 2u;
    int _1418 = ~_1402;
    int _1420 = _1418 + 1;
    int _1422 = _1420 + 1;
    float _1424 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1426 = _1394 * _1424;
    int _1428 = _1416 ? 0 : 1;
    int _1430 = _1410 * as_type<int>(_1288);
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1434 = -_1426;
    float _1436 = fma(_1398, _1432, _1434);
    int _1438 = ~_1428;
    int _1440 = _1438 + 1;
    int _1442 = _1440 + 1;
    int _1444 = _1422 * as_type<int>(_1280);
    int _1446 = _1444 + _1430;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1450 = _1404 * _1448;
    int _1452 = _1442;
    if (_1400)
    {
        int _1454 = ~_1428;
        int _1456 = _1454 + 1;
        _1452 = _1456;
    }
    int _1458 = _1452;
    float _1460 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1462 = _1398 * _1460;
    float _1464 = _1436 * _1436;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1468 = -_1450;
    float _1470 = fma(_1394, _1466, _1468);
    bool _1472 = _1310 != 3;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1476 = -_1462;
    float _1478 = fma(_1404, _1474, _1476);
    int _1480 = abs(_1458);
    float _1482 = fma(_1470, _1470, _1464);
    bool _1484 = !_1472;
    int _1486 = _1484 ? 0 : (-1);
    float _1488 = fma(_1478, _1478, _1482);
    bool _1490 = !_1078;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = abs(_1486);
    int _1496 = ~_1480;
    int _1498 = _1496 + 1;
    int _1500 = _1498 + 1;
    float _1502 = rsqrt(_1488);
    int _1504 = abs(_1388);
    int _1506 = abs(_1492);
    int _1508 = _1500 * as_type<int>(_1342);
    int _1510 = _1508 + _1446;
    float _1512 = float(uint(_1388));
    float _1514 = _1248 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1516 = _1122 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    int _1518 = ~_1494;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    float _1524 = 1.0 / _1512;
    float _1526 = float(uint(_1504));
    int _1528 = ~_1506;
    int _1530 = _1528 + 1;
    int _1532 = _1530 + 1;
    int _1534 = _1522 * as_type<int>(_1350);
    int _1536 = _1534 + _1510;
    float _1538 = _405 * _1514;
    float _1540 = _389 * _1516;
    bool _1542 = !_964;
    int _1544 = _1542 ? _1414 : (-1);
    float _1546 = 1.0 / _1526;
    int _1548 = _1536 * _1532;
    float _1550 = _1470 * _1502;
    float _1552 = _1478 * _1502;
    float _1554 = _1436 * _1502;
    int _1556 = _1544 * _1506;
    int _1558 = _1556 + _1548;
    float _1560 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1562 = _1404 * _1552;
    int _1564 = as_type<int>(_1524) + (-2);
    float _1566 = _1124 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1568 = float(uint(_1558));
    float _1570 = _1364 * _1398;
    int _1572 = abs(_1558);
    float _1574 = -_1562;
    float _1576 = fma(_1394, _1554, _1574);
    int _1578 = ~_1388;
    int _1580 = _1578 + 1;
    float _1582 = as_type<float>(_1564) * _1568;
    int _1584 = as_type<int>(_1546) + (-2);
    float _1586 = fma(_1358, _1550, _1570);
    float _1588 = float(uint(_1572));
    float _1590 = trunc(_1582);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    float _1596 = _441 * _1566;
    float _1598 = fma(_1560, _1576, _1586);
    float _1600 = as_type<float>(_1584) * _1588;
    float _1602 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1604 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1606 = _1258 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1608 = _1398 * _1554;
    float _1610 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1602);
    float _1612 = trunc(_1600);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    float _1618 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1604);
    int _1620 = ~_1504;
    int _1622 = _1620 + 1;
    float _1624 = _1364 * _1404;
    float _1626 = _1364 * _1394;
    float _1628 = -_1608;
    float _1630 = fma(_1404, _1550, _1628);
    int _1632 = _1580 * int(_1594);
    int _1634 = _1632 + _1558;
    float _1636 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1610);
    float _1638 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1618);
    float _1640 = fma(_1358, _1552, _1626);
    float _1642 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1644 = float(uint(_1634));
    float _1646 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1636);
    float _1648 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1638);
    float _1650 = fma(_1560, _1630, _1640);
    float _1652 = fma(_1358, _1554, _1624);
    int _1654 = _1622 * int(_1616);
    int _1656 = _1654 + _1572;
    float _1658 = as_type<float>(_1564) * _1644;
    float _1660 = _1646 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1662 = _1648 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1664 = _1394 * _1550;
    float _1666 = float(uint(_1656));
    float _1668 = _1660 + _1650;
    float _1670 = _1662 + _1598;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1674 = _853 + _1672;
    float _1676 = trunc(_1658);
    float _1678 = precise::max(_1676, 0.0);
    uint _1680 = uint(_1678);
    float _1682 = as_type<float>(_1584) * _1666;
    float _1684 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1642);
    float _1686 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1688 = _1670 + _1686;
    float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1692 = _1668 + _1690;
    float _1694 = fma(_1260, _1674, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1696 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1684);
    float _1698 = _1688 * _1688;
    float _1700 = trunc(_1682);
    float _1702 = precise::max(_1700, 0.0);
    uint _1704 = uint(_1702);
    float _1706 = _1692 * _1692;
    float _1708 = -_1664;
    float _1710 = fma(_1398, _1552, _1708);
    float _1712 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1696);
    int _1714 = ~_1504;
    int _1716 = _1714 + 1;
    float _1718 = _1698 + _1706;
    int _1720 = ~_1388;
    int _1722 = _1720 + 1;
    float _1724 = fma(_1560, _1710, _1652);
    int _1726 = int(_1594) + int(_1680);
    float _1728 = sqrt(_1718);
    bool _1730 = _853 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1732 = isnan(_853);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    float _1742 = _1712 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    int _1744 = _1722 * _1726;
    int _1746 = _1744 + _1558;
    int _1748 = int(_1616) + int(_1704);
    float _1750 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1752 = _853 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1754 = isnan(_853);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    bool _1764 = uint(_1746) >= uint(_1388);
    int _1766 = _1716 * _1748;
    int _1768 = _1766 + _1572;
    float _1770 = _1742 + _1724;
    float _1772 = -_1762;
    float _1774 = _1772 + 1.0;
    bool _1776 = !_1764;
    int _1778 = _1776 ? 0 : (-1);
    bool _1780 = _1728 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1782 = _1740 * _1774;
    bool _1784 = uint(_1768) >= uint(_1504);
    int _1786 = _1558 ^ _1388;
    float _1788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1790 = _1694 * _1782;
    bool _1792 = !_1784;
    int _1794 = _1792 ? 0 : (-1);
    uint _1796 = uint(int(uint(_1786) >> uint(31)));
    int _1798 = ~_1726;
    int _1800 = _1798 + _1778;
    int _1802 = _1800 + 1;
    int _1804 = ~_1794;
    int _1806 = _1748 + _1804;
    int _1808 = _1806 + 1;
    int _1810 = ~int(_1796);
    int _1812 = _1810 + 1;
    int _1814 = _1388 * _1802;
    int _1816 = _1814 + _1558;
    bool _1818 = _1388 == 0;
    int _1820 = _1808 ^ _1812;
    bool _1822 = _1388 == 0;
    float _1824 = as_type<float>(_1796);
    float _1826 = as_type<float>(_1748);
    float _1828 = as_type<float>(_1808);
    float _1830 = _1698;
    float _1832 = _1706;
    if (!_1780)
    {
        _1824 = _1670;
    }
    float _1834 = _1824;
    float _1836 = _1834;
    if (!_1780)
    {
        _1826 = _1668;
    }
    float _1838 = _1826;
    float _1840 = _1838;
    if (!_1780)
    {
        _1828 = _1770;
    }
    float _1842 = _1828;
    bool _1844 = !_1780;
    float _1846 = _1842;
    if (!_1844)
    {
        float _1848 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1852 = _1728 + _1850;
        float _1854 = rsqrt(_1718);
        float _1856 = _1852 * _1848;
        float _1858 = _1770 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1860 = _1856 * 0.15915493667125701904296875;
        float _1862 = _1860 * 6.283185482025146484375;
        float _1864 = sin(_1862);
        float _1866 = _1860 * 6.283185482025146484375;
        float _1868 = cos(_1866);
        float _1870 = fma(_1864, _1858, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1872 = _1854 * _1870;
        float _1874 = fma(_1688, _1872, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1876 = _1868 + (-1.0);
        float _1878 = fma(_1692, _1872, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1882 = _1874 + _1880;
        float _1884 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1888 = _1878 + _1886;
        float _1890 = _1882 * _1882;
        float _1892 = fma(_1770, _1868, _1884);
        float _1894 = _1888 * _1888;
        _1846 = _1892;
        _1830 = _1890;
        _1832 = _1894;
        _1836 = _1874;
        _1840 = _1878;
    }
    float _1896 = _1846;
    float _1898 = _1830;
    float _1900 = _1832;
    float _1902 = _1836;
    float _1904 = _1840;
    bool _1906 = !_1818;
    int _1908 = _1906 ? _1816 : (-1);
    float _1910 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1912 = ~_1812;
    int _1914 = _1912 + _1820;
    int _1916 = _1914 + 1;
    float _1918 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1920 = _1896 + _1918;
    float _1922 = float(_1908);
    float _1924 = -_1740;
    float _1926 = _1924 + 1.0;
    bool _1928 = !_1822;
    int _1930 = _1928 ? _1916 : (-1);
    float _1932 = fma(_1920, _1920, _1898);
    float _1934 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1936 = fma(_1910, _1922, _1264);
    float _1938 = float(_1930);
    float _1940 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1790);
    float _1942 = _1302 + 0.5;
    float _1944 = _1932 + _1900;
    float _1946 = -_1292;
    float _1948 = _1946 + 1.0;
    float _1950 = -_1294;
    float _1952 = fma(_1934, _1938, _1950);
    float _1954 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1940);
    float _1956 = fma(_1910, _1942, _1936);
    float _1958 = _1330 + (-0.5);
    float _1960 = sqrt(_1944);
    float _1962 = -_1934;
    float _1964 = fma(_1962, _1958, _1952);
    float _1966 = -_1948;
    float _1968 = fma(_1302, _1966, _1956);
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1974 = -_1298;
    float _1976 = _1974 + 1.0;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1980 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1984 = _1954 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1986 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1988 = fma(_1330, _1976, _1964);
    bool _1990 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1992 = isnan(_1960);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1998 = _1994 || _1996;
    out.m_60.x = _1980;
    out.m_60.y = _1982;
    out.m_60.z = _1986;
    out.m_60.w = _1984;
    out.m_62.x = _1968;
    out.m_62.y = _1988;
    float _2000 = _1970;
    float _2002 = _1988;
    float _2004 = _1968;
    float _2006 = _1984;
    if (!_1998)
    {
        _2000 = 1.0;
    }
    float _2008 = _2000;
    bool _2010 = !_1998;
    float _2012 = _2008;
    if (!_2010)
    {
        bool _2014 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2016 = isnan(_1960);
        bool _2018 = _2014 || _2016;
        bool _2020 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2022 = _2018 || _2020;
        if (!_2022)
        {
            float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2026 = _1960 + _2024;
            float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2030 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2028;
            float _2032 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2034 = _2032 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2036 = 1.0 / _2030;
            float _2038 = _2026 * _2036;
            float _2040 = fma(_2038, _2034, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2012 = _2040;
            _2042 = true;
        }
        else
        {
            bool _2044 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2046 = isnan(_1960);
            bool _2048 = _2044 || _2046;
            bool _2050 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2052 = _2048 || _2050;
            if (!_2052)
            {
                float _2054 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2056 = _1960 + _2054;
                float _2058 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2060 = _2058 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2062 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2064 = _2062 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2066 = 1.0 / _2060;
                float _2068 = _2056 * _2066;
                float _2070 = fma(_2068, _2064, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2012 = _2070;
                _2042 = true;
            }
            else
            {
                _2012 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2042 = false;
    float _2072 = _2012;
    float _2074 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2076 = _1896 + _2074;
    float _2078 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2080 = _1902 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2084 = _1904 + _2082;
    float _2086 = fma(_2076, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2088 = fma(_2080, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2090 = fma(_2084, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2094 = _2086 + _2092;
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2098 = _2088 + _2096;
    float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2102 = _2090 + _2100;
    float _2104 = _2094 * _2094;
    float _2106 = fma(_2098, _2098, _2104);
    float _2108 = fma(_2102, _2102, _2106);
    float _2110 = rsqrt(_2108);
    float _2112 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2114 = _2098 * _2112;
    float _2116 = _2102 * _2112;
    float _2118 = _2114 * _2114;
    float _2120 = _2116 * _2116;
    float _2122 = _2118 + _2120;
    float _2124 = sqrt(_2122);
    bool _2126 = _2124 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2128 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2130 = _2124 + _2128;
    float _2132 = _2102;
    float _2134 = _2122;
    float _2136 = _2130;
    float _2138 = _2094;
    float _2140 = _2114;
    if (_2126)
    {
        float _2142 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2132 = _2142;
    }
    float _2144 = _2132;
    if (_2126)
    {
        float _2146 = rsqrt(_2122);
        _2134 = _2146;
    }
    float _2148 = _2134;
    if (_2126)
    {
        float _2150 = _2130 * _2144;
        _2136 = _2150;
    }
    float _2152 = _2136;
    if (_2126)
    {
        float _2154 = _2152 * 0.15915493667125701904296875;
        _2002 = _2154;
    }
    float _2156 = _2002;
    float _2158 = _2110;
    if (_2126)
    {
        float _2160 = _2156 * 6.283185482025146484375;
        float _2162 = sin(_2160);
        _2158 = _2162;
    }
    float _2164 = _2158;
    float _2166 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2168 = precise::max(0.0, _2166);
    float _2170 = _2144;
    float _2172 = _2168;
    if (_2126)
    {
        float _2174 = _2156 * 6.283185482025146484375;
        float _2176 = cos(_2174);
        _2170 = _2176;
    }
    float _2178 = _2170;
    float _2180 = -_2112;
    float _2182 = -_2168;
    float _2184 = fma(_2094, _2180, _2182);
    if (!_2126)
    {
        _2138 = _2116;
    }
    float _2186 = _2138;
    float _2188 = _2186;
    if (_2126)
    {
        float _2190 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2172 = _2190;
    }
    float _2192 = _2172;
    float _2194 = _2164;
    float _2196 = _2192;
    if (_2126)
    {
        float _2198 = fma(_2164, _2192, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2004 = _2198;
    }
    float _2200 = _2004;
    float _2202 = _2200;
    if (!_2126)
    {
        _2194 = _2184;
    }
    float _2204 = _2194;
    float _2206 = _2204;
    float _2208 = _2178;
    if (_2126)
    {
        float _2210 = _2178 + (-1.0);
        _2196 = _2210;
    }
    float _2212 = _2196;
    float _2214 = _2212;
    if (_2126)
    {
        float _2216 = _2148 * _2200;
        _2006 = _2216;
    }
    float _2218 = _2006;
    float _2220 = sqrt(_2108);
    if (_2126)
    {
        float _2222 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2202 = _2222;
    }
    float _2224 = _2202;
    if (_2126)
    {
        float _2226 = _2114 * _2218;
        _2140 = _2226;
    }
    float _2228 = _2140;
    if (!_2126)
    {
        _2214 = _2118;
    }
    float _2230 = _2214;
    float _2232 = _2230;
    if (_2126)
    {
        float _2234 = _2116 * _2218;
        _2188 = _2234;
    }
    float _2236 = _2188;
    if (_2126)
    {
        float _2238 = fma(_2184, _2178, _2224);
        _2206 = _2238;
    }
    float _2240 = _2206;
    if (_2126)
    {
        float _2242 = _2228 * _2228;
        _2232 = _2242;
    }
    float _2244 = _2232;
    if (!_2126)
    {
        _2208 = _2120;
    }
    float _2246 = _2208;
    float _2248 = _2246;
    if (_2126)
    {
        float _2250 = _2236 * _2236;
        _2248 = _2250;
    }
    float _2252 = _2248;
    float _2254 = fma(_2240, _2240, _2244);
    float _2256 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2258 = _2254 + _2252;
    float _2260 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2264 = fma(_2220, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2262);
    float _2266 = precise::clamp(_2264, 0.0, 1.0);
    float _2268 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2270 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2256);
    float _2272 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2260);
    float _2274 = rsqrt(_2258);
    float _2276 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2278 = -_2266;
    float _2280 = _2278 + 1.0;
    float _2282 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2272);
    float _2284 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2286 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2276);
    float _2288 = _2282 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2290 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2284);
    float _2292 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2286);
    float _2294 = abs(_2280);
    float _2296 = log2(_2294);
    float _2298 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2300 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2290);
    float _2302 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2304 = -_2298;
    float _2306 = fma(_2304, _2268, 1.0);
    float _2308 = _2274 * _2228;
    float _2310 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2270);
    float _2312 = _2300 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2314 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2316 = _2274 * _2240;
    float _2318 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2320 = _2274 * _2236;
    float _2322 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2314);
    float _2324 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2326 = -_2318;
    float _2328 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2326);
    float _2330 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2332 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2322);
    float _2334 = log2(_2306);
    float _2336 = -_2320;
    float _2338 = fma(_2336, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2328);
    float _2340 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2342 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2332);
    float _2344 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2346 = fma(_2338, -0.5, 0.5);
    float _2348 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2340);
    float _2350 = fma(_2338, 0.5, 0.5);
    float _2352 = exp2(_2330);
    float _2354 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2344);
    float _2356 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2348);
    float _2358 = _2316 + 1.0;
    float _2360 = fma(_2350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2362 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2354);
    float _2364 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2356);
    float _2366 = 1.0 / _2342;
    float _2368 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2362);
    float _2370 = fma(_2350, _2360, -0.212114393711090087890625);
    float _2372 = _2334 * 0.693147182464599609375;
    float _2374 = fma(_2350, _2370, 1.570728778839111328125);
    float _2376 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2378 = sqrt(_2346);
    float _2380 = -_2316;
    float _2382 = fma(_2352, _2358, _2380);
    float _2384 = fma(_2382, 0.5, 0.5);
    float _2386 = _2364 * _2366;
    float _2388 = _2368 * _2366;
    float _2390 = fma(_2386, 0.5, 0.5);
    float _2392 = fma(_2388, -0.5, 0.5);
    float _2394 = _2378 * 0.636619746685028076171875;
    float3 _6277 = float3(_2390, _2392, _2376);
    float _2396 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6277, float3(0.0), isnan(_6277)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6277, float3(0.0), isnan(_6277)), level(0.0)).x;
    float _2398 = -_2374;
    float _2400 = fma(_2394, _2398, 1.0);
    float3 _6293 = float3(_2390, _2392, _2376);
    float4 _2403 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6293, float3(0.0), isnan(_6293)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6293, float3(0.0), isnan(_6293)), level(0.0)).xyzw;
    float _2405 = _2403.x;
    float _2407 = _2403.y;
    float _2409 = _2403.z;
    float _2411 = _2403.w;
    float2 _6310 = float2(_2400, _2384);
    float3 _2415 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6310, float2(0.0), isnan(_6310)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6310, float2(0.0), isnan(_6310)), level(0.0)).xyz;
    float _2417 = _2415.x;
    float _2419 = _2415.y;
    float _2421 = _2415.z;
    float _2423 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2425 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2427 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2425);
    float _2429 = exp2(_2423);
    float _2431 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2427);
    float _2433 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2431);
    float _2435 = _2433 + _2342;
    out.gl_Position.x = _2364;
    out.gl_Position.y = _2368;
    out.gl_Position.z = _2433;
    out.gl_Position.w = _2342;
    float _2437 = _2435 * 0.5;
    float _2439 = -_2429;
    float _2441 = _2439 + 1.0;
    float _2443 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2445 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _2437;
    out.m_64.w = _2342;
    out.m_47.x = _2443;
    float _2447 = _2445 * _2396;
    float _2449 = -_2445;
    float _2451 = _2449 + 1.0;
    float _2453 = _2411 * _2447;
    float _2455 = _2411 * _2451;
    float _2457 = _2421 * _2447;
    float _2459 = fma(_2417, _2453, _2405);
    float _2461 = fma(_2419, _2453, _2407);
    float _2463 = fma(_2411, _2457, _2409);
    out.m_66.x = _2459;
    out.m_66.y = _2461;
    out.m_66.z = _2463;
    out.m_66.w = _2455;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_56 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2042 = false;
    bool _843 = false;
    bool _573 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2520 = as_type<float>(_101);
        out.gl_Position.z = _2520;
    }
    if (!_89)
    {
        return out;
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2588 = as_type<float>(_137);
        out.gl_Position.z = _2588;
    }
    if (_131)
    {
        return out;
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _161 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _159);
    float _163 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _165 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _161);
    float _167 = _161;
    float _169 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _171 = _141;
    if (!_157)
    {
        float _173 = _141 * _141;
        float _175 = _173 * 0.5;
        _167 = _175;
    }
    float _177 = _167;
    float _179 = _177;
    if (!_157)
    {
        float _181 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    int _185 = as_type<int>(_139) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_139) & 2;
    bool _191 = _189 != 0;
    float _193 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _163);
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _193);
    bool _197 = !_187;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_191;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_157;
    float _207 = _183;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _141 * _211;
        float _221 = exp2(_219);
        float _223 = _217 * 0.693147182464599609375;
        float _225 = 1.0 / _223;
        float _227 = 1.0 / _215;
        float _229 = _221 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _225, _141);
        float _235 = _233 * _227;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
        _169 = _221;
    }
    float _239 = _207;
    float _241 = _169;
    bool _243 = !_157;
    float _245 = _241;
    if (!_243)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _141 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _171 = _265;
        _245 = _253;
    }
    float _267 = _171;
    float _269 = _245;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _277 = _269;
    float _279 = _271;
    float _281 = _275;
    if (!_157)
    {
        float _283 = _119 * _119;
        float _285 = _283 * 0.5;
        _277 = _285;
    }
    float _287 = _277;
    float _289 = fma(_267, _143, _271);
    float _291 = fma(_267, _145, _273);
    float _293 = fma(_267, _147, _275);
    if (!_157)
    {
        float _295 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _295;
    }
    float _297 = _279;
    bool _299 = !_157;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _309 = _307 + 1.0;
        float _311 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = _119 * _305;
        float _315 = exp2(_313);
        float _317 = _311 * 0.693147182464599609375;
        float _319 = 1.0 / _317;
        float _321 = 1.0 / _309;
        float _323 = _315 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _319, _119);
        float _329 = _327 * _321;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _331;
        _281 = _315;
    }
    float _333 = _301;
    float _335 = _281;
    float _337 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = _335;
    if (!_157)
    {
        _339 = _119;
    }
    float _341 = _339;
    bool _343 = !_157;
    float _345 = _341;
    if (!_343)
    {
        float _347 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = log2(_347);
        float _351 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _353 = _351 + 1.0;
        float _355 = 1.0 / _353;
        float _357 = _119 * _349;
        float _359 = exp2(_357);
        float _361 = -_359;
        float _363 = _361 + 1.0;
        float _365 = _363 * _355;
        _345 = _365;
    }
    float _367 = _345;
    float _369 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _371 = fma(_367, _145, _337);
    float _373 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _375 = fma(_367, _143, _369);
    float _377 = -_371;
    float _379 = _291 + _377;
    float _381 = fma(_367, _147, _373);
    float _383 = -_375;
    float _385 = _289 + _383;
    float _387 = _379 * _379;
    float _389 = sqrt(_195);
    float _391 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _393 = -_381;
    float _395 = _293 + _393;
    float _397 = fma(_385, _385, _387);
    float _399 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _391);
    float _401 = _379 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _403 = fma(_395, _395, _397);
    float _405 = sqrt(_165);
    float _407 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _399);
    float _409 = _379 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _411 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[14].y, _401);
    float _413 = _379 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _415 = _379 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _417 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[14].x, _409);
    float _419 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[16].y, _411);
    float _421 = sqrt(_403);
    float _423 = in.m_54.w;
    float _425 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[14].z, _413);
    float _427 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[16].x, _417);
    float _429 = _389 * _419;
    float _431 = in.m_44.x;
    float _433 = in.m_44.y;
    float _435 = in.m_44.z;
    float _437 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[16].z, _425);
    float _439 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[14].w, _415);
    float _441 = sqrt(_407);
    float _443 = _405 * _427;
    float _445 = _429 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _447 = _429 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _449 = _429 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _451 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[16].w, _439);
    float _453 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[24].x, _445);
    float _455 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[25].x, _447);
    bool _457 = _421 >= 9.9999999747524270787835121154785e-07;
    bool _459 = isnan(_421);
    bool _461 = _457 || _459;
    bool _463 = isnan(9.9999999747524270787835121154785e-07);
    bool _465 = _461 || _463;
    float _467 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[26].x, _449);
    float _469 = _441 * _437;
    float _471 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[24].z, _453);
    float _473 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[26].z, _467);
    float _475 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[25].z, _455);
    float _477 = fma(_289, _423, _431);
    float _479 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[24].w, _471);
    float _481 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[26].w, _473);
    float _483 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[25].w, _475);
    float _485 = fma(_291, _423, _433);
    float _487 = fma(_293, _423, _435);
    float _489 = _473;
    float _491 = _483;
    float _493 = _481;
    if (_465)
    {
        _489 = _479;
    }
    float _495 = _489;
    float _497 = _495;
    if (!_465)
    {
        bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _501 = !_499;
        if (!_501)
        {
            float _503 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _505 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _507 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _509 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _503);
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _505);
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _507);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _509);
            float _517 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _511);
            float _519 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _513);
            float _521 = _389 * _515;
            float _523 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _525 = _405 * _517;
            float _527 = _441 * _519;
            float _529 = _521 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _531 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _523);
            float _533 = _521 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _535 = _521 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _537 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].x, _529);
            float _539 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _531);
            float _541 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].x, _533);
            float _543 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].x, _535);
            float _545 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[25].z, _537);
            float _547 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[24].z, _541);
            float _549 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[26].z, _543);
            float _551 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[25].w, _545);
            float _553 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[24].w, _547);
            float _555 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[26].w, _549);
            float _557 = _551 * _551;
            float _559 = fma(_553, _553, _557);
            float _561 = fma(_555, _555, _559);
            float _563 = rsqrt(_561);
            float _565 = _563 * 9.9999999747524270787835121154785e-07;
            float _567 = _553 * _565;
            float _569 = _551 * _565;
            float _571 = _555 * _565;
            _491 = _569;
            _497 = _567;
            _493 = _571;
            _573 = true;
        }
        else
        {
            float _575 = _145 * _145;
            float _577 = fma(_143, _143, _575);
            float _579 = fma(_147, _147, _577);
            float _581 = sqrt(_579);
            bool _583 = _581 >= 9.9999999747524270787835121154785e-07;
            bool _585 = isnan(_581);
            bool _587 = _583 || _585;
            bool _589 = isnan(9.9999999747524270787835121154785e-07);
            bool _591 = _587 || _589;
            if (!_591)
            {
                float _593 = _433 * _433;
                float _595 = fma(_431, _431, _593);
                float _597 = fma(_435, _435, _595);
                float _599 = sqrt(_597);
                bool _601 = _599 >= 9.9999999747524270787835121154785e-07;
                bool _603 = isnan(_599);
                bool _605 = _601 || _603;
                bool _607 = isnan(9.9999999747524270787835121154785e-07);
                bool _609 = _605 || _607;
                if (!_609)
                {
                    float _611 = _389 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _613 = _405 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _615 = _441 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _617 = _611 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _619 = _611 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _621 = _611 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _623 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _617);
                    float _625 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[24].x, _619);
                    float _627 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[26].x, _621);
                    float _629 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _623);
                    float _631 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _625);
                    float _633 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _627);
                    float _635 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _629);
                    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _631);
                    float _639 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _633);
                    float _641 = _635 * _635;
                    float _643 = fma(_637, _637, _641);
                    float _645 = fma(_639, _639, _643);
                    float _647 = rsqrt(_645);
                    float _649 = _647 * 9.9999999747524270787835121154785e-07;
                    float _651 = _637 * _649;
                    float _653 = _635 * _649;
                    float _655 = _639 * _649;
                    _491 = _653;
                    _497 = _651;
                    _493 = _655;
                    _573 = true;
                }
                else
                {
                    float _657 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _659 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _661 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _663 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _665 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[14].y, _657);
                    float _667 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[14].x, _659);
                    float _669 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[14].z, _661);
                    float _671 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[14].w, _663);
                    float _673 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[16].y, _665);
                    float _675 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[16].x, _667);
                    float _677 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[16].z, _669);
                    float _679 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[16].w, _671);
                    float _681 = _389 * _673;
                    float _683 = _405 * _675;
                    float _685 = _441 * _677;
                    float _687 = _681 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _689 = _681 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _691 = _681 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _693 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[25].x, _687);
                    float _695 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[24].x, _689);
                    float _697 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[26].x, _691);
                    float _699 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].z, _693);
                    float _701 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].z, _695);
                    float _703 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].z, _697);
                    float _705 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[25].w, _699);
                    float _707 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[24].w, _701);
                    float _709 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[26].w, _703);
                    float _711 = _705 * _705;
                    float _713 = fma(_707, _707, _711);
                    float _715 = fma(_709, _709, _713);
                    float _717 = rsqrt(_715);
                    float _719 = _717 * 9.9999999747524270787835121154785e-07;
                    float _721 = _707 * _719;
                    float _723 = _705 * _719;
                    float _725 = _709 * _719;
                    _491 = _723;
                    _497 = _721;
                    _493 = _725;
                    _573 = true;
                }
            }
            else
            {
                float _727 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _729 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _731 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _733 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _735 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].y, _727);
                float _737 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].x, _729);
                float _739 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].z, _731);
                float _741 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].w, _733);
                float _743 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].y, _735);
                float _745 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].x, _737);
                float _747 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].z, _739);
                float _749 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].w, _741);
                float _751 = _389 * _743;
                float _753 = _405 * _745;
                float _755 = _441 * _747;
                float _757 = _751 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _759 = _751 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _761 = _751 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _763 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[25].x, _757);
                float _765 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[24].x, _759);
                float _767 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[26].x, _761);
                float _769 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].z, _763);
                float _771 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].z, _765);
                float _773 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].z, _767);
                float _775 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[25].w, _769);
                float _777 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[24].w, _771);
                float _779 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[26].w, _773);
                float _781 = _775 * _775;
                float _783 = fma(_777, _777, _781);
                float _785 = fma(_779, _779, _783);
                float _787 = rsqrt(_785);
                float _789 = _787 * 9.9999999747524270787835121154785e-07;
                float _791 = _777 * _789;
                float _793 = _775 * _789;
                float _795 = _779 * _789;
                _491 = _793;
                _497 = _791;
                _493 = _795;
            }
        }
    }
    _573 = false;
    float _797 = _491;
    float _799 = _497;
    float _801 = _493;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _807 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _811 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _815 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _811;
    out.m_56.y = _815;
    out.m_56.z = _817;
    out.m_56.w = _813;
    bool _819 = !_807;
    float _839;
    float _841;
    if (!_819)
    {
        float _821 = in.m_58.x;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _825 = float(_85);
        float _827 = _821 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _831 = _829 * _823;
        float _833 = floor(_831);
        float _835 = -_833;
        float _837 = _831 + _835;
        _839 = _825;
        _841 = _837;
        _843 = true;
    }
    else
    {
        float _845 = float(_85);
        float _847 = 1.0 / _845;
        float _849 = _119 * _847;
        _839 = _845;
        _841 = _849;
    }
    _843 = false;
    float _851 = _839;
    float _853 = _841;
    float _855 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _857 = int(_855);
    float _859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _861 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _863 = int(_861);
    float _865 = float(_857);
    float _867 = 1.0 / _865;
    float _869 = float(uint(_863));
    int _871 = ~_863;
    int _873 = _871 + 1;
    float _875 = 1.0 / _869;
    int _877 = ~_863;
    int _879 = _877 + 1;
    float _881 = float(_863);
    float _883 = _119 * _867;
    float _885 = trunc(_883);
    int _887 = int(_885);
    int _889 = as_type<int>(_875) + (-2);
    float _891 = float(uint(_887));
    float _893 = as_type<float>(_889) * _891;
    float _895 = in.m_58.x;
    float _897 = in.m_58.y;
    float _899 = trunc(_893);
    float _901 = precise::max(_899, 0.0);
    uint _904 = uint(_901);
    int _906 = _873 * int(_904);
    int _908 = _906 + _887;
    float _910 = float(uint(_908));
    float _912 = as_type<float>(_889) * _910;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _916 = _914 != 0;
    float _918 = float(_887);
    float _920 = trunc(_912);
    float _922 = precise::max(_920, 0.0);
    uint _924 = uint(_922);
    bool _926 = !_916;
    float _928 = _926 ? 7.345489978790283203125 : 1.0;
    bool _930 = _918 >= _881;
    bool _932 = isnan(_918);
    bool _934 = _930 || _932;
    bool _936 = isnan(_881);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = _928 * _895;
    float _944 = trunc(_940);
    int _946 = int(_944);
    int _948 = int(_904) + int(_924);
    float _950 = floor(_942);
    int _952 = _879 * _948;
    int _954 = _952 + _887;
    bool _956 = uint(_954) >= uint(_863);
    float _958 = 1.0 / _851;
    bool _960 = !_956;
    int _962 = _960 ? 0 : (-1);
    bool _964 = _863 == 0;
    float _966 = -_950;
    float _968 = _942 + _966;
    int _970 = ~_948;
    int _972 = _970 + _962;
    int _974 = _972 + 1;
    float _976 = _968 * _881;
    float _978 = _119 * _881;
    int _980 = _863 * _974;
    int _982 = _980 + _887;
    int _984 = ~_946;
    int _986 = _984 + 1;
    int _988 = _986 + 1;
    float _990 = trunc(_976);
    int _992 = int(_990);
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _996 = _994 != 0;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1000 = _998 != 0;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1004 = _1002 != 0;
    bool _1006 = !_964;
    int _1008 = _1006 ? _982 : (-1);
    float _1010 = _978 * _958;
    int _1012 = _863 + (-1);
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1016 = _1014 != 0;
    int _1018 = _1008 * _988;
    bool _1020 = !_1000;
    int _1022 = _1020 ? 0 : 1;
    float _1024 = trunc(_1010);
    int _1026 = int(_1024);
    bool _1028 = !_1016;
    int _1030 = _1028 ? 0 : 1;
    int _1032 = _946 * _1012;
    int _1034 = _1032 + _1018;
    bool _1036 = !_996;
    int _1038 = _1036 ? 0 : 1;
    int _1040 = abs(_1022);
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1044 = _1042 != 0;
    bool _1046 = !_1004;
    int _1048 = _1046 ? 0 : 1;
    int _1050 = _1034 * _1040;
    int _1052 = abs(_1038);
    int _1054 = abs(_1030);
    bool _1056 = !_1044;
    int _1058 = _1056 ? 0 : 1;
    int _1060 = abs(_1048);
    int _1062 = _992 * _1054;
    int _1064 = _1062 + _887;
    float _1066 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    int _1068 = abs(_1058);
    int _1070 = _1026 * _1052;
    int _1072 = _1070 + _1050;
    float _1074 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1078 = _1076 != 0;
    int _1080 = _1064 * _1060;
    int _1082 = _1080 + _1072;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1086 = _1084 != 0;
    float _1088 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1092 = _1090 != 0;
    int _1094 = _992 * _1068;
    int _1096 = _1094 + _1082;
    int _1098 = ~_863;
    int _1100 = _1098 + 1;
    float _1102 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1066);
    float _1104 = float(uint(_1064));
    float _1106 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1074);
    float _1108 = float(uint(_1096));
    float _1110 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1088);
    int _1112 = ~_863;
    int _1114 = _1112 + 1;
    float _1116 = as_type<float>(_889) * _1104;
    bool _1118 = _895 > 0.5;
    float _1120 = as_type<float>(_889) * _1108;
    float _1122 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1102);
    float _1124 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1106);
    float _1126 = trunc(_1116);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = trunc(_1120);
    float _1134 = precise::max(_1132, 0.0);
    uint _1136 = uint(_1134);
    int _1138 = _1100 * int(_1136);
    int _1140 = _1138 + _1096;
    float _1142 = float(uint(_1140));
    float _1144 = as_type<float>(_889) * _1142;
    float _1146 = trunc(_1144);
    float _1148 = precise::max(_1146, 0.0);
    uint _1150 = uint(_1148);
    int _1152 = ~_863;
    int _1154 = _1152 + 1;
    int _1156 = int(_1136) + int(_1150);
    float _1158 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    int _1160 = _1114 * _1156;
    int _1162 = _1160 + _1096;
    float _1164 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1158);
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1168 = uint(_1162) >= uint(_863);
    float _1170 = _895 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1174 = !_1168;
    int _1176 = _1174 ? 0 : (-1);
    float _1178 = -_1166;
    float _1180 = fma(_1170, 2.0, _1178);
    float _1182 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1172);
    int _1184 = ~_1156;
    int _1186 = _1184 + _1176;
    int _1188 = _1186 + 1;
    float _1190 = _897 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1192 = _1154 * int(_1130);
    int _1194 = _1192 + _1064;
    int _1196 = _863 * _1188;
    int _1198 = _1196 + _1096;
    bool _1200 = _897 > 0.5;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1206 = float(uint(_1194));
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1210 = !_964;
    int _1212 = _1210 ? _1198 : (-1);
    float _1214 = 1.0 / _1204;
    float _1216 = as_type<float>(_889) * _1206;
    float _1218 = fma(_1190, -2.0, _1208);
    int _1220 = _1212 >> 31;
    int _1222 = _1212 & 3;
    bool _1224 = _1222 != 0;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1228 = _1220 & 3;
    float _1230 = trunc(_1216);
    float _1232 = precise::max(_1230, 0.0);
    uint _1234 = uint(_1232);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1236;
    float _1240 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1226);
    int _1242 = _1212 + _1228;
    float _1244 = in.m_54.x;
    float _1246 = in.m_54.y;
    float _1248 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1164);
    int _1250 = ~_863;
    int _1252 = _1250 + 1;
    float _1254 = _797 * _797;
    int _1256 = _1242 >> 2;
    float _1258 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1110);
    float _1260 = _1238 * _1214;
    float _1262 = -_119;
    float _1264 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1180);
    int _1266 = _1256 << 4;
    int _1268 = _1266 + 368;
    float _1270 = -_199;
    int _1272 = _1118 ? as_type<int>(_1270) : as_type<int>(_199);
    uint _1274 = uint(int(uint(_1268) >> uint(2)));
    uint _1276 = uint(int(uint(int(_1274)) >> uint(2)));
    int _1278 = int(_1274) & 3;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[int(_1276)][_1278];
    int _1282 = int(_1274) + 1;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    int _1286 = _1282 & 3;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[int(_1284)][_1286];
    int _1290 = int(_1130) + int(_1234);
    float _1292 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1182);
    float _1294 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1218);
    float _1296 = fma(_799, _799, _1254);
    float _1298 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1240);
    bool _1300 = !_1086;
    float _1302 = _1300 ? _199 : as_type<float>(_1272);
    int _1304 = _1252 * _1290;
    int _1306 = _1304 + _1064;
    float _1308 = fma(_801, _801, _1296);
    int _1310 = _1212 & 3;
    bool _1312 = _1310 != 0;
    float _1314 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1316 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1318 = -_203;
    int _1320 = _1200 ? as_type<int>(_1318) : as_type<int>(_203);
    float _1322 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _1324 = uint(_1310) > 1u;
    float _1326 = rsqrt(_1308);
    bool _1328 = !_1092;
    float _1330 = _1328 ? _203 : as_type<float>(_1320);
    float _1332 = _1322 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1334 = _1268 + 8;
    uint _1336 = uint(int(uint(_1334) >> uint(2)));
    uint _1338 = uint(int(uint(int(_1336)) >> uint(2)));
    int _1340 = int(_1336) & 3;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[int(_1338)][_1340];
    int _1344 = int(_1336) + 1;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    int _1348 = _1344 & 3;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[int(_1346)][_1348];
    bool _1352 = uint(_1306) >= uint(_863);
    float _1354 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1356 = _1224 ? 0 : 1;
    float _1358 = _1332 * _1314;
    bool _1360 = !_1352;
    int _1362 = _1360 ? 0 : (-1);
    float _1364 = _1354 * _859;
    int _1366 = ~_1356;
    int _1368 = _1366 + 1;
    int _1370 = _1368 + 1;
    int _1372 = _1370;
    if (!_1324)
    {
        int _1374 = ~_1356;
        int _1376 = _1374 + 1;
        _1372 = _1376;
    }
    int _1378 = _1372;
    int _1380 = ~_1290;
    int _1382 = _1380 + _1362;
    int _1384 = _1382 + 1;
    float _1386 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1388 = int(_1386);
    bool _1390 = !_1312;
    int _1392 = _1390 ? 0 : 1;
    float _1394 = _1326 * _801;
    int _1396 = abs(_1378);
    float _1398 = _1326 * _799;
    bool _1400 = _1310 != 3;
    int _1402 = abs(_1392);
    float _1404 = _1326 * _797;
    int _1406 = ~_1396;
    int _1408 = _1406 + 1;
    int _1410 = _1408 + 1;
    int _1412 = _863 * _1384;
    int _1414 = _1412 + _1064;
    bool _1416 = uint(_1310) >= 2u;
    int _1418 = ~_1402;
    int _1420 = _1418 + 1;
    int _1422 = _1420 + 1;
    float _1424 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1426 = _1394 * _1424;
    int _1428 = _1416 ? 0 : 1;
    int _1430 = _1410 * as_type<int>(_1288);
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1434 = -_1426;
    float _1436 = fma(_1398, _1432, _1434);
    int _1438 = ~_1428;
    int _1440 = _1438 + 1;
    int _1442 = _1440 + 1;
    int _1444 = _1422 * as_type<int>(_1280);
    int _1446 = _1444 + _1430;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1450 = _1404 * _1448;
    int _1452 = _1442;
    if (_1400)
    {
        int _1454 = ~_1428;
        int _1456 = _1454 + 1;
        _1452 = _1456;
    }
    int _1458 = _1452;
    float _1460 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1462 = _1398 * _1460;
    float _1464 = _1436 * _1436;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1468 = -_1450;
    float _1470 = fma(_1394, _1466, _1468);
    bool _1472 = _1310 != 3;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1476 = -_1462;
    float _1478 = fma(_1404, _1474, _1476);
    int _1480 = abs(_1458);
    float _1482 = fma(_1470, _1470, _1464);
    bool _1484 = !_1472;
    int _1486 = _1484 ? 0 : (-1);
    float _1488 = fma(_1478, _1478, _1482);
    bool _1490 = !_1078;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = abs(_1486);
    int _1496 = ~_1480;
    int _1498 = _1496 + 1;
    int _1500 = _1498 + 1;
    float _1502 = rsqrt(_1488);
    int _1504 = abs(_1388);
    int _1506 = abs(_1492);
    int _1508 = _1500 * as_type<int>(_1342);
    int _1510 = _1508 + _1446;
    float _1512 = float(uint(_1388));
    float _1514 = _1248 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1516 = _1122 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    int _1518 = ~_1494;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    float _1524 = 1.0 / _1512;
    float _1526 = float(uint(_1504));
    int _1528 = ~_1506;
    int _1530 = _1528 + 1;
    int _1532 = _1530 + 1;
    int _1534 = _1522 * as_type<int>(_1350);
    int _1536 = _1534 + _1510;
    float _1538 = _405 * _1514;
    float _1540 = _389 * _1516;
    bool _1542 = !_964;
    int _1544 = _1542 ? _1414 : (-1);
    float _1546 = 1.0 / _1526;
    int _1548 = _1536 * _1532;
    float _1550 = _1470 * _1502;
    float _1552 = _1478 * _1502;
    float _1554 = _1436 * _1502;
    int _1556 = _1544 * _1506;
    int _1558 = _1556 + _1548;
    float _1560 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1562 = _1404 * _1552;
    int _1564 = as_type<int>(_1524) + (-2);
    float _1566 = _1124 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1568 = float(uint(_1558));
    float _1570 = _1364 * _1398;
    int _1572 = abs(_1558);
    float _1574 = -_1562;
    float _1576 = fma(_1394, _1554, _1574);
    int _1578 = ~_1388;
    int _1580 = _1578 + 1;
    float _1582 = as_type<float>(_1564) * _1568;
    int _1584 = as_type<int>(_1546) + (-2);
    float _1586 = fma(_1358, _1550, _1570);
    float _1588 = float(uint(_1572));
    float _1590 = trunc(_1582);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    float _1596 = _441 * _1566;
    float _1598 = fma(_1560, _1576, _1586);
    float _1600 = as_type<float>(_1584) * _1588;
    float _1602 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1604 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1606 = _1258 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1608 = _1398 * _1554;
    float _1610 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1602);
    float _1612 = trunc(_1600);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    float _1618 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1604);
    int _1620 = ~_1504;
    int _1622 = _1620 + 1;
    float _1624 = _1364 * _1404;
    float _1626 = _1364 * _1394;
    float _1628 = -_1608;
    float _1630 = fma(_1404, _1550, _1628);
    int _1632 = _1580 * int(_1594);
    int _1634 = _1632 + _1558;
    float _1636 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1610);
    float _1638 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1618);
    float _1640 = fma(_1358, _1552, _1626);
    float _1642 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1644 = float(uint(_1634));
    float _1646 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1636);
    float _1648 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1638);
    float _1650 = fma(_1560, _1630, _1640);
    float _1652 = fma(_1358, _1554, _1624);
    int _1654 = _1622 * int(_1616);
    int _1656 = _1654 + _1572;
    float _1658 = as_type<float>(_1564) * _1644;
    float _1660 = _1646 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1662 = _1648 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1664 = _1394 * _1550;
    float _1666 = float(uint(_1656));
    float _1668 = _1660 + _1650;
    float _1670 = _1662 + _1598;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1674 = _853 + _1672;
    float _1676 = trunc(_1658);
    float _1678 = precise::max(_1676, 0.0);
    uint _1680 = uint(_1678);
    float _1682 = as_type<float>(_1584) * _1666;
    float _1684 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1642);
    float _1686 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1688 = _1670 + _1686;
    float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1692 = _1668 + _1690;
    float _1694 = fma(_1260, _1674, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1696 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1684);
    float _1698 = _1688 * _1688;
    float _1700 = trunc(_1682);
    float _1702 = precise::max(_1700, 0.0);
    uint _1704 = uint(_1702);
    float _1706 = _1692 * _1692;
    float _1708 = -_1664;
    float _1710 = fma(_1398, _1552, _1708);
    float _1712 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1696);
    int _1714 = ~_1504;
    int _1716 = _1714 + 1;
    float _1718 = _1698 + _1706;
    int _1720 = ~_1388;
    int _1722 = _1720 + 1;
    float _1724 = fma(_1560, _1710, _1652);
    int _1726 = int(_1594) + int(_1680);
    float _1728 = sqrt(_1718);
    bool _1730 = _853 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1732 = isnan(_853);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    float _1742 = _1712 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    int _1744 = _1722 * _1726;
    int _1746 = _1744 + _1558;
    int _1748 = int(_1616) + int(_1704);
    float _1750 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1752 = _853 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1754 = isnan(_853);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    bool _1764 = uint(_1746) >= uint(_1388);
    int _1766 = _1716 * _1748;
    int _1768 = _1766 + _1572;
    float _1770 = _1742 + _1724;
    float _1772 = -_1762;
    float _1774 = _1772 + 1.0;
    bool _1776 = !_1764;
    int _1778 = _1776 ? 0 : (-1);
    bool _1780 = _1728 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1782 = _1740 * _1774;
    bool _1784 = uint(_1768) >= uint(_1504);
    int _1786 = _1558 ^ _1388;
    float _1788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1790 = _1694 * _1782;
    bool _1792 = !_1784;
    int _1794 = _1792 ? 0 : (-1);
    uint _1796 = uint(int(uint(_1786) >> uint(31)));
    int _1798 = ~_1726;
    int _1800 = _1798 + _1778;
    int _1802 = _1800 + 1;
    int _1804 = ~_1794;
    int _1806 = _1748 + _1804;
    int _1808 = _1806 + 1;
    int _1810 = ~int(_1796);
    int _1812 = _1810 + 1;
    int _1814 = _1388 * _1802;
    int _1816 = _1814 + _1558;
    bool _1818 = _1388 == 0;
    int _1820 = _1808 ^ _1812;
    bool _1822 = _1388 == 0;
    float _1824 = as_type<float>(_1796);
    float _1826 = as_type<float>(_1748);
    float _1828 = as_type<float>(_1808);
    float _1830 = _1698;
    float _1832 = _1706;
    if (!_1780)
    {
        _1824 = _1670;
    }
    float _1834 = _1824;
    float _1836 = _1834;
    if (!_1780)
    {
        _1826 = _1668;
    }
    float _1838 = _1826;
    float _1840 = _1838;
    if (!_1780)
    {
        _1828 = _1770;
    }
    float _1842 = _1828;
    bool _1844 = !_1780;
    float _1846 = _1842;
    if (!_1844)
    {
        float _1848 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1852 = _1728 + _1850;
        float _1854 = rsqrt(_1718);
        float _1856 = _1852 * _1848;
        float _1858 = _1770 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1860 = _1856 * 0.15915493667125701904296875;
        float _1862 = _1860 * 6.283185482025146484375;
        float _1864 = sin(_1862);
        float _1866 = _1860 * 6.283185482025146484375;
        float _1868 = cos(_1866);
        float _1870 = fma(_1864, _1858, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1872 = _1854 * _1870;
        float _1874 = fma(_1688, _1872, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1876 = _1868 + (-1.0);
        float _1878 = fma(_1692, _1872, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1882 = _1874 + _1880;
        float _1884 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1888 = _1878 + _1886;
        float _1890 = _1882 * _1882;
        float _1892 = fma(_1770, _1868, _1884);
        float _1894 = _1888 * _1888;
        _1846 = _1892;
        _1830 = _1890;
        _1832 = _1894;
        _1836 = _1874;
        _1840 = _1878;
    }
    float _1896 = _1846;
    float _1898 = _1830;
    float _1900 = _1832;
    float _1902 = _1836;
    float _1904 = _1840;
    bool _1906 = !_1818;
    int _1908 = _1906 ? _1816 : (-1);
    float _1910 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1912 = ~_1812;
    int _1914 = _1912 + _1820;
    int _1916 = _1914 + 1;
    float _1918 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1920 = _1896 + _1918;
    float _1922 = float(_1908);
    float _1924 = -_1740;
    float _1926 = _1924 + 1.0;
    bool _1928 = !_1822;
    int _1930 = _1928 ? _1916 : (-1);
    float _1932 = fma(_1920, _1920, _1898);
    float _1934 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1936 = fma(_1910, _1922, _1264);
    float _1938 = float(_1930);
    float _1940 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1790);
    float _1942 = _1302 + 0.5;
    float _1944 = _1932 + _1900;
    float _1946 = -_1292;
    float _1948 = _1946 + 1.0;
    float _1950 = -_1294;
    float _1952 = fma(_1934, _1938, _1950);
    float _1954 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1940);
    float _1956 = fma(_1910, _1942, _1936);
    float _1958 = _1330 + (-0.5);
    float _1960 = sqrt(_1944);
    float _1962 = -_1934;
    float _1964 = fma(_1962, _1958, _1952);
    float _1966 = -_1948;
    float _1968 = fma(_1302, _1966, _1956);
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1974 = -_1298;
    float _1976 = _1974 + 1.0;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1980 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1984 = _1954 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1986 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1988 = fma(_1330, _1976, _1964);
    bool _1990 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1992 = isnan(_1960);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1998 = _1994 || _1996;
    out.m_60.x = _1980;
    out.m_60.y = _1982;
    out.m_60.z = _1986;
    out.m_60.w = _1984;
    out.m_62.x = _1968;
    out.m_62.y = _1988;
    float _2000 = _1970;
    float _2002 = _1988;
    float _2004 = _1968;
    float _2006 = _1984;
    if (!_1998)
    {
        _2000 = 1.0;
    }
    float _2008 = _2000;
    bool _2010 = !_1998;
    float _2012 = _2008;
    if (!_2010)
    {
        bool _2014 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2016 = isnan(_1960);
        bool _2018 = _2014 || _2016;
        bool _2020 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2022 = _2018 || _2020;
        if (!_2022)
        {
            float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2026 = _1960 + _2024;
            float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2030 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2028;
            float _2032 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2034 = _2032 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2036 = 1.0 / _2030;
            float _2038 = _2026 * _2036;
            float _2040 = fma(_2038, _2034, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2012 = _2040;
            _2042 = true;
        }
        else
        {
            bool _2044 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2046 = isnan(_1960);
            bool _2048 = _2044 || _2046;
            bool _2050 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2052 = _2048 || _2050;
            if (!_2052)
            {
                float _2054 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2056 = _1960 + _2054;
                float _2058 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2060 = _2058 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2062 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2064 = _2062 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2066 = 1.0 / _2060;
                float _2068 = _2056 * _2066;
                float _2070 = fma(_2068, _2064, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2012 = _2070;
                _2042 = true;
            }
            else
            {
                _2012 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2042 = false;
    float _2072 = _2012;
    float _2074 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2076 = _1896 + _2074;
    float _2078 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2080 = _1902 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2084 = _1904 + _2082;
    float _2086 = fma(_2076, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2088 = fma(_2080, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2090 = fma(_2084, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2094 = _2086 + _2092;
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2098 = _2088 + _2096;
    float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2102 = _2090 + _2100;
    float _2104 = _2094 * _2094;
    float _2106 = fma(_2098, _2098, _2104);
    float _2108 = fma(_2102, _2102, _2106);
    float _2110 = rsqrt(_2108);
    float _2112 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2114 = _2098 * _2112;
    float _2116 = _2102 * _2112;
    float _2118 = _2114 * _2114;
    float _2120 = _2116 * _2116;
    float _2122 = _2118 + _2120;
    float _2124 = sqrt(_2122);
    bool _2126 = _2124 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2128 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2130 = _2124 + _2128;
    float _2132 = _2102;
    float _2134 = _2122;
    float _2136 = _2130;
    float _2138 = _2094;
    float _2140 = _2114;
    if (_2126)
    {
        float _2142 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2132 = _2142;
    }
    float _2144 = _2132;
    if (_2126)
    {
        float _2146 = rsqrt(_2122);
        _2134 = _2146;
    }
    float _2148 = _2134;
    if (_2126)
    {
        float _2150 = _2130 * _2144;
        _2136 = _2150;
    }
    float _2152 = _2136;
    if (_2126)
    {
        float _2154 = _2152 * 0.15915493667125701904296875;
        _2002 = _2154;
    }
    float _2156 = _2002;
    float _2158 = _2110;
    if (_2126)
    {
        float _2160 = _2156 * 6.283185482025146484375;
        float _2162 = sin(_2160);
        _2158 = _2162;
    }
    float _2164 = _2158;
    float _2166 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2168 = precise::max(0.0, _2166);
    float _2170 = _2144;
    float _2172 = _2168;
    if (_2126)
    {
        float _2174 = _2156 * 6.283185482025146484375;
        float _2176 = cos(_2174);
        _2170 = _2176;
    }
    float _2178 = _2170;
    float _2180 = -_2112;
    float _2182 = -_2168;
    float _2184 = fma(_2094, _2180, _2182);
    if (!_2126)
    {
        _2138 = _2116;
    }
    float _2186 = _2138;
    float _2188 = _2186;
    if (_2126)
    {
        float _2190 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2172 = _2190;
    }
    float _2192 = _2172;
    float _2194 = _2164;
    float _2196 = _2192;
    if (_2126)
    {
        float _2198 = fma(_2164, _2192, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2004 = _2198;
    }
    float _2200 = _2004;
    float _2202 = _2200;
    if (!_2126)
    {
        _2194 = _2184;
    }
    float _2204 = _2194;
    float _2206 = _2204;
    float _2208 = _2178;
    if (_2126)
    {
        float _2210 = _2178 + (-1.0);
        _2196 = _2210;
    }
    float _2212 = _2196;
    float _2214 = _2212;
    if (_2126)
    {
        float _2216 = _2148 * _2200;
        _2006 = _2216;
    }
    float _2218 = _2006;
    float _2220 = sqrt(_2108);
    if (_2126)
    {
        float _2222 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2202 = _2222;
    }
    float _2224 = _2202;
    if (_2126)
    {
        float _2226 = _2114 * _2218;
        _2140 = _2226;
    }
    float _2228 = _2140;
    if (!_2126)
    {
        _2214 = _2118;
    }
    float _2230 = _2214;
    float _2232 = _2230;
    if (_2126)
    {
        float _2234 = _2116 * _2218;
        _2188 = _2234;
    }
    float _2236 = _2188;
    if (_2126)
    {
        float _2238 = fma(_2184, _2178, _2224);
        _2206 = _2238;
    }
    float _2240 = _2206;
    if (_2126)
    {
        float _2242 = _2228 * _2228;
        _2232 = _2242;
    }
    float _2244 = _2232;
    if (!_2126)
    {
        _2208 = _2120;
    }
    float _2246 = _2208;
    float _2248 = _2246;
    if (_2126)
    {
        float _2250 = _2236 * _2236;
        _2248 = _2250;
    }
    float _2252 = _2248;
    float _2254 = fma(_2240, _2240, _2244);
    float _2256 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2258 = _2254 + _2252;
    float _2260 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2264 = fma(_2220, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2262);
    float _2266 = precise::clamp(_2264, 0.0, 1.0);
    float _2268 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2270 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2256);
    float _2272 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2260);
    float _2274 = rsqrt(_2258);
    float _2276 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2278 = -_2266;
    float _2280 = _2278 + 1.0;
    float _2282 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2272);
    float _2284 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2286 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2276);
    float _2288 = _2282 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2290 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2284);
    float _2292 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2286);
    float _2294 = abs(_2280);
    float _2296 = log2(_2294);
    float _2298 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2300 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2290);
    float _2302 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2304 = -_2298;
    float _2306 = fma(_2304, _2268, 1.0);
    float _2308 = _2274 * _2228;
    float _2310 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2270);
    float _2312 = _2300 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2314 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2316 = _2274 * _2240;
    float _2318 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2320 = _2274 * _2236;
    float _2322 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2314);
    float _2324 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2326 = -_2318;
    float _2328 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2326);
    float _2330 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2332 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2322);
    float _2334 = log2(_2306);
    float _2336 = -_2320;
    float _2338 = fma(_2336, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2328);
    float _2340 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2342 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2332);
    float _2344 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2346 = fma(_2338, -0.5, 0.5);
    float _2348 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2340);
    float _2350 = fma(_2338, 0.5, 0.5);
    float _2352 = exp2(_2330);
    float _2354 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2344);
    float _2356 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2348);
    float _2358 = _2316 + 1.0;
    float _2360 = fma(_2350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2362 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2354);
    float _2364 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2356);
    float _2366 = 1.0 / _2342;
    float _2368 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2362);
    float _2370 = fma(_2350, _2360, -0.212114393711090087890625);
    float _2372 = _2334 * 0.693147182464599609375;
    float _2374 = fma(_2350, _2370, 1.570728778839111328125);
    float _2376 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2378 = sqrt(_2346);
    float _2380 = -_2316;
    float _2382 = fma(_2352, _2358, _2380);
    float _2384 = fma(_2382, 0.5, 0.5);
    float _2386 = _2364 * _2366;
    float _2388 = _2368 * _2366;
    float _2390 = fma(_2386, 0.5, 0.5);
    float _2392 = fma(_2388, -0.5, 0.5);
    float _2394 = _2378 * 0.636619746685028076171875;
    float3 _6277 = float3(_2390, _2392, _2376);
    float _2396 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6277, float3(0.0), isnan(_6277)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6277, float3(0.0), isnan(_6277)), level(0.0)).x;
    float _2398 = -_2374;
    float _2400 = fma(_2394, _2398, 1.0);
    float3 _6293 = float3(_2390, _2392, _2376);
    float4 _2403 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6293, float3(0.0), isnan(_6293)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6293, float3(0.0), isnan(_6293)), level(0.0)).xyzw;
    float _2405 = _2403.x;
    float _2407 = _2403.y;
    float _2409 = _2403.z;
    float _2411 = _2403.w;
    float2 _6310 = float2(_2400, _2384);
    float3 _2415 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6310, float2(0.0), isnan(_6310)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6310, float2(0.0), isnan(_6310)), level(0.0)).xyz;
    float _2417 = _2415.x;
    float _2419 = _2415.y;
    float _2421 = _2415.z;
    float _2423 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2425 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2427 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2425);
    float _2429 = exp2(_2423);
    float _2431 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2427);
    float _2433 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2431);
    float _2435 = _2433 + _2342;
    out.gl_Position.x = _2364;
    out.gl_Position.y = _2368;
    out.gl_Position.z = _2433;
    out.gl_Position.w = _2342;
    float _2437 = _2435 * 0.5;
    float _2439 = -_2429;
    float _2441 = _2439 + 1.0;
    float _2443 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2445 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _2437;
    out.m_64.w = _2342;
    out.m_47.x = _2443;
    float _2447 = _2445 * _2396;
    float _2449 = -_2445;
    float _2451 = _2449 + 1.0;
    float _2453 = _2411 * _2447;
    float _2455 = _2411 * _2451;
    float _2457 = _2421 * _2447;
    float _2459 = fma(_2417, _2453, _2405);
    float _2461 = fma(_2419, _2453, _2407);
    float _2463 = fma(_2411, _2457, _2409);
    out.m_66.x = _2459;
    out.m_66.y = _2461;
    out.m_66.z = _2463;
    out.m_66.w = _2455;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    bool _2042 = false;
    bool _843 = false;
    bool _573 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _80 = in.m_44.w;
    float _82 = trunc(_80);
    int _85 = int(_82);
    bool _89 = _85 >= 1;
    float _91 = 0.0;
    if (!_89)
    {
        _91 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _93 = _91;
    float _95 = _93;
    if (!_89)
    {
        out.m_47.x = 0.0;
    }
    int _97 = 0;
    if (!_89)
    {
        float _99 = _93 * 5.0;
        _97 = as_type<int>(_99);
    }
    int _101 = _97;
    int _103 = _101;
    if (!_89)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2520 = as_type<float>(_101);
        out.gl_Position.z = _2520;
    }
    if (!_89)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _105 = in.m_49.w;
    bool _107 = _105 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _109 = isnan(_105);
    bool _111 = _107 || _109;
    bool _113 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _115 = _111 || _113;
    float _117 = -_105;
    float _119 = _117 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _121 = 0.0;
    if (_115)
    {
        float _123 = float(_85);
        _121 = _123;
    }
    float _125 = _121;
    bool _127 = _119 >= _125;
    bool _129 = !_115;
    bool _131 = _127 || _129;
    if (_131)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _133 = _95;
    if (_131)
    {
        out.m_47.x = 0.0;
    }
    if (_131)
    {
        float _135 = _133 * 5.0;
        _103 = as_type<int>(_135);
    }
    int _137 = _103;
    if (_131)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _2588 = as_type<float>(_137);
        out.gl_Position.z = _2588;
    }
    if (_131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _139 = as_type<float>(int(gl_VertexIndex));
    float _141 = _119 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _143 = in.m_49.x;
    float _145 = in.m_49.y;
    float _147 = in.m_49.z;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = (*spvDescriptorSet0.vp_c10)._m0[18].y * (*spvDescriptorSet0.vp_c10)._m0[18].y;
    float _161 = fma((*spvDescriptorSet0.vp_c10)._m0[18].x, (*spvDescriptorSet0.vp_c10)._m0[18].x, _159);
    float _163 = (*spvDescriptorSet0.vp_c10)._m0[19].y * (*spvDescriptorSet0.vp_c10)._m0[19].y;
    float _165 = fma((*spvDescriptorSet0.vp_c10)._m0[18].z, (*spvDescriptorSet0.vp_c10)._m0[18].z, _161);
    float _167 = _161;
    float _169 = (*spvDescriptorSet0.vp_c10)._m0[19].z;
    float _171 = _141;
    if (!_157)
    {
        float _173 = _141 * _141;
        float _175 = _173 * 0.5;
        _167 = _175;
    }
    float _177 = _167;
    float _179 = _177;
    if (!_157)
    {
        float _181 = _177 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _179 = _181;
    }
    float _183 = _179;
    int _185 = as_type<int>(_139) & 1;
    bool _187 = _185 != 0;
    int _189 = as_type<int>(_139) & 2;
    bool _191 = _189 != 0;
    float _193 = fma((*spvDescriptorSet0.vp_c10)._m0[19].x, (*spvDescriptorSet0.vp_c10)._m0[19].x, _163);
    float _195 = fma((*spvDescriptorSet0.vp_c10)._m0[19].z, (*spvDescriptorSet0.vp_c10)._m0[19].z, _193);
    bool _197 = !_187;
    float _199 = _197 ? (-0.5) : 0.5;
    bool _201 = !_191;
    float _203 = _201 ? (-0.5) : 0.5;
    bool _205 = !_157;
    float _207 = _183;
    if (!_205)
    {
        float _209 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _211 = log2(_209);
        float _213 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _215 = _213 + 1.0;
        float _217 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = _141 * _211;
        float _221 = exp2(_219);
        float _223 = _217 * 0.693147182464599609375;
        float _225 = 1.0 / _223;
        float _227 = 1.0 / _215;
        float _229 = _221 + (-1.0);
        float _231 = -_229;
        float _233 = fma(_231, _225, _141);
        float _235 = _233 * _227;
        float _237 = _235 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _207 = _237;
        _169 = _221;
    }
    float _239 = _207;
    float _241 = _169;
    bool _243 = !_157;
    float _245 = _241;
    if (!_243)
    {
        float _247 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _249 = log2(_247);
        float _251 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _253 = _251 + 1.0;
        float _255 = 1.0 / _253;
        float _257 = _141 * _249;
        float _259 = exp2(_257);
        float _261 = -_259;
        float _263 = _261 + 1.0;
        float _265 = _263 * _255;
        _171 = _265;
        _245 = _253;
    }
    float _267 = _171;
    float _269 = _245;
    float _271 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _273 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _275 = _239 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _277 = _269;
    float _279 = _271;
    float _281 = _275;
    if (!_157)
    {
        float _283 = _119 * _119;
        float _285 = _283 * 0.5;
        _277 = _285;
    }
    float _287 = _277;
    float _289 = fma(_267, _143, _271);
    float _291 = fma(_267, _145, _273);
    float _293 = fma(_267, _147, _275);
    if (!_157)
    {
        float _295 = _287 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _279 = _295;
    }
    float _297 = _279;
    bool _299 = !_157;
    float _301 = _297;
    if (!_299)
    {
        float _303 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _305 = log2(_303);
        float _307 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _309 = _307 + 1.0;
        float _311 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _313 = _119 * _305;
        float _315 = exp2(_313);
        float _317 = _311 * 0.693147182464599609375;
        float _319 = 1.0 / _317;
        float _321 = 1.0 / _309;
        float _323 = _315 + (-1.0);
        float _325 = -_323;
        float _327 = fma(_325, _319, _119);
        float _329 = _327 * _321;
        float _331 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _301 = _331;
        _281 = _315;
    }
    float _333 = _301;
    float _335 = _281;
    float _337 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _339 = _335;
    if (!_157)
    {
        _339 = _119;
    }
    float _341 = _339;
    bool _343 = !_157;
    float _345 = _341;
    if (!_343)
    {
        float _347 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _349 = log2(_347);
        float _351 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _353 = _351 + 1.0;
        float _355 = 1.0 / _353;
        float _357 = _119 * _349;
        float _359 = exp2(_357);
        float _361 = -_359;
        float _363 = _361 + 1.0;
        float _365 = _363 * _355;
        _345 = _365;
    }
    float _367 = _345;
    float _369 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _371 = fma(_367, _145, _337);
    float _373 = _333 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _375 = fma(_367, _143, _369);
    float _377 = -_371;
    float _379 = _291 + _377;
    float _381 = fma(_367, _147, _373);
    float _383 = -_375;
    float _385 = _289 + _383;
    float _387 = _379 * _379;
    float _389 = sqrt(_195);
    float _391 = (*spvDescriptorSet0.vp_c10)._m0[20].y * (*spvDescriptorSet0.vp_c10)._m0[20].y;
    float _393 = -_381;
    float _395 = _293 + _393;
    float _397 = fma(_385, _385, _387);
    float _399 = fma((*spvDescriptorSet0.vp_c10)._m0[20].x, (*spvDescriptorSet0.vp_c10)._m0[20].x, _391);
    float _401 = _379 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    float _403 = fma(_395, _395, _397);
    float _405 = sqrt(_165);
    float _407 = fma((*spvDescriptorSet0.vp_c10)._m0[20].z, (*spvDescriptorSet0.vp_c10)._m0[20].z, _399);
    float _409 = _379 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    float _411 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[14].y, _401);
    float _413 = _379 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    float _415 = _379 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    float _417 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[14].x, _409);
    float _419 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[16].y, _411);
    float _421 = sqrt(_403);
    float _423 = in.m_54.w;
    float _425 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[14].z, _413);
    float _427 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[16].x, _417);
    float _429 = _389 * _419;
    float _431 = in.m_44.x;
    float _433 = in.m_44.y;
    float _435 = in.m_44.z;
    float _437 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[16].z, _425);
    float _439 = fma(_385, (*spvDescriptorSet0.vp_c10)._m0[14].w, _415);
    float _441 = sqrt(_407);
    float _443 = _405 * _427;
    float _445 = _429 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _447 = _429 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _449 = _429 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _451 = fma(_395, (*spvDescriptorSet0.vp_c10)._m0[16].w, _439);
    float _453 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[24].x, _445);
    float _455 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[25].x, _447);
    bool _457 = _421 >= 9.9999999747524270787835121154785e-07;
    bool _459 = isnan(_421);
    bool _461 = _457 || _459;
    bool _463 = isnan(9.9999999747524270787835121154785e-07);
    bool _465 = _461 || _463;
    float _467 = fma(_443, (*spvDescriptorSet0.vp_c8)._m0[26].x, _449);
    float _469 = _441 * _437;
    float _471 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[24].z, _453);
    float _473 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[26].z, _467);
    float _475 = fma(_469, (*spvDescriptorSet0.vp_c8)._m0[25].z, _455);
    float _477 = fma(_289, _423, _431);
    float _479 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[24].w, _471);
    float _481 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[26].w, _473);
    float _483 = fma(_451, (*spvDescriptorSet0.vp_c8)._m0[25].w, _475);
    float _485 = fma(_291, _423, _433);
    float _487 = fma(_293, _423, _435);
    float _489 = _473;
    float _491 = _483;
    float _493 = _481;
    if (_465)
    {
        _489 = _479;
    }
    float _495 = _489;
    float _497 = _495;
    if (!_465)
    {
        bool _499 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _501 = !_499;
        if (!_501)
        {
            float _503 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].y;
            float _505 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].x;
            float _507 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].z;
            float _509 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].y, _503);
            float _511 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].x, _505);
            float _513 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].z, _507);
            float _515 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].y, _509);
            float _517 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].x, _511);
            float _519 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].z, _513);
            float _521 = _389 * _515;
            float _523 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[15].w;
            float _525 = _405 * _517;
            float _527 = _441 * _519;
            float _529 = _521 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
            float _531 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[14].w, _523);
            float _533 = _521 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
            float _535 = _521 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
            float _537 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[25].x, _529);
            float _539 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[16].w, _531);
            float _541 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[24].x, _533);
            float _543 = fma(_525, (*spvDescriptorSet0.vp_c8)._m0[26].x, _535);
            float _545 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[25].z, _537);
            float _547 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[24].z, _541);
            float _549 = fma(_527, (*spvDescriptorSet0.vp_c8)._m0[26].z, _543);
            float _551 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[25].w, _545);
            float _553 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[24].w, _547);
            float _555 = fma(_539, (*spvDescriptorSet0.vp_c8)._m0[26].w, _549);
            float _557 = _551 * _551;
            float _559 = fma(_553, _553, _557);
            float _561 = fma(_555, _555, _559);
            float _563 = rsqrt(_561);
            float _565 = _563 * 9.9999999747524270787835121154785e-07;
            float _567 = _553 * _565;
            float _569 = _551 * _565;
            float _571 = _555 * _565;
            _491 = _569;
            _497 = _567;
            _493 = _571;
            _573 = true;
        }
        else
        {
            float _575 = _145 * _145;
            float _577 = fma(_143, _143, _575);
            float _579 = fma(_147, _147, _577);
            float _581 = sqrt(_579);
            bool _583 = _581 >= 9.9999999747524270787835121154785e-07;
            bool _585 = isnan(_581);
            bool _587 = _583 || _585;
            bool _589 = isnan(9.9999999747524270787835121154785e-07);
            bool _591 = _587 || _589;
            if (!_591)
            {
                float _593 = _433 * _433;
                float _595 = fma(_431, _431, _593);
                float _597 = fma(_435, _435, _595);
                float _599 = sqrt(_597);
                bool _601 = _599 >= 9.9999999747524270787835121154785e-07;
                bool _603 = isnan(_599);
                bool _605 = _601 || _603;
                bool _607 = isnan(9.9999999747524270787835121154785e-07);
                bool _609 = _605 || _607;
                if (!_609)
                {
                    float _611 = _389 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _613 = _405 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _615 = _441 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _617 = _611 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _619 = _611 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _621 = _611 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _623 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[25].x, _617);
                    float _625 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[24].x, _619);
                    float _627 = fma(_613, (*spvDescriptorSet0.vp_c8)._m0[26].x, _621);
                    float _629 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[25].z, _623);
                    float _631 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[24].z, _625);
                    float _633 = fma(_615, (*spvDescriptorSet0.vp_c8)._m0[26].z, _627);
                    float _635 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[25].w, _629);
                    float _637 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[24].w, _631);
                    float _639 = fma((*spvDescriptorSet0.vp_c10)._m0[15].w, (*spvDescriptorSet0.vp_c8)._m0[26].w, _633);
                    float _641 = _635 * _635;
                    float _643 = fma(_637, _637, _641);
                    float _645 = fma(_639, _639, _643);
                    float _647 = rsqrt(_645);
                    float _649 = _647 * 9.9999999747524270787835121154785e-07;
                    float _651 = _637 * _649;
                    float _653 = _635 * _649;
                    float _655 = _639 * _649;
                    _491 = _653;
                    _497 = _651;
                    _493 = _655;
                    _573 = true;
                }
                else
                {
                    float _657 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                    float _659 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                    float _661 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                    float _663 = _433 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                    float _665 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[14].y, _657);
                    float _667 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[14].x, _659);
                    float _669 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[14].z, _661);
                    float _671 = fma(_431, (*spvDescriptorSet0.vp_c10)._m0[14].w, _663);
                    float _673 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[16].y, _665);
                    float _675 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[16].x, _667);
                    float _677 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[16].z, _669);
                    float _679 = fma(_435, (*spvDescriptorSet0.vp_c10)._m0[16].w, _671);
                    float _681 = _389 * _673;
                    float _683 = _405 * _675;
                    float _685 = _441 * _677;
                    float _687 = _681 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                    float _689 = _681 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                    float _691 = _681 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                    float _693 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[25].x, _687);
                    float _695 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[24].x, _689);
                    float _697 = fma(_683, (*spvDescriptorSet0.vp_c8)._m0[26].x, _691);
                    float _699 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[25].z, _693);
                    float _701 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[24].z, _695);
                    float _703 = fma(_685, (*spvDescriptorSet0.vp_c8)._m0[26].z, _697);
                    float _705 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[25].w, _699);
                    float _707 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[24].w, _701);
                    float _709 = fma(_679, (*spvDescriptorSet0.vp_c8)._m0[26].w, _703);
                    float _711 = _705 * _705;
                    float _713 = fma(_707, _707, _711);
                    float _715 = fma(_709, _709, _713);
                    float _717 = rsqrt(_715);
                    float _719 = _717 * 9.9999999747524270787835121154785e-07;
                    float _721 = _707 * _719;
                    float _723 = _705 * _719;
                    float _725 = _709 * _719;
                    _491 = _723;
                    _497 = _721;
                    _493 = _725;
                    _573 = true;
                }
            }
            else
            {
                float _727 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
                float _729 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
                float _731 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
                float _733 = _145 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
                float _735 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].y, _727);
                float _737 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].x, _729);
                float _739 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].z, _731);
                float _741 = fma(_143, (*spvDescriptorSet0.vp_c10)._m0[14].w, _733);
                float _743 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].y, _735);
                float _745 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].x, _737);
                float _747 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].z, _739);
                float _749 = fma(_147, (*spvDescriptorSet0.vp_c10)._m0[16].w, _741);
                float _751 = _389 * _743;
                float _753 = _405 * _745;
                float _755 = _441 * _747;
                float _757 = _751 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
                float _759 = _751 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
                float _761 = _751 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
                float _763 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[25].x, _757);
                float _765 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[24].x, _759);
                float _767 = fma(_753, (*spvDescriptorSet0.vp_c8)._m0[26].x, _761);
                float _769 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[25].z, _763);
                float _771 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[24].z, _765);
                float _773 = fma(_755, (*spvDescriptorSet0.vp_c8)._m0[26].z, _767);
                float _775 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[25].w, _769);
                float _777 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[24].w, _771);
                float _779 = fma(_749, (*spvDescriptorSet0.vp_c8)._m0[26].w, _773);
                float _781 = _775 * _775;
                float _783 = fma(_777, _777, _781);
                float _785 = fma(_779, _779, _783);
                float _787 = rsqrt(_785);
                float _789 = _787 * 9.9999999747524270787835121154785e-07;
                float _791 = _777 * _789;
                float _793 = _775 * _789;
                float _795 = _779 * _789;
                _491 = _793;
                _497 = _791;
                _493 = _795;
            }
        }
    }
    _573 = false;
    float _797 = _491;
    float _799 = _497;
    float _801 = _493;
    float _803 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _805 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    bool _807 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _809 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _811 = _803 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _813 = (*spvDescriptorSet0.vp_c9)._m0[115].x * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _815 = _805 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _817 = _809 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    out.m_56.x = _811;
    out.m_56.y = _815;
    out.m_56.z = _817;
    out.m_56.w = _813;
    bool _819 = !_807;
    float _839;
    float _841;
    if (!_819)
    {
        float _821 = in.m_58.x;
        float _823 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _825 = float(_85);
        float _827 = _821 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _829 = fma(_827, (*spvDescriptorSet0.vp_c9)._m0[11].w, _119);
        float _831 = _829 * _823;
        float _833 = floor(_831);
        float _835 = -_833;
        float _837 = _831 + _835;
        _839 = _825;
        _841 = _837;
        _843 = true;
    }
    else
    {
        float _845 = float(_85);
        float _847 = 1.0 / _845;
        float _849 = _119 * _847;
        _839 = _845;
        _841 = _849;
    }
    _843 = false;
    float _851 = _839;
    float _853 = _841;
    float _855 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].y);
    int _857 = int(_855);
    float _859 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _203);
    float _861 = trunc((*spvDescriptorSet0.vp_c9)._m0[22].x);
    int _863 = int(_861);
    float _865 = float(_857);
    float _867 = 1.0 / _865;
    float _869 = float(uint(_863));
    int _871 = ~_863;
    int _873 = _871 + 1;
    float _875 = 1.0 / _869;
    int _877 = ~_863;
    int _879 = _877 + 1;
    float _881 = float(_863);
    float _883 = _119 * _867;
    float _885 = trunc(_883);
    int _887 = int(_885);
    int _889 = as_type<int>(_875) + (-2);
    float _891 = float(uint(_887));
    float _893 = as_type<float>(_889) * _891;
    float _895 = in.m_58.x;
    float _897 = in.m_58.y;
    float _899 = trunc(_893);
    float _901 = precise::max(_899, 0.0);
    uint _904 = uint(_901);
    int _906 = _873 * int(_904);
    int _908 = _906 + _887;
    float _910 = float(uint(_908));
    float _912 = as_type<float>(_889) * _910;
    int _914 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _916 = _914 != 0;
    float _918 = float(_887);
    float _920 = trunc(_912);
    float _922 = precise::max(_920, 0.0);
    uint _924 = uint(_922);
    bool _926 = !_916;
    float _928 = _926 ? 7.345489978790283203125 : 1.0;
    bool _930 = _918 >= _881;
    bool _932 = isnan(_918);
    bool _934 = _930 || _932;
    bool _936 = isnan(_881);
    bool _938 = _934 || _936;
    float _940 = float(_938);
    float _942 = _928 * _895;
    float _944 = trunc(_940);
    int _946 = int(_944);
    int _948 = int(_904) + int(_924);
    float _950 = floor(_942);
    int _952 = _879 * _948;
    int _954 = _952 + _887;
    bool _956 = uint(_954) >= uint(_863);
    float _958 = 1.0 / _851;
    bool _960 = !_956;
    int _962 = _960 ? 0 : (-1);
    bool _964 = _863 == 0;
    float _966 = -_950;
    float _968 = _942 + _966;
    int _970 = ~_948;
    int _972 = _970 + _962;
    int _974 = _972 + 1;
    float _976 = _968 * _881;
    float _978 = _119 * _881;
    int _980 = _863 * _974;
    int _982 = _980 + _887;
    int _984 = ~_946;
    int _986 = _984 + 1;
    int _988 = _986 + 1;
    float _990 = trunc(_976);
    int _992 = int(_990);
    int _994 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 16;
    bool _996 = _994 != 0;
    int _998 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 32;
    bool _1000 = _998 != 0;
    int _1002 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 64;
    bool _1004 = _1002 != 0;
    bool _1006 = !_964;
    int _1008 = _1006 ? _982 : (-1);
    float _1010 = _978 * _958;
    int _1012 = _863 + (-1);
    int _1014 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4096;
    bool _1016 = _1014 != 0;
    int _1018 = _1008 * _988;
    bool _1020 = !_1000;
    int _1022 = _1020 ? 0 : 1;
    float _1024 = trunc(_1010);
    int _1026 = int(_1024);
    bool _1028 = !_1016;
    int _1030 = _1028 ? 0 : 1;
    int _1032 = _946 * _1012;
    int _1034 = _1032 + _1018;
    bool _1036 = !_996;
    int _1038 = _1036 ? 0 : 1;
    int _1040 = abs(_1022);
    int _1042 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 128;
    bool _1044 = _1042 != 0;
    bool _1046 = !_1004;
    int _1048 = _1046 ? 0 : 1;
    int _1050 = _1034 * _1040;
    int _1052 = abs(_1038);
    int _1054 = abs(_1030);
    bool _1056 = !_1044;
    int _1058 = _1056 ? 0 : 1;
    int _1060 = abs(_1048);
    int _1062 = _992 * _1054;
    int _1064 = _1062 + _887;
    float _1066 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].y;
    int _1068 = abs(_1058);
    int _1070 = _1026 * _1052;
    int _1072 = _1070 + _1050;
    float _1074 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].z;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2097152;
    bool _1078 = _1076 != 0;
    int _1080 = _1064 * _1060;
    int _1082 = _1080 + _1072;
    int _1084 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _1086 = _1084 != 0;
    float _1088 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].w;
    int _1090 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _1092 = _1090 != 0;
    int _1094 = _992 * _1068;
    int _1096 = _1094 + _1082;
    int _1098 = ~_863;
    int _1100 = _1098 + 1;
    float _1102 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].y, _1066);
    float _1104 = float(uint(_1064));
    float _1106 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].z, _1074);
    float _1108 = float(uint(_1096));
    float _1110 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].w, _1088);
    int _1112 = ~_863;
    int _1114 = _1112 + 1;
    float _1116 = as_type<float>(_889) * _1104;
    bool _1118 = _895 > 0.5;
    float _1120 = as_type<float>(_889) * _1108;
    float _1122 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[16].y, _1102);
    float _1124 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[16].z, _1106);
    float _1126 = trunc(_1116);
    float _1128 = precise::max(_1126, 0.0);
    uint _1130 = uint(_1128);
    float _1132 = trunc(_1120);
    float _1134 = precise::max(_1132, 0.0);
    uint _1136 = uint(_1134);
    int _1138 = _1100 * int(_1136);
    int _1140 = _1138 + _1096;
    float _1142 = float(uint(_1140));
    float _1144 = as_type<float>(_889) * _1142;
    float _1146 = trunc(_1144);
    float _1148 = precise::max(_1146, 0.0);
    uint _1150 = uint(_1148);
    int _1152 = ~_863;
    int _1154 = _1152 + 1;
    int _1156 = int(_1136) + int(_1150);
    float _1158 = _485 * (*spvDescriptorSet0.vp_c10)._m0[15].x;
    int _1160 = _1114 * _1156;
    int _1162 = _1160 + _1096;
    float _1164 = fma(_477, (*spvDescriptorSet0.vp_c10)._m0[14].x, _1158);
    float _1166 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    bool _1168 = uint(_1162) >= uint(_863);
    float _1170 = _895 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    float _1172 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _1174 = !_1168;
    int _1176 = _1174 ? 0 : (-1);
    float _1178 = -_1166;
    float _1180 = fma(_1170, 2.0, _1178);
    float _1182 = fma(_895, (*spvDescriptorSet0.vp_c9)._m0[78].z, _1172);
    int _1184 = ~_1156;
    int _1186 = _1184 + _1176;
    int _1188 = _1186 + 1;
    float _1190 = _897 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _1192 = _1154 * int(_1130);
    int _1194 = _1192 + _1064;
    int _1196 = _863 * _1188;
    int _1198 = _1196 + _1096;
    bool _1200 = _897 > 0.5;
    float _1202 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1204 = _1202 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _1206 = float(uint(_1194));
    float _1208 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    bool _1210 = !_964;
    int _1212 = _1210 ? _1198 : (-1);
    float _1214 = 1.0 / _1204;
    float _1216 = as_type<float>(_889) * _1206;
    float _1218 = fma(_1190, -2.0, _1208);
    int _1220 = _1212 >> 31;
    int _1222 = _1212 & 3;
    bool _1224 = _1222 != 0;
    float _1226 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _1228 = _1220 & 3;
    float _1230 = trunc(_1216);
    float _1232 = precise::max(_1230, 0.0);
    uint _1234 = uint(_1232);
    float _1236 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _1238 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _1236;
    float _1240 = fma(_897, (*spvDescriptorSet0.vp_c9)._m0[78].w, _1226);
    int _1242 = _1212 + _1228;
    float _1244 = in.m_54.x;
    float _1246 = in.m_54.y;
    float _1248 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[16].x, _1164);
    int _1250 = ~_863;
    int _1252 = _1250 + 1;
    float _1254 = _797 * _797;
    int _1256 = _1242 >> 2;
    float _1258 = fma(_487, (*spvDescriptorSet0.vp_c10)._m0[16].w, _1110);
    float _1260 = _1238 * _1214;
    float _1262 = -_119;
    float _1264 = fma(_1262, (*spvDescriptorSet0.vp_c9)._m0[76].x, _1180);
    int _1266 = _1256 << 4;
    int _1268 = _1266 + 368;
    float _1270 = -_199;
    int _1272 = _1118 ? as_type<int>(_1270) : as_type<int>(_199);
    uint _1274 = uint(int(uint(_1268) >> uint(2)));
    uint _1276 = uint(int(uint(int(_1274)) >> uint(2)));
    int _1278 = int(_1274) & 3;
    float _1280 = (*spvDescriptorSet0.vp_c9)._m0[int(_1276)][_1278];
    int _1282 = int(_1274) + 1;
    uint _1284 = uint(int(uint(_1282) >> uint(2)));
    int _1286 = _1282 & 3;
    float _1288 = (*spvDescriptorSet0.vp_c9)._m0[int(_1284)][_1286];
    int _1290 = int(_1130) + int(_1234);
    float _1292 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].z, _1182);
    float _1294 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[76].y, _1218);
    float _1296 = fma(_799, _799, _1254);
    float _1298 = fma(_119, (*spvDescriptorSet0.vp_c9)._m0[77].w, _1240);
    bool _1300 = !_1086;
    float _1302 = _1300 ? _199 : as_type<float>(_1272);
    int _1304 = _1252 * _1290;
    int _1306 = _1304 + _1064;
    float _1308 = fma(_801, _801, _1296);
    int _1310 = _1212 & 3;
    bool _1312 = _1310 != 0;
    float _1314 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _199);
    float _1316 = _1246 * (*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _1318 = -_203;
    int _1320 = _1200 ? as_type<int>(_1318) : as_type<int>(_203);
    float _1322 = _1244 * (*spvDescriptorSet0.vp_c9)._m0[143].x;
    bool _1324 = uint(_1310) > 1u;
    float _1326 = rsqrt(_1308);
    bool _1328 = !_1092;
    float _1330 = _1328 ? _203 : as_type<float>(_1320);
    float _1332 = _1322 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    int _1334 = _1268 + 8;
    uint _1336 = uint(int(uint(_1334) >> uint(2)));
    uint _1338 = uint(int(uint(int(_1336)) >> uint(2)));
    int _1340 = int(_1336) & 3;
    float _1342 = (*spvDescriptorSet0.vp_c9)._m0[int(_1338)][_1340];
    int _1344 = int(_1336) + 1;
    uint _1346 = uint(int(uint(_1344) >> uint(2)));
    int _1348 = _1344 & 3;
    float _1350 = (*spvDescriptorSet0.vp_c9)._m0[int(_1346)][_1348];
    bool _1352 = uint(_1306) >= uint(_863);
    float _1354 = _1316 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    int _1356 = _1224 ? 0 : 1;
    float _1358 = _1332 * _1314;
    bool _1360 = !_1352;
    int _1362 = _1360 ? 0 : (-1);
    float _1364 = _1354 * _859;
    int _1366 = ~_1356;
    int _1368 = _1366 + 1;
    int _1370 = _1368 + 1;
    int _1372 = _1370;
    if (!_1324)
    {
        int _1374 = ~_1356;
        int _1376 = _1374 + 1;
        _1372 = _1376;
    }
    int _1378 = _1372;
    int _1380 = ~_1290;
    int _1382 = _1380 + _1362;
    int _1384 = _1382 + 1;
    float _1386 = trunc((*spvDescriptorSet0.vp_c9)._m0[80].z);
    int _1388 = int(_1386);
    bool _1390 = !_1312;
    int _1392 = _1390 ? 0 : 1;
    float _1394 = _1326 * _801;
    int _1396 = abs(_1378);
    float _1398 = _1326 * _799;
    bool _1400 = _1310 != 3;
    int _1402 = abs(_1392);
    float _1404 = _1326 * _797;
    int _1406 = ~_1396;
    int _1408 = _1406 + 1;
    int _1410 = _1408 + 1;
    int _1412 = _863 * _1384;
    int _1414 = _1412 + _1064;
    bool _1416 = uint(_1310) >= 2u;
    int _1418 = ~_1402;
    int _1420 = _1418 + 1;
    int _1422 = _1420 + 1;
    float _1424 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1426 = _1394 * _1424;
    int _1428 = _1416 ? 0 : 1;
    int _1430 = _1410 * as_type<int>(_1288);
    float _1432 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1434 = -_1426;
    float _1436 = fma(_1398, _1432, _1434);
    int _1438 = ~_1428;
    int _1440 = _1438 + 1;
    int _1442 = _1440 + 1;
    int _1444 = _1422 * as_type<int>(_1280);
    int _1446 = _1444 + _1430;
    float _1448 = -(*spvDescriptorSet0.vp_c8)._m0[28].z;
    float _1450 = _1404 * _1448;
    int _1452 = _1442;
    if (_1400)
    {
        int _1454 = ~_1428;
        int _1456 = _1454 + 1;
        _1452 = _1456;
    }
    int _1458 = _1452;
    float _1460 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1462 = _1398 * _1460;
    float _1464 = _1436 * _1436;
    float _1466 = -(*spvDescriptorSet0.vp_c8)._m0[28].y;
    float _1468 = -_1450;
    float _1470 = fma(_1394, _1466, _1468);
    bool _1472 = _1310 != 3;
    float _1474 = -(*spvDescriptorSet0.vp_c8)._m0[28].x;
    float _1476 = -_1462;
    float _1478 = fma(_1404, _1474, _1476);
    int _1480 = abs(_1458);
    float _1482 = fma(_1470, _1470, _1464);
    bool _1484 = !_1472;
    int _1486 = _1484 ? 0 : (-1);
    float _1488 = fma(_1478, _1478, _1482);
    bool _1490 = !_1078;
    int _1492 = _1490 ? 0 : 1;
    int _1494 = abs(_1486);
    int _1496 = ~_1480;
    int _1498 = _1496 + 1;
    int _1500 = _1498 + 1;
    float _1502 = rsqrt(_1488);
    int _1504 = abs(_1388);
    int _1506 = abs(_1492);
    int _1508 = _1500 * as_type<int>(_1342);
    int _1510 = _1508 + _1446;
    float _1512 = float(uint(_1388));
    float _1514 = _1248 + (*spvDescriptorSet0.vp_c10)._m0[17].x;
    float _1516 = _1122 + (*spvDescriptorSet0.vp_c10)._m0[17].y;
    int _1518 = ~_1494;
    int _1520 = _1518 + 1;
    int _1522 = _1520 + 1;
    float _1524 = 1.0 / _1512;
    float _1526 = float(uint(_1504));
    int _1528 = ~_1506;
    int _1530 = _1528 + 1;
    int _1532 = _1530 + 1;
    int _1534 = _1522 * as_type<int>(_1350);
    int _1536 = _1534 + _1510;
    float _1538 = _405 * _1514;
    float _1540 = _389 * _1516;
    bool _1542 = !_964;
    int _1544 = _1542 ? _1414 : (-1);
    float _1546 = 1.0 / _1526;
    int _1548 = _1536 * _1532;
    float _1550 = _1470 * _1502;
    float _1552 = _1478 * _1502;
    float _1554 = _1436 * _1502;
    int _1556 = _1544 * _1506;
    int _1558 = _1556 + _1548;
    float _1560 = 0.5 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1562 = _1404 * _1552;
    int _1564 = as_type<int>(_1524) + (-2);
    float _1566 = _1124 + (*spvDescriptorSet0.vp_c10)._m0[17].z;
    float _1568 = float(uint(_1558));
    float _1570 = _1364 * _1398;
    int _1572 = abs(_1558);
    float _1574 = -_1562;
    float _1576 = fma(_1394, _1554, _1574);
    int _1578 = ~_1388;
    int _1580 = _1578 + 1;
    float _1582 = as_type<float>(_1564) * _1568;
    int _1584 = as_type<int>(_1546) + (-2);
    float _1586 = fma(_1358, _1550, _1570);
    float _1588 = float(uint(_1572));
    float _1590 = trunc(_1582);
    float _1592 = precise::max(_1590, 0.0);
    uint _1594 = uint(_1592);
    float _1596 = _441 * _1566;
    float _1598 = fma(_1560, _1576, _1586);
    float _1600 = as_type<float>(_1584) * _1588;
    float _1602 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[26].y;
    float _1604 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[24].y;
    float _1606 = _1258 + (*spvDescriptorSet0.vp_c10)._m0[17].w;
    float _1608 = _1398 * _1554;
    float _1610 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[26].x, _1602);
    float _1612 = trunc(_1600);
    float _1614 = precise::max(_1612, 0.0);
    uint _1616 = uint(_1614);
    float _1618 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[24].x, _1604);
    int _1620 = ~_1504;
    int _1622 = _1620 + 1;
    float _1624 = _1364 * _1404;
    float _1626 = _1364 * _1394;
    float _1628 = -_1608;
    float _1630 = fma(_1404, _1550, _1628);
    int _1632 = _1580 * int(_1594);
    int _1634 = _1632 + _1558;
    float _1636 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[26].z, _1610);
    float _1638 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[24].z, _1618);
    float _1640 = fma(_1358, _1552, _1626);
    float _1642 = _1540 * (*spvDescriptorSet0.vp_c8)._m0[25].y;
    float _1644 = float(uint(_1634));
    float _1646 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[26].w, _1636);
    float _1648 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[24].w, _1638);
    float _1650 = fma(_1560, _1630, _1640);
    float _1652 = fma(_1358, _1554, _1624);
    int _1654 = _1622 * int(_1616);
    int _1656 = _1654 + _1572;
    float _1658 = as_type<float>(_1564) * _1644;
    float _1660 = _1646 + (*spvDescriptorSet0.vp_c10)._m0[21].z;
    float _1662 = _1648 + (*spvDescriptorSet0.vp_c10)._m0[21].x;
    float _1664 = _1394 * _1550;
    float _1666 = float(uint(_1656));
    float _1668 = _1660 + _1650;
    float _1670 = _1662 + _1598;
    float _1672 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _1674 = _853 + _1672;
    float _1676 = trunc(_1658);
    float _1678 = precise::max(_1676, 0.0);
    uint _1680 = uint(_1678);
    float _1682 = as_type<float>(_1584) * _1666;
    float _1684 = fma(_1538, (*spvDescriptorSet0.vp_c8)._m0[25].x, _1642);
    float _1686 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1688 = _1670 + _1686;
    float _1690 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1692 = _1668 + _1690;
    float _1694 = fma(_1260, _1674, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    float _1696 = fma(_1596, (*spvDescriptorSet0.vp_c8)._m0[25].z, _1684);
    float _1698 = _1688 * _1688;
    float _1700 = trunc(_1682);
    float _1702 = precise::max(_1700, 0.0);
    uint _1704 = uint(_1702);
    float _1706 = _1692 * _1692;
    float _1708 = -_1664;
    float _1710 = fma(_1398, _1552, _1708);
    float _1712 = fma(_1606, (*spvDescriptorSet0.vp_c8)._m0[25].w, _1696);
    int _1714 = ~_1504;
    int _1716 = _1714 + 1;
    float _1718 = _1698 + _1706;
    int _1720 = ~_1388;
    int _1722 = _1720 + 1;
    float _1724 = fma(_1560, _1710, _1652);
    int _1726 = int(_1594) + int(_1680);
    float _1728 = sqrt(_1718);
    bool _1730 = _853 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _1732 = isnan(_853);
    bool _1734 = _1730 || _1732;
    bool _1736 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _1738 = _1734 || _1736;
    float _1740 = float(_1738);
    float _1742 = _1712 + (*spvDescriptorSet0.vp_c10)._m0[21].y;
    int _1744 = _1722 * _1726;
    int _1746 = _1744 + _1558;
    int _1748 = int(_1616) + int(_1704);
    float _1750 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _1752 = _853 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _1754 = isnan(_853);
    bool _1756 = _1752 || _1754;
    bool _1758 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _1760 = _1756 || _1758;
    float _1762 = float(_1760);
    bool _1764 = uint(_1746) >= uint(_1388);
    int _1766 = _1716 * _1748;
    int _1768 = _1766 + _1572;
    float _1770 = _1742 + _1724;
    float _1772 = -_1762;
    float _1774 = _1772 + 1.0;
    bool _1776 = !_1764;
    int _1778 = _1776 ? 0 : (-1);
    bool _1780 = _1728 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1782 = _1740 * _1774;
    bool _1784 = uint(_1768) >= uint(_1504);
    int _1786 = _1558 ^ _1388;
    float _1788 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    float _1790 = _1694 * _1782;
    bool _1792 = !_1784;
    int _1794 = _1792 ? 0 : (-1);
    uint _1796 = uint(int(uint(_1786) >> uint(31)));
    int _1798 = ~_1726;
    int _1800 = _1798 + _1778;
    int _1802 = _1800 + 1;
    int _1804 = ~_1794;
    int _1806 = _1748 + _1804;
    int _1808 = _1806 + 1;
    int _1810 = ~int(_1796);
    int _1812 = _1810 + 1;
    int _1814 = _1388 * _1802;
    int _1816 = _1814 + _1558;
    bool _1818 = _1388 == 0;
    int _1820 = _1808 ^ _1812;
    bool _1822 = _1388 == 0;
    float _1824 = as_type<float>(_1796);
    float _1826 = as_type<float>(_1748);
    float _1828 = as_type<float>(_1808);
    float _1830 = _1698;
    float _1832 = _1706;
    if (!_1780)
    {
        _1824 = _1670;
    }
    float _1834 = _1824;
    float _1836 = _1834;
    if (!_1780)
    {
        _1826 = _1668;
    }
    float _1838 = _1826;
    float _1840 = _1838;
    if (!_1780)
    {
        _1828 = _1770;
    }
    float _1842 = _1828;
    bool _1844 = !_1780;
    float _1846 = _1842;
    if (!_1844)
    {
        float _1848 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1850 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1852 = _1728 + _1850;
        float _1854 = rsqrt(_1718);
        float _1856 = _1852 * _1848;
        float _1858 = _1770 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1860 = _1856 * 0.15915493667125701904296875;
        float _1862 = _1860 * 6.283185482025146484375;
        float _1864 = sin(_1862);
        float _1866 = _1860 * 6.283185482025146484375;
        float _1868 = cos(_1866);
        float _1870 = fma(_1864, _1858, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1872 = _1854 * _1870;
        float _1874 = fma(_1688, _1872, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1876 = _1868 + (-1.0);
        float _1878 = fma(_1692, _1872, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1880 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
        float _1882 = _1874 + _1880;
        float _1884 = _1876 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1886 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
        float _1888 = _1878 + _1886;
        float _1890 = _1882 * _1882;
        float _1892 = fma(_1770, _1868, _1884);
        float _1894 = _1888 * _1888;
        _1846 = _1892;
        _1830 = _1890;
        _1832 = _1894;
        _1836 = _1874;
        _1840 = _1878;
    }
    float _1896 = _1846;
    float _1898 = _1830;
    float _1900 = _1832;
    float _1902 = _1836;
    float _1904 = _1840;
    bool _1906 = !_1818;
    int _1908 = _1906 ? _1816 : (-1);
    float _1910 = _1750 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _1912 = ~_1812;
    int _1914 = _1912 + _1820;
    int _1916 = _1914 + 1;
    float _1918 = -(*spvDescriptorSet0.vp_c15)._m0[0].y;
    float _1920 = _1896 + _1918;
    float _1922 = float(_1908);
    float _1924 = -_1740;
    float _1926 = _1924 + 1.0;
    bool _1928 = !_1822;
    int _1930 = _1928 ? _1916 : (-1);
    float _1932 = fma(_1920, _1920, _1898);
    float _1934 = _1788 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _1936 = fma(_1910, _1922, _1264);
    float _1938 = float(_1930);
    float _1940 = fma(_1926, (*spvDescriptorSet0.vp_c9)._m0[131].x, _1790);
    float _1942 = _1302 + 0.5;
    float _1944 = _1932 + _1900;
    float _1946 = -_1292;
    float _1948 = _1946 + 1.0;
    float _1950 = -_1294;
    float _1952 = fma(_1934, _1938, _1950);
    float _1954 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[132].x, _1940);
    float _1956 = fma(_1910, _1942, _1936);
    float _1958 = _1330 + (-0.5);
    float _1960 = sqrt(_1944);
    float _1962 = -_1934;
    float _1964 = fma(_1962, _1958, _1952);
    float _1966 = -_1948;
    float _1968 = fma(_1302, _1966, _1956);
    float _1970 = (*spvDescriptorSet0.vp_c9)._m0[123].x * (*spvDescriptorSet0.vp_c10)._m0[1].x;
    float _1972 = (*spvDescriptorSet0.vp_c9)._m0[123].y * (*spvDescriptorSet0.vp_c10)._m0[1].y;
    float _1974 = -_1298;
    float _1976 = _1974 + 1.0;
    float _1978 = (*spvDescriptorSet0.vp_c9)._m0[123].z * (*spvDescriptorSet0.vp_c10)._m0[1].z;
    float _1980 = _1970 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1982 = _1972 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1984 = _1954 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    float _1986 = _1978 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _1988 = fma(_1330, _1976, _1964);
    bool _1990 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].x;
    bool _1992 = isnan(_1960);
    bool _1994 = _1990 || _1992;
    bool _1996 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].x);
    bool _1998 = _1994 || _1996;
    out.m_60.x = _1980;
    out.m_60.y = _1982;
    out.m_60.z = _1986;
    out.m_60.w = _1984;
    out.m_62.x = _1968;
    out.m_62.y = _1988;
    float _2000 = _1970;
    float _2002 = _1988;
    float _2004 = _1968;
    float _2006 = _1984;
    if (!_1998)
    {
        _2000 = 1.0;
    }
    float _2008 = _2000;
    bool _2010 = !_1998;
    float _2012 = _2008;
    if (!_2010)
    {
        bool _2014 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].y;
        bool _2016 = isnan(_1960);
        bool _2018 = _2014 || _2016;
        bool _2020 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].y);
        bool _2022 = _2018 || _2020;
        if (!_2022)
        {
            float _2024 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2026 = _1960 + _2024;
            float _2028 = -(*spvDescriptorSet0.vp_c16)._m0[1].x;
            float _2030 = (*spvDescriptorSet0.vp_c16)._m0[1].y + _2028;
            float _2032 = -(*spvDescriptorSet0.vp_c16)._m0[2].x;
            float _2034 = _2032 + (*spvDescriptorSet0.vp_c16)._m0[2].y;
            float _2036 = 1.0 / _2030;
            float _2038 = _2026 * _2036;
            float _2040 = fma(_2038, _2034, (*spvDescriptorSet0.vp_c16)._m0[2].x);
            _2012 = _2040;
            _2042 = true;
        }
        else
        {
            bool _2044 = _1960 >= (*spvDescriptorSet0.vp_c16)._m0[1].z;
            bool _2046 = isnan(_1960);
            bool _2048 = _2044 || _2046;
            bool _2050 = isnan((*spvDescriptorSet0.vp_c16)._m0[1].z);
            bool _2052 = _2048 || _2050;
            if (!_2052)
            {
                float _2054 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2056 = _1960 + _2054;
                float _2058 = -(*spvDescriptorSet0.vp_c16)._m0[1].y;
                float _2060 = _2058 + (*spvDescriptorSet0.vp_c16)._m0[1].z;
                float _2062 = -(*spvDescriptorSet0.vp_c16)._m0[2].y;
                float _2064 = _2062 + (*spvDescriptorSet0.vp_c16)._m0[2].z;
                float _2066 = 1.0 / _2060;
                float _2068 = _2056 * _2066;
                float _2070 = fma(_2068, _2064, (*spvDescriptorSet0.vp_c16)._m0[2].y);
                _2012 = _2070;
                _2042 = true;
            }
            else
            {
                _2012 = (*spvDescriptorSet0.vp_c16)._m0[2].z;
            }
        }
    }
    _2042 = false;
    float _2072 = _2012;
    float _2074 = -(*spvDescriptorSet0.vp_c16)._m0[0].y;
    float _2076 = _1896 + _2074;
    float _2078 = -(*spvDescriptorSet0.vp_c16)._m0[0].x;
    float _2080 = _1902 + _2078;
    float _2082 = -(*spvDescriptorSet0.vp_c16)._m0[0].z;
    float _2084 = _1904 + _2082;
    float _2086 = fma(_2076, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].y);
    float _2088 = fma(_2080, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].x);
    float _2090 = fma(_2084, _2072, (*spvDescriptorSet0.vp_c16)._m0[0].z);
    float _2092 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _2094 = _2086 + _2092;
    float _2096 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _2098 = _2088 + _2096;
    float _2100 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _2102 = _2090 + _2100;
    float _2104 = _2094 * _2094;
    float _2106 = fma(_2098, _2098, _2104);
    float _2108 = fma(_2102, _2102, _2106);
    float _2110 = rsqrt(_2108);
    float _2112 = _2110 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _2114 = _2098 * _2112;
    float _2116 = _2102 * _2112;
    float _2118 = _2114 * _2114;
    float _2120 = _2116 * _2116;
    float _2122 = _2118 + _2120;
    float _2124 = sqrt(_2122);
    bool _2126 = _2124 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2128 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _2130 = _2124 + _2128;
    float _2132 = _2102;
    float _2134 = _2122;
    float _2136 = _2130;
    float _2138 = _2094;
    float _2140 = _2114;
    if (_2126)
    {
        float _2142 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2132 = _2142;
    }
    float _2144 = _2132;
    if (_2126)
    {
        float _2146 = rsqrt(_2122);
        _2134 = _2146;
    }
    float _2148 = _2134;
    if (_2126)
    {
        float _2150 = _2130 * _2144;
        _2136 = _2150;
    }
    float _2152 = _2136;
    if (_2126)
    {
        float _2154 = _2152 * 0.15915493667125701904296875;
        _2002 = _2154;
    }
    float _2156 = _2002;
    float _2158 = _2110;
    if (_2126)
    {
        float _2160 = _2156 * 6.283185482025146484375;
        float _2162 = sin(_2160);
        _2158 = _2162;
    }
    float _2164 = _2158;
    float _2166 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _2168 = precise::max(0.0, _2166);
    float _2170 = _2144;
    float _2172 = _2168;
    if (_2126)
    {
        float _2174 = _2156 * 6.283185482025146484375;
        float _2176 = cos(_2174);
        _2170 = _2176;
    }
    float _2178 = _2170;
    float _2180 = -_2112;
    float _2182 = -_2168;
    float _2184 = fma(_2094, _2180, _2182);
    if (!_2126)
    {
        _2138 = _2116;
    }
    float _2186 = _2138;
    float _2188 = _2186;
    if (_2126)
    {
        float _2190 = _2184 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2172 = _2190;
    }
    float _2192 = _2172;
    float _2194 = _2164;
    float _2196 = _2192;
    if (_2126)
    {
        float _2198 = fma(_2164, _2192, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _2004 = _2198;
    }
    float _2200 = _2004;
    float _2202 = _2200;
    if (!_2126)
    {
        _2194 = _2184;
    }
    float _2204 = _2194;
    float _2206 = _2204;
    float _2208 = _2178;
    if (_2126)
    {
        float _2210 = _2178 + (-1.0);
        _2196 = _2210;
    }
    float _2212 = _2196;
    float _2214 = _2212;
    if (_2126)
    {
        float _2216 = _2148 * _2200;
        _2006 = _2216;
    }
    float _2218 = _2006;
    float _2220 = sqrt(_2108);
    if (_2126)
    {
        float _2222 = _2212 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _2202 = _2222;
    }
    float _2224 = _2202;
    if (_2126)
    {
        float _2226 = _2114 * _2218;
        _2140 = _2226;
    }
    float _2228 = _2140;
    if (!_2126)
    {
        _2214 = _2118;
    }
    float _2230 = _2214;
    float _2232 = _2230;
    if (_2126)
    {
        float _2234 = _2116 * _2218;
        _2188 = _2234;
    }
    float _2236 = _2188;
    if (_2126)
    {
        float _2238 = fma(_2184, _2178, _2224);
        _2206 = _2238;
    }
    float _2240 = _2206;
    if (_2126)
    {
        float _2242 = _2228 * _2228;
        _2232 = _2242;
    }
    float _2244 = _2232;
    if (!_2126)
    {
        _2208 = _2120;
    }
    float _2246 = _2208;
    float _2248 = _2246;
    if (_2126)
    {
        float _2250 = _2236 * _2236;
        _2248 = _2250;
    }
    float _2252 = _2248;
    float _2254 = fma(_2240, _2240, _2244);
    float _2256 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2258 = _2254 + _2252;
    float _2260 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2262 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2264 = fma(_2220, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2262);
    float _2266 = precise::clamp(_2264, 0.0, 1.0);
    float _2268 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _2270 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2256);
    float _2272 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2260);
    float _2274 = rsqrt(_2258);
    float _2276 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2278 = -_2266;
    float _2280 = _2278 + 1.0;
    float _2282 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2272);
    float _2284 = _2086 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2286 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2276);
    float _2288 = _2282 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2290 = fma(_2088, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2284);
    float _2292 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2286);
    float _2294 = abs(_2280);
    float _2296 = log2(_2294);
    float _2298 = _2288 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2300 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2290);
    float _2302 = _2292 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2304 = -_2298;
    float _2306 = fma(_2304, _2268, 1.0);
    float _2308 = _2274 * _2228;
    float _2310 = fma(_2090, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2270);
    float _2312 = _2300 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2314 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2316 = _2274 * _2240;
    float _2318 = _2308 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2320 = _2274 * _2236;
    float _2322 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2314);
    float _2324 = _2310 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2326 = -_2318;
    float _2328 = fma(_2316, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2326);
    float _2330 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2332 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2322);
    float _2334 = log2(_2306);
    float _2336 = -_2320;
    float _2338 = fma(_2336, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2328);
    float _2340 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2342 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2332);
    float _2344 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2346 = fma(_2338, -0.5, 0.5);
    float _2348 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2340);
    float _2350 = fma(_2338, 0.5, 0.5);
    float _2352 = exp2(_2330);
    float _2354 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2344);
    float _2356 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2348);
    float _2358 = _2316 + 1.0;
    float _2360 = fma(_2350, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2362 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2354);
    float _2364 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2356);
    float _2366 = 1.0 / _2342;
    float _2368 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2362);
    float _2370 = fma(_2350, _2360, -0.212114393711090087890625);
    float _2372 = _2334 * 0.693147182464599609375;
    float _2374 = fma(_2350, _2370, 1.570728778839111328125);
    float _2376 = _2372 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2378 = sqrt(_2346);
    float _2380 = -_2316;
    float _2382 = fma(_2352, _2358, _2380);
    float _2384 = fma(_2382, 0.5, 0.5);
    float _2386 = _2364 * _2366;
    float _2388 = _2368 * _2366;
    float _2390 = fma(_2386, 0.5, 0.5);
    float _2392 = fma(_2388, -0.5, 0.5);
    float _2394 = _2378 * 0.636619746685028076171875;
    float3 _6277 = float3(_2390, _2392, _2376);
    float _2396 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6277, float3(0.0), isnan(_6277)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6277, float3(0.0), isnan(_6277)), level(0.0)).x;
    float _2398 = -_2374;
    float _2400 = fma(_2394, _2398, 1.0);
    float3 _6293 = float3(_2390, _2392, _2376);
    float4 _2403 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6293, float3(0.0), isnan(_6293)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6293, float3(0.0), isnan(_6293)), level(0.0)).xyzw;
    float _2405 = _2403.x;
    float _2407 = _2403.y;
    float _2409 = _2403.z;
    float _2411 = _2403.w;
    float2 _6310 = float2(_2400, _2384);
    float3 _2415 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6310, float2(0.0), isnan(_6310)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6310, float2(0.0), isnan(_6310)), level(0.0)).xyz;
    float _2417 = _2415.x;
    float _2419 = _2415.y;
    float _2421 = _2415.z;
    float _2423 = _2296 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2425 = _2302 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _2427 = fma(_2312, (*spvDescriptorSet0.vp_c8)._m0[6].x, _2425);
    float _2429 = exp2(_2423);
    float _2431 = fma(_2288, (*spvDescriptorSet0.vp_c8)._m0[6].z, _2427);
    float _2433 = fma(_2324, (*spvDescriptorSet0.vp_c8)._m0[6].w, _2431);
    float _2435 = _2433 + _2342;
    out.gl_Position.x = _2364;
    out.gl_Position.y = _2368;
    out.gl_Position.z = _2433;
    out.gl_Position.w = _2342;
    float _2437 = _2435 * 0.5;
    float _2439 = -_2429;
    float _2441 = _2439 + 1.0;
    float _2443 = (*spvDescriptorSet0.vp_c10)._m0[3].x * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _2445 = _2441 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    out.m_64.z = _2437;
    out.m_64.w = _2342;
    out.m_47.x = _2443;
    float _2447 = _2445 * _2396;
    float _2449 = -_2445;
    float _2451 = _2449 + 1.0;
    float _2453 = _2411 * _2447;
    float _2455 = _2411 * _2451;
    float _2457 = _2421 * _2447;
    float _2459 = fma(_2417, _2453, _2405);
    float _2461 = fma(_2419, _2453, _2407);
    float _2463 = fma(_2411, _2457, _2409);
    out.m_66.x = _2459;
    out.m_66.y = _2461;
    out.m_66.z = _2463;
    out.m_66.w = _2455;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_56.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_56.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_56.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_56.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

