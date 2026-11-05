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
    float2 _236 = float2(_63, _65);
    float4 _68 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_236, float2(0.0), isnan(_236)), int2(0), component::x).xyzw;
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
    float _90 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _94 = _65 * _90;
    float _96 = _63 * _92;
    float _98 = trunc(_94);
    int _101 = int(_98);
    float _103 = trunc(_96);
    int _105 = int(_103);
    float _107 = trunc(_82);
    int _109 = int(_107);
    int _111 = _101 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _113 = _111 + _105;
    float _115 = trunc(_88);
    int _117 = int(_115);
    int _119 = _117 << 1;
    float _121 = precise::max(_70, _72);
    float _123 = precise::max(_74, _76);
    int _125 = _109 & 1;
    float _127 = precise::max(_121, _123);
    int _129 = 2 & _119;
    int _131 = (-3) & _125;
    int _133 = _129 | _131;
    bool _137 = _127 >= 1.0;
    bool _139 = isnan(_127);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = -_127;
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _151 = _113 * 4;
    int _153 = _151 + _133;
    float _155 = 1.0 / _149;
    float _157 = -_76;
    float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _161 = _153 << 2;
    int _163 = _161 + 9728;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _167 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[1].w, _165);
    float _169 = 1.0 / _159;
    float _171 = _167 * 16777215.0;
    bool _173 = !_145;
    float _175 = _173 ? _171 : 16777215.0;
    float _177 = trunc(_175);
    float _179 = precise::max(_177, 0.0);
    uint _182 = uint(_179);
    bool _184 = _76 != 1.0;
    bool _186 = isnan(_76);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _196 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[1].w, _194);
    int _198 = _192 ? as_type<int>(_196) : 1065353216;
    uint _200 = uint(int(uint(_163) >> uint(2)));
    uint _424 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_200)], _182, memory_order_relaxed);
    uint _202 = _424;
    out.gl_FragDepth = _76;
    out.m_40.x = as_type<float>(_198);
    out.m_40.y = as_type<float>(_198);
    out.m_40.z = as_type<float>(_198);
    out.m_40.w = as_type<float>(_198);
    return out;
}


struct main0_out_u
{
    uint4 m_40 [[color(0)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
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
    float2 _236 = float2(_63, _65);
    float4 _68 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_236, float2(0.0), isnan(_236)), int2(0), component::x).xyzw;
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
    float _90 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _94 = _65 * _90;
    float _96 = _63 * _92;
    float _98 = trunc(_94);
    int _101 = int(_98);
    float _103 = trunc(_96);
    int _105 = int(_103);
    float _107 = trunc(_82);
    int _109 = int(_107);
    int _111 = _101 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _113 = _111 + _105;
    float _115 = trunc(_88);
    int _117 = int(_115);
    int _119 = _117 << 1;
    float _121 = precise::max(_70, _72);
    float _123 = precise::max(_74, _76);
    int _125 = _109 & 1;
    float _127 = precise::max(_121, _123);
    int _129 = 2 & _119;
    int _131 = (-3) & _125;
    int _133 = _129 | _131;
    bool _137 = _127 >= 1.0;
    bool _139 = isnan(_127);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = -_127;
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _151 = _113 * 4;
    int _153 = _151 + _133;
    float _155 = 1.0 / _149;
    float _157 = -_76;
    float _159 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _161 = _153 << 2;
    int _163 = _161 + 9728;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _167 = fma(_155, (*spvDescriptorSet0.fp_c3)._m0[1].w, _165);
    float _169 = 1.0 / _159;
    float _171 = _167 * 16777215.0;
    bool _173 = !_145;
    float _175 = _173 ? _171 : 16777215.0;
    float _177 = trunc(_175);
    float _179 = precise::max(_177, 0.0);
    uint _182 = uint(_179);
    bool _184 = _76 != 1.0;
    bool _186 = isnan(_76);
    bool _188 = _184 || _186;
    bool _190 = isnan(1.0);
    bool _192 = _188 || _190;
    float _194 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _196 = fma(_169, (*spvDescriptorSet0.fp_c3)._m0[1].w, _194);
    int _198 = _192 ? as_type<int>(_196) : 1065353216;
    uint _200 = uint(int(uint(_163) >> uint(2)));
    uint _424 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_200)], _182, memory_order_relaxed);
    uint _202 = _424;
    out.gl_FragDepth = _76;
    out.m_40.x = as_type<float>(_198);
    out.m_40.y = as_type<float>(_198);
    out.m_40.z = as_type<float>(_198);
    out.m_40.w = as_type<float>(_198);
    return main0_out_u{as_type<uint4>(out.m_40), out.gl_FragDepth};
}

