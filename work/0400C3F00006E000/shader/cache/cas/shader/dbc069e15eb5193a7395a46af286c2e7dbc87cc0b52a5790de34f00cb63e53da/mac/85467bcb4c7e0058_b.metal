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
    float2 _214 = float2(_63, _65);
    float4 _68 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_214, float2(0.0), isnan(_214)), int2(0), component::x).xyzw;
    float _70 = _68.x;
    float _72 = _68.y;
    float _74 = _68.z;
    float _76 = _68.w;
    float _78 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _80 = gl_FragCoord.y;
    float _82 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _84 = _80 / _82;
    float _86 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _88 = gl_FragCoord.x;
    float _90 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _92 = _88 / _90;
    float _94 = _63 * _78;
    float _96 = _65 * _86;
    float _98 = trunc(_94);
    int _101 = int(_98);
    float _103 = trunc(_96);
    int _105 = int(_103);
    float _107 = trunc(_84);
    int _109 = int(_107);
    int _111 = _105 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _113 = _111 + _101;
    float _115 = trunc(_92);
    int _117 = int(_115);
    int _119 = _109 * 2;
    int _121 = _117 & 1;
    int _123 = 2 & _119;
    int _125 = (-3) & _121;
    int _127 = _123 | _125;
    int _129 = _113 << 2;
    int _131 = _129 + _127;
    int _133 = _131 << 2;
    int _135 = _133 + 9728;
    float _137 = precise::max(_70, _72);
    float _139 = precise::max(_74, _76);
    float _141 = precise::max(_137, _139);
    bool _145 = _141 >= 1.0;
    bool _147 = isnan(_141);
    bool _149 = _145 || _147;
    bool _151 = isnan(1.0);
    bool _153 = _149 || _151;
    float _155 = -_141;
    float _157 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    float _159 = 1.0 / _157;
    float _161 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _163 = fma(_159, (*spvDescriptorSet0.fp_c3)._m0[1].w, _161);
    float _165 = _163 * 16777215.0;
    bool _167 = !_153;
    float _169 = _167 ? _165 : 16777215.0;
    float _171 = trunc(_169);
    float _173 = precise::max(_171, 0.0);
    uint _176 = uint(_173);
    uint _178 = uint(int(uint(_135) >> uint(2)));
    uint _369 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_178)], _176, memory_order_relaxed);
    uint _180 = _369;
    out.gl_FragDepth = _76;
    out.m_40.x = _76;
    out.m_40.y = _76;
    out.m_40.z = _76;
    out.m_40.w = _76;
    return out;
}

