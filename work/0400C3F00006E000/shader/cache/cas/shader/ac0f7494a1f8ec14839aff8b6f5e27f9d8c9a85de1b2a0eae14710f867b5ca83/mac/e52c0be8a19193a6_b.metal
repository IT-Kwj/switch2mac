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
    texturecube_array<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texturecube_array<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_CSmplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_39 [[color(0)]];
    float4 m_41 [[color(1)]];
    float4 m_43 [[color(2)]];
    float4 m_45 [[color(3)]];
    float4 m_47 [[color(4)]];
    float4 m_49 [[color(5)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = gl_FragCoord.w;
    float _58 = in.m_36.x;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = in.m_36.y;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = 1.0 / _56;
    float _72 = _70 * _62;
    float _74 = _70 * _68;
    float2 _383 = float2(_72, _74);
    float3 _78 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_383, float2(0.0), isnan(_383))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_383, float2(0.0), isnan(_383))).xyz;
    float _80 = _78.x;
    float _82 = _78.y;
    float _84 = _78.z;
    float _86 = rint((*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _88 = precise::max(_86, 0.0);
    uint _91 = uint(_88);
    uint _93 = clamp(_91, 0u, 65535u);
    float _95 = rint((*spvDescriptorSet0.fp_c3)._m0[2].x);
    float _97 = precise::max(_95, 0.0);
    uint _99 = uint(_97);
    uint _101 = clamp(_99, 0u, 65535u);
    float _103 = abs(_80);
    float _105 = abs(_84);
    float _107 = precise::max(_103, _105);
    float _109 = abs(_80);
    float _111 = abs(_82);
    float _113 = precise::max(_109, _111);
    float _115 = abs(_82);
    float _117 = precise::max(_115, _107);
    float _119 = abs(_84);
    float _121 = precise::max(_119, _113);
    float _123 = 1.0 / _117;
    float _125 = abs(_82);
    float _127 = abs(_84);
    float _129 = precise::max(_125, _127);
    float _131 = abs(_80);
    float _133 = precise::max(_131, _129);
    float _135 = 1.0 / _121;
    float _137 = -_123;
    float _139 = _84 * _137;
    float _141 = _80 * _123;
    float _143 = -_123;
    float _145 = _82 * _143;
    float _147 = 1.0 / _133;
    float _149 = -_123;
    float _151 = _80 * _149;
    float _153 = _82 * _123;
    float _155 = _80 * _135;
    float _157 = _82 * _135;
    float4 _497 = float4(_139, _141, _145, float(int(_93)));
    float4 _501 = select(_497, float4(0.0), isnan(_497));
    float3 _159 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _501.xyz, uint(rint(_501.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _501.xyz, uint(rint(_501.w))).xyz;
    float _161 = _159.x;
    float _163 = _159.y;
    float _165 = _159.z;
    float4 _517 = float4(_139, _141, _145, float(int(_101)));
    float4 _519 = select(_517, float4(0.0), isnan(_517));
    float3 _167 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _519.xyz, uint(rint(_519.w))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _519.xyz, uint(rint(_519.w))).xyz;
    float _169 = _167.x;
    float _171 = _167.y;
    float _173 = _167.z;
    float _175 = _84 * _135;
    float4 _538 = float4(_139, _151, _153, float(int(_93)));
    float4 _540 = select(_538, float4(0.0), isnan(_538));
    float3 _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _540.xyz, uint(rint(_540.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _540.xyz, uint(rint(_540.w))).xyz;
    float _179 = _177.x;
    float _181 = _177.y;
    float _183 = _177.z;
    float4 _556 = float4(_139, _151, _153, float(int(_101)));
    float4 _558 = select(_556, float4(0.0), isnan(_556));
    float3 _185 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _558.xyz, uint(rint(_558.w))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _558.xyz, uint(rint(_558.w))).xyz;
    float _187 = _185.x;
    float _189 = _185.y;
    float _191 = _185.z;
    float4 _574 = float4(_155, _157, _175, float(int(_93)));
    float4 _576 = select(_574, float4(0.0), isnan(_574));
    float3 _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _576.xyz, uint(rint(_576.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _576.xyz, uint(rint(_576.w))).xyz;
    float _195 = _193.x;
    float _197 = _193.y;
    float _199 = _193.z;
    float4 _592 = float4(_155, _157, _175, float(int(_101)));
    float4 _594 = select(_592, float4(0.0), isnan(_592));
    float3 _201 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _594.xyz, uint(rint(_594.w))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _594.xyz, uint(rint(_594.w))).xyz;
    float _203 = _201.x;
    float _205 = _201.y;
    float _207 = _201.z;
    float _209 = -_135;
    float _211 = _80 * _209;
    float _213 = -_135;
    float _215 = _84 * _213;
    float _217 = _82 * _147;
    float _219 = -_147;
    float _221 = _84 * _219;
    float _223 = _80 * _147;
    float _225 = _84 * _147;
    float _227 = _165 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _229 = _161 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _231 = _163 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _233 = -_147;
    float _235 = _80 * _233;
    float _237 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[0].x, _227);
    float _239 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[0].x, _229);
    float _241 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[0].x, _231);
    float4 _666 = float4(_211, _157, _215, float(int(_93)));
    float4 _668 = select(_666, float4(0.0), isnan(_666));
    float3 _243 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _668.xyz, uint(rint(_668.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _668.xyz, uint(rint(_668.w))).xyz;
    float _245 = _243.x;
    float _247 = _243.y;
    float _249 = _243.z;
    float4 _684 = float4(_211, _157, _215, float(int(_101)));
    float4 _686 = select(_684, float4(0.0), isnan(_684));
    float3 _251 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _686.xyz, uint(rint(_686.w))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _686.xyz, uint(rint(_686.w))).xyz;
    float _253 = _251.x;
    float _255 = _251.y;
    float _257 = _251.z;
    float4 _702 = float4(_221, _217, _223, float(int(_93)));
    float4 _704 = select(_702, float4(0.0), isnan(_702));
    float3 _259 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _704.xyz, uint(rint(_704.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _704.xyz, uint(rint(_704.w))).xyz;
    float _261 = _259.x;
    float _263 = _259.y;
    float _265 = _259.z;
    float4 _720 = float4(_221, _217, _223, float(int(_101)));
    float4 _722 = select(_720, float4(0.0), isnan(_720));
    float3 _267 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _722.xyz, uint(rint(_722.w))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _722.xyz, uint(rint(_722.w))).xyz;
    float _269 = _267.x;
    float _271 = _267.y;
    float _273 = _267.z;
    float4 _738 = float4(_225, _217, _235, float(int(_93)));
    float4 _740 = select(_738, float4(0.0), isnan(_738));
    float3 _275 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, _740.xyz, uint(rint(_740.w))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, _740.xyz, uint(rint(_740.w))).xyz;
    float _277 = _275.x;
    float _279 = _275.y;
    float _281 = _275.z;
    float4 _756 = float4(_225, _217, _235, float(int(_101)));
    float4 _758 = select(_756, float4(0.0), isnan(_756));
    float3 _283 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _758.xyz, uint(rint(_758.w))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _758.xyz, uint(rint(_758.w))).xyz;
    float _285 = _283.x;
    float _287 = _283.y;
    float _289 = _283.z;
    float _291 = _179 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _293 = _183 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _295 = _181 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _297 = _199 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _299 = fma(_187, (*spvDescriptorSet0.fp_c3)._m0[0].x, _291);
    float _301 = fma(_191, (*spvDescriptorSet0.fp_c3)._m0[0].x, _293);
    float _303 = _197 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _305 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[0].x, _295);
    float _307 = _195 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _309 = fma(_205, (*spvDescriptorSet0.fp_c3)._m0[0].x, _303);
    float _311 = fma(_203, (*spvDescriptorSet0.fp_c3)._m0[0].x, _307);
    float _313 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[0].x, _297);
    float _315 = _245 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _317 = fma(_253, (*spvDescriptorSet0.fp_c3)._m0[0].x, _315);
    float _319 = _247 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _321 = _249 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _323 = _263 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _325 = _261 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _327 = fma(_255, (*spvDescriptorSet0.fp_c3)._m0[0].x, _319);
    float _329 = fma(_257, (*spvDescriptorSet0.fp_c3)._m0[0].x, _321);
    float _331 = _265 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _333 = fma(_271, (*spvDescriptorSet0.fp_c3)._m0[0].x, _323);
    float _335 = _277 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _337 = _281 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _339 = _279 * (*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _341 = fma(_273, (*spvDescriptorSet0.fp_c3)._m0[0].x, _331);
    float _343 = fma(_269, (*spvDescriptorSet0.fp_c3)._m0[0].x, _325);
    float _345 = fma(_285, (*spvDescriptorSet0.fp_c3)._m0[0].x, _335);
    float _347 = fma(_289, (*spvDescriptorSet0.fp_c3)._m0[0].x, _337);
    float _349 = fma(_287, (*spvDescriptorSet0.fp_c3)._m0[0].x, _339);
    out.m_39.x = _311;
    out.m_39.y = _309;
    out.m_39.z = _313;
    out.m_39.w = 1.0;
    out.m_41.x = _317;
    out.m_41.y = _327;
    out.m_41.z = _329;
    out.m_41.w = 1.0;
    out.m_43.x = _239;
    out.m_43.y = _241;
    out.m_43.z = _237;
    out.m_43.w = 1.0;
    out.m_45.x = _299;
    out.m_45.y = _305;
    out.m_45.z = _301;
    out.m_45.w = 1.0;
    out.m_47.x = _343;
    out.m_47.y = _333;
    out.m_47.z = _341;
    out.m_47.w = 1.0;
    out.m_49.x = _345;
    out.m_49.y = _349;
    out.m_49.z = _347;
    out.m_49.w = 1.0;
    return out;
}

