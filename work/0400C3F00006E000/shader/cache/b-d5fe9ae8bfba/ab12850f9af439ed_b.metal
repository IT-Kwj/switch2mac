#pragma clang diagnostic ignored "-Wunused-variable"

#include <metal_stdlib>
#include <simd/simd.h>
#include <metal_atomic>

using namespace metal;

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

struct _21
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    device _21* fp_s0 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
};

struct main0_out
{
    float4 m_40 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_34.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_34.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _256 = float2(_63, _65);
    float4 _68 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_256, float2(0.0), isnan(_256)), int2(0), component::x).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float _78 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _80 = gl_FragCoord.x;
    float _82 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _84 = _80 / _82;
    float _86 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _88 = _65 * _78;
    float _90 = gl_FragCoord.y;
    float _92 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _94 = _90 / _92;
    float _96 = _63 * _86;
    float _98 = trunc(_88);
    int _101 = int(_98);
    float _103 = trunc(_96);
    int _105 = int(_103);
    float _107 = trunc(_84);
    int _109 = int(_107);
    int _111 = _101 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _113 = _111 + _105;
    float _115 = trunc(_94);
    int _117 = int(_115);
    int _119 = _109 & 1;
    float _121 = precise::min(_70, _72);
    float _123 = precise::max(_70, _72);
    float _125 = precise::min(_74, _76);
    float _127 = precise::max(_74, _76);
    float _129 = precise::min(_121, _125);
    float _131 = precise::max(_123, _127);
    int _133 = _117 << 1;
    float _135 = -_129;
    float _137 = fma(_135, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _141 = _129 >= 1.0;
    bool _143 = isnan(_129);
    bool _145 = _141 || _143;
    bool _147 = isnan(1.0);
    bool _149 = _145 || _147;
    float _151 = -_131;
    float _153 = fma(_151, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _155 = 2 & _133;
    int _157 = (-3) & _119;
    int _159 = _155 | _157;
    float _161 = 1.0 / _137;
    int _163 = _113 * 4;
    int _165 = _163 + _159;
    int _167 = _165 * 4;
    float _169 = 1.0 / _153;
    int _171 = _167 + 9728;
    float _173 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _175 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[1].w, _173);
    float _177 = _175 * 16777215.0;
    float _179 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _181 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[1].w, _179);
    bool _183 = !_149;
    float _185 = _183 ? _177 : 16777215.0;
    bool _187 = _131 >= 1.0;
    bool _189 = isnan(_131);
    bool _191 = _187 || _189;
    bool _193 = isnan(1.0);
    bool _195 = _191 || _193;
    float _197 = _181 * 16777215.0;
    float _199 = trunc(_185);
    float _201 = precise::max(_199, 0.0);
    uint _204 = uint(_201);
    bool _206 = !_195;
    float _208 = _206 ? _197 : 16777215.0;
    float _210 = trunc(_208);
    float _212 = precise::max(_210, 0.0);
    uint _214 = uint(_212);
    uint _216 = uint(int(uint(_167) >> uint(2)));
    uint _461 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_216)], _204, memory_order_relaxed);
    uint _218 = _461;
    uint _220 = uint(int(uint(_171) >> uint(2)));
    uint _469 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_220)], _214, memory_order_relaxed);
    uint _222 = _469;
    out.gl_FragDepth = _76;
    out.m_40.x = _76;
    out.m_40.y = _76;
    out.m_40.z = _76;
    out.m_40.w = _76;
    return out;
}

