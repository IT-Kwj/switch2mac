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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c7 [[id(3)]];
    constant _16* fp_c9 [[id(4)]];
    constant _16* fp_c15 [[id(5)]];
    texture2d<float> fp_t_tcb_8 [[id(6)]];
    sampler fp_t_tcb_8Smplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_54 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_45 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _561 = float2(_77, _79);
    float _81 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_561, float2(0.0), isnan(_561))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_561, float2(0.0), isnan(_561))).w;
    float _83 = in.m_39.y;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.z;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_41.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_41.z;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_43.x;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = _75 * _87;
    float _121 = _75 * _93;
    float _123 = _75 * _99;
    float _125 = _119 * _119;
    float _127 = fma(_121, _121, _125);
    float _129 = fma(_123, _123, _127);
    float _131 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _133 = rsqrt(_129);
    float _135 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _131);
    float _137 = in.m_41.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _135);
    float _145 = rsqrt(_143);
    float _147 = _119 * _133;
    float _149 = _121 * _133;
    float _151 = _123 * _133;
    float _153 = _147 * _147;
    float _155 = in.m_43.z;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = fma(_149, _149, _153);
    float _163 = in.m_43.y;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = _145 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _171 = fma(_151, _151, _161);
    float _173 = _145 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _175 = _145 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _177 = _169 * (*spvDescriptorSet0.fp_c10)._m0[9].y;
    float _179 = rsqrt(_171);
    float _181 = fma(_173, (*spvDescriptorSet0.fp_c10)._m0[8].y, _177);
    float _183 = _75 * _141;
    float _185 = fma(_175, (*spvDescriptorSet0.fp_c10)._m0[10].y, _181);
    float _187 = _75 * _105;
    float _189 = -_183;
    float _191 = _189 + 1.0;
    float _193 = _185 * _185;
    float _195 = -_187;
    float _197 = _195 + 0.5;
    float _199 = fma(_193, _197, _187);
    float _201 = _193 * _193;
    float _203 = _147 * _179;
    float _205 = fma(_193, _191, _183);
    float _207 = _75 * _111;
    float _209 = _149 * _179;
    float _211 = _169 * _203;
    float _213 = _201 * _201;
    float _215 = -_207;
    float _217 = fma(_215, _193, _207);
    float _219 = in.m_45.w;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = _75 * _117;
    float _227 = _213 * _213;
    float _229 = fma(_173, _209, _211);
    float _231 = _75 * _159;
    float _233 = _151 * _179;
    float _235 = -_205;
    float _237 = _235 + _225;
    float _239 = _227 * _227;
    float _241 = _75 * _167;
    float _243 = fma(_175, _233, _229);
    float _245 = -_217;
    float _247 = _245 + _231;
    float _249 = fma(_239, _237, _205);
    float _251 = -_199;
    float _253 = _251 + _241;
    float _255 = in.m_47.x;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = _243 * _243;
    float _263 = fma(_239, _247, _217);
    float _265 = fma(_239, _253, _199);
    float _267 = _261 * 0.20000000298023223876953125;
    float _269 = -_249;
    float _271 = _225 + _269;
    float _273 = -_265;
    float _275 = _241 + _273;
    float _277 = -_263;
    float _279 = _231 + _277;
    float _281 = -(*spvDescriptorSet0.fp_c7)._m0[0].x;
    float _283 = _281 + 1.0;
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = precise::max(_285, 0.5);
    float _289 = precise::min(_287, 0.75);
    float _291 = _75 * _223;
    float _293 = fma(_289, -4.0, 3.0);
    bool _297 = _291 != 1.0;
    bool _299 = isnan(_291);
    bool _301 = _297 || _299;
    bool _303 = isnan(1.0);
    bool _305 = _301 || _303;
    float _307 = 0.0 + _81;
    float _309 = precise::clamp(_307, 0.0, 1.0);
    float _311 = precise::max(0.0, _81);
    float _313 = -_267;
    float _315 = _313 + _309;
    float _317 = precise::min(_311, 0.75);
    float _319 = fma(_315, 0.60000002384185791015625, _267);
    float _321 = _319 + _317;
    float _323 = fma(_321, _271, _249);
    float _325 = fma(_321, _275, _265);
    float _327 = fma(_321, _279, _263);
    float _329 = -_323;
    float _331 = fma(_323, (*spvDescriptorSet0.fp_c9)._m0[194].y, _329);
    float _333 = -_325;
    float _335 = fma(_325, (*spvDescriptorSet0.fp_c9)._m0[194].z, _333);
    float _337 = -_327;
    float _339 = fma(_327, (*spvDescriptorSet0.fp_c9)._m0[194].w, _337);
    float _341 = fma(_293, _331, _323);
    float _343 = fma(_293, _335, _325);
    float _345 = fma(_293, _339, _327);
    float _347 = _75 * _259;
    bool _349 = !_305;
    if (!_349)
    {
        float _351 = gl_FragCoord.x;
        float _353 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _355 = _351 / _353;
        float _357 = gl_FragCoord.y;
        float _359 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _361 = _357 / _359;
        float _363 = trunc(_355);
        int _366 = int(_363);
        float _368 = trunc(_361);
        int _370 = int(_368);
        int _372 = _366 + 2;
        int _374 = _372 >> 1;
        uint _377 = uint(int(uint(_370) >> uint(1)));
        int _379 = _374 ^ int(_377);
        int _381 = _379 << 16;
        int _383 = _381 ^ _374;
        int _385 = 983055 & _383;
        float _387 = _291 * 256.0;
        int _389 = _385 << 6;
        int _391 = _389 + _385;
        float _393 = trunc(_387);
        int _395 = int(_393);
        int _397 = _391 & 13369548;
        uint _399 = uint(int(uint(_397) >> uint(3)));
        int _401 = _397 | int(_399);
        int _403 = _401 & 5570560;
        int _405 = _401 & 85;
        uint _407 = uint(int(uint(_395) >> uint(7)));
        int _409 = int(_407) + _395;
        uint _411 = uint(int(uint(_403) >> uint(15)));
        int _413 = int(_411) + _405;
        bool _415 = uint(_409) > uint(_413);
        if (!_415)
        {
            discard_fragment();
        }
        if (!_415)
        {
            out.m_50.x = _341;
            out.m_50.y = _343;
            out.m_50.z = _345;
            out.m_50.w = _347;
            return out;
        }
    }
    float _417 = _343 * 0.715200006961822509765625;
    float _419 = in.m_52.w;
    float _421 = gl_FragCoord.w;
    float _423 = _419 * _421;
    float _425 = in.m_52.x;
    float _427 = gl_FragCoord.w;
    float _429 = _425 * _427;
    float _431 = in.m_52.y;
    float _433 = gl_FragCoord.w;
    float _435 = _431 * _433;
    float _437 = fma(_341, 0.2125999927520751953125, _417);
    float _439 = in.m_52.z;
    float _441 = gl_FragCoord.w;
    float _443 = _439 * _441;
    float _445 = fma(_345, 0.072200000286102294921875, _437);
    bool _447 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _449 = 1.0 / _445;
    float _451 = _449 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _453 = precise::clamp(_451, 0.0, 1.0);
    float _455 = fma(_453, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _457 = _75 * _423;
    float _459 = 0.0 + _347;
    float _461 = precise::clamp(_459, 0.0, 1.0);
    float _463 = _75 * _429;
    float _465 = _455 * _457;
    float _467 = _75 * _435;
    float _469 = _75 * _443;
    float _471 = fma(_341, _465, _463);
    float _473 = fma(_343, _465, _467);
    float _475 = fma(_345, _465, _469);
    float _477 = _463;
    if (!_447)
    {
        _477 = _461;
    }
    float _479 = _477;
    bool _481 = !_447;
    float _483 = _479;
    if (!_481)
    {
        float _485 = in.m_54.w;
        float _487 = gl_FragCoord.w;
        float _489 = _485 * _487;
        float _491 = in.m_54.z;
        float _493 = gl_FragCoord.w;
        float _495 = _491 * _493;
        float _497 = _75 * _489;
        float _499 = _75 * _495;
        float _501 = 1.0 / _497;
        float _503 = _499 * _501;
        float _505 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _507 = fma(_503, (*spvDescriptorSet0.fp_c8)._m0[30].w, _505);
        float _509 = 1.0 / _507;
        float _511 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _513 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _515 = fma(_509, _511, _513);
        float _517 = _515 * 8.0;
        float _519 = precise::clamp(_517, 0.0, 1.0);
        float _521 = _461 * _519;
        _483 = _521;
    }
    float _523 = _483;
    float _525 = 0.0 + _523;
    float _527 = precise::clamp(_525, 0.0, 1.0);
    out.m_50.x = _471;
    out.m_50.y = _473;
    out.m_50.z = _475;
    out.m_50.w = _527;
    return out;
}

