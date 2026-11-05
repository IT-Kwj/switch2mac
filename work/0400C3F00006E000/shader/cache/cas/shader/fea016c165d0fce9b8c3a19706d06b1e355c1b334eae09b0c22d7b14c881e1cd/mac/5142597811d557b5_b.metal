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
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_48 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_45 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_37 [[user(locn5), flat]];
    float4 m_52 [[user(locn6)]];
    float4 m_31 [[user(locn7), flat]];
    float4 m_50 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _59 = in.m_31.x;
    float _61 = gl_FragCoord.w;
    float _63 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].x;
    float _65 = in.m_35.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_35.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = _59 + 1.0;
    float _79 = 1.0 / _61;
    float _81 = _77 * _63;
    float _83 = floor(_81);
    float _85 = rint(_59);
    float _87 = precise::max(_85, 0.0);
    uint _90 = uint(_87);
    uint _92 = clamp(_90, 0u, 65535u);
    float _94 = _79 * _69;
    float _96 = -_83;
    float _98 = fma(_96, (*spvDescriptorSet0.fp_c9)._m0[22].x, _77);
    float _100 = _79 * _75;
    float _102 = rint(_98);
    float _104 = precise::max(_102, 0.0);
    uint _106 = uint(_104);
    uint _108 = clamp(_106, 0u, 65535u);
    float3 _523 = float3(_94, _100, float(int(_92)));
    float3 _527 = select(_523, float3(0.0), isnan(_523));
    float4 _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _527.xy, uint(rint(_527.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _527.xy, uint(rint(_527.z))).xyzw;
    float _113 = _111.x;
    float _115 = _111.y;
    float _117 = _111.z;
    float _119 = _111.w;
    float3 _544 = float3(_94, _100, float(int(_108)));
    float3 _546 = select(_544, float3(0.0), isnan(_544));
    float4 _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _546.xy, uint(rint(_546.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _546.xy, uint(rint(_546.z))).xyzw;
    float _123 = _121.x;
    float _125 = _121.y;
    float _127 = _121.z;
    float _129 = _121.w;
    float _131 = in.m_37.y;
    float _133 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[22].y;
    float _135 = in.m_39.w;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = in.m_41.w;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_43.w;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_45.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = _131 * _133;
    float _161 = _159 * _133;
    float _163 = floor(_161);
    float _165 = -_163;
    float _167 = fma(_165, (*spvDescriptorSet0.fp_c9)._m0[22].y, _159);
    float _169 = _79 * _139;
    float _171 = _79 * _145;
    float _173 = _79 * _151;
    float _175 = _167 + 9.9999997473787516355514526367188e-05;
    float _177 = floor(_175);
    float _179 = -_177;
    float _181 = _175 + _179;
    float _183 = in.m_39.x;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = in.m_43.x;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    float _195 = in.m_39.y;
    float _197 = gl_FragCoord.w;
    float _199 = _195 * _197;
    float _201 = in.m_43.y;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_43.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = -_119;
    float _215 = _213 + _129;
    float _217 = fma(_181, _215, _119);
    float _219 = -_169;
    float _221 = fma(_217, _171, _219);
    float _223 = _173 * _221;
    float _225 = _79 * _157;
    float _227 = 0.0 + _223;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = _229 * _225;
    bool _235 = _231 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _237 = isnan(_231);
    bool _239 = _235 || _237;
    bool _241 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _243 = _239 || _241;
    float _245 = in.m_39.z;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = in.m_41.x;
    float _253 = gl_FragCoord.w;
    float _255 = _251 * _253;
    float _257 = in.m_41.y;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = in.m_41.z;
    float _265 = gl_FragCoord.w;
    float _267 = _263 * _265;
    if (!_243)
    {
        discard_fragment();
    }
    float _269 = -_113;
    float _271 = _269 + _123;
    float _273 = -_115;
    float _275 = _273 + _125;
    float _277 = -_117;
    float _279 = _277 + _127;
    float _281 = _79 * _187;
    float _283 = fma(_181, _271, _113);
    float _285 = fma(_181, _275, _115);
    float _287 = _79 * _193;
    float _289 = _79 * _199;
    float _291 = _79 * _205;
    float _293 = _79 * _211;
    float _295 = fma(_181, _279, _117);
    float _297 = -_287;
    float _299 = _281 + _297;
    float _301 = _283 * _283;
    float _303 = -_291;
    float _305 = _289 + _303;
    float _307 = _285 * _285;
    float _309 = _79 * _249;
    float _311 = _295 * _295;
    float _313 = fma(_301, _299, _287);
    float _315 = _79 * _255;
    float _317 = -_293;
    float _319 = _309 + _317;
    float _321 = fma(_307, _305, _291);
    float _323 = _79 * _261;
    float _325 = _79 * _267;
    float _327 = fma(_311, _319, _293);
    float _329 = _313 * _315;
    float _331 = _321 * _323;
    float _333 = _327 * _325;
    if (!_243)
    {
        out.m_48.x = _329;
        out.m_48.y = _331;
        out.m_48.z = _333;
        out.m_48.w = _223;
        return out;
    }
    float _335 = _331 * 0.715200006961822509765625;
    float _337 = in.m_50.w;
    float _339 = gl_FragCoord.w;
    float _341 = _337 * _339;
    float _343 = in.m_50.z;
    float _345 = gl_FragCoord.w;
    float _347 = _343 * _345;
    float _349 = in.m_50.x;
    float _351 = gl_FragCoord.w;
    float _353 = _349 * _351;
    float _355 = fma(_329, 0.2125999927520751953125, _335);
    float _357 = in.m_50.y;
    float _359 = gl_FragCoord.w;
    float _361 = _357 * _359;
    float _363 = 0.0 + _231;
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = fma(_333, 0.072200000286102294921875, _355);
    bool _369 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _371 = 1.0 / _367;
    float _373 = _371 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _375 = precise::clamp(_373, 0.0, 1.0);
    float _377 = _79 * _341;
    float _379 = fma(_375, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _381 = _79 * _347;
    float _383 = _379 * _377;
    float _385 = _79 * _353;
    float _387 = _79 * _361;
    float _389 = fma(_333, _383, _381);
    float _391 = fma(_329, _383, _385);
    float _393 = fma(_331, _383, _387);
    float _395 = _381;
    if (!_369)
    {
        _395 = _365;
    }
    float _397 = _395;
    bool _399 = !_369;
    float _401 = _397;
    if (!_399)
    {
        float _403 = in.m_52.w;
        float _405 = gl_FragCoord.w;
        float _407 = _403 * _405;
        float _409 = in.m_52.z;
        float _411 = gl_FragCoord.w;
        float _413 = _409 * _411;
        float _415 = _79 * _407;
        float _417 = _79 * _413;
        float _419 = 1.0 / _415;
        float _421 = _417 * _419;
        float _423 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _425 = fma(_421, (*spvDescriptorSet0.fp_c8)._m0[30].w, _423);
        float _427 = 1.0 / _425;
        float _429 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _431 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _433 = fma(_427, _429, _431);
        float _435 = _433 * 8.0;
        float _437 = precise::clamp(_435, 0.0, 1.0);
        float _439 = _365 * _437;
        _401 = _439;
    }
    float _441 = _401;
    float _443 = 0.0 + _441;
    float _445 = precise::clamp(_443, 0.0, 1.0);
    out.m_48.x = _391;
    out.m_48.y = _393;
    out.m_48.z = _389;
    out.m_48.w = _445;
    return out;
}

