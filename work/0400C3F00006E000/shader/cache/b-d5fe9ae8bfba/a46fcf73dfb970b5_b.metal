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
    float4 m_66 [[user(locn1)]];
    float4 m_64 [[user(locn2)]];
    float4 m_72 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_68 [[user(locn5)]];
    float4 m_54 [[user(locn6)]];
    float4 m_74 [[user(locn7)]];
    float4 m_70 [[user(locn8)]];
    float4 m_62 [[user(locn9)]];
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _986 = false;
    bool _853 = false;
    bool _733 = false;
    bool _497 = false;
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
        float _3212 = as_type<float>(_111);
        out.gl_Position.z = _3212;
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
        _105 = _135;
    }
    float _137 = _105;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _113 = as_type<int>(_149);
    }
    int _151 = _113;
    float _153 = as_type<float>(_151);
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3283 = as_type<float>(_151);
        out.gl_Position.z = _3283;
    }
    if (_143)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = _157;
    if (!_173)
    {
        float _177 = _157 * _157;
        float _179 = _177 * 0.5;
        _153 = _179;
    }
    float _181 = _153;
    float _183 = 0.0;
    float _185 = _181;
    if (!_173)
    {
        float _187 = _129 * _129;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    if (!_173)
    {
        float _193 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _193;
    }
    float _195 = _185;
    int _197 = as_type<int>(_155) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_155) & 2;
    bool _203 = _201 != 0;
    bool _205 = !_203;
    int _207 = _205 ? (-1090519040) : 1056964608;
    bool _209 = !_199;
    float _211 = _209 ? (-0.5) : 0.5;
    bool _213 = !_173;
    float _215 = _195;
    float _217 = _211;
    if (!_213)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _157 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _157);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _131 = _237;
        _215 = _247;
        _133 = _235;
    }
    float _249 = _131;
    float _251 = _215;
    float _253 = _133;
    bool _255 = !_173;
    float _257 = _249;
    float _259 = _253;
    if (!_255)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _157 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _257 = _273;
        _259 = _267;
        _175 = _279;
    }
    float _281 = _257;
    float _283 = _259;
    float _285 = _175;
    float _287 = _283;
    float _289 = _281;
    if (!_173)
    {
        _287 = _129;
    }
    float _291 = _287;
    float _293 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _291;
    if (!_173)
    {
        float _297 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _289 = _297;
    }
    float _299 = _289;
    bool _301 = !_173;
    float _303 = _299;
    if (!_301)
    {
        float _305 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = log2(_305);
        float _309 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = _129 * _307;
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = 1.0 / _315;
        float _319 = _309 * 0.693147182464599609375;
        float _321 = exp2(_311);
        float _323 = 1.0 / _319;
        float _325 = _321 + (-1.0);
        float _327 = -_325;
        float _329 = fma(_327, _323, _129);
        float _331 = _329 * _317;
        float _333 = _331 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _303 = _333;
    }
    float _335 = _303;
    bool _337 = !_173;
    if (!_337)
    {
        float _339 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _341 = log2(_339);
        float _343 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _345 = _343 + 1.0;
        float _347 = 1.0 / _345;
        float _349 = _129 * _341;
        float _351 = exp2(_349);
        float _353 = -_351;
        float _355 = _353 + 1.0;
        float _357 = _355 * _347;
        _295 = _357;
    }
    float _359 = _295;
    float _361 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _363 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _365 = fma(_285, _161, _293);
    float _367 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = fma(_359, _161, _361);
    float _371 = fma(_285, _159, _363);
    float _373 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _375 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _377 = fma(_359, _159, _367);
    float _379 = -_369;
    float _381 = _365 + _379;
    float _383 = fma(_285, _163, _373);
    float _385 = fma(_359, _163, _375);
    float _387 = -_377;
    float _389 = _371 + _387;
    float _391 = _381 * _381;
    float _393 = in.m_52.w;
    float _395 = -_385;
    float _397 = _383 + _395;
    float _399 = _381 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _401 = fma(_389, _389, _391);
    out.m_54.y = as_type<float>(_207);
    float _403 = _381 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _405 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _407 = fma(_397, _397, _401);
    float _409 = _381 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _411 = in.m_42.x;
    float _413 = in.m_42.y;
    float _415 = in.m_42.z;
    float _417 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _403);
    float _419 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].z, _405);
    float _421 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _409);
    float _423 = sqrt(_407);
    float _425 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].z, _421);
    bool _427 = _423 >= 9.9999999747524270787835121154785e-07;
    bool _429 = isnan(_423);
    bool _431 = _427 || _429;
    bool _433 = isnan(9.9999999747524270787835121154785e-07);
    bool _435 = _431 || _433;
    float _437 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].z, _417);
    float _439 = fma(_371, _393, _411);
    float _441 = fma(_365, _393, _413);
    float _443 = fma(_383, _393, _415);
    float _445 = _365;
    float _447 = _393;
    float _449 = _425;
    if (_435)
    {
        _445 = _419;
    }
    float _451 = _445;
    float _453 = _451;
    if (_435)
    {
        _447 = _437;
    }
    float _455 = _447;
    float _457 = _455;
    if (!_435)
    {
        bool _459 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _461 = !_459;
        if (!_461)
        {
            float _463 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _465 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _467 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _467);
            float _475 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
            float _477 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _471);
            float _479 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _473);
            float _481 = _475 * _475;
            float _483 = fma(_477, _477, _481);
            float _485 = fma(_479, _479, _483);
            float _487 = rsqrt(_485);
            float _489 = _487 * 9.9999999747524270787835121154785e-07;
            float _491 = _477 * _489;
            float _493 = _475 * _489;
            float _495 = _479 * _489;
            _457 = _493;
            _453 = _491;
            _449 = _495;
            _497 = true;
        }
        else
        {
            float _499 = _161 * _161;
            float _501 = fma(_159, _159, _499);
            float _503 = fma(_163, _163, _501);
            float _505 = sqrt(_503);
            bool _507 = _505 >= 9.9999999747524270787835121154785e-07;
            bool _509 = isnan(_505);
            bool _511 = _507 || _509;
            bool _513 = isnan(9.9999999747524270787835121154785e-07);
            bool _515 = _511 || _513;
            if (!_515)
            {
                float _517 = _413 * _413;
                float _519 = fma(_411, _411, _517);
                float _521 = fma(_415, _415, _519);
                float _523 = sqrt(_521);
                bool _525 = _523 >= 9.9999999747524270787835121154785e-07;
                bool _527 = isnan(_523);
                bool _529 = _525 || _527;
                bool _531 = isnan(9.9999999747524270787835121154785e-07);
                bool _533 = _529 || _531;
                if (!_533)
                {
                    float _535 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _537 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _535);
                    float _539 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _537);
                    float _541 = rsqrt(_539);
                    float _543 = _541 * 9.9999999747524270787835121154785e-07;
                    float _545 = _543 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _547 = _543 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _549 = _543 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _457 = _547;
                    _453 = _545;
                    _449 = _549;
                    _497 = true;
                }
                else
                {
                    float _551 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _553 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _555 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _557 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].x, _551);
                    float _559 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].x, _553);
                    float _561 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].x, _555);
                    float _563 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _557);
                    float _565 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _559);
                    float _567 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _561);
                    float _569 = _563 * _563;
                    float _571 = fma(_565, _565, _569);
                    float _573 = fma(_567, _567, _571);
                    float _575 = rsqrt(_573);
                    float _577 = _575 * 9.9999999747524270787835121154785e-07;
                    float _579 = _565 * _577;
                    float _581 = _563 * _577;
                    float _583 = _567 * _577;
                    _457 = _581;
                    _453 = _579;
                    _449 = _583;
                    _497 = true;
                }
            }
            else
            {
                float _585 = _161 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _587 = _161 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _589 = _161 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _591 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].x, _585);
                float _593 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].x, _587);
                float _595 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].x, _589);
                float _597 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].z, _591);
                float _599 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].z, _593);
                float _601 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].z, _595);
                float _603 = _597 * _597;
                float _605 = fma(_599, _599, _603);
                float _607 = fma(_601, _601, _605);
                float _609 = rsqrt(_607);
                float _611 = _609 * 9.9999999747524270787835121154785e-07;
                float _613 = _599 * _611;
                float _615 = _597 * _611;
                float _617 = _601 * _611;
                _457 = _615;
                _453 = _613;
                _449 = _617;
            }
        }
    }
    _497 = false;
    float _619 = _457;
    float _621 = _453;
    float _623 = _449;
    float _625 = in.m_56.x;
    float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _629 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _637 = _635 != 0;
    float _639 = _629 * _627;
    float _641 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[20].x, _639);
    float _643 = _641 * 6.283185482025146484375;
    float _645 = floor(_641);
    int _647 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _649 = _647 != 0;
    float _651 = _643 * 0.15915493667125701904296875;
    bool _653 = !_633;
    int _655 = _653 ? 0 : 1;
    bool _657 = !_637;
    int _659 = _657 ? 0 : 1;
    int _661 = abs(_655);
    float _663 = _651 * 6.283185482025146484375;
    float _665 = cos(_663);
    bool _667 = !_649;
    int _669 = _667 ? 0 : 1;
    int _671 = abs(_659);
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _675 = -_645;
    float _677 = _641 + _675;
    int _679 = abs(_669);
    float _681 = float(_661);
    float _683 = -_677;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _687 = _677 < 0.5;
    float _689 = float(_687);
    float _691 = float(_671);
    float _693 = abs(_685);
    float _695 = _681 * _693;
    float _697 = fma(_665, 0.5, 0.5);
    float _699 = float(_679);
    float _701 = -_689;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _705 = -_697;
    float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _709 = fma(_699, _707, _695);
    float _711 = abs(_703);
    float _713 = fma(_691, _711, _709);
    bool _715 = !_673;
    float _731;
    if (!_715)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _719 = _625 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_95);
        float _737 = 1.0 / _735;
        float _739 = _129 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _745 = _741 + _743;
    float _747 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _749;
    bool _753 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _755 = isnan(_741);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = 1.0 / _751;
    bool _767 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _769 = isnan(_741);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _779;
    float _783 = _747 * _625;
    float _785 = -_763;
    float _787 = _785 + 1.0;
    bool _789 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _791 = _777 * _787;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _793;
    float _797 = trunc(_783);
    int _799 = int(_797);
    float _801 = -_777;
    float _803 = _801 + 1.0;
    float _805 = _745 * _765;
    float _807 = in.m_52.x;
    float _809 = in.m_52.y;
    float _811 = fma(_781, _805, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _813 = fma(_795, _805, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _815 = _811 * _791;
    float _817 = _813 * _791;
    int _819 = _799 << 4;
    int _821 = _819 + 1712;
    float _823 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].x, _815);
    float _825 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].y, _817);
    float _827 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[144].x, _823);
    float _829 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[144].y, _825);
    float _831 = _827 * _807;
    float _833 = _829 * _809;
    bool _835 = !_789;
    float _851;
    if (!_835)
    {
        float _837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _839 = _625 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _843 = _841 * _837;
        float _845 = floor(_843);
        float _847 = -_845;
        float _849 = _843 + _847;
        _851 = _849;
        _853 = true;
    }
    else
    {
        float _855 = float(_95);
        float _857 = 1.0 / _855;
        float _859 = _129 * _857;
        _851 = _859;
    }
    _853 = false;
    float _861 = _851;
    uint _864 = uint(int(uint(_821) >> uint(2)));
    uint _866 = uint(int(uint(int(_864)) >> uint(2)));
    int _868 = int(_864) & 3;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[int(_866)][_868];
    int _872 = int(_864) + 1;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    int _876 = _872 & 3;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[int(_874)][_876];
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _882 = _861 + _880;
    bool _884 = _861 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _886 = isnan(_861);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _900 = _861 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _902 = isnan(_861);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    int _912 = _821 + 8;
    uint _914 = uint(int(uint(_912) >> uint(2)));
    uint _916 = uint(int(uint(int(_914)) >> uint(2)));
    int _918 = int(_914) & 3;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[int(_916)][_918];
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _922;
    float _926 = -_894;
    float _928 = _926 + 1.0;
    bool _930 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _932 = 1.0 / _898;
    float _934 = _910 * _928;
    float _936 = -_910;
    float _938 = _936 + 1.0;
    float _940 = _924 * _932;
    float _942 = fma(_940, _882, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _944 = _942 * _934;
    float _946 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[115].x, _944);
    float _948 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[116].x, _946);
    float _950 = _870 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _952 = _878 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _954 = _948 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _920 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _962 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _964 = !_930;
    float _982;
    float _984;
    if (!_964)
    {
        float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _968 = _625 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _970 = float(_95);
        float _972 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _974 = _972 * _966;
        float _976 = floor(_974);
        float _978 = -_976;
        float _980 = _974 + _978;
        _982 = _970;
        _984 = _980;
        _986 = true;
    }
    else
    {
        float _988 = float(_95);
        float _990 = 1.0 / _988;
        float _992 = _129 * _990;
        _982 = _988;
        _984 = _992;
    }
    _986 = false;
    float _994 = _982;
    float _996 = _984;
    float _998 = in.m_56.z;
    float _1000 = _625 * 2.0;
    float _1002 = _441 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1004 = _441 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1006 = in.m_56.y;
    float _1008 = _441 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1010 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1012 = log2(_1010);
    float _1014 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1004);
    float _1016 = _619 * _619;
    float _1018 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1008);
    float _1020 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1002);
    float _1022 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1014);
    float _1024 = fma(_621, _621, _1016);
    float _1026 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1018);
    float _1028 = floor(_1000);
    float _1030 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1020);
    float _1032 = fma(_623, _623, _1024);
    float _1034 = _1022 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1036 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _211);
    float _1038 = rsqrt(_1032);
    float _1040 = _833 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1042 = _998 * 2.0;
    float _1044 = _625 + _998;
    float _1046 = _1006 * 2.0;
    float _1048 = _1006 + _998;
    float _1050 = floor(_1042);
    bool _1052 = _1028 > 0.0;
    float _1054 = _1044 + (-1.0);
    bool _1056 = _1028 >= 0.0;
    bool _1058 = isnan(_1028);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.0);
    bool _1064 = _1060 || _1062;
    float _1066 = _1048 + (-1.0);
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1070 = _1068 != 0;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1074 = _1072 != 0;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1078 = _1076 != 0;
    float _1080 = floor(_1046);
    float _1082 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1084 = _1064 ? 0 : 1;
    float _1086 = _1038 * _621;
    bool _1088 = !_1070;
    int _1090 = _1088 ? 0 : 1;
    float _1092 = _1038 * _619;
    bool _1094 = !_1074;
    int _1096 = _1094 ? 0 : 1;
    float _1098 = _1038 * _623;
    bool _1100 = _1050 > 0.0;
    float _1102 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1104 = _1050 >= 0.0;
    bool _1106 = isnan(_1050);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(0.0);
    bool _1112 = _1108 || _1110;
    float _1114 = _129 * _1012;
    int _1116 = abs(_1096);
    bool _1118 = _1080 > 0.0;
    float _1120 = exp2(_1114);
    bool _1122 = _1080 >= 0.0;
    bool _1124 = isnan(_1080);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan(0.0);
    bool _1130 = _1126 || _1128;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1134 = 1.0 + _1132;
    float _1136 = in.m_58.x;
    float _1138 = in.m_58.y;
    float _1140 = in.m_58.z;
    int _1142 = ~_1084;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    int _1148 = _1146;
    float _1150 = _998;
    if (!_1052)
    {
        int _1152 = ~_1084;
        int _1154 = _1152 + 1;
        _1148 = _1154;
    }
    int _1156 = _1148;
    float _1158 = 1.0 / _1134;
    int _1160 = abs(_1090);
    float _1162 = float(_1116);
    float _1164 = float(_1156);
    int _1166 = _1112 ? 0 : 1;
    float _1168 = -_1120;
    float _1170 = _1168 + 1.0;
    bool _1172 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1174 = isnan(0.0);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1180 = _1176 || _1178;
    float _1182 = _1162 * _1164;
    int _1184 = ~_1166;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    int _1190 = _1188;
    if (!_1100)
    {
        int _1192 = ~_1166;
        int _1194 = _1192 + 1;
        _1190 = _1194;
    }
    int _1196 = _1190;
    float _1198 = _1182 * (-2.0);
    float _1200 = _1180 ? _1170 : 0.0;
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1204 = _1034 + _1202;
    float _1206 = float(_1196);
    float _1208 = fma(_1198, _1138, _1138);
    float _1210 = _1200 * _1158;
    float _1212 = _1006 + (-0.5);
    int _1214 = _1130 ? 0 : 1;
    float _1216 = fma(_1082, _1198, _1082);
    float _1218 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1220 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1208);
    float _1222 = _625 + _1006;
    int _1224 = ~_1214;
    int _1226 = _1224 + 1;
    int _1228 = _1226 + 1;
    float _1230 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1232 = _1228;
    if (!_1118)
    {
        int _1234 = ~_1214;
        int _1236 = _1234 + 1;
        _1232 = _1236;
    }
    int _1238 = _1232;
    float _1240 = _1222 + (-1.0);
    bool _1242 = !_1078;
    int _1244 = _1242 ? 0 : 1;
    float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1248 = _1218 + _1246;
    float _1250 = _1204 * _1204;
    float _1252 = float(_1160);
    float _1254 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1256 = abs(_1244);
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1260 = _1230 + _1258;
    float _1262 = fma(_1248, _1248, _1250);
    bool _1264 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1266 = isnan(1.0);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1272 = _1268 || _1270;
    float _1274 = _1252 * _1206;
    float _1276 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1254);
    float _1278 = fma(_1260, _1260, _1262);
    bool _1280 = !_1272;
    float _1282 = _1280 ? _129 : _1210;
    float _1284 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1286 = float(_1256);
    float _1288 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1276);
    float _1290 = float(_1238);
    float _1292 = rsqrt(_1278);
    float _1294 = _625 + (-0.5);
    float _1296 = fma(_1282, _1216, _1220);
    float _1298 = abs(_1288);
    bool _1300 = _1298 > 0.99989998340606689453125;
    float _1302 = _1286 * _1290;
    float _1304 = _1274 * (-2.0);
    float _1306 = _1296 * 0.15915493667125701904296875;
    float _1308 = _1302 * (-2.0);
    float _1310 = fma(_1304, _1136, _1136);
    float _1312 = fma(_1284, _1304, _1284);
    float _1314 = _1306 * 6.283185482025146484375;
    float _1316 = sin(_1314);
    float _1318 = fma(_1308, _1140, _1140);
    float _1320 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1310);
    float _1322 = fma(_1102, _1308, _1102);
    float _1324 = _998 + (-0.5);
    float _1326 = _1204 * _1292;
    float _1328 = fma(_1282, _1312, _1320);
    float _1330 = 0.0;
    float _1332 = _1324;
    float _1334 = _1326;
    if (!_1300)
    {
        _1330 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1336 = _1330;
    float _1338 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1318);
    float _1340 = -_1326;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1204);
    float _1344 = _1328 * 0.15915493667125701904296875;
    float _1346 = _1248 * _1292;
    float _1348 = fma(_1282, _1322, _1338);
    float _1350 = _1342 * _1342;
    float _1352 = _1342;
    float _1354 = _1336;
    if (_1300)
    {
        _1352 = 0.001000000047497451305389404296875;
    }
    float _1356 = _1352;
    float _1358 = -_1346;
    float _1360 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1248);
    float _1362 = _1260 * _1292;
    float _1364 = _1344 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = fma(_1360, _1360, _1350);
    float _1370 = -_1362;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1260);
    float _1374 = _1362;
    if (_1300)
    {
        float _1376 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1354 = _1376;
    }
    float _1378 = _1354;
    float _1380 = 0.0;
    if (!_1300)
    {
        _1380 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1382 = _1380;
    float _1384 = _1382;
    if (_1300)
    {
        float _1386 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1384 = _1386;
    }
    float _1388 = _1384;
    float _1390 = fma(_1372, _1372, _1368);
    float _1392 = _1344 * 6.283185482025146484375;
    float _1394 = cos(_1392);
    if (!_1300)
    {
        _1332 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1396 = _1332;
    float _1398 = _1348 * 0.15915493667125701904296875;
    float _1400 = _1396;
    if (_1300)
    {
        float _1402 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1400 = _1402;
    }
    float _1404 = _1400;
    float _1406 = -_1388;
    float _1408 = _1092 * _1406;
    float _1410 = -_1404;
    float _1412 = _1086 * _1410;
    float _1414 = -_1378;
    float _1416 = _1098 * _1414;
    float _1418 = -_1404;
    float _1420 = -_1408;
    float _1422 = fma(_1098, _1418, _1420);
    float _1424 = _1306 * 6.283185482025146484375;
    float _1426 = cos(_1424);
    float _1428 = -_1378;
    float _1430 = -_1412;
    float _1432 = fma(_1092, _1428, _1430);
    float _1434 = -_1388;
    float _1436 = -_1416;
    float _1438 = fma(_1086, _1434, _1436);
    float _1440 = _1366 * _1316;
    float _1442 = _1394 * _1316;
    float _1444 = _1438 * _1438;
    float _1446 = sqrt(_1390);
    float _1448 = fma(_1422, _1422, _1444);
    float _1450 = fma(_1432, _1432, _1448);
    float _1452 = _1398 * 6.283185482025146484375;
    float _1454 = sin(_1452);
    float _1456 = _1394 * _1426;
    float _1458 = _1366 * _1426;
    float _1460 = rsqrt(_1450);
    float _1462 = _1292 * _1446;
    float _1464 = _831 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1466 = _1040 * _1462;
    float _1468 = _1464 * _1462;
    float _1470 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1472 = _1470 * 0.5;
    float _1474 = _1398 * 6.283185482025146484375;
    float _1476 = cos(_1474);
    float _1478 = fma(_1454, _1456, _1440);
    float _1480 = fma(_1454, _1440, _1456);
    float _1482 = fma(_129, 0.014999999664723873138427734375, _625);
    float _1484 = _1468 * _1036;
    float _1486 = _1478 * _1098;
    float _1488 = _1478 * _1086;
    float _1490 = _1478 * _1092;
    float _1492 = _1438 * _1460;
    float _1494 = floor(_1482);
    float _1496 = _1422 * _1460;
    float _1498 = _1432 * _1460;
    float _1500 = _1086 * _1492;
    float _1502 = -_1442;
    float _1504 = fma(_1454, _1458, _1502);
    float _1506 = -_1458;
    float _1508 = fma(_1454, _1442, _1506);
    float _1510 = _1394 * _1476;
    float _1512 = _1426 * _1476;
    float _1514 = _1366 * _1476;
    float _1516 = _1316 * _1476;
    float _1518 = _1510 * _1098;
    float _1520 = fma(_1512, _1498, _1486);
    float _1522 = -_1500;
    float _1524 = fma(_1092, _1496, _1522);
    float _1526 = _1508 * _1098;
    float _1528 = -_1454;
    float _1530 = fma(_1528, _1498, _1518);
    float _1532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_207));
    float _1534 = fma(_1504, _1524, _1520);
    float _1536 = _1510 * _1086;
    float _1538 = _1092 * _1498;
    float _1540 = fma(_1516, _1498, _1526);
    float _1542 = fma(_1514, _1524, _1530);
    float _1544 = -_1454;
    float _1546 = fma(_1544, _1496, _1536);
    float _1548 = -_1538;
    float _1550 = fma(_1098, _1492, _1548);
    float _1552 = _1466 * _1532;
    float _1554 = fma(_1494, -0.1500000059604644775390625, 1.0);
    float _1556 = fma(_1480, _1524, _1540);
    float _1558 = fma(_1512, _1496, _1488);
    float _1560 = _1508 * _1086;
    float _1562 = fma(_1514, _1550, _1546);
    float _1564 = _1552 * _1542;
    float _1566 = precise::max(_1554, 0.20000000298023223876953125);
    float _1568 = fma(_1504, _1550, _1558);
    float _1570 = fma(_1516, _1496, _1560);
    float _1572 = _1552 * _1562;
    float _1574 = fma(_1484, _1534, _1564);
    float _1576 = precise::min(_1566, 1.0);
    float _1578 = fma(_1480, _1550, _1570);
    float _1580 = fma(_1484, _1568, _1572);
    float _1582 = fma(_1472, _1556, _1574);
    float _1584 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1586 = _1510 * _1092;
    float _1588 = fma(_1472, _1578, _1580);
    float _1590 = fma(_1582, _1576, _1230);
    float _1592 = _1098 * _1496;
    float _1594 = -_1454;
    float _1596 = fma(_1594, _1492, _1586);
    float _1598 = fma(_1588, _1576, _1218);
    float _1600 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1590);
    float _1602 = -_1592;
    float _1604 = fma(_1086, _1498, _1602);
    float _1606 = _1508 * _1092;
    float _1608 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1598);
    float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1612 = _1600 + _1610;
    float _1614 = fma(_1512, _1492, _1490);
    float _1616 = fma(_1514, _1604, _1596);
    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1620 = _1608 + _1618;
    float _1622 = _1612 * _1612;
    float _1624 = fma(_1516, _1492, _1606);
    float _1626 = fma(_1504, _1604, _1614);
    float _1628 = _1552 * _1616;
    float _1630 = fma(_1620, _1620, _1622);
    float _1632 = fma(_1480, _1604, _1624);
    float _1634 = -_1346;
    float _1636 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _1638 = fma(_1484, _1626, _1628);
    float _1640 = sqrt(_1630);
    float _1642 = fma(_1472, _1632, _1638);
    float _1644 = fma(_1642, _1576, _1034);
    float _1646 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1644);
    bool _1648 = _1640 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1652 = _1650 != 0;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1656 = _1654 != 0;
    int _1658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1660 = _1658 != 0;
    int _1662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1664 = _1662 != 0;
    bool _1666 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1668 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan(0.5);
    bool _1674 = _1670 || _1672;
    bool _1676 = !_1656;
    int _1678 = _1676 ? 0 : 1;
    bool _1680 = !_1652;
    int _1682 = _1680 ? 0 : 1;
    bool _1684 = !_1660;
    int _1686 = _1684 ? 0 : 1;
    bool _1688 = !_1664;
    int _1690 = _1688 ? 0 : 1;
    float _1692 = _1644;
    float _1694 = _1600;
    float _1696 = _1608;
    float _1698 = _1620;
    float _1700 = _1480;
    if (!_1648)
    {
        _1692 = _1646;
    }
    float _1702 = _1692;
    bool _1704 = !_1648;
    float _1706 = _1702;
    if (!_1704)
    {
        float _1708 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1712 = _1640 + _1710;
        float _1714 = _1646 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = rsqrt(_1630);
        float _1718 = _1712 * _1708;
        float _1720 = _1718 * 0.15915493667125701904296875;
        float _1722 = _1720 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        float _1726 = _1720 * 6.283185482025146484375;
        float _1728 = cos(_1726);
        float _1730 = fma(_1724, _1714, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1732 = _1716 * _1730;
        float _1734 = _1728 + (-1.0);
        float _1736 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1738 = fma(_1620, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1740 = fma(_1612, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1742 = fma(_1646, _1728, _1736);
        _1706 = _1742;
        _1694 = _1740;
        _1696 = _1738;
    }
    float _1744 = _1706;
    float _1746 = _1694;
    float _1748 = _1696;
    float _1750 = -_1326;
    float _1752 = fma(_1750, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1744);
    float _1754 = -_1362;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1746);
    float _1758 = -_1326;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    float _1762 = -_1362;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    float _1766 = -_1346;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1748);
    float _1770 = _1768;
    float _1772 = _1756;
    float _1774 = _1748;
    if (_1674)
    {
        _1374 = _1752;
    }
    float _1776 = _1374;
    float _1778 = _1776;
    if (_1674)
    {
        _1334 = _1756;
    }
    float _1780 = _1334;
    float _1782 = _1780;
    if (!_1674)
    {
        float _1784 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1786 = _1760 + _1784;
        float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1790 = _1636 + _1788;
        float _1792 = 1.0 / _1462;
        float _1794 = -_1218;
        float _1796 = _1794 + _1748;
        float _1798 = _1786 * _1786;
        float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1802 = _1764 + _1800;
        float _1804 = -_1034;
        float _1806 = _1804 + _1744;
        float _1808 = -_1230;
        float _1810 = _1808 + _1746;
        float _1812 = fma(_1790, _1790, _1798);
        float _1814 = fma(_1802, _1802, _1812);
        float _1816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1818 = sqrt(_1814);
        float _1820 = precise::min(_1818, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1822 = _1820 * _1816;
        float _1824 = _1822 * _1792;
        float _1826 = fma(_1796, _1824, _1636);
        float _1828 = fma(_1806, _1824, _1760);
        float _1830 = fma(_1810, _1824, _1764);
        _1778 = _1828;
        _1770 = _1826;
        _1782 = _1830;
        _1772 = _1824;
        _1698 = _1798;
    }
    float _1832 = _1778;
    float _1834 = _1770;
    float _1836 = _1782;
    float _1838 = _1772;
    float _1840 = _1698;
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1844 = _1832 + _1842;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1848 = _1834 + _1846;
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1852 = _1836 + _1850;
    float _1854 = _1844 * _1844;
    float _1856 = fma(_1848, _1848, _1854);
    float _1858 = fma(_1852, _1852, _1856);
    float _1860 = rsqrt(_1858);
    float _1862 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1864 = _1848 * _1862;
    float _1866 = _1852 * _1862;
    float _1868 = _1864 * _1864;
    float _1870 = _1866 * _1866;
    float _1872 = _1868 + _1870;
    float _1874 = sqrt(_1872);
    bool _1876 = _1874 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1878 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1880 = _1874 + _1878;
    float _1882 = _1838;
    float _1884 = _1872;
    float _1886 = _1880;
    float _1888 = _1844;
    float _1890 = _1864;
    float _1892 = _1866;
    float _1894 = _1868;
    float _1896 = _1870;
    if (_1876)
    {
        float _1898 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1882 = _1898;
    }
    float _1900 = _1882;
    if (_1876)
    {
        float _1902 = rsqrt(_1872);
        _1884 = _1902;
    }
    float _1904 = _1884;
    if (_1876)
    {
        float _1906 = _1880 * _1900;
        _1886 = _1906;
    }
    float _1908 = _1886;
    if (_1876)
    {
        float _1910 = _1908 * 0.15915493667125701904296875;
        _1774 = _1910;
    }
    float _1912 = _1774;
    float _1914 = _1612;
    if (_1876)
    {
        float _1916 = _1912 * 6.283185482025146484375;
        float _1918 = sin(_1916);
        _1914 = _1918;
    }
    float _1920 = _1914;
    float _1922 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1924 = precise::max(0.0, _1922);
    float _1926 = _1840;
    float _1928 = _1924;
    float _1930 = _1922;
    if (_1876)
    {
        float _1932 = _1912 * 6.283185482025146484375;
        float _1934 = cos(_1932);
        _1926 = _1934;
    }
    float _1936 = _1926;
    float _1938 = -_1862;
    float _1940 = -_1924;
    float _1942 = fma(_1844, _1938, _1940);
    if (_1876)
    {
        float _1944 = _1942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1888 = _1944;
    }
    float _1946 = _1888;
    float _1948 = _1946;
    if (_1876)
    {
        float _1950 = fma(_1920, _1946, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1928 = _1950;
    }
    float _1952 = _1928;
    float _1954 = _1952;
    if (!_1876)
    {
        _1948 = _1942;
    }
    float _1956 = _1948;
    float _1958 = sqrt(_1858);
    float _1960 = _1956;
    if (_1876)
    {
        float _1962 = _1936 + (-1.0);
        _1930 = _1962;
    }
    float _1964 = _1930;
    if (_1876)
    {
        float _1966 = _1904 * _1952;
        _1700 = _1966;
    }
    float _1968 = _1700;
    if (_1876)
    {
        float _1970 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _1970;
    }
    float _1972 = _1954;
    if (_1876)
    {
        float _1974 = _1864 * _1968;
        _1890 = _1974;
    }
    float _1976 = _1890;
    if (_1876)
    {
        float _1978 = _1866 * _1968;
        _1892 = _1978;
    }
    float _1980 = _1892;
    float _1982 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1876)
    {
        float _1984 = fma(_1942, _1936, _1972);
        _1960 = _1984;
    }
    float _1986 = _1960;
    if (_1876)
    {
        float _1988 = _1976 * _1976;
        _1894 = _1988;
    }
    float _1990 = _1894;
    if (_1876)
    {
        float _1992 = _1980 * _1980;
        _1896 = _1992;
    }
    float _1994 = _1896;
    float _1996 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1998 = fma(_1986, _1986, _1990);
    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2002 = fma(_1958, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2000);
    float _2004 = precise::clamp(_2002, 0.0, 1.0);
    float _2006 = _1998 + _1994;
    float _2008 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1982);
    float _2010 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2012 = -_2004;
    float _2014 = _2012 + 1.0;
    float _2016 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2018 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2008);
    float _2020 = rsqrt(_2006);
    float _2022 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2024 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2010);
    float _2026 = _2018 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2028 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2016);
    float _2030 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2022);
    float _2032 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2024);
    float _2034 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2036 = abs(_2014);
    float _2038 = log2(_2036);
    float _2040 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2030);
    float _2042 = _2032 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2044 = -_2034;
    float _2046 = fma(_2044, _1996, 1.0);
    float _2048 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2028);
    float _2050 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2052 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2054 = _2020 * _1976;
    float _2056 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2058 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2052);
    float _2060 = _2020 * _1986;
    float _2062 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2064 = _2020 * _1980;
    float _2066 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2058);
    float _2068 = log2(_2046);
    float _2070 = -_2062;
    float _2072 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2070);
    float _2074 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2076 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2066);
    float _2078 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2080 = -_2064;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2072);
    float _2084 = exp2(_2074);
    float _2086 = fma(_2082, -0.5, 0.5);
    float _2088 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2090 = fma(_2082, 0.5, 0.5);
    float _2092 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2078);
    float _2094 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2088);
    float _2096 = fma(_2090, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2098 = 1.0 / _2076;
    float _2100 = _2060 + 1.0;
    float _2102 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2094);
    float _2104 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2092);
    float _2106 = fma(_2090, _2096, -0.212114393711090087890625);
    float _2108 = _2068 * 0.693147182464599609375;
    float _2110 = sqrt(_2086);
    float _2112 = -_2060;
    float _2114 = fma(_2084, _2100, _2112);
    float _2116 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2102);
    float _2118 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2104);
    float _2120 = fma(_2090, _2106, 1.570728778839111328125);
    float _2122 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2124 = fma(_2114, 0.5, 0.5);
    float _2126 = _2116 * _2098;
    float _2128 = _2118 * _2098;
    float _2130 = fma(_2126, 0.5, 0.5);
    float _2132 = fma(_2128, -0.5, 0.5);
    float _2134 = _2110 * 0.636619746685028076171875;
    float _2136 = -_2120;
    float _2138 = fma(_2134, _2136, 1.0);
    float3 _6385 = float3(_2130, _2132, _2122);
    float _2140 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6385, float3(0.0), isnan(_6385)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6385, float3(0.0), isnan(_6385)), level(0.0)).x;
    float3 _6396 = float3(_2130, _2132, _2122);
    float4 _2143 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6396, float3(0.0), isnan(_6396)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6396, float3(0.0), isnan(_6396)), level(0.0)).xyzw;
    float _2145 = _2143.x;
    float _2147 = _2143.y;
    float _2149 = _2143.z;
    float _2151 = _2143.w;
    float2 _6413 = float2(_2138, _2124);
    float3 _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6413, float2(0.0), isnan(_6413)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6413, float2(0.0), isnan(_6413)), level(0.0)).xyz;
    float _2157 = _2155.x;
    float _2159 = _2155.y;
    float _2161 = _2155.z;
    float _2163 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2165 = int(_2163);
    out.m_60.x = _956;
    out.m_60.y = _958;
    out.m_60.z = _962;
    out.m_60.w = _954;
    float _2167 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2169 = _625 > 0.5;
    float _2171 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2173 = _2171 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2175 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2177 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2179 = _2175 || _2177;
    bool _2181 = isnan(0.5);
    bool _2183 = _2179 || _2181;
    float _2185 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2187 = int(_2185);
    out.m_62.x = _1834;
    out.m_62.y = _1832;
    out.m_62.z = _1836;
    int _2189 = abs(_1678);
    bool _2191 = _1006 > 0.5;
    out.m_64.y = _1466;
    float _2193 = float(_2165);
    float _2195 = 1.0 / _994;
    float _2197 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2199 = _2197 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2201 = float(uint(_2187));
    float _2203 = 1.0 / _2193;
    int _2205 = ~_2187;
    int _2207 = _2205 + 1;
    float _2209 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2211 = 1.0 / _2201;
    float _2213 = _129 * _2203;
    float _2215 = 1.0 / _2173;
    int _2217 = as_type<int>(_2211) + (-2);
    float _2219 = trunc(_2213);
    int _2221 = int(_2219);
    float _2223 = 1.0 / _2199;
    float _2225 = float(uint(_2221));
    float _2227 = exp2(_2167);
    float _2229 = float(_2221);
    float _2231 = as_type<float>(_2217) * _2225;
    int _2233 = ~_2187;
    int _2235 = _2233 + 1;
    float _2237 = trunc(_2231);
    float _2239 = precise::max(_2237, 0.0);
    uint _2241 = uint(_2239);
    float _2243 = -_2227;
    float _2245 = _2243 + 1.0;
    int _2247 = _2235 * int(_2241);
    int _2249 = _2247 + _2221;
    float _2251 = in.m_56.w;
    float _2253 = float(uint(_2249));
    float _2255 = as_type<float>(_2217) * _2253;
    int _2257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2259 = _2257 != 0;
    float _2261 = trunc(_2255);
    float _2263 = precise::max(_2261, 0.0);
    uint _2265 = uint(_2263);
    bool _2267 = !_2259;
    float _2269 = _2267 ? 1.2345600128173828125 : 1.0;
    bool _2271 = !_2259;
    float _2273 = _2271 ? _1006 : _625;
    float _2275 = _2269 * _2273;
    float _2277 = float(_2187);
    bool _2279 = _2251 > 0.5;
    float _2281 = floor(_2275);
    int _2283 = int(_2241) + int(_2265);
    bool _2285 = _2229 >= _2277;
    bool _2287 = isnan(_2229);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan(_2277);
    bool _2293 = _2289 || _2291;
    float _2295 = float(_2293);
    int _2297 = _2207 * _2283;
    int _2299 = _2297 + _2221;
    float _2301 = trunc(_2295);
    int _2303 = int(_2301);
    float _2305 = _625 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2307 = uint(_2299) >= uint(_2187);
    bool _2309 = !_2307;
    int _2311 = _2309 ? 0 : (-1);
    float _2313 = -_2281;
    float _2315 = _2275 + _2313;
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2319 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2317;
    int _2321 = ~_2283;
    int _2323 = _2321 + _2311;
    int _2325 = _2323 + 1;
    float _2327 = _129 * _2277;
    bool _2329 = _2187 == 0;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2333 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2335 = _2319 * _2215;
    int _2337 = _2187 * _2325;
    int _2339 = _2337 + _2221;
    float _2341 = _2315 * _2277;
    float _2343 = fma(_2333, -2.0, _2209);
    float _2345 = _2327 * _2195;
    int _2347 = ~_2303;
    int _2349 = _2347 + 1;
    int _2351 = _2349 + 1;
    float _2353 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2355 = _2353 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2357 = !_2329;
    int _2359 = _2357 ? _2339 : (-1);
    float _2361 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2363 = trunc(_2341);
    int _2365 = int(_2363);
    float _2367 = -_2331;
    float _2369 = fma(_2305, 2.0, _2367);
    int _2371 = _2187 + (-1);
    int _2373 = _2359 * _2351;
    float _2375 = _2305;
    if (!_2259)
    {
        _2375 = _1006;
    }
    float _2377 = _2375;
    float _2379 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2361);
    float _2381 = _2377;
    if (_2259)
    {
        _2381 = _625;
    }
    float _2383 = _2381;
    float _2385 = _2355 * _2223;
    int _2387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2389 = _2387 != 0;
    float _2391 = trunc(_2345);
    int _2393 = int(_2391);
    int _2395 = _2303 * _2371;
    int _2397 = _2395 + _2373;
    bool _2399 = !_2389;
    float _2401 = _2399 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2403 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2379);
    int _2405 = abs(_1682);
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2409 = abs(as_type<int>(_2401));
    float _2411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2413 = _998 > 0.5;
    float _2415 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2407);
    float _2417 = _2401;
    if (!_2259)
    {
        _2417 = _998;
    }
    float _2419 = _2417;
    int _2421 = _2397 * _2189;
    int _2423 = abs(_1686);
    float _2425 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2415);
    float _2427 = _2419;
    if (_2259)
    {
        _2427 = _1006;
    }
    float _2429 = _2427;
    float _2431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_2259)
    {
        _1150 = _1006;
    }
    float _2433 = _1150;
    int _2435 = _2365 * _2409;
    int _2437 = _2435 + _2221;
    float _2439 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2441 = _996 + _2439;
    float _2443 = -_211;
    int _2445 = _2169 ? as_type<int>(_2443) : as_type<int>(_211);
    float _2447 = -_129;
    float _2449 = fma(_2447, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2369);
    int _2451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2453 = _2451 != 0;
    int _2455 = _2393 * _2405;
    int _2457 = _2455 + _2421;
    float _2459 = _2411 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2461 = abs(_1690);
    float _2463 = fma(_2335, _2441, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2465 = !_2453;
    float _2467 = _2465 ? _211 : as_type<float>(_2445);
    int _2469 = _2437 * _2423;
    int _2471 = _2469 + _2457;
    float _2473 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2475 = _996 + _2473;
    int _2477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2479 = _2477 != 0;
    float _2481 = _2431 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2483 = _2467 + 0.5;
    float _2485 = -as_type<float>(_207);
    int _2487 = _2191 ? as_type<int>(_2485) : _207;
    int _2489 = _2365 * _2461;
    int _2491 = _2489 + _2471;
    float _2493 = fma(_2459, _2483, _2449);
    float _2495 = fma(_2385, _2475, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2497 = !_2479;
    float _2499 = _2497 ? as_type<float>(_207) : as_type<float>(_2487);
    float _2501 = _2429 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2503 = float(uint(_2491));
    float _2505 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2507 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2343);
    float _2509 = _2499 + (-0.5);
    float _2511 = float(uint(_2437));
    float _2513 = as_type<float>(_2217) * _2503;
    bool _2515 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2517 = isnan(_996);
    bool _2519 = _2515 || _2517;
    bool _2521 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2523 = _2519 || _2521;
    float _2525 = float(_2523);
    float _2527 = -_2481;
    float _2529 = -_2507;
    float _2531 = fma(_2527, _2509, _2529);
    int _2533 = ~_2187;
    int _2535 = _2533 + 1;
    float _2537 = trunc(_2513);
    float _2539 = precise::max(_2537, 0.0);
    uint _2541 = uint(_2539);
    bool _2543 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2545 = isnan(_996);
    bool _2547 = _2543 || _2545;
    bool _2549 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2551 = _2547 || _2549;
    float _2553 = float(_2551);
    float _2555 = -_2525;
    float _2557 = _2555 + 1.0;
    float _2559 = fma(_2433, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2505);
    bool _2561 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2563 = isnan(_996);
    bool _2565 = _2561 || _2563;
    bool _2567 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2569 = _2565 || _2567;
    float _2571 = float(_2569);
    float _2573 = _2553 * _2557;
    float _2575 = -_2553;
    float _2577 = _2575 + 1.0;
    float _2579 = as_type<float>(_2217) * _2511;
    float _2581 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2583 = _2571 * _2577;
    float _2585 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2587 = fma(_2383, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2581);
    float _2589 = trunc(_2579);
    float _2591 = precise::max(_2589, 0.0);
    uint _2593 = uint(_2591);
    int _2595 = _2535 * int(_2541);
    int _2597 = _2595 + _2491;
    float _2599 = _2383 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2601 = _2463 * _2583;
    float _2603 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2605 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2587);
    float _2607 = float(uint(_2597));
    float _2609 = -_2585;
    float _2611 = fma(_2599, 2.0, _2609);
    float _2613 = -_2571;
    float _2615 = _2613 + 1.0;
    int _2617 = ~_2187;
    int _2619 = _2617 + 1;
    float _2621 = fma(_2501, -2.0, _2603);
    float _2623 = as_type<float>(_2217) * _2607;
    float _2625 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2627 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2629 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2559);
    float _2631 = -_129;
    float _2633 = fma(_2631, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2611);
    int _2635 = _2619 * int(_2593);
    int _2637 = _2635 + _2437;
    float _2639 = trunc(_2623);
    float _2641 = precise::max(_2639, 0.0);
    uint _2643 = uint(_2641);
    float _2645 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2625);
    float _2647 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2621);
    float _2649 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2627);
    float _2651 = float(uint(_2637));
    float _2653 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2645);
    int _2655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2657 = _2655 != 0;
    float _2659 = fma(_2615, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2601);
    float _2661 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2649);
    float _2663 = as_type<float>(_2217) * _2651;
    int _2665 = ~_2187;
    int _2667 = _2665 + 1;
    float _2669 = _2653 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2671 = fma(_2495, _2573, _2659);
    float _2673 = trunc(_2663);
    float _2675 = precise::max(_2673, 0.0);
    uint _2677 = uint(_2675);
    float _2679 = -_2403;
    float _2681 = _2679 + 1.0;
    int _2683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2685 = _2683 != 0;
    float _2687 = fma(_2525, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2671);
    int _2689 = int(_2541) + int(_2643);
    float _2691 = -_2681;
    float _2693 = fma(_2467, _2691, _2493);
    float _2695 = -_211;
    int _2697 = _2413 ? as_type<int>(_2695) : as_type<int>(_211);
    float _2699 = -_2629;
    float _2701 = _2699 + 1.0;
    float _2703 = 1.0 / _2669;
    int _2705 = _2667 * _2689;
    int _2707 = _2705 + _2491;
    bool _2709 = !_2657;
    float _2711 = _2709 ? _211 : as_type<float>(_2697);
    float _2713 = _2661 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2715 = _2687 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2717 = uint(_2707) >= uint(_2187);
    float _2719 = _2711 + 0.5;
    int _2721 = int(_2593) + int(_2677);
    float _2723 = _2713 + _2669;
    bool _2725 = !_2717;
    int _2727 = _2725 ? 0 : (-1);
    float _2729 = fma(_2719, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2633);
    float _2731 = -as_type<float>(_207);
    int _2733 = _2279 ? as_type<int>(_2731) : _207;
    out.m_66.w = _2715;
    int _2735 = ~_2689;
    int _2737 = _2735 + _2727;
    int _2739 = _2737 + 1;
    float _2741 = _2723 * _2703;
    float _2743 = _2741 * 0.5;
    float _2745 = _2467;
    float _2747 = _2723;
    float _2749 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_2183)
    {
        _2745 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2751 = _2745;
    int _2753 = _2187 * _2739;
    int _2755 = _2753 + _2491;
    float _2757 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2759 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2757);
    float _2761 = -_2425;
    float _2763 = _2761 + 1.0;
    bool _2765 = !_2685;
    float _2767 = _2765 ? as_type<float>(_207) : as_type<float>(_2733);
    bool _2769 = !_2329;
    int _2771 = _2769 ? _2755 : (-1);
    float _2773 = fma(_2499, _2763, _2531);
    float _2775 = -_2605;
    float _2777 = _2775 + 1.0;
    int _2779 = ~_2187;
    int _2781 = _2779 + 1;
    float _2783 = 1.0 / _2759;
    int _2785 = _2771 >> 31;
    float _2787 = -_2777;
    float _2789 = fma(_2711, _2787, _2729);
    float _2791 = as_type<float>(_2785);
    float _2793 = _2751;
    float _2795 = _2789;
    if (!_2183)
    {
        _2747 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2797 = _2747;
    float _2799 = _2767 + (-0.5);
    int _2801 = _2785 & 3;
    float _2803 = as_type<float>(_2801);
    if (!_2183)
    {
        float _2805 = -_2751;
        float _2807 = _2805 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2791 = _2807;
    }
    float _2809 = _2791;
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2813 = _2811 != 0;
    int _2815 = _2781 * _2721;
    int _2817 = _2815 + _2437;
    int _2819 = _2771 + _2801;
    float _2821 = as_type<float>(_2817);
    if (!_2183)
    {
        float _2823 = -_2797;
        float _2825 = _2823 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2749 = _2825;
    }
    float _2827 = _2749;
    if (!_2183)
    {
        float _2829 = 1.0 / _2809;
        _2803 = _2829;
    }
    float _2831 = _2803;
    float _2833 = -_2799;
    float _2835 = -_2647;
    float _2837 = fma(_2833, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2835);
    int _2839 = _2819 >> 2;
    bool _2841 = uint(_2817) >= uint(_2187);
    float _2843 = fma(_2767, _2701, _2837);
    int _2845 = _2839 << 4;
    int _2847 = _2845 + 512;
    float _2849 = as_type<float>(_2839);
    if (!_2183)
    {
        float _2851 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2853 = -_2751;
        float _2855 = fma(_2783, _2851, _2853);
        _2793 = _2855;
    }
    float _2857 = _2793;
    float _2859 = _2425;
    if (!_2183)
    {
        float _2861 = 1.0 / _2827;
        _2859 = _2861;
    }
    float _2863 = _2859;
    if (!_2183)
    {
        float _2865 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2867 = -_2797;
        float _2869 = fma(_2783, _2865, _2867);
        _2821 = _2869;
    }
    float _2871 = _2821;
    uint _2873 = uint(int(uint(_2847) >> uint(2)));
    uint _2875 = uint(int(uint(int(_2873)) >> uint(2)));
    int _2877 = int(_2873) & 3;
    float _2879 = (*spvDescriptorSet0.vp_c9)._m0[int(_2875)][_2877];
    int _2881 = int(_2873) + 1;
    uint _2883 = uint(int(uint(_2881) >> uint(2)));
    int _2885 = _2881 & 3;
    float _2887 = (*spvDescriptorSet0.vp_c9)._m0[int(_2883)][_2885];
    out.m_68.x = _2693;
    out.m_68.y = _2773;
    out.m_68.z = _2789;
    out.m_68.w = _2843;
    if (_2183)
    {
        _2849 = 1.0;
    }
    float _2889 = _2849;
    int _2891 = _2771 & 3;
    bool _2893 = _2891 != 0;
    bool _2895 = !_2841;
    int _2897 = _2895 ? 0 : (-1);
    int _2899 = ~_2721;
    int _2901 = _2899 + _2897;
    int _2903 = _2901 + 1;
    float _2905 = _2889;
    if (!_2183)
    {
        float _2907 = _2871 * _2863;
        float _2909 = precise::clamp(_2907, 0.0, 1.0);
        _2905 = _2909;
    }
    float _2911 = _2905;
    int _2913 = _2847 + 8;
    uint _2915 = uint(int(uint(_2913) >> uint(2)));
    uint _2917 = uint(int(uint(int(_2915)) >> uint(2)));
    int _2919 = int(_2915) & 3;
    float _2921 = (*spvDescriptorSet0.vp_c9)._m0[int(_2917)][_2919];
    int _2923 = int(_2915) + 1;
    uint _2925 = uint(int(uint(_2923) >> uint(2)));
    int _2927 = _2923 & 3;
    float _2929 = (*spvDescriptorSet0.vp_c9)._m0[int(_2925)][_2927];
    float _2931 = as_type<float>(_207) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    if (!_2183)
    {
        float _2933 = _2857 * _2831;
        float _2935 = precise::clamp(_2933, 0.0, 1.0);
        _2795 = _2935;
    }
    float _2937 = _2795;
    int _2939 = _2187 * _2903;
    int _2941 = _2939 + _2437;
    float _2943 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2945 = _1562 * _2931;
    int _2947 = _2771 & 3;
    bool _2949 = _2947 != 0;
    float _2951 = _1616 * _2931;
    if (_2183)
    {
        _217 = 1.0;
    }
    float _2953 = _217;
    float _2955 = _2953;
    if (!_2183)
    {
        float _2957 = -_2937;
        float _2959 = _2957 + 1.0;
        _2955 = _2959;
    }
    float _2961 = _2955;
    bool _2963 = uint(_2947) > 1u;
    float _2965 = _1542 * _2931;
    bool _2967 = _2947 != 3;
    float _2969 = _2911 * _2961;
    int _2971 = _2893 ? 0 : 1;
    float _2973 = fma(_1568, _2943, _2945);
    bool _2975 = uint(_2947) >= 2u;
    float _2977 = _2969 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2979 = fma(_1534, _2943, _2965);
    int _2981 = ~_2971;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    float _2987 = fma(_1626, _2943, _2951);
    int _2989 = _2975 ? 0 : 1;
    float _2991 = _713 * _2977;
    int _2993 = _2985;
    if (!_2963)
    {
        int _2995 = ~_2971;
        int _2997 = _2995 + 1;
        _2993 = _2997;
    }
    int _2999 = _2993;
    float _3001 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3003 = _2947 != 3;
    float _3005 = _1556 + _2979;
    bool _3007 = !_2949;
    int _3009 = _3007 ? 0 : 1;
    float _3011 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3001);
    int _3013 = abs(_2999);
    float _3015 = _2991 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _3017 = ~_2989;
    int _3019 = _3017 + 1;
    int _3021 = _3019 + 1;
    float _3023 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3011);
    int _3025 = abs(_3009);
    int _3027 = _3021;
    if (_2967)
    {
        int _3029 = ~_2989;
        int _3031 = _3029 + 1;
        _3027 = _3031;
    }
    int _3033 = _3027;
    float _3035 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3023);
    out.m_45.x = _3015;
    int _3037 = abs(_3033);
    int _3039 = ~_3013;
    int _3041 = _3039 + 1;
    int _3043 = _3041 + 1;
    bool _3045 = !_3003;
    int _3047 = _3045 ? 0 : (-1);
    int _3049 = ~_3025;
    int _3051 = _3049 + 1;
    int _3053 = _3051 + 1;
    int _3055 = _3043 * as_type<int>(_2887);
    bool _3057 = !_2813;
    int _3059 = _3057 ? 0 : 1;
    int _3061 = _3053 * as_type<int>(_2879);
    int _3063 = _3061 + _3055;
    int _3065 = abs(_3047);
    int _3067 = ~_3037;
    int _3069 = _3067 + 1;
    int _3071 = _3069 + 1;
    int _3073 = abs(_3059);
    int _3075 = ~_3065;
    int _3077 = _3075 + 1;
    int _3079 = _3077 + 1;
    int _3081 = _3071 * as_type<int>(_2921);
    int _3083 = _3081 + _3063;
    float _3085 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3087 = !_2329;
    int _3089 = _3087 ? _2941 : (-1);
    int _3091 = _3079 * as_type<int>(_2929);
    int _3093 = _3091 + _3083;
    float _3095 = _1578 + _2973;
    int _3097 = ~_3073;
    int _3099 = _3097 + 1;
    int _3101 = _3099 + 1;
    float _3103 = _1632 + _2987;
    bool _3105 = _2911 > 0.0;
    bool _3107 = isnan(_2911);
    bool _3109 = _3105 || _3107;
    bool _3111 = isnan(0.0);
    bool _3113 = _3109 || _3111;
    float _3115 = _3085 * _2140;
    float _3117 = -_3085;
    float _3119 = _3117 + 1.0;
    int _3121 = _3093 * _3101;
    float _3123 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _3125 = _3035 + _3123;
    bool _3127 = _2961 <= 0.0;
    bool _3129 = !_3113;
    bool _3131 = _3127 || _3129;
    out.m_70.x = _3095;
    out.m_70.y = _3103;
    out.m_70.z = _3005;
    int _3133 = _3089 * _3073;
    int _3135 = _3133 + _3121;
    float _3137 = _2076 + _3125;
    float _3139 = _2161 * _3115;
    float _3141 = _2151 * _3119;
    float _3143 = _3137 * 0.5;
    float _3145 = float(_3135);
    float _3147 = fma(_2151, _3139, _2149);
    out.gl_Position.x = _2116;
    out.gl_Position.y = _2118;
    out.gl_Position.z = _3125;
    out.gl_Position.w = _2076;
    float _3149 = _2151 * _3115;
    out.m_72.z = _3143;
    out.m_72.w = _2076;
    float _3151 = fma(_2157, _3149, _2145);
    float _3153 = fma(_2159, _3149, _2147);
    out.m_74.y = _3145;
    out.m_76.x = _3151;
    out.m_76.y = _3153;
    out.m_76.z = _3147;
    out.m_76.w = _3141;
    if (!_3131)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_45.x = 0.0;
    float _3155 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3155;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_VertexIndex [[vertex_id]])
{
    main0_out out = {};
    out.m_60 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _986 = false;
    bool _853 = false;
    bool _733 = false;
    bool _497 = false;
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
        float _3212 = as_type<float>(_111);
        out.gl_Position.z = _3212;
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
        _105 = _135;
    }
    float _137 = _105;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _113 = as_type<int>(_149);
    }
    int _151 = _113;
    float _153 = as_type<float>(_151);
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3283 = as_type<float>(_151);
        out.gl_Position.z = _3283;
    }
    if (_143)
    {
        return out;
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = _157;
    if (!_173)
    {
        float _177 = _157 * _157;
        float _179 = _177 * 0.5;
        _153 = _179;
    }
    float _181 = _153;
    float _183 = 0.0;
    float _185 = _181;
    if (!_173)
    {
        float _187 = _129 * _129;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    if (!_173)
    {
        float _193 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _193;
    }
    float _195 = _185;
    int _197 = as_type<int>(_155) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_155) & 2;
    bool _203 = _201 != 0;
    bool _205 = !_203;
    int _207 = _205 ? (-1090519040) : 1056964608;
    bool _209 = !_199;
    float _211 = _209 ? (-0.5) : 0.5;
    bool _213 = !_173;
    float _215 = _195;
    float _217 = _211;
    if (!_213)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _157 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _157);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _131 = _237;
        _215 = _247;
        _133 = _235;
    }
    float _249 = _131;
    float _251 = _215;
    float _253 = _133;
    bool _255 = !_173;
    float _257 = _249;
    float _259 = _253;
    if (!_255)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _157 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _257 = _273;
        _259 = _267;
        _175 = _279;
    }
    float _281 = _257;
    float _283 = _259;
    float _285 = _175;
    float _287 = _283;
    float _289 = _281;
    if (!_173)
    {
        _287 = _129;
    }
    float _291 = _287;
    float _293 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _291;
    if (!_173)
    {
        float _297 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _289 = _297;
    }
    float _299 = _289;
    bool _301 = !_173;
    float _303 = _299;
    if (!_301)
    {
        float _305 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = log2(_305);
        float _309 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = _129 * _307;
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = 1.0 / _315;
        float _319 = _309 * 0.693147182464599609375;
        float _321 = exp2(_311);
        float _323 = 1.0 / _319;
        float _325 = _321 + (-1.0);
        float _327 = -_325;
        float _329 = fma(_327, _323, _129);
        float _331 = _329 * _317;
        float _333 = _331 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _303 = _333;
    }
    float _335 = _303;
    bool _337 = !_173;
    if (!_337)
    {
        float _339 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _341 = log2(_339);
        float _343 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _345 = _343 + 1.0;
        float _347 = 1.0 / _345;
        float _349 = _129 * _341;
        float _351 = exp2(_349);
        float _353 = -_351;
        float _355 = _353 + 1.0;
        float _357 = _355 * _347;
        _295 = _357;
    }
    float _359 = _295;
    float _361 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _363 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _365 = fma(_285, _161, _293);
    float _367 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = fma(_359, _161, _361);
    float _371 = fma(_285, _159, _363);
    float _373 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _375 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _377 = fma(_359, _159, _367);
    float _379 = -_369;
    float _381 = _365 + _379;
    float _383 = fma(_285, _163, _373);
    float _385 = fma(_359, _163, _375);
    float _387 = -_377;
    float _389 = _371 + _387;
    float _391 = _381 * _381;
    float _393 = in.m_52.w;
    float _395 = -_385;
    float _397 = _383 + _395;
    float _399 = _381 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _401 = fma(_389, _389, _391);
    out.m_54.y = as_type<float>(_207);
    float _403 = _381 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _405 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _407 = fma(_397, _397, _401);
    float _409 = _381 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _411 = in.m_42.x;
    float _413 = in.m_42.y;
    float _415 = in.m_42.z;
    float _417 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _403);
    float _419 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].z, _405);
    float _421 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _409);
    float _423 = sqrt(_407);
    float _425 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].z, _421);
    bool _427 = _423 >= 9.9999999747524270787835121154785e-07;
    bool _429 = isnan(_423);
    bool _431 = _427 || _429;
    bool _433 = isnan(9.9999999747524270787835121154785e-07);
    bool _435 = _431 || _433;
    float _437 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].z, _417);
    float _439 = fma(_371, _393, _411);
    float _441 = fma(_365, _393, _413);
    float _443 = fma(_383, _393, _415);
    float _445 = _365;
    float _447 = _393;
    float _449 = _425;
    if (_435)
    {
        _445 = _419;
    }
    float _451 = _445;
    float _453 = _451;
    if (_435)
    {
        _447 = _437;
    }
    float _455 = _447;
    float _457 = _455;
    if (!_435)
    {
        bool _459 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _461 = !_459;
        if (!_461)
        {
            float _463 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _465 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _467 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _467);
            float _475 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
            float _477 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _471);
            float _479 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _473);
            float _481 = _475 * _475;
            float _483 = fma(_477, _477, _481);
            float _485 = fma(_479, _479, _483);
            float _487 = rsqrt(_485);
            float _489 = _487 * 9.9999999747524270787835121154785e-07;
            float _491 = _477 * _489;
            float _493 = _475 * _489;
            float _495 = _479 * _489;
            _457 = _493;
            _453 = _491;
            _449 = _495;
            _497 = true;
        }
        else
        {
            float _499 = _161 * _161;
            float _501 = fma(_159, _159, _499);
            float _503 = fma(_163, _163, _501);
            float _505 = sqrt(_503);
            bool _507 = _505 >= 9.9999999747524270787835121154785e-07;
            bool _509 = isnan(_505);
            bool _511 = _507 || _509;
            bool _513 = isnan(9.9999999747524270787835121154785e-07);
            bool _515 = _511 || _513;
            if (!_515)
            {
                float _517 = _413 * _413;
                float _519 = fma(_411, _411, _517);
                float _521 = fma(_415, _415, _519);
                float _523 = sqrt(_521);
                bool _525 = _523 >= 9.9999999747524270787835121154785e-07;
                bool _527 = isnan(_523);
                bool _529 = _525 || _527;
                bool _531 = isnan(9.9999999747524270787835121154785e-07);
                bool _533 = _529 || _531;
                if (!_533)
                {
                    float _535 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _537 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _535);
                    float _539 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _537);
                    float _541 = rsqrt(_539);
                    float _543 = _541 * 9.9999999747524270787835121154785e-07;
                    float _545 = _543 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _547 = _543 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _549 = _543 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _457 = _547;
                    _453 = _545;
                    _449 = _549;
                    _497 = true;
                }
                else
                {
                    float _551 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _553 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _555 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _557 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].x, _551);
                    float _559 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].x, _553);
                    float _561 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].x, _555);
                    float _563 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _557);
                    float _565 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _559);
                    float _567 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _561);
                    float _569 = _563 * _563;
                    float _571 = fma(_565, _565, _569);
                    float _573 = fma(_567, _567, _571);
                    float _575 = rsqrt(_573);
                    float _577 = _575 * 9.9999999747524270787835121154785e-07;
                    float _579 = _565 * _577;
                    float _581 = _563 * _577;
                    float _583 = _567 * _577;
                    _457 = _581;
                    _453 = _579;
                    _449 = _583;
                    _497 = true;
                }
            }
            else
            {
                float _585 = _161 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _587 = _161 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _589 = _161 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _591 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].x, _585);
                float _593 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].x, _587);
                float _595 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].x, _589);
                float _597 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].z, _591);
                float _599 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].z, _593);
                float _601 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].z, _595);
                float _603 = _597 * _597;
                float _605 = fma(_599, _599, _603);
                float _607 = fma(_601, _601, _605);
                float _609 = rsqrt(_607);
                float _611 = _609 * 9.9999999747524270787835121154785e-07;
                float _613 = _599 * _611;
                float _615 = _597 * _611;
                float _617 = _601 * _611;
                _457 = _615;
                _453 = _613;
                _449 = _617;
            }
        }
    }
    _497 = false;
    float _619 = _457;
    float _621 = _453;
    float _623 = _449;
    float _625 = in.m_56.x;
    float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _629 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _637 = _635 != 0;
    float _639 = _629 * _627;
    float _641 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[20].x, _639);
    float _643 = _641 * 6.283185482025146484375;
    float _645 = floor(_641);
    int _647 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _649 = _647 != 0;
    float _651 = _643 * 0.15915493667125701904296875;
    bool _653 = !_633;
    int _655 = _653 ? 0 : 1;
    bool _657 = !_637;
    int _659 = _657 ? 0 : 1;
    int _661 = abs(_655);
    float _663 = _651 * 6.283185482025146484375;
    float _665 = cos(_663);
    bool _667 = !_649;
    int _669 = _667 ? 0 : 1;
    int _671 = abs(_659);
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _675 = -_645;
    float _677 = _641 + _675;
    int _679 = abs(_669);
    float _681 = float(_661);
    float _683 = -_677;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _687 = _677 < 0.5;
    float _689 = float(_687);
    float _691 = float(_671);
    float _693 = abs(_685);
    float _695 = _681 * _693;
    float _697 = fma(_665, 0.5, 0.5);
    float _699 = float(_679);
    float _701 = -_689;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _705 = -_697;
    float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _709 = fma(_699, _707, _695);
    float _711 = abs(_703);
    float _713 = fma(_691, _711, _709);
    bool _715 = !_673;
    float _731;
    if (!_715)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _719 = _625 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_95);
        float _737 = 1.0 / _735;
        float _739 = _129 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _745 = _741 + _743;
    float _747 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _749;
    bool _753 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _755 = isnan(_741);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = 1.0 / _751;
    bool _767 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _769 = isnan(_741);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _779;
    float _783 = _747 * _625;
    float _785 = -_763;
    float _787 = _785 + 1.0;
    bool _789 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _791 = _777 * _787;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _793;
    float _797 = trunc(_783);
    int _799 = int(_797);
    float _801 = -_777;
    float _803 = _801 + 1.0;
    float _805 = _745 * _765;
    float _807 = in.m_52.x;
    float _809 = in.m_52.y;
    float _811 = fma(_781, _805, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _813 = fma(_795, _805, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _815 = _811 * _791;
    float _817 = _813 * _791;
    int _819 = _799 << 4;
    int _821 = _819 + 1712;
    float _823 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].x, _815);
    float _825 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].y, _817);
    float _827 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[144].x, _823);
    float _829 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[144].y, _825);
    float _831 = _827 * _807;
    float _833 = _829 * _809;
    bool _835 = !_789;
    float _851;
    if (!_835)
    {
        float _837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _839 = _625 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _843 = _841 * _837;
        float _845 = floor(_843);
        float _847 = -_845;
        float _849 = _843 + _847;
        _851 = _849;
        _853 = true;
    }
    else
    {
        float _855 = float(_95);
        float _857 = 1.0 / _855;
        float _859 = _129 * _857;
        _851 = _859;
    }
    _853 = false;
    float _861 = _851;
    uint _864 = uint(int(uint(_821) >> uint(2)));
    uint _866 = uint(int(uint(int(_864)) >> uint(2)));
    int _868 = int(_864) & 3;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[int(_866)][_868];
    int _872 = int(_864) + 1;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    int _876 = _872 & 3;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[int(_874)][_876];
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _882 = _861 + _880;
    bool _884 = _861 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _886 = isnan(_861);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _900 = _861 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _902 = isnan(_861);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    int _912 = _821 + 8;
    uint _914 = uint(int(uint(_912) >> uint(2)));
    uint _916 = uint(int(uint(int(_914)) >> uint(2)));
    int _918 = int(_914) & 3;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[int(_916)][_918];
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _922;
    float _926 = -_894;
    float _928 = _926 + 1.0;
    bool _930 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _932 = 1.0 / _898;
    float _934 = _910 * _928;
    float _936 = -_910;
    float _938 = _936 + 1.0;
    float _940 = _924 * _932;
    float _942 = fma(_940, _882, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _944 = _942 * _934;
    float _946 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[115].x, _944);
    float _948 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[116].x, _946);
    float _950 = _870 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _952 = _878 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _954 = _948 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _920 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _962 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _964 = !_930;
    float _982;
    float _984;
    if (!_964)
    {
        float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _968 = _625 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _970 = float(_95);
        float _972 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _974 = _972 * _966;
        float _976 = floor(_974);
        float _978 = -_976;
        float _980 = _974 + _978;
        _982 = _970;
        _984 = _980;
        _986 = true;
    }
    else
    {
        float _988 = float(_95);
        float _990 = 1.0 / _988;
        float _992 = _129 * _990;
        _982 = _988;
        _984 = _992;
    }
    _986 = false;
    float _994 = _982;
    float _996 = _984;
    float _998 = in.m_56.z;
    float _1000 = _625 * 2.0;
    float _1002 = _441 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1004 = _441 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1006 = in.m_56.y;
    float _1008 = _441 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1010 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1012 = log2(_1010);
    float _1014 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1004);
    float _1016 = _619 * _619;
    float _1018 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1008);
    float _1020 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1002);
    float _1022 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1014);
    float _1024 = fma(_621, _621, _1016);
    float _1026 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1018);
    float _1028 = floor(_1000);
    float _1030 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1020);
    float _1032 = fma(_623, _623, _1024);
    float _1034 = _1022 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1036 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _211);
    float _1038 = rsqrt(_1032);
    float _1040 = _833 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1042 = _998 * 2.0;
    float _1044 = _625 + _998;
    float _1046 = _1006 * 2.0;
    float _1048 = _1006 + _998;
    float _1050 = floor(_1042);
    bool _1052 = _1028 > 0.0;
    float _1054 = _1044 + (-1.0);
    bool _1056 = _1028 >= 0.0;
    bool _1058 = isnan(_1028);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.0);
    bool _1064 = _1060 || _1062;
    float _1066 = _1048 + (-1.0);
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1070 = _1068 != 0;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1074 = _1072 != 0;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1078 = _1076 != 0;
    float _1080 = floor(_1046);
    float _1082 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1084 = _1064 ? 0 : 1;
    float _1086 = _1038 * _621;
    bool _1088 = !_1070;
    int _1090 = _1088 ? 0 : 1;
    float _1092 = _1038 * _619;
    bool _1094 = !_1074;
    int _1096 = _1094 ? 0 : 1;
    float _1098 = _1038 * _623;
    bool _1100 = _1050 > 0.0;
    float _1102 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1104 = _1050 >= 0.0;
    bool _1106 = isnan(_1050);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(0.0);
    bool _1112 = _1108 || _1110;
    float _1114 = _129 * _1012;
    int _1116 = abs(_1096);
    bool _1118 = _1080 > 0.0;
    float _1120 = exp2(_1114);
    bool _1122 = _1080 >= 0.0;
    bool _1124 = isnan(_1080);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan(0.0);
    bool _1130 = _1126 || _1128;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1134 = 1.0 + _1132;
    float _1136 = in.m_58.x;
    float _1138 = in.m_58.y;
    float _1140 = in.m_58.z;
    int _1142 = ~_1084;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    int _1148 = _1146;
    float _1150 = _998;
    if (!_1052)
    {
        int _1152 = ~_1084;
        int _1154 = _1152 + 1;
        _1148 = _1154;
    }
    int _1156 = _1148;
    float _1158 = 1.0 / _1134;
    int _1160 = abs(_1090);
    float _1162 = float(_1116);
    float _1164 = float(_1156);
    int _1166 = _1112 ? 0 : 1;
    float _1168 = -_1120;
    float _1170 = _1168 + 1.0;
    bool _1172 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1174 = isnan(0.0);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1180 = _1176 || _1178;
    float _1182 = _1162 * _1164;
    int _1184 = ~_1166;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    int _1190 = _1188;
    if (!_1100)
    {
        int _1192 = ~_1166;
        int _1194 = _1192 + 1;
        _1190 = _1194;
    }
    int _1196 = _1190;
    float _1198 = _1182 * (-2.0);
    float _1200 = _1180 ? _1170 : 0.0;
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1204 = _1034 + _1202;
    float _1206 = float(_1196);
    float _1208 = fma(_1198, _1138, _1138);
    float _1210 = _1200 * _1158;
    float _1212 = _1006 + (-0.5);
    int _1214 = _1130 ? 0 : 1;
    float _1216 = fma(_1082, _1198, _1082);
    float _1218 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1220 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1208);
    float _1222 = _625 + _1006;
    int _1224 = ~_1214;
    int _1226 = _1224 + 1;
    int _1228 = _1226 + 1;
    float _1230 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1232 = _1228;
    if (!_1118)
    {
        int _1234 = ~_1214;
        int _1236 = _1234 + 1;
        _1232 = _1236;
    }
    int _1238 = _1232;
    float _1240 = _1222 + (-1.0);
    bool _1242 = !_1078;
    int _1244 = _1242 ? 0 : 1;
    float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1248 = _1218 + _1246;
    float _1250 = _1204 * _1204;
    float _1252 = float(_1160);
    float _1254 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1256 = abs(_1244);
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1260 = _1230 + _1258;
    float _1262 = fma(_1248, _1248, _1250);
    bool _1264 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1266 = isnan(1.0);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1272 = _1268 || _1270;
    float _1274 = _1252 * _1206;
    float _1276 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1254);
    float _1278 = fma(_1260, _1260, _1262);
    bool _1280 = !_1272;
    float _1282 = _1280 ? _129 : _1210;
    float _1284 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1286 = float(_1256);
    float _1288 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1276);
    float _1290 = float(_1238);
    float _1292 = rsqrt(_1278);
    float _1294 = _625 + (-0.5);
    float _1296 = fma(_1282, _1216, _1220);
    float _1298 = abs(_1288);
    bool _1300 = _1298 > 0.99989998340606689453125;
    float _1302 = _1286 * _1290;
    float _1304 = _1274 * (-2.0);
    float _1306 = _1296 * 0.15915493667125701904296875;
    float _1308 = _1302 * (-2.0);
    float _1310 = fma(_1304, _1136, _1136);
    float _1312 = fma(_1284, _1304, _1284);
    float _1314 = _1306 * 6.283185482025146484375;
    float _1316 = sin(_1314);
    float _1318 = fma(_1308, _1140, _1140);
    float _1320 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1310);
    float _1322 = fma(_1102, _1308, _1102);
    float _1324 = _998 + (-0.5);
    float _1326 = _1204 * _1292;
    float _1328 = fma(_1282, _1312, _1320);
    float _1330 = 0.0;
    float _1332 = _1324;
    float _1334 = _1326;
    if (!_1300)
    {
        _1330 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1336 = _1330;
    float _1338 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1318);
    float _1340 = -_1326;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1204);
    float _1344 = _1328 * 0.15915493667125701904296875;
    float _1346 = _1248 * _1292;
    float _1348 = fma(_1282, _1322, _1338);
    float _1350 = _1342 * _1342;
    float _1352 = _1342;
    float _1354 = _1336;
    if (_1300)
    {
        _1352 = 0.001000000047497451305389404296875;
    }
    float _1356 = _1352;
    float _1358 = -_1346;
    float _1360 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1248);
    float _1362 = _1260 * _1292;
    float _1364 = _1344 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = fma(_1360, _1360, _1350);
    float _1370 = -_1362;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1260);
    float _1374 = _1362;
    if (_1300)
    {
        float _1376 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1354 = _1376;
    }
    float _1378 = _1354;
    float _1380 = 0.0;
    if (!_1300)
    {
        _1380 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1382 = _1380;
    float _1384 = _1382;
    if (_1300)
    {
        float _1386 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1384 = _1386;
    }
    float _1388 = _1384;
    float _1390 = fma(_1372, _1372, _1368);
    float _1392 = _1344 * 6.283185482025146484375;
    float _1394 = cos(_1392);
    if (!_1300)
    {
        _1332 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1396 = _1332;
    float _1398 = _1348 * 0.15915493667125701904296875;
    float _1400 = _1396;
    if (_1300)
    {
        float _1402 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1400 = _1402;
    }
    float _1404 = _1400;
    float _1406 = -_1388;
    float _1408 = _1092 * _1406;
    float _1410 = -_1404;
    float _1412 = _1086 * _1410;
    float _1414 = -_1378;
    float _1416 = _1098 * _1414;
    float _1418 = -_1404;
    float _1420 = -_1408;
    float _1422 = fma(_1098, _1418, _1420);
    float _1424 = _1306 * 6.283185482025146484375;
    float _1426 = cos(_1424);
    float _1428 = -_1378;
    float _1430 = -_1412;
    float _1432 = fma(_1092, _1428, _1430);
    float _1434 = -_1388;
    float _1436 = -_1416;
    float _1438 = fma(_1086, _1434, _1436);
    float _1440 = _1366 * _1316;
    float _1442 = _1394 * _1316;
    float _1444 = _1438 * _1438;
    float _1446 = sqrt(_1390);
    float _1448 = fma(_1422, _1422, _1444);
    float _1450 = fma(_1432, _1432, _1448);
    float _1452 = _1398 * 6.283185482025146484375;
    float _1454 = sin(_1452);
    float _1456 = _1394 * _1426;
    float _1458 = _1366 * _1426;
    float _1460 = rsqrt(_1450);
    float _1462 = _1292 * _1446;
    float _1464 = _831 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1466 = _1040 * _1462;
    float _1468 = _1464 * _1462;
    float _1470 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1472 = _1470 * 0.5;
    float _1474 = _1398 * 6.283185482025146484375;
    float _1476 = cos(_1474);
    float _1478 = fma(_1454, _1456, _1440);
    float _1480 = fma(_1454, _1440, _1456);
    float _1482 = fma(_129, 0.014999999664723873138427734375, _625);
    float _1484 = _1468 * _1036;
    float _1486 = _1478 * _1098;
    float _1488 = _1478 * _1086;
    float _1490 = _1478 * _1092;
    float _1492 = _1438 * _1460;
    float _1494 = floor(_1482);
    float _1496 = _1422 * _1460;
    float _1498 = _1432 * _1460;
    float _1500 = _1086 * _1492;
    float _1502 = -_1442;
    float _1504 = fma(_1454, _1458, _1502);
    float _1506 = -_1458;
    float _1508 = fma(_1454, _1442, _1506);
    float _1510 = _1394 * _1476;
    float _1512 = _1426 * _1476;
    float _1514 = _1366 * _1476;
    float _1516 = _1316 * _1476;
    float _1518 = _1510 * _1098;
    float _1520 = fma(_1512, _1498, _1486);
    float _1522 = -_1500;
    float _1524 = fma(_1092, _1496, _1522);
    float _1526 = _1508 * _1098;
    float _1528 = -_1454;
    float _1530 = fma(_1528, _1498, _1518);
    float _1532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_207));
    float _1534 = fma(_1504, _1524, _1520);
    float _1536 = _1510 * _1086;
    float _1538 = _1092 * _1498;
    float _1540 = fma(_1516, _1498, _1526);
    float _1542 = fma(_1514, _1524, _1530);
    float _1544 = -_1454;
    float _1546 = fma(_1544, _1496, _1536);
    float _1548 = -_1538;
    float _1550 = fma(_1098, _1492, _1548);
    float _1552 = _1466 * _1532;
    float _1554 = fma(_1494, -0.1500000059604644775390625, 1.0);
    float _1556 = fma(_1480, _1524, _1540);
    float _1558 = fma(_1512, _1496, _1488);
    float _1560 = _1508 * _1086;
    float _1562 = fma(_1514, _1550, _1546);
    float _1564 = _1552 * _1542;
    float _1566 = precise::max(_1554, 0.20000000298023223876953125);
    float _1568 = fma(_1504, _1550, _1558);
    float _1570 = fma(_1516, _1496, _1560);
    float _1572 = _1552 * _1562;
    float _1574 = fma(_1484, _1534, _1564);
    float _1576 = precise::min(_1566, 1.0);
    float _1578 = fma(_1480, _1550, _1570);
    float _1580 = fma(_1484, _1568, _1572);
    float _1582 = fma(_1472, _1556, _1574);
    float _1584 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1586 = _1510 * _1092;
    float _1588 = fma(_1472, _1578, _1580);
    float _1590 = fma(_1582, _1576, _1230);
    float _1592 = _1098 * _1496;
    float _1594 = -_1454;
    float _1596 = fma(_1594, _1492, _1586);
    float _1598 = fma(_1588, _1576, _1218);
    float _1600 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1590);
    float _1602 = -_1592;
    float _1604 = fma(_1086, _1498, _1602);
    float _1606 = _1508 * _1092;
    float _1608 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1598);
    float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1612 = _1600 + _1610;
    float _1614 = fma(_1512, _1492, _1490);
    float _1616 = fma(_1514, _1604, _1596);
    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1620 = _1608 + _1618;
    float _1622 = _1612 * _1612;
    float _1624 = fma(_1516, _1492, _1606);
    float _1626 = fma(_1504, _1604, _1614);
    float _1628 = _1552 * _1616;
    float _1630 = fma(_1620, _1620, _1622);
    float _1632 = fma(_1480, _1604, _1624);
    float _1634 = -_1346;
    float _1636 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _1638 = fma(_1484, _1626, _1628);
    float _1640 = sqrt(_1630);
    float _1642 = fma(_1472, _1632, _1638);
    float _1644 = fma(_1642, _1576, _1034);
    float _1646 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1644);
    bool _1648 = _1640 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1652 = _1650 != 0;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1656 = _1654 != 0;
    int _1658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1660 = _1658 != 0;
    int _1662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1664 = _1662 != 0;
    bool _1666 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1668 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan(0.5);
    bool _1674 = _1670 || _1672;
    bool _1676 = !_1656;
    int _1678 = _1676 ? 0 : 1;
    bool _1680 = !_1652;
    int _1682 = _1680 ? 0 : 1;
    bool _1684 = !_1660;
    int _1686 = _1684 ? 0 : 1;
    bool _1688 = !_1664;
    int _1690 = _1688 ? 0 : 1;
    float _1692 = _1644;
    float _1694 = _1600;
    float _1696 = _1608;
    float _1698 = _1620;
    float _1700 = _1480;
    if (!_1648)
    {
        _1692 = _1646;
    }
    float _1702 = _1692;
    bool _1704 = !_1648;
    float _1706 = _1702;
    if (!_1704)
    {
        float _1708 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1712 = _1640 + _1710;
        float _1714 = _1646 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = rsqrt(_1630);
        float _1718 = _1712 * _1708;
        float _1720 = _1718 * 0.15915493667125701904296875;
        float _1722 = _1720 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        float _1726 = _1720 * 6.283185482025146484375;
        float _1728 = cos(_1726);
        float _1730 = fma(_1724, _1714, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1732 = _1716 * _1730;
        float _1734 = _1728 + (-1.0);
        float _1736 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1738 = fma(_1620, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1740 = fma(_1612, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1742 = fma(_1646, _1728, _1736);
        _1706 = _1742;
        _1694 = _1740;
        _1696 = _1738;
    }
    float _1744 = _1706;
    float _1746 = _1694;
    float _1748 = _1696;
    float _1750 = -_1326;
    float _1752 = fma(_1750, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1744);
    float _1754 = -_1362;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1746);
    float _1758 = -_1326;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    float _1762 = -_1362;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    float _1766 = -_1346;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1748);
    float _1770 = _1768;
    float _1772 = _1756;
    float _1774 = _1748;
    if (_1674)
    {
        _1374 = _1752;
    }
    float _1776 = _1374;
    float _1778 = _1776;
    if (_1674)
    {
        _1334 = _1756;
    }
    float _1780 = _1334;
    float _1782 = _1780;
    if (!_1674)
    {
        float _1784 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1786 = _1760 + _1784;
        float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1790 = _1636 + _1788;
        float _1792 = 1.0 / _1462;
        float _1794 = -_1218;
        float _1796 = _1794 + _1748;
        float _1798 = _1786 * _1786;
        float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1802 = _1764 + _1800;
        float _1804 = -_1034;
        float _1806 = _1804 + _1744;
        float _1808 = -_1230;
        float _1810 = _1808 + _1746;
        float _1812 = fma(_1790, _1790, _1798);
        float _1814 = fma(_1802, _1802, _1812);
        float _1816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1818 = sqrt(_1814);
        float _1820 = precise::min(_1818, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1822 = _1820 * _1816;
        float _1824 = _1822 * _1792;
        float _1826 = fma(_1796, _1824, _1636);
        float _1828 = fma(_1806, _1824, _1760);
        float _1830 = fma(_1810, _1824, _1764);
        _1778 = _1828;
        _1770 = _1826;
        _1782 = _1830;
        _1772 = _1824;
        _1698 = _1798;
    }
    float _1832 = _1778;
    float _1834 = _1770;
    float _1836 = _1782;
    float _1838 = _1772;
    float _1840 = _1698;
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1844 = _1832 + _1842;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1848 = _1834 + _1846;
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1852 = _1836 + _1850;
    float _1854 = _1844 * _1844;
    float _1856 = fma(_1848, _1848, _1854);
    float _1858 = fma(_1852, _1852, _1856);
    float _1860 = rsqrt(_1858);
    float _1862 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1864 = _1848 * _1862;
    float _1866 = _1852 * _1862;
    float _1868 = _1864 * _1864;
    float _1870 = _1866 * _1866;
    float _1872 = _1868 + _1870;
    float _1874 = sqrt(_1872);
    bool _1876 = _1874 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1878 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1880 = _1874 + _1878;
    float _1882 = _1838;
    float _1884 = _1872;
    float _1886 = _1880;
    float _1888 = _1844;
    float _1890 = _1864;
    float _1892 = _1866;
    float _1894 = _1868;
    float _1896 = _1870;
    if (_1876)
    {
        float _1898 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1882 = _1898;
    }
    float _1900 = _1882;
    if (_1876)
    {
        float _1902 = rsqrt(_1872);
        _1884 = _1902;
    }
    float _1904 = _1884;
    if (_1876)
    {
        float _1906 = _1880 * _1900;
        _1886 = _1906;
    }
    float _1908 = _1886;
    if (_1876)
    {
        float _1910 = _1908 * 0.15915493667125701904296875;
        _1774 = _1910;
    }
    float _1912 = _1774;
    float _1914 = _1612;
    if (_1876)
    {
        float _1916 = _1912 * 6.283185482025146484375;
        float _1918 = sin(_1916);
        _1914 = _1918;
    }
    float _1920 = _1914;
    float _1922 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1924 = precise::max(0.0, _1922);
    float _1926 = _1840;
    float _1928 = _1924;
    float _1930 = _1922;
    if (_1876)
    {
        float _1932 = _1912 * 6.283185482025146484375;
        float _1934 = cos(_1932);
        _1926 = _1934;
    }
    float _1936 = _1926;
    float _1938 = -_1862;
    float _1940 = -_1924;
    float _1942 = fma(_1844, _1938, _1940);
    if (_1876)
    {
        float _1944 = _1942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1888 = _1944;
    }
    float _1946 = _1888;
    float _1948 = _1946;
    if (_1876)
    {
        float _1950 = fma(_1920, _1946, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1928 = _1950;
    }
    float _1952 = _1928;
    float _1954 = _1952;
    if (!_1876)
    {
        _1948 = _1942;
    }
    float _1956 = _1948;
    float _1958 = sqrt(_1858);
    float _1960 = _1956;
    if (_1876)
    {
        float _1962 = _1936 + (-1.0);
        _1930 = _1962;
    }
    float _1964 = _1930;
    if (_1876)
    {
        float _1966 = _1904 * _1952;
        _1700 = _1966;
    }
    float _1968 = _1700;
    if (_1876)
    {
        float _1970 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _1970;
    }
    float _1972 = _1954;
    if (_1876)
    {
        float _1974 = _1864 * _1968;
        _1890 = _1974;
    }
    float _1976 = _1890;
    if (_1876)
    {
        float _1978 = _1866 * _1968;
        _1892 = _1978;
    }
    float _1980 = _1892;
    float _1982 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1876)
    {
        float _1984 = fma(_1942, _1936, _1972);
        _1960 = _1984;
    }
    float _1986 = _1960;
    if (_1876)
    {
        float _1988 = _1976 * _1976;
        _1894 = _1988;
    }
    float _1990 = _1894;
    if (_1876)
    {
        float _1992 = _1980 * _1980;
        _1896 = _1992;
    }
    float _1994 = _1896;
    float _1996 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1998 = fma(_1986, _1986, _1990);
    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2002 = fma(_1958, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2000);
    float _2004 = precise::clamp(_2002, 0.0, 1.0);
    float _2006 = _1998 + _1994;
    float _2008 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1982);
    float _2010 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2012 = -_2004;
    float _2014 = _2012 + 1.0;
    float _2016 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2018 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2008);
    float _2020 = rsqrt(_2006);
    float _2022 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2024 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2010);
    float _2026 = _2018 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2028 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2016);
    float _2030 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2022);
    float _2032 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2024);
    float _2034 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2036 = abs(_2014);
    float _2038 = log2(_2036);
    float _2040 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2030);
    float _2042 = _2032 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2044 = -_2034;
    float _2046 = fma(_2044, _1996, 1.0);
    float _2048 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2028);
    float _2050 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2052 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2054 = _2020 * _1976;
    float _2056 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2058 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2052);
    float _2060 = _2020 * _1986;
    float _2062 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2064 = _2020 * _1980;
    float _2066 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2058);
    float _2068 = log2(_2046);
    float _2070 = -_2062;
    float _2072 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2070);
    float _2074 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2076 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2066);
    float _2078 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2080 = -_2064;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2072);
    float _2084 = exp2(_2074);
    float _2086 = fma(_2082, -0.5, 0.5);
    float _2088 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2090 = fma(_2082, 0.5, 0.5);
    float _2092 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2078);
    float _2094 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2088);
    float _2096 = fma(_2090, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2098 = 1.0 / _2076;
    float _2100 = _2060 + 1.0;
    float _2102 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2094);
    float _2104 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2092);
    float _2106 = fma(_2090, _2096, -0.212114393711090087890625);
    float _2108 = _2068 * 0.693147182464599609375;
    float _2110 = sqrt(_2086);
    float _2112 = -_2060;
    float _2114 = fma(_2084, _2100, _2112);
    float _2116 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2102);
    float _2118 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2104);
    float _2120 = fma(_2090, _2106, 1.570728778839111328125);
    float _2122 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2124 = fma(_2114, 0.5, 0.5);
    float _2126 = _2116 * _2098;
    float _2128 = _2118 * _2098;
    float _2130 = fma(_2126, 0.5, 0.5);
    float _2132 = fma(_2128, -0.5, 0.5);
    float _2134 = _2110 * 0.636619746685028076171875;
    float _2136 = -_2120;
    float _2138 = fma(_2134, _2136, 1.0);
    float3 _6385 = float3(_2130, _2132, _2122);
    float _2140 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6385, float3(0.0), isnan(_6385)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6385, float3(0.0), isnan(_6385)), level(0.0)).x;
    float3 _6396 = float3(_2130, _2132, _2122);
    float4 _2143 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6396, float3(0.0), isnan(_6396)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6396, float3(0.0), isnan(_6396)), level(0.0)).xyzw;
    float _2145 = _2143.x;
    float _2147 = _2143.y;
    float _2149 = _2143.z;
    float _2151 = _2143.w;
    float2 _6413 = float2(_2138, _2124);
    float3 _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6413, float2(0.0), isnan(_6413)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6413, float2(0.0), isnan(_6413)), level(0.0)).xyz;
    float _2157 = _2155.x;
    float _2159 = _2155.y;
    float _2161 = _2155.z;
    float _2163 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2165 = int(_2163);
    out.m_60.x = _956;
    out.m_60.y = _958;
    out.m_60.z = _962;
    out.m_60.w = _954;
    float _2167 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2169 = _625 > 0.5;
    float _2171 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2173 = _2171 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2175 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2177 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2179 = _2175 || _2177;
    bool _2181 = isnan(0.5);
    bool _2183 = _2179 || _2181;
    float _2185 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2187 = int(_2185);
    out.m_62.x = _1834;
    out.m_62.y = _1832;
    out.m_62.z = _1836;
    int _2189 = abs(_1678);
    bool _2191 = _1006 > 0.5;
    out.m_64.y = _1466;
    float _2193 = float(_2165);
    float _2195 = 1.0 / _994;
    float _2197 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2199 = _2197 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2201 = float(uint(_2187));
    float _2203 = 1.0 / _2193;
    int _2205 = ~_2187;
    int _2207 = _2205 + 1;
    float _2209 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2211 = 1.0 / _2201;
    float _2213 = _129 * _2203;
    float _2215 = 1.0 / _2173;
    int _2217 = as_type<int>(_2211) + (-2);
    float _2219 = trunc(_2213);
    int _2221 = int(_2219);
    float _2223 = 1.0 / _2199;
    float _2225 = float(uint(_2221));
    float _2227 = exp2(_2167);
    float _2229 = float(_2221);
    float _2231 = as_type<float>(_2217) * _2225;
    int _2233 = ~_2187;
    int _2235 = _2233 + 1;
    float _2237 = trunc(_2231);
    float _2239 = precise::max(_2237, 0.0);
    uint _2241 = uint(_2239);
    float _2243 = -_2227;
    float _2245 = _2243 + 1.0;
    int _2247 = _2235 * int(_2241);
    int _2249 = _2247 + _2221;
    float _2251 = in.m_56.w;
    float _2253 = float(uint(_2249));
    float _2255 = as_type<float>(_2217) * _2253;
    int _2257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2259 = _2257 != 0;
    float _2261 = trunc(_2255);
    float _2263 = precise::max(_2261, 0.0);
    uint _2265 = uint(_2263);
    bool _2267 = !_2259;
    float _2269 = _2267 ? 1.2345600128173828125 : 1.0;
    bool _2271 = !_2259;
    float _2273 = _2271 ? _1006 : _625;
    float _2275 = _2269 * _2273;
    float _2277 = float(_2187);
    bool _2279 = _2251 > 0.5;
    float _2281 = floor(_2275);
    int _2283 = int(_2241) + int(_2265);
    bool _2285 = _2229 >= _2277;
    bool _2287 = isnan(_2229);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan(_2277);
    bool _2293 = _2289 || _2291;
    float _2295 = float(_2293);
    int _2297 = _2207 * _2283;
    int _2299 = _2297 + _2221;
    float _2301 = trunc(_2295);
    int _2303 = int(_2301);
    float _2305 = _625 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2307 = uint(_2299) >= uint(_2187);
    bool _2309 = !_2307;
    int _2311 = _2309 ? 0 : (-1);
    float _2313 = -_2281;
    float _2315 = _2275 + _2313;
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2319 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2317;
    int _2321 = ~_2283;
    int _2323 = _2321 + _2311;
    int _2325 = _2323 + 1;
    float _2327 = _129 * _2277;
    bool _2329 = _2187 == 0;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2333 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2335 = _2319 * _2215;
    int _2337 = _2187 * _2325;
    int _2339 = _2337 + _2221;
    float _2341 = _2315 * _2277;
    float _2343 = fma(_2333, -2.0, _2209);
    float _2345 = _2327 * _2195;
    int _2347 = ~_2303;
    int _2349 = _2347 + 1;
    int _2351 = _2349 + 1;
    float _2353 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2355 = _2353 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2357 = !_2329;
    int _2359 = _2357 ? _2339 : (-1);
    float _2361 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2363 = trunc(_2341);
    int _2365 = int(_2363);
    float _2367 = -_2331;
    float _2369 = fma(_2305, 2.0, _2367);
    int _2371 = _2187 + (-1);
    int _2373 = _2359 * _2351;
    float _2375 = _2305;
    if (!_2259)
    {
        _2375 = _1006;
    }
    float _2377 = _2375;
    float _2379 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2361);
    float _2381 = _2377;
    if (_2259)
    {
        _2381 = _625;
    }
    float _2383 = _2381;
    float _2385 = _2355 * _2223;
    int _2387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2389 = _2387 != 0;
    float _2391 = trunc(_2345);
    int _2393 = int(_2391);
    int _2395 = _2303 * _2371;
    int _2397 = _2395 + _2373;
    bool _2399 = !_2389;
    float _2401 = _2399 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2403 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2379);
    int _2405 = abs(_1682);
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2409 = abs(as_type<int>(_2401));
    float _2411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2413 = _998 > 0.5;
    float _2415 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2407);
    float _2417 = _2401;
    if (!_2259)
    {
        _2417 = _998;
    }
    float _2419 = _2417;
    int _2421 = _2397 * _2189;
    int _2423 = abs(_1686);
    float _2425 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2415);
    float _2427 = _2419;
    if (_2259)
    {
        _2427 = _1006;
    }
    float _2429 = _2427;
    float _2431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_2259)
    {
        _1150 = _1006;
    }
    float _2433 = _1150;
    int _2435 = _2365 * _2409;
    int _2437 = _2435 + _2221;
    float _2439 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2441 = _996 + _2439;
    float _2443 = -_211;
    int _2445 = _2169 ? as_type<int>(_2443) : as_type<int>(_211);
    float _2447 = -_129;
    float _2449 = fma(_2447, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2369);
    int _2451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2453 = _2451 != 0;
    int _2455 = _2393 * _2405;
    int _2457 = _2455 + _2421;
    float _2459 = _2411 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2461 = abs(_1690);
    float _2463 = fma(_2335, _2441, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2465 = !_2453;
    float _2467 = _2465 ? _211 : as_type<float>(_2445);
    int _2469 = _2437 * _2423;
    int _2471 = _2469 + _2457;
    float _2473 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2475 = _996 + _2473;
    int _2477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2479 = _2477 != 0;
    float _2481 = _2431 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2483 = _2467 + 0.5;
    float _2485 = -as_type<float>(_207);
    int _2487 = _2191 ? as_type<int>(_2485) : _207;
    int _2489 = _2365 * _2461;
    int _2491 = _2489 + _2471;
    float _2493 = fma(_2459, _2483, _2449);
    float _2495 = fma(_2385, _2475, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2497 = !_2479;
    float _2499 = _2497 ? as_type<float>(_207) : as_type<float>(_2487);
    float _2501 = _2429 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2503 = float(uint(_2491));
    float _2505 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2507 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2343);
    float _2509 = _2499 + (-0.5);
    float _2511 = float(uint(_2437));
    float _2513 = as_type<float>(_2217) * _2503;
    bool _2515 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2517 = isnan(_996);
    bool _2519 = _2515 || _2517;
    bool _2521 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2523 = _2519 || _2521;
    float _2525 = float(_2523);
    float _2527 = -_2481;
    float _2529 = -_2507;
    float _2531 = fma(_2527, _2509, _2529);
    int _2533 = ~_2187;
    int _2535 = _2533 + 1;
    float _2537 = trunc(_2513);
    float _2539 = precise::max(_2537, 0.0);
    uint _2541 = uint(_2539);
    bool _2543 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2545 = isnan(_996);
    bool _2547 = _2543 || _2545;
    bool _2549 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2551 = _2547 || _2549;
    float _2553 = float(_2551);
    float _2555 = -_2525;
    float _2557 = _2555 + 1.0;
    float _2559 = fma(_2433, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2505);
    bool _2561 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2563 = isnan(_996);
    bool _2565 = _2561 || _2563;
    bool _2567 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2569 = _2565 || _2567;
    float _2571 = float(_2569);
    float _2573 = _2553 * _2557;
    float _2575 = -_2553;
    float _2577 = _2575 + 1.0;
    float _2579 = as_type<float>(_2217) * _2511;
    float _2581 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2583 = _2571 * _2577;
    float _2585 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2587 = fma(_2383, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2581);
    float _2589 = trunc(_2579);
    float _2591 = precise::max(_2589, 0.0);
    uint _2593 = uint(_2591);
    int _2595 = _2535 * int(_2541);
    int _2597 = _2595 + _2491;
    float _2599 = _2383 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2601 = _2463 * _2583;
    float _2603 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2605 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2587);
    float _2607 = float(uint(_2597));
    float _2609 = -_2585;
    float _2611 = fma(_2599, 2.0, _2609);
    float _2613 = -_2571;
    float _2615 = _2613 + 1.0;
    int _2617 = ~_2187;
    int _2619 = _2617 + 1;
    float _2621 = fma(_2501, -2.0, _2603);
    float _2623 = as_type<float>(_2217) * _2607;
    float _2625 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2627 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2629 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2559);
    float _2631 = -_129;
    float _2633 = fma(_2631, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2611);
    int _2635 = _2619 * int(_2593);
    int _2637 = _2635 + _2437;
    float _2639 = trunc(_2623);
    float _2641 = precise::max(_2639, 0.0);
    uint _2643 = uint(_2641);
    float _2645 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2625);
    float _2647 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2621);
    float _2649 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2627);
    float _2651 = float(uint(_2637));
    float _2653 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2645);
    int _2655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2657 = _2655 != 0;
    float _2659 = fma(_2615, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2601);
    float _2661 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2649);
    float _2663 = as_type<float>(_2217) * _2651;
    int _2665 = ~_2187;
    int _2667 = _2665 + 1;
    float _2669 = _2653 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2671 = fma(_2495, _2573, _2659);
    float _2673 = trunc(_2663);
    float _2675 = precise::max(_2673, 0.0);
    uint _2677 = uint(_2675);
    float _2679 = -_2403;
    float _2681 = _2679 + 1.0;
    int _2683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2685 = _2683 != 0;
    float _2687 = fma(_2525, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2671);
    int _2689 = int(_2541) + int(_2643);
    float _2691 = -_2681;
    float _2693 = fma(_2467, _2691, _2493);
    float _2695 = -_211;
    int _2697 = _2413 ? as_type<int>(_2695) : as_type<int>(_211);
    float _2699 = -_2629;
    float _2701 = _2699 + 1.0;
    float _2703 = 1.0 / _2669;
    int _2705 = _2667 * _2689;
    int _2707 = _2705 + _2491;
    bool _2709 = !_2657;
    float _2711 = _2709 ? _211 : as_type<float>(_2697);
    float _2713 = _2661 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2715 = _2687 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2717 = uint(_2707) >= uint(_2187);
    float _2719 = _2711 + 0.5;
    int _2721 = int(_2593) + int(_2677);
    float _2723 = _2713 + _2669;
    bool _2725 = !_2717;
    int _2727 = _2725 ? 0 : (-1);
    float _2729 = fma(_2719, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2633);
    float _2731 = -as_type<float>(_207);
    int _2733 = _2279 ? as_type<int>(_2731) : _207;
    out.m_66.w = _2715;
    int _2735 = ~_2689;
    int _2737 = _2735 + _2727;
    int _2739 = _2737 + 1;
    float _2741 = _2723 * _2703;
    float _2743 = _2741 * 0.5;
    float _2745 = _2467;
    float _2747 = _2723;
    float _2749 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_2183)
    {
        _2745 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2751 = _2745;
    int _2753 = _2187 * _2739;
    int _2755 = _2753 + _2491;
    float _2757 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2759 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2757);
    float _2761 = -_2425;
    float _2763 = _2761 + 1.0;
    bool _2765 = !_2685;
    float _2767 = _2765 ? as_type<float>(_207) : as_type<float>(_2733);
    bool _2769 = !_2329;
    int _2771 = _2769 ? _2755 : (-1);
    float _2773 = fma(_2499, _2763, _2531);
    float _2775 = -_2605;
    float _2777 = _2775 + 1.0;
    int _2779 = ~_2187;
    int _2781 = _2779 + 1;
    float _2783 = 1.0 / _2759;
    int _2785 = _2771 >> 31;
    float _2787 = -_2777;
    float _2789 = fma(_2711, _2787, _2729);
    float _2791 = as_type<float>(_2785);
    float _2793 = _2751;
    float _2795 = _2789;
    if (!_2183)
    {
        _2747 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2797 = _2747;
    float _2799 = _2767 + (-0.5);
    int _2801 = _2785 & 3;
    float _2803 = as_type<float>(_2801);
    if (!_2183)
    {
        float _2805 = -_2751;
        float _2807 = _2805 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2791 = _2807;
    }
    float _2809 = _2791;
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2813 = _2811 != 0;
    int _2815 = _2781 * _2721;
    int _2817 = _2815 + _2437;
    int _2819 = _2771 + _2801;
    float _2821 = as_type<float>(_2817);
    if (!_2183)
    {
        float _2823 = -_2797;
        float _2825 = _2823 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2749 = _2825;
    }
    float _2827 = _2749;
    if (!_2183)
    {
        float _2829 = 1.0 / _2809;
        _2803 = _2829;
    }
    float _2831 = _2803;
    float _2833 = -_2799;
    float _2835 = -_2647;
    float _2837 = fma(_2833, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2835);
    int _2839 = _2819 >> 2;
    bool _2841 = uint(_2817) >= uint(_2187);
    float _2843 = fma(_2767, _2701, _2837);
    int _2845 = _2839 << 4;
    int _2847 = _2845 + 512;
    float _2849 = as_type<float>(_2839);
    if (!_2183)
    {
        float _2851 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2853 = -_2751;
        float _2855 = fma(_2783, _2851, _2853);
        _2793 = _2855;
    }
    float _2857 = _2793;
    float _2859 = _2425;
    if (!_2183)
    {
        float _2861 = 1.0 / _2827;
        _2859 = _2861;
    }
    float _2863 = _2859;
    if (!_2183)
    {
        float _2865 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2867 = -_2797;
        float _2869 = fma(_2783, _2865, _2867);
        _2821 = _2869;
    }
    float _2871 = _2821;
    uint _2873 = uint(int(uint(_2847) >> uint(2)));
    uint _2875 = uint(int(uint(int(_2873)) >> uint(2)));
    int _2877 = int(_2873) & 3;
    float _2879 = (*spvDescriptorSet0.vp_c9)._m0[int(_2875)][_2877];
    int _2881 = int(_2873) + 1;
    uint _2883 = uint(int(uint(_2881) >> uint(2)));
    int _2885 = _2881 & 3;
    float _2887 = (*spvDescriptorSet0.vp_c9)._m0[int(_2883)][_2885];
    out.m_68.x = _2693;
    out.m_68.y = _2773;
    out.m_68.z = _2789;
    out.m_68.w = _2843;
    if (_2183)
    {
        _2849 = 1.0;
    }
    float _2889 = _2849;
    int _2891 = _2771 & 3;
    bool _2893 = _2891 != 0;
    bool _2895 = !_2841;
    int _2897 = _2895 ? 0 : (-1);
    int _2899 = ~_2721;
    int _2901 = _2899 + _2897;
    int _2903 = _2901 + 1;
    float _2905 = _2889;
    if (!_2183)
    {
        float _2907 = _2871 * _2863;
        float _2909 = precise::clamp(_2907, 0.0, 1.0);
        _2905 = _2909;
    }
    float _2911 = _2905;
    int _2913 = _2847 + 8;
    uint _2915 = uint(int(uint(_2913) >> uint(2)));
    uint _2917 = uint(int(uint(int(_2915)) >> uint(2)));
    int _2919 = int(_2915) & 3;
    float _2921 = (*spvDescriptorSet0.vp_c9)._m0[int(_2917)][_2919];
    int _2923 = int(_2915) + 1;
    uint _2925 = uint(int(uint(_2923) >> uint(2)));
    int _2927 = _2923 & 3;
    float _2929 = (*spvDescriptorSet0.vp_c9)._m0[int(_2925)][_2927];
    float _2931 = as_type<float>(_207) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    if (!_2183)
    {
        float _2933 = _2857 * _2831;
        float _2935 = precise::clamp(_2933, 0.0, 1.0);
        _2795 = _2935;
    }
    float _2937 = _2795;
    int _2939 = _2187 * _2903;
    int _2941 = _2939 + _2437;
    float _2943 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2945 = _1562 * _2931;
    int _2947 = _2771 & 3;
    bool _2949 = _2947 != 0;
    float _2951 = _1616 * _2931;
    if (_2183)
    {
        _217 = 1.0;
    }
    float _2953 = _217;
    float _2955 = _2953;
    if (!_2183)
    {
        float _2957 = -_2937;
        float _2959 = _2957 + 1.0;
        _2955 = _2959;
    }
    float _2961 = _2955;
    bool _2963 = uint(_2947) > 1u;
    float _2965 = _1542 * _2931;
    bool _2967 = _2947 != 3;
    float _2969 = _2911 * _2961;
    int _2971 = _2893 ? 0 : 1;
    float _2973 = fma(_1568, _2943, _2945);
    bool _2975 = uint(_2947) >= 2u;
    float _2977 = _2969 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2979 = fma(_1534, _2943, _2965);
    int _2981 = ~_2971;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    float _2987 = fma(_1626, _2943, _2951);
    int _2989 = _2975 ? 0 : 1;
    float _2991 = _713 * _2977;
    int _2993 = _2985;
    if (!_2963)
    {
        int _2995 = ~_2971;
        int _2997 = _2995 + 1;
        _2993 = _2997;
    }
    int _2999 = _2993;
    float _3001 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3003 = _2947 != 3;
    float _3005 = _1556 + _2979;
    bool _3007 = !_2949;
    int _3009 = _3007 ? 0 : 1;
    float _3011 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3001);
    int _3013 = abs(_2999);
    float _3015 = _2991 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _3017 = ~_2989;
    int _3019 = _3017 + 1;
    int _3021 = _3019 + 1;
    float _3023 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3011);
    int _3025 = abs(_3009);
    int _3027 = _3021;
    if (_2967)
    {
        int _3029 = ~_2989;
        int _3031 = _3029 + 1;
        _3027 = _3031;
    }
    int _3033 = _3027;
    float _3035 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3023);
    out.m_45.x = _3015;
    int _3037 = abs(_3033);
    int _3039 = ~_3013;
    int _3041 = _3039 + 1;
    int _3043 = _3041 + 1;
    bool _3045 = !_3003;
    int _3047 = _3045 ? 0 : (-1);
    int _3049 = ~_3025;
    int _3051 = _3049 + 1;
    int _3053 = _3051 + 1;
    int _3055 = _3043 * as_type<int>(_2887);
    bool _3057 = !_2813;
    int _3059 = _3057 ? 0 : 1;
    int _3061 = _3053 * as_type<int>(_2879);
    int _3063 = _3061 + _3055;
    int _3065 = abs(_3047);
    int _3067 = ~_3037;
    int _3069 = _3067 + 1;
    int _3071 = _3069 + 1;
    int _3073 = abs(_3059);
    int _3075 = ~_3065;
    int _3077 = _3075 + 1;
    int _3079 = _3077 + 1;
    int _3081 = _3071 * as_type<int>(_2921);
    int _3083 = _3081 + _3063;
    float _3085 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3087 = !_2329;
    int _3089 = _3087 ? _2941 : (-1);
    int _3091 = _3079 * as_type<int>(_2929);
    int _3093 = _3091 + _3083;
    float _3095 = _1578 + _2973;
    int _3097 = ~_3073;
    int _3099 = _3097 + 1;
    int _3101 = _3099 + 1;
    float _3103 = _1632 + _2987;
    bool _3105 = _2911 > 0.0;
    bool _3107 = isnan(_2911);
    bool _3109 = _3105 || _3107;
    bool _3111 = isnan(0.0);
    bool _3113 = _3109 || _3111;
    float _3115 = _3085 * _2140;
    float _3117 = -_3085;
    float _3119 = _3117 + 1.0;
    int _3121 = _3093 * _3101;
    float _3123 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _3125 = _3035 + _3123;
    bool _3127 = _2961 <= 0.0;
    bool _3129 = !_3113;
    bool _3131 = _3127 || _3129;
    out.m_70.x = _3095;
    out.m_70.y = _3103;
    out.m_70.z = _3005;
    int _3133 = _3089 * _3073;
    int _3135 = _3133 + _3121;
    float _3137 = _2076 + _3125;
    float _3139 = _2161 * _3115;
    float _3141 = _2151 * _3119;
    float _3143 = _3137 * 0.5;
    float _3145 = float(_3135);
    float _3147 = fma(_2151, _3139, _2149);
    out.gl_Position.x = _2116;
    out.gl_Position.y = _2118;
    out.gl_Position.z = _3125;
    out.gl_Position.w = _2076;
    float _3149 = _2151 * _3115;
    out.m_72.z = _3143;
    out.m_72.w = _2076;
    float _3151 = fma(_2157, _3149, _2145);
    float _3153 = fma(_2159, _3149, _2147);
    out.m_74.y = _3145;
    out.m_76.x = _3151;
    out.m_76.y = _3153;
    out.m_76.z = _3147;
    out.m_76.w = _3141;
    if (!_3131)
    {
        return out;
    }
    out.m_45.x = 0.0;
    float _3155 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3155;
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
    out.m_66 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_64 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_72 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_45 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_68 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_54 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_74 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_70 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_62 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_76 = float4(0.0, 0.0, 0.0, 1.0);
    bool _986 = false;
    bool _853 = false;
    bool _733 = false;
    bool _497 = false;
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
        float _3212 = as_type<float>(_111);
        out.gl_Position.z = _3212;
    }
    if (!_99)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
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
        _105 = _135;
    }
    float _137 = _105;
    bool _139 = _129 >= _137;
    bool _141 = !_125;
    bool _143 = _139 || _141;
    float _145 = _137;
    if (_143)
    {
        _145 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _147 = _145;
    if (_143)
    {
        out.m_45.x = 0.0;
    }
    if (_143)
    {
        float _149 = _147 * 5.0;
        _113 = as_type<int>(_149);
    }
    int _151 = _113;
    float _153 = as_type<float>(_151);
    if (_143)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _3283 = as_type<float>(_151);
        out.gl_Position.z = _3283;
    }
    if (_143)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _155 = as_type<float>(int(gl_VertexIndex));
    float _157 = _129 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _159 = in.m_47.x;
    float _161 = in.m_47.y;
    float _163 = in.m_47.z;
    bool _165 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _167 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _169 = _165 || _167;
    bool _171 = isnan(1.0);
    bool _173 = _169 || _171;
    float _175 = _157;
    if (!_173)
    {
        float _177 = _157 * _157;
        float _179 = _177 * 0.5;
        _153 = _179;
    }
    float _181 = _153;
    float _183 = 0.0;
    float _185 = _181;
    if (!_173)
    {
        float _187 = _129 * _129;
        float _189 = _187 * 0.5;
        _183 = _189;
    }
    float _191 = _183;
    if (!_173)
    {
        float _193 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _185 = _193;
    }
    float _195 = _185;
    int _197 = as_type<int>(_155) & 1;
    bool _199 = _197 != 0;
    int _201 = as_type<int>(_155) & 2;
    bool _203 = _201 != 0;
    bool _205 = !_203;
    int _207 = _205 ? (-1090519040) : 1056964608;
    bool _209 = !_199;
    float _211 = _209 ? (-0.5) : 0.5;
    bool _213 = !_173;
    float _215 = _195;
    float _217 = _211;
    if (!_213)
    {
        float _219 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _221 = log2(_219);
        float _223 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _225 = _223 + 1.0;
        float _227 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = _157 * _221;
        float _231 = 1.0 / _225;
        float _233 = _227 * 0.693147182464599609375;
        float _235 = exp2(_229);
        float _237 = 1.0 / _233;
        float _239 = _235 + (-1.0);
        float _241 = -_239;
        float _243 = fma(_241, _237, _157);
        float _245 = _243 * _231;
        float _247 = _245 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _131 = _237;
        _215 = _247;
        _133 = _235;
    }
    float _249 = _131;
    float _251 = _215;
    float _253 = _133;
    bool _255 = !_173;
    float _257 = _249;
    float _259 = _253;
    if (!_255)
    {
        float _261 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _263 = log2(_261);
        float _265 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _267 = _265 + 1.0;
        float _269 = 1.0 / _267;
        float _271 = _157 * _263;
        float _273 = exp2(_271);
        float _275 = -_273;
        float _277 = _275 + 1.0;
        float _279 = _277 * _269;
        _257 = _273;
        _259 = _267;
        _175 = _279;
    }
    float _281 = _257;
    float _283 = _259;
    float _285 = _175;
    float _287 = _283;
    float _289 = _281;
    if (!_173)
    {
        _287 = _129;
    }
    float _291 = _287;
    float _293 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _295 = _291;
    if (!_173)
    {
        float _297 = _191 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _289 = _297;
    }
    float _299 = _289;
    bool _301 = !_173;
    float _303 = _299;
    if (!_301)
    {
        float _305 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _307 = log2(_305);
        float _309 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _311 = _129 * _307;
        float _313 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _315 = _313 + 1.0;
        float _317 = 1.0 / _315;
        float _319 = _309 * 0.693147182464599609375;
        float _321 = exp2(_311);
        float _323 = 1.0 / _319;
        float _325 = _321 + (-1.0);
        float _327 = -_325;
        float _329 = fma(_327, _323, _129);
        float _331 = _329 * _317;
        float _333 = _331 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _303 = _333;
    }
    float _335 = _303;
    bool _337 = !_173;
    if (!_337)
    {
        float _339 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _341 = log2(_339);
        float _343 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _345 = _343 + 1.0;
        float _347 = 1.0 / _345;
        float _349 = _129 * _341;
        float _351 = exp2(_349);
        float _353 = -_351;
        float _355 = _353 + 1.0;
        float _357 = _355 * _347;
        _295 = _357;
    }
    float _359 = _295;
    float _361 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _363 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _365 = fma(_285, _161, _293);
    float _367 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _369 = fma(_359, _161, _361);
    float _371 = fma(_285, _159, _363);
    float _373 = _251 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _375 = _335 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _377 = fma(_359, _159, _367);
    float _379 = -_369;
    float _381 = _365 + _379;
    float _383 = fma(_285, _163, _373);
    float _385 = fma(_359, _163, _375);
    float _387 = -_377;
    float _389 = _371 + _387;
    float _391 = _381 * _381;
    float _393 = in.m_52.w;
    float _395 = -_385;
    float _397 = _383 + _395;
    float _399 = _381 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _401 = fma(_389, _389, _391);
    out.m_54.y = as_type<float>(_207);
    float _403 = _381 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _405 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[4].x, _399);
    float _407 = fma(_397, _397, _401);
    float _409 = _381 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _411 = in.m_42.x;
    float _413 = in.m_42.y;
    float _415 = in.m_42.z;
    float _417 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[5].x, _403);
    float _419 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[4].z, _405);
    float _421 = fma(_389, (*spvDescriptorSet0.vp_c10)._m0[6].x, _409);
    float _423 = sqrt(_407);
    float _425 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[6].z, _421);
    bool _427 = _423 >= 9.9999999747524270787835121154785e-07;
    bool _429 = isnan(_423);
    bool _431 = _427 || _429;
    bool _433 = isnan(9.9999999747524270787835121154785e-07);
    bool _435 = _431 || _433;
    float _437 = fma(_397, (*spvDescriptorSet0.vp_c10)._m0[5].z, _417);
    float _439 = fma(_371, _393, _411);
    float _441 = fma(_365, _393, _413);
    float _443 = fma(_383, _393, _415);
    float _445 = _365;
    float _447 = _393;
    float _449 = _425;
    if (_435)
    {
        _445 = _419;
    }
    float _451 = _445;
    float _453 = _451;
    if (_435)
    {
        _447 = _437;
    }
    float _455 = _447;
    float _457 = _455;
    if (!_435)
    {
        bool _459 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[16].w;
        bool _461 = !_459;
        if (!_461)
        {
            float _463 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
            float _465 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[4].y;
            float _467 = (*spvDescriptorSet0.vp_c9)._m0[16].y * (*spvDescriptorSet0.vp_c10)._m0[6].y;
            float _469 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[5].x, _463);
            float _471 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[4].x, _465);
            float _473 = fma((*spvDescriptorSet0.vp_c9)._m0[16].x, (*spvDescriptorSet0.vp_c10)._m0[6].x, _467);
            float _475 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[5].z, _469);
            float _477 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[4].z, _471);
            float _479 = fma((*spvDescriptorSet0.vp_c9)._m0[16].z, (*spvDescriptorSet0.vp_c10)._m0[6].z, _473);
            float _481 = _475 * _475;
            float _483 = fma(_477, _477, _481);
            float _485 = fma(_479, _479, _483);
            float _487 = rsqrt(_485);
            float _489 = _487 * 9.9999999747524270787835121154785e-07;
            float _491 = _477 * _489;
            float _493 = _475 * _489;
            float _495 = _479 * _489;
            _457 = _493;
            _453 = _491;
            _449 = _495;
            _497 = true;
        }
        else
        {
            float _499 = _161 * _161;
            float _501 = fma(_159, _159, _499);
            float _503 = fma(_163, _163, _501);
            float _505 = sqrt(_503);
            bool _507 = _505 >= 9.9999999747524270787835121154785e-07;
            bool _509 = isnan(_505);
            bool _511 = _507 || _509;
            bool _513 = isnan(9.9999999747524270787835121154785e-07);
            bool _515 = _511 || _513;
            if (!_515)
            {
                float _517 = _413 * _413;
                float _519 = fma(_411, _411, _517);
                float _521 = fma(_415, _415, _519);
                float _523 = sqrt(_521);
                bool _525 = _523 >= 9.9999999747524270787835121154785e-07;
                bool _527 = isnan(_523);
                bool _529 = _525 || _527;
                bool _531 = isnan(9.9999999747524270787835121154785e-07);
                bool _533 = _529 || _531;
                if (!_533)
                {
                    float _535 = (*spvDescriptorSet0.vp_c10)._m0[5].y * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _537 = fma((*spvDescriptorSet0.vp_c10)._m0[4].y, (*spvDescriptorSet0.vp_c10)._m0[4].y, _535);
                    float _539 = fma((*spvDescriptorSet0.vp_c10)._m0[6].y, (*spvDescriptorSet0.vp_c10)._m0[6].y, _537);
                    float _541 = rsqrt(_539);
                    float _543 = _541 * 9.9999999747524270787835121154785e-07;
                    float _545 = _543 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _547 = _543 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _549 = _543 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    _457 = _547;
                    _453 = _545;
                    _449 = _549;
                    _497 = true;
                }
                else
                {
                    float _551 = _413 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                    float _553 = _413 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                    float _555 = _413 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                    float _557 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[5].x, _551);
                    float _559 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[4].x, _553);
                    float _561 = fma(_411, (*spvDescriptorSet0.vp_c10)._m0[6].x, _555);
                    float _563 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[5].z, _557);
                    float _565 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[4].z, _559);
                    float _567 = fma(_415, (*spvDescriptorSet0.vp_c10)._m0[6].z, _561);
                    float _569 = _563 * _563;
                    float _571 = fma(_565, _565, _569);
                    float _573 = fma(_567, _567, _571);
                    float _575 = rsqrt(_573);
                    float _577 = _575 * 9.9999999747524270787835121154785e-07;
                    float _579 = _565 * _577;
                    float _581 = _563 * _577;
                    float _583 = _567 * _577;
                    _457 = _581;
                    _453 = _579;
                    _449 = _583;
                    _497 = true;
                }
            }
            else
            {
                float _585 = _161 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
                float _587 = _161 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
                float _589 = _161 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
                float _591 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[5].x, _585);
                float _593 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[4].x, _587);
                float _595 = fma(_159, (*spvDescriptorSet0.vp_c10)._m0[6].x, _589);
                float _597 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[5].z, _591);
                float _599 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[4].z, _593);
                float _601 = fma(_163, (*spvDescriptorSet0.vp_c10)._m0[6].z, _595);
                float _603 = _597 * _597;
                float _605 = fma(_599, _599, _603);
                float _607 = fma(_601, _601, _605);
                float _609 = rsqrt(_607);
                float _611 = _609 * 9.9999999747524270787835121154785e-07;
                float _613 = _599 * _611;
                float _615 = _597 * _611;
                float _617 = _601 * _611;
                _457 = _615;
                _453 = _613;
                _449 = _617;
            }
        }
    }
    _497 = false;
    float _619 = _457;
    float _621 = _453;
    float _623 = _449;
    float _625 = in.m_56.x;
    float _627 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[19].z;
    float _629 = _129 + (*spvDescriptorSet0.vp_c9)._m0[20].z;
    int _631 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2;
    bool _633 = _631 != 0;
    int _635 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 4;
    bool _637 = _635 != 0;
    float _639 = _629 * _627;
    float _641 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[20].x, _639);
    float _643 = _641 * 6.283185482025146484375;
    float _645 = floor(_641);
    int _647 = 1 & as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x);
    bool _649 = _647 != 0;
    float _651 = _643 * 0.15915493667125701904296875;
    bool _653 = !_633;
    int _655 = _653 ? 0 : 1;
    bool _657 = !_637;
    int _659 = _657 ? 0 : 1;
    int _661 = abs(_655);
    float _663 = _651 * 6.283185482025146484375;
    float _665 = cos(_663);
    bool _667 = !_649;
    int _669 = _667 ? 0 : 1;
    int _671 = abs(_659);
    bool _673 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _675 = -_645;
    float _677 = _641 + _675;
    int _679 = abs(_669);
    float _681 = float(_661);
    float _683 = -_677;
    float _685 = fma(_683, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    bool _687 = _677 < 0.5;
    float _689 = float(_687);
    float _691 = float(_671);
    float _693 = abs(_685);
    float _695 = _681 * _693;
    float _697 = fma(_665, 0.5, 0.5);
    float _699 = float(_679);
    float _701 = -_689;
    float _703 = fma(_701, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _705 = -_697;
    float _707 = fma(_705, (*spvDescriptorSet0.vp_c9)._m0[19].x, 1.0);
    float _709 = fma(_699, _707, _695);
    float _711 = abs(_703);
    float _713 = fma(_691, _711, _709);
    bool _715 = !_673;
    float _731;
    if (!_715)
    {
        float _717 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _719 = _625 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _721 = fma(_719, (*spvDescriptorSet0.vp_c9)._m0[12].x, _129);
        float _723 = _721 * _717;
        float _725 = floor(_723);
        float _727 = -_725;
        float _729 = _723 + _727;
        _731 = _729;
        _733 = true;
    }
    else
    {
        float _735 = float(_95);
        float _737 = 1.0 / _735;
        float _739 = _129 * _737;
        _731 = _739;
    }
    _733 = false;
    float _741 = _731;
    float _743 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _745 = _741 + _743;
    float _747 = float(as_type<int>((*spvDescriptorSet0.vp_c9)._m0[8].x));
    float _749 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _751 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _749;
    bool _753 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _755 = isnan(_741);
    bool _757 = _753 || _755;
    bool _759 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _761 = _757 || _759;
    float _763 = float(_761);
    float _765 = 1.0 / _751;
    bool _767 = _741 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _769 = isnan(_741);
    bool _771 = _767 || _769;
    bool _773 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _775 = _771 || _773;
    float _777 = float(_775);
    float _779 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _781 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _779;
    float _783 = _747 * _625;
    float _785 = -_763;
    float _787 = _785 + 1.0;
    bool _789 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].y;
    float _791 = _777 * _787;
    float _793 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _795 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _793;
    float _797 = trunc(_783);
    int _799 = int(_797);
    float _801 = -_777;
    float _803 = _801 + 1.0;
    float _805 = _745 * _765;
    float _807 = in.m_52.x;
    float _809 = in.m_52.y;
    float _811 = fma(_781, _805, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _813 = fma(_795, _805, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _815 = _811 * _791;
    float _817 = _813 * _791;
    int _819 = _799 << 4;
    int _821 = _819 + 1712;
    float _823 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].x, _815);
    float _825 = fma(_803, (*spvDescriptorSet0.vp_c9)._m0[143].y, _817);
    float _827 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[144].x, _823);
    float _829 = fma(_763, (*spvDescriptorSet0.vp_c9)._m0[144].y, _825);
    float _831 = _827 * _807;
    float _833 = _829 * _809;
    bool _835 = !_789;
    float _851;
    if (!_835)
    {
        float _837 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].y;
        float _839 = _625 * (*spvDescriptorSet0.vp_c9)._m0[12].z;
        float _841 = fma(_839, (*spvDescriptorSet0.vp_c9)._m0[11].y, _129);
        float _843 = _841 * _837;
        float _845 = floor(_843);
        float _847 = -_845;
        float _849 = _843 + _847;
        _851 = _849;
        _853 = true;
    }
    else
    {
        float _855 = float(_95);
        float _857 = 1.0 / _855;
        float _859 = _129 * _857;
        _851 = _859;
    }
    _853 = false;
    float _861 = _851;
    uint _864 = uint(int(uint(_821) >> uint(2)));
    uint _866 = uint(int(uint(int(_864)) >> uint(2)));
    int _868 = int(_864) & 3;
    float _870 = (*spvDescriptorSet0.vp_c9)._m0[int(_866)][_868];
    int _872 = int(_864) + 1;
    uint _874 = uint(int(uint(_872) >> uint(2)));
    int _876 = _872 & 3;
    float _878 = (*spvDescriptorSet0.vp_c9)._m0[int(_874)][_876];
    float _880 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _882 = _861 + _880;
    bool _884 = _861 >= (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _886 = isnan(_861);
    bool _888 = _884 || _886;
    bool _890 = isnan((*spvDescriptorSet0.vp_c9)._m0[116].w);
    bool _892 = _888 || _890;
    float _894 = float(_892);
    float _896 = -(*spvDescriptorSet0.vp_c9)._m0[115].w;
    float _898 = _896 + (*spvDescriptorSet0.vp_c9)._m0[116].w;
    bool _900 = _861 >= (*spvDescriptorSet0.vp_c9)._m0[115].w;
    bool _902 = isnan(_861);
    bool _904 = _900 || _902;
    bool _906 = isnan((*spvDescriptorSet0.vp_c9)._m0[115].w);
    bool _908 = _904 || _906;
    float _910 = float(_908);
    int _912 = _821 + 8;
    uint _914 = uint(int(uint(_912) >> uint(2)));
    uint _916 = uint(int(uint(int(_914)) >> uint(2)));
    int _918 = int(_914) & 3;
    float _920 = (*spvDescriptorSet0.vp_c9)._m0[int(_916)][_918];
    float _922 = -(*spvDescriptorSet0.vp_c9)._m0[115].x;
    float _924 = (*spvDescriptorSet0.vp_c9)._m0[116].x + _922;
    float _926 = -_894;
    float _928 = _926 + 1.0;
    bool _930 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[11].w;
    float _932 = 1.0 / _898;
    float _934 = _910 * _928;
    float _936 = -_910;
    float _938 = _936 + 1.0;
    float _940 = _924 * _932;
    float _942 = fma(_940, _882, (*spvDescriptorSet0.vp_c9)._m0[115].x);
    float _944 = _942 * _934;
    float _946 = fma(_938, (*spvDescriptorSet0.vp_c9)._m0[115].x, _944);
    float _948 = fma(_894, (*spvDescriptorSet0.vp_c9)._m0[116].x, _946);
    float _950 = _870 * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _952 = _878 * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _954 = _948 * (*spvDescriptorSet0.vp_c10)._m0[0].w;
    float _956 = _950 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _958 = _952 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _960 = _920 * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _962 = _960 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    bool _964 = !_930;
    float _982;
    float _984;
    if (!_964)
    {
        float _966 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[11].w;
        float _968 = _625 * (*spvDescriptorSet0.vp_c9)._m0[13].x;
        float _970 = float(_95);
        float _972 = fma(_968, (*spvDescriptorSet0.vp_c9)._m0[11].w, _129);
        float _974 = _972 * _966;
        float _976 = floor(_974);
        float _978 = -_976;
        float _980 = _974 + _978;
        _982 = _970;
        _984 = _980;
        _986 = true;
    }
    else
    {
        float _988 = float(_95);
        float _990 = 1.0 / _988;
        float _992 = _129 * _990;
        _982 = _988;
        _984 = _992;
    }
    _986 = false;
    float _994 = _982;
    float _996 = _984;
    float _998 = in.m_56.z;
    float _1000 = _625 * 2.0;
    float _1002 = _441 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _1004 = _441 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _1006 = in.m_56.y;
    float _1008 = _441 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _1010 = abs((*spvDescriptorSet0.vp_c9)._m0[197].w);
    float _1012 = log2(_1010);
    float _1014 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[5].x, _1004);
    float _1016 = _619 * _619;
    float _1018 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[6].x, _1008);
    float _1020 = fma(_439, (*spvDescriptorSet0.vp_c10)._m0[4].x, _1002);
    float _1022 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[5].z, _1014);
    float _1024 = fma(_621, _621, _1016);
    float _1026 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[6].z, _1018);
    float _1028 = floor(_1000);
    float _1030 = fma(_443, (*spvDescriptorSet0.vp_c10)._m0[4].z, _1020);
    float _1032 = fma(_623, _623, _1024);
    float _1034 = _1022 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _1036 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _211);
    float _1038 = rsqrt(_1032);
    float _1040 = _833 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _1042 = _998 * 2.0;
    float _1044 = _625 + _998;
    float _1046 = _1006 * 2.0;
    float _1048 = _1006 + _998;
    float _1050 = floor(_1042);
    bool _1052 = _1028 > 0.0;
    float _1054 = _1044 + (-1.0);
    bool _1056 = _1028 >= 0.0;
    bool _1058 = isnan(_1028);
    bool _1060 = _1056 || _1058;
    bool _1062 = isnan(0.0);
    bool _1064 = _1060 || _1062;
    float _1066 = _1048 + (-1.0);
    int _1068 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 268435456;
    bool _1070 = _1068 != 0;
    int _1072 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 536870912;
    bool _1074 = _1072 != 0;
    int _1076 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1073741824;
    bool _1078 = _1076 != 0;
    float _1080 = floor(_1046);
    float _1082 = fma(_1066, (*spvDescriptorSet0.vp_c9)._m0[198].y, (*spvDescriptorSet0.vp_c9)._m0[197].y);
    int _1084 = _1064 ? 0 : 1;
    float _1086 = _1038 * _621;
    bool _1088 = !_1070;
    int _1090 = _1088 ? 0 : 1;
    float _1092 = _1038 * _619;
    bool _1094 = !_1074;
    int _1096 = _1094 ? 0 : 1;
    float _1098 = _1038 * _623;
    bool _1100 = _1050 > 0.0;
    float _1102 = fma(_1054, (*spvDescriptorSet0.vp_c9)._m0[198].z, (*spvDescriptorSet0.vp_c9)._m0[197].z);
    bool _1104 = _1050 >= 0.0;
    bool _1106 = isnan(_1050);
    bool _1108 = _1104 || _1106;
    bool _1110 = isnan(0.0);
    bool _1112 = _1108 || _1110;
    float _1114 = _129 * _1012;
    int _1116 = abs(_1096);
    bool _1118 = _1080 > 0.0;
    float _1120 = exp2(_1114);
    bool _1122 = _1080 >= 0.0;
    bool _1124 = isnan(_1080);
    bool _1126 = _1122 || _1124;
    bool _1128 = isnan(0.0);
    bool _1130 = _1126 || _1128;
    float _1132 = -(*spvDescriptorSet0.vp_c9)._m0[197].w;
    float _1134 = 1.0 + _1132;
    float _1136 = in.m_58.x;
    float _1138 = in.m_58.y;
    float _1140 = in.m_58.z;
    int _1142 = ~_1084;
    int _1144 = _1142 + 1;
    int _1146 = _1144 + 1;
    int _1148 = _1146;
    float _1150 = _998;
    if (!_1052)
    {
        int _1152 = ~_1084;
        int _1154 = _1152 + 1;
        _1148 = _1154;
    }
    int _1156 = _1148;
    float _1158 = 1.0 / _1134;
    int _1160 = abs(_1090);
    float _1162 = float(_1116);
    float _1164 = float(_1156);
    int _1166 = _1112 ? 0 : 1;
    float _1168 = -_1120;
    float _1170 = _1168 + 1.0;
    bool _1172 = 0.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1174 = isnan(0.0);
    bool _1176 = _1172 || _1174;
    bool _1178 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1180 = _1176 || _1178;
    float _1182 = _1162 * _1164;
    int _1184 = ~_1166;
    int _1186 = _1184 + 1;
    int _1188 = _1186 + 1;
    int _1190 = _1188;
    if (!_1100)
    {
        int _1192 = ~_1166;
        int _1194 = _1192 + 1;
        _1190 = _1194;
    }
    int _1196 = _1190;
    float _1198 = _1182 * (-2.0);
    float _1200 = _1180 ? _1170 : 0.0;
    float _1202 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1204 = _1034 + _1202;
    float _1206 = float(_1196);
    float _1208 = fma(_1198, _1138, _1138);
    float _1210 = _1200 * _1158;
    float _1212 = _1006 + (-0.5);
    int _1214 = _1130 ? 0 : 1;
    float _1216 = fma(_1082, _1198, _1082);
    float _1218 = _1030 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _1220 = fma(_1212, (*spvDescriptorSet0.vp_c9)._m0[196].y, _1208);
    float _1222 = _625 + _1006;
    int _1224 = ~_1214;
    int _1226 = _1224 + 1;
    int _1228 = _1226 + 1;
    float _1230 = _1026 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    int _1232 = _1228;
    if (!_1118)
    {
        int _1234 = ~_1214;
        int _1236 = _1234 + 1;
        _1232 = _1236;
    }
    int _1238 = _1232;
    float _1240 = _1222 + (-1.0);
    bool _1242 = !_1078;
    int _1244 = _1242 ? 0 : 1;
    float _1246 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1248 = _1218 + _1246;
    float _1250 = _1204 * _1204;
    float _1252 = float(_1160);
    float _1254 = _1092 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    int _1256 = abs(_1244);
    float _1258 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1260 = _1230 + _1258;
    float _1262 = fma(_1248, _1248, _1250);
    bool _1264 = 1.0 != (*spvDescriptorSet0.vp_c9)._m0[197].w;
    bool _1266 = isnan(1.0);
    bool _1268 = _1264 || _1266;
    bool _1270 = isnan((*spvDescriptorSet0.vp_c9)._m0[197].w);
    bool _1272 = _1268 || _1270;
    float _1274 = _1252 * _1206;
    float _1276 = fma(_1086, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1254);
    float _1278 = fma(_1260, _1260, _1262);
    bool _1280 = !_1272;
    float _1282 = _1280 ? _129 : _1210;
    float _1284 = fma(_1240, (*spvDescriptorSet0.vp_c9)._m0[198].x, (*spvDescriptorSet0.vp_c9)._m0[197].x);
    float _1286 = float(_1256);
    float _1288 = fma(_1098, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1276);
    float _1290 = float(_1238);
    float _1292 = rsqrt(_1278);
    float _1294 = _625 + (-0.5);
    float _1296 = fma(_1282, _1216, _1220);
    float _1298 = abs(_1288);
    bool _1300 = _1298 > 0.99989998340606689453125;
    float _1302 = _1286 * _1290;
    float _1304 = _1274 * (-2.0);
    float _1306 = _1296 * 0.15915493667125701904296875;
    float _1308 = _1302 * (-2.0);
    float _1310 = fma(_1304, _1136, _1136);
    float _1312 = fma(_1284, _1304, _1284);
    float _1314 = _1306 * 6.283185482025146484375;
    float _1316 = sin(_1314);
    float _1318 = fma(_1308, _1140, _1140);
    float _1320 = fma(_1294, (*spvDescriptorSet0.vp_c9)._m0[196].x, _1310);
    float _1322 = fma(_1102, _1308, _1102);
    float _1324 = _998 + (-0.5);
    float _1326 = _1204 * _1292;
    float _1328 = fma(_1282, _1312, _1320);
    float _1330 = 0.0;
    float _1332 = _1324;
    float _1334 = _1326;
    if (!_1300)
    {
        _1330 = (*spvDescriptorSet0.vp_c10)._m0[8].y;
    }
    float _1336 = _1330;
    float _1338 = fma(_1324, (*spvDescriptorSet0.vp_c9)._m0[196].z, _1318);
    float _1340 = -_1326;
    float _1342 = fma(_1340, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1204);
    float _1344 = _1328 * 0.15915493667125701904296875;
    float _1346 = _1248 * _1292;
    float _1348 = fma(_1282, _1322, _1338);
    float _1350 = _1342 * _1342;
    float _1352 = _1342;
    float _1354 = _1336;
    if (_1300)
    {
        _1352 = 0.001000000047497451305389404296875;
    }
    float _1356 = _1352;
    float _1358 = -_1346;
    float _1360 = fma(_1358, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1248);
    float _1362 = _1260 * _1292;
    float _1364 = _1344 * 6.283185482025146484375;
    float _1366 = sin(_1364);
    float _1368 = fma(_1360, _1360, _1350);
    float _1370 = -_1362;
    float _1372 = fma(_1370, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1260);
    float _1374 = _1362;
    if (_1300)
    {
        float _1376 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[8].z, (*spvDescriptorSet0.vp_c10)._m0[8].y);
        _1354 = _1376;
    }
    float _1378 = _1354;
    float _1380 = 0.0;
    if (!_1300)
    {
        _1380 = (*spvDescriptorSet0.vp_c10)._m0[10].y;
    }
    float _1382 = _1380;
    float _1384 = _1382;
    if (_1300)
    {
        float _1386 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[10].z, (*spvDescriptorSet0.vp_c10)._m0[10].y);
        _1384 = _1386;
    }
    float _1388 = _1384;
    float _1390 = fma(_1372, _1372, _1368);
    float _1392 = _1344 * 6.283185482025146484375;
    float _1394 = cos(_1392);
    if (!_1300)
    {
        _1332 = (*spvDescriptorSet0.vp_c10)._m0[9].y;
    }
    float _1396 = _1332;
    float _1398 = _1348 * 0.15915493667125701904296875;
    float _1400 = _1396;
    if (_1300)
    {
        float _1402 = fma(_1356, (*spvDescriptorSet0.vp_c10)._m0[9].z, (*spvDescriptorSet0.vp_c10)._m0[9].y);
        _1400 = _1402;
    }
    float _1404 = _1400;
    float _1406 = -_1388;
    float _1408 = _1092 * _1406;
    float _1410 = -_1404;
    float _1412 = _1086 * _1410;
    float _1414 = -_1378;
    float _1416 = _1098 * _1414;
    float _1418 = -_1404;
    float _1420 = -_1408;
    float _1422 = fma(_1098, _1418, _1420);
    float _1424 = _1306 * 6.283185482025146484375;
    float _1426 = cos(_1424);
    float _1428 = -_1378;
    float _1430 = -_1412;
    float _1432 = fma(_1092, _1428, _1430);
    float _1434 = -_1388;
    float _1436 = -_1416;
    float _1438 = fma(_1086, _1434, _1436);
    float _1440 = _1366 * _1316;
    float _1442 = _1394 * _1316;
    float _1444 = _1438 * _1438;
    float _1446 = sqrt(_1390);
    float _1448 = fma(_1422, _1422, _1444);
    float _1450 = fma(_1432, _1432, _1448);
    float _1452 = _1398 * 6.283185482025146484375;
    float _1454 = sin(_1452);
    float _1456 = _1394 * _1426;
    float _1458 = _1366 * _1426;
    float _1460 = rsqrt(_1450);
    float _1462 = _1292 * _1446;
    float _1464 = _831 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _1466 = _1040 * _1462;
    float _1468 = _1464 * _1462;
    float _1470 = _1462 * (*spvDescriptorSet0.vp_c9)._m0[18].z;
    float _1472 = _1470 * 0.5;
    float _1474 = _1398 * 6.283185482025146484375;
    float _1476 = cos(_1474);
    float _1478 = fma(_1454, _1456, _1440);
    float _1480 = fma(_1454, _1440, _1456);
    float _1482 = fma(_129, 0.014999999664723873138427734375, _625);
    float _1484 = _1468 * _1036;
    float _1486 = _1478 * _1098;
    float _1488 = _1478 * _1086;
    float _1490 = _1478 * _1092;
    float _1492 = _1438 * _1460;
    float _1494 = floor(_1482);
    float _1496 = _1422 * _1460;
    float _1498 = _1432 * _1460;
    float _1500 = _1086 * _1492;
    float _1502 = -_1442;
    float _1504 = fma(_1454, _1458, _1502);
    float _1506 = -_1458;
    float _1508 = fma(_1454, _1442, _1506);
    float _1510 = _1394 * _1476;
    float _1512 = _1426 * _1476;
    float _1514 = _1366 * _1476;
    float _1516 = _1316 * _1476;
    float _1518 = _1510 * _1098;
    float _1520 = fma(_1512, _1498, _1486);
    float _1522 = -_1500;
    float _1524 = fma(_1092, _1496, _1522);
    float _1526 = _1508 * _1098;
    float _1528 = -_1454;
    float _1530 = fma(_1528, _1498, _1518);
    float _1532 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, as_type<float>(_207));
    float _1534 = fma(_1504, _1524, _1520);
    float _1536 = _1510 * _1086;
    float _1538 = _1092 * _1498;
    float _1540 = fma(_1516, _1498, _1526);
    float _1542 = fma(_1514, _1524, _1530);
    float _1544 = -_1454;
    float _1546 = fma(_1544, _1496, _1536);
    float _1548 = -_1538;
    float _1550 = fma(_1098, _1492, _1548);
    float _1552 = _1466 * _1532;
    float _1554 = fma(_1494, -0.1500000059604644775390625, 1.0);
    float _1556 = fma(_1480, _1524, _1540);
    float _1558 = fma(_1512, _1496, _1488);
    float _1560 = _1508 * _1086;
    float _1562 = fma(_1514, _1550, _1546);
    float _1564 = _1552 * _1542;
    float _1566 = precise::max(_1554, 0.20000000298023223876953125);
    float _1568 = fma(_1504, _1550, _1558);
    float _1570 = fma(_1516, _1496, _1560);
    float _1572 = _1552 * _1562;
    float _1574 = fma(_1484, _1534, _1564);
    float _1576 = precise::min(_1566, 1.0);
    float _1578 = fma(_1480, _1550, _1570);
    float _1580 = fma(_1484, _1568, _1572);
    float _1582 = fma(_1472, _1556, _1574);
    float _1584 = _1494 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _1586 = _1510 * _1092;
    float _1588 = fma(_1472, _1578, _1580);
    float _1590 = fma(_1582, _1576, _1230);
    float _1592 = _1098 * _1496;
    float _1594 = -_1454;
    float _1596 = fma(_1594, _1492, _1586);
    float _1598 = fma(_1588, _1576, _1218);
    float _1600 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[10].y, _1590);
    float _1602 = -_1592;
    float _1604 = fma(_1086, _1498, _1602);
    float _1606 = _1508 * _1092;
    float _1608 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[8].y, _1598);
    float _1610 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1612 = _1600 + _1610;
    float _1614 = fma(_1512, _1492, _1490);
    float _1616 = fma(_1514, _1604, _1596);
    float _1618 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1620 = _1608 + _1618;
    float _1622 = _1612 * _1612;
    float _1624 = fma(_1516, _1492, _1606);
    float _1626 = fma(_1504, _1604, _1614);
    float _1628 = _1552 * _1616;
    float _1630 = fma(_1620, _1620, _1622);
    float _1632 = fma(_1480, _1604, _1624);
    float _1634 = -_1346;
    float _1636 = fma(_1634, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1218);
    float _1638 = fma(_1484, _1626, _1628);
    float _1640 = sqrt(_1630);
    float _1642 = fma(_1472, _1632, _1638);
    float _1644 = fma(_1642, _1576, _1034);
    float _1646 = fma(_1584, (*spvDescriptorSet0.vp_c10)._m0[9].y, _1644);
    bool _1648 = _1640 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    int _1650 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 256;
    bool _1652 = _1650 != 0;
    int _1654 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 512;
    bool _1656 = _1654 != 0;
    int _1658 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 1024;
    bool _1660 = _1658 != 0;
    int _1662 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].x) & 2048;
    bool _1664 = _1662 != 0;
    bool _1666 = (*spvDescriptorSet0.vp_c15)._m0[660].y >= 0.5;
    bool _1668 = isnan((*spvDescriptorSet0.vp_c15)._m0[660].y);
    bool _1670 = _1666 || _1668;
    bool _1672 = isnan(0.5);
    bool _1674 = _1670 || _1672;
    bool _1676 = !_1656;
    int _1678 = _1676 ? 0 : 1;
    bool _1680 = !_1652;
    int _1682 = _1680 ? 0 : 1;
    bool _1684 = !_1660;
    int _1686 = _1684 ? 0 : 1;
    bool _1688 = !_1664;
    int _1690 = _1688 ? 0 : 1;
    float _1692 = _1644;
    float _1694 = _1600;
    float _1696 = _1608;
    float _1698 = _1620;
    float _1700 = _1480;
    if (!_1648)
    {
        _1692 = _1646;
    }
    float _1702 = _1692;
    bool _1704 = !_1648;
    float _1706 = _1702;
    if (!_1704)
    {
        float _1708 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1710 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1712 = _1640 + _1710;
        float _1714 = _1646 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1716 = rsqrt(_1630);
        float _1718 = _1712 * _1708;
        float _1720 = _1718 * 0.15915493667125701904296875;
        float _1722 = _1720 * 6.283185482025146484375;
        float _1724 = sin(_1722);
        float _1726 = _1720 * 6.283185482025146484375;
        float _1728 = cos(_1726);
        float _1730 = fma(_1724, _1714, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1732 = _1716 * _1730;
        float _1734 = _1728 + (-1.0);
        float _1736 = _1734 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1738 = fma(_1620, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1740 = fma(_1612, _1732, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1742 = fma(_1646, _1728, _1736);
        _1706 = _1742;
        _1694 = _1740;
        _1696 = _1738;
    }
    float _1744 = _1706;
    float _1746 = _1694;
    float _1748 = _1696;
    float _1750 = -_1326;
    float _1752 = fma(_1750, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1744);
    float _1754 = -_1362;
    float _1756 = fma(_1754, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1746);
    float _1758 = -_1326;
    float _1760 = fma(_1758, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1034);
    float _1762 = -_1362;
    float _1764 = fma(_1762, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1230);
    float _1766 = -_1346;
    float _1768 = fma(_1766, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1748);
    float _1770 = _1768;
    float _1772 = _1756;
    float _1774 = _1748;
    if (_1674)
    {
        _1374 = _1752;
    }
    float _1776 = _1374;
    float _1778 = _1776;
    if (_1674)
    {
        _1334 = _1756;
    }
    float _1780 = _1334;
    float _1782 = _1780;
    if (!_1674)
    {
        float _1784 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
        float _1786 = _1760 + _1784;
        float _1788 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
        float _1790 = _1636 + _1788;
        float _1792 = 1.0 / _1462;
        float _1794 = -_1218;
        float _1796 = _1794 + _1748;
        float _1798 = _1786 * _1786;
        float _1800 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
        float _1802 = _1764 + _1800;
        float _1804 = -_1034;
        float _1806 = _1804 + _1744;
        float _1808 = -_1230;
        float _1810 = _1808 + _1746;
        float _1812 = fma(_1790, _1790, _1798);
        float _1814 = fma(_1802, _1802, _1812);
        float _1816 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[199].x;
        float _1818 = sqrt(_1814);
        float _1820 = precise::min(_1818, (*spvDescriptorSet0.vp_c9)._m0[199].x);
        float _1822 = _1820 * _1816;
        float _1824 = _1822 * _1792;
        float _1826 = fma(_1796, _1824, _1636);
        float _1828 = fma(_1806, _1824, _1760);
        float _1830 = fma(_1810, _1824, _1764);
        _1778 = _1828;
        _1770 = _1826;
        _1782 = _1830;
        _1772 = _1824;
        _1698 = _1798;
    }
    float _1832 = _1778;
    float _1834 = _1770;
    float _1836 = _1782;
    float _1838 = _1772;
    float _1840 = _1698;
    float _1842 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1844 = _1832 + _1842;
    float _1846 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1848 = _1834 + _1846;
    float _1850 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1852 = _1836 + _1850;
    float _1854 = _1844 * _1844;
    float _1856 = fma(_1848, _1848, _1854);
    float _1858 = fma(_1852, _1852, _1856);
    float _1860 = rsqrt(_1858);
    float _1862 = _1860 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1864 = _1848 * _1862;
    float _1866 = _1852 * _1862;
    float _1868 = _1864 * _1864;
    float _1870 = _1866 * _1866;
    float _1872 = _1868 + _1870;
    float _1874 = sqrt(_1872);
    bool _1876 = _1874 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1878 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1880 = _1874 + _1878;
    float _1882 = _1838;
    float _1884 = _1872;
    float _1886 = _1880;
    float _1888 = _1844;
    float _1890 = _1864;
    float _1892 = _1866;
    float _1894 = _1868;
    float _1896 = _1870;
    if (_1876)
    {
        float _1898 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1882 = _1898;
    }
    float _1900 = _1882;
    if (_1876)
    {
        float _1902 = rsqrt(_1872);
        _1884 = _1902;
    }
    float _1904 = _1884;
    if (_1876)
    {
        float _1906 = _1880 * _1900;
        _1886 = _1906;
    }
    float _1908 = _1886;
    if (_1876)
    {
        float _1910 = _1908 * 0.15915493667125701904296875;
        _1774 = _1910;
    }
    float _1912 = _1774;
    float _1914 = _1612;
    if (_1876)
    {
        float _1916 = _1912 * 6.283185482025146484375;
        float _1918 = sin(_1916);
        _1914 = _1918;
    }
    float _1920 = _1914;
    float _1922 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1924 = precise::max(0.0, _1922);
    float _1926 = _1840;
    float _1928 = _1924;
    float _1930 = _1922;
    if (_1876)
    {
        float _1932 = _1912 * 6.283185482025146484375;
        float _1934 = cos(_1932);
        _1926 = _1934;
    }
    float _1936 = _1926;
    float _1938 = -_1862;
    float _1940 = -_1924;
    float _1942 = fma(_1844, _1938, _1940);
    if (_1876)
    {
        float _1944 = _1942 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1888 = _1944;
    }
    float _1946 = _1888;
    float _1948 = _1946;
    if (_1876)
    {
        float _1950 = fma(_1920, _1946, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1928 = _1950;
    }
    float _1952 = _1928;
    float _1954 = _1952;
    if (!_1876)
    {
        _1948 = _1942;
    }
    float _1956 = _1948;
    float _1958 = sqrt(_1858);
    float _1960 = _1956;
    if (_1876)
    {
        float _1962 = _1936 + (-1.0);
        _1930 = _1962;
    }
    float _1964 = _1930;
    if (_1876)
    {
        float _1966 = _1904 * _1952;
        _1700 = _1966;
    }
    float _1968 = _1700;
    if (_1876)
    {
        float _1970 = _1964 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1954 = _1970;
    }
    float _1972 = _1954;
    if (_1876)
    {
        float _1974 = _1864 * _1968;
        _1890 = _1974;
    }
    float _1976 = _1890;
    if (_1876)
    {
        float _1978 = _1866 * _1968;
        _1892 = _1978;
    }
    float _1980 = _1892;
    float _1982 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    if (_1876)
    {
        float _1984 = fma(_1942, _1936, _1972);
        _1960 = _1984;
    }
    float _1986 = _1960;
    if (_1876)
    {
        float _1988 = _1976 * _1976;
        _1894 = _1988;
    }
    float _1990 = _1894;
    if (_1876)
    {
        float _1992 = _1980 * _1980;
        _1896 = _1992;
    }
    float _1994 = _1896;
    float _1996 = (-1.0) + (*spvDescriptorSet0.vp_c15)._m0[20].x;
    float _1998 = fma(_1986, _1986, _1990);
    float _2000 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _2002 = fma(_1958, (*spvDescriptorSet0.vp_c15)._m0[23].w, _2000);
    float _2004 = precise::clamp(_2002, 0.0, 1.0);
    float _2006 = _1998 + _1994;
    float _2008 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1982);
    float _2010 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _2012 = -_2004;
    float _2014 = _2012 + 1.0;
    float _2016 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _2018 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[2].z, _2008);
    float _2020 = rsqrt(_2006);
    float _2022 = _1832 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _2024 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[1].x, _2010);
    float _2026 = _2018 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _2028 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[3].x, _2016);
    float _2030 = fma(_1834, (*spvDescriptorSet0.vp_c8)._m0[0].x, _2022);
    float _2032 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[1].z, _2024);
    float _2034 = _2026 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _2036 = abs(_2014);
    float _2038 = log2(_2036);
    float _2040 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[0].z, _2030);
    float _2042 = _2032 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _2044 = -_2034;
    float _2046 = fma(_2044, _1996, 1.0);
    float _2048 = fma(_1836, (*spvDescriptorSet0.vp_c8)._m0[3].z, _2028);
    float _2050 = _2040 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _2052 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _2054 = _2020 * _1976;
    float _2056 = _2048 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _2058 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[7].x, _2052);
    float _2060 = _2020 * _1986;
    float _2062 = _2054 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _2064 = _2020 * _1980;
    float _2066 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[7].z, _2058);
    float _2068 = log2(_2046);
    float _2070 = -_2062;
    float _2072 = fma(_2060, (*spvDescriptorSet0.vp_c15)._m0[21].y, _2070);
    float _2074 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _2076 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[7].w, _2066);
    float _2078 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _2080 = -_2064;
    float _2082 = fma(_2080, (*spvDescriptorSet0.vp_c15)._m0[21].z, _2072);
    float _2084 = exp2(_2074);
    float _2086 = fma(_2082, -0.5, 0.5);
    float _2088 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _2090 = fma(_2082, 0.5, 0.5);
    float _2092 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[5].x, _2078);
    float _2094 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[4].x, _2088);
    float _2096 = fma(_2090, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _2098 = 1.0 / _2076;
    float _2100 = _2060 + 1.0;
    float _2102 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[4].z, _2094);
    float _2104 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[5].z, _2092);
    float _2106 = fma(_2090, _2096, -0.212114393711090087890625);
    float _2108 = _2068 * 0.693147182464599609375;
    float _2110 = sqrt(_2086);
    float _2112 = -_2060;
    float _2114 = fma(_2084, _2100, _2112);
    float _2116 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[4].w, _2102);
    float _2118 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[5].w, _2104);
    float _2120 = fma(_2090, _2106, 1.570728778839111328125);
    float _2122 = _2108 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _2124 = fma(_2114, 0.5, 0.5);
    float _2126 = _2116 * _2098;
    float _2128 = _2118 * _2098;
    float _2130 = fma(_2126, 0.5, 0.5);
    float _2132 = fma(_2128, -0.5, 0.5);
    float _2134 = _2110 * 0.636619746685028076171875;
    float _2136 = -_2120;
    float _2138 = fma(_2134, _2136, 1.0);
    float3 _6385 = float3(_2130, _2132, _2122);
    float _2140 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_6385, float3(0.0), isnan(_6385)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_6385, float3(0.0), isnan(_6385)), level(0.0)).x;
    float3 _6396 = float3(_2130, _2132, _2122);
    float4 _2143 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_6396, float3(0.0), isnan(_6396)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_6396, float3(0.0), isnan(_6396)), level(0.0)).xyzw;
    float _2145 = _2143.x;
    float _2147 = _2143.y;
    float _2149 = _2143.z;
    float _2151 = _2143.w;
    float2 _6413 = float2(_2138, _2124);
    float3 _2155 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_6413, float2(0.0), isnan(_6413)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_6413, float2(0.0), isnan(_6413)), level(0.0)).xyz;
    float _2157 = _2155.x;
    float _2159 = _2155.y;
    float _2161 = _2155.z;
    float _2163 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].y);
    int _2165 = int(_2163);
    out.m_60.x = _956;
    out.m_60.y = _958;
    out.m_60.z = _962;
    out.m_60.w = _954;
    float _2167 = _2038 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    bool _2169 = _625 > 0.5;
    float _2171 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2173 = _2171 + (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2175 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _2177 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _2179 = _2175 || _2177;
    bool _2181 = isnan(0.5);
    bool _2183 = _2179 || _2181;
    float _2185 = trunc((*spvDescriptorSet0.vp_c9)._m0[31].x);
    int _2187 = int(_2185);
    out.m_62.x = _1834;
    out.m_62.y = _1832;
    out.m_62.z = _1836;
    int _2189 = abs(_1678);
    bool _2191 = _1006 > 0.5;
    out.m_64.y = _1466;
    float _2193 = float(_2165);
    float _2195 = 1.0 / _994;
    float _2197 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2199 = _2197 + (*spvDescriptorSet0.vp_c9)._m0[133].w;
    float _2201 = float(uint(_2187));
    float _2203 = 1.0 / _2193;
    int _2205 = ~_2187;
    int _2207 = _2205 + 1;
    float _2209 = (*spvDescriptorSet0.vp_c9)._m0[77].y + (*spvDescriptorSet0.vp_c9)._m0[76].w;
    float _2211 = 1.0 / _2201;
    float _2213 = _129 * _2203;
    float _2215 = 1.0 / _2173;
    int _2217 = as_type<int>(_2211) + (-2);
    float _2219 = trunc(_2213);
    int _2221 = int(_2219);
    float _2223 = 1.0 / _2199;
    float _2225 = float(uint(_2221));
    float _2227 = exp2(_2167);
    float _2229 = float(_2221);
    float _2231 = as_type<float>(_2217) * _2225;
    int _2233 = ~_2187;
    int _2235 = _2233 + 1;
    float _2237 = trunc(_2231);
    float _2239 = precise::max(_2237, 0.0);
    uint _2241 = uint(_2239);
    float _2243 = -_2227;
    float _2245 = _2243 + 1.0;
    int _2247 = _2235 * int(_2241);
    int _2249 = _2247 + _2221;
    float _2251 = in.m_56.w;
    float _2253 = float(uint(_2249));
    float _2255 = as_type<float>(_2217) * _2253;
    int _2257 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].z) & 1;
    bool _2259 = _2257 != 0;
    float _2261 = trunc(_2255);
    float _2263 = precise::max(_2261, 0.0);
    uint _2265 = uint(_2263);
    bool _2267 = !_2259;
    float _2269 = _2267 ? 1.2345600128173828125 : 1.0;
    bool _2271 = !_2259;
    float _2273 = _2271 ? _1006 : _625;
    float _2275 = _2269 * _2273;
    float _2277 = float(_2187);
    bool _2279 = _2251 > 0.5;
    float _2281 = floor(_2275);
    int _2283 = int(_2241) + int(_2265);
    bool _2285 = _2229 >= _2277;
    bool _2287 = isnan(_2229);
    bool _2289 = _2285 || _2287;
    bool _2291 = isnan(_2277);
    bool _2293 = _2289 || _2291;
    float _2295 = float(_2293);
    int _2297 = _2207 * _2283;
    int _2299 = _2297 + _2221;
    float _2301 = trunc(_2295);
    int _2303 = int(_2301);
    float _2305 = _625 * (*spvDescriptorSet0.vp_c9)._m0[77].x;
    bool _2307 = uint(_2299) >= uint(_2187);
    bool _2309 = !_2307;
    int _2311 = _2309 ? 0 : (-1);
    float _2313 = -_2281;
    float _2315 = _2275 + _2313;
    float _2317 = -(*spvDescriptorSet0.vp_c9)._m0[131].x;
    float _2319 = (*spvDescriptorSet0.vp_c9)._m0[132].x + _2317;
    int _2321 = ~_2283;
    int _2323 = _2321 + _2311;
    int _2325 = _2323 + 1;
    float _2327 = _129 * _2277;
    bool _2329 = _2187 == 0;
    float _2331 = (*spvDescriptorSet0.vp_c9)._m0[77].x + (*spvDescriptorSet0.vp_c9)._m0[76].z;
    float _2333 = _1006 * (*spvDescriptorSet0.vp_c9)._m0[77].y;
    float _2335 = _2319 * _2215;
    int _2337 = _2187 * _2325;
    int _2339 = _2337 + _2221;
    float _2341 = _2315 * _2277;
    float _2343 = fma(_2333, -2.0, _2209);
    float _2345 = _2327 * _2195;
    int _2347 = ~_2303;
    int _2349 = _2347 + 1;
    int _2351 = _2349 + 1;
    float _2353 = -(*spvDescriptorSet0.vp_c9)._m0[132].x;
    float _2355 = _2353 + (*spvDescriptorSet0.vp_c9)._m0[133].x;
    bool _2357 = !_2329;
    int _2359 = _2357 ? _2339 : (-1);
    float _2361 = (*spvDescriptorSet0.vp_c9)._m0[78].z + (*spvDescriptorSet0.vp_c9)._m0[78].x;
    float _2363 = trunc(_2341);
    int _2365 = int(_2363);
    float _2367 = -_2331;
    float _2369 = fma(_2305, 2.0, _2367);
    int _2371 = _2187 + (-1);
    int _2373 = _2359 * _2351;
    float _2375 = _2305;
    if (!_2259)
    {
        _2375 = _1006;
    }
    float _2377 = _2375;
    float _2379 = fma(_625, (*spvDescriptorSet0.vp_c9)._m0[78].z, _2361);
    float _2381 = _2377;
    if (_2259)
    {
        _2381 = _625;
    }
    float _2383 = _2381;
    float _2385 = _2355 * _2223;
    int _2387 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8192;
    bool _2389 = _2387 != 0;
    float _2391 = trunc(_2345);
    int _2393 = int(_2391);
    int _2395 = _2303 * _2371;
    int _2397 = _2395 + _2373;
    bool _2399 = !_2389;
    float _2401 = _2399 ? 0.0 : 1.4012984643248170709237295832899e-45;
    float _2403 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].z, _2379);
    int _2405 = abs(_1682);
    float _2407 = (*spvDescriptorSet0.vp_c9)._m0[78].w + (*spvDescriptorSet0.vp_c9)._m0[78].y;
    int _2409 = abs(as_type<int>(_2401));
    float _2411 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].z;
    bool _2413 = _998 > 0.5;
    float _2415 = fma(_1006, (*spvDescriptorSet0.vp_c9)._m0[78].w, _2407);
    float _2417 = _2401;
    if (!_2259)
    {
        _2417 = _998;
    }
    float _2419 = _2417;
    int _2421 = _2397 * _2189;
    int _2423 = abs(_1686);
    float _2425 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[77].w, _2415);
    float _2427 = _2419;
    if (_2259)
    {
        _2427 = _1006;
    }
    float _2429 = _2427;
    float _2431 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[80].w;
    if (_2259)
    {
        _1150 = _1006;
    }
    float _2433 = _1150;
    int _2435 = _2365 * _2409;
    int _2437 = _2435 + _2221;
    float _2439 = -(*spvDescriptorSet0.vp_c9)._m0[131].w;
    float _2441 = _996 + _2439;
    float _2443 = -_211;
    int _2445 = _2169 ? as_type<int>(_2443) : as_type<int>(_211);
    float _2447 = -_129;
    float _2449 = fma(_2447, (*spvDescriptorSet0.vp_c9)._m0[76].x, _2369);
    int _2451 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 1;
    bool _2453 = _2451 != 0;
    int _2455 = _2393 * _2405;
    int _2457 = _2455 + _2421;
    float _2459 = _2411 * (*spvDescriptorSet0.vp_c9)._m0[80].x;
    int _2461 = abs(_1690);
    float _2463 = fma(_2335, _2441, (*spvDescriptorSet0.vp_c9)._m0[131].x);
    bool _2465 = !_2453;
    float _2467 = _2465 ? _211 : as_type<float>(_2445);
    int _2469 = _2437 * _2423;
    int _2471 = _2469 + _2457;
    float _2473 = -(*spvDescriptorSet0.vp_c9)._m0[132].w;
    float _2475 = _996 + _2473;
    int _2477 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 2;
    bool _2479 = _2477 != 0;
    float _2481 = _2431 * (*spvDescriptorSet0.vp_c9)._m0[80].y;
    float _2483 = _2467 + 0.5;
    float _2485 = -as_type<float>(_207);
    int _2487 = _2191 ? as_type<int>(_2485) : _207;
    int _2489 = _2365 * _2461;
    int _2491 = _2489 + _2471;
    float _2493 = fma(_2459, _2483, _2449);
    float _2495 = fma(_2385, _2475, (*spvDescriptorSet0.vp_c9)._m0[132].x);
    bool _2497 = !_2479;
    float _2499 = _2497 ? as_type<float>(_207) : as_type<float>(_2487);
    float _2501 = _2429 * (*spvDescriptorSet0.vp_c9)._m0[82].y;
    float _2503 = float(uint(_2491));
    float _2505 = (*spvDescriptorSet0.vp_c9)._m0[83].w + (*spvDescriptorSet0.vp_c9)._m0[83].y;
    float _2507 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[76].y, _2343);
    float _2509 = _2499 + (-0.5);
    float _2511 = float(uint(_2437));
    float _2513 = as_type<float>(_2217) * _2503;
    bool _2515 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[133].w;
    bool _2517 = isnan(_996);
    bool _2519 = _2515 || _2517;
    bool _2521 = isnan((*spvDescriptorSet0.vp_c9)._m0[133].w);
    bool _2523 = _2519 || _2521;
    float _2525 = float(_2523);
    float _2527 = -_2481;
    float _2529 = -_2507;
    float _2531 = fma(_2527, _2509, _2529);
    int _2533 = ~_2187;
    int _2535 = _2533 + 1;
    float _2537 = trunc(_2513);
    float _2539 = precise::max(_2537, 0.0);
    uint _2541 = uint(_2539);
    bool _2543 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[132].w;
    bool _2545 = isnan(_996);
    bool _2547 = _2543 || _2545;
    bool _2549 = isnan((*spvDescriptorSet0.vp_c9)._m0[132].w);
    bool _2551 = _2547 || _2549;
    float _2553 = float(_2551);
    float _2555 = -_2525;
    float _2557 = _2555 + 1.0;
    float _2559 = fma(_2433, (*spvDescriptorSet0.vp_c9)._m0[83].w, _2505);
    bool _2561 = _996 >= (*spvDescriptorSet0.vp_c9)._m0[131].w;
    bool _2563 = isnan(_996);
    bool _2565 = _2561 || _2563;
    bool _2567 = isnan((*spvDescriptorSet0.vp_c9)._m0[131].w);
    bool _2569 = _2565 || _2567;
    float _2571 = float(_2569);
    float _2573 = _2553 * _2557;
    float _2575 = -_2553;
    float _2577 = _2575 + 1.0;
    float _2579 = as_type<float>(_2217) * _2511;
    float _2581 = (*spvDescriptorSet0.vp_c9)._m0[83].z + (*spvDescriptorSet0.vp_c9)._m0[83].x;
    float _2583 = _2571 * _2577;
    float _2585 = (*spvDescriptorSet0.vp_c9)._m0[82].x + (*spvDescriptorSet0.vp_c9)._m0[81].z;
    float _2587 = fma(_2383, (*spvDescriptorSet0.vp_c9)._m0[83].z, _2581);
    float _2589 = trunc(_2579);
    float _2591 = precise::max(_2589, 0.0);
    uint _2593 = uint(_2591);
    int _2595 = _2535 * int(_2541);
    int _2597 = _2595 + _2491;
    float _2599 = _2383 * (*spvDescriptorSet0.vp_c9)._m0[82].x;
    float _2601 = _2463 * _2583;
    float _2603 = (*spvDescriptorSet0.vp_c9)._m0[82].y + (*spvDescriptorSet0.vp_c9)._m0[81].w;
    float _2605 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].z, _2587);
    float _2607 = float(uint(_2597));
    float _2609 = -_2585;
    float _2611 = fma(_2599, 2.0, _2609);
    float _2613 = -_2571;
    float _2615 = _2613 + 1.0;
    int _2617 = ~_2187;
    int _2619 = _2617 + 1;
    float _2621 = fma(_2501, -2.0, _2603);
    float _2623 = as_type<float>(_2217) * _2607;
    float _2625 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _2627 = _1760 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _2629 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[82].w, _2559);
    float _2631 = -_129;
    float _2633 = fma(_2631, (*spvDescriptorSet0.vp_c9)._m0[81].x, _2611);
    int _2635 = _2619 * int(_2593);
    int _2637 = _2635 + _2437;
    float _2639 = trunc(_2623);
    float _2641 = precise::max(_2639, 0.0);
    uint _2643 = uint(_2641);
    float _2645 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[11].x, _2625);
    float _2647 = fma(_129, (*spvDescriptorSet0.vp_c9)._m0[81].y, _2621);
    float _2649 = fma(_1636, (*spvDescriptorSet0.vp_c8)._m0[10].x, _2627);
    float _2651 = float(uint(_2637));
    float _2653 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[11].z, _2645);
    int _2655 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4;
    bool _2657 = _2655 != 0;
    float _2659 = fma(_2615, (*spvDescriptorSet0.vp_c9)._m0[131].x, _2601);
    float _2661 = fma(_1764, (*spvDescriptorSet0.vp_c8)._m0[10].z, _2649);
    float _2663 = as_type<float>(_2217) * _2651;
    int _2665 = ~_2187;
    int _2667 = _2665 + 1;
    float _2669 = _2653 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _2671 = fma(_2495, _2573, _2659);
    float _2673 = trunc(_2663);
    float _2675 = precise::max(_2673, 0.0);
    uint _2677 = uint(_2675);
    float _2679 = -_2403;
    float _2681 = _2679 + 1.0;
    int _2683 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 8;
    bool _2685 = _2683 != 0;
    float _2687 = fma(_2525, (*spvDescriptorSet0.vp_c9)._m0[133].x, _2671);
    int _2689 = int(_2541) + int(_2643);
    float _2691 = -_2681;
    float _2693 = fma(_2467, _2691, _2493);
    float _2695 = -_211;
    int _2697 = _2413 ? as_type<int>(_2695) : as_type<int>(_211);
    float _2699 = -_2629;
    float _2701 = _2699 + 1.0;
    float _2703 = 1.0 / _2669;
    int _2705 = _2667 * _2689;
    int _2707 = _2705 + _2491;
    bool _2709 = !_2657;
    float _2711 = _2709 ? _211 : as_type<float>(_2697);
    float _2713 = _2661 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _2715 = _2687 * (*spvDescriptorSet0.vp_c10)._m0[1].w;
    bool _2717 = uint(_2707) >= uint(_2187);
    float _2719 = _2711 + 0.5;
    int _2721 = int(_2593) + int(_2677);
    float _2723 = _2713 + _2669;
    bool _2725 = !_2717;
    int _2727 = _2725 ? 0 : (-1);
    float _2729 = fma(_2719, (*spvDescriptorSet0.vp_c9)._m0[85].x, _2633);
    float _2731 = -as_type<float>(_207);
    int _2733 = _2279 ? as_type<int>(_2731) : _207;
    out.m_66.w = _2715;
    int _2735 = ~_2689;
    int _2737 = _2735 + _2727;
    int _2739 = _2737 + 1;
    float _2741 = _2723 * _2703;
    float _2743 = _2741 * 0.5;
    float _2745 = _2467;
    float _2747 = _2723;
    float _2749 = (*spvDescriptorSet0.vp_c8)._m0[30].w;
    if (!_2183)
    {
        _2745 = (*spvDescriptorSet0.vp_c9)._m0[140].z;
    }
    float _2751 = _2745;
    int _2753 = _2187 * _2739;
    int _2755 = _2753 + _2491;
    float _2757 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
    float _2759 = fma(_2743, (*spvDescriptorSet0.vp_c8)._m0[30].w, _2757);
    float _2761 = -_2425;
    float _2763 = _2761 + 1.0;
    bool _2765 = !_2685;
    float _2767 = _2765 ? as_type<float>(_207) : as_type<float>(_2733);
    bool _2769 = !_2329;
    int _2771 = _2769 ? _2755 : (-1);
    float _2773 = fma(_2499, _2763, _2531);
    float _2775 = -_2605;
    float _2777 = _2775 + 1.0;
    int _2779 = ~_2187;
    int _2781 = _2779 + 1;
    float _2783 = 1.0 / _2759;
    int _2785 = _2771 >> 31;
    float _2787 = -_2777;
    float _2789 = fma(_2711, _2787, _2729);
    float _2791 = as_type<float>(_2785);
    float _2793 = _2751;
    float _2795 = _2789;
    if (!_2183)
    {
        _2747 = (*spvDescriptorSet0.vp_c9)._m0[140].x;
    }
    float _2797 = _2747;
    float _2799 = _2767 + (-0.5);
    int _2801 = _2785 & 3;
    float _2803 = as_type<float>(_2801);
    if (!_2183)
    {
        float _2805 = -_2751;
        float _2807 = _2805 + (*spvDescriptorSet0.vp_c9)._m0[140].w;
        _2791 = _2807;
    }
    float _2809 = _2791;
    int _2811 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[7].y) & 4194304;
    bool _2813 = _2811 != 0;
    int _2815 = _2781 * _2721;
    int _2817 = _2815 + _2437;
    int _2819 = _2771 + _2801;
    float _2821 = as_type<float>(_2817);
    if (!_2183)
    {
        float _2823 = -_2797;
        float _2825 = _2823 + (*spvDescriptorSet0.vp_c9)._m0[140].y;
        _2749 = _2825;
    }
    float _2827 = _2749;
    if (!_2183)
    {
        float _2829 = 1.0 / _2809;
        _2803 = _2829;
    }
    float _2831 = _2803;
    float _2833 = -_2799;
    float _2835 = -_2647;
    float _2837 = fma(_2833, (*spvDescriptorSet0.vp_c9)._m0[85].y, _2835);
    int _2839 = _2819 >> 2;
    bool _2841 = uint(_2817) >= uint(_2187);
    float _2843 = fma(_2767, _2701, _2837);
    int _2845 = _2839 << 4;
    int _2847 = _2845 + 512;
    float _2849 = as_type<float>(_2839);
    if (!_2183)
    {
        float _2851 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2853 = -_2751;
        float _2855 = fma(_2783, _2851, _2853);
        _2793 = _2855;
    }
    float _2857 = _2793;
    float _2859 = _2425;
    if (!_2183)
    {
        float _2861 = 1.0 / _2827;
        _2859 = _2861;
    }
    float _2863 = _2859;
    if (!_2183)
    {
        float _2865 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _2867 = -_2797;
        float _2869 = fma(_2783, _2865, _2867);
        _2821 = _2869;
    }
    float _2871 = _2821;
    uint _2873 = uint(int(uint(_2847) >> uint(2)));
    uint _2875 = uint(int(uint(int(_2873)) >> uint(2)));
    int _2877 = int(_2873) & 3;
    float _2879 = (*spvDescriptorSet0.vp_c9)._m0[int(_2875)][_2877];
    int _2881 = int(_2873) + 1;
    uint _2883 = uint(int(uint(_2881) >> uint(2)));
    int _2885 = _2881 & 3;
    float _2887 = (*spvDescriptorSet0.vp_c9)._m0[int(_2883)][_2885];
    out.m_68.x = _2693;
    out.m_68.y = _2773;
    out.m_68.z = _2789;
    out.m_68.w = _2843;
    if (_2183)
    {
        _2849 = 1.0;
    }
    float _2889 = _2849;
    int _2891 = _2771 & 3;
    bool _2893 = _2891 != 0;
    bool _2895 = !_2841;
    int _2897 = _2895 ? 0 : (-1);
    int _2899 = ~_2721;
    int _2901 = _2899 + _2897;
    int _2903 = _2901 + 1;
    float _2905 = _2889;
    if (!_2183)
    {
        float _2907 = _2871 * _2863;
        float _2909 = precise::clamp(_2907, 0.0, 1.0);
        _2905 = _2909;
    }
    float _2911 = _2905;
    int _2913 = _2847 + 8;
    uint _2915 = uint(int(uint(_2913) >> uint(2)));
    uint _2917 = uint(int(uint(int(_2915)) >> uint(2)));
    int _2919 = int(_2915) & 3;
    float _2921 = (*spvDescriptorSet0.vp_c9)._m0[int(_2917)][_2919];
    int _2923 = int(_2915) + 1;
    uint _2925 = uint(int(uint(_2923) >> uint(2)));
    int _2927 = _2923 & 3;
    float _2929 = (*spvDescriptorSet0.vp_c9)._m0[int(_2925)][_2927];
    float _2931 = as_type<float>(_207) * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    if (!_2183)
    {
        float _2933 = _2857 * _2831;
        float _2935 = precise::clamp(_2933, 0.0, 1.0);
        _2795 = _2935;
    }
    float _2937 = _2795;
    int _2939 = _2187 * _2903;
    int _2941 = _2939 + _2437;
    float _2943 = _211 * (*spvDescriptorSet0.vp_c9)._m0[17].y;
    float _2945 = _1562 * _2931;
    int _2947 = _2771 & 3;
    bool _2949 = _2947 != 0;
    float _2951 = _1616 * _2931;
    if (_2183)
    {
        _217 = 1.0;
    }
    float _2953 = _217;
    float _2955 = _2953;
    if (!_2183)
    {
        float _2957 = -_2937;
        float _2959 = _2957 + 1.0;
        _2955 = _2959;
    }
    float _2961 = _2955;
    bool _2963 = uint(_2947) > 1u;
    float _2965 = _1542 * _2931;
    bool _2967 = _2947 != 3;
    float _2969 = _2911 * _2961;
    int _2971 = _2893 ? 0 : 1;
    float _2973 = fma(_1568, _2943, _2945);
    bool _2975 = uint(_2947) >= 2u;
    float _2977 = _2969 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _2979 = fma(_1534, _2943, _2965);
    int _2981 = ~_2971;
    int _2983 = _2981 + 1;
    int _2985 = _2983 + 1;
    float _2987 = fma(_1626, _2943, _2951);
    int _2989 = _2975 ? 0 : 1;
    float _2991 = _713 * _2977;
    int _2993 = _2985;
    if (!_2963)
    {
        int _2995 = ~_2971;
        int _2997 = _2995 + 1;
        _2993 = _2997;
    }
    int _2999 = _2993;
    float _3001 = _2042 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    bool _3003 = _2947 != 3;
    float _3005 = _1556 + _2979;
    bool _3007 = !_2949;
    int _3009 = _3007 ? 0 : 1;
    float _3011 = fma(_2050, (*spvDescriptorSet0.vp_c8)._m0[6].x, _3001);
    int _3013 = abs(_2999);
    float _3015 = _2991 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    int _3017 = ~_2989;
    int _3019 = _3017 + 1;
    int _3021 = _3019 + 1;
    float _3023 = fma(_2026, (*spvDescriptorSet0.vp_c8)._m0[6].z, _3011);
    int _3025 = abs(_3009);
    int _3027 = _3021;
    if (_2967)
    {
        int _3029 = ~_2989;
        int _3031 = _3029 + 1;
        _3027 = _3031;
    }
    int _3033 = _3027;
    float _3035 = fma(_2056, (*spvDescriptorSet0.vp_c8)._m0[6].w, _3023);
    out.m_45.x = _3015;
    int _3037 = abs(_3033);
    int _3039 = ~_3013;
    int _3041 = _3039 + 1;
    int _3043 = _3041 + 1;
    bool _3045 = !_3003;
    int _3047 = _3045 ? 0 : (-1);
    int _3049 = ~_3025;
    int _3051 = _3049 + 1;
    int _3053 = _3051 + 1;
    int _3055 = _3043 * as_type<int>(_2887);
    bool _3057 = !_2813;
    int _3059 = _3057 ? 0 : 1;
    int _3061 = _3053 * as_type<int>(_2879);
    int _3063 = _3061 + _3055;
    int _3065 = abs(_3047);
    int _3067 = ~_3037;
    int _3069 = _3067 + 1;
    int _3071 = _3069 + 1;
    int _3073 = abs(_3059);
    int _3075 = ~_3065;
    int _3077 = _3075 + 1;
    int _3079 = _3077 + 1;
    int _3081 = _3071 * as_type<int>(_2921);
    int _3083 = _3081 + _3063;
    float _3085 = _2245 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    bool _3087 = !_2329;
    int _3089 = _3087 ? _2941 : (-1);
    int _3091 = _3079 * as_type<int>(_2929);
    int _3093 = _3091 + _3083;
    float _3095 = _1578 + _2973;
    int _3097 = ~_3073;
    int _3099 = _3097 + 1;
    int _3101 = _3099 + 1;
    float _3103 = _1632 + _2987;
    bool _3105 = _2911 > 0.0;
    bool _3107 = isnan(_2911);
    bool _3109 = _3105 || _3107;
    bool _3111 = isnan(0.0);
    bool _3113 = _3109 || _3111;
    float _3115 = _3085 * _2140;
    float _3117 = -_3085;
    float _3119 = _3117 + 1.0;
    int _3121 = _3093 * _3101;
    float _3123 = -(*spvDescriptorSet0.vp_c8)._m0[31].z;
    float _3125 = _3035 + _3123;
    bool _3127 = _2961 <= 0.0;
    bool _3129 = !_3113;
    bool _3131 = _3127 || _3129;
    out.m_70.x = _3095;
    out.m_70.y = _3103;
    out.m_70.z = _3005;
    int _3133 = _3089 * _3073;
    int _3135 = _3133 + _3121;
    float _3137 = _2076 + _3125;
    float _3139 = _2161 * _3115;
    float _3141 = _2151 * _3119;
    float _3143 = _3137 * 0.5;
    float _3145 = float(_3135);
    float _3147 = fma(_2151, _3139, _2149);
    out.gl_Position.x = _2116;
    out.gl_Position.y = _2118;
    out.gl_Position.z = _3125;
    out.gl_Position.w = _2076;
    float _3149 = _2151 * _3115;
    out.m_72.z = _3143;
    out.m_72.w = _2076;
    float _3151 = fma(_2157, _3149, _2145);
    float _3153 = fma(_2159, _3149, _2147);
    out.m_74.y = _3145;
    out.m_76.x = _3151;
    out.m_76.y = _3153;
    out.m_76.z = _3147;
    out.m_76.w = _3141;
    if (!_3131)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_45.x = 0.0;
    float _3155 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _3155;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_60.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_60.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_60.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_60.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_66.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_66.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_66.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_66.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_64.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_64.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_64.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_64.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_72.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_72.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_72.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_72.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_45.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_45.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_45.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_45.w)); dm_cw(dm_gs, dm_p, 36, as_type<uint>(out.m_68.x)); dm_cw(dm_gs, dm_p, 37, as_type<uint>(out.m_68.y)); dm_cw(dm_gs, dm_p, 38, as_type<uint>(out.m_68.z)); dm_cw(dm_gs, dm_p, 39, as_type<uint>(out.m_68.w)); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_54.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_54.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_54.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_54.w)); dm_cw(dm_gs, dm_p, 44, as_type<uint>(out.m_74.x)); dm_cw(dm_gs, dm_p, 45, as_type<uint>(out.m_74.y)); dm_cw(dm_gs, dm_p, 46, as_type<uint>(out.m_74.z)); dm_cw(dm_gs, dm_p, 47, as_type<uint>(out.m_74.w)); dm_cw(dm_gs, dm_p, 48, as_type<uint>(out.m_70.x)); dm_cw(dm_gs, dm_p, 49, as_type<uint>(out.m_70.y)); dm_cw(dm_gs, dm_p, 50, as_type<uint>(out.m_70.z)); dm_cw(dm_gs, dm_p, 51, as_type<uint>(out.m_70.w)); dm_cw(dm_gs, dm_p, 52, as_type<uint>(out.m_62.x)); dm_cw(dm_gs, dm_p, 53, as_type<uint>(out.m_62.y)); dm_cw(dm_gs, dm_p, 54, as_type<uint>(out.m_62.z)); dm_cw(dm_gs, dm_p, 55, as_type<uint>(out.m_62.w)); dm_cw(dm_gs, dm_p, 56, as_type<uint>(out.m_76.x)); dm_cw(dm_gs, dm_p, 57, as_type<uint>(out.m_76.y)); dm_cw(dm_gs, dm_p, 58, as_type<uint>(out.m_76.z)); dm_cw(dm_gs, dm_p, 59, as_type<uint>(out.m_76.w)); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

