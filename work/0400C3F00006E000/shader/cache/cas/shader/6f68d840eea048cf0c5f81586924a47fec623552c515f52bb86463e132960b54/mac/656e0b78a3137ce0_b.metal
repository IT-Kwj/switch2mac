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
    float4 m_60 [[user(locn0)]];
    float4 m_68 [[user(locn1)]];
    float4 m_62 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_66 [[user(locn5)]];
    float4 m_54 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_64 [[user(locn9)]];
    float4 m_76 [[user(locn10)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_58 [[attribute(1)]];
    float4 m_42 [[attribute(2)]];
    float4 m_47 [[attribute(3)]];
    float4 m_56 [[attribute(4)]];
    float4 m_52 [[attribute(5)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _984 = false;
    bool _851 = false;
    bool _731 = false;
    bool _495 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3258 = as_type<float>(_111);
        out.gl_Position.z = _3258;
    }
    if (!_99)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = 0.0;
    if (_125)
    {
        float _135 = float(_95);
        _131 = _135;
    }
    float _137 = _131;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    if (_143)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _105;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3326 = as_type<float>(_149);
        out.gl_Position.z = _3326;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _155 = in.m_47.x;
    float _157 = in.m_47.y;
    float _159 = in.m_47.z;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = 0.0;
    float _173 = _153;
    if (!_169)
    {
        float _175 = _153 * _153;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = 0.0;
    float _183 = _179;
    if (!_169)
    {
        float _185 = _129 * _129;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    if (!_169)
    {
        float _191 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _191;
    }
    float _193 = _183;
    int _195 = as_type<int>(_151) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_151) & 2;
    bool _201 = _199 != 0;
    bool _203 = !_201;
    int _205 = _203 ? (-1090519040) : 1056964608;
    bool _207 = !_197;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_169;
    float _213 = _193;
    float _215 = _151;
    if (!_211)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _153 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _153);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _245;
        _133 = _233;
        _215 = _235;
    }
    float _247 = _213;
    float _249 = _133;
    float _251 = _215;
    bool _253 = !_169;
    float _255 = _251;
    float _257 = _249;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _153 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = _265;
        _173 = _277;
    }
    float _279 = _255;
    float _281 = _173;
    float _283 = _279;
    if (!_169)
    {
        _283 = _129;
    }
    float _285 = _283;
    float _287 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _285;
    if (!_169)
    {
        float _291 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _291;
    }
    float _293 = _257;
    bool _295 = !_169;
    float _297 = _293;
    if (!_295)
    {
        float _299 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = log2(_299);
        float _303 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _305 = _303 + 1.0;
        float _307 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = _129 * _301;
        float _311 = 1.0 / _305;
        float _313 = _307 * 0.693147182464599609375;
        float _315 = exp2(_309);
        float _317 = 1.0 / _313;
        float _319 = _315 + (-1.0);
        float _321 = -_319;
        float _323 = fma(_321, _317, _129);
        float _325 = _323 * _311;
        float _327 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _297 = _327;
    }
    float _329 = _297;
    bool _331 = !_169;
    if (!_331)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = 1.0 / _339;
        float _343 = _129 * _335;
        float _345 = exp2(_343);
        float _347 = -_345;
        float _349 = _347 + 1.0;
        float _351 = _349 * _341;
        _289 = _351;
    }
    float _353 = _289;
    float _355 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = fma(_281, _157, _287);
    float _361 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_353, _157, _355);
    float _365 = fma(_281, _155, _357);
    float _367 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _371 = fma(_353, _155, _361);
    float _373 = -_363;
    float _375 = _359 + _373;
    float _377 = fma(_353, _159, _367);
    float _379 = fma(_281, _159, _369);
    float _381 = -_371;
    float _383 = _365 + _381;
    float _385 = _375 * _375;
    float _387 = in.m_52.w;
    float _389 = -_377;
    float _391 = _379 + _389;
    float _393 = _375 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = fma(_383, _383, _385);
    out.m_54.y = as_type<float>(_205);
    float _397 = _375 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = _375 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _401 = fma(_391, _391, _395);
    float _403 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _405 = in.m_42.x;
    float _407 = in.m_42.y;
    float _409 = in.m_42.z;
    float _411 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _413 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _399);
    float _415 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _403);
    float _417 = sqrt(_401);
    float _419 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _411);
    float _421 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _413);
    bool _423 = _417 >= 9.9999999747524270787835121154785e-07;
    bool _425 = isnan(_417);
    bool _427 = _423 || _425;
    bool _429 = isnan(9.9999999747524270787835121154785e-07);
    bool _431 = _427 || _429;
    float _433 = fma(_365, _387, _405);
    float _435 = fma(_359, _387, _407);
    float _437 = fma(_379, _387, _409);
    float _439 = _413;
    float _441 = _365;
    float _443 = _359;
    if (_431)
    {
        _439 = _415;
    }
    float _445 = _439;
    float _447 = _445;
    if (_431)
    {
        _441 = _419;
    }
    float _449 = _441;
    float _451 = _449;
    if (_431)
    {
        _443 = _421;
    }
    float _453 = _443;
    float _455 = _453;
    if (!_431)
    {
        bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _459 = !_457;
        if (!_459)
        {
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _463 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _465 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
            float _475 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _469);
            float _477 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _471);
            float _479 = _473 * _473;
            float _481 = fma(_475, _475, _479);
            float _483 = fma(_477, _477, _481);
            float _485 = rsqrt(_483);
            float _487 = _485 * 9.9999999747524270787835121154785e-07;
            float _489 = _475 * _487;
            float _491 = _473 * _487;
            float _493 = _477 * _487;
            _451 = _491;
            _447 = _489;
            _455 = _493;
            _495 = true;
        }
        else
        {
            float _497 = _157 * _157;
            float _499 = fma(_155, _155, _497);
            float _501 = fma(_159, _159, _499);
            float _503 = sqrt(_501);
            bool _505 = _503 >= 9.9999999747524270787835121154785e-07;
            bool _507 = isnan(_503);
            bool _509 = _505 || _507;
            bool _511 = isnan(9.9999999747524270787835121154785e-07);
            bool _513 = _509 || _511;
            if (!_513)
            {
                float _515 = _407 * _407;
                float _517 = fma(_405, _405, _515);
                float _519 = fma(_409, _409, _517);
                float _521 = sqrt(_519);
                bool _523 = _521 >= 9.9999999747524270787835121154785e-07;
                bool _525 = isnan(_521);
                bool _527 = _523 || _525;
                bool _529 = isnan(9.9999999747524270787835121154785e-07);
                bool _531 = _527 || _529;
                if (!_531)
                {
                    float _533 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _535 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _533);
                    float _537 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _535);
                    float _539 = rsqrt(_537);
                    float _541 = _539 * 9.9999999747524270787835121154785e-07;
                    float _543 = _541 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _545 = _541 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _541 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _451 = _545;
                    _447 = _543;
                    _455 = _547;
                    _495 = true;
                }
                else
                {
                    float _549 = _407 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _551 = _407 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _553 = _407 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _555 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].x, _549);
                    float _557 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].x, _551);
                    float _559 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].x, _553);
                    float _561 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _555);
                    float _563 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _557);
                    float _565 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _559);
                    float _567 = _561 * _561;
                    float _569 = fma(_563, _563, _567);
                    float _571 = fma(_565, _565, _569);
                    float _573 = rsqrt(_571);
                    float _575 = _573 * 9.9999999747524270787835121154785e-07;
                    float _577 = _563 * _575;
                    float _579 = _561 * _575;
                    float _581 = _565 * _575;
                    _451 = _579;
                    _447 = _577;
                    _455 = _581;
                    _495 = true;
                }
            }
            else
            {
                float _583 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _585 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _587 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _589 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _583);
                float _591 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _585);
                float _593 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
                float _595 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _589);
                float _597 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _591);
                float _599 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _593);
                float _601 = _595 * _595;
                float _603 = fma(_597, _597, _601);
                float _605 = fma(_599, _599, _603);
                float _607 = rsqrt(_605);
                float _609 = _607 * 9.9999999747524270787835121154785e-07;
                float _611 = _597 * _609;
                float _613 = _595 * _609;
                float _615 = _599 * _609;
                _451 = _613;
                _447 = _611;
                _455 = _615;
            }
        }
    }
    _495 = false;
    float _617 = _451;
    float _619 = _447;
    float _621 = _455;
    float _623 = in.m_56.x;
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _627 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _631 = _629 != 0;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _635 = _633 != 0;
    float _637 = _627 * _625;
    int _639 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _641 = _639 != 0;
    float _643 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[20].x, _637);
    bool _645 = !_635;
    int _647 = _645 ? 0 : 1;
    float _649 = _643 * 6.283185482025146484375;
    float _651 = floor(_643);
    int _653 = abs(_647);
    float _655 = _649 * 0.15915493667125701904296875;
    bool _657 = !_631;
    int _659 = _657 ? 0 : 1;
    int _661 = abs(_659);
    float _663 = _655 * 6.283185482025146484375;
    float _665 = cos(_663);
    bool _667 = !_641;
    int _669 = _667 ? 0 : 1;
    bool _671 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _673 = -_651;
    float _675 = _643 + _673;
    int _677 = abs(_669);
    float _679 = float(_661);
    float _681 = -_675;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _685 = _675 < 0.5;
    float _687 = float(_685);
    float _689 = abs(_683);
    float _691 = _679 * _689;
    float _693 = fma(_665, 0.5, 0.5);
    float _695 = float(_677);
    float _697 = -_687;
    float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _701 = float(_653);
    float _703 = -_693;
    float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _707 = fma(_695, _705, _691);
    float _709 = abs(_699);
    float _711 = fma(_701, _709, _707);
    bool _713 = !_671;
    float _729;
    if (!_713)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _717 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _721 = _719 * _715;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _727;
        _731 = true;
    }
    else
    {
        float _733 = float(_95);
        float _735 = 1.0 / _733;
        float _737 = _129 * _735;
        _729 = _737;
    }
    _731 = false;
    float _739 = _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _743 = _739 + _741;
    float _745 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _747 = in.m_52.x;
    float _749 = in.m_52.y;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _751;
    bool _755 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _757 = isnan(_739);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = _745 * _623;
    bool _769 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _771 = 1.0 / _753;
    float _773 = -_765;
    float _775 = _773 + 1.0;
    float _777 = trunc(_767);
    int _779 = int(_777);
    float _781 = _743 * _771;
    bool _783 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _785 = isnan(_739);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _799;
    float _803 = _793 * _775;
    float _805 = fma(_797, _781, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _807 = fma(_801, _781, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _809 = -_793;
    float _811 = _809 + 1.0;
    int _813 = _779 << 4;
    int _815 = _813 + 1712;
    float _817 = _805 * _803;
    float _819 = _807 * _803;
    float _821 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].x, _817);
    float _823 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].y, _819);
    float _825 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[144].x, _821);
    float _827 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[144].y, _823);
    float _829 = _825 * _747;
    float _831 = _827 * _749;
    bool _833 = !_769;
    float _849;
    if (!_833)
    {
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _837 = _623 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _839 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _841 = _839 * _835;
        float _843 = floor(_841);
        float _845 = -_843;
        float _847 = _841 + _845;
        _849 = _847;
        _851 = true;
    }
    else
    {
        float _853 = float(_95);
        float _855 = 1.0 / _853;
        float _857 = _129 * _855;
        _849 = _857;
    }
    _851 = false;
    float _859 = _849;
    uint _862 = uint(int(uint(_815) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[int(_872)][_874];
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _880 = _859 + _878;
    bool _882 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _884 = isnan(_859);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _898 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _900 = isnan(_859);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    int _910 = _815 + 8;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    uint _914 = uint(int(uint(int(_912)) >> uint(2)));
    int _916 = int(_912) & 3;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[int(_914)][_916];
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _920;
    float _924 = -_892;
    float _926 = _924 + 1.0;
    bool _928 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _930 = 1.0 / _896;
    float _932 = _908 * _926;
    float _934 = -_908;
    float _936 = _934 + 1.0;
    float _938 = _922 * _930;
    float _940 = fma(_938, _880, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _942 = _940 * _932;
    float _944 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[115].x, _942);
    float _946 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[116].x, _944);
    float _948 = _868 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _950 = _876 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _954 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _918 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _960 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _962 = !_928;
    float _980;
    float _982;
    if (!_962)
    {
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _966 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _968 = float(_95);
        float _970 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _972 = _970 * _964;
        float _974 = floor(_972);
        float _976 = -_974;
        float _978 = _972 + _976;
        _980 = _968;
        _982 = _978;
        _984 = true;
    }
    else
    {
        float _986 = float(_95);
        float _988 = 1.0 / _986;
        float _990 = _129 * _988;
        _980 = _986;
        _982 = _990;
    }
    _984 = false;
    float _992 = _980;
    float _994 = _982;
    float _996 = in.m_56.z;
    float _998 = _623 * 2.0;
    float _1000 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1002 = _617 * _617;
    float _1004 = in.m_56.y;
    float _1006 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1008 = log2(_1006);
    float _1010 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1012 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1014 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1000);
    float _1016 = fma(_619, _619, _1002);
    float _1018 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1010);
    float _1020 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1012);
    float _1022 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1014);
    float _1024 = floor(_998);
    float _1026 = fma(_621, _621, _1016);
    float _1028 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    float _1030 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1020);
    float _1032 = _1022 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1034 = _1028 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1036 = rsqrt(_1026);
    float _1038 = _129 * _1008;
    float _1040 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1042 = _996 * 2.0;
    float _1044 = _829 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1046 = _1004 * 2.0;
    float _1048 = floor(_1042);
    float _1050 = _1004 + _996;
    bool _1052 = _1024 > 0.0;
    float _1054 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_205));
    bool _1056 = _1024 >= 0.0;
    bool _1058 = isnan(_1024);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.0);
    bool _1064 = _1060 || _1062;
    float _1066 = _1050 + (-1.0);
    float _1068 = floor(_1046);
    float _1070 = _623 + _996;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1074 = _1072 != 0;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1078 = _1076 != 0;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1082 = _1080 != 0;
    float _1084 = _1036 * _619;
    float _1086 = _1036 * _617;
    float _1088 = _1070 + (-1.0);
    float _1090 = _1036 * _621;
    bool _1092 = !_1078;
    int _1094 = _1092 ? 0 : 1;
    float _1096 = exp2(_1038);
    bool _1098 = _1048 > 0.0;
    float _1100 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1102 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1104 = !_1074;
    int _1106 = _1104 ? 0 : 1;
    bool _1108 = _1068 > 0.0;
    bool _1110 = _1068 >= 0.0;
    bool _1112 = isnan(_1068);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(0.0);
    bool _1118 = _1114 || _1116;
    bool _1120 = _1048 >= 0.0;
    bool _1122 = isnan(_1048);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = in.m_58.x;
    float _1132 = in.m_58.y;
    float _1134 = in.m_58.z;
    int _1136 = _1064 ? 0 : 1;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1140 = 1.0 + _1138;
    int _1142 = _1128 ? 0 : 1;
    float _1144 = -_1096;
    float _1146 = _1144 + 1.0;
    int _1148 = ~_1136;
    int _1150 = _1148 + 1;
    int _1152 = _1150 + 1;
    float _1154 = 1.0 / _1140;
    int _1156 = abs(_1094);
    int _1158 = _1152;
    float _1160 = _1086;
    if (!_1052)
    {
        int _1162 = ~_1136;
        int _1164 = _1162 + 1;
        _1158 = _1164;
    }
    int _1166 = _1158;
    int _1168 = ~_1142;
    int _1170 = _1168 + 1;
    int _1172 = _1170 + 1;
    int _1174 = _1172;
    if (!_1098)
    {
        int _1176 = ~_1142;
        int _1178 = _1176 + 1;
        _1174 = _1178;
    }
    int _1180 = _1174;
    int _1182 = abs(_1106);
    float _1184 = float(_1156);
    float _1186 = float(_1166);
    bool _1188 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1190 = isnan(0.0);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1196 = _1192 || _1194;
    float _1198 = _1184 * _1186;
    float _1200 = _1196 ? _1146 : 0.0;
    float _1202 = float(_1182);
    float _1204 = _1198 * (-2.0);
    float _1206 = float(_1180);
    float _1208 = _1200 * _1154;
    float _1210 = _1004 + (-0.5);
    float _1212 = fma(_1204, _1132, _1132);
    int _1214 = _1118 ? 0 : 1;
    float _1216 = _1202 * _1206;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1220 = _1032 + _1218;
    float _1222 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1212);
    bool _1224 = !_1082;
    int _1226 = _1224 ? 0 : 1;
    float _1228 = fma(_1100, _1204, _1100);
    int _1230 = ~_1214;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1238 = _1040 + _1236;
    int _1240 = _1234;
    float _1242 = _1220;
    if (!_1108)
    {
        int _1244 = ~_1214;
        int _1246 = _1244 + 1;
        _1240 = _1246;
    }
    int _1248 = _1240;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1252 = _1034 + _1250;
    int _1254 = abs(_1226);
    float _1256 = _1220 * _1220;
    bool _1258 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1260 = isnan(1.0);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1266 = _1262 || _1264;
    float _1268 = _1086 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1270 = _623 + _1004;
    float _1272 = fma(_1252, _1252, _1256);
    bool _1274 = !_1266;
    float _1276 = _1274 ? _129 : _1208;
    float _1278 = fma(_1084, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1268);
    float _1280 = _1270 + (-1.0);
    float _1282 = fma(_1238, _1238, _1272);
    float _1284 = _1216 * (-2.0);
    float _1286 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1278);
    float _1288 = fma(_1276, _1228, _1222);
    float _1290 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1292 = _623 + (-0.5);
    float _1294 = rsqrt(_1282);
    float _1296 = fma(_1284, _1130, _1130);
    float _1298 = _1288 * 0.15915493667125701904296875;
    float _1300 = float(_1254);
    float _1302 = fma(_1290, _1284, _1290);
    float _1304 = float(_1248);
    float _1306 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1296);
    float _1308 = abs(_1286);
    bool _1310 = _1308 > 0.99989998340606689453125;
    float _1312 = fma(_1276, _1302, _1306);
    float _1314 = _1300 * _1304;
    float _1316 = _1298 * 6.283185482025146484375;
    float _1318 = sin(_1316);
    float _1320 = _1312 * 0.15915493667125701904296875;
    float _1322 = _1314 * (-2.0);
    float _1324 = _1220 * _1294;
    float _1326 = _1252 * _1294;
    float _1328 = _1238 * _1294;
    float _1330 = fma(_1102, _1322, _1102);
    float _1332 = -_1324;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1220);
    float _1336 = fma(_1322, _1134, _1134);
    float _1338 = _996 + (-0.5);
    float _1340 = _1334;
    float _1342 = _1276;
    float _1344 = _1324;
    if (!_1310)
    {
        _1242 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1346 = _1242;
    float _1348 = _1334 * _1334;
    float _1350 = _1346;
    if (_1310)
    {
        _1340 = 0.001000000047497451305389404296875;
    }
    float _1352 = _1340;
    float _1354 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1336);
    float _1356 = -_1326;
    float _1358 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1252);
    float _1360 = _1320 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    float _1364 = -_1328;
    float _1366 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1238);
    float _1368 = _1354;
    if (_1310)
    {
        float _1370 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1350 = _1370;
    }
    float _1372 = _1350;
    float _1374 = fma(_1276, _1330, _1354);
    if (!_1310)
    {
        _1368 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1376 = _1368;
    float _1378 = fma(_1358, _1358, _1348);
    float _1380 = _1376;
    if (!_1310)
    {
        _1342 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1382 = _1342;
    float _1384 = _1382;
    if (_1310)
    {
        float _1386 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1380 = _1386;
    }
    float _1388 = _1380;
    float _1390 = -_1372;
    float _1392 = _1090 * _1390;
    if (_1310)
    {
        float _1394 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1384 = _1394;
    }
    float _1396 = _1384;
    float _1398 = _1320 * 6.283185482025146484375;
    float _1400 = cos(_1398);
    float _1402 = _1374 * 0.15915493667125701904296875;
    float _1404 = -_1388;
    float _1406 = -_1392;
    float _1408 = fma(_1084, _1404, _1406);
    float _1410 = fma(_1366, _1366, _1378);
    float _1412 = _1408 * _1408;
    float _1414 = _1298 * 6.283185482025146484375;
    float _1416 = cos(_1414);
    float _1418 = -_1388;
    float _1420 = _1086 * _1418;
    float _1422 = -_1396;
    float _1424 = _1084 * _1422;
    float _1426 = -_1396;
    float _1428 = -_1420;
    float _1430 = fma(_1090, _1426, _1428);
    float _1432 = -_1372;
    float _1434 = -_1424;
    float _1436 = fma(_1086, _1432, _1434);
    float _1438 = _1362 * _1318;
    float _1440 = _1402 * 6.283185482025146484375;
    float _1442 = cos(_1440);
    float _1444 = fma(_1430, _1430, _1412);
    float _1446 = _1400 * _1318;
    float _1448 = fma(_1436, _1436, _1444);
    float _1450 = _1402 * 6.283185482025146484375;
    float _1452 = sin(_1450);
    float _1454 = _1362 * _1416;
    float _1456 = _1400 * _1416;
    float _1458 = sqrt(_1410);
    float _1460 = _1362 * _1442;
    float _1462 = fma(_129, 0.014999999664723873138427734375, _623);
    float _1464 = _1416 * _1442;
    float _1466 = _1400 * _1442;
    float _1468 = _1318 * _1442;
    float _1470 = rsqrt(_1448);
    float _1472 = fma(_1452, _1456, _1438);
    float _1474 = _1466 * _1084;
    float _1476 = _1294 * _1458;
    float _1478 = -_1446;
    float _1480 = fma(_1452, _1454, _1478);
    float _1482 = -_1454;
    float _1484 = fma(_1452, _1446, _1482);
    float _1486 = fma(_1452, _1438, _1456);
    float _1488 = floor(_1462);
    float _1490 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1492 = _1044 * _1476;
    float _1494 = _831 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1496 = _1408 * _1470;
    float _1498 = _1436 * _1470;
    float _1500 = _1492 * _1490;
    float _1502 = _1472 * _1090;
    float _1504 = _1430 * _1470;
    float _1506 = _1084 * _1496;
    float _1508 = _1466 * _1090;
    float _1510 = _1484 * _1090;
    float _1512 = fma(_1464, _1498, _1502);
    float _1514 = -_1506;
    float _1516 = fma(_1086, _1504, _1514);
    float _1518 = -_1452;
    float _1520 = fma(_1518, _1498, _1508);
    float _1522 = fma(_1468, _1498, _1510);
    float _1524 = fma(_1488, -0.1500000059604644775390625, 1.0);
    float _1526 = _1494 * _1476;
    float _1528 = fma(_1460, _1516, _1520);
    float _1530 = _1086 * _1498;
    float _1532 = fma(_1480, _1516, _1512);
    float _1534 = precise::max(_1524, 0.20000000298023223876953125);
    float _1536 = _1472 * _1084;
    float _1538 = -_1452;
    float _1540 = fma(_1538, _1504, _1474);
    float _1542 = -_1530;
    float _1544 = fma(_1090, _1496, _1542);
    float _1546 = _1526 * _1054;
    float _1548 = fma(_1486, _1516, _1522);
    float _1550 = fma(_1464, _1504, _1536);
    float _1552 = _1484 * _1084;
    float _1554 = fma(_1460, _1544, _1540);
    float _1556 = _1546 * _1528;
    float _1558 = fma(_1480, _1544, _1550);
    float _1560 = fma(_1468, _1504, _1552);
    float _1562 = _1546 * _1554;
    float _1564 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1566 = _1564 * 0.5;
    float _1568 = fma(_1500, _1532, _1556);
    float _1570 = fma(_1486, _1544, _1560);
    float _1572 = precise::min(_1534, 1.0);
    float _1574 = fma(_1500, _1558, _1562);
    float _1576 = fma(_1566, _1548, _1568);
    float _1578 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1580 = _1466 * _1086;
    float _1582 = fma(_1566, _1570, _1574);
    float _1584 = fma(_1576, _1572, _1040);
    float _1586 = _1090 * _1504;
    float _1588 = -_1452;
    float _1590 = fma(_1588, _1496, _1580);
    float _1592 = fma(_1582, _1572, _1034);
    float _1594 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1584);
    float _1596 = _1472 * _1086;
    float _1598 = -_1586;
    float _1600 = fma(_1084, _1498, _1598);
    float _1602 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1592);
    float _1604 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1606 = _1594 + _1604;
    float _1608 = _1484 * _1086;
    float _1610 = fma(_1464, _1496, _1596);
    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1614 = _1602 + _1612;
    float _1616 = _1606 * _1606;
    float _1618 = fma(_1460, _1600, _1590);
    float _1620 = fma(_1468, _1496, _1608);
    float _1622 = fma(_1480, _1600, _1610);
    float _1624 = fma(_1614, _1614, _1616);
    float _1626 = _1546 * _1618;
    float _1628 = fma(_1486, _1600, _1620);
    float _1630 = sqrt(_1624);
    float _1632 = fma(_1500, _1622, _1626);
    float _1634 = fma(_1566, _1628, _1632);
    float _1636 = fma(_1634, _1572, _1032);
    float _1638 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1636);
    float _1640 = -_1326;
    float _1642 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    bool _1644 = _1630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1648 = _1646 != 0;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1652 = _1650 != 0;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1656 = _1654 != 0;
    int _1658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1660 = _1658 != 0;
    bool _1662 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(0.5);
    bool _1670 = _1666 || _1668;
    bool _1672 = !_1652;
    int _1674 = _1672 ? 0 : 1;
    bool _1676 = !_1648;
    int _1678 = _1676 ? 0 : 1;
    bool _1680 = !_1656;
    int _1682 = _1680 ? 0 : 1;
    bool _1684 = !_1660;
    int _1686 = _1684 ? 0 : 1;
    float _1688 = _1602;
    float _1690 = _1594;
    if (!_1644)
    {
        _1160 = _1638;
    }
    float _1692 = _1160;
    bool _1694 = !_1644;
    float _1696 = _1692;
    if (!_1694)
    {
        float _1698 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1702 = _1630 + _1700;
        float _1704 = _1638 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1706 = rsqrt(_1624);
        float _1708 = _1702 * _1698;
        float _1710 = _1708 * 0.15915493667125701904296875;
        float _1712 = _1710 * 6.283185482025146484375;
        float _1714 = cos(_1712);
        float _1716 = _1710 * 6.283185482025146484375;
        float _1718 = sin(_1716);
        float _1720 = _1714 + (-1.0);
        float _1722 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1724 = fma(_1718, _1704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1726 = fma(_1638, _1714, _1722);
        float _1728 = _1706 * _1724;
        float _1730 = fma(_1614, _1728, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1732 = fma(_1606, _1728, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1688 = _1730;
        _1696 = _1726;
        _1690 = _1732;
    }
    float _1734 = _1688;
    float _1736 = _1696;
    float _1738 = _1690;
    float _1740 = -_1326;
    float _1742 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1734);
    float _1744 = -_1324;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1736);
    float _1748 = -_1328;
    float _1750 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1738);
    float _1752 = -_1324;
    float _1754 = fma(_1752, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1032);
    float _1756 = -_1328;
    float _1758 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1040);
    float _1760 = _1742;
    float _1762 = _1746;
    float _1764 = _1736;
    if (_1670)
    {
        _1344 = _1742;
    }
    float _1766 = _1344;
    float _1768 = _1766;
    if (_1670)
    {
        _1760 = _1746;
    }
    float _1770 = _1760;
    float _1772 = _1770;
    if (_1670)
    {
        _1762 = _1750;
    }
    float _1774 = _1762;
    float _1776 = _1774;
    if (!_1670)
    {
        float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1780 = _1754 + _1778;
        float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1784 = _1642 + _1782;
        float _1786 = 1.0 / _1476;
        float _1788 = -_1040;
        float _1790 = _1788 + _1738;
        float _1792 = _1780 * _1780;
        float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1796 = _1758 + _1794;
        float _1798 = fma(_1784, _1784, _1792);
        float _1800 = fma(_1796, _1796, _1798);
        float _1802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1804 = sqrt(_1800);
        float _1806 = precise::min(_1804, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1808 = _1806 * _1802;
        float _1810 = -_1034;
        float _1812 = _1810 + _1734;
        float _1814 = -_1032;
        float _1816 = _1814 + _1736;
        float _1818 = _1808 * _1786;
        float _1820 = fma(_1812, _1818, _1642);
        float _1822 = fma(_1816, _1818, _1754);
        float _1824 = fma(_1790, _1818, _1758);
        _1772 = _1822;
        _1768 = _1820;
        _1776 = _1824;
    }
    float _1826 = _1772;
    float _1828 = _1768;
    float _1830 = _1776;
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1834 = _1826 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1838 = _1828 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1842 = _1830 + _1840;
    float _1844 = _1834 * _1834;
    float _1846 = fma(_1838, _1838, _1844);
    float _1848 = fma(_1842, _1842, _1846);
    float _1850 = rsqrt(_1848);
    float _1852 = sqrt(_1848);
    float _1854 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1856 = _1838 * _1854;
    float _1858 = _1842 * _1854;
    float _1860 = _1856 * _1856;
    float _1862 = _1858 * _1858;
    float _1864 = _1860 + _1862;
    float _1866 = sqrt(_1864);
    bool _1868 = _1866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1872 = _1866 + _1870;
    float _1874 = _1842;
    float _1876 = _1864;
    float _1878 = _1872;
    float _1880 = _1854;
    if (_1868)
    {
        float _1882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1874 = _1882;
    }
    float _1884 = _1874;
    if (_1868)
    {
        float _1886 = rsqrt(_1864);
        _1876 = _1886;
    }
    float _1888 = _1876;
    float _1890 = _1888;
    if (_1868)
    {
        float _1892 = _1872 * _1884;
        _1878 = _1892;
    }
    float _1894 = _1878;
    if (_1868)
    {
        float _1896 = _1894 * 0.15915493667125701904296875;
        _1764 = _1896;
    }
    float _1898 = _1764;
    float _1900 = _1884;
    float _1902 = _1898;
    if (_1868)
    {
        float _1904 = _1898 * 6.283185482025146484375;
        float _1906 = sin(_1904);
        _1900 = _1906;
    }
    float _1908 = _1900;
    float _1910 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1912 = precise::max(0.0, _1910);
    float _1914 = _1844;
    float _1916 = _1912;
    if (_1868)
    {
        float _1918 = _1898 * 6.283185482025146484375;
        float _1920 = cos(_1918);
        _1914 = _1920;
    }
    float _1922 = _1914;
    float _1924 = -_1854;
    float _1926 = -_1912;
    float _1928 = fma(_1834, _1924, _1926);
    float _1930 = _1928;
    if (_1868)
    {
        float _1932 = _1928 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1916 = _1932;
    }
    float _1934 = _1916;
    float _1936 = _1908;
    float _1938 = _1934;
    if (_1868)
    {
        float _1940 = fma(_1908, _1934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1936 = _1940;
    }
    float _1942 = _1936;
    float _1944 = _1942;
    float _1946 = _1922;
    if (_1868)
    {
        float _1948 = _1922 + (-1.0);
        _1938 = _1948;
    }
    float _1950 = _1938;
    float _1952 = _1950;
    if (_1868)
    {
        float _1954 = _1888 * _1942;
        _1880 = _1954;
    }
    float _1956 = _1880;
    if (!_1868)
    {
        _1944 = _1856;
    }
    float _1958 = _1944;
    float _1960 = _1958;
    if (_1868)
    {
        float _1962 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1902 = _1962;
    }
    float _1964 = _1902;
    if (_1868)
    {
        float _1966 = _1856 * _1956;
        _1960 = _1966;
    }
    float _1968 = _1960;
    if (!_1868)
    {
        _1952 = _1858;
    }
    float _1970 = _1952;
    float _1972 = _1970;
    if (_1868)
    {
        float _1974 = _1858 * _1956;
        _1972 = _1974;
    }
    float _1976 = _1972;
    if (!_1868)
    {
        _1890 = _1860;
    }
    float _1978 = _1890;
    float _1980 = _1978;
    if (_1868)
    {
        float _1982 = fma(_1928, _1922, _1964);
        _1930 = _1982;
    }
    float _1984 = _1930;
    if (_1868)
    {
        float _1986 = _1968 * _1968;
        _1980 = _1986;
    }
    float _1988 = _1980;
    if (!_1868)
    {
        _1946 = _1862;
    }
    float _1990 = _1946;
    float _1992 = _1990;
    if (_1868)
    {
        float _1994 = _1976 * _1976;
        _1992 = _1994;
    }
    float _1996 = _1992;
    float _1998 = fma(_1984, _1984, _1988);
    float _2000 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2002 = _1998 + _1996;
    float _2004 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2000);
    float _2006 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2010 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2008);
    float _2012 = precise::clamp(_2010, 0.0, 1.0);
    float _2014 = rsqrt(_2002);
    float _2016 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2004);
    float _2018 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2006);
    float _2020 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2022 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2024 = _2016 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2026 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2028 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2018);
    float _2030 = -_2012;
    float _2032 = _2030 + 1.0;
    float _2034 = _2024 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2036 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2026);
    float _2038 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2022);
    float _2040 = _2028 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2042 = abs(_2032);
    float _2044 = log2(_2042);
    float _2046 = -_2034;
    float _2048 = fma(_2046, _2020, 1.0);
    float _2050 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2036);
    float _2052 = _2014 * _1968;
    float _2054 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2038);
    float _2056 = _2050 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2058 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2060 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2062 = _2014 * _1984;
    float _2064 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2066 = _2014 * _1976;
    float _2068 = log2(_2048);
    float _2070 = -_2058;
    float _2072 = fma(_2062, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2070);
    float _2074 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2064);
    float _2076 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2078 = _2044 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2080 = -_2066;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2072);
    float _2084 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2074);
    float _2086 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2076);
    float _2088 = fma(_2082, -0.5, 0.5);
    float _2090 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2084);
    float _2092 = exp2(_2078);
    float _2094 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2096 = fma(_2082, 0.5, 0.5);
    float _2098 = _2062 + 1.0;
    float _2100 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2094);
    float _2102 = fma(_2096, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2104 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2086);
    float _2106 = 1.0 / _2090;
    float _2108 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2100);
    float _2110 = fma(_2096, _2102, -0.212114393711090087890625);
    float _2112 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2104);
    float _2114 = _2068 * 0.693147182464599609375;
    float _2116 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2108);
    float _2118 = fma(_2096, _2110, 1.570728778839111328125);
    float _2120 = sqrt(_2088);
    float _2122 = -_2062;
    float _2124 = fma(_2092, _2098, _2122);
    float _2126 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2128 = fma(_2124, 0.5, 0.5);
    float _2130 = _2116 * _2106;
    float _2132 = _2112 * _2106;
    float _2134 = fma(_2130, 0.5, 0.5);
    float _2136 = fma(_2132, -0.5, 0.5);
    float _2138 = _2120 * 0.636619746685028076171875;
    float _2140 = -_2118;
    float _2142 = fma(_2138, _2140, 1.0);
    float3 _6453 = float3(_2134, _2136, _2126);
    float _2144 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6453, float3(0.0), isnan(_6453)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6453, float3(0.0), isnan(_6453)), level(0.0)).x;
    float3 _6464 = float3(_2134, _2136, _2126);
    float4 _2147 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6464, float3(0.0), isnan(_6464)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6464, float3(0.0), isnan(_6464)), level(0.0)).xyzw;
    float _2149 = _2147.x;
    float _2151 = _2147.y;
    float _2153 = _2147.z;
    float _2155 = _2147.w;
    float2 _6481 = float2(_2142, _2128);
    float3 _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6481, float2(0.0), isnan(_6481)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6481, float2(0.0), isnan(_6481)), level(0.0)).xyz;
    float _2161 = _2159.x;
    float _2163 = _2159.y;
    float _2165 = _2159.z;
    float _2167 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2169 = int(_2167);
    out.m_60.x = _954;
    out.m_60.y = _956;
    out.m_60.z = _960;
    out.m_60.w = _952;
    float _2171 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2175 = _2173 != 0;
    float _2177 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2179 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2181 = int(_2179);
    float _2183 = in.m_56.w;
    bool _2185 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2187 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2189 = _2185 || _2187;
    bool _2191 = isnan(0.5);
    bool _2193 = _2189 || _2191;
    float _2195 = _2044 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_62.y = _1526;
    float _2199 = float(_2169);
    float _2201 = _623 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2203 = !_2175;
    float _2205 = _2203 ? _1004 : _623;
    float _2207 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2209 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2207;
    float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2213 = _2211 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2215 = -_2197;
    float _2217 = fma(_2201, 2.0, _2215);
    float _2219 = 1.0 / _2199;
    out.m_64.x = _1828;
    out.m_64.y = _1826;
    out.m_64.z = _1830;
    float _2221 = float(uint(_2181));
    float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2223;
    bool _2227 = _623 > 0.5;
    float _2229 = 1.0 / _2221;
    int _2231 = abs(_1674);
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2235 = _2183 > 0.5;
    int _2237 = ~_2181;
    int _2239 = _2237 + 1;
    float _2241 = _129 * _2219;
    int _2243 = ~_2181;
    int _2245 = _2243 + 1;
    float _2247 = exp2(_2195);
    bool _2249 = !_2175;
    float _2251 = _2249 ? 1.2345600128173828125 : 1.0;
    float _2253 = _2251 * _2205;
    int _2255 = as_type<int>(_2229) + (-2);
    float _2257 = trunc(_2241);
    int _2259 = int(_2257);
    float _2261 = float(_2181);
    float _2263 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2265 = _2263 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2267 = 1.0 / _2265;
    float _2269 = -_2247;
    float _2271 = _2269 + 1.0;
    float _2273 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2275 = float(uint(_2259));
    float _2277 = as_type<float>(_2255) * _2275;
    float _2279 = _2213 * _2267;
    float _2281 = trunc(_2277);
    float _2283 = precise::max(_2281, 0.0);
    uint _2285 = uint(_2283);
    float _2287 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2291 = 1.0 / _2289;
    int _2293 = _2245 * int(_2285);
    int _2295 = _2293 + _2259;
    float _2297 = float(uint(_2295));
    float _2299 = _2209 * _2291;
    float _2301 = as_type<float>(_2255) * _2297;
    float _2303 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2305 = _2303 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2307 = trunc(_2301);
    float _2309 = precise::max(_2307, 0.0);
    uint _2311 = uint(_2309);
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2315 = fma(_2171, -2.0, _2313);
    int _2317 = ~_2181;
    int _2319 = _2317 + 1;
    float _2321 = 1.0 / _2305;
    float _2323 = 1.0 / _992;
    int _2325 = int(_2285) + int(_2311);
    float _2327 = _129 * _2261;
    float _2329 = floor(_2253);
    float _2331 = _2225 * _2321;
    int _2333 = _2319 * _2325;
    int _2335 = _2333 + _2259;
    float _2337 = _2225;
    if (!_2175)
    {
        _2337 = _1004;
    }
    float _2339 = _2337;
    float _2341 = _2339;
    if (_2175)
    {
        _2341 = _623;
    }
    float _2343 = _2341;
    bool _2345 = uint(_2335) >= uint(_2181);
    float _2347 = _2327 * _2323;
    float _2349 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2233);
    float _2351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2353 = float(_2259);
    bool _2355 = !_2345;
    int _2357 = _2355 ? 0 : (-1);
    float _2359 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2349);
    bool _2361 = _1004 > 0.5;
    float _2363 = -_2329;
    float _2365 = _2253 + _2363;
    bool _2367 = _2353 >= _2261;
    bool _2369 = isnan(_2353);
    bool _2371 = _2367 || _2369;
    bool _2373 = isnan(_2261);
    bool _2375 = _2371 || _2373;
    float _2377 = float(_2375);
    float _2379 = trunc(_2347);
    int _2381 = int(_2379);
    float _2383 = _2365 * _2261;
    int _2385 = ~_2325;
    int _2387 = _2385 + _2357;
    int _2389 = _2387 + 1;
    float _2391 = -_2359;
    float _2393 = _2391 + 1.0;
    int _2395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2397 = _2395 != 0;
    float _2399 = trunc(_2377);
    int _2401 = int(_2399);
    float _2403 = -_209;
    int _2405 = _2227 ? as_type<int>(_2403) : as_type<int>(_209);
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2409 = _2351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2411 = _996 > 0.5;
    bool _2413 = !_2397;
    float _2415 = _2413 ? _209 : as_type<float>(_2405);
    float _2417 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2407);
    float _2419 = _2351;
    float _2421 = _2407;
    if (!_2175)
    {
        _2419 = _996;
    }
    float _2423 = _2419;
    float _2425 = trunc(_2383);
    int _2427 = int(_2425);
    float _2429 = _2423;
    if (!_2175)
    {
        _2421 = _996;
    }
    float _2431 = _2421;
    float _2433 = -_129;
    float _2435 = fma(_2433, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2217);
    float _2437 = _2415 + 0.5;
    float _2439 = _2431;
    if (_2175)
    {
        _2429 = _1004;
    }
    float _2441 = _2429;
    if (_2175)
    {
        _2439 = _1004;
    }
    float _2443 = _2439;
    float _2445 = fma(_2409, _2437, _2435);
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2449 = _994 + _2447;
    int _2451 = _2181 * _2389;
    int _2453 = _2451 + _2259;
    bool _2455 = _2181 == 0;
    float _2457 = _2441 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2459 = fma(_2299, _2449, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2463 = _2461 != 0;
    float _2465 = -_2393;
    float _2467 = fma(_2415, _2465, _2445);
    int _2469 = ~_2401;
    int _2471 = _2469 + 1;
    int _2473 = _2471 + 1;
    bool _2475 = !_2455;
    int _2477 = _2475 ? _2453 : (-1);
    bool _2479 = !_2463;
    int _2481 = _2479 ? 0 : 1;
    int _2483 = _2181 + (-1);
    int _2485 = _2477 * _2473;
    int _2487 = abs(_1678);
    int _2489 = abs(_2481);
    int _2491 = _2401 * _2483;
    int _2493 = _2491 + _2485;
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2497 = _994 + _2495;
    int _2499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2501 = _2499 != 0;
    int _2503 = _2493 * _2231;
    float _2505 = fma(_2279, _2497, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2507 = abs(_1682);
    int _2509 = _2427 * _2489;
    int _2511 = _2509 + _2259;
    bool _2513 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2515 = isnan(_994);
    bool _2517 = _2513 || _2515;
    bool _2519 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2521 = _2517 || _2519;
    float _2523 = float(_2521);
    int _2525 = _2381 * _2487;
    int _2527 = _2525 + _2503;
    int _2529 = abs(_1686);
    float _2531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2533 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2535 = isnan(_994);
    bool _2537 = _2533 || _2535;
    bool _2539 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2541 = _2537 || _2539;
    float _2543 = float(_2541);
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2547 = _994 + _2545;
    int _2549 = _2511 * _2507;
    int _2551 = _2549 + _2527;
    bool _2553 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2555 = isnan(_994);
    bool _2557 = _2553 || _2555;
    bool _2559 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2561 = _2557 || _2559;
    float _2563 = float(_2561);
    float _2565 = -_2543;
    float _2567 = _2565 + 1.0;
    bool _2569 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2571 = isnan(_994);
    bool _2573 = _2569 || _2571;
    bool _2575 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2577 = _2573 || _2575;
    float _2579 = float(_2577);
    float _2581 = fma(_2331, _2547, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2583 = _2427 * _2529;
    int _2585 = _2583 + _2551;
    float _2587 = _2523 * _2567;
    float _2589 = -_2523;
    float _2591 = _2589 + 1.0;
    float _2593 = -as_type<float>(_205);
    int _2595 = _2361 ? as_type<int>(_2593) : _205;
    float _2597 = -_2579;
    float _2599 = _2597 + 1.0;
    float _2601 = _2579 * _2591;
    bool _2603 = !_2501;
    float _2605 = _2603 ? as_type<float>(_205) : as_type<float>(_2595);
    float _2607 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2315);
    float _2609 = float(uint(_2585));
    float _2611 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2613 = _2531 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2615 = _2605 + (-0.5);
    float _2617 = _2563 * _2599;
    float _2619 = fma(_2443, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2611);
    float _2621 = as_type<float>(_2255) * _2609;
    float _2623 = -_2613;
    float _2625 = -_2607;
    float _2627 = fma(_2623, _2615, _2625);
    float _2629 = float(uint(_2511));
    float _2631 = _2459 * _2617;
    float _2633 = trunc(_2621);
    float _2635 = precise::max(_2633, 0.0);
    uint _2637 = uint(_2635);
    float _2639 = -_2563;
    float _2641 = _2639 + 1.0;
    float _2643 = as_type<float>(_2255) * _2629;
    float _2645 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2647 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2631);
    float _2649 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2651 = fma(_2343, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2645);
    float _2653 = trunc(_2643);
    float _2655 = precise::max(_2653, 0.0);
    uint _2657 = uint(_2655);
    float _2659 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2661 = fma(_2505, _2601, _2647);
    int _2663 = _2239 * int(_2637);
    int _2665 = _2663 + _2585;
    float _2667 = -_2649;
    float _2669 = fma(_2659, 2.0, _2667);
    float _2671 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2651);
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2677 = _2675 != 0;
    float _2679 = fma(_2581, _2587, _2661);
    float _2681 = float(uint(_2665));
    float _2683 = fma(_2457, -2.0, _2673);
    float _2685 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2417);
    float _2687 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2619);
    int _2689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2691 = _2689 != 0;
    float _2693 = as_type<float>(_2255) * _2681;
    int _2695 = _2239 * int(_2657);
    int _2697 = _2695 + _2511;
    float _2699 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2177);
    float _2701 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2703 = -_129;
    float _2705 = fma(_2703, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2669);
    float _2707 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2683);
    float _2709 = trunc(_2693);
    float _2711 = precise::max(_2709, 0.0);
    uint _2713 = uint(_2711);
    float _2715 = float(uint(_2697));
    float _2717 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2699);
    int _2719 = ~_2181;
    int _2721 = _2719 + 1;
    float _2723 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2701);
    float _2725 = -as_type<float>(_205);
    int _2727 = _2235 ? as_type<int>(_2725) : _205;
    float _2729 = as_type<float>(_2255) * _2715;
    float _2731 = _2717 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2733 = -_209;
    int _2735 = _2411 ? as_type<int>(_2733) : as_type<int>(_209);
    float _2737 = -_2685;
    float _2739 = _2737 + 1.0;
    float _2741 = -_2687;
    float _2743 = _2741 + 1.0;
    float _2745 = 1.0 / _2731;
    bool _2747 = !_2691;
    float _2749 = _2747 ? _209 : as_type<float>(_2735);
    float _2751 = fma(_2605, _2739, _2627);
    float _2753 = fma(_2543, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2679);
    float _2755 = _2679;
    float _2757 = _2605;
    float _2759 = _2627;
    if (!_2193)
    {
        _2755 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2761 = _2755;
    float _2763 = -_2671;
    float _2765 = _2763 + 1.0;
    int _2767 = int(_2637) + int(_2713);
    float _2769 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2723);
    bool _2771 = !_2677;
    float _2773 = _2771 ? as_type<float>(_205) : as_type<float>(_2727);
    float _2775 = trunc(_2729);
    float _2777 = precise::max(_2775, 0.0);
    uint _2779 = uint(_2777);
    float _2781 = _2749 + 0.5;
    int _2783 = _2721 * _2767;
    int _2785 = _2783 + _2585;
    float _2787 = _2769 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2789 = _2773 + (-0.5);
    if (!_2193)
    {
        float _2791 = -_2761;
        float _2793 = _2791 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2757 = _2793;
    }
    float _2795 = _2757;
    float _2797 = fma(_2781, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2705);
    bool _2799 = uint(_2785) >= uint(_2181);
    float _2801 = _2787 + _2731;
    float _2803 = -_2789;
    float _2805 = -_2707;
    float _2807 = fma(_2803, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2805);
    float _2809 = -_2765;
    float _2811 = fma(_2749, _2809, _2797);
    bool _2813 = !_2799;
    float _2815 = _2813 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2817 = _2801 * _2745;
    float _2819 = _2817 * 0.5;
    int _2821 = ~_2181;
    int _2823 = _2821 + 1;
    float _2825 = fma(_2773, _2743, _2807);
    int _2827 = ~_2767;
    int _2829 = _2827 + as_type<int>(_2815);
    int _2831 = _2829 + 1;
    float _2833 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2835 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2833);
    int _2837 = int(_2657) + int(_2779);
    float _2839 = _2745;
    float _2841 = _2815;
    float _2843 = _2825;
    float _2845 = _2797;
    float _2847 = _2811;
    if (!_2193)
    {
        float _2849 = 1.0 / _2795;
        _2759 = _2849;
    }
    float _2851 = _2759;
    if (!_2193)
    {
        _2839 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2853 = _2839;
    int _2855 = _2181 * _2831;
    int _2857 = _2855 + _2585;
    out.m_66.x = _2467;
    out.m_66.y = _2751;
    out.m_66.z = _2811;
    out.m_66.w = _2825;
    int _2859 = _2823 * _2837;
    int _2861 = _2859 + _2511;
    int _2863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2865 = _2863 != 0;
    float _2867 = _2853;
    if (!_2193)
    {
        float _2869 = -_2853;
        float _2871 = _2869 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2841 = _2871;
    }
    float _2873 = _2841;
    bool _2875 = !_2455;
    int _2877 = _2875 ? _2857 : (-1);
    float _2879 = 1.0 / _2835;
    bool _2881 = uint(_2861) >= uint(_2181);
    float _2883 = _2273 * _2144;
    int _2885 = _2877 >> 31;
    int _2887 = _2877 & 3;
    bool _2889 = _2887 != 0;
    int _2891 = _2885 & 3;
    float _2893 = as_type<float>(_2585);
    if (!_2193)
    {
        float _2895 = 1.0 / _2873;
        _2893 = _2895;
    }
    float _2897 = _2893;
    if (_2193)
    {
        _2843 = 1.0;
    }
    float _2899 = _2843;
    int _2901 = _2877 + _2891;
    float _2903 = _2753 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2905 = !_2881;
    int _2907 = _2905 ? 0 : (-1);
    int _2909 = _2901 >> 2;
    float _2911 = as_type<float>(_2909);
    float _2913 = _2899;
    if (!_2193)
    {
        float _2915 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2917 = -_2761;
        float _2919 = fma(_2879, _2915, _2917);
        _2845 = _2919;
    }
    float _2921 = _2845;
    if (!_2193)
    {
        float _2923 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2925 = -_2853;
        float _2927 = fma(_2879, _2923, _2925);
        _2867 = _2927;
    }
    float _2929 = _2867;
    int _2931 = ~_2837;
    int _2933 = _2931 + _2907;
    int _2935 = _2933 + 1;
    float _2937 = _2165 * _2883;
    int _2939 = _2909 << 4;
    int _2941 = _2939 + 512;
    if (!_2193)
    {
        float _2943 = _2921 * _2851;
        float _2945 = precise::clamp(_2943, 0.0, 1.0);
        _2847 = _2945;
    }
    float _2947 = _2847;
    float _2949 = as_type<float>(_205) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2951 = _2877 & 3;
    bool _2953 = _2951 != 0;
    uint _2955 = uint(int(uint(_2941) >> uint(2)));
    uint _2957 = uint(int(uint(int(_2955)) >> uint(2)));
    int _2959 = int(_2955) & 3;
    float _2961 = (*spvDescriptorSet0.vp_c9)._m0[int(_2957)][_2959];
    int _2963 = int(_2955) + 1;
    uint _2965 = uint(int(uint(_2963) >> uint(2)));
    int _2967 = _2963 & 3;
    float _2969 = (*spvDescriptorSet0.vp_c9)._m0[int(_2965)][_2967];
    if (_2193)
    {
        _2911 = 1.0;
    }
    float _2971 = _2911;
    float _2973 = _2971;
    if (!_2193)
    {
        float _2975 = _2929 * _2897;
        float _2977 = precise::clamp(_2975, 0.0, 1.0);
        _2973 = _2977;
    }
    float _2979 = _2973;
    if (!_2193)
    {
        float _2981 = -_2947;
        float _2983 = _2981 + 1.0;
        _2913 = _2983;
    }
    float _2985 = _2913;
    bool _2987 = uint(_2951) > 1u;
    int _2989 = _2181 * _2935;
    int _2991 = _2989 + _2511;
    float _2993 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2995 = _1554 * _2949;
    int _2997 = _2941 + 8;
    uint _2999 = uint(int(uint(_2997) >> uint(2)));
    uint _3001 = uint(int(uint(int(_2999)) >> uint(2)));
    int _3003 = int(_2999) & 3;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[int(_3001)][_3003];
    int _3007 = int(_2999) + 1;
    uint _3009 = uint(int(uint(_3007) >> uint(2)));
    int _3011 = _3007 & 3;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[int(_3009)][_3011];
    bool _3015 = _2951 != 3;
    float _3017 = _1528 * _2949;
    float _3019 = fma(_1558, _2993, _2995);
    int _3021 = _2889 ? 0 : 1;
    float _3023 = _2979 * _2985;
    bool _3025 = uint(_2951) >= 2u;
    float _3027 = _1618 * _2949;
    float _3029 = fma(_1532, _2993, _3017);
    float _3031 = _3023 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3033 = _3025 ? 0 : 1;
    float _3035 = fma(_1622, _2993, _3027);
    int _3037 = ~_3021;
    int _3039 = _3037 + 1;
    int _3041 = _3039 + 1;
    float _3043 = _711 * _3031;
    int _3045 = _3041;
    if (!_2987)
    {
        int _3047 = ~_3021;
        int _3049 = _3047 + 1;
        _3045 = _3049;
    }
    int _3051 = _3045;
    float _3053 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3055 = _2951 != 3;
    float _3057 = _1628 + _3035;
    int _3059 = ~_3033;
    int _3061 = _3059 + 1;
    int _3063 = _3061 + 1;
    float _3065 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3053);
    int _3067 = _3063;
    if (_3015)
    {
        int _3069 = ~_3033;
        int _3071 = _3069 + 1;
        _3067 = _3071;
    }
    int _3073 = _3067;
    float _3075 = _1570 + _3019;
    bool _3077 = !_2953;
    int _3079 = _3077 ? 0 : 1;
    float _3081 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3065);
    int _3083 = abs(_3051);
    float _3085 = _1548 + _3029;
    int _3087 = abs(_3073);
    float _3089 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3081);
    int _3091 = abs(_3079);
    out.m_68.w = _2903;
    int _3093 = ~_3083;
    int _3095 = _3093 + 1;
    int _3097 = _3095 + 1;
    bool _3099 = !_3055;
    int _3101 = _3099 ? 0 : (-1);
    out.m_70.x = _3075;
    out.m_70.y = _3057;
    out.m_70.z = _3085;
    int _3103 = ~_3091;
    int _3105 = _3103 + 1;
    int _3107 = _3105 + 1;
    int _3109 = abs(_3101);
    int _3111 = _3097 * as_type<int>(_2969);
    bool _3113 = !_2865;
    int _3115 = _3113 ? 0 : 1;
    int _3117 = ~_3087;
    int _3119 = _3117 + 1;
    int _3121 = _3119 + 1;
    int _3123 = _3107 * as_type<int>(_2961);
    int _3125 = _3123 + _3111;
    int _3127 = abs(_3115);
    int _3129 = ~_3109;
    int _3131 = _3129 + 1;
    int _3133 = _3131 + 1;
    int _3135 = _3121 * as_type<int>(_3005);
    int _3137 = _3135 + _3125;
    int _3139 = ~_3127;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    float _3145 = _3043 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _3147 = !_2455;
    int _3149 = _3147 ? _2991 : (-1);
    int _3151 = _3133 * as_type<int>(_3013);
    int _3153 = _3151 + _3137;
    bool _3155 = _2979 > 0.0;
    bool _3157 = isnan(_2979);
    bool _3159 = _3155 || _3157;
    bool _3161 = isnan(0.0);
    bool _3163 = _3159 || _3161;
    float _3165 = _2155 * _2883;
    out.m_45.x = _3145;
    int _3167 = _3153 * _3143;
    float _3169 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _3171 = _3089 + _3169;
    bool _3173 = _2985 <= 0.0;
    bool _3175 = !_3163;
    bool _3177 = _3173 || _3175;
    float _3179 = fma(_2161, _3165, _2149);
    int _3181 = _3149 * _3127;
    int _3183 = _3181 + _3167;
    float _3185 = _2090 + _3171;
    float _3187 = fma(_2163, _3165, _2151);
    float _3189 = -_2273;
    float _3191 = _3189 + 1.0;
    float _3193 = _3185 * 0.5;
    float _3195 = float(_3183);
    float _3197 = _2155 * _3191;
    float _3199 = fma(_2155, _2937, _2153);
    out.m_72.z = _3193;
    out.m_72.w = _2090;
    out.gl_Position.x = _2116;
    out.gl_Position.y = _2112;
    out.gl_Position.z = _3171;
    out.gl_Position.w = _2090;
    out.m_74.y = _3195;
    out.m_76.x = _3179;
    out.m_76.y = _3187;
    out.m_76.z = _3199;
    out.m_76.w = _3197;
    if (!_3177)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3201 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3201;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _984 = false;
    bool _851 = false;
    bool _731 = false;
    bool _495 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3258 = as_type<float>(_111);
        out.gl_Position.z = _3258;
    }
    if (!_99)
    {
        return out;
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = 0.0;
    if (_125)
    {
        float _135 = float(_95);
        _131 = _135;
    }
    float _137 = _131;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    if (_143)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _105;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3326 = as_type<float>(_149);
        out.gl_Position.z = _3326;
    }
    if (_143)
    {
        return out;
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _155 = in.m_47.x;
    float _157 = in.m_47.y;
    float _159 = in.m_47.z;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = 0.0;
    float _173 = _153;
    if (!_169)
    {
        float _175 = _153 * _153;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = 0.0;
    float _183 = _179;
    if (!_169)
    {
        float _185 = _129 * _129;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    if (!_169)
    {
        float _191 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _191;
    }
    float _193 = _183;
    int _195 = as_type<int>(_151) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_151) & 2;
    bool _201 = _199 != 0;
    bool _203 = !_201;
    int _205 = _203 ? (-1090519040) : 1056964608;
    bool _207 = !_197;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_169;
    float _213 = _193;
    float _215 = _151;
    if (!_211)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _153 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _153);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _245;
        _133 = _233;
        _215 = _235;
    }
    float _247 = _213;
    float _249 = _133;
    float _251 = _215;
    bool _253 = !_169;
    float _255 = _251;
    float _257 = _249;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _153 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = _265;
        _173 = _277;
    }
    float _279 = _255;
    float _281 = _173;
    float _283 = _279;
    if (!_169)
    {
        _283 = _129;
    }
    float _285 = _283;
    float _287 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _285;
    if (!_169)
    {
        float _291 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _291;
    }
    float _293 = _257;
    bool _295 = !_169;
    float _297 = _293;
    if (!_295)
    {
        float _299 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = log2(_299);
        float _303 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _305 = _303 + 1.0;
        float _307 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = _129 * _301;
        float _311 = 1.0 / _305;
        float _313 = _307 * 0.693147182464599609375;
        float _315 = exp2(_309);
        float _317 = 1.0 / _313;
        float _319 = _315 + (-1.0);
        float _321 = -_319;
        float _323 = fma(_321, _317, _129);
        float _325 = _323 * _311;
        float _327 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _297 = _327;
    }
    float _329 = _297;
    bool _331 = !_169;
    if (!_331)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = 1.0 / _339;
        float _343 = _129 * _335;
        float _345 = exp2(_343);
        float _347 = -_345;
        float _349 = _347 + 1.0;
        float _351 = _349 * _341;
        _289 = _351;
    }
    float _353 = _289;
    float _355 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = fma(_281, _157, _287);
    float _361 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_353, _157, _355);
    float _365 = fma(_281, _155, _357);
    float _367 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _371 = fma(_353, _155, _361);
    float _373 = -_363;
    float _375 = _359 + _373;
    float _377 = fma(_353, _159, _367);
    float _379 = fma(_281, _159, _369);
    float _381 = -_371;
    float _383 = _365 + _381;
    float _385 = _375 * _375;
    float _387 = in.m_52.w;
    float _389 = -_377;
    float _391 = _379 + _389;
    float _393 = _375 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = fma(_383, _383, _385);
    out.m_54.y = as_type<float>(_205);
    float _397 = _375 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = _375 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _401 = fma(_391, _391, _395);
    float _403 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _405 = in.m_42.x;
    float _407 = in.m_42.y;
    float _409 = in.m_42.z;
    float _411 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _413 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _399);
    float _415 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _403);
    float _417 = sqrt(_401);
    float _419 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _411);
    float _421 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _413);
    bool _423 = _417 >= 9.9999999747524270787835121154785e-07;
    bool _425 = isnan(_417);
    bool _427 = _423 || _425;
    bool _429 = isnan(9.9999999747524270787835121154785e-07);
    bool _431 = _427 || _429;
    float _433 = fma(_365, _387, _405);
    float _435 = fma(_359, _387, _407);
    float _437 = fma(_379, _387, _409);
    float _439 = _413;
    float _441 = _365;
    float _443 = _359;
    if (_431)
    {
        _439 = _415;
    }
    float _445 = _439;
    float _447 = _445;
    if (_431)
    {
        _441 = _419;
    }
    float _449 = _441;
    float _451 = _449;
    if (_431)
    {
        _443 = _421;
    }
    float _453 = _443;
    float _455 = _453;
    if (!_431)
    {
        bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _459 = !_457;
        if (!_459)
        {
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _463 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _465 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
            float _475 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _469);
            float _477 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _471);
            float _479 = _473 * _473;
            float _481 = fma(_475, _475, _479);
            float _483 = fma(_477, _477, _481);
            float _485 = rsqrt(_483);
            float _487 = _485 * 9.9999999747524270787835121154785e-07;
            float _489 = _475 * _487;
            float _491 = _473 * _487;
            float _493 = _477 * _487;
            _451 = _491;
            _447 = _489;
            _455 = _493;
            _495 = true;
        }
        else
        {
            float _497 = _157 * _157;
            float _499 = fma(_155, _155, _497);
            float _501 = fma(_159, _159, _499);
            float _503 = sqrt(_501);
            bool _505 = _503 >= 9.9999999747524270787835121154785e-07;
            bool _507 = isnan(_503);
            bool _509 = _505 || _507;
            bool _511 = isnan(9.9999999747524270787835121154785e-07);
            bool _513 = _509 || _511;
            if (!_513)
            {
                float _515 = _407 * _407;
                float _517 = fma(_405, _405, _515);
                float _519 = fma(_409, _409, _517);
                float _521 = sqrt(_519);
                bool _523 = _521 >= 9.9999999747524270787835121154785e-07;
                bool _525 = isnan(_521);
                bool _527 = _523 || _525;
                bool _529 = isnan(9.9999999747524270787835121154785e-07);
                bool _531 = _527 || _529;
                if (!_531)
                {
                    float _533 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _535 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _533);
                    float _537 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _535);
                    float _539 = rsqrt(_537);
                    float _541 = _539 * 9.9999999747524270787835121154785e-07;
                    float _543 = _541 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _545 = _541 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _541 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _451 = _545;
                    _447 = _543;
                    _455 = _547;
                    _495 = true;
                }
                else
                {
                    float _549 = _407 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _551 = _407 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _553 = _407 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _555 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].x, _549);
                    float _557 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].x, _551);
                    float _559 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].x, _553);
                    float _561 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _555);
                    float _563 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _557);
                    float _565 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _559);
                    float _567 = _561 * _561;
                    float _569 = fma(_563, _563, _567);
                    float _571 = fma(_565, _565, _569);
                    float _573 = rsqrt(_571);
                    float _575 = _573 * 9.9999999747524270787835121154785e-07;
                    float _577 = _563 * _575;
                    float _579 = _561 * _575;
                    float _581 = _565 * _575;
                    _451 = _579;
                    _447 = _577;
                    _455 = _581;
                    _495 = true;
                }
            }
            else
            {
                float _583 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _585 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _587 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _589 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _583);
                float _591 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _585);
                float _593 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
                float _595 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _589);
                float _597 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _591);
                float _599 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _593);
                float _601 = _595 * _595;
                float _603 = fma(_597, _597, _601);
                float _605 = fma(_599, _599, _603);
                float _607 = rsqrt(_605);
                float _609 = _607 * 9.9999999747524270787835121154785e-07;
                float _611 = _597 * _609;
                float _613 = _595 * _609;
                float _615 = _599 * _609;
                _451 = _613;
                _447 = _611;
                _455 = _615;
            }
        }
    }
    _495 = false;
    float _617 = _451;
    float _619 = _447;
    float _621 = _455;
    float _623 = in.m_56.x;
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _627 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _631 = _629 != 0;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _635 = _633 != 0;
    float _637 = _627 * _625;
    int _639 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _641 = _639 != 0;
    float _643 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[20].x, _637);
    bool _645 = !_635;
    int _647 = _645 ? 0 : 1;
    float _649 = _643 * 6.283185482025146484375;
    float _651 = floor(_643);
    int _653 = abs(_647);
    float _655 = _649 * 0.15915493667125701904296875;
    bool _657 = !_631;
    int _659 = _657 ? 0 : 1;
    int _661 = abs(_659);
    float _663 = _655 * 6.283185482025146484375;
    float _665 = cos(_663);
    bool _667 = !_641;
    int _669 = _667 ? 0 : 1;
    bool _671 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _673 = -_651;
    float _675 = _643 + _673;
    int _677 = abs(_669);
    float _679 = float(_661);
    float _681 = -_675;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _685 = _675 < 0.5;
    float _687 = float(_685);
    float _689 = abs(_683);
    float _691 = _679 * _689;
    float _693 = fma(_665, 0.5, 0.5);
    float _695 = float(_677);
    float _697 = -_687;
    float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _701 = float(_653);
    float _703 = -_693;
    float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _707 = fma(_695, _705, _691);
    float _709 = abs(_699);
    float _711 = fma(_701, _709, _707);
    bool _713 = !_671;
    float _729;
    if (!_713)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _717 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _721 = _719 * _715;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _727;
        _731 = true;
    }
    else
    {
        float _733 = float(_95);
        float _735 = 1.0 / _733;
        float _737 = _129 * _735;
        _729 = _737;
    }
    _731 = false;
    float _739 = _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _743 = _739 + _741;
    float _745 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _747 = in.m_52.x;
    float _749 = in.m_52.y;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _751;
    bool _755 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _757 = isnan(_739);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = _745 * _623;
    bool _769 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _771 = 1.0 / _753;
    float _773 = -_765;
    float _775 = _773 + 1.0;
    float _777 = trunc(_767);
    int _779 = int(_777);
    float _781 = _743 * _771;
    bool _783 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _785 = isnan(_739);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _799;
    float _803 = _793 * _775;
    float _805 = fma(_797, _781, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _807 = fma(_801, _781, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _809 = -_793;
    float _811 = _809 + 1.0;
    int _813 = _779 << 4;
    int _815 = _813 + 1712;
    float _817 = _805 * _803;
    float _819 = _807 * _803;
    float _821 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].x, _817);
    float _823 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].y, _819);
    float _825 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[144].x, _821);
    float _827 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[144].y, _823);
    float _829 = _825 * _747;
    float _831 = _827 * _749;
    bool _833 = !_769;
    float _849;
    if (!_833)
    {
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _837 = _623 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _839 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _841 = _839 * _835;
        float _843 = floor(_841);
        float _845 = -_843;
        float _847 = _841 + _845;
        _849 = _847;
        _851 = true;
    }
    else
    {
        float _853 = float(_95);
        float _855 = 1.0 / _853;
        float _857 = _129 * _855;
        _849 = _857;
    }
    _851 = false;
    float _859 = _849;
    uint _862 = uint(int(uint(_815) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[int(_872)][_874];
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _880 = _859 + _878;
    bool _882 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _884 = isnan(_859);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _898 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _900 = isnan(_859);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    int _910 = _815 + 8;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    uint _914 = uint(int(uint(int(_912)) >> uint(2)));
    int _916 = int(_912) & 3;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[int(_914)][_916];
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _920;
    float _924 = -_892;
    float _926 = _924 + 1.0;
    bool _928 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _930 = 1.0 / _896;
    float _932 = _908 * _926;
    float _934 = -_908;
    float _936 = _934 + 1.0;
    float _938 = _922 * _930;
    float _940 = fma(_938, _880, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _942 = _940 * _932;
    float _944 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[115].x, _942);
    float _946 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[116].x, _944);
    float _948 = _868 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _950 = _876 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _954 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _918 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _960 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _962 = !_928;
    float _980;
    float _982;
    if (!_962)
    {
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _966 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _968 = float(_95);
        float _970 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _972 = _970 * _964;
        float _974 = floor(_972);
        float _976 = -_974;
        float _978 = _972 + _976;
        _980 = _968;
        _982 = _978;
        _984 = true;
    }
    else
    {
        float _986 = float(_95);
        float _988 = 1.0 / _986;
        float _990 = _129 * _988;
        _980 = _986;
        _982 = _990;
    }
    _984 = false;
    float _992 = _980;
    float _994 = _982;
    float _996 = in.m_56.z;
    float _998 = _623 * 2.0;
    float _1000 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1002 = _617 * _617;
    float _1004 = in.m_56.y;
    float _1006 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1008 = log2(_1006);
    float _1010 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1012 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1014 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1000);
    float _1016 = fma(_619, _619, _1002);
    float _1018 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1010);
    float _1020 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1012);
    float _1022 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1014);
    float _1024 = floor(_998);
    float _1026 = fma(_621, _621, _1016);
    float _1028 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    float _1030 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1020);
    float _1032 = _1022 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1034 = _1028 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1036 = rsqrt(_1026);
    float _1038 = _129 * _1008;
    float _1040 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1042 = _996 * 2.0;
    float _1044 = _829 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1046 = _1004 * 2.0;
    float _1048 = floor(_1042);
    float _1050 = _1004 + _996;
    bool _1052 = _1024 > 0.0;
    float _1054 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_205));
    bool _1056 = _1024 >= 0.0;
    bool _1058 = isnan(_1024);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.0);
    bool _1064 = _1060 || _1062;
    float _1066 = _1050 + (-1.0);
    float _1068 = floor(_1046);
    float _1070 = _623 + _996;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1074 = _1072 != 0;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1078 = _1076 != 0;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1082 = _1080 != 0;
    float _1084 = _1036 * _619;
    float _1086 = _1036 * _617;
    float _1088 = _1070 + (-1.0);
    float _1090 = _1036 * _621;
    bool _1092 = !_1078;
    int _1094 = _1092 ? 0 : 1;
    float _1096 = exp2(_1038);
    bool _1098 = _1048 > 0.0;
    float _1100 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1102 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1104 = !_1074;
    int _1106 = _1104 ? 0 : 1;
    bool _1108 = _1068 > 0.0;
    bool _1110 = _1068 >= 0.0;
    bool _1112 = isnan(_1068);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(0.0);
    bool _1118 = _1114 || _1116;
    bool _1120 = _1048 >= 0.0;
    bool _1122 = isnan(_1048);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = in.m_58.x;
    float _1132 = in.m_58.y;
    float _1134 = in.m_58.z;
    int _1136 = _1064 ? 0 : 1;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1140 = 1.0 + _1138;
    int _1142 = _1128 ? 0 : 1;
    float _1144 = -_1096;
    float _1146 = _1144 + 1.0;
    int _1148 = ~_1136;
    int _1150 = _1148 + 1;
    int _1152 = _1150 + 1;
    float _1154 = 1.0 / _1140;
    int _1156 = abs(_1094);
    int _1158 = _1152;
    float _1160 = _1086;
    if (!_1052)
    {
        int _1162 = ~_1136;
        int _1164 = _1162 + 1;
        _1158 = _1164;
    }
    int _1166 = _1158;
    int _1168 = ~_1142;
    int _1170 = _1168 + 1;
    int _1172 = _1170 + 1;
    int _1174 = _1172;
    if (!_1098)
    {
        int _1176 = ~_1142;
        int _1178 = _1176 + 1;
        _1174 = _1178;
    }
    int _1180 = _1174;
    int _1182 = abs(_1106);
    float _1184 = float(_1156);
    float _1186 = float(_1166);
    bool _1188 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1190 = isnan(0.0);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1196 = _1192 || _1194;
    float _1198 = _1184 * _1186;
    float _1200 = _1196 ? _1146 : 0.0;
    float _1202 = float(_1182);
    float _1204 = _1198 * (-2.0);
    float _1206 = float(_1180);
    float _1208 = _1200 * _1154;
    float _1210 = _1004 + (-0.5);
    float _1212 = fma(_1204, _1132, _1132);
    int _1214 = _1118 ? 0 : 1;
    float _1216 = _1202 * _1206;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1220 = _1032 + _1218;
    float _1222 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1212);
    bool _1224 = !_1082;
    int _1226 = _1224 ? 0 : 1;
    float _1228 = fma(_1100, _1204, _1100);
    int _1230 = ~_1214;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1238 = _1040 + _1236;
    int _1240 = _1234;
    float _1242 = _1220;
    if (!_1108)
    {
        int _1244 = ~_1214;
        int _1246 = _1244 + 1;
        _1240 = _1246;
    }
    int _1248 = _1240;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1252 = _1034 + _1250;
    int _1254 = abs(_1226);
    float _1256 = _1220 * _1220;
    bool _1258 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1260 = isnan(1.0);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1266 = _1262 || _1264;
    float _1268 = _1086 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1270 = _623 + _1004;
    float _1272 = fma(_1252, _1252, _1256);
    bool _1274 = !_1266;
    float _1276 = _1274 ? _129 : _1208;
    float _1278 = fma(_1084, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1268);
    float _1280 = _1270 + (-1.0);
    float _1282 = fma(_1238, _1238, _1272);
    float _1284 = _1216 * (-2.0);
    float _1286 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1278);
    float _1288 = fma(_1276, _1228, _1222);
    float _1290 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1292 = _623 + (-0.5);
    float _1294 = rsqrt(_1282);
    float _1296 = fma(_1284, _1130, _1130);
    float _1298 = _1288 * 0.15915493667125701904296875;
    float _1300 = float(_1254);
    float _1302 = fma(_1290, _1284, _1290);
    float _1304 = float(_1248);
    float _1306 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1296);
    float _1308 = abs(_1286);
    bool _1310 = _1308 > 0.99989998340606689453125;
    float _1312 = fma(_1276, _1302, _1306);
    float _1314 = _1300 * _1304;
    float _1316 = _1298 * 6.283185482025146484375;
    float _1318 = sin(_1316);
    float _1320 = _1312 * 0.15915493667125701904296875;
    float _1322 = _1314 * (-2.0);
    float _1324 = _1220 * _1294;
    float _1326 = _1252 * _1294;
    float _1328 = _1238 * _1294;
    float _1330 = fma(_1102, _1322, _1102);
    float _1332 = -_1324;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1220);
    float _1336 = fma(_1322, _1134, _1134);
    float _1338 = _996 + (-0.5);
    float _1340 = _1334;
    float _1342 = _1276;
    float _1344 = _1324;
    if (!_1310)
    {
        _1242 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1346 = _1242;
    float _1348 = _1334 * _1334;
    float _1350 = _1346;
    if (_1310)
    {
        _1340 = 0.001000000047497451305389404296875;
    }
    float _1352 = _1340;
    float _1354 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1336);
    float _1356 = -_1326;
    float _1358 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1252);
    float _1360 = _1320 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    float _1364 = -_1328;
    float _1366 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1238);
    float _1368 = _1354;
    if (_1310)
    {
        float _1370 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1350 = _1370;
    }
    float _1372 = _1350;
    float _1374 = fma(_1276, _1330, _1354);
    if (!_1310)
    {
        _1368 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1376 = _1368;
    float _1378 = fma(_1358, _1358, _1348);
    float _1380 = _1376;
    if (!_1310)
    {
        _1342 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1382 = _1342;
    float _1384 = _1382;
    if (_1310)
    {
        float _1386 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1380 = _1386;
    }
    float _1388 = _1380;
    float _1390 = -_1372;
    float _1392 = _1090 * _1390;
    if (_1310)
    {
        float _1394 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1384 = _1394;
    }
    float _1396 = _1384;
    float _1398 = _1320 * 6.283185482025146484375;
    float _1400 = cos(_1398);
    float _1402 = _1374 * 0.15915493667125701904296875;
    float _1404 = -_1388;
    float _1406 = -_1392;
    float _1408 = fma(_1084, _1404, _1406);
    float _1410 = fma(_1366, _1366, _1378);
    float _1412 = _1408 * _1408;
    float _1414 = _1298 * 6.283185482025146484375;
    float _1416 = cos(_1414);
    float _1418 = -_1388;
    float _1420 = _1086 * _1418;
    float _1422 = -_1396;
    float _1424 = _1084 * _1422;
    float _1426 = -_1396;
    float _1428 = -_1420;
    float _1430 = fma(_1090, _1426, _1428);
    float _1432 = -_1372;
    float _1434 = -_1424;
    float _1436 = fma(_1086, _1432, _1434);
    float _1438 = _1362 * _1318;
    float _1440 = _1402 * 6.283185482025146484375;
    float _1442 = cos(_1440);
    float _1444 = fma(_1430, _1430, _1412);
    float _1446 = _1400 * _1318;
    float _1448 = fma(_1436, _1436, _1444);
    float _1450 = _1402 * 6.283185482025146484375;
    float _1452 = sin(_1450);
    float _1454 = _1362 * _1416;
    float _1456 = _1400 * _1416;
    float _1458 = sqrt(_1410);
    float _1460 = _1362 * _1442;
    float _1462 = fma(_129, 0.014999999664723873138427734375, _623);
    float _1464 = _1416 * _1442;
    float _1466 = _1400 * _1442;
    float _1468 = _1318 * _1442;
    float _1470 = rsqrt(_1448);
    float _1472 = fma(_1452, _1456, _1438);
    float _1474 = _1466 * _1084;
    float _1476 = _1294 * _1458;
    float _1478 = -_1446;
    float _1480 = fma(_1452, _1454, _1478);
    float _1482 = -_1454;
    float _1484 = fma(_1452, _1446, _1482);
    float _1486 = fma(_1452, _1438, _1456);
    float _1488 = floor(_1462);
    float _1490 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1492 = _1044 * _1476;
    float _1494 = _831 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1496 = _1408 * _1470;
    float _1498 = _1436 * _1470;
    float _1500 = _1492 * _1490;
    float _1502 = _1472 * _1090;
    float _1504 = _1430 * _1470;
    float _1506 = _1084 * _1496;
    float _1508 = _1466 * _1090;
    float _1510 = _1484 * _1090;
    float _1512 = fma(_1464, _1498, _1502);
    float _1514 = -_1506;
    float _1516 = fma(_1086, _1504, _1514);
    float _1518 = -_1452;
    float _1520 = fma(_1518, _1498, _1508);
    float _1522 = fma(_1468, _1498, _1510);
    float _1524 = fma(_1488, -0.1500000059604644775390625, 1.0);
    float _1526 = _1494 * _1476;
    float _1528 = fma(_1460, _1516, _1520);
    float _1530 = _1086 * _1498;
    float _1532 = fma(_1480, _1516, _1512);
    float _1534 = precise::max(_1524, 0.20000000298023223876953125);
    float _1536 = _1472 * _1084;
    float _1538 = -_1452;
    float _1540 = fma(_1538, _1504, _1474);
    float _1542 = -_1530;
    float _1544 = fma(_1090, _1496, _1542);
    float _1546 = _1526 * _1054;
    float _1548 = fma(_1486, _1516, _1522);
    float _1550 = fma(_1464, _1504, _1536);
    float _1552 = _1484 * _1084;
    float _1554 = fma(_1460, _1544, _1540);
    float _1556 = _1546 * _1528;
    float _1558 = fma(_1480, _1544, _1550);
    float _1560 = fma(_1468, _1504, _1552);
    float _1562 = _1546 * _1554;
    float _1564 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1566 = _1564 * 0.5;
    float _1568 = fma(_1500, _1532, _1556);
    float _1570 = fma(_1486, _1544, _1560);
    float _1572 = precise::min(_1534, 1.0);
    float _1574 = fma(_1500, _1558, _1562);
    float _1576 = fma(_1566, _1548, _1568);
    float _1578 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1580 = _1466 * _1086;
    float _1582 = fma(_1566, _1570, _1574);
    float _1584 = fma(_1576, _1572, _1040);
    float _1586 = _1090 * _1504;
    float _1588 = -_1452;
    float _1590 = fma(_1588, _1496, _1580);
    float _1592 = fma(_1582, _1572, _1034);
    float _1594 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1584);
    float _1596 = _1472 * _1086;
    float _1598 = -_1586;
    float _1600 = fma(_1084, _1498, _1598);
    float _1602 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1592);
    float _1604 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1606 = _1594 + _1604;
    float _1608 = _1484 * _1086;
    float _1610 = fma(_1464, _1496, _1596);
    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1614 = _1602 + _1612;
    float _1616 = _1606 * _1606;
    float _1618 = fma(_1460, _1600, _1590);
    float _1620 = fma(_1468, _1496, _1608);
    float _1622 = fma(_1480, _1600, _1610);
    float _1624 = fma(_1614, _1614, _1616);
    float _1626 = _1546 * _1618;
    float _1628 = fma(_1486, _1600, _1620);
    float _1630 = sqrt(_1624);
    float _1632 = fma(_1500, _1622, _1626);
    float _1634 = fma(_1566, _1628, _1632);
    float _1636 = fma(_1634, _1572, _1032);
    float _1638 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1636);
    float _1640 = -_1326;
    float _1642 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    bool _1644 = _1630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1648 = _1646 != 0;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1652 = _1650 != 0;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1656 = _1654 != 0;
    int _1658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1660 = _1658 != 0;
    bool _1662 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(0.5);
    bool _1670 = _1666 || _1668;
    bool _1672 = !_1652;
    int _1674 = _1672 ? 0 : 1;
    bool _1676 = !_1648;
    int _1678 = _1676 ? 0 : 1;
    bool _1680 = !_1656;
    int _1682 = _1680 ? 0 : 1;
    bool _1684 = !_1660;
    int _1686 = _1684 ? 0 : 1;
    float _1688 = _1602;
    float _1690 = _1594;
    if (!_1644)
    {
        _1160 = _1638;
    }
    float _1692 = _1160;
    bool _1694 = !_1644;
    float _1696 = _1692;
    if (!_1694)
    {
        float _1698 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1702 = _1630 + _1700;
        float _1704 = _1638 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1706 = rsqrt(_1624);
        float _1708 = _1702 * _1698;
        float _1710 = _1708 * 0.15915493667125701904296875;
        float _1712 = _1710 * 6.283185482025146484375;
        float _1714 = cos(_1712);
        float _1716 = _1710 * 6.283185482025146484375;
        float _1718 = sin(_1716);
        float _1720 = _1714 + (-1.0);
        float _1722 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1724 = fma(_1718, _1704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1726 = fma(_1638, _1714, _1722);
        float _1728 = _1706 * _1724;
        float _1730 = fma(_1614, _1728, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1732 = fma(_1606, _1728, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1688 = _1730;
        _1696 = _1726;
        _1690 = _1732;
    }
    float _1734 = _1688;
    float _1736 = _1696;
    float _1738 = _1690;
    float _1740 = -_1326;
    float _1742 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1734);
    float _1744 = -_1324;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1736);
    float _1748 = -_1328;
    float _1750 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1738);
    float _1752 = -_1324;
    float _1754 = fma(_1752, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1032);
    float _1756 = -_1328;
    float _1758 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1040);
    float _1760 = _1742;
    float _1762 = _1746;
    float _1764 = _1736;
    if (_1670)
    {
        _1344 = _1742;
    }
    float _1766 = _1344;
    float _1768 = _1766;
    if (_1670)
    {
        _1760 = _1746;
    }
    float _1770 = _1760;
    float _1772 = _1770;
    if (_1670)
    {
        _1762 = _1750;
    }
    float _1774 = _1762;
    float _1776 = _1774;
    if (!_1670)
    {
        float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1780 = _1754 + _1778;
        float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1784 = _1642 + _1782;
        float _1786 = 1.0 / _1476;
        float _1788 = -_1040;
        float _1790 = _1788 + _1738;
        float _1792 = _1780 * _1780;
        float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1796 = _1758 + _1794;
        float _1798 = fma(_1784, _1784, _1792);
        float _1800 = fma(_1796, _1796, _1798);
        float _1802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1804 = sqrt(_1800);
        float _1806 = precise::min(_1804, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1808 = _1806 * _1802;
        float _1810 = -_1034;
        float _1812 = _1810 + _1734;
        float _1814 = -_1032;
        float _1816 = _1814 + _1736;
        float _1818 = _1808 * _1786;
        float _1820 = fma(_1812, _1818, _1642);
        float _1822 = fma(_1816, _1818, _1754);
        float _1824 = fma(_1790, _1818, _1758);
        _1772 = _1822;
        _1768 = _1820;
        _1776 = _1824;
    }
    float _1826 = _1772;
    float _1828 = _1768;
    float _1830 = _1776;
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1834 = _1826 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1838 = _1828 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1842 = _1830 + _1840;
    float _1844 = _1834 * _1834;
    float _1846 = fma(_1838, _1838, _1844);
    float _1848 = fma(_1842, _1842, _1846);
    float _1850 = rsqrt(_1848);
    float _1852 = sqrt(_1848);
    float _1854 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1856 = _1838 * _1854;
    float _1858 = _1842 * _1854;
    float _1860 = _1856 * _1856;
    float _1862 = _1858 * _1858;
    float _1864 = _1860 + _1862;
    float _1866 = sqrt(_1864);
    bool _1868 = _1866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1872 = _1866 + _1870;
    float _1874 = _1842;
    float _1876 = _1864;
    float _1878 = _1872;
    float _1880 = _1854;
    if (_1868)
    {
        float _1882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1874 = _1882;
    }
    float _1884 = _1874;
    if (_1868)
    {
        float _1886 = rsqrt(_1864);
        _1876 = _1886;
    }
    float _1888 = _1876;
    float _1890 = _1888;
    if (_1868)
    {
        float _1892 = _1872 * _1884;
        _1878 = _1892;
    }
    float _1894 = _1878;
    if (_1868)
    {
        float _1896 = _1894 * 0.15915493667125701904296875;
        _1764 = _1896;
    }
    float _1898 = _1764;
    float _1900 = _1884;
    float _1902 = _1898;
    if (_1868)
    {
        float _1904 = _1898 * 6.283185482025146484375;
        float _1906 = sin(_1904);
        _1900 = _1906;
    }
    float _1908 = _1900;
    float _1910 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1912 = precise::max(0.0, _1910);
    float _1914 = _1844;
    float _1916 = _1912;
    if (_1868)
    {
        float _1918 = _1898 * 6.283185482025146484375;
        float _1920 = cos(_1918);
        _1914 = _1920;
    }
    float _1922 = _1914;
    float _1924 = -_1854;
    float _1926 = -_1912;
    float _1928 = fma(_1834, _1924, _1926);
    float _1930 = _1928;
    if (_1868)
    {
        float _1932 = _1928 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1916 = _1932;
    }
    float _1934 = _1916;
    float _1936 = _1908;
    float _1938 = _1934;
    if (_1868)
    {
        float _1940 = fma(_1908, _1934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1936 = _1940;
    }
    float _1942 = _1936;
    float _1944 = _1942;
    float _1946 = _1922;
    if (_1868)
    {
        float _1948 = _1922 + (-1.0);
        _1938 = _1948;
    }
    float _1950 = _1938;
    float _1952 = _1950;
    if (_1868)
    {
        float _1954 = _1888 * _1942;
        _1880 = _1954;
    }
    float _1956 = _1880;
    if (!_1868)
    {
        _1944 = _1856;
    }
    float _1958 = _1944;
    float _1960 = _1958;
    if (_1868)
    {
        float _1962 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1902 = _1962;
    }
    float _1964 = _1902;
    if (_1868)
    {
        float _1966 = _1856 * _1956;
        _1960 = _1966;
    }
    float _1968 = _1960;
    if (!_1868)
    {
        _1952 = _1858;
    }
    float _1970 = _1952;
    float _1972 = _1970;
    if (_1868)
    {
        float _1974 = _1858 * _1956;
        _1972 = _1974;
    }
    float _1976 = _1972;
    if (!_1868)
    {
        _1890 = _1860;
    }
    float _1978 = _1890;
    float _1980 = _1978;
    if (_1868)
    {
        float _1982 = fma(_1928, _1922, _1964);
        _1930 = _1982;
    }
    float _1984 = _1930;
    if (_1868)
    {
        float _1986 = _1968 * _1968;
        _1980 = _1986;
    }
    float _1988 = _1980;
    if (!_1868)
    {
        _1946 = _1862;
    }
    float _1990 = _1946;
    float _1992 = _1990;
    if (_1868)
    {
        float _1994 = _1976 * _1976;
        _1992 = _1994;
    }
    float _1996 = _1992;
    float _1998 = fma(_1984, _1984, _1988);
    float _2000 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2002 = _1998 + _1996;
    float _2004 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2000);
    float _2006 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2010 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2008);
    float _2012 = precise::clamp(_2010, 0.0, 1.0);
    float _2014 = rsqrt(_2002);
    float _2016 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2004);
    float _2018 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2006);
    float _2020 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2022 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2024 = _2016 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2026 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2028 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2018);
    float _2030 = -_2012;
    float _2032 = _2030 + 1.0;
    float _2034 = _2024 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2036 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2026);
    float _2038 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2022);
    float _2040 = _2028 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2042 = abs(_2032);
    float _2044 = log2(_2042);
    float _2046 = -_2034;
    float _2048 = fma(_2046, _2020, 1.0);
    float _2050 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2036);
    float _2052 = _2014 * _1968;
    float _2054 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2038);
    float _2056 = _2050 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2058 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2060 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2062 = _2014 * _1984;
    float _2064 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2066 = _2014 * _1976;
    float _2068 = log2(_2048);
    float _2070 = -_2058;
    float _2072 = fma(_2062, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2070);
    float _2074 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2064);
    float _2076 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2078 = _2044 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2080 = -_2066;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2072);
    float _2084 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2074);
    float _2086 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2076);
    float _2088 = fma(_2082, -0.5, 0.5);
    float _2090 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2084);
    float _2092 = exp2(_2078);
    float _2094 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2096 = fma(_2082, 0.5, 0.5);
    float _2098 = _2062 + 1.0;
    float _2100 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2094);
    float _2102 = fma(_2096, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2104 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2086);
    float _2106 = 1.0 / _2090;
    float _2108 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2100);
    float _2110 = fma(_2096, _2102, -0.212114393711090087890625);
    float _2112 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2104);
    float _2114 = _2068 * 0.693147182464599609375;
    float _2116 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2108);
    float _2118 = fma(_2096, _2110, 1.570728778839111328125);
    float _2120 = sqrt(_2088);
    float _2122 = -_2062;
    float _2124 = fma(_2092, _2098, _2122);
    float _2126 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2128 = fma(_2124, 0.5, 0.5);
    float _2130 = _2116 * _2106;
    float _2132 = _2112 * _2106;
    float _2134 = fma(_2130, 0.5, 0.5);
    float _2136 = fma(_2132, -0.5, 0.5);
    float _2138 = _2120 * 0.636619746685028076171875;
    float _2140 = -_2118;
    float _2142 = fma(_2138, _2140, 1.0);
    float3 _6453 = float3(_2134, _2136, _2126);
    float _2144 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6453, float3(0.0), isnan(_6453)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6453, float3(0.0), isnan(_6453)), level(0.0)).x;
    float3 _6464 = float3(_2134, _2136, _2126);
    float4 _2147 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6464, float3(0.0), isnan(_6464)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6464, float3(0.0), isnan(_6464)), level(0.0)).xyzw;
    float _2149 = _2147.x;
    float _2151 = _2147.y;
    float _2153 = _2147.z;
    float _2155 = _2147.w;
    float2 _6481 = float2(_2142, _2128);
    float3 _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6481, float2(0.0), isnan(_6481)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6481, float2(0.0), isnan(_6481)), level(0.0)).xyz;
    float _2161 = _2159.x;
    float _2163 = _2159.y;
    float _2165 = _2159.z;
    float _2167 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2169 = int(_2167);
    out.m_60.x = _954;
    out.m_60.y = _956;
    out.m_60.z = _960;
    out.m_60.w = _952;
    float _2171 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2175 = _2173 != 0;
    float _2177 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2179 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2181 = int(_2179);
    float _2183 = in.m_56.w;
    bool _2185 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2187 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2189 = _2185 || _2187;
    bool _2191 = isnan(0.5);
    bool _2193 = _2189 || _2191;
    float _2195 = _2044 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_62.y = _1526;
    float _2199 = float(_2169);
    float _2201 = _623 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2203 = !_2175;
    float _2205 = _2203 ? _1004 : _623;
    float _2207 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2209 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2207;
    float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2213 = _2211 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2215 = -_2197;
    float _2217 = fma(_2201, 2.0, _2215);
    float _2219 = 1.0 / _2199;
    out.m_64.x = _1828;
    out.m_64.y = _1826;
    out.m_64.z = _1830;
    float _2221 = float(uint(_2181));
    float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2223;
    bool _2227 = _623 > 0.5;
    float _2229 = 1.0 / _2221;
    int _2231 = abs(_1674);
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2235 = _2183 > 0.5;
    int _2237 = ~_2181;
    int _2239 = _2237 + 1;
    float _2241 = _129 * _2219;
    int _2243 = ~_2181;
    int _2245 = _2243 + 1;
    float _2247 = exp2(_2195);
    bool _2249 = !_2175;
    float _2251 = _2249 ? 1.2345600128173828125 : 1.0;
    float _2253 = _2251 * _2205;
    int _2255 = as_type<int>(_2229) + (-2);
    float _2257 = trunc(_2241);
    int _2259 = int(_2257);
    float _2261 = float(_2181);
    float _2263 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2265 = _2263 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2267 = 1.0 / _2265;
    float _2269 = -_2247;
    float _2271 = _2269 + 1.0;
    float _2273 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2275 = float(uint(_2259));
    float _2277 = as_type<float>(_2255) * _2275;
    float _2279 = _2213 * _2267;
    float _2281 = trunc(_2277);
    float _2283 = precise::max(_2281, 0.0);
    uint _2285 = uint(_2283);
    float _2287 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2291 = 1.0 / _2289;
    int _2293 = _2245 * int(_2285);
    int _2295 = _2293 + _2259;
    float _2297 = float(uint(_2295));
    float _2299 = _2209 * _2291;
    float _2301 = as_type<float>(_2255) * _2297;
    float _2303 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2305 = _2303 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2307 = trunc(_2301);
    float _2309 = precise::max(_2307, 0.0);
    uint _2311 = uint(_2309);
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2315 = fma(_2171, -2.0, _2313);
    int _2317 = ~_2181;
    int _2319 = _2317 + 1;
    float _2321 = 1.0 / _2305;
    float _2323 = 1.0 / _992;
    int _2325 = int(_2285) + int(_2311);
    float _2327 = _129 * _2261;
    float _2329 = floor(_2253);
    float _2331 = _2225 * _2321;
    int _2333 = _2319 * _2325;
    int _2335 = _2333 + _2259;
    float _2337 = _2225;
    if (!_2175)
    {
        _2337 = _1004;
    }
    float _2339 = _2337;
    float _2341 = _2339;
    if (_2175)
    {
        _2341 = _623;
    }
    float _2343 = _2341;
    bool _2345 = uint(_2335) >= uint(_2181);
    float _2347 = _2327 * _2323;
    float _2349 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2233);
    float _2351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2353 = float(_2259);
    bool _2355 = !_2345;
    int _2357 = _2355 ? 0 : (-1);
    float _2359 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2349);
    bool _2361 = _1004 > 0.5;
    float _2363 = -_2329;
    float _2365 = _2253 + _2363;
    bool _2367 = _2353 >= _2261;
    bool _2369 = isnan(_2353);
    bool _2371 = _2367 || _2369;
    bool _2373 = isnan(_2261);
    bool _2375 = _2371 || _2373;
    float _2377 = float(_2375);
    float _2379 = trunc(_2347);
    int _2381 = int(_2379);
    float _2383 = _2365 * _2261;
    int _2385 = ~_2325;
    int _2387 = _2385 + _2357;
    int _2389 = _2387 + 1;
    float _2391 = -_2359;
    float _2393 = _2391 + 1.0;
    int _2395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2397 = _2395 != 0;
    float _2399 = trunc(_2377);
    int _2401 = int(_2399);
    float _2403 = -_209;
    int _2405 = _2227 ? as_type<int>(_2403) : as_type<int>(_209);
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2409 = _2351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2411 = _996 > 0.5;
    bool _2413 = !_2397;
    float _2415 = _2413 ? _209 : as_type<float>(_2405);
    float _2417 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2407);
    float _2419 = _2351;
    float _2421 = _2407;
    if (!_2175)
    {
        _2419 = _996;
    }
    float _2423 = _2419;
    float _2425 = trunc(_2383);
    int _2427 = int(_2425);
    float _2429 = _2423;
    if (!_2175)
    {
        _2421 = _996;
    }
    float _2431 = _2421;
    float _2433 = -_129;
    float _2435 = fma(_2433, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2217);
    float _2437 = _2415 + 0.5;
    float _2439 = _2431;
    if (_2175)
    {
        _2429 = _1004;
    }
    float _2441 = _2429;
    if (_2175)
    {
        _2439 = _1004;
    }
    float _2443 = _2439;
    float _2445 = fma(_2409, _2437, _2435);
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2449 = _994 + _2447;
    int _2451 = _2181 * _2389;
    int _2453 = _2451 + _2259;
    bool _2455 = _2181 == 0;
    float _2457 = _2441 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2459 = fma(_2299, _2449, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2463 = _2461 != 0;
    float _2465 = -_2393;
    float _2467 = fma(_2415, _2465, _2445);
    int _2469 = ~_2401;
    int _2471 = _2469 + 1;
    int _2473 = _2471 + 1;
    bool _2475 = !_2455;
    int _2477 = _2475 ? _2453 : (-1);
    bool _2479 = !_2463;
    int _2481 = _2479 ? 0 : 1;
    int _2483 = _2181 + (-1);
    int _2485 = _2477 * _2473;
    int _2487 = abs(_1678);
    int _2489 = abs(_2481);
    int _2491 = _2401 * _2483;
    int _2493 = _2491 + _2485;
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2497 = _994 + _2495;
    int _2499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2501 = _2499 != 0;
    int _2503 = _2493 * _2231;
    float _2505 = fma(_2279, _2497, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2507 = abs(_1682);
    int _2509 = _2427 * _2489;
    int _2511 = _2509 + _2259;
    bool _2513 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2515 = isnan(_994);
    bool _2517 = _2513 || _2515;
    bool _2519 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2521 = _2517 || _2519;
    float _2523 = float(_2521);
    int _2525 = _2381 * _2487;
    int _2527 = _2525 + _2503;
    int _2529 = abs(_1686);
    float _2531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2533 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2535 = isnan(_994);
    bool _2537 = _2533 || _2535;
    bool _2539 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2541 = _2537 || _2539;
    float _2543 = float(_2541);
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2547 = _994 + _2545;
    int _2549 = _2511 * _2507;
    int _2551 = _2549 + _2527;
    bool _2553 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2555 = isnan(_994);
    bool _2557 = _2553 || _2555;
    bool _2559 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2561 = _2557 || _2559;
    float _2563 = float(_2561);
    float _2565 = -_2543;
    float _2567 = _2565 + 1.0;
    bool _2569 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2571 = isnan(_994);
    bool _2573 = _2569 || _2571;
    bool _2575 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2577 = _2573 || _2575;
    float _2579 = float(_2577);
    float _2581 = fma(_2331, _2547, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2583 = _2427 * _2529;
    int _2585 = _2583 + _2551;
    float _2587 = _2523 * _2567;
    float _2589 = -_2523;
    float _2591 = _2589 + 1.0;
    float _2593 = -as_type<float>(_205);
    int _2595 = _2361 ? as_type<int>(_2593) : _205;
    float _2597 = -_2579;
    float _2599 = _2597 + 1.0;
    float _2601 = _2579 * _2591;
    bool _2603 = !_2501;
    float _2605 = _2603 ? as_type<float>(_205) : as_type<float>(_2595);
    float _2607 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2315);
    float _2609 = float(uint(_2585));
    float _2611 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2613 = _2531 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2615 = _2605 + (-0.5);
    float _2617 = _2563 * _2599;
    float _2619 = fma(_2443, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2611);
    float _2621 = as_type<float>(_2255) * _2609;
    float _2623 = -_2613;
    float _2625 = -_2607;
    float _2627 = fma(_2623, _2615, _2625);
    float _2629 = float(uint(_2511));
    float _2631 = _2459 * _2617;
    float _2633 = trunc(_2621);
    float _2635 = precise::max(_2633, 0.0);
    uint _2637 = uint(_2635);
    float _2639 = -_2563;
    float _2641 = _2639 + 1.0;
    float _2643 = as_type<float>(_2255) * _2629;
    float _2645 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2647 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2631);
    float _2649 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2651 = fma(_2343, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2645);
    float _2653 = trunc(_2643);
    float _2655 = precise::max(_2653, 0.0);
    uint _2657 = uint(_2655);
    float _2659 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2661 = fma(_2505, _2601, _2647);
    int _2663 = _2239 * int(_2637);
    int _2665 = _2663 + _2585;
    float _2667 = -_2649;
    float _2669 = fma(_2659, 2.0, _2667);
    float _2671 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2651);
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2677 = _2675 != 0;
    float _2679 = fma(_2581, _2587, _2661);
    float _2681 = float(uint(_2665));
    float _2683 = fma(_2457, -2.0, _2673);
    float _2685 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2417);
    float _2687 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2619);
    int _2689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2691 = _2689 != 0;
    float _2693 = as_type<float>(_2255) * _2681;
    int _2695 = _2239 * int(_2657);
    int _2697 = _2695 + _2511;
    float _2699 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2177);
    float _2701 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2703 = -_129;
    float _2705 = fma(_2703, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2669);
    float _2707 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2683);
    float _2709 = trunc(_2693);
    float _2711 = precise::max(_2709, 0.0);
    uint _2713 = uint(_2711);
    float _2715 = float(uint(_2697));
    float _2717 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2699);
    int _2719 = ~_2181;
    int _2721 = _2719 + 1;
    float _2723 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2701);
    float _2725 = -as_type<float>(_205);
    int _2727 = _2235 ? as_type<int>(_2725) : _205;
    float _2729 = as_type<float>(_2255) * _2715;
    float _2731 = _2717 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2733 = -_209;
    int _2735 = _2411 ? as_type<int>(_2733) : as_type<int>(_209);
    float _2737 = -_2685;
    float _2739 = _2737 + 1.0;
    float _2741 = -_2687;
    float _2743 = _2741 + 1.0;
    float _2745 = 1.0 / _2731;
    bool _2747 = !_2691;
    float _2749 = _2747 ? _209 : as_type<float>(_2735);
    float _2751 = fma(_2605, _2739, _2627);
    float _2753 = fma(_2543, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2679);
    float _2755 = _2679;
    float _2757 = _2605;
    float _2759 = _2627;
    if (!_2193)
    {
        _2755 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2761 = _2755;
    float _2763 = -_2671;
    float _2765 = _2763 + 1.0;
    int _2767 = int(_2637) + int(_2713);
    float _2769 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2723);
    bool _2771 = !_2677;
    float _2773 = _2771 ? as_type<float>(_205) : as_type<float>(_2727);
    float _2775 = trunc(_2729);
    float _2777 = precise::max(_2775, 0.0);
    uint _2779 = uint(_2777);
    float _2781 = _2749 + 0.5;
    int _2783 = _2721 * _2767;
    int _2785 = _2783 + _2585;
    float _2787 = _2769 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2789 = _2773 + (-0.5);
    if (!_2193)
    {
        float _2791 = -_2761;
        float _2793 = _2791 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2757 = _2793;
    }
    float _2795 = _2757;
    float _2797 = fma(_2781, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2705);
    bool _2799 = uint(_2785) >= uint(_2181);
    float _2801 = _2787 + _2731;
    float _2803 = -_2789;
    float _2805 = -_2707;
    float _2807 = fma(_2803, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2805);
    float _2809 = -_2765;
    float _2811 = fma(_2749, _2809, _2797);
    bool _2813 = !_2799;
    float _2815 = _2813 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2817 = _2801 * _2745;
    float _2819 = _2817 * 0.5;
    int _2821 = ~_2181;
    int _2823 = _2821 + 1;
    float _2825 = fma(_2773, _2743, _2807);
    int _2827 = ~_2767;
    int _2829 = _2827 + as_type<int>(_2815);
    int _2831 = _2829 + 1;
    float _2833 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2835 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2833);
    int _2837 = int(_2657) + int(_2779);
    float _2839 = _2745;
    float _2841 = _2815;
    float _2843 = _2825;
    float _2845 = _2797;
    float _2847 = _2811;
    if (!_2193)
    {
        float _2849 = 1.0 / _2795;
        _2759 = _2849;
    }
    float _2851 = _2759;
    if (!_2193)
    {
        _2839 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2853 = _2839;
    int _2855 = _2181 * _2831;
    int _2857 = _2855 + _2585;
    out.m_66.x = _2467;
    out.m_66.y = _2751;
    out.m_66.z = _2811;
    out.m_66.w = _2825;
    int _2859 = _2823 * _2837;
    int _2861 = _2859 + _2511;
    int _2863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2865 = _2863 != 0;
    float _2867 = _2853;
    if (!_2193)
    {
        float _2869 = -_2853;
        float _2871 = _2869 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2841 = _2871;
    }
    float _2873 = _2841;
    bool _2875 = !_2455;
    int _2877 = _2875 ? _2857 : (-1);
    float _2879 = 1.0 / _2835;
    bool _2881 = uint(_2861) >= uint(_2181);
    float _2883 = _2273 * _2144;
    int _2885 = _2877 >> 31;
    int _2887 = _2877 & 3;
    bool _2889 = _2887 != 0;
    int _2891 = _2885 & 3;
    float _2893 = as_type<float>(_2585);
    if (!_2193)
    {
        float _2895 = 1.0 / _2873;
        _2893 = _2895;
    }
    float _2897 = _2893;
    if (_2193)
    {
        _2843 = 1.0;
    }
    float _2899 = _2843;
    int _2901 = _2877 + _2891;
    float _2903 = _2753 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2905 = !_2881;
    int _2907 = _2905 ? 0 : (-1);
    int _2909 = _2901 >> 2;
    float _2911 = as_type<float>(_2909);
    float _2913 = _2899;
    if (!_2193)
    {
        float _2915 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2917 = -_2761;
        float _2919 = fma(_2879, _2915, _2917);
        _2845 = _2919;
    }
    float _2921 = _2845;
    if (!_2193)
    {
        float _2923 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2925 = -_2853;
        float _2927 = fma(_2879, _2923, _2925);
        _2867 = _2927;
    }
    float _2929 = _2867;
    int _2931 = ~_2837;
    int _2933 = _2931 + _2907;
    int _2935 = _2933 + 1;
    float _2937 = _2165 * _2883;
    int _2939 = _2909 << 4;
    int _2941 = _2939 + 512;
    if (!_2193)
    {
        float _2943 = _2921 * _2851;
        float _2945 = precise::clamp(_2943, 0.0, 1.0);
        _2847 = _2945;
    }
    float _2947 = _2847;
    float _2949 = as_type<float>(_205) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2951 = _2877 & 3;
    bool _2953 = _2951 != 0;
    uint _2955 = uint(int(uint(_2941) >> uint(2)));
    uint _2957 = uint(int(uint(int(_2955)) >> uint(2)));
    int _2959 = int(_2955) & 3;
    float _2961 = (*spvDescriptorSet0.vp_c9)._m0[int(_2957)][_2959];
    int _2963 = int(_2955) + 1;
    uint _2965 = uint(int(uint(_2963) >> uint(2)));
    int _2967 = _2963 & 3;
    float _2969 = (*spvDescriptorSet0.vp_c9)._m0[int(_2965)][_2967];
    if (_2193)
    {
        _2911 = 1.0;
    }
    float _2971 = _2911;
    float _2973 = _2971;
    if (!_2193)
    {
        float _2975 = _2929 * _2897;
        float _2977 = precise::clamp(_2975, 0.0, 1.0);
        _2973 = _2977;
    }
    float _2979 = _2973;
    if (!_2193)
    {
        float _2981 = -_2947;
        float _2983 = _2981 + 1.0;
        _2913 = _2983;
    }
    float _2985 = _2913;
    bool _2987 = uint(_2951) > 1u;
    int _2989 = _2181 * _2935;
    int _2991 = _2989 + _2511;
    float _2993 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2995 = _1554 * _2949;
    int _2997 = _2941 + 8;
    uint _2999 = uint(int(uint(_2997) >> uint(2)));
    uint _3001 = uint(int(uint(int(_2999)) >> uint(2)));
    int _3003 = int(_2999) & 3;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[int(_3001)][_3003];
    int _3007 = int(_2999) + 1;
    uint _3009 = uint(int(uint(_3007) >> uint(2)));
    int _3011 = _3007 & 3;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[int(_3009)][_3011];
    bool _3015 = _2951 != 3;
    float _3017 = _1528 * _2949;
    float _3019 = fma(_1558, _2993, _2995);
    int _3021 = _2889 ? 0 : 1;
    float _3023 = _2979 * _2985;
    bool _3025 = uint(_2951) >= 2u;
    float _3027 = _1618 * _2949;
    float _3029 = fma(_1532, _2993, _3017);
    float _3031 = _3023 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3033 = _3025 ? 0 : 1;
    float _3035 = fma(_1622, _2993, _3027);
    int _3037 = ~_3021;
    int _3039 = _3037 + 1;
    int _3041 = _3039 + 1;
    float _3043 = _711 * _3031;
    int _3045 = _3041;
    if (!_2987)
    {
        int _3047 = ~_3021;
        int _3049 = _3047 + 1;
        _3045 = _3049;
    }
    int _3051 = _3045;
    float _3053 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3055 = _2951 != 3;
    float _3057 = _1628 + _3035;
    int _3059 = ~_3033;
    int _3061 = _3059 + 1;
    int _3063 = _3061 + 1;
    float _3065 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3053);
    int _3067 = _3063;
    if (_3015)
    {
        int _3069 = ~_3033;
        int _3071 = _3069 + 1;
        _3067 = _3071;
    }
    int _3073 = _3067;
    float _3075 = _1570 + _3019;
    bool _3077 = !_2953;
    int _3079 = _3077 ? 0 : 1;
    float _3081 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3065);
    int _3083 = abs(_3051);
    float _3085 = _1548 + _3029;
    int _3087 = abs(_3073);
    float _3089 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3081);
    int _3091 = abs(_3079);
    out.m_68.w = _2903;
    int _3093 = ~_3083;
    int _3095 = _3093 + 1;
    int _3097 = _3095 + 1;
    bool _3099 = !_3055;
    int _3101 = _3099 ? 0 : (-1);
    out.m_70.x = _3075;
    out.m_70.y = _3057;
    out.m_70.z = _3085;
    int _3103 = ~_3091;
    int _3105 = _3103 + 1;
    int _3107 = _3105 + 1;
    int _3109 = abs(_3101);
    int _3111 = _3097 * as_type<int>(_2969);
    bool _3113 = !_2865;
    int _3115 = _3113 ? 0 : 1;
    int _3117 = ~_3087;
    int _3119 = _3117 + 1;
    int _3121 = _3119 + 1;
    int _3123 = _3107 * as_type<int>(_2961);
    int _3125 = _3123 + _3111;
    int _3127 = abs(_3115);
    int _3129 = ~_3109;
    int _3131 = _3129 + 1;
    int _3133 = _3131 + 1;
    int _3135 = _3121 * as_type<int>(_3005);
    int _3137 = _3135 + _3125;
    int _3139 = ~_3127;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    float _3145 = _3043 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _3147 = !_2455;
    int _3149 = _3147 ? _2991 : (-1);
    int _3151 = _3133 * as_type<int>(_3013);
    int _3153 = _3151 + _3137;
    bool _3155 = _2979 > 0.0;
    bool _3157 = isnan(_2979);
    bool _3159 = _3155 || _3157;
    bool _3161 = isnan(0.0);
    bool _3163 = _3159 || _3161;
    float _3165 = _2155 * _2883;
    out.m_45.x = _3145;
    int _3167 = _3153 * _3143;
    float _3169 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _3171 = _3089 + _3169;
    bool _3173 = _2985 <= 0.0;
    bool _3175 = !_3163;
    bool _3177 = _3173 || _3175;
    float _3179 = fma(_2161, _3165, _2149);
    int _3181 = _3149 * _3127;
    int _3183 = _3181 + _3167;
    float _3185 = _2090 + _3171;
    float _3187 = fma(_2163, _3165, _2151);
    float _3189 = -_2273;
    float _3191 = _3189 + 1.0;
    float _3193 = _3185 * 0.5;
    float _3195 = float(_3183);
    float _3197 = _2155 * _3191;
    float _3199 = fma(_2155, _2937, _2153);
    out.m_72.z = _3193;
    out.m_72.w = _2090;
    out.gl_Position.x = _2116;
    out.gl_Position.y = _2112;
    out.gl_Position.z = _3171;
    out.gl_Position.w = _2090;
    out.m_74.y = _3195;
    out.m_76.x = _3179;
    out.m_76.y = _3187;
    out.m_76.z = _3199;
    out.m_76.w = _3197;
    if (!_3177)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3201 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3201;
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
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _984 = false;
    bool _851 = false;
    bool _731 = false;
    bool _495 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _90 = in.m_42.w;
    float _92 = trunc(_90);
    int _95 = int(_92);
    bool _99 = _95 >= 1;
    float _101 = 0.0;
    if (!_99)
    {
        _101 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _103 = _101;
    float _105 = _103;
    if (!_99)
    {
        out.m_45.x = 0.0;
    }
    int _107 = 0;
    if (!_99)
    {
        float _109 = _103 * 5.0;
        _107 = as_type<int>(_109);
    }
    int _111 = _107;
    int _113 = _111;
    if (!_99)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3258 = as_type<float>(_111);
        out.gl_Position.z = _3258;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _115 = in.m_47.w;
    bool _117 = _115 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _119 = isnan(_115);
    bool _121 = _117 || _119;
    bool _123 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _125 = _121 || _123;
    float _127 = -_115;
    float _129 = _127 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _131 = 0.0;
    float _133 = 0.0;
    if (_125)
    {
        float _135 = float(_95);
        _131 = _135;
    }
    float _137 = _131;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    if (_143)
    {
        _105 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _145 = _105;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _147 = _145 * 5.0;
        _113 = as_type<int>(_147);
    }
    int _149 = _113;
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3326 = as_type<float>(_149);
        out.gl_Position.z = _3326;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _151 = as_type<float>(int(gl_VertexIndex));
    float _153 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _155 = in.m_47.x;
    float _157 = in.m_47.y;
    float _159 = in.m_47.z;
    bool _161 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _163 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _165 = _161 || _163;
    bool _167 = isnan(1.0);
    bool _169 = _165 || _167;
    float _171 = 0.0;
    float _173 = _153;
    if (!_169)
    {
        float _175 = _153 * _153;
        float _177 = _175 * 0.5;
        _171 = _177;
    }
    float _179 = _171;
    float _181 = 0.0;
    float _183 = _179;
    if (!_169)
    {
        float _185 = _129 * _129;
        float _187 = _185 * 0.5;
        _181 = _187;
    }
    float _189 = _181;
    if (!_169)
    {
        float _191 = _179 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _191;
    }
    float _193 = _183;
    int _195 = as_type<int>(_151) & 1;
    bool _197 = _195 != 0;
    int _199 = as_type<int>(_151) & 2;
    bool _201 = _199 != 0;
    bool _203 = !_201;
    int _205 = _203 ? (-1090519040) : 1056964608;
    bool _207 = !_197;
    float _209 = _207 ? (-0.5) : 0.5;
    bool _211 = !_169;
    float _213 = _193;
    float _215 = _151;
    if (!_211)
    {
        float _217 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _219 = log2(_217);
        float _221 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _223 = _221 + 1.0;
        float _225 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _227 = _153 * _219;
        float _229 = 1.0 / _223;
        float _231 = _225 * 0.693147182464599609375;
        float _233 = exp2(_227);
        float _235 = 1.0 / _231;
        float _237 = _233 + (-1.0);
        float _239 = -_237;
        float _241 = fma(_239, _235, _153);
        float _243 = _241 * _229;
        float _245 = _243 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _213 = _245;
        _133 = _233;
        _215 = _235;
    }
    float _247 = _213;
    float _249 = _133;
    float _251 = _215;
    bool _253 = !_169;
    float _255 = _251;
    float _257 = _249;
    if (!_253)
    {
        float _259 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _261 = log2(_259);
        float _263 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _265 = _263 + 1.0;
        float _267 = 1.0 / _265;
        float _269 = _153 * _261;
        float _271 = exp2(_269);
        float _273 = -_271;
        float _275 = _273 + 1.0;
        float _277 = _275 * _267;
        _255 = _265;
        _173 = _277;
    }
    float _279 = _255;
    float _281 = _173;
    float _283 = _279;
    if (!_169)
    {
        _283 = _129;
    }
    float _285 = _283;
    float _287 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _289 = _285;
    if (!_169)
    {
        float _291 = _189 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _257 = _291;
    }
    float _293 = _257;
    bool _295 = !_169;
    float _297 = _293;
    if (!_295)
    {
        float _299 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _301 = log2(_299);
        float _303 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _305 = _303 + 1.0;
        float _307 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _309 = _129 * _301;
        float _311 = 1.0 / _305;
        float _313 = _307 * 0.693147182464599609375;
        float _315 = exp2(_309);
        float _317 = 1.0 / _313;
        float _319 = _315 + (-1.0);
        float _321 = -_319;
        float _323 = fma(_321, _317, _129);
        float _325 = _323 * _311;
        float _327 = _325 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _297 = _327;
    }
    float _329 = _297;
    bool _331 = !_169;
    if (!_331)
    {
        float _333 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _335 = log2(_333);
        float _337 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _339 = _337 + 1.0;
        float _341 = 1.0 / _339;
        float _343 = _129 * _335;
        float _345 = exp2(_343);
        float _347 = -_345;
        float _349 = _347 + 1.0;
        float _351 = _349 * _341;
        _289 = _351;
    }
    float _353 = _289;
    float _355 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _357 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _359 = fma(_281, _157, _287);
    float _361 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _363 = fma(_353, _157, _355);
    float _365 = fma(_281, _155, _357);
    float _367 = _329 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _369 = _247 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _371 = fma(_353, _155, _361);
    float _373 = -_363;
    float _375 = _359 + _373;
    float _377 = fma(_353, _159, _367);
    float _379 = fma(_281, _159, _369);
    float _381 = -_371;
    float _383 = _365 + _381;
    float _385 = _375 * _375;
    float _387 = in.m_52.w;
    float _389 = -_377;
    float _391 = _379 + _389;
    float _393 = _375 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _395 = fma(_383, _383, _385);
    out.m_54.y = as_type<float>(_205);
    float _397 = _375 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _399 = _375 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _401 = fma(_391, _391, _395);
    float _403 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[4].x, _393);
    float _405 = in.m_42.x;
    float _407 = in.m_42.y;
    float _409 = in.m_42.z;
    float _411 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[5].x, _397);
    float _413 = fma(_383, (*spvDescriptorSet0.vp_c10)._m0[6].x, _399);
    float _415 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[4].z, _403);
    float _417 = sqrt(_401);
    float _419 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[5].z, _411);
    float _421 = fma(_391, (*spvDescriptorSet0.vp_c10)._m0[6].z, _413);
    bool _423 = _417 >= 9.9999999747524270787835121154785e-07;
    bool _425 = isnan(_417);
    bool _427 = _423 || _425;
    bool _429 = isnan(9.9999999747524270787835121154785e-07);
    bool _431 = _427 || _429;
    float _433 = fma(_365, _387, _405);
    float _435 = fma(_359, _387, _407);
    float _437 = fma(_379, _387, _409);
    float _439 = _413;
    float _441 = _365;
    float _443 = _359;
    if (_431)
    {
        _439 = _415;
    }
    float _445 = _439;
    float _447 = _445;
    if (_431)
    {
        _441 = _419;
    }
    float _449 = _441;
    float _451 = _449;
    if (_431)
    {
        _443 = _421;
    }
    float _453 = _443;
    float _455 = _453;
    if (!_431)
    {
        bool _457 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _459 = !_457;
        if (!_459)
        {
            float _461 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _463 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _465 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _467 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _461);
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _467);
            float _475 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _469);
            float _477 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _471);
            float _479 = _473 * _473;
            float _481 = fma(_475, _475, _479);
            float _483 = fma(_477, _477, _481);
            float _485 = rsqrt(_483);
            float _487 = _485 * 9.9999999747524270787835121154785e-07;
            float _489 = _475 * _487;
            float _491 = _473 * _487;
            float _493 = _477 * _487;
            _451 = _491;
            _447 = _489;
            _455 = _493;
            _495 = true;
        }
        else
        {
            float _497 = _157 * _157;
            float _499 = fma(_155, _155, _497);
            float _501 = fma(_159, _159, _499);
            float _503 = sqrt(_501);
            bool _505 = _503 >= 9.9999999747524270787835121154785e-07;
            bool _507 = isnan(_503);
            bool _509 = _505 || _507;
            bool _511 = isnan(9.9999999747524270787835121154785e-07);
            bool _513 = _509 || _511;
            if (!_513)
            {
                float _515 = _407 * _407;
                float _517 = fma(_405, _405, _515);
                float _519 = fma(_409, _409, _517);
                float _521 = sqrt(_519);
                bool _523 = _521 >= 9.9999999747524270787835121154785e-07;
                bool _525 = isnan(_521);
                bool _527 = _523 || _525;
                bool _529 = isnan(9.9999999747524270787835121154785e-07);
                bool _531 = _527 || _529;
                if (!_531)
                {
                    float _533 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _535 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _533);
                    float _537 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _535);
                    float _539 = rsqrt(_537);
                    float _541 = _539 * 9.9999999747524270787835121154785e-07;
                    float _543 = _541 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _545 = _541 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _547 = _541 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _451 = _545;
                    _447 = _543;
                    _455 = _547;
                    _495 = true;
                }
                else
                {
                    float _549 = _407 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _551 = _407 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _553 = _407 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _555 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[5].x, _549);
                    float _557 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[4].x, _551);
                    float _559 = fma(_405, (*spvDescriptorSet0.vp_c10)._m0[6].x, _553);
                    float _561 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[5].z, _555);
                    float _563 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[4].z, _557);
                    float _565 = fma(_409, (*spvDescriptorSet0.vp_c10)._m0[6].z, _559);
                    float _567 = _561 * _561;
                    float _569 = fma(_563, _563, _567);
                    float _571 = fma(_565, _565, _569);
                    float _573 = rsqrt(_571);
                    float _575 = _573 * 9.9999999747524270787835121154785e-07;
                    float _577 = _563 * _575;
                    float _579 = _561 * _575;
                    float _581 = _565 * _575;
                    _451 = _579;
                    _447 = _577;
                    _455 = _581;
                    _495 = true;
                }
            }
            else
            {
                float _583 = _157 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _585 = _157 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _587 = _157 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _589 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[5].x, _583);
                float _591 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[4].x, _585);
                float _593 = fma(_155, (*spvDescriptorSet0.vp_c10)._m0[6].x, _587);
                float _595 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].z, _589);
                float _597 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].z, _591);
                float _599 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].z, _593);
                float _601 = _595 * _595;
                float _603 = fma(_597, _597, _601);
                float _605 = fma(_599, _599, _603);
                float _607 = rsqrt(_605);
                float _609 = _607 * 9.9999999747524270787835121154785e-07;
                float _611 = _597 * _609;
                float _613 = _595 * _609;
                float _615 = _599 * _609;
                _451 = _613;
                _447 = _611;
                _455 = _615;
            }
        }
    }
    _495 = false;
    float _617 = _451;
    float _619 = _447;
    float _621 = _455;
    float _623 = in.m_56.x;
    float _625 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _627 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _629 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _631 = _629 != 0;
    int _633 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _635 = _633 != 0;
    float _637 = _627 * _625;
    int _639 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _641 = _639 != 0;
    float _643 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[20].x, _637);
    bool _645 = !_635;
    int _647 = _645 ? 0 : 1;
    float _649 = _643 * 6.283185482025146484375;
    float _651 = floor(_643);
    int _653 = abs(_647);
    float _655 = _649 * 0.15915493667125701904296875;
    bool _657 = !_631;
    int _659 = _657 ? 0 : 1;
    int _661 = abs(_659);
    float _663 = _655 * 6.283185482025146484375;
    float _665 = cos(_663);
    bool _667 = !_641;
    int _669 = _667 ? 0 : 1;
    bool _671 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _673 = -_651;
    float _675 = _643 + _673;
    int _677 = abs(_669);
    float _679 = float(_661);
    float _681 = -_675;
    float _683 = fma(_681, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _685 = _675 < 0.5;
    float _687 = float(_685);
    float _689 = abs(_683);
    float _691 = _679 * _689;
    float _693 = fma(_665, 0.5, 0.5);
    float _695 = float(_677);
    float _697 = -_687;
    float _699 = fma(_697, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _701 = float(_653);
    float _703 = -_693;
    float _705 = fma(_703, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _707 = fma(_695, _705, _691);
    float _709 = abs(_699);
    float _711 = fma(_701, _709, _707);
    bool _713 = !_671;
    float _729;
    if (!_713)
    {
        float _715 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _717 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _719 = fma(_717, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _721 = _719 * _715;
        float _723 = floor(_721);
        float _725 = -_723;
        float _727 = _721 + _725;
        _729 = _727;
        _731 = true;
    }
    else
    {
        float _733 = float(_95);
        float _735 = 1.0 / _733;
        float _737 = _129 * _735;
        _729 = _737;
    }
    _731 = false;
    float _739 = _729;
    float _741 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _743 = _739 + _741;
    float _745 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _747 = in.m_52.x;
    float _749 = in.m_52.y;
    float _751 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _753 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _751;
    bool _755 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _757 = isnan(_739);
    bool _759 = _755 || _757;
    bool _761 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _763 = _759 || _761;
    float _765 = float(_763);
    float _767 = _745 * _623;
    bool _769 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _771 = 1.0 / _753;
    float _773 = -_765;
    float _775 = _773 + 1.0;
    float _777 = trunc(_767);
    int _779 = int(_777);
    float _781 = _743 * _771;
    bool _783 = _739 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _785 = isnan(_739);
    bool _787 = _783 || _785;
    bool _789 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _791 = _787 || _789;
    float _793 = float(_791);
    float _795 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _797 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _795;
    float _799 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _801 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _799;
    float _803 = _793 * _775;
    float _805 = fma(_797, _781, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _807 = fma(_801, _781, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _809 = -_793;
    float _811 = _809 + 1.0;
    int _813 = _779 << 4;
    int _815 = _813 + 1712;
    float _817 = _805 * _803;
    float _819 = _807 * _803;
    float _821 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].x, _817);
    float _823 = fma(_811, (*spvDescriptorSet0.vp_c9)._m0[143].y, _819);
    float _825 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[144].x, _821);
    float _827 = fma(_765, (*spvDescriptorSet0.vp_c9)._m0[144].y, _823);
    float _829 = _825 * _747;
    float _831 = _827 * _749;
    bool _833 = !_769;
    float _849;
    if (!_833)
    {
        float _835 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _837 = _623 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _839 = fma(_837, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _841 = _839 * _835;
        float _843 = floor(_841);
        float _845 = -_843;
        float _847 = _841 + _845;
        _849 = _847;
        _851 = true;
    }
    else
    {
        float _853 = float(_95);
        float _855 = 1.0 / _853;
        float _857 = _129 * _855;
        _849 = _857;
    }
    _851 = false;
    float _859 = _849;
    uint _862 = uint(int(uint(_815) >> uint(2)));
    uint _864 = uint(int(uint(int(_862)) >> uint(2)));
    int _866 = int(_862) & 3;
    float _868 = (*spvDescriptorSet0.vp_c9)._m0[int(_864)][_866];
    int _870 = int(_862) + 1;
    uint _872 = uint(int(uint(_870) >> uint(2)));
    int _874 = _870 & 3;
    float _876 = (*spvDescriptorSet0.vp_c9)._m0[int(_872)][_874];
    float _878 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _880 = _859 + _878;
    bool _882 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _884 = isnan(_859);
    bool _886 = _882 || _884;
    bool _888 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _890 = _886 || _888;
    float _892 = float(_890);
    float _894 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _896 = _894 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _898 = _859 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _900 = isnan(_859);
    bool _902 = _898 || _900;
    bool _904 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _906 = _902 || _904;
    float _908 = float(_906);
    int _910 = _815 + 8;
    uint _912 = uint(int(uint(_910) >> uint(2)));
    uint _914 = uint(int(uint(int(_912)) >> uint(2)));
    int _916 = int(_912) & 3;
    float _918 = (*spvDescriptorSet0.vp_c9)._m0[int(_914)][_916];
    float _920 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _922 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _920;
    float _924 = -_892;
    float _926 = _924 + 1.0;
    bool _928 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _930 = 1.0 / _896;
    float _932 = _908 * _926;
    float _934 = -_908;
    float _936 = _934 + 1.0;
    float _938 = _922 * _930;
    float _940 = fma(_938, _880, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _942 = _940 * _932;
    float _944 = fma(_936, (*spvDescriptorSet0.vp_c9)._m0[115].x, _942);
    float _946 = fma(_892, (*spvDescriptorSet0.vp_c9)._m0[116].x, _944);
    float _948 = _868 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _950 = _876 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _952 = _946 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _954 = _948 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _918 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _960 = _958 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _962 = !_928;
    float _980;
    float _982;
    if (!_962)
    {
        float _964 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _966 = _623 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _968 = float(_95);
        float _970 = fma(_966, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _972 = _970 * _964;
        float _974 = floor(_972);
        float _976 = -_974;
        float _978 = _972 + _976;
        _980 = _968;
        _982 = _978;
        _984 = true;
    }
    else
    {
        float _986 = float(_95);
        float _988 = 1.0 / _986;
        float _990 = _129 * _988;
        _980 = _986;
        _982 = _990;
    }
    _984 = false;
    float _992 = _980;
    float _994 = _982;
    float _996 = in.m_56.z;
    float _998 = _623 * 2.0;
    float _1000 = _435 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1002 = _617 * _617;
    float _1004 = in.m_56.y;
    float _1006 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1008 = log2(_1006);
    float _1010 = _435 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1012 = _435 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1014 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1000);
    float _1016 = fma(_619, _619, _1002);
    float _1018 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1010);
    float _1020 = fma(_433, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1012);
    float _1022 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1014);
    float _1024 = floor(_998);
    float _1026 = fma(_621, _621, _1016);
    float _1028 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1018);
    float _1030 = fma(_437, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1020);
    float _1032 = _1022 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1034 = _1028 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1036 = rsqrt(_1026);
    float _1038 = _129 * _1008;
    float _1040 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _1042 = _996 * 2.0;
    float _1044 = _829 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1046 = _1004 * 2.0;
    float _1048 = floor(_1042);
    float _1050 = _1004 + _996;
    bool _1052 = _1024 > 0.0;
    float _1054 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_205));
    bool _1056 = _1024 >= 0.0;
    bool _1058 = isnan(_1024);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.0);
    bool _1064 = _1060 || _1062;
    float _1066 = _1050 + (-1.0);
    float _1068 = floor(_1046);
    float _1070 = _623 + _996;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1074 = _1072 != 0;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1078 = _1076 != 0;
    int _1080 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1082 = _1080 != 0;
    float _1084 = _1036 * _619;
    float _1086 = _1036 * _617;
    float _1088 = _1070 + (-1.0);
    float _1090 = _1036 * _621;
    bool _1092 = !_1078;
    int _1094 = _1092 ? 0 : 1;
    float _1096 = exp2(_1038);
    bool _1098 = _1048 > 0.0;
    float _1100 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    float _1102 = fma(_1088, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1104 = !_1074;
    int _1106 = _1104 ? 0 : 1;
    bool _1108 = _1068 > 0.0;
    bool _1110 = _1068 >= 0.0;
    bool _1112 = isnan(_1068);
    bool _1114 = _1110 || _1112;
    bool _1116 = isnan(0.0);
    bool _1118 = _1114 || _1116;
    bool _1120 = _1048 >= 0.0;
    bool _1122 = isnan(_1048);
    bool _1124 = _1120 || _1122;
    bool _1126 = isnan(0.0);
    bool _1128 = _1124 || _1126;
    float _1130 = in.m_58.x;
    float _1132 = in.m_58.y;
    float _1134 = in.m_58.z;
    int _1136 = _1064 ? 0 : 1;
    float _1138 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1140 = 1.0 + _1138;
    int _1142 = _1128 ? 0 : 1;
    float _1144 = -_1096;
    float _1146 = _1144 + 1.0;
    int _1148 = ~_1136;
    int _1150 = _1148 + 1;
    int _1152 = _1150 + 1;
    float _1154 = 1.0 / _1140;
    int _1156 = abs(_1094);
    int _1158 = _1152;
    float _1160 = _1086;
    if (!_1052)
    {
        int _1162 = ~_1136;
        int _1164 = _1162 + 1;
        _1158 = _1164;
    }
    int _1166 = _1158;
    int _1168 = ~_1142;
    int _1170 = _1168 + 1;
    int _1172 = _1170 + 1;
    int _1174 = _1172;
    if (!_1098)
    {
        int _1176 = ~_1142;
        int _1178 = _1176 + 1;
        _1174 = _1178;
    }
    int _1180 = _1174;
    int _1182 = abs(_1106);
    float _1184 = float(_1156);
    float _1186 = float(_1166);
    bool _1188 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1190 = isnan(0.0);
    bool _1192 = _1188 || _1190;
    bool _1194 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1196 = _1192 || _1194;
    float _1198 = _1184 * _1186;
    float _1200 = _1196 ? _1146 : 0.0;
    float _1202 = float(_1182);
    float _1204 = _1198 * (-2.0);
    float _1206 = float(_1180);
    float _1208 = _1200 * _1154;
    float _1210 = _1004 + (-0.5);
    float _1212 = fma(_1204, _1132, _1132);
    int _1214 = _1118 ? 0 : 1;
    float _1216 = _1202 * _1206;
    float _1218 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1220 = _1032 + _1218;
    float _1222 = fma(_1210, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1212);
    bool _1224 = !_1082;
    int _1226 = _1224 ? 0 : 1;
    float _1228 = fma(_1100, _1204, _1100);
    int _1230 = ~_1214;
    int _1232 = _1230 + 1;
    int _1234 = _1232 + 1;
    float _1236 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1238 = _1040 + _1236;
    int _1240 = _1234;
    float _1242 = _1220;
    if (!_1108)
    {
        int _1244 = ~_1214;
        int _1246 = _1244 + 1;
        _1240 = _1246;
    }
    int _1248 = _1240;
    float _1250 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1252 = _1034 + _1250;
    int _1254 = abs(_1226);
    float _1256 = _1220 * _1220;
    bool _1258 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1260 = isnan(1.0);
    bool _1262 = _1258 || _1260;
    bool _1264 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1266 = _1262 || _1264;
    float _1268 = _1086 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _1270 = _623 + _1004;
    float _1272 = fma(_1252, _1252, _1256);
    bool _1274 = !_1266;
    float _1276 = _1274 ? _129 : _1208;
    float _1278 = fma(_1084, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1268);
    float _1280 = _1270 + (-1.0);
    float _1282 = fma(_1238, _1238, _1272);
    float _1284 = _1216 * (-2.0);
    float _1286 = fma(_1090, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1278);
    float _1288 = fma(_1276, _1228, _1222);
    float _1290 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1292 = _623 + (-0.5);
    float _1294 = rsqrt(_1282);
    float _1296 = fma(_1284, _1130, _1130);
    float _1298 = _1288 * 0.15915493667125701904296875;
    float _1300 = float(_1254);
    float _1302 = fma(_1290, _1284, _1290);
    float _1304 = float(_1248);
    float _1306 = fma(_1292, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1296);
    float _1308 = abs(_1286);
    bool _1310 = _1308 > 0.99989998340606689453125;
    float _1312 = fma(_1276, _1302, _1306);
    float _1314 = _1300 * _1304;
    float _1316 = _1298 * 6.283185482025146484375;
    float _1318 = sin(_1316);
    float _1320 = _1312 * 0.15915493667125701904296875;
    float _1322 = _1314 * (-2.0);
    float _1324 = _1220 * _1294;
    float _1326 = _1252 * _1294;
    float _1328 = _1238 * _1294;
    float _1330 = fma(_1102, _1322, _1102);
    float _1332 = -_1324;
    float _1334 = fma(_1332, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1220);
    float _1336 = fma(_1322, _1134, _1134);
    float _1338 = _996 + (-0.5);
    float _1340 = _1334;
    float _1342 = _1276;
    float _1344 = _1324;
    if (!_1310)
    {
        _1242 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1346 = _1242;
    float _1348 = _1334 * _1334;
    float _1350 = _1346;
    if (_1310)
    {
        _1340 = 0.001000000047497451305389404296875;
    }
    float _1352 = _1340;
    float _1354 = fma(_1338, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1336);
    float _1356 = -_1326;
    float _1358 = fma(_1356, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1252);
    float _1360 = _1320 * 6.283185482025146484375;
    float _1362 = sin(_1360);
    float _1364 = -_1328;
    float _1366 = fma(_1364, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1238);
    float _1368 = _1354;
    if (_1310)
    {
        float _1370 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1350 = _1370;
    }
    float _1372 = _1350;
    float _1374 = fma(_1276, _1330, _1354);
    if (!_1310)
    {
        _1368 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1376 = _1368;
    float _1378 = fma(_1358, _1358, _1348);
    float _1380 = _1376;
    if (!_1310)
    {
        _1342 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1382 = _1342;
    float _1384 = _1382;
    if (_1310)
    {
        float _1386 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1380 = _1386;
    }
    float _1388 = _1380;
    float _1390 = -_1372;
    float _1392 = _1090 * _1390;
    if (_1310)
    {
        float _1394 = fma(_1352, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1384 = _1394;
    }
    float _1396 = _1384;
    float _1398 = _1320 * 6.283185482025146484375;
    float _1400 = cos(_1398);
    float _1402 = _1374 * 0.15915493667125701904296875;
    float _1404 = -_1388;
    float _1406 = -_1392;
    float _1408 = fma(_1084, _1404, _1406);
    float _1410 = fma(_1366, _1366, _1378);
    float _1412 = _1408 * _1408;
    float _1414 = _1298 * 6.283185482025146484375;
    float _1416 = cos(_1414);
    float _1418 = -_1388;
    float _1420 = _1086 * _1418;
    float _1422 = -_1396;
    float _1424 = _1084 * _1422;
    float _1426 = -_1396;
    float _1428 = -_1420;
    float _1430 = fma(_1090, _1426, _1428);
    float _1432 = -_1372;
    float _1434 = -_1424;
    float _1436 = fma(_1086, _1432, _1434);
    float _1438 = _1362 * _1318;
    float _1440 = _1402 * 6.283185482025146484375;
    float _1442 = cos(_1440);
    float _1444 = fma(_1430, _1430, _1412);
    float _1446 = _1400 * _1318;
    float _1448 = fma(_1436, _1436, _1444);
    float _1450 = _1402 * 6.283185482025146484375;
    float _1452 = sin(_1450);
    float _1454 = _1362 * _1416;
    float _1456 = _1400 * _1416;
    float _1458 = sqrt(_1410);
    float _1460 = _1362 * _1442;
    float _1462 = fma(_129, 0.014999999664723873138427734375, _623);
    float _1464 = _1416 * _1442;
    float _1466 = _1400 * _1442;
    float _1468 = _1318 * _1442;
    float _1470 = rsqrt(_1448);
    float _1472 = fma(_1452, _1456, _1438);
    float _1474 = _1466 * _1084;
    float _1476 = _1294 * _1458;
    float _1478 = -_1446;
    float _1480 = fma(_1452, _1454, _1478);
    float _1482 = -_1454;
    float _1484 = fma(_1452, _1446, _1482);
    float _1486 = fma(_1452, _1438, _1456);
    float _1488 = floor(_1462);
    float _1490 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _209);
    float _1492 = _1044 * _1476;
    float _1494 = _831 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1496 = _1408 * _1470;
    float _1498 = _1436 * _1470;
    float _1500 = _1492 * _1490;
    float _1502 = _1472 * _1090;
    float _1504 = _1430 * _1470;
    float _1506 = _1084 * _1496;
    float _1508 = _1466 * _1090;
    float _1510 = _1484 * _1090;
    float _1512 = fma(_1464, _1498, _1502);
    float _1514 = -_1506;
    float _1516 = fma(_1086, _1504, _1514);
    float _1518 = -_1452;
    float _1520 = fma(_1518, _1498, _1508);
    float _1522 = fma(_1468, _1498, _1510);
    float _1524 = fma(_1488, -0.1500000059604644775390625, 1.0);
    float _1526 = _1494 * _1476;
    float _1528 = fma(_1460, _1516, _1520);
    float _1530 = _1086 * _1498;
    float _1532 = fma(_1480, _1516, _1512);
    float _1534 = precise::max(_1524, 0.20000000298023223876953125);
    float _1536 = _1472 * _1084;
    float _1538 = -_1452;
    float _1540 = fma(_1538, _1504, _1474);
    float _1542 = -_1530;
    float _1544 = fma(_1090, _1496, _1542);
    float _1546 = _1526 * _1054;
    float _1548 = fma(_1486, _1516, _1522);
    float _1550 = fma(_1464, _1504, _1536);
    float _1552 = _1484 * _1084;
    float _1554 = fma(_1460, _1544, _1540);
    float _1556 = _1546 * _1528;
    float _1558 = fma(_1480, _1544, _1550);
    float _1560 = fma(_1468, _1504, _1552);
    float _1562 = _1546 * _1554;
    float _1564 = _1476 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1566 = _1564 * 0.5;
    float _1568 = fma(_1500, _1532, _1556);
    float _1570 = fma(_1486, _1544, _1560);
    float _1572 = precise::min(_1534, 1.0);
    float _1574 = fma(_1500, _1558, _1562);
    float _1576 = fma(_1566, _1548, _1568);
    float _1578 = _1488 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1580 = _1466 * _1086;
    float _1582 = fma(_1566, _1570, _1574);
    float _1584 = fma(_1576, _1572, _1040);
    float _1586 = _1090 * _1504;
    float _1588 = -_1452;
    float _1590 = fma(_1588, _1496, _1580);
    float _1592 = fma(_1582, _1572, _1034);
    float _1594 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1584);
    float _1596 = _1472 * _1086;
    float _1598 = -_1586;
    float _1600 = fma(_1084, _1498, _1598);
    float _1602 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1592);
    float _1604 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1606 = _1594 + _1604;
    float _1608 = _1484 * _1086;
    float _1610 = fma(_1464, _1496, _1596);
    float _1612 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1614 = _1602 + _1612;
    float _1616 = _1606 * _1606;
    float _1618 = fma(_1460, _1600, _1590);
    float _1620 = fma(_1468, _1496, _1608);
    float _1622 = fma(_1480, _1600, _1610);
    float _1624 = fma(_1614, _1614, _1616);
    float _1626 = _1546 * _1618;
    float _1628 = fma(_1486, _1600, _1620);
    float _1630 = sqrt(_1624);
    float _1632 = fma(_1500, _1622, _1626);
    float _1634 = fma(_1566, _1628, _1632);
    float _1636 = fma(_1634, _1572, _1032);
    float _1638 = fma(_1578, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1636);
    float _1640 = -_1326;
    float _1642 = fma(_1640, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    bool _1644 = _1630 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1646 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1648 = _1646 != 0;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1652 = _1650 != 0;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1656 = _1654 != 0;
    int _1658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1660 = _1658 != 0;
    bool _1662 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1664 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1666 = _1662 || _1664;
    bool _1668 = isnan(0.5);
    bool _1670 = _1666 || _1668;
    bool _1672 = !_1652;
    int _1674 = _1672 ? 0 : 1;
    bool _1676 = !_1648;
    int _1678 = _1676 ? 0 : 1;
    bool _1680 = !_1656;
    int _1682 = _1680 ? 0 : 1;
    bool _1684 = !_1660;
    int _1686 = _1684 ? 0 : 1;
    float _1688 = _1602;
    float _1690 = _1594;
    if (!_1644)
    {
        _1160 = _1638;
    }
    float _1692 = _1160;
    bool _1694 = !_1644;
    float _1696 = _1692;
    if (!_1694)
    {
        float _1698 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1700 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1702 = _1630 + _1700;
        float _1704 = _1638 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1706 = rsqrt(_1624);
        float _1708 = _1702 * _1698;
        float _1710 = _1708 * 0.15915493667125701904296875;
        float _1712 = _1710 * 6.283185482025146484375;
        float _1714 = cos(_1712);
        float _1716 = _1710 * 6.283185482025146484375;
        float _1718 = sin(_1716);
        float _1720 = _1714 + (-1.0);
        float _1722 = _1720 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1724 = fma(_1718, _1704, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1726 = fma(_1638, _1714, _1722);
        float _1728 = _1706 * _1724;
        float _1730 = fma(_1614, _1728, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1732 = fma(_1606, _1728, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        _1688 = _1730;
        _1696 = _1726;
        _1690 = _1732;
    }
    float _1734 = _1688;
    float _1736 = _1696;
    float _1738 = _1690;
    float _1740 = -_1326;
    float _1742 = fma(_1740, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1734);
    float _1744 = -_1324;
    float _1746 = fma(_1744, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1736);
    float _1748 = -_1328;
    float _1750 = fma(_1748, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1738);
    float _1752 = -_1324;
    float _1754 = fma(_1752, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1032);
    float _1756 = -_1328;
    float _1758 = fma(_1756, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1040);
    float _1760 = _1742;
    float _1762 = _1746;
    float _1764 = _1736;
    if (_1670)
    {
        _1344 = _1742;
    }
    float _1766 = _1344;
    float _1768 = _1766;
    if (_1670)
    {
        _1760 = _1746;
    }
    float _1770 = _1760;
    float _1772 = _1770;
    if (_1670)
    {
        _1762 = _1750;
    }
    float _1774 = _1762;
    float _1776 = _1774;
    if (!_1670)
    {
        float _1778 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1780 = _1754 + _1778;
        float _1782 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1784 = _1642 + _1782;
        float _1786 = 1.0 / _1476;
        float _1788 = -_1040;
        float _1790 = _1788 + _1738;
        float _1792 = _1780 * _1780;
        float _1794 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1796 = _1758 + _1794;
        float _1798 = fma(_1784, _1784, _1792);
        float _1800 = fma(_1796, _1796, _1798);
        float _1802 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1804 = sqrt(_1800);
        float _1806 = precise::min(_1804, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1808 = _1806 * _1802;
        float _1810 = -_1034;
        float _1812 = _1810 + _1734;
        float _1814 = -_1032;
        float _1816 = _1814 + _1736;
        float _1818 = _1808 * _1786;
        float _1820 = fma(_1812, _1818, _1642);
        float _1822 = fma(_1816, _1818, _1754);
        float _1824 = fma(_1790, _1818, _1758);
        _1772 = _1822;
        _1768 = _1820;
        _1776 = _1824;
    }
    float _1826 = _1772;
    float _1828 = _1768;
    float _1830 = _1776;
    float _1832 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1834 = _1826 + _1832;
    float _1836 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1838 = _1828 + _1836;
    float _1840 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1842 = _1830 + _1840;
    float _1844 = _1834 * _1834;
    float _1846 = fma(_1838, _1838, _1844);
    float _1848 = fma(_1842, _1842, _1846);
    float _1850 = rsqrt(_1848);
    float _1852 = sqrt(_1848);
    float _1854 = _1850 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1856 = _1838 * _1854;
    float _1858 = _1842 * _1854;
    float _1860 = _1856 * _1856;
    float _1862 = _1858 * _1858;
    float _1864 = _1860 + _1862;
    float _1866 = sqrt(_1864);
    bool _1868 = _1866 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1870 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1872 = _1866 + _1870;
    float _1874 = _1842;
    float _1876 = _1864;
    float _1878 = _1872;
    float _1880 = _1854;
    if (_1868)
    {
        float _1882 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1874 = _1882;
    }
    float _1884 = _1874;
    if (_1868)
    {
        float _1886 = rsqrt(_1864);
        _1876 = _1886;
    }
    float _1888 = _1876;
    float _1890 = _1888;
    if (_1868)
    {
        float _1892 = _1872 * _1884;
        _1878 = _1892;
    }
    float _1894 = _1878;
    if (_1868)
    {
        float _1896 = _1894 * 0.15915493667125701904296875;
        _1764 = _1896;
    }
    float _1898 = _1764;
    float _1900 = _1884;
    float _1902 = _1898;
    if (_1868)
    {
        float _1904 = _1898 * 6.283185482025146484375;
        float _1906 = sin(_1904);
        _1900 = _1906;
    }
    float _1908 = _1900;
    float _1910 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1912 = precise::max(0.0, _1910);
    float _1914 = _1844;
    float _1916 = _1912;
    if (_1868)
    {
        float _1918 = _1898 * 6.283185482025146484375;
        float _1920 = cos(_1918);
        _1914 = _1920;
    }
    float _1922 = _1914;
    float _1924 = -_1854;
    float _1926 = -_1912;
    float _1928 = fma(_1834, _1924, _1926);
    float _1930 = _1928;
    if (_1868)
    {
        float _1932 = _1928 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1916 = _1932;
    }
    float _1934 = _1916;
    float _1936 = _1908;
    float _1938 = _1934;
    if (_1868)
    {
        float _1940 = fma(_1908, _1934, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1936 = _1940;
    }
    float _1942 = _1936;
    float _1944 = _1942;
    float _1946 = _1922;
    if (_1868)
    {
        float _1948 = _1922 + (-1.0);
        _1938 = _1948;
    }
    float _1950 = _1938;
    float _1952 = _1950;
    if (_1868)
    {
        float _1954 = _1888 * _1942;
        _1880 = _1954;
    }
    float _1956 = _1880;
    if (!_1868)
    {
        _1944 = _1856;
    }
    float _1958 = _1944;
    float _1960 = _1958;
    if (_1868)
    {
        float _1962 = _1950 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1902 = _1962;
    }
    float _1964 = _1902;
    if (_1868)
    {
        float _1966 = _1856 * _1956;
        _1960 = _1966;
    }
    float _1968 = _1960;
    if (!_1868)
    {
        _1952 = _1858;
    }
    float _1970 = _1952;
    float _1972 = _1970;
    if (_1868)
    {
        float _1974 = _1858 * _1956;
        _1972 = _1974;
    }
    float _1976 = _1972;
    if (!_1868)
    {
        _1890 = _1860;
    }
    float _1978 = _1890;
    float _1980 = _1978;
    if (_1868)
    {
        float _1982 = fma(_1928, _1922, _1964);
        _1930 = _1982;
    }
    float _1984 = _1930;
    if (_1868)
    {
        float _1986 = _1968 * _1968;
        _1980 = _1986;
    }
    float _1988 = _1980;
    if (!_1868)
    {
        _1946 = _1862;
    }
    float _1990 = _1946;
    float _1992 = _1990;
    if (_1868)
    {
        float _1994 = _1976 * _1976;
        _1992 = _1994;
    }
    float _1996 = _1992;
    float _1998 = fma(_1984, _1984, _1988);
    float _2000 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _2002 = _1998 + _1996;
    float _2004 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[2].x, _2000);
    float _2006 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2008 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2010 = fma(_1852, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2008);
    float _2012 = precise::clamp(_2010, 0.0, 1.0);
    float _2014 = rsqrt(_2002);
    float _2016 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2004);
    float _2018 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2006);
    float _2020 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _2022 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2024 = _2016 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2026 = _1826 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2028 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2018);
    float _2030 = -_2012;
    float _2032 = _2030 + 1.0;
    float _2034 = _2024 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2036 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2026);
    float _2038 = fma(_1828, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2022);
    float _2040 = _2028 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2042 = abs(_2032);
    float _2044 = log2(_2042);
    float _2046 = -_2034;
    float _2048 = fma(_2046, _2020, 1.0);
    float _2050 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2036);
    float _2052 = _2014 * _1968;
    float _2054 = fma(_1830, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2038);
    float _2056 = _2050 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2058 = _2052 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2060 = _2054 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2062 = _2014 * _1984;
    float _2064 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2066 = _2014 * _1976;
    float _2068 = log2(_2048);
    float _2070 = -_2058;
    float _2072 = fma(_2062, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2070);
    float _2074 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2064);
    float _2076 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2078 = _2044 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2080 = -_2066;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2072);
    float _2084 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2074);
    float _2086 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2076);
    float _2088 = fma(_2082, -0.5, 0.5);
    float _2090 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2084);
    float _2092 = exp2(_2078);
    float _2094 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2096 = fma(_2082, 0.5, 0.5);
    float _2098 = _2062 + 1.0;
    float _2100 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2094);
    float _2102 = fma(_2096, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2104 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2086);
    float _2106 = 1.0 / _2090;
    float _2108 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2100);
    float _2110 = fma(_2096, _2102, -0.212114393711090087890625);
    float _2112 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2104);
    float _2114 = _2068 * 0.693147182464599609375;
    float _2116 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2108);
    float _2118 = fma(_2096, _2110, 1.570728778839111328125);
    float _2120 = sqrt(_2088);
    float _2122 = -_2062;
    float _2124 = fma(_2092, _2098, _2122);
    float _2126 = _2114 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2128 = fma(_2124, 0.5, 0.5);
    float _2130 = _2116 * _2106;
    float _2132 = _2112 * _2106;
    float _2134 = fma(_2130, 0.5, 0.5);
    float _2136 = fma(_2132, -0.5, 0.5);
    float _2138 = _2120 * 0.636619746685028076171875;
    float _2140 = -_2118;
    float _2142 = fma(_2138, _2140, 1.0);
    float3 _6453 = float3(_2134, _2136, _2126);
    float _2144 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6453, float3(0.0), isnan(_6453)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6453, float3(0.0), isnan(_6453)), level(0.0)).x;
    float3 _6464 = float3(_2134, _2136, _2126);
    float4 _2147 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6464, float3(0.0), isnan(_6464)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6464, float3(0.0), isnan(_6464)), level(0.0)).xyzw;
    float _2149 = _2147.x;
    float _2151 = _2147.y;
    float _2153 = _2147.z;
    float _2155 = _2147.w;
    float2 _6481 = float2(_2142, _2128);
    float3 _2159 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6481, float2(0.0), isnan(_6481)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6481, float2(0.0), isnan(_6481)), level(0.0)).xyz;
    float _2161 = _2159.x;
    float _2163 = _2159.y;
    float _2165 = _2159.z;
    float _2167 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2169 = int(_2167);
    out.m_60.x = _954;
    out.m_60.y = _956;
    out.m_60.z = _960;
    out.m_60.w = _952;
    float _2171 = _1004 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    int _2173 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2175 = _2173 != 0;
    float _2177 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2179 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2181 = int(_2179);
    float _2183 = in.m_56.w;
    bool _2185 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2187 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2189 = _2185 || _2187;
    bool _2191 = isnan(0.5);
    bool _2193 = _2189 || _2191;
    float _2195 = _2044 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _2197 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    out.m_62.y = _1526;
    float _2199 = float(_2169);
    float _2201 = _623 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2203 = !_2175;
    float _2205 = _2203 ? _1004 : _623;
    float _2207 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2209 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2207;
    float _2211 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2213 = _2211 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2215 = -_2197;
    float _2217 = fma(_2201, 2.0, _2215);
    float _2219 = 1.0 / _2199;
    out.m_64.x = _1828;
    out.m_64.y = _1826;
    out.m_64.z = _1830;
    float _2221 = float(uint(_2181));
    float _2223 = -(*spvDescriptorSet0.vp_c9)._m0[133].x;
    float _2225 = (*spvDescriptorSet0.vp_c9)._m0[134].x + _2223;
    bool _2227 = _623 > 0.5;
    float _2229 = 1.0 / _2221;
    int _2231 = abs(_1674);
    float _2233 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    bool _2235 = _2183 > 0.5;
    int _2237 = ~_2181;
    int _2239 = _2237 + 1;
    float _2241 = _129 * _2219;
    int _2243 = ~_2181;
    int _2245 = _2243 + 1;
    float _2247 = exp2(_2195);
    bool _2249 = !_2175;
    float _2251 = _2249 ? 1.2345600128173828125 : 1.0;
    float _2253 = _2251 * _2205;
    int _2255 = as_type<int>(_2229) + (-2);
    float _2257 = trunc(_2241);
    int _2259 = int(_2257);
    float _2261 = float(_2181);
    float _2263 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2265 = _2263 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2267 = 1.0 / _2265;
    float _2269 = -_2247;
    float _2271 = _2269 + 1.0;
    float _2273 = _2271 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _2275 = float(uint(_2259));
    float _2277 = as_type<float>(_2255) * _2275;
    float _2279 = _2213 * _2267;
    float _2281 = trunc(_2277);
    float _2283 = precise::max(_2281, 0.0);
    uint _2285 = uint(_2283);
    float _2287 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2289 = _2287 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2291 = 1.0 / _2289;
    int _2293 = _2245 * int(_2285);
    int _2295 = _2293 + _2259;
    float _2297 = float(uint(_2295));
    float _2299 = _2209 * _2291;
    float _2301 = as_type<float>(_2255) * _2297;
    float _2303 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2305 = _2303 + (*spvDescriptorSet0.vp_c9)._m0[134].w;
    float _2307 = trunc(_2301);
    float _2309 = precise::max(_2307, 0.0);
    uint _2311 = uint(_2309);
    float _2313 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2315 = fma(_2171, -2.0, _2313);
    int _2317 = ~_2181;
    int _2319 = _2317 + 1;
    float _2321 = 1.0 / _2305;
    float _2323 = 1.0 / _992;
    int _2325 = int(_2285) + int(_2311);
    float _2327 = _129 * _2261;
    float _2329 = floor(_2253);
    float _2331 = _2225 * _2321;
    int _2333 = _2319 * _2325;
    int _2335 = _2333 + _2259;
    float _2337 = _2225;
    if (!_2175)
    {
        _2337 = _1004;
    }
    float _2339 = _2337;
    float _2341 = _2339;
    if (_2175)
    {
        _2341 = _623;
    }
    float _2343 = _2341;
    bool _2345 = uint(_2335) >= uint(_2181);
    float _2347 = _2327 * _2323;
    float _2349 = fma(_623, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2233);
    float _2351 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    float _2353 = float(_2259);
    bool _2355 = !_2345;
    int _2357 = _2355 ? 0 : (-1);
    float _2359 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2349);
    bool _2361 = _1004 > 0.5;
    float _2363 = -_2329;
    float _2365 = _2253 + _2363;
    bool _2367 = _2353 >= _2261;
    bool _2369 = isnan(_2353);
    bool _2371 = _2367 || _2369;
    bool _2373 = isnan(_2261);
    bool _2375 = _2371 || _2373;
    float _2377 = float(_2375);
    float _2379 = trunc(_2347);
    int _2381 = int(_2379);
    float _2383 = _2365 * _2261;
    int _2385 = ~_2325;
    int _2387 = _2385 + _2357;
    int _2389 = _2387 + 1;
    float _2391 = -_2359;
    float _2393 = _2391 + 1.0;
    int _2395 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2397 = _2395 != 0;
    float _2399 = trunc(_2377);
    int _2401 = int(_2399);
    float _2403 = -_209;
    int _2405 = _2227 ? as_type<int>(_2403) : as_type<int>(_209);
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    float _2409 = _2351 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    bool _2411 = _996 > 0.5;
    bool _2413 = !_2397;
    float _2415 = _2413 ? _209 : as_type<float>(_2405);
    float _2417 = fma(_1004, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2407);
    float _2419 = _2351;
    float _2421 = _2407;
    if (!_2175)
    {
        _2419 = _996;
    }
    float _2423 = _2419;
    float _2425 = trunc(_2383);
    int _2427 = int(_2425);
    float _2429 = _2423;
    if (!_2175)
    {
        _2421 = _996;
    }
    float _2431 = _2421;
    float _2433 = -_129;
    float _2435 = fma(_2433, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2217);
    float _2437 = _2415 + 0.5;
    float _2439 = _2431;
    if (_2175)
    {
        _2429 = _1004;
    }
    float _2441 = _2429;
    if (_2175)
    {
        _2439 = _1004;
    }
    float _2443 = _2439;
    float _2445 = fma(_2409, _2437, _2435);
    float _2447 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2449 = _994 + _2447;
    int _2451 = _2181 * _2389;
    int _2453 = _2451 + _2259;
    bool _2455 = _2181 == 0;
    float _2457 = _2441 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2459 = fma(_2299, _2449, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    int _2461 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2463 = _2461 != 0;
    float _2465 = -_2393;
    float _2467 = fma(_2415, _2465, _2445);
    int _2469 = ~_2401;
    int _2471 = _2469 + 1;
    int _2473 = _2471 + 1;
    bool _2475 = !_2455;
    int _2477 = _2475 ? _2453 : (-1);
    bool _2479 = !_2463;
    int _2481 = _2479 ? 0 : 1;
    int _2483 = _2181 + (-1);
    int _2485 = _2477 * _2473;
    int _2487 = abs(_1678);
    int _2489 = abs(_2481);
    int _2491 = _2401 * _2483;
    int _2493 = _2491 + _2485;
    float _2495 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2497 = _994 + _2495;
    int _2499 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2501 = _2499 != 0;
    int _2503 = _2493 * _2231;
    float _2505 = fma(_2279, _2497, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    int _2507 = abs(_1682);
    int _2509 = _2427 * _2489;
    int _2511 = _2509 + _2259;
    bool _2513 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2515 = isnan(_994);
    bool _2517 = _2513 || _2515;
    bool _2519 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2521 = _2517 || _2519;
    float _2523 = float(_2521);
    int _2525 = _2381 * _2487;
    int _2527 = _2525 + _2503;
    int _2529 = abs(_1686);
    float _2531 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    bool _2533 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[134].w;
    bool _2535 = isnan(_994);
    bool _2537 = _2533 || _2535;
    bool _2539 = isnan((*spvDescriptorSet0.vp_c9)._m0[134].w);
    bool _2541 = _2537 || _2539;
    float _2543 = float(_2541);
    float _2545 = -(*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2547 = _994 + _2545;
    int _2549 = _2511 * _2507;
    int _2551 = _2549 + _2527;
    bool _2553 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2555 = isnan(_994);
    bool _2557 = _2553 || _2555;
    bool _2559 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2561 = _2557 || _2559;
    float _2563 = float(_2561);
    float _2565 = -_2543;
    float _2567 = _2565 + 1.0;
    bool _2569 = _994 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2571 = isnan(_994);
    bool _2573 = _2569 || _2571;
    bool _2575 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2577 = _2573 || _2575;
    float _2579 = float(_2577);
    float _2581 = fma(_2331, _2547, (*spvDescriptorSet0.vp_c9)._m0[133].x);
    int _2583 = _2427 * _2529;
    int _2585 = _2583 + _2551;
    float _2587 = _2523 * _2567;
    float _2589 = -_2523;
    float _2591 = _2589 + 1.0;
    float _2593 = -as_type<float>(_205);
    int _2595 = _2361 ? as_type<int>(_2593) : _205;
    float _2597 = -_2579;
    float _2599 = _2597 + 1.0;
    float _2601 = _2579 * _2591;
    bool _2603 = !_2501;
    float _2605 = _2603 ? as_type<float>(_205) : as_type<float>(_2595);
    float _2607 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2315);
    float _2609 = float(uint(_2585));
    float _2611 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2613 = _2531 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2615 = _2605 + (-0.5);
    float _2617 = _2563 * _2599;
    float _2619 = fma(_2443, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2611);
    float _2621 = as_type<float>(_2255) * _2609;
    float _2623 = -_2613;
    float _2625 = -_2607;
    float _2627 = fma(_2623, _2615, _2625);
    float _2629 = float(uint(_2511));
    float _2631 = _2459 * _2617;
    float _2633 = trunc(_2621);
    float _2635 = precise::max(_2633, 0.0);
    uint _2637 = uint(_2635);
    float _2639 = -_2563;
    float _2641 = _2639 + 1.0;
    float _2643 = as_type<float>(_2255) * _2629;
    float _2645 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2647 = fma(_2641, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2631);
    float _2649 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2651 = fma(_2343, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2645);
    float _2653 = trunc(_2643);
    float _2655 = precise::max(_2653, 0.0);
    uint _2657 = uint(_2655);
    float _2659 = _2343 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2661 = fma(_2505, _2601, _2647);
    int _2663 = _2239 * int(_2637);
    int _2665 = _2663 + _2585;
    float _2667 = -_2649;
    float _2669 = fma(_2659, 2.0, _2667);
    float _2671 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2651);
    float _2673 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    int _2675 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2677 = _2675 != 0;
    float _2679 = fma(_2581, _2587, _2661);
    float _2681 = float(uint(_2665));
    float _2683 = fma(_2457, -2.0, _2673);
    float _2685 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2417);
    float _2687 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2619);
    int _2689 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2691 = _2689 != 0;
    float _2693 = as_type<float>(_2255) * _2681;
    int _2695 = _2239 * int(_2657);
    int _2697 = _2695 + _2511;
    float _2699 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2177);
    float _2701 = _1754 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2703 = -_129;
    float _2705 = fma(_2703, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2669);
    float _2707 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2683);
    float _2709 = trunc(_2693);
    float _2711 = precise::max(_2709, 0.0);
    uint _2713 = uint(_2711);
    float _2715 = float(uint(_2697));
    float _2717 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2699);
    int _2719 = ~_2181;
    int _2721 = _2719 + 1;
    float _2723 = fma(_1642, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2701);
    float _2725 = -as_type<float>(_205);
    int _2727 = _2235 ? as_type<int>(_2725) : _205;
    float _2729 = as_type<float>(_2255) * _2715;
    float _2731 = _2717 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2733 = -_209;
    int _2735 = _2411 ? as_type<int>(_2733) : as_type<int>(_209);
    float _2737 = -_2685;
    float _2739 = _2737 + 1.0;
    float _2741 = -_2687;
    float _2743 = _2741 + 1.0;
    float _2745 = 1.0 / _2731;
    bool _2747 = !_2691;
    float _2749 = _2747 ? _209 : as_type<float>(_2735);
    float _2751 = fma(_2605, _2739, _2627);
    float _2753 = fma(_2543, (*spvDescriptorSet0.vp_c9)._m0[134].x, _2679);
    float _2755 = _2679;
    float _2757 = _2605;
    float _2759 = _2627;
    if (!_2193)
    {
        _2755 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2761 = _2755;
    float _2763 = -_2671;
    float _2765 = _2763 + 1.0;
    int _2767 = int(_2637) + int(_2713);
    float _2769 = fma(_1758, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2723);
    bool _2771 = !_2677;
    float _2773 = _2771 ? as_type<float>(_205) : as_type<float>(_2727);
    float _2775 = trunc(_2729);
    float _2777 = precise::max(_2775, 0.0);
    uint _2779 = uint(_2777);
    float _2781 = _2749 + 0.5;
    int _2783 = _2721 * _2767;
    int _2785 = _2783 + _2585;
    float _2787 = _2769 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2789 = _2773 + (-0.5);
    if (!_2193)
    {
        float _2791 = -_2761;
        float _2793 = _2791 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2757 = _2793;
    }
    float _2795 = _2757;
    float _2797 = fma(_2781, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2705);
    bool _2799 = uint(_2785) >= uint(_2181);
    float _2801 = _2787 + _2731;
    float _2803 = -_2789;
    float _2805 = -_2707;
    float _2807 = fma(_2803, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2805);
    float _2809 = -_2765;
    float _2811 = fma(_2749, _2809, _2797);
    bool _2813 = !_2799;
    float _2815 = _2813 ? 0.0 : as_type<float>(0xffffffffu /* nan */);
    float _2817 = _2801 * _2745;
    float _2819 = _2817 * 0.5;
    int _2821 = ~_2181;
    int _2823 = _2821 + 1;
    float _2825 = fma(_2773, _2743, _2807);
    int _2827 = ~_2767;
    int _2829 = _2827 + as_type<int>(_2815);
    int _2831 = _2829 + 1;
    float _2833 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2835 = fma(_2819, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2833);
    int _2837 = int(_2657) + int(_2779);
    float _2839 = _2745;
    float _2841 = _2815;
    float _2843 = _2825;
    float _2845 = _2797;
    float _2847 = _2811;
    if (!_2193)
    {
        float _2849 = 1.0 / _2795;
        _2759 = _2849;
    }
    float _2851 = _2759;
    if (!_2193)
    {
        _2839 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2853 = _2839;
    int _2855 = _2181 * _2831;
    int _2857 = _2855 + _2585;
    out.m_66.x = _2467;
    out.m_66.y = _2751;
    out.m_66.z = _2811;
    out.m_66.w = _2825;
    int _2859 = _2823 * _2837;
    int _2861 = _2859 + _2511;
    int _2863 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2865 = _2863 != 0;
    float _2867 = _2853;
    if (!_2193)
    {
        float _2869 = -_2853;
        float _2871 = _2869 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2841 = _2871;
    }
    float _2873 = _2841;
    bool _2875 = !_2455;
    int _2877 = _2875 ? _2857 : (-1);
    float _2879 = 1.0 / _2835;
    bool _2881 = uint(_2861) >= uint(_2181);
    float _2883 = _2273 * _2144;
    int _2885 = _2877 >> 31;
    int _2887 = _2877 & 3;
    bool _2889 = _2887 != 0;
    int _2891 = _2885 & 3;
    float _2893 = as_type<float>(_2585);
    if (!_2193)
    {
        float _2895 = 1.0 / _2873;
        _2893 = _2895;
    }
    float _2897 = _2893;
    if (_2193)
    {
        _2843 = 1.0;
    }
    float _2899 = _2843;
    int _2901 = _2877 + _2891;
    float _2903 = _2753 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2905 = !_2881;
    int _2907 = _2905 ? 0 : (-1);
    int _2909 = _2901 >> 2;
    float _2911 = as_type<float>(_2909);
    float _2913 = _2899;
    if (!_2193)
    {
        float _2915 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2917 = -_2761;
        float _2919 = fma(_2879, _2915, _2917);
        _2845 = _2919;
    }
    float _2921 = _2845;
    if (!_2193)
    {
        float _2923 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2925 = -_2853;
        float _2927 = fma(_2879, _2923, _2925);
        _2867 = _2927;
    }
    float _2929 = _2867;
    int _2931 = ~_2837;
    int _2933 = _2931 + _2907;
    int _2935 = _2933 + 1;
    float _2937 = _2165 * _2883;
    int _2939 = _2909 << 4;
    int _2941 = _2939 + 512;
    if (!_2193)
    {
        float _2943 = _2921 * _2851;
        float _2945 = precise::clamp(_2943, 0.0, 1.0);
        _2847 = _2945;
    }
    float _2947 = _2847;
    float _2949 = as_type<float>(_205) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    int _2951 = _2877 & 3;
    bool _2953 = _2951 != 0;
    uint _2955 = uint(int(uint(_2941) >> uint(2)));
    uint _2957 = uint(int(uint(int(_2955)) >> uint(2)));
    int _2959 = int(_2955) & 3;
    float _2961 = (*spvDescriptorSet0.vp_c9)._m0[int(_2957)][_2959];
    int _2963 = int(_2955) + 1;
    uint _2965 = uint(int(uint(_2963) >> uint(2)));
    int _2967 = _2963 & 3;
    float _2969 = (*spvDescriptorSet0.vp_c9)._m0[int(_2965)][_2967];
    if (_2193)
    {
        _2911 = 1.0;
    }
    float _2971 = _2911;
    float _2973 = _2971;
    if (!_2193)
    {
        float _2975 = _2929 * _2897;
        float _2977 = precise::clamp(_2975, 0.0, 1.0);
        _2973 = _2977;
    }
    float _2979 = _2973;
    if (!_2193)
    {
        float _2981 = -_2947;
        float _2983 = _2981 + 1.0;
        _2913 = _2983;
    }
    float _2985 = _2913;
    bool _2987 = uint(_2951) > 1u;
    int _2989 = _2181 * _2935;
    int _2991 = _2989 + _2511;
    float _2993 = _209 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2995 = _1554 * _2949;
    int _2997 = _2941 + 8;
    uint _2999 = uint(int(uint(_2997) >> uint(2)));
    uint _3001 = uint(int(uint(int(_2999)) >> uint(2)));
    int _3003 = int(_2999) & 3;
    float _3005 = (*spvDescriptorSet0.vp_c9)._m0[int(_3001)][_3003];
    int _3007 = int(_2999) + 1;
    uint _3009 = uint(int(uint(_3007) >> uint(2)));
    int _3011 = _3007 & 3;
    float _3013 = (*spvDescriptorSet0.vp_c9)._m0[int(_3009)][_3011];
    bool _3015 = _2951 != 3;
    float _3017 = _1528 * _2949;
    float _3019 = fma(_1558, _2993, _2995);
    int _3021 = _2889 ? 0 : 1;
    float _3023 = _2979 * _2985;
    bool _3025 = uint(_2951) >= 2u;
    float _3027 = _1618 * _2949;
    float _3029 = fma(_1532, _2993, _3017);
    float _3031 = _3023 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    int _3033 = _3025 ? 0 : 1;
    float _3035 = fma(_1622, _2993, _3027);
    int _3037 = ~_3021;
    int _3039 = _3037 + 1;
    int _3041 = _3039 + 1;
    float _3043 = _711 * _3031;
    int _3045 = _3041;
    if (!_2987)
    {
        int _3047 = ~_3021;
        int _3049 = _3047 + 1;
        _3045 = _3049;
    }
    int _3051 = _3045;
    float _3053 = _2040 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3055 = _2951 != 3;
    float _3057 = _1628 + _3035;
    int _3059 = ~_3033;
    int _3061 = _3059 + 1;
    int _3063 = _3061 + 1;
    float _3065 = fma(_2060, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3053);
    int _3067 = _3063;
    if (_3015)
    {
        int _3069 = ~_3033;
        int _3071 = _3069 + 1;
        _3067 = _3071;
    }
    int _3073 = _3067;
    float _3075 = _1570 + _3019;
    bool _3077 = !_2953;
    int _3079 = _3077 ? 0 : 1;
    float _3081 = fma(_2024, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3065);
    int _3083 = abs(_3051);
    float _3085 = _1548 + _3029;
    int _3087 = abs(_3073);
    float _3089 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3081);
    int _3091 = abs(_3079);
    out.m_68.w = _2903;
    int _3093 = ~_3083;
    int _3095 = _3093 + 1;
    int _3097 = _3095 + 1;
    bool _3099 = !_3055;
    int _3101 = _3099 ? 0 : (-1);
    out.m_70.x = _3075;
    out.m_70.y = _3057;
    out.m_70.z = _3085;
    int _3103 = ~_3091;
    int _3105 = _3103 + 1;
    int _3107 = _3105 + 1;
    int _3109 = abs(_3101);
    int _3111 = _3097 * as_type<int>(_2969);
    bool _3113 = !_2865;
    int _3115 = _3113 ? 0 : 1;
    int _3117 = ~_3087;
    int _3119 = _3117 + 1;
    int _3121 = _3119 + 1;
    int _3123 = _3107 * as_type<int>(_2961);
    int _3125 = _3123 + _3111;
    int _3127 = abs(_3115);
    int _3129 = ~_3109;
    int _3131 = _3129 + 1;
    int _3133 = _3131 + 1;
    int _3135 = _3121 * as_type<int>(_3005);
    int _3137 = _3135 + _3125;
    int _3139 = ~_3127;
    int _3141 = _3139 + 1;
    int _3143 = _3141 + 1;
    float _3145 = _3043 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    bool _3147 = !_2455;
    int _3149 = _3147 ? _2991 : (-1);
    int _3151 = _3133 * as_type<int>(_3013);
    int _3153 = _3151 + _3137;
    bool _3155 = _2979 > 0.0;
    bool _3157 = isnan(_2979);
    bool _3159 = _3155 || _3157;
    bool _3161 = isnan(0.0);
    bool _3163 = _3159 || _3161;
    float _3165 = _2155 * _2883;
    out.m_45.x = _3145;
    int _3167 = _3153 * _3143;
    float _3169 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _3171 = _3089 + _3169;
    bool _3173 = _2985 <= 0.0;
    bool _3175 = !_3163;
    bool _3177 = _3173 || _3175;
    float _3179 = fma(_2161, _3165, _2149);
    int _3181 = _3149 * _3127;
    int _3183 = _3181 + _3167;
    float _3185 = _2090 + _3171;
    float _3187 = fma(_2163, _3165, _2151);
    float _3189 = -_2273;
    float _3191 = _3189 + 1.0;
    float _3193 = _3185 * 0.5;
    float _3195 = float(_3183);
    float _3197 = _2155 * _3191;
    float _3199 = fma(_2155, _2937, _2153);
    out.m_72.z = _3193;
    out.m_72.w = _2090;
    out.gl_Position.x = _2116;
    out.gl_Position.y = _2112;
    out.gl_Position.z = _3171;
    out.gl_Position.w = _2090;
    out.m_74.y = _3195;
    out.m_76.x = _3179;
    out.m_76.y = _3187;
    out.m_76.z = _3199;
    out.m_76.w = _3197;
    if (!_3177)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3201 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3201;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

