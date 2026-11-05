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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_32 [[user(locn0), center_no_perspective]];
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_38 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
    float4 m_48 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
    float4 m_36 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _62 = in.m_32.x;
    float _64 = in.m_32.y;
    float2 _417 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_417, float2(0.0), isnan(_417))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_417, float2(0.0), isnan(_417))).x;
    float _68 = gl_FragCoord.w;
    float _70 = in.m_36.y;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_36.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_36.z;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_36.w;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_38.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_38.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_40.z;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_40.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_42.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_38.z;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = in.m_42.x;
    float _132 = gl_FragCoord.w;
    float _134 = _130 * _132;
    float _136 = 1.0 / _68;
    float _138 = _136 * _74;
    float _140 = _136 * _80;
    float _142 = _136 * _86;
    float _144 = _136 * _128;
    float _146 = _138 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _148 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[8].x, _146);
    float _150 = _136 * _92;
    float _152 = in.m_44.x;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[8].z, _148);
    float _160 = _138 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _162 = _138 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _164 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[8].w, _158);
    float _166 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[6].x, _160);
    float _168 = fma(_140, (*spvDescriptorSet0.fp_c3)._m0[7].x, _162);
    float _170 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[6].z, _166);
    float _172 = 1.0 / _164;
    float _174 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[7].z, _168);
    float _176 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[6].w, _170);
    float _178 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[7].w, _174);
    float _180 = _136 * _156;
    float _182 = rint(_180);
    float _184 = precise::max(_182, 0.0);
    uint _187 = uint(_184);
    uint _189 = clamp(_187, 0u, 65535u);
    float _191 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[0].z, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _193 = in.m_46.z;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = -_172;
    float _201 = _191 * _199;
    float _203 = in.m_48.x;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = _176 * _201;
    float _211 = _178 * _201;
    float _213 = in.m_48.z;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = _211 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _221 = _211 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _223 = _211 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _225 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[2].x, _219);
    float _227 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[3].x, _221);
    float _229 = in.m_46.x;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = fma(_209, (*spvDescriptorSet0.fp_c3)._m0[4].x, _223);
    float _237 = -_191;
    float _239 = fma(_237, (*spvDescriptorSet0.fp_c3)._m0[2].z, _225);
    float _241 = -_191;
    float _243 = fma(_241, (*spvDescriptorSet0.fp_c3)._m0[3].z, _227);
    float _245 = _136 * _98;
    float _247 = _136 * _104;
    float _249 = _239 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _251 = _243 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _253 = -_191;
    float _255 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[4].z, _235);
    float _257 = _136 * _110;
    float _259 = -_245;
    float _261 = _249 + _259;
    float _263 = -_247;
    float _265 = _251 + _263;
    float _267 = _136 * _116;
    float _269 = _136 * _122;
    float _271 = _255 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _273 = _265 * _257;
    float _275 = _136 * _134;
    float _277 = _265 * _267;
    float _279 = -_144;
    float _281 = _271 + _279;
    float _283 = fma(_261, _269, _273);
    float _285 = _136 * _207;
    float _287 = fma(_261, _275, _277);
    float _289 = _136 * _197;
    float _291 = _136 * _217;
    float _293 = fma(_281, _285, _287);
    float _295 = fma(_281, _291, _283);
    float _297 = _136 * _233;
    float _299 = _289 + _295;
    float _301 = _297 + _293;
    float _303 = _299 + 0.5;
    float _305 = -_301;
    float _307 = _305 + 0.5;
    float3 _801 = float3(_307, _303, float(int(_189)));
    float3 _805 = select(_801, float3(0.0), isnan(_801));
    float _309 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _805.xy, uint(rint(_805.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _805.xy, uint(rint(_805.z))).x;
    float _311 = in.m_40.y;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_42.y;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_48.y;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_46.y;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_50.x;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_50.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_50.y;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_52.w;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = _136 * _315;
    float _361 = _265 * _359;
    float _363 = _136 * _321;
    float _365 = fma(_261, _363, _361);
    float _367 = _136 * _327;
    float _369 = _136 * _339;
    float _371 = fma(_281, _367, _365);
    float _373 = _136 * _333;
    float _375 = _136 * _345;
    float _377 = _373 + _371;
    bool _381 = _377 > _369;
    float _383 = -_377;
    float _385 = _383 + 0.5;
    float _387 = -_377;
    float _389 = _387 + (-0.5);
    float _391 = _375 * _385;
    float _393 = _136 * _351;
    float _395 = _136 * _357;
    float _397 = _391;
    if (!_381)
    {
        float _399 = _393 * _389;
        _397 = _399;
    }
    float _401 = _397;
    float _403 = _309 * _395;
    float _405 = _401 * _403;
    out.m_55.x = 0.0;
    out.m_55.y = 0.0;
    out.m_55.z = 0.0;
    out.m_55.w = _405;
    return out;
}

