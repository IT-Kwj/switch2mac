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
    constant _16* cp_c4 [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    texture2d<float> cp_t_tcb_8 [[id(2)]];
    sampler cp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> cp_t_tcb_A [[id(4)]];
    sampler cp_t_tcb_ASmplr [[id(5)]];
    texture2d<float, access::write> cp_i_tcb_48_ [[id(6)]];
    sampler cp_t_tcb_8Smplr_w [[id(7)]];
    sampler cp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _45 = as_type<float>(gl_WorkGroupID.x);
    float _47 = as_type<float>(gl_LocalInvocationID.x);
    float _49 = as_type<float>(gl_WorkGroupID.y);
    float _51 = as_type<float>(gl_LocalInvocationID.y);
    int _54 = as_type<int>(_45) << 3;
    int _56 = _54 + as_type<int>(_47);
    bool _60 = uint(_56) >= as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x);
    int _62 = as_type<int>(_49) << 3;
    int _64 = _62 + as_type<int>(_51);
    bool _66 = uint(_64) < as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y);
    bool _68 = !_60;
    bool _70 = _66 && _68;
    if (!_70)
    {
        return;
    }
    float _72 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].x));
    float _74 = float(as_type<uint>((*spvDescriptorSet0.cp_c4)._m0[0].y));
    float _76 = 1.0 / _72;
    float _78 = float(uint(_56));
    float _80 = float(uint(_64));
    float _82 = _78 + 0.5;
    float _84 = 1.0 / _74;
    float _86 = _80 + 0.5;
    float _88 = _82 * _76;
    float _90 = _86 * _84;
    float2 _390 = float2(_88, _90);
    float _92 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_390, float2(0.0), isnan(_390)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_390, float2(0.0), isnan(_390)), level(0.0)).x;
    float2 _401 = float2(_88, _90);
    float _94 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, select(_401, float2(0.0), isnan(_401)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, select(_401, float2(0.0), isnan(_401)), level(0.0)).w;
    float _96 = -_90;
    float _98 = _96 + 1.0;
    float _100 = _98 + (*spvDescriptorSet0.cp_c3)._m0[3].w;
    float _102 = _88 + (*spvDescriptorSet0.cp_c3)._m0[3].z;
    float _104 = fma(_100, 2.0, -1.0);
    float _106 = fma(_102, 2.0, -1.0);
    float _108 = _104 * (*spvDescriptorSet0.cp_c3)._m0[3].y;
    float _110 = _106 * (*spvDescriptorSet0.cp_c3)._m0[3].x;
    float _112 = fma(_90, 2.0, -1.0);
    float _114 = fma(_88, 2.0, -1.0);
    float _116 = -(*spvDescriptorSet0.cp_c3)._m0[10].y;
    float _118 = _112 + _116;
    float _120 = -(*spvDescriptorSet0.cp_c3)._m0[10].x;
    float _122 = _114 + _120;
    float _124 = _118 * _118;
    float _126 = fma(_122, _122, _124);
    float _128 = sqrt(_126);
    float _130 = -(*spvDescriptorSet0.cp_c3)._m0[10].z;
    float _132 = _128 + _130;
    float _134 = -_92;
    float _136 = fma(_134, (*spvDescriptorSet0.cp_c3)._m0[5].w, 1.0);
    float _138 = 1.0 / _136;
    float _140 = -(*spvDescriptorSet0.cp_c3)._m0[5].x;
    float _142 = _138 * _140;
    float _144 = _142 * _108;
    float _146 = _142 * _110;
    float _148 = -(*spvDescriptorSet0.cp_c3)._m0[1].y;
    float _150 = _144 * _148;
    float _152 = -(*spvDescriptorSet0.cp_c3)._m0[0].y;
    float _154 = _144 * _152;
    float _156 = -_146;
    float _158 = fma(_156, (*spvDescriptorSet0.cp_c3)._m0[1].x, _150);
    float _160 = -(*spvDescriptorSet0.cp_c3)._m0[2].y;
    float _162 = _144 * _160;
    float _164 = -_146;
    float _166 = fma(_164, (*spvDescriptorSet0.cp_c3)._m0[0].x, _154);
    float _168 = fma(_142, (*spvDescriptorSet0.cp_c3)._m0[1].z, _158);
    float _170 = -_146;
    float _172 = fma(_170, (*spvDescriptorSet0.cp_c3)._m0[2].x, _162);
    float _174 = fma(_142, (*spvDescriptorSet0.cp_c3)._m0[0].z, _166);
    float _176 = _168 + (*spvDescriptorSet0.cp_c3)._m0[1].w;
    float _178 = fma(_142, (*spvDescriptorSet0.cp_c3)._m0[2].z, _172);
    float _180 = _174 + (*spvDescriptorSet0.cp_c3)._m0[0].w;
    float _182 = -(*spvDescriptorSet0.cp_c3)._m0[4].y;
    float _184 = _176 + _182;
    float _186 = _178 + (*spvDescriptorSet0.cp_c3)._m0[2].w;
    float _188 = -(*spvDescriptorSet0.cp_c3)._m0[4].x;
    float _190 = _180 + _188;
    float _192 = _184 * _184;
    float _194 = -(*spvDescriptorSet0.cp_c3)._m0[4].z;
    float _196 = _186 + _194;
    float _198 = abs(_180);
    float _200 = abs(_186);
    float _202 = precise::max(_198, _200);
    float _204 = fma(_190, _190, _192);
    float _206 = fma(_196, _196, _204);
    float _208 = fma(_202, 0.0040000001899898052215576171875, -31.0000019073486328125);
    float _210 = precise::clamp(_208, 0.0, 1.0);
    float _212 = sqrt(_206);
    float _214 = -_210;
    float _216 = _214 + 1.0;
    float _218 = -(*spvDescriptorSet0.cp_c3)._m0[8].x;
    float _220 = fma(_212, (*spvDescriptorSet0.cp_c3)._m0[8].y, _218);
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _226 = _212 + _224;
    float _228 = -_222;
    float _230 = _228 + 1.0;
    float _232 = abs(_230);
    float _234 = log2(_232);
    float _236 = -(*spvDescriptorSet0.cp_c3)._m0[6].x;
    float _238 = (*spvDescriptorSet0.cp_c3)._m0[6].y + _236;
    float _240 = 1.0 / _238;
    float _242 = _234 * (*spvDescriptorSet0.cp_c3)._m0[8].z;
    float _244 = exp2(_242);
    float _246 = _226 * _240;
    float _248 = precise::clamp(_246, 0.0, 1.0);
    float _250 = precise::min(_216, _248);
    float _252 = _250 * (*spvDescriptorSet0.cp_c3)._m0[7].x;
    float _254 = -_244;
    float _256 = _254 + 1.0;
    float _258 = trunc(_252);
    float _260 = precise::max(_258, 0.0);
    uint _263 = uint(_260);
    float _265 = -_256;
    float _267 = fma(_265, (*spvDescriptorSet0.cp_c3)._m0[8].w, 1.0);
    float _269 = _267 * _94;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = -_271;
    float _275 = _273 + 1.0;
    float _277 = precise::min(_216, _275);
    float _279 = _132 * 4.0;
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = _277 * (*spvDescriptorSet0.cp_c3)._m0[7].y;
    float _285 = _281 * 16.0;
    float _287 = trunc(_283);
    float _289 = precise::max(_287, 0.0);
    uint _291 = uint(_289);
    float _293 = trunc(_285);
    float _295 = precise::max(_293, 0.0);
    uint _297 = uint(_295);
    uint _299 = max(_263, _291);
    uint _301 = max(_297, _299);
    uint _303 = min(_301, 15u);
    spvDescriptorSet0.cp_i_tcb_48_.write(float4(as_type<float>(_303), 0.0, 0.0, 0.0), uint2(int2(_56, _64)));
}

