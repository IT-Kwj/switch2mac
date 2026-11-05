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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_10 [[id(3)]];
    sampler fp_t_tcb_10Smplr [[id(4)]];
    sampler fp_t_tcb_10Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_37 [[user(locn4), flat]];
    float4 m_35 [[user(locn5)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_33.w;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_33.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _53;
    float _75 = _73 * _59;
    float _77 = _73 * _65;
    float _79 = _73 * _71;
    float _81 = 1.0 / _75;
    float _83 = _77 * _81;
    float _85 = _79 * _81;
    float2 _469 = float2(_83, _85);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_469, float2(0.0), isnan(_469))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_469, float2(0.0), isnan(_469))).x;
    float _89 = in.m_35.y;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_35.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_37.z;
    float _103 = _73 * _93;
    float _105 = _73 * _99;
    float _107 = _101 * 0.3499999940395355224609375;
    float _109 = -_101;
    float _111 = _109 + 1.0;
    float _113 = _103 * _103;
    float _115 = _105 + _103;
    float _117 = 1.0 / _107;
    float _119 = -_105;
    float _121 = _119 + _103;
    float _123 = fma(_105, _105, _113);
    float _125 = abs(_115);
    float _127 = -_125;
    float _129 = _127 + 1.0;
    float _131 = in.m_39.w;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = abs(_121);
    float _139 = -_137;
    float _141 = _139 + 1.0;
    float _143 = _129 * _129;
    float _145 = sqrt(_123);
    float _147 = _141 * _141;
    float _149 = _143 * _143;
    float _151 = _147 * _147;
    float _153 = _149 * _149;
    float _155 = _151 * _151;
    float _157 = _153 * _153;
    float _159 = fma(_155, _155, _157);
    float _161 = -_107;
    float _163 = _145 + _161;
    float _165 = _145 * _117;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = in.m_41.w;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _177 = _163 * _117;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = in.m_33.z;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = -_179;
    float _189 = _187 + 1.0;
    float _191 = _167 * _189;
    float _193 = _145 * 1.41421401500701904296875;
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = _145 * 2.0;
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = _73 * _135;
    float _203 = _191 * _191;
    float _205 = -_195;
    float _207 = _205 + 1.0;
    float _209 = -_199;
    float _211 = _209 + 1.0;
    float _213 = _203 * _203;
    float _215 = _213 * 0.5;
    float _217 = _207 * _207;
    float _219 = _211 * _211;
    float _221 = _215 * _111;
    float _223 = _217 * _217;
    float _225 = -_221;
    float _227 = _225 + 1.0;
    float _229 = _223 * _159;
    float _231 = fma(_229, _227, _221);
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = -_219;
    float _237 = _235 + 1.0;
    float _239 = _73 * _173;
    float _241 = _73 * _185;
    float _243 = fma(_233, _237, _219);
    float _245 = in.m_43.x;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = _241 * _81;
    float _253 = _243 * _201;
    float _255 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _257 = fma(_251, (*spvDescriptorSet0.fp_c8)._m0[30].w, _255);
    float _259 = _239 * _253;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = 1.0 / _257;
    float _265 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _267 = _263 * _265;
    float _269 = in.m_41.x;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = in.m_39.x;
    float _277 = gl_FragCoord.w;
    float _279 = _275 * _277;
    float _281 = in.m_41.y;
    float _283 = gl_FragCoord.w;
    float _285 = _281 * _283;
    float _287 = in.m_41.z;
    float _289 = gl_FragCoord.w;
    float _291 = _287 * _289;
    float _293 = -_233;
    float _295 = _293 + 1.0;
    float _297 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _299 = fma(_87, (*spvDescriptorSet0.fp_c8)._m0[30].w, _297);
    float _301 = 1.0 / _299;
    float _303 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _305 = -_267;
    float _307 = fma(_301, _303, _305);
    float _309 = _73 * _249;
    float _311 = _307 * _175;
    float _313 = precise::clamp(_311, 0.0, 1.0);
    float _315 = _261 * _313;
    float _317 = _315 * _309;
    bool _321 = _317 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _323 = isnan(_317);
    bool _325 = _321 || _323;
    bool _327 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _329 = _325 || _327;
    float _331 = in.m_39.y;
    float _333 = gl_FragCoord.w;
    float _335 = _331 * _333;
    float _337 = in.m_39.z;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = _267;
    if (!_329)
    {
        discard_fragment();
    }
    float _345 = _73 * _279;
    float _347 = _73 * _273;
    float _349 = _73 * _291;
    float _351 = _347 * _295;
    float _353 = fma(_233, _345, _351);
    float _355 = _73 * _335;
    float _357 = _73 * _285;
    float _359 = _73 * _341;
    float _361 = _357 * _295;
    float _363 = _349 * _295;
    float _365 = fma(_233, _355, _361);
    float _367 = fma(_233, _359, _363);
    if (!_329)
    {
        out.m_46.x = _353;
        out.m_46.y = _365;
        out.m_46.z = _367;
        out.m_46.w = _261;
        return out;
    }
    float _369 = _365 * 0.715200006961822509765625;
    float _371 = fma(_353, 0.2125999927520751953125, _369);
    float _373 = fma(_367, 0.072200000286102294921875, _371);
    bool _375 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _377 = 1.0 / _373;
    float _379 = 0.0 + _317;
    float _381 = precise::clamp(_379, 0.0, 1.0);
    float _383 = _381;
    if (_375)
    {
        float _385 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _387 = _267 + _385;
        _343 = _387;
    }
    float _389 = _343;
    float _391 = _377 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _393 = precise::clamp(_391, 0.0, 1.0);
    float _395 = _389;
    if (_375)
    {
        float _397 = _389 * 8.0;
        float _399 = precise::clamp(_397, 0.0, 1.0);
        _395 = _399;
    }
    float _401 = _395;
    float _403 = fma(_393, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    if (_375)
    {
        float _405 = _381 * _401;
        _383 = _405;
    }
    float _407 = _383;
    float _409 = _353 * _403;
    float _411 = _365 * _403;
    float _413 = _367 * _403;
    float _415 = 0.0 + _407;
    float _417 = precise::clamp(_415, 0.0, 1.0);
    out.m_46.x = _409;
    out.m_46.y = _411;
    out.m_46.z = _413;
    out.m_46.w = _417;
    return out;
}

