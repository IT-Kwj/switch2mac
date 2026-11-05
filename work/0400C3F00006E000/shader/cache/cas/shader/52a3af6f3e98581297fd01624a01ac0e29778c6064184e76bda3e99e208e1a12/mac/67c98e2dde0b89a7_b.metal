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
    constant _16* fp_c4 [[id(1)]];
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
    float4 m_42 [[color(1)]];
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
    float _49 = in.m_33.x;
    float _51 = in.m_33.y;
    float2 _343 = float2(_49, _51);
    float4 _54 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_343, float2(0.0), isnan(_343))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_343, float2(0.0), isnan(_343))).xyzw;
    float _56 = _54.x;
    float _58 = _54.y;
    float _60 = _54.z;
    float _62 = _54.w;
    float2 _362 = float2(_49, _51);
    float _64 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_362, float2(0.0), isnan(_362))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_362, float2(0.0), isnan(_362))).x;
    float2 _369 = float2(_62, 0.0);
    float2 _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_369, float2(0.0), isnan(_369))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_369, float2(0.0), isnan(_369))).xy;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = in.m_35.y;
    float _76 = in.m_35.x;
    float _78 = in.m_35.z;
    float _80 = in.m_37.w;
    float _82 = fma(_64, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[10].x);
    float _84 = fma(_56, 2.0, -1.0);
    float _86 = fma(_60, 2.0, -1.0);
    float _88 = -_82;
    float _90 = -(*spvDescriptorSet0.fp_c4)._m0[14].y;
    float _92 = fma(_88, _74, _90);
    float _94 = _74 * _74;
    float _96 = -_82;
    float _98 = -(*spvDescriptorSet0.fp_c4)._m0[14].x;
    float _100 = fma(_96, _76, _98);
    float _102 = -_82;
    float _104 = -(*spvDescriptorSet0.fp_c4)._m0[14].z;
    float _106 = fma(_102, _78, _104);
    float _108 = _92 * _92;
    float _110 = fma(_76, _76, _94);
    float _112 = fma(_100, _100, _108);
    float _114 = _110 + 1.0;
    float _116 = fma(_106, _106, _112);
    float _118 = rsqrt(_114);
    float _120 = rsqrt(_116);
    float _122 = _74 * _118;
    float _124 = _76 * _118;
    float _126 = _78 * _118;
    float _128 = -_82;
    float _130 = fma(_128, _80, (*spvDescriptorSet0.fp_c4)._m0[7].w);
    float _132 = in.m_37.y;
    float _134 = -_130;
    float _136 = fma(_134, (*spvDescriptorSet0.fp_c4)._m0[16].z, (*spvDescriptorSet0.fp_c4)._m0[16].x);
    float _138 = _92 * _120;
    float _140 = _100 * _120;
    float _142 = _106 * _120;
    float _144 = -_122;
    float _146 = _138 + _144;
    float _148 = -_124;
    float _150 = _140 + _148;
    float _152 = -_126;
    float _154 = _142 + _152;
    bool _158 = _136 <= 1.0;
    bool _160 = isnan(_136);
    bool _162 = _158 || _160;
    bool _164 = isnan(1.0);
    bool _166 = _162 || _164;
    float _168 = float(_166);
    float _170 = _146 * _146;
    float _172 = fma(_150, _150, _170);
    float _174 = _136 * _168;
    float _176 = precise::clamp(_174, 0.0, 1.0);
    float _178 = in.m_37.x;
    float _180 = fma(_154, _154, _172);
    float _182 = fma(_58, 2.0, -1.0);
    float _184 = abs(_176);
    float _186 = log2(_184);
    float _188 = _182 * _146;
    float _190 = _182 * _92;
    float _192 = -_84;
    float _194 = -_188;
    float _196 = fma(_192, _150, _194);
    float _198 = fma(_84, _100, _190);
    float _200 = rsqrt(_180);
    float _202 = -_86;
    float _204 = fma(_202, _154, _196);
    float _206 = fma(_86, _106, _198);
    float _208 = -_120;
    float _210 = fma(_208, _206, 0.0);
    float _212 = precise::clamp(_210, 0.0, 1.0);
    float _214 = _186 * (*spvDescriptorSet0.fp_c4)._m0[12].w;
    float _216 = _200 * _204;
    float _218 = precise::clamp(_216, 0.0, 1.0);
    float _220 = -_146;
    float _222 = _122 * _220;
    float _224 = -_82;
    float _226 = fma(_224, _178, (*spvDescriptorSet0.fp_c4)._m0[4].w);
    float _228 = abs(_218);
    float _230 = log2(_228);
    float _232 = -_124;
    float _234 = fma(_232, _150, _222);
    float _236 = -_82;
    float _238 = fma(_236, _132, (*spvDescriptorSet0.fp_c4)._m0[5].w);
    float _240 = _84 * _140;
    float _242 = -_126;
    float _244 = fma(_242, _154, _234);
    float _246 = -_122;
    float _248 = _182 * _246;
    float _250 = -_138;
    float _252 = -_240;
    float _254 = fma(_182, _250, _252);
    float _256 = exp2(_214);
    float _258 = -_248;
    float _260 = fma(_84, _124, _258);
    float _262 = -_142;
    float _264 = fma(_86, _262, _254);
    float _266 = fma(_86, _126, _260);
    float _268 = 1.0 / _244;
    float _270 = precise::min(_266, _264);
    float _272 = _218 * _270;
    float _274 = _272 * 2.0;
    float _276 = _274 * _268;
    float _278 = precise::clamp(_276, 0.0, 1.0);
    float _280 = _70 * _230;
    float _282 = precise::min(_226, _238);
    float _284 = precise::max(_226, _238);
    bool _286 = _282 >= 0.0;
    bool _288 = isnan(_282);
    bool _290 = _286 || _288;
    bool _292 = isnan(0.0);
    bool _294 = _290 || _292;
    float _296 = exp2(_280);
    bool _298 = _130 >= _284;
    bool _300 = isnan(_130);
    bool _302 = _298 || _300;
    bool _304 = isnan(_284);
    bool _306 = _302 || _304;
    bool _308 = _306 && _294;
    float _310 = float(_308);
    float _312 = _310 * _256;
    float _314 = _312 * _212;
    float _316 = _312 * _296;
    float _318 = _314 * (*spvDescriptorSet0.fp_c4)._m0[12].x;
    float _320 = _314 * (*spvDescriptorSet0.fp_c4)._m0[12].y;
    float _322 = _314 * (*spvDescriptorSet0.fp_c4)._m0[12].z;
    float _324 = _278 * _316;
    float _326 = _72 * _324;
    float _328 = _326 * (*spvDescriptorSet0.fp_c4)._m0[13].x;
    float _330 = _326 * (*spvDescriptorSet0.fp_c4)._m0[13].y;
    float _332 = _326 * (*spvDescriptorSet0.fp_c4)._m0[13].z;
    out.m_40.x = _318;
    out.m_40.y = _320;
    out.m_40.z = _322;
    out.m_42.x = _328;
    out.m_42.y = _330;
    out.m_42.z = _332;
    return out;
}

