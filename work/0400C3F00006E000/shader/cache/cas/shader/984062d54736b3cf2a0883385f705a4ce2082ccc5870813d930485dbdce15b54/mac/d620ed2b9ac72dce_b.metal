#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* cp_c3 [[id(1)]];
    constant _16* cp_c5 [[id(2)]];
    constant _16* cp_c4 [[id(3)]];
    constant _16* cp_c6 [[id(4)]];
    texture2d_array<float> cp_t_tcb_A [[id(5)]];
    sampler cp_t_tcb_ASmplr [[id(6)]];
    texture2d<float> cp_t_tcb_8 [[id(7)]];
    sampler cp_t_tcb_8Smplr [[id(8)]];
    texture2d_array<float> cp_i_tcb_48_ [[id(9)]];
    texture2d_array<float, access::write> cp_i_tcb_4A_ [[id(10)]];
    sampler cp_t_tcb_ASmplr_w [[id(11)]];
    sampler cp_t_tcb_8Smplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

static inline __attribute__((always_inline))
int _53(thread const int& _829, thread const int& _830, constant _10& support_buffer)
{
    int _833 = 1 + _830;
    float _835 = support_buffer._m5[_833].x;
    bool _837 = _835 == 1.0;
    if (_837)
    {
        return _829;
    }
    float _839 = float(_829);
    float _841 = _839 * _835;
    int _843 = int(_841);
    return _843;
}

kernel void main0(constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint3 gl_WorkGroupID [[threadgroup_position_in_grid]], uint3 gl_LocalInvocationID [[thread_position_in_threadgroup]])
{
    float _57 = as_type<float>(gl_WorkGroupID.z);
    float _59 = as_type<float>(gl_WorkGroupID.y);
    float _61 = as_type<float>(gl_LocalInvocationID.y);
    float _63 = as_type<float>(gl_LocalInvocationID.x);
    int _65 = as_type<int>(_57) + as_type<int>((*spvDescriptorSet0.cp_c3)._m0[16].z);
    float _67 = float(as_type<int>(_57));
    int _69 = _65 << 4;
    float _71 = as_type<float>(gl_WorkGroupID.x);
    float _73 = rint(_67);
    float _75 = precise::max(_73, 0.0);
    uint _78 = uint(_75);
    uint _80 = clamp(_78, 0u, 65535u);
    int _82 = _69 + 4;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    uint _86 = uint(int(uint(int(_84)) >> uint(2)));
    int _88 = int(_84) & 3;
    float _90 = (*spvDescriptorSet0.cp_c3)._m0[int(_86)][_88];
    int _92 = as_type<int>(_59) << 2;
    int _94 = _92 + as_type<int>(_61);
    int _96 = as_type<int>(_71) << 3;
    int _98 = _96 + as_type<int>(_63);
    float _100 = 1.0 / _90;
    float _102 = float(_94);
    float _104 = float(_98);
    float _106 = _102 + 0.5;
    float _108 = _104 + 0.5;
    float _110 = _106 * _100;
    float _112 = _108 * _100;
    float3 _462 = float3(_112, _110, float(int(_80)));
    float3 _466 = select(_462, float3(0.0), isnan(_462));
    float2 _116 = dm_bs(spvDescriptorSet0.cp_t_tcb_A.sample(spvDescriptorSet0.cp_t_tcb_ASmplr, _466.xy, uint(rint(_466.z)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.cp_t_tcb_A, spvDescriptorSet0.cp_t_tcb_ASmplr_w, _466.xy, uint(rint(_466.z)), level(0.0)).xw;
    float _118 = _116.x;
    float _120 = _116.y;
    int _122 = _98;
    int _124 = 2;
    int _126 = _53(_122, _124, (*spvDescriptorSet0.support_buffer));
    int _128 = _94;
    int _130 = 2;
    int _132 = _53(_128, _130, (*spvDescriptorSet0.support_buffer));
    int3 _483 = int3(_126, _132, as_type<int>(_57));
    float4 _135 = (spvDescriptorSet0.cp_i_tcb_48_.read(uint2(_483.xy), uint(_483.z)).xyzw);
    float _137 = _135.x;
    float _139 = _135.y;
    float _141 = _135.z;
    float _143 = _135.w;
    int _145 = _69 + 12;
    uint _147 = uint(int(uint(_145) >> uint(2)));
    uint _149 = uint(int(uint(int(_147)) >> uint(2)));
    int _151 = int(_147) & 3;
    float _153 = (*spvDescriptorSet0.cp_c3)._m0[int(_149)][_151];
    float _155 = _112 + (-0.5);
    float _157 = _90 * _153;
    float _159 = _110 + (-0.5);
    float _161 = fma(_157, _155, (*spvDescriptorSet0.cp_c3)._m0[16].x);
    float _163 = fma(_157, _159, (*spvDescriptorSet0.cp_c3)._m0[16].y);
    float _165 = -(*spvDescriptorSet0.cp_c4)._m0[0].x;
    float _167 = _161 + _165;
    float _169 = -(*spvDescriptorSet0.cp_c4)._m0[0].y;
    float _171 = _163 + _169;
    float _173 = fma(_167, (*spvDescriptorSet0.cp_c4)._m0[1].w, 0.5);
    float _175 = fma(_171, (*spvDescriptorSet0.cp_c4)._m0[1].w, 0.5);
    bool _179 = _173 >= 1.0;
    bool _181 = isnan(_173);
    bool _183 = _179 || _181;
    bool _185 = isnan(1.0);
    bool _187 = _183 || _185;
    bool _189 = _175 < 1.0;
    bool _191 = !_187;
    bool _193 = _189 && _191;
    bool _195 = _173 > 0.0;
    bool _197 = _195 && _193;
    bool _199 = _175 > 0.0;
    bool _201 = _199 && _197;
    float _203 = _171;
    float _205 = _157;
    float _207 = _167;
    float _209 = as_type<float>(_69);
    if (!_201)
    {
        _203 = 0.0;
    }
    float _211 = _203;
    float _213 = _211;
    if (!_201)
    {
        _205 = 0.0;
        _207 = 0.0;
    }
    float _215 = _205;
    float _217 = _207;
    float _219 = _215;
    float _221 = _217;
    if (!_201)
    {
        _209 = 0.0;
    }
    float _223 = _209;
    bool _225 = !_201;
    float _227 = _223;
    if (!_225)
    {
        float _229 = _173 + (*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _231 = _175 + (*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _233 = -(*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _235 = _173 + _233;
        float _237 = -(*spvDescriptorSet0.cp_c4)._m0[1].z;
        float _239 = _175 + _237;
        float2 _632 = float2(_173, _175);
        float _241 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_632, float2(0.0), isnan(_632)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_632, float2(0.0), isnan(_632)), level(0.0)).x;
        float2 _642 = float2(_229, _175);
        float _243 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_642, float2(0.0), isnan(_642)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_642, float2(0.0), isnan(_642)), level(0.0)).x;
        float2 _650 = float2(_235, _175);
        float _245 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_650, float2(0.0), isnan(_650)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_650, float2(0.0), isnan(_650)), level(0.0)).x;
        float2 _658 = float2(_173, _231);
        float _247 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_658, float2(0.0), isnan(_658)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_658, float2(0.0), isnan(_658)), level(0.0)).x;
        float2 _666 = float2(_173, _239);
        float _249 = dm_bs(spvDescriptorSet0.cp_t_tcb_8.sample(spvDescriptorSet0.cp_t_tcb_8Smplr, select(_666, float2(0.0), isnan(_666)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.cp_t_tcb_8, spvDescriptorSet0.cp_t_tcb_8Smplr_w, select(_666, float2(0.0), isnan(_666)), level(0.0)).x;
        float _251 = _118 * 200.0;
        float _253 = (*spvDescriptorSet0.cp_c4)._m0[1].y * 2.0;
        float _255 = 1.0 / _253;
        float _257 = _251 * _255;
        float _259 = precise::clamp(_257, 0.0, 1.0);
        float _261 = fma(_259, 0.949999988079071044921875, 0.050000011920928955078125);
        float _263 = precise::max(0.0, _241);
        float _265 = _261 * _241;
        float _267 = -_245;
        float _269 = _243 + _267;
        float _271 = -_249;
        float _273 = _247 + _271;
        float _275 = _263 * (*spvDescriptorSet0.cp_c6)._m0[0].x;
        float _277 = _269 * 1.57079637050628662109375;
        float _279 = _273 * 1.57079637050628662109375;
        _213 = _277;
        _219 = _265;
        _227 = _279;
        _221 = _275;
    }
    float _281 = _213;
    float _283 = _219;
    float _285 = _227;
    float _287 = _221;
    float _289 = -_120;
    float _291 = _289 + 1.0;
    int _293 = as_type<int>((*spvDescriptorSet0.cp_c5)._m0[0].w) + (-1);
    float _295 = _291 * _281;
    float _297 = _291 * _283;
    float _299 = _291 * _285;
    bool _301 = as_type<int>(_57) != _293;
    float _303 = _283;
    float _305 = _281;
    float _307 = _299;
    float _309 = _287;
    if (_301)
    {
        _303 = _295;
    }
    float _311 = _303;
    float _313 = _311;
    if (_301)
    {
        _305 = _297;
    }
    float _315 = _305;
    float _317 = _315;
    if (!_301)
    {
        float _319 = -_112;
        float _321 = _319 + 1.0;
        float _323 = -_110;
        float _325 = _323 + 1.0;
        float _327 = precise::min(_112, _321);
        float _329 = precise::min(_110, _325);
        float _331 = precise::min(_327, _329);
        float _333 = _331 * 10.0;
        float _335 = precise::clamp(_333, 0.0, 1.0);
        float _337 = _295 * _335;
        float _339 = _297 * _335;
        float _341 = _299 * _335;
        float _343 = _335 * _287;
        _313 = _337;
        _317 = _339;
        _307 = _341;
        _309 = _343;
    }
    float _345 = _313;
    float _347 = _317;
    float _349 = _307;
    float _351 = _309;
    float _353 = _137 + _345;
    float _355 = _139 + _347;
    float _357 = _141 + _349;
    float _359 = _143 + _351;
    int3 _823 = int3(_98, _94, as_type<int>(_57));
    spvDescriptorSet0.cp_i_tcb_4A_.write(float4(_353, _355, _357, _359), uint2(_823.xy), uint(_823.z));
}

