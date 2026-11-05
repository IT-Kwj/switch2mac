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
    float4 m_42 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

struct main0_in
{
    float4 m_34 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_34.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_34.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _242 = float2(_65, _67);
    float4 _70 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_242, float2(0.0), isnan(_242)), int2(0), component::x).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = gl_FragCoord.x;
    float _82 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _84 = _80 / _82;
    float _86 = gl_FragCoord.y;
    float _88 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _90 = _86 / _88;
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _94 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _96 = _67 * _92;
    float _98 = _65 * _94;
    float _100 = trunc(_96);
    int _103 = int(_100);
    float _105 = trunc(_98);
    int _107 = int(_105);
    float _109 = trunc(_84);
    int _111 = int(_109);
    int _113 = _103 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _115 = _113 + _107;
    float _117 = trunc(_90);
    int _119 = int(_117);
    float _121 = precise::max(_72, _74);
    float _123 = precise::max(_76, _78);
    int _125 = _119 << 1;
    float _127 = precise::max(_121, _123);
    int _129 = _111 & 1;
    float _131 = -_78;
    float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _137 = _127 >= 1.0;
    bool _139 = isnan(_127);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = -_127;
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _151 = 2 & _125;
    int _153 = (-3) & _129;
    int _155 = _151 | _153;
    float _157 = 1.0 / _149;
    int _159 = _115 * 4;
    int _161 = _159 + _155;
    int _163 = _161 << 2;
    int _165 = _163 + 9728;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _169 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[1].w, _167);
    float _171 = 1.0 / _133;
    float _173 = _169 * 16777215.0;
    bool _175 = !_145;
    float _177 = _175 ? _173 : 16777215.0;
    float _179 = trunc(_177);
    float _181 = precise::max(_179, 0.0);
    uint _184 = uint(_181);
    bool _186 = _78 != 1.0;
    bool _188 = isnan(_78);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    float _196 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _198 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[1].w, _196);
    int _200 = _194 ? as_type<int>(_198) : 1065353216;
    bool _202 = !_145;
    int _204 = _202 ? as_type<int>(_169) : 1065353216;
    uint _206 = uint(int(uint(_165) >> uint(2)));
    uint _436 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_206)], _184, memory_order_relaxed);
    uint _208 = _436;
    out.gl_FragDepth = as_type<float>(_184);
    out.m_40.x = as_type<float>(_200);
    out.m_40.y = as_type<float>(_200);
    out.m_40.z = as_type<float>(_200);
    out.m_40.w = as_type<float>(_200);
    out.m_42.x = as_type<float>(_204);
    return out;
}


struct main0_out_u
{
    uint4 m_40 [[color(0)]];
    uint4 m_42 [[color(2)]];
    float gl_FragDepth [[depth(any)]];
};

fragment main0_out_u main0_u(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _49 = gl_FragCoord.w;
    float _51 = in.m_34.x;
    float _53 = gl_FragCoord.w;
    float _55 = _51 * _53;
    float _57 = in.m_34.y;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = 1.0 / _49;
    float _65 = _63 * _55;
    float _67 = _63 * _61;
    float2 _242 = float2(_65, _67);
    float4 _70 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_242, float2(0.0), isnan(_242)), int2(0), component::x).xyzw;
    float _72 = _70.x;
    float _74 = _70.y;
    float _76 = _70.z;
    float _78 = _70.w;
    float _80 = gl_FragCoord.x;
    float _82 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _84 = _80 / _82;
    float _86 = gl_FragCoord.y;
    float _88 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
    float _90 = _86 / _88;
    float _92 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].y));
    float _94 = float(as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x));
    float _96 = _67 * _92;
    float _98 = _65 * _94;
    float _100 = trunc(_96);
    int _103 = int(_100);
    float _105 = trunc(_98);
    int _107 = int(_105);
    float _109 = trunc(_84);
    int _111 = int(_109);
    int _113 = _103 * as_type<int>((*spvDescriptorSet0.fp_c3)._m0[40].x);
    int _115 = _113 + _107;
    float _117 = trunc(_90);
    int _119 = int(_117);
    float _121 = precise::max(_72, _74);
    float _123 = precise::max(_76, _78);
    int _125 = _119 << 1;
    float _127 = precise::max(_121, _123);
    int _129 = _111 & 1;
    float _131 = -_78;
    float _133 = fma(_131, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    bool _137 = _127 >= 1.0;
    bool _139 = isnan(_127);
    bool _141 = _137 || _139;
    bool _143 = isnan(1.0);
    bool _145 = _141 || _143;
    float _147 = -_127;
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c3)._m0[0].w, 1.0);
    int _151 = 2 & _125;
    int _153 = (-3) & _129;
    int _155 = _151 | _153;
    float _157 = 1.0 / _149;
    int _159 = _115 * 4;
    int _161 = _159 + _155;
    int _163 = _161 << 2;
    int _165 = _163 + 9728;
    float _167 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _169 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[1].w, _167);
    float _171 = 1.0 / _133;
    float _173 = _169 * 16777215.0;
    bool _175 = !_145;
    float _177 = _175 ? _173 : 16777215.0;
    float _179 = trunc(_177);
    float _181 = precise::max(_179, 0.0);
    uint _184 = uint(_181);
    bool _186 = _78 != 1.0;
    bool _188 = isnan(_78);
    bool _190 = _186 || _188;
    bool _192 = isnan(1.0);
    bool _194 = _190 || _192;
    float _196 = -(*spvDescriptorSet0.fp_c3)._m0[1].w;
    float _198 = fma(_171, (*spvDescriptorSet0.fp_c3)._m0[1].w, _196);
    int _200 = _194 ? as_type<int>(_198) : 1065353216;
    bool _202 = !_145;
    int _204 = _202 ? as_type<int>(_169) : 1065353216;
    uint _206 = uint(int(uint(_165) >> uint(2)));
    uint _436 = atomic_fetch_max_explicit((device atomic_uint*)&(*spvDescriptorSet0.fp_s0)._m0[int(_206)], _184, memory_order_relaxed);
    uint _208 = _436;
    out.gl_FragDepth = as_type<float>(_184);
    out.m_40.x = as_type<float>(_200);
    out.m_40.y = as_type<float>(_200);
    out.m_40.z = as_type<float>(_200);
    out.m_40.w = as_type<float>(_200);
    out.m_42.x = as_type<float>(_204);
    return main0_out_u{as_type<uint4>(out.m_40), as_type<uint4>(out.m_42), out.gl_FragDepth};
}

