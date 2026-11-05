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
    float2 _198 = float2(_63, _65);
    float4 _68 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_198, float2(0.0), isnan(_198)), int2(0), component::x).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float _78 = gl_FragCoord.x;
    float _80 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _82 = _78 / _80;
    float _84 = gl_FragCoord.y;
    float _86 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _88 = _84 / _86;
    float _90 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _94 = _63 * _90;
    float _96 = _65 * _92;
    float _98 = trunc(_94);
    int _101 = int(_98);
    float _103 = trunc(_96);
    int _105 = int(_103);
    float _107 = trunc(_82);
    int _109 = int(_107);
    int _111 = _105 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _113 = _111 + _101;
    float _115 = trunc(_88);
    int _117 = int(_115);
    float _119 = precise::min(_70, _72);
    float _121 = precise::min(_74, _76);
    int _123 = _109 & 1;
    int _125 = _117 << 1;
    float _127 = precise::min(_119, _121);
    float _129 = -_76;
    float _131 = _129 + 1.0;
    int _133 = 2 & _125;
    int _135 = (-3) & _123;
    int _137 = _133 | _135;
    float _139 = _76 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _141 = _127 * 16777215.0;
    int _143 = _113 << 2;
    int _145 = _143 + _137;
    float _147 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[0].x, _139);
    int _149 = _145 << 2;
    float _151 = trunc(_141);
    float _153 = precise::max(_151, 0.0);
    uint _156 = uint(_153);
    float _158 = 1.0 / _147;
    uint _160 = uint(int(uint(_149) >> uint(2)));
    uint _334 = atomic_fetch_min_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_160)], _156, memory_order_relaxed);
    uint _162 = _334;
    float _164 = _139 * _158;
    out.gl_FragDepth = _164;
    out.m_40.x = _76;
    out.m_40.y = _76;
    out.m_40.z = _76;
    out.m_40.w = _76;
    return out;
}

