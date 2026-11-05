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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    constant _16* fp_c8 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_37 [[user(locn2)]];
    float4 m_56 [[user(locn3)]];
    float4 m_47 [[user(locn4)]];
    float4 m_43 [[user(locn5)]];
    float4 m_35 [[user(locn6)]];
    float4 m_39 [[user(locn7)]];
    float4 m_41 [[user(locn8)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _481 = float2(_79, _81);
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_481, float2(0.0), isnan(_481))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_481, float2(0.0), isnan(_481))).w;
    float _85 = in.m_37.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_37.x;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_37.z;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_39.y;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_41.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_39.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_39.z;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_43.w;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = _77 * _89;
    float _135 = _77 * _95;
    float _137 = _77 * _101;
    float _139 = in.m_45.w;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = _133 * _133;
    float _147 = fma(_135, _135, _145);
    float _149 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _151 = _149 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _153 = fma(_137, _137, _147);
    float _155 = _77 * _107;
    float _157 = 1.0 / _151;
    float _159 = rsqrt(_153);
    float _161 = in.m_47.x;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_49.w;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = _77 * _143;
    float _175 = _133 * _159;
    float _177 = _155 * _175;
    float _179 = _135 * _159;
    float _181 = _77 * _113;
    float _183 = _77 * _119;
    float _185 = _137 * _159;
    float _187 = -(*spvDescriptorSet0.fp_c10)._m0[9].w;
    float _189 = _181 + _187;
    float _191 = fma(_183, _179, _177);
    float _193 = _77 * _125;
    float _195 = _189 * (*spvDescriptorSet0.fp_c9)._m0[191].x;
    float _197 = fma(_193, _185, _191);
    float _199 = -_195;
    float _201 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.0500000007450580596923828125, _199);
    float _203 = abs(_197);
    float _205 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _207 = _203 + _205;
    float _209 = _77 * _131;
    float _211 = _201 * 0.15915493667125701904296875;
    float _213 = _207 * _157;
    float _215 = precise::clamp(_213, 0.0, 1.0);
    float _217 = _211 * 6.283185482025146484375;
    float _219 = sin(_217);
    float _221 = 0.0 + _219;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = in.m_45.x;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_45.y;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = in.m_45.z;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = _83 * _209;
    float _245 = fma(_215, -2.0, 3.0);
    float _247 = _215 * _215;
    float _249 = _173 * _243;
    float _251 = _245 * _247;
    float _253 = _77 * _171;
    float _255 = precise::max(_249, 0.100000001490116119384765625);
    float _257 = precise::min(_255, 0.300000011920928955078125);
    float _259 = fma(_257, 4.999999523162841796875, -0.4999999701976776123046875);
    float _261 = _223 * _223;
    float _263 = _77 * _165;
    float _265 = _259 * _261;
    float _267 = _253 * _265;
    float _269 = 0.0 + _267;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = _271 * _251;
    float _275 = _273 * _263;
    bool _279 = _275 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _281 = isnan(_275);
    bool _283 = _279 || _281;
    bool _285 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _287 = _283 || _285;
    float _289 = in.m_49.x;
    float _291 = gl_FragCoord.w;
    float _293 = _289 * _291;
    float _295 = in.m_49.y;
    float _297 = gl_FragCoord.w;
    float _299 = _295 * _297;
    float _301 = in.m_49.z;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    if (!_287)
    {
        discard_fragment();
    }
    float _307 = _77 * _293;
    float _309 = _77 * _229;
    float _311 = _77 * _299;
    float _313 = _77 * _235;
    float _315 = _77 * _305;
    float _317 = _77 * _241;
    float _319 = -_307;
    float _321 = _319 + _309;
    float _323 = -_311;
    float _325 = _323 + _313;
    float _327 = -_315;
    float _329 = _327 + _317;
    float _331 = fma(_267, _321, _307);
    float _333 = fma(_267, _325, _311);
    float _335 = fma(_267, _329, _315);
    if (!_287)
    {
        out.m_52.x = _331;
        out.m_52.y = _333;
        out.m_52.z = _335;
        out.m_52.w = _267;
        return out;
    }
    float _337 = _333 * 0.715200006961822509765625;
    float _339 = in.m_54.w;
    float _341 = gl_FragCoord.w;
    float _343 = _339 * _341;
    float _345 = in.m_54.z;
    float _347 = gl_FragCoord.w;
    float _349 = _345 * _347;
    float _351 = in.m_54.x;
    float _353 = gl_FragCoord.w;
    float _355 = _351 * _353;
    float _357 = fma(_331, 0.2125999927520751953125, _337);
    float _359 = in.m_54.y;
    float _361 = gl_FragCoord.w;
    float _363 = _359 * _361;
    float _365 = fma(_335, 0.072200000286102294921875, _357);
    bool _367 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _369 = 1.0 / _365;
    float _371 = _369 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _373 = precise::clamp(_371, 0.0, 1.0);
    float _375 = _77 * _343;
    float _377 = fma(_373, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _379 = _77 * _349;
    float _381 = _377 * _375;
    float _383 = 0.0 + _275;
    float _385 = precise::clamp(_383, 0.0, 1.0);
    float _387 = _77 * _355;
    float _389 = _77 * _363;
    float _391 = fma(_335, _381, _379);
    float _393 = fma(_331, _381, _387);
    float _395 = fma(_333, _381, _389);
    float _397 = _379;
    if (!_367)
    {
        _397 = _385;
    }
    float _399 = _397;
    bool _401 = !_367;
    float _403 = _399;
    if (!_401)
    {
        float _405 = in.m_56.w;
        float _407 = gl_FragCoord.w;
        float _409 = _405 * _407;
        float _411 = in.m_56.z;
        float _413 = gl_FragCoord.w;
        float _415 = _411 * _413;
        float _417 = _77 * _409;
        float _419 = _77 * _415;
        float _421 = 1.0 / _417;
        float _423 = _419 * _421;
        float _425 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _427 = fma(_423, (*spvDescriptorSet0.fp_c8)._m0[30].w, _425);
        float _429 = 1.0 / _427;
        float _431 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _433 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _435 = fma(_429, _431, _433);
        float _437 = _435 * 8.0;
        float _439 = precise::clamp(_437, 0.0, 1.0);
        float _441 = _385 * _439;
        _403 = _441;
    }
    float _443 = _403;
    float _445 = 0.0 + _443;
    float _447 = precise::clamp(_445, 0.0, 1.0);
    out.m_52.x = _393;
    out.m_52.y = _395;
    out.m_52.z = _391;
    out.m_52.w = _447;
    return out;
}

