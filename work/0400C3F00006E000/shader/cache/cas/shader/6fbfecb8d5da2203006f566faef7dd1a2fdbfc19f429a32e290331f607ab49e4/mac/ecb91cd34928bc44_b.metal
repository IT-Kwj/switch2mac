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
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_C [[id(6)]];
    sampler fp_t_tcb_CSmplr [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0), center_no_perspective]];
    float4 m_35 [[user(locn1), center_no_perspective]];
    float4 m_33 [[user(locn2), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    float _47 = in.m_33.x;
    float _49 = in.m_33.y;
    float2 _327 = float2(_47, _49);
    float4 _52 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_327, float2(0.0), isnan(_327))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_327, float2(0.0), isnan(_327))).xyzw;
    float _54 = _52.x;
    float _56 = _52.y;
    float _58 = _52.z;
    float _60 = _52.w;
    float2 _346 = float2(_47, _49);
    float _62 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_346, float2(0.0), isnan(_346))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_346, float2(0.0), isnan(_346))).x;
    float2 _353 = float2(_60, 0.0);
    float2 _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_353, float2(0.0), isnan(_353))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_353, float2(0.0), isnan(_353))).xy;
    float _68 = _66.x;
    float _70 = _66.y;
    float _72 = in.m_35.y;
    float _74 = in.m_35.x;
    float _76 = in.m_35.z;
    float _78 = in.m_37.z;
    float _80 = fma(_56, 2.0, -1.0);
    float _82 = fma(_54, 2.0, -1.0);
    float _84 = fma(_58, 2.0, -1.0);
    float _86 = _72 * _72;
    float _88 = fma(_74, _74, _86);
    float _90 = (*spvDescriptorSet0.fp_c4)._m0[15].y * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _92 = _88 + 1.0;
    float _94 = fma((*spvDescriptorSet0.fp_c4)._m0[15].x, (*spvDescriptorSet0.fp_c4)._m0[15].x, _90);
    float _96 = fma((*spvDescriptorSet0.fp_c4)._m0[15].z, (*spvDescriptorSet0.fp_c4)._m0[15].z, _94);
    float _98 = rsqrt(_92);
    float _100 = fma(_62, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _102 = in.m_37.x;
    float _104 = -_100;
    float _106 = fma(_104, _78, (*spvDescriptorSet0.fp_c4)._m0[6].w);
    float _108 = rsqrt(_96);
    float _110 = _72 * _98;
    float _112 = _74 * _98;
    float _114 = _98 * _76;
    float _116 = _108 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _118 = _108 * (*spvDescriptorSet0.fp_c4)._m0[15].x;
    float _120 = _108 * (*spvDescriptorSet0.fp_c4)._m0[15].z;
    float _122 = fma(_106, -0.5, 0.5);
    float _124 = -_110;
    float _126 = _116 + _124;
    float _128 = -_112;
    float _130 = _118 + _128;
    float _132 = -_114;
    float _134 = _120 + _132;
    float _136 = in.m_37.w;
    float _138 = _126 * _126;
    float _140 = -_126;
    float _142 = _110 * _140;
    float _144 = _80 * _126;
    float _146 = -_100;
    float _148 = fma(_146, _102, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _150 = fma(_130, _130, _138);
    float _152 = -_112;
    float _154 = fma(_152, _130, _142);
    float _156 = in.m_37.y;
    float _158 = -_82;
    float _160 = -_144;
    float _162 = fma(_158, _130, _160);
    float _164 = fma(_134, _134, _150);
    bool _168 = _122 <= 1.0;
    bool _170 = isnan(_122);
    bool _172 = _168 || _170;
    bool _174 = isnan(1.0);
    bool _176 = _172 || _174;
    float _178 = float(_176);
    float _180 = _82 * _118;
    float _182 = -_84;
    float _184 = fma(_182, _134, _162);
    float _186 = -_114;
    float _188 = fma(_186, _134, _154);
    float _190 = -_110;
    float _192 = _80 * _190;
    float _194 = rsqrt(_164);
    float _196 = _122 * _178;
    float _198 = precise::clamp(_196, 0.0, 1.0);
    float _200 = -_116;
    float _202 = -_180;
    float _204 = fma(_80, _200, _202);
    float _206 = -_192;
    float _208 = fma(_82, _112, _206);
    float _210 = _80 * (*spvDescriptorSet0.fp_c4)._m0[15].y;
    float _212 = -_120;
    float _214 = fma(_84, _212, _204);
    float _216 = fma(_84, _114, _208);
    float _218 = abs(_198);
    float _220 = log2(_218);
    float _222 = fma(_82, (*spvDescriptorSet0.fp_c4)._m0[15].x, _210);
    float _224 = precise::min(_216, _214);
    float _226 = fma(_84, (*spvDescriptorSet0.fp_c4)._m0[15].z, _222);
    float _228 = _194 * _184;
    float _230 = precise::clamp(_228, 0.0, 1.0);
    float _232 = -_100;
    float _234 = fma(_232, _136, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _236 = 1.0 / _188;
    float _238 = _230 * _224;
    float _240 = _238 * 2.0;
    float _242 = -_100;
    float _244 = fma(_242, _156, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _246 = _220 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _248 = abs(_230);
    float _250 = log2(_248);
    float _252 = precise::max(_148, _244);
    float _254 = precise::min(_148, _244);
    float _256 = exp2(_246);
    bool _258 = _254 >= 0.0;
    bool _260 = isnan(_254);
    bool _262 = _258 || _260;
    bool _264 = isnan(0.0);
    bool _266 = _262 || _264;
    float _268 = _240 * _236;
    float _270 = precise::clamp(_268, 0.0, 1.0);
    bool _272 = _234 >= _252;
    bool _274 = isnan(_234);
    bool _276 = _272 || _274;
    bool _278 = isnan(_252);
    bool _280 = _276 || _278;
    bool _282 = _280 && _266;
    float _284 = float(_282);
    float _286 = _284 * _256;
    float _288 = _286 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _290 = _68 * _250;
    float _292 = exp2(_290);
    float _294 = _288 * _292;
    float _296 = -_108;
    float _298 = fma(_296, _226, 0.0);
    float _300 = precise::clamp(_298, 0.0, 1.0);
    float _302 = _270 * _294;
    float _304 = _288 * _300;
    float _306 = _70 * _302;
    float _308 = _304 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _310 = _304 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _312 = _304 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _314 = _306 * (*spvDescriptorSet0.fp_c3)._m0[12].x;
    float _316 = _314 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    out.m_40.x = _308;
    out.m_40.y = _310;
    out.m_40.z = _312;
    out.m_40.w = _316;
    return out;
}

